import type { Store } from "../hooks/useStores.ts";
import useStores from "../hooks/useStores.ts";
import CustomList from "./resusableComponents/CustomList";

interface Props {
  onSelectStore: (store: Store | null) => void;
  selectedStore: Store | null;
}

const StoreList = ({ onSelectStore, selectedStore }: Props) => {
  return (
    <CustomList
      onSelectItem={onSelectStore}
      selectedItem={selectedStore}
      title="Stores"
      useDataHook={useStores}
    />
  );
};

export default StoreList;