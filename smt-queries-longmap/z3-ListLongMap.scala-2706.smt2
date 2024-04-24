; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40040 () Bool)

(assert start!40040)

(declare-fun b_free!10321 () Bool)

(declare-fun b_next!10321 () Bool)

(assert (=> start!40040 (= b_free!10321 (not b_next!10321))))

(declare-fun tp!36491 () Bool)

(declare-fun b_and!18303 () Bool)

(assert (=> start!40040 (= tp!36491 b_and!18303)))

(declare-fun b!437011 () Bool)

(declare-fun res!257760 () Bool)

(declare-fun e!257980 () Bool)

(assert (=> b!437011 (=> (not res!257760) (not e!257980))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26772 0))(
  ( (array!26773 (arr!12835 (Array (_ BitVec 32) (_ BitVec 64))) (size!13187 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26772)

(assert (=> b!437011 (= res!257760 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13187 _keys!709))))))

(declare-fun b!437012 () Bool)

(declare-fun res!257757 () Bool)

(assert (=> b!437012 (=> (not res!257757) (not e!257980))))

(assert (=> b!437012 (= res!257757 (or (= (select (arr!12835 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12835 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18831 () Bool)

(declare-fun mapRes!18831 () Bool)

(declare-fun tp!36492 () Bool)

(declare-fun e!257981 () Bool)

(assert (=> mapNonEmpty!18831 (= mapRes!18831 (and tp!36492 e!257981))))

(declare-datatypes ((V!16403 0))(
  ( (V!16404 (val!5781 Int)) )
))
(declare-datatypes ((ValueCell!5393 0))(
  ( (ValueCellFull!5393 (v!8029 V!16403)) (EmptyCell!5393) )
))
(declare-fun mapValue!18831 () ValueCell!5393)

(declare-datatypes ((array!26774 0))(
  ( (array!26775 (arr!12836 (Array (_ BitVec 32) ValueCell!5393)) (size!13188 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26774)

(declare-fun mapKey!18831 () (_ BitVec 32))

(declare-fun mapRest!18831 () (Array (_ BitVec 32) ValueCell!5393))

(assert (=> mapNonEmpty!18831 (= (arr!12836 _values!549) (store mapRest!18831 mapKey!18831 mapValue!18831))))

(declare-fun b!437013 () Bool)

(declare-fun e!257984 () Bool)

(declare-fun e!257983 () Bool)

(assert (=> b!437013 (= e!257984 (and e!257983 mapRes!18831))))

(declare-fun condMapEmpty!18831 () Bool)

(declare-fun mapDefault!18831 () ValueCell!5393)

(assert (=> b!437013 (= condMapEmpty!18831 (= (arr!12836 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5393)) mapDefault!18831)))))

(declare-fun b!437014 () Bool)

(declare-fun res!257751 () Bool)

(assert (=> b!437014 (=> (not res!257751) (not e!257980))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437014 (= res!257751 (validKeyInArray!0 k0!794))))

(declare-fun b!437015 () Bool)

(declare-fun tp_is_empty!11473 () Bool)

(assert (=> b!437015 (= e!257981 tp_is_empty!11473)))

(declare-fun b!437016 () Bool)

(declare-fun e!257982 () Bool)

(assert (=> b!437016 (= e!257980 e!257982)))

(declare-fun res!257754 () Bool)

(assert (=> b!437016 (=> (not res!257754) (not e!257982))))

(declare-fun lt!201547 () array!26772)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26772 (_ BitVec 32)) Bool)

(assert (=> b!437016 (= res!257754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201547 mask!1025))))

(assert (=> b!437016 (= lt!201547 (array!26773 (store (arr!12835 _keys!709) i!563 k0!794) (size!13187 _keys!709)))))

(declare-fun b!437017 () Bool)

(declare-fun res!257753 () Bool)

(assert (=> b!437017 (=> (not res!257753) (not e!257980))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!437017 (= res!257753 (and (= (size!13188 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13187 _keys!709) (size!13188 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437018 () Bool)

(declare-fun e!257986 () Bool)

(assert (=> b!437018 (= e!257982 e!257986)))

(declare-fun res!257758 () Bool)

(assert (=> b!437018 (=> (not res!257758) (not e!257986))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!437018 (= res!257758 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16403)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16403)

(declare-fun lt!201546 () array!26774)

(declare-datatypes ((tuple2!7568 0))(
  ( (tuple2!7569 (_1!3795 (_ BitVec 64)) (_2!3795 V!16403)) )
))
(declare-datatypes ((List!7556 0))(
  ( (Nil!7553) (Cons!7552 (h!8408 tuple2!7568) (t!13304 List!7556)) )
))
(declare-datatypes ((ListLongMap!6483 0))(
  ( (ListLongMap!6484 (toList!3257 List!7556)) )
))
(declare-fun lt!201545 () ListLongMap!6483)

(declare-fun getCurrentListMapNoExtraKeys!1490 (array!26772 array!26774 (_ BitVec 32) (_ BitVec 32) V!16403 V!16403 (_ BitVec 32) Int) ListLongMap!6483)

(assert (=> b!437018 (= lt!201545 (getCurrentListMapNoExtraKeys!1490 lt!201547 lt!201546 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16403)

(assert (=> b!437018 (= lt!201546 (array!26775 (store (arr!12836 _values!549) i!563 (ValueCellFull!5393 v!412)) (size!13188 _values!549)))))

(declare-fun lt!201548 () ListLongMap!6483)

(assert (=> b!437018 (= lt!201548 (getCurrentListMapNoExtraKeys!1490 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18831 () Bool)

(assert (=> mapIsEmpty!18831 mapRes!18831))

(declare-fun res!257748 () Bool)

(assert (=> start!40040 (=> (not res!257748) (not e!257980))))

(assert (=> start!40040 (= res!257748 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13187 _keys!709))))))

(assert (=> start!40040 e!257980))

(assert (=> start!40040 tp_is_empty!11473))

(assert (=> start!40040 tp!36491))

(assert (=> start!40040 true))

(declare-fun array_inv!9388 (array!26774) Bool)

(assert (=> start!40040 (and (array_inv!9388 _values!549) e!257984)))

(declare-fun array_inv!9389 (array!26772) Bool)

(assert (=> start!40040 (array_inv!9389 _keys!709)))

(declare-fun b!437019 () Bool)

(declare-fun res!257750 () Bool)

(assert (=> b!437019 (=> (not res!257750) (not e!257980))))

(assert (=> b!437019 (= res!257750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437020 () Bool)

(declare-fun res!257759 () Bool)

(assert (=> b!437020 (=> (not res!257759) (not e!257982))))

(declare-datatypes ((List!7557 0))(
  ( (Nil!7554) (Cons!7553 (h!8409 (_ BitVec 64)) (t!13305 List!7557)) )
))
(declare-fun arrayNoDuplicates!0 (array!26772 (_ BitVec 32) List!7557) Bool)

(assert (=> b!437020 (= res!257759 (arrayNoDuplicates!0 lt!201547 #b00000000000000000000000000000000 Nil!7554))))

(declare-fun b!437021 () Bool)

(declare-fun res!257755 () Bool)

(assert (=> b!437021 (=> (not res!257755) (not e!257982))))

(assert (=> b!437021 (= res!257755 (bvsle from!863 i!563))))

(declare-fun b!437022 () Bool)

(declare-fun res!257749 () Bool)

(assert (=> b!437022 (=> (not res!257749) (not e!257980))))

(declare-fun arrayContainsKey!0 (array!26772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437022 (= res!257749 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437023 () Bool)

(declare-fun res!257752 () Bool)

(assert (=> b!437023 (=> (not res!257752) (not e!257980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437023 (= res!257752 (validMask!0 mask!1025))))

(declare-fun b!437024 () Bool)

(declare-fun res!257756 () Bool)

(assert (=> b!437024 (=> (not res!257756) (not e!257980))))

(assert (=> b!437024 (= res!257756 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7554))))

(declare-fun b!437025 () Bool)

(assert (=> b!437025 (= e!257983 tp_is_empty!11473)))

(declare-fun b!437026 () Bool)

(assert (=> b!437026 (= e!257986 (not true))))

(declare-fun +!1457 (ListLongMap!6483 tuple2!7568) ListLongMap!6483)

(assert (=> b!437026 (= (getCurrentListMapNoExtraKeys!1490 lt!201547 lt!201546 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1457 (getCurrentListMapNoExtraKeys!1490 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7569 k0!794 v!412)))))

(declare-datatypes ((Unit!12989 0))(
  ( (Unit!12990) )
))
(declare-fun lt!201549 () Unit!12989)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!617 (array!26772 array!26774 (_ BitVec 32) (_ BitVec 32) V!16403 V!16403 (_ BitVec 32) (_ BitVec 64) V!16403 (_ BitVec 32) Int) Unit!12989)

(assert (=> b!437026 (= lt!201549 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!617 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40040 res!257748) b!437023))

(assert (= (and b!437023 res!257752) b!437017))

(assert (= (and b!437017 res!257753) b!437019))

(assert (= (and b!437019 res!257750) b!437024))

(assert (= (and b!437024 res!257756) b!437011))

(assert (= (and b!437011 res!257760) b!437014))

(assert (= (and b!437014 res!257751) b!437012))

(assert (= (and b!437012 res!257757) b!437022))

(assert (= (and b!437022 res!257749) b!437016))

(assert (= (and b!437016 res!257754) b!437020))

(assert (= (and b!437020 res!257759) b!437021))

(assert (= (and b!437021 res!257755) b!437018))

(assert (= (and b!437018 res!257758) b!437026))

(assert (= (and b!437013 condMapEmpty!18831) mapIsEmpty!18831))

(assert (= (and b!437013 (not condMapEmpty!18831)) mapNonEmpty!18831))

(get-info :version)

(assert (= (and mapNonEmpty!18831 ((_ is ValueCellFull!5393) mapValue!18831)) b!437015))

(assert (= (and b!437013 ((_ is ValueCellFull!5393) mapDefault!18831)) b!437025))

(assert (= start!40040 b!437013))

(declare-fun m!425027 () Bool)

(assert (=> mapNonEmpty!18831 m!425027))

(declare-fun m!425029 () Bool)

(assert (=> b!437019 m!425029))

(declare-fun m!425031 () Bool)

(assert (=> b!437026 m!425031))

(declare-fun m!425033 () Bool)

(assert (=> b!437026 m!425033))

(assert (=> b!437026 m!425033))

(declare-fun m!425035 () Bool)

(assert (=> b!437026 m!425035))

(declare-fun m!425037 () Bool)

(assert (=> b!437026 m!425037))

(declare-fun m!425039 () Bool)

(assert (=> b!437018 m!425039))

(declare-fun m!425041 () Bool)

(assert (=> b!437018 m!425041))

(declare-fun m!425043 () Bool)

(assert (=> b!437018 m!425043))

(declare-fun m!425045 () Bool)

(assert (=> b!437012 m!425045))

(declare-fun m!425047 () Bool)

(assert (=> b!437023 m!425047))

(declare-fun m!425049 () Bool)

(assert (=> b!437014 m!425049))

(declare-fun m!425051 () Bool)

(assert (=> start!40040 m!425051))

(declare-fun m!425053 () Bool)

(assert (=> start!40040 m!425053))

(declare-fun m!425055 () Bool)

(assert (=> b!437016 m!425055))

(declare-fun m!425057 () Bool)

(assert (=> b!437016 m!425057))

(declare-fun m!425059 () Bool)

(assert (=> b!437022 m!425059))

(declare-fun m!425061 () Bool)

(assert (=> b!437024 m!425061))

(declare-fun m!425063 () Bool)

(assert (=> b!437020 m!425063))

(check-sat tp_is_empty!11473 (not b!437020) (not b!437016) (not b!437023) (not b!437014) (not b!437018) (not b_next!10321) (not b!437022) (not b!437024) (not b!437019) (not mapNonEmpty!18831) (not start!40040) (not b!437026) b_and!18303)
(check-sat b_and!18303 (not b_next!10321))
