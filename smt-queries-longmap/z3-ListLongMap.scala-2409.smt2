; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38124 () Bool)

(assert start!38124)

(declare-fun b_free!9019 () Bool)

(declare-fun b_next!9019 () Bool)

(assert (=> start!38124 (= b_free!9019 (not b_next!9019))))

(declare-fun tp!31839 () Bool)

(declare-fun b_and!16355 () Bool)

(assert (=> start!38124 (= tp!31839 b_and!16355)))

(declare-fun mapIsEmpty!16131 () Bool)

(declare-fun mapRes!16131 () Bool)

(assert (=> mapIsEmpty!16131 mapRes!16131))

(declare-fun b!392668 () Bool)

(declare-fun e!237771 () Bool)

(declare-fun e!237774 () Bool)

(assert (=> b!392668 (= e!237771 e!237774)))

(declare-fun res!224903 () Bool)

(assert (=> b!392668 (=> (not res!224903) (not e!237774))))

(declare-datatypes ((array!23273 0))(
  ( (array!23274 (arr!11095 (Array (_ BitVec 32) (_ BitVec 64))) (size!11448 (_ BitVec 32))) )
))
(declare-fun lt!185563 () array!23273)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23273 (_ BitVec 32)) Bool)

(assert (=> b!392668 (= res!224903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185563 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23273)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392668 (= lt!185563 (array!23274 (store (arr!11095 _keys!658) i!548 k0!778) (size!11448 _keys!658)))))

(declare-fun mapNonEmpty!16131 () Bool)

(declare-fun tp!31838 () Bool)

(declare-fun e!237768 () Bool)

(assert (=> mapNonEmpty!16131 (= mapRes!16131 (and tp!31838 e!237768))))

(declare-datatypes ((V!14027 0))(
  ( (V!14028 (val!4890 Int)) )
))
(declare-datatypes ((ValueCell!4502 0))(
  ( (ValueCellFull!4502 (v!7121 V!14027)) (EmptyCell!4502) )
))
(declare-datatypes ((array!23275 0))(
  ( (array!23276 (arr!11096 (Array (_ BitVec 32) ValueCell!4502)) (size!11449 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23275)

(declare-fun mapValue!16131 () ValueCell!4502)

(declare-fun mapKey!16131 () (_ BitVec 32))

(declare-fun mapRest!16131 () (Array (_ BitVec 32) ValueCell!4502))

(assert (=> mapNonEmpty!16131 (= (arr!11096 _values!506) (store mapRest!16131 mapKey!16131 mapValue!16131))))

(declare-fun b!392669 () Bool)

(declare-fun res!224908 () Bool)

(assert (=> b!392669 (=> (not res!224908) (not e!237771))))

(declare-fun arrayContainsKey!0 (array!23273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392669 (= res!224908 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!392670 () Bool)

(declare-fun e!237769 () Bool)

(assert (=> b!392670 (= e!237774 (not e!237769))))

(declare-fun res!224910 () Bool)

(assert (=> b!392670 (=> res!224910 e!237769)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392670 (= res!224910 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6568 0))(
  ( (tuple2!6569 (_1!3295 (_ BitVec 64)) (_2!3295 V!14027)) )
))
(declare-datatypes ((List!6409 0))(
  ( (Nil!6406) (Cons!6405 (h!7261 tuple2!6568) (t!11570 List!6409)) )
))
(declare-datatypes ((ListLongMap!5471 0))(
  ( (ListLongMap!5472 (toList!2751 List!6409)) )
))
(declare-fun lt!185564 () ListLongMap!5471)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14027)

(declare-fun minValue!472 () V!14027)

(declare-fun getCurrentListMap!2069 (array!23273 array!23275 (_ BitVec 32) (_ BitVec 32) V!14027 V!14027 (_ BitVec 32) Int) ListLongMap!5471)

(assert (=> b!392670 (= lt!185564 (getCurrentListMap!2069 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185557 () array!23275)

(declare-fun lt!185566 () ListLongMap!5471)

(assert (=> b!392670 (= lt!185566 (getCurrentListMap!2069 lt!185563 lt!185557 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185559 () ListLongMap!5471)

(declare-fun lt!185561 () ListLongMap!5471)

(assert (=> b!392670 (and (= lt!185559 lt!185561) (= lt!185561 lt!185559))))

(declare-fun lt!185565 () ListLongMap!5471)

(declare-fun lt!185558 () tuple2!6568)

(declare-fun +!1071 (ListLongMap!5471 tuple2!6568) ListLongMap!5471)

(assert (=> b!392670 (= lt!185561 (+!1071 lt!185565 lt!185558))))

(declare-fun v!373 () V!14027)

(assert (=> b!392670 (= lt!185558 (tuple2!6569 k0!778 v!373))))

(declare-datatypes ((Unit!11990 0))(
  ( (Unit!11991) )
))
(declare-fun lt!185567 () Unit!11990)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!270 (array!23273 array!23275 (_ BitVec 32) (_ BitVec 32) V!14027 V!14027 (_ BitVec 32) (_ BitVec 64) V!14027 (_ BitVec 32) Int) Unit!11990)

(assert (=> b!392670 (= lt!185567 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!270 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!979 (array!23273 array!23275 (_ BitVec 32) (_ BitVec 32) V!14027 V!14027 (_ BitVec 32) Int) ListLongMap!5471)

(assert (=> b!392670 (= lt!185559 (getCurrentListMapNoExtraKeys!979 lt!185563 lt!185557 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392670 (= lt!185557 (array!23276 (store (arr!11096 _values!506) i!548 (ValueCellFull!4502 v!373)) (size!11449 _values!506)))))

(assert (=> b!392670 (= lt!185565 (getCurrentListMapNoExtraKeys!979 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392671 () Bool)

(declare-fun e!237773 () Bool)

(assert (=> b!392671 (= e!237769 e!237773)))

(declare-fun res!224913 () Bool)

(assert (=> b!392671 (=> res!224913 e!237773)))

(assert (=> b!392671 (= res!224913 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!185568 () ListLongMap!5471)

(assert (=> b!392671 (= lt!185564 lt!185568)))

(declare-fun lt!185560 () tuple2!6568)

(assert (=> b!392671 (= lt!185568 (+!1071 lt!185565 lt!185560))))

(declare-fun lt!185569 () ListLongMap!5471)

(assert (=> b!392671 (= lt!185566 lt!185569)))

(assert (=> b!392671 (= lt!185569 (+!1071 lt!185561 lt!185560))))

(assert (=> b!392671 (= lt!185566 (+!1071 lt!185559 lt!185560))))

(assert (=> b!392671 (= lt!185560 (tuple2!6569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!224909 () Bool)

(assert (=> start!38124 (=> (not res!224909) (not e!237771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38124 (= res!224909 (validMask!0 mask!970))))

(assert (=> start!38124 e!237771))

(declare-fun e!237770 () Bool)

(declare-fun array_inv!8150 (array!23275) Bool)

(assert (=> start!38124 (and (array_inv!8150 _values!506) e!237770)))

(assert (=> start!38124 tp!31839))

(assert (=> start!38124 true))

(declare-fun tp_is_empty!9691 () Bool)

(assert (=> start!38124 tp_is_empty!9691))

(declare-fun array_inv!8151 (array!23273) Bool)

(assert (=> start!38124 (array_inv!8151 _keys!658)))

(declare-fun b!392672 () Bool)

(declare-fun res!224905 () Bool)

(assert (=> b!392672 (=> (not res!224905) (not e!237774))))

(declare-datatypes ((List!6410 0))(
  ( (Nil!6407) (Cons!6406 (h!7262 (_ BitVec 64)) (t!11571 List!6410)) )
))
(declare-fun arrayNoDuplicates!0 (array!23273 (_ BitVec 32) List!6410) Bool)

(assert (=> b!392672 (= res!224905 (arrayNoDuplicates!0 lt!185563 #b00000000000000000000000000000000 Nil!6407))))

(declare-fun b!392673 () Bool)

(declare-fun res!224912 () Bool)

(assert (=> b!392673 (=> (not res!224912) (not e!237771))))

(assert (=> b!392673 (= res!224912 (and (= (size!11449 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11448 _keys!658) (size!11449 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392674 () Bool)

(declare-fun e!237772 () Bool)

(assert (=> b!392674 (= e!237770 (and e!237772 mapRes!16131))))

(declare-fun condMapEmpty!16131 () Bool)

(declare-fun mapDefault!16131 () ValueCell!4502)

(assert (=> b!392674 (= condMapEmpty!16131 (= (arr!11096 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4502)) mapDefault!16131)))))

(declare-fun b!392675 () Bool)

(declare-fun res!224911 () Bool)

(assert (=> b!392675 (=> (not res!224911) (not e!237771))))

(assert (=> b!392675 (= res!224911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392676 () Bool)

(declare-fun res!224907 () Bool)

(assert (=> b!392676 (=> (not res!224907) (not e!237771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392676 (= res!224907 (validKeyInArray!0 k0!778))))

(declare-fun b!392677 () Bool)

(declare-fun res!224904 () Bool)

(assert (=> b!392677 (=> (not res!224904) (not e!237771))))

(assert (=> b!392677 (= res!224904 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6407))))

(declare-fun b!392678 () Bool)

(declare-fun res!224902 () Bool)

(assert (=> b!392678 (=> (not res!224902) (not e!237771))))

(assert (=> b!392678 (= res!224902 (or (= (select (arr!11095 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11095 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392679 () Bool)

(assert (=> b!392679 (= e!237773 true)))

(assert (=> b!392679 (= lt!185569 (+!1071 lt!185568 lt!185558))))

(declare-fun lt!185562 () Unit!11990)

(declare-fun addCommutativeForDiffKeys!340 (ListLongMap!5471 (_ BitVec 64) V!14027 (_ BitVec 64) V!14027) Unit!11990)

(assert (=> b!392679 (= lt!185562 (addCommutativeForDiffKeys!340 lt!185565 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392680 () Bool)

(assert (=> b!392680 (= e!237768 tp_is_empty!9691)))

(declare-fun b!392681 () Bool)

(assert (=> b!392681 (= e!237772 tp_is_empty!9691)))

(declare-fun b!392682 () Bool)

(declare-fun res!224906 () Bool)

(assert (=> b!392682 (=> (not res!224906) (not e!237771))))

(assert (=> b!392682 (= res!224906 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11448 _keys!658))))))

(assert (= (and start!38124 res!224909) b!392673))

(assert (= (and b!392673 res!224912) b!392675))

(assert (= (and b!392675 res!224911) b!392677))

(assert (= (and b!392677 res!224904) b!392682))

(assert (= (and b!392682 res!224906) b!392676))

(assert (= (and b!392676 res!224907) b!392678))

(assert (= (and b!392678 res!224902) b!392669))

(assert (= (and b!392669 res!224908) b!392668))

(assert (= (and b!392668 res!224903) b!392672))

(assert (= (and b!392672 res!224905) b!392670))

(assert (= (and b!392670 (not res!224910)) b!392671))

(assert (= (and b!392671 (not res!224913)) b!392679))

(assert (= (and b!392674 condMapEmpty!16131) mapIsEmpty!16131))

(assert (= (and b!392674 (not condMapEmpty!16131)) mapNonEmpty!16131))

(get-info :version)

(assert (= (and mapNonEmpty!16131 ((_ is ValueCellFull!4502) mapValue!16131)) b!392680))

(assert (= (and b!392674 ((_ is ValueCellFull!4502) mapDefault!16131)) b!392681))

(assert (= start!38124 b!392674))

(declare-fun m!388651 () Bool)

(assert (=> b!392676 m!388651))

(declare-fun m!388653 () Bool)

(assert (=> start!38124 m!388653))

(declare-fun m!388655 () Bool)

(assert (=> start!38124 m!388655))

(declare-fun m!388657 () Bool)

(assert (=> start!38124 m!388657))

(declare-fun m!388659 () Bool)

(assert (=> b!392677 m!388659))

(declare-fun m!388661 () Bool)

(assert (=> b!392679 m!388661))

(declare-fun m!388663 () Bool)

(assert (=> b!392679 m!388663))

(declare-fun m!388665 () Bool)

(assert (=> b!392678 m!388665))

(declare-fun m!388667 () Bool)

(assert (=> b!392669 m!388667))

(declare-fun m!388669 () Bool)

(assert (=> b!392670 m!388669))

(declare-fun m!388671 () Bool)

(assert (=> b!392670 m!388671))

(declare-fun m!388673 () Bool)

(assert (=> b!392670 m!388673))

(declare-fun m!388675 () Bool)

(assert (=> b!392670 m!388675))

(declare-fun m!388677 () Bool)

(assert (=> b!392670 m!388677))

(declare-fun m!388679 () Bool)

(assert (=> b!392670 m!388679))

(declare-fun m!388681 () Bool)

(assert (=> b!392670 m!388681))

(declare-fun m!388683 () Bool)

(assert (=> mapNonEmpty!16131 m!388683))

(declare-fun m!388685 () Bool)

(assert (=> b!392675 m!388685))

(declare-fun m!388687 () Bool)

(assert (=> b!392668 m!388687))

(declare-fun m!388689 () Bool)

(assert (=> b!392668 m!388689))

(declare-fun m!388691 () Bool)

(assert (=> b!392672 m!388691))

(declare-fun m!388693 () Bool)

(assert (=> b!392671 m!388693))

(declare-fun m!388695 () Bool)

(assert (=> b!392671 m!388695))

(declare-fun m!388697 () Bool)

(assert (=> b!392671 m!388697))

(check-sat (not mapNonEmpty!16131) b_and!16355 (not b!392672) (not start!38124) (not b_next!9019) tp_is_empty!9691 (not b!392676) (not b!392677) (not b!392670) (not b!392669) (not b!392679) (not b!392668) (not b!392675) (not b!392671))
(check-sat b_and!16355 (not b_next!9019))
