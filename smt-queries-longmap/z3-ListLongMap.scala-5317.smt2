; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71122 () Bool)

(assert start!71122)

(declare-fun b_free!13309 () Bool)

(declare-fun b_next!13309 () Bool)

(assert (=> start!71122 (= b_free!13309 (not b_next!13309))))

(declare-fun tp!46686 () Bool)

(declare-fun b_and!22209 () Bool)

(assert (=> start!71122 (= tp!46686 b_and!22209)))

(declare-fun mapNonEmpty!24154 () Bool)

(declare-fun mapRes!24154 () Bool)

(declare-fun tp!46687 () Bool)

(declare-fun e!459947 () Bool)

(assert (=> mapNonEmpty!24154 (= mapRes!24154 (and tp!46687 e!459947))))

(declare-fun mapKey!24154 () (_ BitVec 32))

(declare-datatypes ((V!25027 0))(
  ( (V!25028 (val!7557 Int)) )
))
(declare-datatypes ((ValueCell!7094 0))(
  ( (ValueCellFull!7094 (v!9985 V!25027)) (EmptyCell!7094) )
))
(declare-fun mapValue!24154 () ValueCell!7094)

(declare-datatypes ((array!46185 0))(
  ( (array!46186 (arr!22138 (Array (_ BitVec 32) ValueCell!7094)) (size!22559 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46185)

(declare-fun mapRest!24154 () (Array (_ BitVec 32) ValueCell!7094))

(assert (=> mapNonEmpty!24154 (= (arr!22138 _values!788) (store mapRest!24154 mapKey!24154 mapValue!24154))))

(declare-fun b!826058 () Bool)

(declare-fun res!563160 () Bool)

(declare-fun e!459944 () Bool)

(assert (=> b!826058 (=> (not res!563160) (not e!459944))))

(declare-datatypes ((array!46187 0))(
  ( (array!46188 (arr!22139 (Array (_ BitVec 32) (_ BitVec 64))) (size!22560 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46187)

(declare-datatypes ((List!15810 0))(
  ( (Nil!15807) (Cons!15806 (h!16935 (_ BitVec 64)) (t!22148 List!15810)) )
))
(declare-fun arrayNoDuplicates!0 (array!46187 (_ BitVec 32) List!15810) Bool)

(assert (=> b!826058 (= res!563160 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15807))))

(declare-fun res!563159 () Bool)

(assert (=> start!71122 (=> (not res!563159) (not e!459944))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71122 (= res!563159 (validMask!0 mask!1312))))

(assert (=> start!71122 e!459944))

(declare-fun tp_is_empty!15019 () Bool)

(assert (=> start!71122 tp_is_empty!15019))

(declare-fun array_inv!17715 (array!46187) Bool)

(assert (=> start!71122 (array_inv!17715 _keys!976)))

(assert (=> start!71122 true))

(declare-fun e!459943 () Bool)

(declare-fun array_inv!17716 (array!46185) Bool)

(assert (=> start!71122 (and (array_inv!17716 _values!788) e!459943)))

(assert (=> start!71122 tp!46686))

(declare-fun b!826059 () Bool)

(declare-fun e!459946 () Bool)

(assert (=> b!826059 (= e!459946 true)))

(declare-datatypes ((tuple2!10018 0))(
  ( (tuple2!10019 (_1!5020 (_ BitVec 64)) (_2!5020 V!25027)) )
))
(declare-fun lt!373536 () tuple2!10018)

(declare-datatypes ((List!15811 0))(
  ( (Nil!15808) (Cons!15807 (h!16936 tuple2!10018) (t!22149 List!15811)) )
))
(declare-datatypes ((ListLongMap!8831 0))(
  ( (ListLongMap!8832 (toList!4431 List!15811)) )
))
(declare-fun lt!373535 () ListLongMap!8831)

(declare-fun lt!373532 () ListLongMap!8831)

(declare-fun lt!373531 () tuple2!10018)

(declare-fun +!1966 (ListLongMap!8831 tuple2!10018) ListLongMap!8831)

(assert (=> b!826059 (= lt!373535 (+!1966 (+!1966 lt!373532 lt!373536) lt!373531))))

(declare-fun lt!373541 () ListLongMap!8831)

(declare-fun lt!373538 () ListLongMap!8831)

(declare-fun lt!373530 () ListLongMap!8831)

(assert (=> b!826059 (and (= lt!373541 lt!373538) (= lt!373530 lt!373538) (= lt!373530 lt!373541))))

(declare-fun lt!373537 () ListLongMap!8831)

(assert (=> b!826059 (= lt!373538 (+!1966 lt!373537 lt!373536))))

(declare-fun lt!373542 () ListLongMap!8831)

(assert (=> b!826059 (= lt!373541 (+!1966 lt!373542 lt!373536))))

(declare-fun zeroValueBefore!34 () V!25027)

(declare-fun zeroValueAfter!34 () V!25027)

(declare-datatypes ((Unit!28277 0))(
  ( (Unit!28278) )
))
(declare-fun lt!373543 () Unit!28277)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!232 (ListLongMap!8831 (_ BitVec 64) V!25027 V!25027) Unit!28277)

(assert (=> b!826059 (= lt!373543 (addSameAsAddTwiceSameKeyDiffValues!232 lt!373542 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459948 () Bool)

(assert (=> b!826059 e!459948))

(declare-fun res!563158 () Bool)

(assert (=> b!826059 (=> (not res!563158) (not e!459948))))

(declare-fun lt!373539 () ListLongMap!8831)

(assert (=> b!826059 (= res!563158 (= lt!373539 lt!373537))))

(declare-fun lt!373540 () tuple2!10018)

(assert (=> b!826059 (= lt!373537 (+!1966 lt!373542 lt!373540))))

(assert (=> b!826059 (= lt!373542 (+!1966 lt!373532 lt!373531))))

(assert (=> b!826059 (= lt!373536 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459942 () Bool)

(assert (=> b!826059 e!459942))

(declare-fun res!563157 () Bool)

(assert (=> b!826059 (=> (not res!563157) (not e!459942))))

(assert (=> b!826059 (= res!563157 (= lt!373539 (+!1966 (+!1966 lt!373532 lt!373540) lt!373531)))))

(declare-fun minValue!754 () V!25027)

(assert (=> b!826059 (= lt!373531 (tuple2!10019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826059 (= lt!373540 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2515 (array!46187 array!46185 (_ BitVec 32) (_ BitVec 32) V!25027 V!25027 (_ BitVec 32) Int) ListLongMap!8831)

(assert (=> b!826059 (= lt!373530 (getCurrentListMap!2515 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826059 (= lt!373539 (getCurrentListMap!2515 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826060 () Bool)

(assert (=> b!826060 (= e!459947 tp_is_empty!15019)))

(declare-fun lt!373534 () ListLongMap!8831)

(declare-fun b!826061 () Bool)

(assert (=> b!826061 (= e!459942 (= lt!373530 (+!1966 (+!1966 lt!373534 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373531)))))

(declare-fun b!826062 () Bool)

(assert (=> b!826062 (= e!459944 (not e!459946))))

(declare-fun res!563156 () Bool)

(assert (=> b!826062 (=> res!563156 e!459946)))

(assert (=> b!826062 (= res!563156 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826062 (= lt!373532 lt!373534)))

(declare-fun lt!373533 () Unit!28277)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!560 (array!46187 array!46185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25027 V!25027 V!25027 V!25027 (_ BitVec 32) Int) Unit!28277)

(assert (=> b!826062 (= lt!373533 (lemmaNoChangeToArrayThenSameMapNoExtras!560 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2467 (array!46187 array!46185 (_ BitVec 32) (_ BitVec 32) V!25027 V!25027 (_ BitVec 32) Int) ListLongMap!8831)

(assert (=> b!826062 (= lt!373534 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826062 (= lt!373532 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826063 () Bool)

(declare-fun res!563162 () Bool)

(assert (=> b!826063 (=> (not res!563162) (not e!459944))))

(assert (=> b!826063 (= res!563162 (and (= (size!22559 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22560 _keys!976) (size!22559 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826064 () Bool)

(declare-fun e!459949 () Bool)

(assert (=> b!826064 (= e!459943 (and e!459949 mapRes!24154))))

(declare-fun condMapEmpty!24154 () Bool)

(declare-fun mapDefault!24154 () ValueCell!7094)

(assert (=> b!826064 (= condMapEmpty!24154 (= (arr!22138 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7094)) mapDefault!24154)))))

(declare-fun b!826065 () Bool)

(assert (=> b!826065 (= e!459949 tp_is_empty!15019)))

(declare-fun mapIsEmpty!24154 () Bool)

(assert (=> mapIsEmpty!24154 mapRes!24154))

(declare-fun b!826066 () Bool)

(declare-fun res!563161 () Bool)

(assert (=> b!826066 (=> (not res!563161) (not e!459944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46187 (_ BitVec 32)) Bool)

(assert (=> b!826066 (= res!563161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826067 () Bool)

(assert (=> b!826067 (= e!459948 (= lt!373530 (+!1966 (+!1966 lt!373534 lt!373531) lt!373536)))))

(assert (= (and start!71122 res!563159) b!826063))

(assert (= (and b!826063 res!563162) b!826066))

(assert (= (and b!826066 res!563161) b!826058))

(assert (= (and b!826058 res!563160) b!826062))

(assert (= (and b!826062 (not res!563156)) b!826059))

(assert (= (and b!826059 res!563157) b!826061))

(assert (= (and b!826059 res!563158) b!826067))

(assert (= (and b!826064 condMapEmpty!24154) mapIsEmpty!24154))

(assert (= (and b!826064 (not condMapEmpty!24154)) mapNonEmpty!24154))

(get-info :version)

(assert (= (and mapNonEmpty!24154 ((_ is ValueCellFull!7094) mapValue!24154)) b!826060))

(assert (= (and b!826064 ((_ is ValueCellFull!7094) mapDefault!24154)) b!826065))

(assert (= start!71122 b!826064))

(declare-fun m!768211 () Bool)

(assert (=> b!826061 m!768211))

(assert (=> b!826061 m!768211))

(declare-fun m!768213 () Bool)

(assert (=> b!826061 m!768213))

(declare-fun m!768215 () Bool)

(assert (=> b!826066 m!768215))

(declare-fun m!768217 () Bool)

(assert (=> b!826058 m!768217))

(declare-fun m!768219 () Bool)

(assert (=> mapNonEmpty!24154 m!768219))

(declare-fun m!768221 () Bool)

(assert (=> b!826067 m!768221))

(assert (=> b!826067 m!768221))

(declare-fun m!768223 () Bool)

(assert (=> b!826067 m!768223))

(declare-fun m!768225 () Bool)

(assert (=> b!826059 m!768225))

(declare-fun m!768227 () Bool)

(assert (=> b!826059 m!768227))

(declare-fun m!768229 () Bool)

(assert (=> b!826059 m!768229))

(declare-fun m!768231 () Bool)

(assert (=> b!826059 m!768231))

(declare-fun m!768233 () Bool)

(assert (=> b!826059 m!768233))

(declare-fun m!768235 () Bool)

(assert (=> b!826059 m!768235))

(declare-fun m!768237 () Bool)

(assert (=> b!826059 m!768237))

(assert (=> b!826059 m!768233))

(declare-fun m!768239 () Bool)

(assert (=> b!826059 m!768239))

(declare-fun m!768241 () Bool)

(assert (=> b!826059 m!768241))

(declare-fun m!768243 () Bool)

(assert (=> b!826059 m!768243))

(declare-fun m!768245 () Bool)

(assert (=> b!826059 m!768245))

(assert (=> b!826059 m!768227))

(declare-fun m!768247 () Bool)

(assert (=> start!71122 m!768247))

(declare-fun m!768249 () Bool)

(assert (=> start!71122 m!768249))

(declare-fun m!768251 () Bool)

(assert (=> start!71122 m!768251))

(declare-fun m!768253 () Bool)

(assert (=> b!826062 m!768253))

(declare-fun m!768255 () Bool)

(assert (=> b!826062 m!768255))

(declare-fun m!768257 () Bool)

(assert (=> b!826062 m!768257))

(check-sat tp_is_empty!15019 (not b_next!13309) (not b!826059) (not b!826061) (not start!71122) b_and!22209 (not b!826067) (not b!826062) (not mapNonEmpty!24154) (not b!826066) (not b!826058))
(check-sat b_and!22209 (not b_next!13309))
