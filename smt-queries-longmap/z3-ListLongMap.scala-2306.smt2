; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37284 () Bool)

(assert start!37284)

(declare-fun b_free!8425 () Bool)

(declare-fun b_next!8425 () Bool)

(assert (=> start!37284 (= b_free!8425 (not b_next!8425))))

(declare-fun tp!29991 () Bool)

(declare-fun b_and!15641 () Bool)

(assert (=> start!37284 (= tp!29991 b_and!15641)))

(declare-fun b!377735 () Bool)

(declare-fun e!229928 () Bool)

(declare-fun e!229922 () Bool)

(assert (=> b!377735 (= e!229928 (not e!229922))))

(declare-fun res!213874 () Bool)

(assert (=> b!377735 (=> res!213874 e!229922)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377735 (= res!213874 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13203 0))(
  ( (V!13204 (val!4581 Int)) )
))
(declare-datatypes ((ValueCell!4193 0))(
  ( (ValueCellFull!4193 (v!6772 V!13203)) (EmptyCell!4193) )
))
(declare-datatypes ((array!22055 0))(
  ( (array!22056 (arr!10496 (Array (_ BitVec 32) ValueCell!4193)) (size!10849 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22055)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6092 0))(
  ( (tuple2!6093 (_1!3057 (_ BitVec 64)) (_2!3057 V!13203)) )
))
(declare-datatypes ((List!5922 0))(
  ( (Nil!5919) (Cons!5918 (h!6774 tuple2!6092) (t!11063 List!5922)) )
))
(declare-datatypes ((ListLongMap!4995 0))(
  ( (ListLongMap!4996 (toList!2513 List!5922)) )
))
(declare-fun lt!175752 () ListLongMap!4995)

(declare-fun zeroValue!472 () V!13203)

(declare-datatypes ((array!22057 0))(
  ( (array!22058 (arr!10497 (Array (_ BitVec 32) (_ BitVec 64))) (size!10850 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22057)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13203)

(declare-fun getCurrentListMap!1920 (array!22057 array!22055 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) Int) ListLongMap!4995)

(assert (=> b!377735 (= lt!175752 (getCurrentListMap!1920 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175763 () array!22057)

(declare-fun lt!175755 () array!22055)

(declare-fun lt!175764 () ListLongMap!4995)

(assert (=> b!377735 (= lt!175764 (getCurrentListMap!1920 lt!175763 lt!175755 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175762 () ListLongMap!4995)

(declare-fun lt!175757 () ListLongMap!4995)

(assert (=> b!377735 (and (= lt!175762 lt!175757) (= lt!175757 lt!175762))))

(declare-fun lt!175761 () ListLongMap!4995)

(declare-fun lt!175760 () tuple2!6092)

(declare-fun +!881 (ListLongMap!4995 tuple2!6092) ListLongMap!4995)

(assert (=> b!377735 (= lt!175757 (+!881 lt!175761 lt!175760))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13203)

(assert (=> b!377735 (= lt!175760 (tuple2!6093 k0!778 v!373))))

(declare-datatypes ((Unit!11630 0))(
  ( (Unit!11631) )
))
(declare-fun lt!175758 () Unit!11630)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!113 (array!22057 array!22055 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) (_ BitVec 64) V!13203 (_ BitVec 32) Int) Unit!11630)

(assert (=> b!377735 (= lt!175758 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!113 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!785 (array!22057 array!22055 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) Int) ListLongMap!4995)

(assert (=> b!377735 (= lt!175762 (getCurrentListMapNoExtraKeys!785 lt!175763 lt!175755 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377735 (= lt!175755 (array!22056 (store (arr!10496 _values!506) i!548 (ValueCellFull!4193 v!373)) (size!10849 _values!506)))))

(assert (=> b!377735 (= lt!175761 (getCurrentListMapNoExtraKeys!785 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377736 () Bool)

(declare-fun res!213873 () Bool)

(assert (=> b!377736 (=> (not res!213873) (not e!229928))))

(declare-datatypes ((List!5923 0))(
  ( (Nil!5920) (Cons!5919 (h!6775 (_ BitVec 64)) (t!11064 List!5923)) )
))
(declare-fun arrayNoDuplicates!0 (array!22057 (_ BitVec 32) List!5923) Bool)

(assert (=> b!377736 (= res!213873 (arrayNoDuplicates!0 lt!175763 #b00000000000000000000000000000000 Nil!5920))))

(declare-fun b!377737 () Bool)

(declare-fun e!229921 () Bool)

(declare-fun tp_is_empty!9073 () Bool)

(assert (=> b!377737 (= e!229921 tp_is_empty!9073)))

(declare-fun b!377738 () Bool)

(declare-fun res!213875 () Bool)

(declare-fun e!229927 () Bool)

(assert (=> b!377738 (=> (not res!213875) (not e!229927))))

(declare-fun arrayContainsKey!0 (array!22057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377738 (= res!213875 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377739 () Bool)

(declare-fun res!213870 () Bool)

(assert (=> b!377739 (=> (not res!213870) (not e!229927))))

(assert (=> b!377739 (= res!213870 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10850 _keys!658))))))

(declare-fun b!377740 () Bool)

(declare-fun e!229926 () Bool)

(assert (=> b!377740 (= e!229922 e!229926)))

(declare-fun res!213880 () Bool)

(assert (=> b!377740 (=> res!213880 e!229926)))

(assert (=> b!377740 (= res!213880 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175759 () ListLongMap!4995)

(assert (=> b!377740 (= lt!175764 lt!175759)))

(declare-fun lt!175756 () tuple2!6092)

(assert (=> b!377740 (= lt!175759 (+!881 lt!175757 lt!175756))))

(declare-fun lt!175753 () ListLongMap!4995)

(assert (=> b!377740 (= lt!175752 lt!175753)))

(assert (=> b!377740 (= lt!175753 (+!881 lt!175761 lt!175756))))

(assert (=> b!377740 (= lt!175764 (+!881 lt!175762 lt!175756))))

(assert (=> b!377740 (= lt!175756 (tuple2!6093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377741 () Bool)

(declare-fun res!213878 () Bool)

(assert (=> b!377741 (=> (not res!213878) (not e!229927))))

(assert (=> b!377741 (= res!213878 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5920))))

(declare-fun res!213881 () Bool)

(assert (=> start!37284 (=> (not res!213881) (not e!229927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37284 (= res!213881 (validMask!0 mask!970))))

(assert (=> start!37284 e!229927))

(declare-fun e!229925 () Bool)

(declare-fun array_inv!7734 (array!22055) Bool)

(assert (=> start!37284 (and (array_inv!7734 _values!506) e!229925)))

(assert (=> start!37284 tp!29991))

(assert (=> start!37284 true))

(assert (=> start!37284 tp_is_empty!9073))

(declare-fun array_inv!7735 (array!22057) Bool)

(assert (=> start!37284 (array_inv!7735 _keys!658)))

(declare-fun b!377742 () Bool)

(declare-fun res!213872 () Bool)

(assert (=> b!377742 (=> (not res!213872) (not e!229927))))

(assert (=> b!377742 (= res!213872 (and (= (size!10849 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10850 _keys!658) (size!10849 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377743 () Bool)

(declare-fun e!229923 () Bool)

(assert (=> b!377743 (= e!229923 tp_is_empty!9073)))

(declare-fun b!377744 () Bool)

(declare-fun res!213879 () Bool)

(assert (=> b!377744 (=> (not res!213879) (not e!229927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22057 (_ BitVec 32)) Bool)

(assert (=> b!377744 (= res!213879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15174 () Bool)

(declare-fun mapRes!15174 () Bool)

(assert (=> mapIsEmpty!15174 mapRes!15174))

(declare-fun b!377745 () Bool)

(assert (=> b!377745 (= e!229926 true)))

(assert (=> b!377745 (= lt!175759 (+!881 lt!175753 lt!175760))))

(declare-fun lt!175754 () Unit!11630)

(declare-fun addCommutativeForDiffKeys!286 (ListLongMap!4995 (_ BitVec 64) V!13203 (_ BitVec 64) V!13203) Unit!11630)

(assert (=> b!377745 (= lt!175754 (addCommutativeForDiffKeys!286 lt!175761 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377746 () Bool)

(assert (=> b!377746 (= e!229925 (and e!229923 mapRes!15174))))

(declare-fun condMapEmpty!15174 () Bool)

(declare-fun mapDefault!15174 () ValueCell!4193)

(assert (=> b!377746 (= condMapEmpty!15174 (= (arr!10496 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4193)) mapDefault!15174)))))

(declare-fun mapNonEmpty!15174 () Bool)

(declare-fun tp!29990 () Bool)

(assert (=> mapNonEmpty!15174 (= mapRes!15174 (and tp!29990 e!229921))))

(declare-fun mapValue!15174 () ValueCell!4193)

(declare-fun mapKey!15174 () (_ BitVec 32))

(declare-fun mapRest!15174 () (Array (_ BitVec 32) ValueCell!4193))

(assert (=> mapNonEmpty!15174 (= (arr!10496 _values!506) (store mapRest!15174 mapKey!15174 mapValue!15174))))

(declare-fun b!377747 () Bool)

(declare-fun res!213871 () Bool)

(assert (=> b!377747 (=> (not res!213871) (not e!229927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377747 (= res!213871 (validKeyInArray!0 k0!778))))

(declare-fun b!377748 () Bool)

(declare-fun res!213877 () Bool)

(assert (=> b!377748 (=> (not res!213877) (not e!229927))))

(assert (=> b!377748 (= res!213877 (or (= (select (arr!10497 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10497 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377749 () Bool)

(assert (=> b!377749 (= e!229927 e!229928)))

(declare-fun res!213876 () Bool)

(assert (=> b!377749 (=> (not res!213876) (not e!229928))))

(assert (=> b!377749 (= res!213876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175763 mask!970))))

(assert (=> b!377749 (= lt!175763 (array!22058 (store (arr!10497 _keys!658) i!548 k0!778) (size!10850 _keys!658)))))

(assert (= (and start!37284 res!213881) b!377742))

(assert (= (and b!377742 res!213872) b!377744))

(assert (= (and b!377744 res!213879) b!377741))

(assert (= (and b!377741 res!213878) b!377739))

(assert (= (and b!377739 res!213870) b!377747))

(assert (= (and b!377747 res!213871) b!377748))

(assert (= (and b!377748 res!213877) b!377738))

(assert (= (and b!377738 res!213875) b!377749))

(assert (= (and b!377749 res!213876) b!377736))

(assert (= (and b!377736 res!213873) b!377735))

(assert (= (and b!377735 (not res!213874)) b!377740))

(assert (= (and b!377740 (not res!213880)) b!377745))

(assert (= (and b!377746 condMapEmpty!15174) mapIsEmpty!15174))

(assert (= (and b!377746 (not condMapEmpty!15174)) mapNonEmpty!15174))

(get-info :version)

(assert (= (and mapNonEmpty!15174 ((_ is ValueCellFull!4193) mapValue!15174)) b!377737))

(assert (= (and b!377746 ((_ is ValueCellFull!4193) mapDefault!15174)) b!377743))

(assert (= start!37284 b!377746))

(declare-fun m!374087 () Bool)

(assert (=> b!377749 m!374087))

(declare-fun m!374089 () Bool)

(assert (=> b!377749 m!374089))

(declare-fun m!374091 () Bool)

(assert (=> b!377747 m!374091))

(declare-fun m!374093 () Bool)

(assert (=> start!37284 m!374093))

(declare-fun m!374095 () Bool)

(assert (=> start!37284 m!374095))

(declare-fun m!374097 () Bool)

(assert (=> start!37284 m!374097))

(declare-fun m!374099 () Bool)

(assert (=> b!377748 m!374099))

(declare-fun m!374101 () Bool)

(assert (=> b!377745 m!374101))

(declare-fun m!374103 () Bool)

(assert (=> b!377745 m!374103))

(declare-fun m!374105 () Bool)

(assert (=> b!377744 m!374105))

(declare-fun m!374107 () Bool)

(assert (=> b!377738 m!374107))

(declare-fun m!374109 () Bool)

(assert (=> b!377740 m!374109))

(declare-fun m!374111 () Bool)

(assert (=> b!377740 m!374111))

(declare-fun m!374113 () Bool)

(assert (=> b!377740 m!374113))

(declare-fun m!374115 () Bool)

(assert (=> b!377741 m!374115))

(declare-fun m!374117 () Bool)

(assert (=> b!377735 m!374117))

(declare-fun m!374119 () Bool)

(assert (=> b!377735 m!374119))

(declare-fun m!374121 () Bool)

(assert (=> b!377735 m!374121))

(declare-fun m!374123 () Bool)

(assert (=> b!377735 m!374123))

(declare-fun m!374125 () Bool)

(assert (=> b!377735 m!374125))

(declare-fun m!374127 () Bool)

(assert (=> b!377735 m!374127))

(declare-fun m!374129 () Bool)

(assert (=> b!377735 m!374129))

(declare-fun m!374131 () Bool)

(assert (=> b!377736 m!374131))

(declare-fun m!374133 () Bool)

(assert (=> mapNonEmpty!15174 m!374133))

(check-sat (not b!377740) (not b!377745) (not start!37284) (not b!377735) b_and!15641 (not b!377738) (not b!377736) (not b!377744) (not b!377741) (not b!377747) (not b_next!8425) (not b!377749) (not mapNonEmpty!15174) tp_is_empty!9073)
(check-sat b_and!15641 (not b_next!8425))
