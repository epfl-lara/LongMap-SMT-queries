; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71240 () Bool)

(assert start!71240)

(declare-fun b_free!13261 () Bool)

(declare-fun b_next!13261 () Bool)

(assert (=> start!71240 (= b_free!13261 (not b_next!13261))))

(declare-fun tp!46540 () Bool)

(declare-fun b_and!22185 () Bool)

(assert (=> start!71240 (= tp!46540 b_and!22185)))

(declare-datatypes ((V!24963 0))(
  ( (V!24964 (val!7533 Int)) )
))
(declare-datatypes ((tuple2!9894 0))(
  ( (tuple2!9895 (_1!4958 (_ BitVec 64)) (_2!4958 V!24963)) )
))
(declare-datatypes ((List!15679 0))(
  ( (Nil!15676) (Cons!15675 (h!16810 tuple2!9894) (t!22016 List!15679)) )
))
(declare-datatypes ((ListLongMap!8719 0))(
  ( (ListLongMap!8720 (toList!4375 List!15679)) )
))
(declare-fun lt!372947 () ListLongMap!8719)

(declare-fun lt!372944 () tuple2!9894)

(declare-fun b!826273 () Bool)

(declare-fun lt!372953 () ListLongMap!8719)

(declare-fun lt!372946 () tuple2!9894)

(declare-fun e!459969 () Bool)

(declare-fun +!1922 (ListLongMap!8719 tuple2!9894) ListLongMap!8719)

(assert (=> b!826273 (= e!459969 (= lt!372953 (+!1922 (+!1922 lt!372947 lt!372946) lt!372944)))))

(declare-fun b!826274 () Bool)

(declare-fun e!459968 () Bool)

(declare-fun tp_is_empty!14971 () Bool)

(assert (=> b!826274 (= e!459968 tp_is_empty!14971)))

(declare-fun mapNonEmpty!24079 () Bool)

(declare-fun mapRes!24079 () Bool)

(declare-fun tp!46539 () Bool)

(declare-fun e!459964 () Bool)

(assert (=> mapNonEmpty!24079 (= mapRes!24079 (and tp!46539 e!459964))))

(declare-datatypes ((ValueCell!7070 0))(
  ( (ValueCellFull!7070 (v!9966 V!24963)) (EmptyCell!7070) )
))
(declare-fun mapRest!24079 () (Array (_ BitVec 32) ValueCell!7070))

(declare-fun mapValue!24079 () ValueCell!7070)

(declare-datatypes ((array!46127 0))(
  ( (array!46128 (arr!22105 (Array (_ BitVec 32) ValueCell!7070)) (size!22525 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46127)

(declare-fun mapKey!24079 () (_ BitVec 32))

(assert (=> mapNonEmpty!24079 (= (arr!22105 _values!788) (store mapRest!24079 mapKey!24079 mapValue!24079))))

(declare-fun b!826275 () Bool)

(declare-fun e!459970 () Bool)

(assert (=> b!826275 (= e!459970 true)))

(declare-fun lt!372951 () ListLongMap!8719)

(declare-fun lt!372943 () ListLongMap!8719)

(assert (=> b!826275 (= lt!372943 (+!1922 (+!1922 lt!372951 lt!372944) lt!372946))))

(declare-fun lt!372952 () ListLongMap!8719)

(declare-fun lt!372948 () ListLongMap!8719)

(assert (=> b!826275 (and (= lt!372952 lt!372948) (= lt!372953 lt!372948) (= lt!372953 lt!372952))))

(declare-fun lt!372949 () ListLongMap!8719)

(assert (=> b!826275 (= lt!372948 (+!1922 lt!372949 lt!372944))))

(declare-fun lt!372941 () ListLongMap!8719)

(assert (=> b!826275 (= lt!372952 (+!1922 lt!372941 lt!372944))))

(declare-datatypes ((Unit!28302 0))(
  ( (Unit!28303) )
))
(declare-fun lt!372942 () Unit!28302)

(declare-fun zeroValueBefore!34 () V!24963)

(declare-fun zeroValueAfter!34 () V!24963)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!210 (ListLongMap!8719 (_ BitVec 64) V!24963 V!24963) Unit!28302)

(assert (=> b!826275 (= lt!372942 (addSameAsAddTwiceSameKeyDiffValues!210 lt!372941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826275 e!459969))

(declare-fun res!563005 () Bool)

(assert (=> b!826275 (=> (not res!563005) (not e!459969))))

(declare-fun lt!372950 () ListLongMap!8719)

(assert (=> b!826275 (= res!563005 (= lt!372950 lt!372949))))

(declare-fun lt!372945 () tuple2!9894)

(assert (=> b!826275 (= lt!372949 (+!1922 lt!372941 lt!372945))))

(assert (=> b!826275 (= lt!372941 (+!1922 lt!372951 lt!372946))))

(assert (=> b!826275 (= lt!372944 (tuple2!9895 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459966 () Bool)

(assert (=> b!826275 e!459966))

(declare-fun res!563002 () Bool)

(assert (=> b!826275 (=> (not res!563002) (not e!459966))))

(assert (=> b!826275 (= res!563002 (= lt!372950 (+!1922 (+!1922 lt!372951 lt!372945) lt!372946)))))

(declare-fun minValue!754 () V!24963)

(assert (=> b!826275 (= lt!372946 (tuple2!9895 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826275 (= lt!372945 (tuple2!9895 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46129 0))(
  ( (array!46130 (arr!22106 (Array (_ BitVec 32) (_ BitVec 64))) (size!22526 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46129)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2501 (array!46129 array!46127 (_ BitVec 32) (_ BitVec 32) V!24963 V!24963 (_ BitVec 32) Int) ListLongMap!8719)

(assert (=> b!826275 (= lt!372953 (getCurrentListMap!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826275 (= lt!372950 (getCurrentListMap!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826276 () Bool)

(declare-fun e!459965 () Bool)

(assert (=> b!826276 (= e!459965 (not e!459970))))

(declare-fun res!563006 () Bool)

(assert (=> b!826276 (=> res!563006 e!459970)))

(assert (=> b!826276 (= res!563006 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826276 (= lt!372951 lt!372947)))

(declare-fun lt!372954 () Unit!28302)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!545 (array!46129 array!46127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24963 V!24963 V!24963 V!24963 (_ BitVec 32) Int) Unit!28302)

(assert (=> b!826276 (= lt!372954 (lemmaNoChangeToArrayThenSameMapNoExtras!545 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2457 (array!46129 array!46127 (_ BitVec 32) (_ BitVec 32) V!24963 V!24963 (_ BitVec 32) Int) ListLongMap!8719)

(assert (=> b!826276 (= lt!372947 (getCurrentListMapNoExtraKeys!2457 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826276 (= lt!372951 (getCurrentListMapNoExtraKeys!2457 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826277 () Bool)

(declare-fun res!563003 () Bool)

(assert (=> b!826277 (=> (not res!563003) (not e!459965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46129 (_ BitVec 32)) Bool)

(assert (=> b!826277 (= res!563003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826278 () Bool)

(declare-fun e!459967 () Bool)

(assert (=> b!826278 (= e!459967 (and e!459968 mapRes!24079))))

(declare-fun condMapEmpty!24079 () Bool)

(declare-fun mapDefault!24079 () ValueCell!7070)

(assert (=> b!826278 (= condMapEmpty!24079 (= (arr!22105 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7070)) mapDefault!24079)))))

(declare-fun res!563001 () Bool)

(assert (=> start!71240 (=> (not res!563001) (not e!459965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71240 (= res!563001 (validMask!0 mask!1312))))

(assert (=> start!71240 e!459965))

(assert (=> start!71240 tp_is_empty!14971))

(declare-fun array_inv!17667 (array!46129) Bool)

(assert (=> start!71240 (array_inv!17667 _keys!976)))

(assert (=> start!71240 true))

(declare-fun array_inv!17668 (array!46127) Bool)

(assert (=> start!71240 (and (array_inv!17668 _values!788) e!459967)))

(assert (=> start!71240 tp!46540))

(declare-fun b!826272 () Bool)

(declare-fun res!563004 () Bool)

(assert (=> b!826272 (=> (not res!563004) (not e!459965))))

(declare-datatypes ((List!15680 0))(
  ( (Nil!15677) (Cons!15676 (h!16811 (_ BitVec 64)) (t!22017 List!15680)) )
))
(declare-fun arrayNoDuplicates!0 (array!46129 (_ BitVec 32) List!15680) Bool)

(assert (=> b!826272 (= res!563004 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15677))))

(declare-fun mapIsEmpty!24079 () Bool)

(assert (=> mapIsEmpty!24079 mapRes!24079))

(declare-fun b!826279 () Bool)

(assert (=> b!826279 (= e!459966 (= lt!372953 (+!1922 (+!1922 lt!372947 (tuple2!9895 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372946)))))

(declare-fun b!826280 () Bool)

(assert (=> b!826280 (= e!459964 tp_is_empty!14971)))

(declare-fun b!826281 () Bool)

(declare-fun res!563000 () Bool)

(assert (=> b!826281 (=> (not res!563000) (not e!459965))))

(assert (=> b!826281 (= res!563000 (and (= (size!22525 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22526 _keys!976) (size!22525 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71240 res!563001) b!826281))

(assert (= (and b!826281 res!563000) b!826277))

(assert (= (and b!826277 res!563003) b!826272))

(assert (= (and b!826272 res!563004) b!826276))

(assert (= (and b!826276 (not res!563006)) b!826275))

(assert (= (and b!826275 res!563002) b!826279))

(assert (= (and b!826275 res!563005) b!826273))

(assert (= (and b!826278 condMapEmpty!24079) mapIsEmpty!24079))

(assert (= (and b!826278 (not condMapEmpty!24079)) mapNonEmpty!24079))

(get-info :version)

(assert (= (and mapNonEmpty!24079 ((_ is ValueCellFull!7070) mapValue!24079)) b!826280))

(assert (= (and b!826278 ((_ is ValueCellFull!7070) mapDefault!24079)) b!826274))

(assert (= start!71240 b!826278))

(declare-fun m!768783 () Bool)

(assert (=> b!826272 m!768783))

(declare-fun m!768785 () Bool)

(assert (=> b!826276 m!768785))

(declare-fun m!768787 () Bool)

(assert (=> b!826276 m!768787))

(declare-fun m!768789 () Bool)

(assert (=> b!826276 m!768789))

(declare-fun m!768791 () Bool)

(assert (=> b!826273 m!768791))

(assert (=> b!826273 m!768791))

(declare-fun m!768793 () Bool)

(assert (=> b!826273 m!768793))

(declare-fun m!768795 () Bool)

(assert (=> b!826277 m!768795))

(declare-fun m!768797 () Bool)

(assert (=> b!826279 m!768797))

(assert (=> b!826279 m!768797))

(declare-fun m!768799 () Bool)

(assert (=> b!826279 m!768799))

(declare-fun m!768801 () Bool)

(assert (=> b!826275 m!768801))

(declare-fun m!768803 () Bool)

(assert (=> b!826275 m!768803))

(declare-fun m!768805 () Bool)

(assert (=> b!826275 m!768805))

(declare-fun m!768807 () Bool)

(assert (=> b!826275 m!768807))

(assert (=> b!826275 m!768801))

(declare-fun m!768809 () Bool)

(assert (=> b!826275 m!768809))

(declare-fun m!768811 () Bool)

(assert (=> b!826275 m!768811))

(declare-fun m!768813 () Bool)

(assert (=> b!826275 m!768813))

(declare-fun m!768815 () Bool)

(assert (=> b!826275 m!768815))

(assert (=> b!826275 m!768807))

(declare-fun m!768817 () Bool)

(assert (=> b!826275 m!768817))

(declare-fun m!768819 () Bool)

(assert (=> b!826275 m!768819))

(declare-fun m!768821 () Bool)

(assert (=> b!826275 m!768821))

(declare-fun m!768823 () Bool)

(assert (=> start!71240 m!768823))

(declare-fun m!768825 () Bool)

(assert (=> start!71240 m!768825))

(declare-fun m!768827 () Bool)

(assert (=> start!71240 m!768827))

(declare-fun m!768829 () Bool)

(assert (=> mapNonEmpty!24079 m!768829))

(check-sat (not start!71240) (not b!826275) (not mapNonEmpty!24079) (not b!826272) tp_is_empty!14971 b_and!22185 (not b!826279) (not b!826276) (not b_next!13261) (not b!826277) (not b!826273))
(check-sat b_and!22185 (not b_next!13261))
