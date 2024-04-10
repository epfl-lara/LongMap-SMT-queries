; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70500 () Bool)

(assert start!70500)

(declare-fun b_free!12827 () Bool)

(declare-fun b_next!12827 () Bool)

(assert (=> start!70500 (= b_free!12827 (not b_next!12827))))

(declare-fun tp!45214 () Bool)

(declare-fun b_and!21657 () Bool)

(assert (=> start!70500 (= tp!45214 b_and!21657)))

(declare-fun b!818922 () Bool)

(declare-fun res!558848 () Bool)

(declare-fun e!454679 () Bool)

(assert (=> b!818922 (=> (not res!558848) (not e!454679))))

(declare-datatypes ((array!45272 0))(
  ( (array!45273 (arr!21690 (Array (_ BitVec 32) (_ BitVec 64))) (size!22111 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45272)

(declare-datatypes ((List!15451 0))(
  ( (Nil!15448) (Cons!15447 (h!16576 (_ BitVec 64)) (t!21780 List!15451)) )
))
(declare-fun arrayNoDuplicates!0 (array!45272 (_ BitVec 32) List!15451) Bool)

(assert (=> b!818922 (= res!558848 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15448))))

(declare-fun b!818923 () Bool)

(declare-fun e!454681 () Bool)

(declare-fun tp_is_empty!14537 () Bool)

(assert (=> b!818923 (= e!454681 tp_is_empty!14537)))

(declare-fun b!818924 () Bool)

(declare-fun e!454680 () Bool)

(assert (=> b!818924 (= e!454680 true)))

(declare-datatypes ((V!24383 0))(
  ( (V!24384 (val!7316 Int)) )
))
(declare-datatypes ((tuple2!9620 0))(
  ( (tuple2!9621 (_1!4821 (_ BitVec 64)) (_2!4821 V!24383)) )
))
(declare-datatypes ((List!15452 0))(
  ( (Nil!15449) (Cons!15448 (h!16577 tuple2!9620) (t!21781 List!15452)) )
))
(declare-datatypes ((ListLongMap!8443 0))(
  ( (ListLongMap!8444 (toList!4237 List!15452)) )
))
(declare-fun lt!367201 () ListLongMap!8443)

(declare-fun lt!367197 () tuple2!9620)

(declare-fun lt!367193 () ListLongMap!8443)

(declare-fun lt!367198 () tuple2!9620)

(declare-fun +!1834 (ListLongMap!8443 tuple2!9620) ListLongMap!8443)

(assert (=> b!818924 (= lt!367201 (+!1834 (+!1834 lt!367193 lt!367198) lt!367197))))

(declare-fun lt!367195 () ListLongMap!8443)

(declare-fun lt!367196 () ListLongMap!8443)

(assert (=> b!818924 (= (+!1834 lt!367195 lt!367197) (+!1834 lt!367196 lt!367197))))

(declare-fun zeroValueBefore!34 () V!24383)

(declare-datatypes ((Unit!27955 0))(
  ( (Unit!27956) )
))
(declare-fun lt!367202 () Unit!27955)

(declare-fun zeroValueAfter!34 () V!24383)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!175 (ListLongMap!8443 (_ BitVec 64) V!24383 V!24383) Unit!27955)

(assert (=> b!818924 (= lt!367202 (addSameAsAddTwiceSameKeyDiffValues!175 lt!367195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818924 (= lt!367197 (tuple2!9621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454676 () Bool)

(assert (=> b!818924 e!454676))

(declare-fun res!558851 () Bool)

(assert (=> b!818924 (=> (not res!558851) (not e!454676))))

(declare-fun lt!367199 () ListLongMap!8443)

(assert (=> b!818924 (= res!558851 (= lt!367199 lt!367196))))

(assert (=> b!818924 (= lt!367196 (+!1834 lt!367195 lt!367198))))

(assert (=> b!818924 (= lt!367198 (tuple2!9621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24383)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6853 0))(
  ( (ValueCellFull!6853 (v!9745 V!24383)) (EmptyCell!6853) )
))
(declare-datatypes ((array!45274 0))(
  ( (array!45275 (arr!21691 (Array (_ BitVec 32) ValueCell!6853)) (size!22112 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45274)

(declare-fun lt!367200 () ListLongMap!8443)

(declare-fun getCurrentListMap!2441 (array!45272 array!45274 (_ BitVec 32) (_ BitVec 32) V!24383 V!24383 (_ BitVec 32) Int) ListLongMap!8443)

(assert (=> b!818924 (= lt!367200 (getCurrentListMap!2441 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818924 (= lt!367199 (getCurrentListMap!2441 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818925 () Bool)

(declare-fun e!454678 () Bool)

(declare-fun mapRes!23404 () Bool)

(assert (=> b!818925 (= e!454678 (and e!454681 mapRes!23404))))

(declare-fun condMapEmpty!23404 () Bool)

(declare-fun mapDefault!23404 () ValueCell!6853)

