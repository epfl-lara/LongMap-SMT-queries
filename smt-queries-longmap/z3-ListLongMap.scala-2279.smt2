; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37122 () Bool)

(assert start!37122)

(declare-fun b_free!8263 () Bool)

(declare-fun b_next!8263 () Bool)

(assert (=> start!37122 (= b_free!8263 (not b_next!8263))))

(declare-fun tp!29504 () Bool)

(declare-fun b_and!15519 () Bool)

(assert (=> start!37122 (= tp!29504 b_and!15519)))

(declare-fun b!374303 () Bool)

(declare-fun e!228123 () Bool)

(declare-fun e!228122 () Bool)

(declare-fun mapRes!14931 () Bool)

(assert (=> b!374303 (= e!228123 (and e!228122 mapRes!14931))))

(declare-fun condMapEmpty!14931 () Bool)

(declare-datatypes ((V!12987 0))(
  ( (V!12988 (val!4500 Int)) )
))
(declare-datatypes ((ValueCell!4112 0))(
  ( (ValueCellFull!4112 (v!6698 V!12987)) (EmptyCell!4112) )
))
(declare-datatypes ((array!21742 0))(
  ( (array!21743 (arr!10339 (Array (_ BitVec 32) ValueCell!4112)) (size!10691 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21742)

(declare-fun mapDefault!14931 () ValueCell!4112)

(assert (=> b!374303 (= condMapEmpty!14931 (= (arr!10339 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4112)) mapDefault!14931)))))

(declare-fun b!374304 () Bool)

(declare-fun e!228119 () Bool)

(declare-fun e!228121 () Bool)

(assert (=> b!374304 (= e!228119 e!228121)))

(declare-fun res!211079 () Bool)

(assert (=> b!374304 (=> res!211079 e!228121)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!374304 (= res!211079 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5884 0))(
  ( (tuple2!5885 (_1!2953 (_ BitVec 64)) (_2!2953 V!12987)) )
))
(declare-datatypes ((List!5728 0))(
  ( (Nil!5725) (Cons!5724 (h!6580 tuple2!5884) (t!10870 List!5728)) )
))
(declare-datatypes ((ListLongMap!4799 0))(
  ( (ListLongMap!4800 (toList!2415 List!5728)) )
))
(declare-fun lt!172542 () ListLongMap!4799)

(declare-fun lt!172541 () ListLongMap!4799)

(assert (=> b!374304 (= lt!172542 lt!172541)))

(declare-fun lt!172538 () ListLongMap!4799)

(declare-fun lt!172532 () tuple2!5884)

(declare-fun +!811 (ListLongMap!4799 tuple2!5884) ListLongMap!4799)

(assert (=> b!374304 (= lt!172541 (+!811 lt!172538 lt!172532))))

(declare-fun v!373 () V!12987)

(declare-fun lt!172543 () ListLongMap!4799)

(declare-datatypes ((Unit!11511 0))(
  ( (Unit!11512) )
))
(declare-fun lt!172534 () Unit!11511)

(declare-fun zeroValue!472 () V!12987)

(declare-fun addCommutativeForDiffKeys!239 (ListLongMap!4799 (_ BitVec 64) V!12987 (_ BitVec 64) V!12987) Unit!11511)

(assert (=> b!374304 (= lt!172534 (addCommutativeForDiffKeys!239 lt!172543 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172533 () ListLongMap!4799)

(declare-fun lt!172530 () tuple2!5884)

(assert (=> b!374304 (= lt!172533 (+!811 lt!172542 lt!172530))))

(declare-fun lt!172536 () ListLongMap!4799)

(declare-fun lt!172535 () tuple2!5884)

(assert (=> b!374304 (= lt!172542 (+!811 lt!172536 lt!172535))))

(declare-fun lt!172531 () ListLongMap!4799)

(declare-fun lt!172537 () ListLongMap!4799)

(assert (=> b!374304 (= lt!172531 lt!172537)))

(assert (=> b!374304 (= lt!172537 (+!811 lt!172538 lt!172530))))

(assert (=> b!374304 (= lt!172538 (+!811 lt!172543 lt!172535))))

(declare-fun lt!172539 () ListLongMap!4799)

(assert (=> b!374304 (= lt!172533 (+!811 (+!811 lt!172539 lt!172535) lt!172530))))

(declare-fun minValue!472 () V!12987)

(assert (=> b!374304 (= lt!172530 (tuple2!5885 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374304 (= lt!172535 (tuple2!5885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374305 () Bool)

(declare-fun res!211076 () Bool)

(declare-fun e!228125 () Bool)

(assert (=> b!374305 (=> (not res!211076) (not e!228125))))

(declare-datatypes ((array!21744 0))(
  ( (array!21745 (arr!10340 (Array (_ BitVec 32) (_ BitVec 64))) (size!10692 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21744)

(declare-fun arrayContainsKey!0 (array!21744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374305 (= res!211076 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374306 () Bool)

(declare-fun res!211077 () Bool)

(assert (=> b!374306 (=> (not res!211077) (not e!228125))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374306 (= res!211077 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10692 _keys!658))))))

(declare-fun b!374307 () Bool)

(declare-fun e!228126 () Bool)

(assert (=> b!374307 (= e!228125 e!228126)))

(declare-fun res!211080 () Bool)

(assert (=> b!374307 (=> (not res!211080) (not e!228126))))

(declare-fun lt!172540 () array!21744)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21744 (_ BitVec 32)) Bool)

(assert (=> b!374307 (= res!211080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172540 mask!970))))

(assert (=> b!374307 (= lt!172540 (array!21745 (store (arr!10340 _keys!658) i!548 k0!778) (size!10692 _keys!658)))))

(declare-fun b!374309 () Bool)

(declare-fun res!211078 () Bool)

(assert (=> b!374309 (=> (not res!211078) (not e!228125))))

(assert (=> b!374309 (= res!211078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374310 () Bool)

(declare-fun res!211071 () Bool)

(assert (=> b!374310 (=> (not res!211071) (not e!228125))))

(declare-datatypes ((List!5729 0))(
  ( (Nil!5726) (Cons!5725 (h!6581 (_ BitVec 64)) (t!10871 List!5729)) )
))
(declare-fun arrayNoDuplicates!0 (array!21744 (_ BitVec 32) List!5729) Bool)

(assert (=> b!374310 (= res!211071 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5726))))

(declare-fun b!374311 () Bool)

(declare-fun res!211081 () Bool)

(assert (=> b!374311 (=> (not res!211081) (not e!228126))))

(assert (=> b!374311 (= res!211081 (arrayNoDuplicates!0 lt!172540 #b00000000000000000000000000000000 Nil!5726))))

(declare-fun b!374312 () Bool)

(declare-fun res!211082 () Bool)

(assert (=> b!374312 (=> (not res!211082) (not e!228125))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374312 (= res!211082 (and (= (size!10691 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10692 _keys!658) (size!10691 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374313 () Bool)

(declare-fun res!211072 () Bool)

(assert (=> b!374313 (=> (not res!211072) (not e!228125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374313 (= res!211072 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14931 () Bool)

(declare-fun tp!29505 () Bool)

(declare-fun e!228124 () Bool)

(assert (=> mapNonEmpty!14931 (= mapRes!14931 (and tp!29505 e!228124))))

(declare-fun mapValue!14931 () ValueCell!4112)

(declare-fun mapRest!14931 () (Array (_ BitVec 32) ValueCell!4112))

(declare-fun mapKey!14931 () (_ BitVec 32))

(assert (=> mapNonEmpty!14931 (= (arr!10339 _values!506) (store mapRest!14931 mapKey!14931 mapValue!14931))))

(declare-fun b!374314 () Bool)

(declare-fun tp_is_empty!8911 () Bool)

(assert (=> b!374314 (= e!228124 tp_is_empty!8911)))

(declare-fun b!374315 () Bool)

(assert (=> b!374315 (= e!228121 (bvsle #b00000000000000000000000000000000 (size!10692 _keys!658)))))

(assert (=> b!374315 (= (+!811 lt!172541 lt!172530) (+!811 lt!172537 lt!172532))))

(declare-fun lt!172545 () Unit!11511)

(assert (=> b!374315 (= lt!172545 (addCommutativeForDiffKeys!239 lt!172538 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!14931 () Bool)

(assert (=> mapIsEmpty!14931 mapRes!14931))

(declare-fun res!211073 () Bool)

(assert (=> start!37122 (=> (not res!211073) (not e!228125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37122 (= res!211073 (validMask!0 mask!970))))

(assert (=> start!37122 e!228125))

(declare-fun array_inv!7672 (array!21742) Bool)

(assert (=> start!37122 (and (array_inv!7672 _values!506) e!228123)))

(assert (=> start!37122 tp!29504))

(assert (=> start!37122 true))

(assert (=> start!37122 tp_is_empty!8911))

(declare-fun array_inv!7673 (array!21744) Bool)

(assert (=> start!37122 (array_inv!7673 _keys!658)))

(declare-fun b!374308 () Bool)

(assert (=> b!374308 (= e!228126 (not e!228119))))

(declare-fun res!211074 () Bool)

(assert (=> b!374308 (=> res!211074 e!228119)))

(assert (=> b!374308 (= res!211074 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1873 (array!21744 array!21742 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) Int) ListLongMap!4799)

(assert (=> b!374308 (= lt!172531 (getCurrentListMap!1873 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172546 () array!21742)

(assert (=> b!374308 (= lt!172533 (getCurrentListMap!1873 lt!172540 lt!172546 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374308 (and (= lt!172539 lt!172536) (= lt!172536 lt!172539))))

(assert (=> b!374308 (= lt!172536 (+!811 lt!172543 lt!172532))))

(assert (=> b!374308 (= lt!172532 (tuple2!5885 k0!778 v!373))))

(declare-fun lt!172544 () Unit!11511)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!60 (array!21744 array!21742 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) (_ BitVec 64) V!12987 (_ BitVec 32) Int) Unit!11511)

(assert (=> b!374308 (= lt!172544 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!60 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!720 (array!21744 array!21742 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) Int) ListLongMap!4799)

(assert (=> b!374308 (= lt!172539 (getCurrentListMapNoExtraKeys!720 lt!172540 lt!172546 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374308 (= lt!172546 (array!21743 (store (arr!10339 _values!506) i!548 (ValueCellFull!4112 v!373)) (size!10691 _values!506)))))

(assert (=> b!374308 (= lt!172543 (getCurrentListMapNoExtraKeys!720 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374316 () Bool)

(declare-fun res!211075 () Bool)

(assert (=> b!374316 (=> (not res!211075) (not e!228125))))

(assert (=> b!374316 (= res!211075 (or (= (select (arr!10340 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10340 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374317 () Bool)

(assert (=> b!374317 (= e!228122 tp_is_empty!8911)))

(assert (= (and start!37122 res!211073) b!374312))

(assert (= (and b!374312 res!211082) b!374309))

(assert (= (and b!374309 res!211078) b!374310))

(assert (= (and b!374310 res!211071) b!374306))

(assert (= (and b!374306 res!211077) b!374313))

(assert (= (and b!374313 res!211072) b!374316))

(assert (= (and b!374316 res!211075) b!374305))

(assert (= (and b!374305 res!211076) b!374307))

(assert (= (and b!374307 res!211080) b!374311))

(assert (= (and b!374311 res!211081) b!374308))

(assert (= (and b!374308 (not res!211074)) b!374304))

(assert (= (and b!374304 (not res!211079)) b!374315))

(assert (= (and b!374303 condMapEmpty!14931) mapIsEmpty!14931))

(assert (= (and b!374303 (not condMapEmpty!14931)) mapNonEmpty!14931))

(get-info :version)

(assert (= (and mapNonEmpty!14931 ((_ is ValueCellFull!4112) mapValue!14931)) b!374314))

(assert (= (and b!374303 ((_ is ValueCellFull!4112) mapDefault!14931)) b!374317))

(assert (= start!37122 b!374303))

(declare-fun m!370805 () Bool)

(assert (=> b!374310 m!370805))

(declare-fun m!370807 () Bool)

(assert (=> b!374315 m!370807))

(declare-fun m!370809 () Bool)

(assert (=> b!374315 m!370809))

(declare-fun m!370811 () Bool)

(assert (=> b!374315 m!370811))

(declare-fun m!370813 () Bool)

(assert (=> b!374308 m!370813))

(declare-fun m!370815 () Bool)

(assert (=> b!374308 m!370815))

(declare-fun m!370817 () Bool)

(assert (=> b!374308 m!370817))

(declare-fun m!370819 () Bool)

(assert (=> b!374308 m!370819))

(declare-fun m!370821 () Bool)

(assert (=> b!374308 m!370821))

(declare-fun m!370823 () Bool)

(assert (=> b!374308 m!370823))

(declare-fun m!370825 () Bool)

(assert (=> b!374308 m!370825))

(declare-fun m!370827 () Bool)

(assert (=> b!374305 m!370827))

(declare-fun m!370829 () Bool)

(assert (=> b!374311 m!370829))

(declare-fun m!370831 () Bool)

(assert (=> b!374313 m!370831))

(declare-fun m!370833 () Bool)

(assert (=> b!374309 m!370833))

(declare-fun m!370835 () Bool)

(assert (=> start!37122 m!370835))

(declare-fun m!370837 () Bool)

(assert (=> start!37122 m!370837))

(declare-fun m!370839 () Bool)

(assert (=> start!37122 m!370839))

(declare-fun m!370841 () Bool)

(assert (=> b!374316 m!370841))

(declare-fun m!370843 () Bool)

(assert (=> b!374307 m!370843))

(declare-fun m!370845 () Bool)

(assert (=> b!374307 m!370845))

(declare-fun m!370847 () Bool)

(assert (=> mapNonEmpty!14931 m!370847))

(declare-fun m!370849 () Bool)

(assert (=> b!374304 m!370849))

(declare-fun m!370851 () Bool)

(assert (=> b!374304 m!370851))

(declare-fun m!370853 () Bool)

(assert (=> b!374304 m!370853))

(declare-fun m!370855 () Bool)

(assert (=> b!374304 m!370855))

(declare-fun m!370857 () Bool)

(assert (=> b!374304 m!370857))

(declare-fun m!370859 () Bool)

(assert (=> b!374304 m!370859))

(assert (=> b!374304 m!370849))

(declare-fun m!370861 () Bool)

(assert (=> b!374304 m!370861))

(declare-fun m!370863 () Bool)

(assert (=> b!374304 m!370863))

(check-sat (not b!374313) (not b!374304) (not b_next!8263) (not b!374308) (not b!374307) (not b!374310) (not b!374311) (not mapNonEmpty!14931) tp_is_empty!8911 (not b!374315) b_and!15519 (not start!37122) (not b!374309) (not b!374305))
(check-sat b_and!15519 (not b_next!8263))
