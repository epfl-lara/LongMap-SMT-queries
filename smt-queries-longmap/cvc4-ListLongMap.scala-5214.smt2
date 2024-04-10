; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70320 () Bool)

(assert start!70320)

(declare-fun b_free!12695 () Bool)

(declare-fun b_next!12695 () Bool)

(assert (=> start!70320 (= b_free!12695 (not b_next!12695))))

(declare-fun tp!44808 () Bool)

(declare-fun b_and!21495 () Bool)

(assert (=> start!70320 (= tp!44808 b_and!21495)))

(declare-fun mapNonEmpty!23197 () Bool)

(declare-fun mapRes!23197 () Bool)

(declare-fun tp!44809 () Bool)

(declare-fun e!453278 () Bool)

(assert (=> mapNonEmpty!23197 (= mapRes!23197 (and tp!44809 e!453278))))

(declare-datatypes ((V!24207 0))(
  ( (V!24208 (val!7250 Int)) )
))
(declare-datatypes ((ValueCell!6787 0))(
  ( (ValueCellFull!6787 (v!9678 V!24207)) (EmptyCell!6787) )
))
(declare-datatypes ((array!45008 0))(
  ( (array!45009 (arr!21561 (Array (_ BitVec 32) ValueCell!6787)) (size!21982 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45008)

(declare-fun mapValue!23197 () ValueCell!6787)

(declare-fun mapRest!23197 () (Array (_ BitVec 32) ValueCell!6787))

(declare-fun mapKey!23197 () (_ BitVec 32))

(assert (=> mapNonEmpty!23197 (= (arr!21561 _values!788) (store mapRest!23197 mapKey!23197 mapValue!23197))))

(declare-fun res!557744 () Bool)

(declare-fun e!453277 () Bool)

(assert (=> start!70320 (=> (not res!557744) (not e!453277))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70320 (= res!557744 (validMask!0 mask!1312))))

(assert (=> start!70320 e!453277))

(declare-fun tp_is_empty!14405 () Bool)

(assert (=> start!70320 tp_is_empty!14405))

(declare-datatypes ((array!45010 0))(
  ( (array!45011 (arr!21562 (Array (_ BitVec 32) (_ BitVec 64))) (size!21983 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45010)

(declare-fun array_inv!17251 (array!45010) Bool)

(assert (=> start!70320 (array_inv!17251 _keys!976)))

(assert (=> start!70320 true))

(declare-fun e!453275 () Bool)

(declare-fun array_inv!17252 (array!45008) Bool)

(assert (=> start!70320 (and (array_inv!17252 _values!788) e!453275)))

(assert (=> start!70320 tp!44808))

(declare-fun b!816975 () Bool)

(assert (=> b!816975 (= e!453278 tp_is_empty!14405)))

(declare-fun b!816976 () Bool)

(declare-fun e!453280 () Bool)

(assert (=> b!816976 (= e!453280 (bvsle #b00000000000000000000000000000000 (size!21983 _keys!976)))))

(declare-fun b!816977 () Bool)

(assert (=> b!816977 (= e!453277 (not e!453280))))

(declare-fun res!557743 () Bool)

(assert (=> b!816977 (=> res!557743 e!453280)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816977 (= res!557743 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9530 0))(
  ( (tuple2!9531 (_1!4776 (_ BitVec 64)) (_2!4776 V!24207)) )
))
(declare-datatypes ((List!15358 0))(
  ( (Nil!15355) (Cons!15354 (h!16483 tuple2!9530) (t!21681 List!15358)) )
))
(declare-datatypes ((ListLongMap!8353 0))(
  ( (ListLongMap!8354 (toList!4192 List!15358)) )
))
(declare-fun lt!365988 () ListLongMap!8353)

(declare-fun lt!365987 () ListLongMap!8353)

(assert (=> b!816977 (= lt!365988 lt!365987)))

(declare-fun zeroValueAfter!34 () V!24207)

(declare-fun minValue!754 () V!24207)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24207)

(declare-datatypes ((Unit!27866 0))(
  ( (Unit!27867) )
))
(declare-fun lt!365989 () Unit!27866)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!343 (array!45010 array!45008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24207 V!24207 V!24207 V!24207 (_ BitVec 32) Int) Unit!27866)

(assert (=> b!816977 (= lt!365989 (lemmaNoChangeToArrayThenSameMapNoExtras!343 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2233 (array!45010 array!45008 (_ BitVec 32) (_ BitVec 32) V!24207 V!24207 (_ BitVec 32) Int) ListLongMap!8353)

(assert (=> b!816977 (= lt!365987 (getCurrentListMapNoExtraKeys!2233 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816977 (= lt!365988 (getCurrentListMapNoExtraKeys!2233 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23197 () Bool)

(assert (=> mapIsEmpty!23197 mapRes!23197))

(declare-fun b!816978 () Bool)

(declare-fun res!557745 () Bool)

(assert (=> b!816978 (=> res!557745 e!453280)))

(declare-fun +!1821 (ListLongMap!8353 tuple2!9530) ListLongMap!8353)

(declare-fun getCurrentListMap!2415 (array!45010 array!45008 (_ BitVec 32) (_ BitVec 32) V!24207 V!24207 (_ BitVec 32) Int) ListLongMap!8353)

(assert (=> b!816978 (= res!557745 (not (= (+!1821 (getCurrentListMap!2415 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2415 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))))

(declare-fun b!816979 () Bool)

(declare-fun res!557740 () Bool)

(assert (=> b!816979 (=> (not res!557740) (not e!453277))))

(declare-datatypes ((List!15359 0))(
  ( (Nil!15356) (Cons!15355 (h!16484 (_ BitVec 64)) (t!21682 List!15359)) )
))
(declare-fun arrayNoDuplicates!0 (array!45010 (_ BitVec 32) List!15359) Bool)

(assert (=> b!816979 (= res!557740 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15356))))

(declare-fun b!816980 () Bool)

(declare-fun e!453279 () Bool)

(assert (=> b!816980 (= e!453279 tp_is_empty!14405)))

(declare-fun b!816981 () Bool)

(assert (=> b!816981 (= e!453275 (and e!453279 mapRes!23197))))

(declare-fun condMapEmpty!23197 () Bool)

(declare-fun mapDefault!23197 () ValueCell!6787)

