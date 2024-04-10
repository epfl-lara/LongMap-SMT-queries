; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71322 () Bool)

(assert start!71322)

(declare-fun b_free!13439 () Bool)

(declare-fun b_next!13439 () Bool)

(assert (=> start!71322 (= b_free!13439 (not b_next!13439))))

(declare-fun tp!47085 () Bool)

(declare-fun b_and!22397 () Bool)

(assert (=> start!71322 (= tp!47085 b_and!22397)))

(declare-fun res!564460 () Bool)

(declare-fun e!461572 () Bool)

(assert (=> start!71322 (=> (not res!564460) (not e!461572))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71322 (= res!564460 (validMask!0 mask!1312))))

(assert (=> start!71322 e!461572))

(declare-fun tp_is_empty!15149 () Bool)

(assert (=> start!71322 tp_is_empty!15149))

(declare-datatypes ((array!46462 0))(
  ( (array!46463 (arr!22273 (Array (_ BitVec 32) (_ BitVec 64))) (size!22694 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46462)

(declare-fun array_inv!17743 (array!46462) Bool)

(assert (=> start!71322 (array_inv!17743 _keys!976)))

(assert (=> start!71322 true))

(declare-datatypes ((V!25199 0))(
  ( (V!25200 (val!7622 Int)) )
))
(declare-datatypes ((ValueCell!7159 0))(
  ( (ValueCellFull!7159 (v!10058 V!25199)) (EmptyCell!7159) )
))
(declare-datatypes ((array!46464 0))(
  ( (array!46465 (arr!22274 (Array (_ BitVec 32) ValueCell!7159)) (size!22695 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46464)

(declare-fun e!461576 () Bool)

(declare-fun array_inv!17744 (array!46464) Bool)

(assert (=> start!71322 (and (array_inv!17744 _values!788) e!461576)))

(assert (=> start!71322 tp!47085))

(declare-fun mapIsEmpty!24358 () Bool)

(declare-fun mapRes!24358 () Bool)

(assert (=> mapIsEmpty!24358 mapRes!24358))

(declare-fun mapNonEmpty!24358 () Bool)

(declare-fun tp!47086 () Bool)

(declare-fun e!461574 () Bool)

(assert (=> mapNonEmpty!24358 (= mapRes!24358 (and tp!47086 e!461574))))

(declare-fun mapValue!24358 () ValueCell!7159)

(declare-fun mapKey!24358 () (_ BitVec 32))

(declare-fun mapRest!24358 () (Array (_ BitVec 32) ValueCell!7159))

(assert (=> mapNonEmpty!24358 (= (arr!22274 _values!788) (store mapRest!24358 mapKey!24358 mapValue!24358))))

(declare-fun b!828344 () Bool)

(declare-fun res!564459 () Bool)

(assert (=> b!828344 (=> (not res!564459) (not e!461572))))

(declare-datatypes ((List!15898 0))(
  ( (Nil!15895) (Cons!15894 (h!17023 (_ BitVec 64)) (t!22251 List!15898)) )
))
(declare-fun arrayNoDuplicates!0 (array!46462 (_ BitVec 32) List!15898) Bool)

(assert (=> b!828344 (= res!564459 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15895))))

(declare-fun b!828345 () Bool)

(declare-fun e!461571 () Bool)

(assert (=> b!828345 (= e!461572 (not e!461571))))

(declare-fun res!564462 () Bool)

(assert (=> b!828345 (=> res!564462 e!461571)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828345 (= res!564462 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10106 0))(
  ( (tuple2!10107 (_1!5064 (_ BitVec 64)) (_2!5064 V!25199)) )
))
(declare-datatypes ((List!15899 0))(
  ( (Nil!15896) (Cons!15895 (h!17024 tuple2!10106) (t!22252 List!15899)) )
))
(declare-datatypes ((ListLongMap!8929 0))(
  ( (ListLongMap!8930 (toList!4480 List!15899)) )
))
(declare-fun lt!375314 () ListLongMap!8929)

(declare-fun lt!375311 () ListLongMap!8929)

(assert (=> b!828345 (= lt!375314 lt!375311)))

(declare-fun zeroValueBefore!34 () V!25199)

(declare-fun zeroValueAfter!34 () V!25199)

(declare-fun minValue!754 () V!25199)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28379 0))(
  ( (Unit!28380) )
))
(declare-fun lt!375312 () Unit!28379)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!570 (array!46462 array!46464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25199 V!25199 V!25199 V!25199 (_ BitVec 32) Int) Unit!28379)

(assert (=> b!828345 (= lt!375312 (lemmaNoChangeToArrayThenSameMapNoExtras!570 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2482 (array!46462 array!46464 (_ BitVec 32) (_ BitVec 32) V!25199 V!25199 (_ BitVec 32) Int) ListLongMap!8929)

(assert (=> b!828345 (= lt!375311 (getCurrentListMapNoExtraKeys!2482 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828345 (= lt!375314 (getCurrentListMapNoExtraKeys!2482 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828346 () Bool)

(declare-fun e!461573 () Bool)

(assert (=> b!828346 (= e!461576 (and e!461573 mapRes!24358))))

(declare-fun condMapEmpty!24358 () Bool)

(declare-fun mapDefault!24358 () ValueCell!7159)

