; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71172 () Bool)

(assert start!71172)

(declare-fun b_free!13339 () Bool)

(declare-fun b_next!13339 () Bool)

(assert (=> start!71172 (= b_free!13339 (not b_next!13339))))

(declare-fun tp!46777 () Bool)

(declare-fun b_and!22265 () Bool)

(assert (=> start!71172 (= tp!46777 b_and!22265)))

(declare-fun b!826754 () Bool)

(declare-fun e!460457 () Bool)

(assert (=> b!826754 (= e!460457 true)))

(declare-datatypes ((V!25067 0))(
  ( (V!25068 (val!7572 Int)) )
))
(declare-datatypes ((tuple2!10034 0))(
  ( (tuple2!10035 (_1!5028 (_ BitVec 64)) (_2!5028 V!25067)) )
))
(declare-datatypes ((List!15832 0))(
  ( (Nil!15829) (Cons!15828 (h!16957 tuple2!10034) (t!22179 List!15832)) )
))
(declare-datatypes ((ListLongMap!8857 0))(
  ( (ListLongMap!8858 (toList!4444 List!15832)) )
))
(declare-fun lt!374403 () ListLongMap!8857)

(declare-fun lt!374404 () tuple2!10034)

(declare-fun lt!374416 () ListLongMap!8857)

(declare-fun lt!374409 () tuple2!10034)

(declare-fun +!1951 (ListLongMap!8857 tuple2!10034) ListLongMap!8857)

(assert (=> b!826754 (= lt!374416 (+!1951 (+!1951 lt!374403 lt!374409) lt!374404))))

(declare-fun lt!374413 () ListLongMap!8857)

(declare-fun lt!374412 () ListLongMap!8857)

(declare-fun lt!374406 () ListLongMap!8857)

(assert (=> b!826754 (and (= lt!374413 lt!374412) (= lt!374406 lt!374412) (= lt!374406 lt!374413))))

(declare-fun lt!374415 () ListLongMap!8857)

(assert (=> b!826754 (= lt!374412 (+!1951 lt!374415 lt!374409))))

(declare-fun lt!374411 () ListLongMap!8857)

(assert (=> b!826754 (= lt!374413 (+!1951 lt!374411 lt!374409))))

(declare-fun zeroValueBefore!34 () V!25067)

(declare-fun zeroValueAfter!34 () V!25067)

(declare-datatypes ((Unit!28349 0))(
  ( (Unit!28350) )
))
(declare-fun lt!374408 () Unit!28349)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!233 (ListLongMap!8857 (_ BitVec 64) V!25067 V!25067) Unit!28349)

(assert (=> b!826754 (= lt!374408 (addSameAsAddTwiceSameKeyDiffValues!233 lt!374411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460454 () Bool)

(assert (=> b!826754 e!460454))

(declare-fun res!563583 () Bool)

(assert (=> b!826754 (=> (not res!563583) (not e!460454))))

(declare-fun lt!374410 () ListLongMap!8857)

(assert (=> b!826754 (= res!563583 (= lt!374410 lt!374415))))

(declare-fun lt!374405 () tuple2!10034)

(assert (=> b!826754 (= lt!374415 (+!1951 lt!374411 lt!374405))))

(assert (=> b!826754 (= lt!374411 (+!1951 lt!374403 lt!374404))))

(assert (=> b!826754 (= lt!374409 (tuple2!10035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460456 () Bool)

(assert (=> b!826754 e!460456))

(declare-fun res!563580 () Bool)

(assert (=> b!826754 (=> (not res!563580) (not e!460456))))

(assert (=> b!826754 (= res!563580 (= lt!374410 (+!1951 (+!1951 lt!374403 lt!374405) lt!374404)))))

(declare-fun minValue!754 () V!25067)

(assert (=> b!826754 (= lt!374404 (tuple2!10035 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826754 (= lt!374405 (tuple2!10035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46276 0))(
  ( (array!46277 (arr!22183 (Array (_ BitVec 32) (_ BitVec 64))) (size!22604 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46276)

(declare-datatypes ((ValueCell!7109 0))(
  ( (ValueCellFull!7109 (v!10006 V!25067)) (EmptyCell!7109) )
))
(declare-datatypes ((array!46278 0))(
  ( (array!46279 (arr!22184 (Array (_ BitVec 32) ValueCell!7109)) (size!22605 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46278)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2573 (array!46276 array!46278 (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 (_ BitVec 32) Int) ListLongMap!8857)

(assert (=> b!826754 (= lt!374406 (getCurrentListMap!2573 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826754 (= lt!374410 (getCurrentListMap!2573 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826755 () Bool)

(declare-fun e!460458 () Bool)

(assert (=> b!826755 (= e!460458 (not e!460457))))

(declare-fun res!563577 () Bool)

(assert (=> b!826755 (=> res!563577 e!460457)))

(assert (=> b!826755 (= res!563577 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!374414 () ListLongMap!8857)

(assert (=> b!826755 (= lt!374403 lt!374414)))

(declare-fun lt!374407 () Unit!28349)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!559 (array!46276 array!46278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 V!25067 V!25067 (_ BitVec 32) Int) Unit!28349)

(assert (=> b!826755 (= lt!374407 (lemmaNoChangeToArrayThenSameMapNoExtras!559 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2449 (array!46276 array!46278 (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 (_ BitVec 32) Int) ListLongMap!8857)

(assert (=> b!826755 (= lt!374414 (getCurrentListMapNoExtraKeys!2449 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826755 (= lt!374403 (getCurrentListMapNoExtraKeys!2449 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826756 () Bool)

(declare-fun res!563579 () Bool)

(assert (=> b!826756 (=> (not res!563579) (not e!460458))))

(declare-datatypes ((List!15833 0))(
  ( (Nil!15830) (Cons!15829 (h!16958 (_ BitVec 64)) (t!22180 List!15833)) )
))
(declare-fun arrayNoDuplicates!0 (array!46276 (_ BitVec 32) List!15833) Bool)

(assert (=> b!826756 (= res!563579 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15830))))

(declare-fun b!826757 () Bool)

(declare-fun e!460455 () Bool)

(declare-fun e!460459 () Bool)

(declare-fun mapRes!24199 () Bool)

(assert (=> b!826757 (= e!460455 (and e!460459 mapRes!24199))))

(declare-fun condMapEmpty!24199 () Bool)

(declare-fun mapDefault!24199 () ValueCell!7109)

