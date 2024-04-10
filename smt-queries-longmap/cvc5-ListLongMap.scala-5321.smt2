; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71166 () Bool)

(assert start!71166)

(declare-fun b_free!13333 () Bool)

(declare-fun b_next!13333 () Bool)

(assert (=> start!71166 (= b_free!13333 (not b_next!13333))))

(declare-fun tp!46758 () Bool)

(declare-fun b_and!22259 () Bool)

(assert (=> start!71166 (= tp!46758 b_and!22259)))

(declare-datatypes ((V!25059 0))(
  ( (V!25060 (val!7569 Int)) )
))
(declare-datatypes ((tuple2!10030 0))(
  ( (tuple2!10031 (_1!5026 (_ BitVec 64)) (_2!5026 V!25059)) )
))
(declare-fun lt!374280 () tuple2!10030)

(declare-fun e!460385 () Bool)

(declare-datatypes ((List!15827 0))(
  ( (Nil!15824) (Cons!15823 (h!16952 tuple2!10030) (t!22174 List!15827)) )
))
(declare-datatypes ((ListLongMap!8853 0))(
  ( (ListLongMap!8854 (toList!4442 List!15827)) )
))
(declare-fun lt!374281 () ListLongMap!8853)

(declare-fun b!826664 () Bool)

(declare-fun lt!374285 () ListLongMap!8853)

(declare-fun lt!374283 () tuple2!10030)

(declare-fun +!1949 (ListLongMap!8853 tuple2!10030) ListLongMap!8853)

(assert (=> b!826664 (= e!460385 (= lt!374285 (+!1949 (+!1949 lt!374281 lt!374280) lt!374283)))))

(declare-fun b!826665 () Bool)

(declare-fun res!563520 () Bool)

(declare-fun e!460387 () Bool)

(assert (=> b!826665 (=> (not res!563520) (not e!460387))))

(declare-datatypes ((array!46264 0))(
  ( (array!46265 (arr!22177 (Array (_ BitVec 32) (_ BitVec 64))) (size!22598 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46264)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7106 0))(
  ( (ValueCellFull!7106 (v!10003 V!25059)) (EmptyCell!7106) )
))
(declare-datatypes ((array!46266 0))(
  ( (array!46267 (arr!22178 (Array (_ BitVec 32) ValueCell!7106)) (size!22599 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46266)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826665 (= res!563520 (and (= (size!22599 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22598 _keys!976) (size!22599 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826666 () Bool)

(declare-fun res!563516 () Bool)

(assert (=> b!826666 (=> (not res!563516) (not e!460387))))

(declare-datatypes ((List!15828 0))(
  ( (Nil!15825) (Cons!15824 (h!16953 (_ BitVec 64)) (t!22175 List!15828)) )
))
(declare-fun arrayNoDuplicates!0 (array!46264 (_ BitVec 32) List!15828) Bool)

(assert (=> b!826666 (= res!563516 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15825))))

(declare-fun b!826667 () Bool)

(declare-fun e!460384 () Bool)

(assert (=> b!826667 (= e!460387 (not e!460384))))

(declare-fun res!563514 () Bool)

(assert (=> b!826667 (=> res!563514 e!460384)))

(assert (=> b!826667 (= res!563514 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!374284 () ListLongMap!8853)

(assert (=> b!826667 (= lt!374284 lt!374281)))

(declare-fun zeroValueBefore!34 () V!25059)

(declare-fun minValue!754 () V!25059)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!25059)

(declare-datatypes ((Unit!28345 0))(
  ( (Unit!28346) )
))
(declare-fun lt!374278 () Unit!28345)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!557 (array!46264 array!46266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 V!25059 V!25059 (_ BitVec 32) Int) Unit!28345)

(assert (=> b!826667 (= lt!374278 (lemmaNoChangeToArrayThenSameMapNoExtras!557 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2447 (array!46264 array!46266 (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 (_ BitVec 32) Int) ListLongMap!8853)

(assert (=> b!826667 (= lt!374281 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826667 (= lt!374284 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826668 () Bool)

(declare-fun e!460383 () Bool)

(declare-fun tp_is_empty!15043 () Bool)

(assert (=> b!826668 (= e!460383 tp_is_empty!15043)))

(declare-fun b!826669 () Bool)

(assert (=> b!826669 (= e!460384 true)))

(declare-fun lt!374277 () ListLongMap!8853)

(assert (=> b!826669 (= lt!374277 (+!1949 (+!1949 lt!374284 lt!374283) lt!374280))))

(declare-fun lt!374289 () ListLongMap!8853)

(declare-fun lt!374286 () ListLongMap!8853)

(assert (=> b!826669 (and (= lt!374289 lt!374286) (= lt!374285 lt!374286) (= lt!374285 lt!374289))))

(declare-fun lt!374282 () ListLongMap!8853)

(assert (=> b!826669 (= lt!374286 (+!1949 lt!374282 lt!374283))))

(declare-fun lt!374287 () ListLongMap!8853)

(assert (=> b!826669 (= lt!374289 (+!1949 lt!374287 lt!374283))))

(declare-fun lt!374288 () Unit!28345)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!231 (ListLongMap!8853 (_ BitVec 64) V!25059 V!25059) Unit!28345)

(assert (=> b!826669 (= lt!374288 (addSameAsAddTwiceSameKeyDiffValues!231 lt!374287 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826669 e!460385))

(declare-fun res!563515 () Bool)

(assert (=> b!826669 (=> (not res!563515) (not e!460385))))

(declare-fun lt!374279 () ListLongMap!8853)

(assert (=> b!826669 (= res!563515 (= lt!374279 lt!374282))))

(declare-fun lt!374290 () tuple2!10030)

(assert (=> b!826669 (= lt!374282 (+!1949 lt!374287 lt!374290))))

(assert (=> b!826669 (= lt!374287 (+!1949 lt!374284 lt!374280))))

(assert (=> b!826669 (= lt!374283 (tuple2!10031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460381 () Bool)

(assert (=> b!826669 e!460381))

(declare-fun res!563518 () Bool)

(assert (=> b!826669 (=> (not res!563518) (not e!460381))))

(assert (=> b!826669 (= res!563518 (= lt!374279 (+!1949 (+!1949 lt!374284 lt!374290) lt!374280)))))

(assert (=> b!826669 (= lt!374280 (tuple2!10031 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826669 (= lt!374290 (tuple2!10031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2571 (array!46264 array!46266 (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 (_ BitVec 32) Int) ListLongMap!8853)

(assert (=> b!826669 (= lt!374285 (getCurrentListMap!2571 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826669 (= lt!374279 (getCurrentListMap!2571 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826670 () Bool)

(declare-fun e!460382 () Bool)

(assert (=> b!826670 (= e!460382 tp_is_empty!15043)))

(declare-fun res!563519 () Bool)

(assert (=> start!71166 (=> (not res!563519) (not e!460387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71166 (= res!563519 (validMask!0 mask!1312))))

(assert (=> start!71166 e!460387))

(assert (=> start!71166 tp_is_empty!15043))

(declare-fun array_inv!17677 (array!46264) Bool)

(assert (=> start!71166 (array_inv!17677 _keys!976)))

(assert (=> start!71166 true))

(declare-fun e!460386 () Bool)

(declare-fun array_inv!17678 (array!46266) Bool)

(assert (=> start!71166 (and (array_inv!17678 _values!788) e!460386)))

(assert (=> start!71166 tp!46758))

(declare-fun b!826671 () Bool)

(declare-fun res!563517 () Bool)

(assert (=> b!826671 (=> (not res!563517) (not e!460387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46264 (_ BitVec 32)) Bool)

(assert (=> b!826671 (= res!563517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24190 () Bool)

(declare-fun mapRes!24190 () Bool)

(assert (=> mapIsEmpty!24190 mapRes!24190))

(declare-fun b!826672 () Bool)

(assert (=> b!826672 (= e!460381 (= lt!374285 (+!1949 (+!1949 lt!374281 (tuple2!10031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374280)))))

(declare-fun b!826673 () Bool)

(assert (=> b!826673 (= e!460386 (and e!460382 mapRes!24190))))

(declare-fun condMapEmpty!24190 () Bool)

(declare-fun mapDefault!24190 () ValueCell!7106)

