; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71138 () Bool)

(assert start!71138)

(declare-fun b_free!13305 () Bool)

(declare-fun b_next!13305 () Bool)

(assert (=> start!71138 (= b_free!13305 (not b_next!13305))))

(declare-fun tp!46675 () Bool)

(declare-fun b_and!22231 () Bool)

(assert (=> start!71138 (= tp!46675 b_and!22231)))

(declare-fun mapIsEmpty!24148 () Bool)

(declare-fun mapRes!24148 () Bool)

(assert (=> mapIsEmpty!24148 mapRes!24148))

(declare-fun b!826244 () Bool)

(declare-fun e!460045 () Bool)

(declare-fun e!460044 () Bool)

(assert (=> b!826244 (= e!460045 (not e!460044))))

(declare-fun res!563226 () Bool)

(assert (=> b!826244 (=> res!563226 e!460044)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826244 (= res!563226 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!25021 0))(
  ( (V!25022 (val!7555 Int)) )
))
(declare-datatypes ((tuple2!10008 0))(
  ( (tuple2!10009 (_1!5015 (_ BitVec 64)) (_2!5015 V!25021)) )
))
(declare-datatypes ((List!15807 0))(
  ( (Nil!15804) (Cons!15803 (h!16932 tuple2!10008) (t!22154 List!15807)) )
))
(declare-datatypes ((ListLongMap!8831 0))(
  ( (ListLongMap!8832 (toList!4431 List!15807)) )
))
(declare-fun lt!373689 () ListLongMap!8831)

(declare-fun lt!373695 () ListLongMap!8831)

(assert (=> b!826244 (= lt!373689 lt!373695)))

(declare-datatypes ((Unit!28325 0))(
  ( (Unit!28326) )
))
(declare-fun lt!373690 () Unit!28325)

(declare-fun zeroValueBefore!34 () V!25021)

(declare-datatypes ((array!46212 0))(
  ( (array!46213 (arr!22151 (Array (_ BitVec 32) (_ BitVec 64))) (size!22572 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46212)

(declare-fun zeroValueAfter!34 () V!25021)

(declare-fun minValue!754 () V!25021)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!7092 0))(
  ( (ValueCellFull!7092 (v!9989 V!25021)) (EmptyCell!7092) )
))
(declare-datatypes ((array!46214 0))(
  ( (array!46215 (arr!22152 (Array (_ BitVec 32) ValueCell!7092)) (size!22573 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46214)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!549 (array!46212 array!46214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25021 V!25021 V!25021 V!25021 (_ BitVec 32) Int) Unit!28325)

(assert (=> b!826244 (= lt!373690 (lemmaNoChangeToArrayThenSameMapNoExtras!549 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2439 (array!46212 array!46214 (_ BitVec 32) (_ BitVec 32) V!25021 V!25021 (_ BitVec 32) Int) ListLongMap!8831)

(assert (=> b!826244 (= lt!373695 (getCurrentListMapNoExtraKeys!2439 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826244 (= lt!373689 (getCurrentListMapNoExtraKeys!2439 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826245 () Bool)

(assert (=> b!826245 (= e!460044 true)))

(declare-fun lt!373694 () tuple2!10008)

(declare-fun lt!373700 () ListLongMap!8831)

(declare-fun lt!373696 () tuple2!10008)

(declare-fun +!1938 (ListLongMap!8831 tuple2!10008) ListLongMap!8831)

(assert (=> b!826245 (= lt!373700 (+!1938 (+!1938 lt!373689 lt!373694) lt!373696))))

(declare-fun lt!373701 () ListLongMap!8831)

(declare-fun lt!373698 () ListLongMap!8831)

(declare-fun lt!373692 () ListLongMap!8831)

(assert (=> b!826245 (and (= lt!373701 lt!373698) (= lt!373692 lt!373698) (= lt!373692 lt!373701))))

(declare-fun lt!373693 () ListLongMap!8831)

(assert (=> b!826245 (= lt!373698 (+!1938 lt!373693 lt!373694))))

(declare-fun lt!373691 () ListLongMap!8831)

(assert (=> b!826245 (= lt!373701 (+!1938 lt!373691 lt!373694))))

(declare-fun lt!373697 () Unit!28325)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!221 (ListLongMap!8831 (_ BitVec 64) V!25021 V!25021) Unit!28325)

(assert (=> b!826245 (= lt!373697 (addSameAsAddTwiceSameKeyDiffValues!221 lt!373691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460049 () Bool)

(assert (=> b!826245 e!460049))

(declare-fun res!563225 () Bool)

(assert (=> b!826245 (=> (not res!563225) (not e!460049))))

(declare-fun lt!373699 () ListLongMap!8831)

(assert (=> b!826245 (= res!563225 (= lt!373699 lt!373693))))

(declare-fun lt!373702 () tuple2!10008)

(assert (=> b!826245 (= lt!373693 (+!1938 lt!373691 lt!373702))))

(assert (=> b!826245 (= lt!373691 (+!1938 lt!373689 lt!373696))))

(assert (=> b!826245 (= lt!373694 (tuple2!10009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460050 () Bool)

(assert (=> b!826245 e!460050))

(declare-fun res!563223 () Bool)

(assert (=> b!826245 (=> (not res!563223) (not e!460050))))

(assert (=> b!826245 (= res!563223 (= lt!373699 (+!1938 (+!1938 lt!373689 lt!373702) lt!373696)))))

(assert (=> b!826245 (= lt!373696 (tuple2!10009 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826245 (= lt!373702 (tuple2!10009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2561 (array!46212 array!46214 (_ BitVec 32) (_ BitVec 32) V!25021 V!25021 (_ BitVec 32) Int) ListLongMap!8831)

(assert (=> b!826245 (= lt!373692 (getCurrentListMap!2561 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826245 (= lt!373699 (getCurrentListMap!2561 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826246 () Bool)

(declare-fun e!460051 () Bool)

(declare-fun tp_is_empty!15015 () Bool)

(assert (=> b!826246 (= e!460051 tp_is_empty!15015)))

(declare-fun mapNonEmpty!24148 () Bool)

(declare-fun tp!46674 () Bool)

(declare-fun e!460048 () Bool)

(assert (=> mapNonEmpty!24148 (= mapRes!24148 (and tp!46674 e!460048))))

(declare-fun mapRest!24148 () (Array (_ BitVec 32) ValueCell!7092))

(declare-fun mapValue!24148 () ValueCell!7092)

(declare-fun mapKey!24148 () (_ BitVec 32))

(assert (=> mapNonEmpty!24148 (= (arr!22152 _values!788) (store mapRest!24148 mapKey!24148 mapValue!24148))))

(declare-fun b!826247 () Bool)

(declare-fun res!563222 () Bool)

(assert (=> b!826247 (=> (not res!563222) (not e!460045))))

(declare-datatypes ((List!15808 0))(
  ( (Nil!15805) (Cons!15804 (h!16933 (_ BitVec 64)) (t!22155 List!15808)) )
))
(declare-fun arrayNoDuplicates!0 (array!46212 (_ BitVec 32) List!15808) Bool)

(assert (=> b!826247 (= res!563222 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15805))))

(declare-fun b!826248 () Bool)

(declare-fun res!563224 () Bool)

(assert (=> b!826248 (=> (not res!563224) (not e!460045))))

(assert (=> b!826248 (= res!563224 (and (= (size!22573 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22572 _keys!976) (size!22573 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826249 () Bool)

(assert (=> b!826249 (= e!460048 tp_is_empty!15015)))

(declare-fun b!826251 () Bool)

(declare-fun e!460047 () Bool)

(assert (=> b!826251 (= e!460047 (and e!460051 mapRes!24148))))

(declare-fun condMapEmpty!24148 () Bool)

(declare-fun mapDefault!24148 () ValueCell!7092)

(assert (=> b!826251 (= condMapEmpty!24148 (= (arr!22152 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7092)) mapDefault!24148)))))

(declare-fun b!826252 () Bool)

(assert (=> b!826252 (= e!460050 (= lt!373692 (+!1938 (+!1938 lt!373695 (tuple2!10009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373696)))))

(declare-fun b!826253 () Bool)

(declare-fun res!563220 () Bool)

(assert (=> b!826253 (=> (not res!563220) (not e!460045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46212 (_ BitVec 32)) Bool)

(assert (=> b!826253 (= res!563220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563221 () Bool)

(assert (=> start!71138 (=> (not res!563221) (not e!460045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71138 (= res!563221 (validMask!0 mask!1312))))

(assert (=> start!71138 e!460045))

(assert (=> start!71138 tp_is_empty!15015))

(declare-fun array_inv!17659 (array!46212) Bool)

(assert (=> start!71138 (array_inv!17659 _keys!976)))

(assert (=> start!71138 true))

(declare-fun array_inv!17660 (array!46214) Bool)

(assert (=> start!71138 (and (array_inv!17660 _values!788) e!460047)))

(assert (=> start!71138 tp!46675))

(declare-fun b!826250 () Bool)

(assert (=> b!826250 (= e!460049 (= lt!373692 (+!1938 (+!1938 lt!373695 lt!373696) lt!373694)))))

(assert (= (and start!71138 res!563221) b!826248))

(assert (= (and b!826248 res!563224) b!826253))

(assert (= (and b!826253 res!563220) b!826247))

(assert (= (and b!826247 res!563222) b!826244))

(assert (= (and b!826244 (not res!563226)) b!826245))

(assert (= (and b!826245 res!563223) b!826252))

(assert (= (and b!826245 res!563225) b!826250))

(assert (= (and b!826251 condMapEmpty!24148) mapIsEmpty!24148))

(assert (= (and b!826251 (not condMapEmpty!24148)) mapNonEmpty!24148))

(get-info :version)

(assert (= (and mapNonEmpty!24148 ((_ is ValueCellFull!7092) mapValue!24148)) b!826249))

(assert (= (and b!826251 ((_ is ValueCellFull!7092) mapDefault!24148)) b!826246))

(assert (= start!71138 b!826251))

(declare-fun m!768867 () Bool)

(assert (=> mapNonEmpty!24148 m!768867))

(declare-fun m!768869 () Bool)

(assert (=> b!826250 m!768869))

(assert (=> b!826250 m!768869))

(declare-fun m!768871 () Bool)

(assert (=> b!826250 m!768871))

(declare-fun m!768873 () Bool)

(assert (=> start!71138 m!768873))

(declare-fun m!768875 () Bool)

(assert (=> start!71138 m!768875))

(declare-fun m!768877 () Bool)

(assert (=> start!71138 m!768877))

(declare-fun m!768879 () Bool)

(assert (=> b!826244 m!768879))

(declare-fun m!768881 () Bool)

(assert (=> b!826244 m!768881))

(declare-fun m!768883 () Bool)

(assert (=> b!826244 m!768883))

(declare-fun m!768885 () Bool)

(assert (=> b!826252 m!768885))

(assert (=> b!826252 m!768885))

(declare-fun m!768887 () Bool)

(assert (=> b!826252 m!768887))

(declare-fun m!768889 () Bool)

(assert (=> b!826245 m!768889))

(declare-fun m!768891 () Bool)

(assert (=> b!826245 m!768891))

(declare-fun m!768893 () Bool)

(assert (=> b!826245 m!768893))

(declare-fun m!768895 () Bool)

(assert (=> b!826245 m!768895))

(declare-fun m!768897 () Bool)

(assert (=> b!826245 m!768897))

(assert (=> b!826245 m!768891))

(declare-fun m!768899 () Bool)

(assert (=> b!826245 m!768899))

(declare-fun m!768901 () Bool)

(assert (=> b!826245 m!768901))

(declare-fun m!768903 () Bool)

(assert (=> b!826245 m!768903))

(declare-fun m!768905 () Bool)

(assert (=> b!826245 m!768905))

(declare-fun m!768907 () Bool)

(assert (=> b!826245 m!768907))

(assert (=> b!826245 m!768901))

(declare-fun m!768909 () Bool)

(assert (=> b!826245 m!768909))

(declare-fun m!768911 () Bool)

(assert (=> b!826247 m!768911))

(declare-fun m!768913 () Bool)

(assert (=> b!826253 m!768913))

(check-sat (not b!826244) (not b!826245) (not start!71138) (not b!826252) tp_is_empty!15015 (not b!826250) (not mapNonEmpty!24148) (not b!826253) (not b!826247) (not b_next!13305) b_and!22231)
(check-sat b_and!22231 (not b_next!13305))
