; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70518 () Bool)

(assert start!70518)

(declare-fun b_free!12845 () Bool)

(declare-fun b_next!12845 () Bool)

(assert (=> start!70518 (= b_free!12845 (not b_next!12845))))

(declare-fun tp!45268 () Bool)

(declare-fun b_and!21675 () Bool)

(assert (=> start!70518 (= tp!45268 b_and!21675)))

(declare-fun b!819165 () Bool)

(declare-fun e!454868 () Bool)

(assert (=> b!819165 (= e!454868 true)))

(declare-datatypes ((V!24407 0))(
  ( (V!24408 (val!7325 Int)) )
))
(declare-datatypes ((tuple2!9634 0))(
  ( (tuple2!9635 (_1!4828 (_ BitVec 64)) (_2!4828 V!24407)) )
))
(declare-fun lt!367468 () tuple2!9634)

(declare-datatypes ((List!15464 0))(
  ( (Nil!15461) (Cons!15460 (h!16589 tuple2!9634) (t!21793 List!15464)) )
))
(declare-datatypes ((ListLongMap!8457 0))(
  ( (ListLongMap!8458 (toList!4244 List!15464)) )
))
(declare-fun lt!367472 () ListLongMap!8457)

(declare-fun lt!367466 () ListLongMap!8457)

(declare-fun lt!367464 () tuple2!9634)

(declare-fun +!1841 (ListLongMap!8457 tuple2!9634) ListLongMap!8457)

(assert (=> b!819165 (= lt!367472 (+!1841 (+!1841 lt!367466 lt!367468) lt!367464))))

(declare-fun lt!367465 () ListLongMap!8457)

(declare-fun lt!367467 () ListLongMap!8457)

(assert (=> b!819165 (= (+!1841 lt!367465 lt!367464) (+!1841 lt!367467 lt!367464))))

(declare-fun zeroValueBefore!34 () V!24407)

(declare-fun zeroValueAfter!34 () V!24407)

(declare-datatypes ((Unit!27967 0))(
  ( (Unit!27968) )
))
(declare-fun lt!367469 () Unit!27967)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!181 (ListLongMap!8457 (_ BitVec 64) V!24407 V!24407) Unit!27967)

(assert (=> b!819165 (= lt!367469 (addSameAsAddTwiceSameKeyDiffValues!181 lt!367465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819165 (= lt!367464 (tuple2!9635 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454867 () Bool)

(assert (=> b!819165 e!454867))

(declare-fun res!559014 () Bool)

(assert (=> b!819165 (=> (not res!559014) (not e!454867))))

(declare-fun lt!367463 () ListLongMap!8457)

(assert (=> b!819165 (= res!559014 (= lt!367463 lt!367467))))

(assert (=> b!819165 (= lt!367467 (+!1841 lt!367465 lt!367468))))

(assert (=> b!819165 (= lt!367468 (tuple2!9635 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45306 0))(
  ( (array!45307 (arr!21707 (Array (_ BitVec 32) (_ BitVec 64))) (size!22128 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45306)

(declare-fun minValue!754 () V!24407)

(declare-datatypes ((ValueCell!6862 0))(
  ( (ValueCellFull!6862 (v!9754 V!24407)) (EmptyCell!6862) )
))
(declare-datatypes ((array!45308 0))(
  ( (array!45309 (arr!21708 (Array (_ BitVec 32) ValueCell!6862)) (size!22129 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45308)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!367470 () ListLongMap!8457)

(declare-fun getCurrentListMap!2447 (array!45306 array!45308 (_ BitVec 32) (_ BitVec 32) V!24407 V!24407 (_ BitVec 32) Int) ListLongMap!8457)

(assert (=> b!819165 (= lt!367470 (getCurrentListMap!2447 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819165 (= lt!367463 (getCurrentListMap!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819166 () Bool)

(declare-fun e!454865 () Bool)

(assert (=> b!819166 (= e!454865 (not e!454868))))

(declare-fun res!559013 () Bool)

(assert (=> b!819166 (=> res!559013 e!454868)))

(assert (=> b!819166 (= res!559013 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819166 (= lt!367465 lt!367466)))

(declare-fun lt!367471 () Unit!27967)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!388 (array!45306 array!45308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24407 V!24407 V!24407 V!24407 (_ BitVec 32) Int) Unit!27967)

(assert (=> b!819166 (= lt!367471 (lemmaNoChangeToArrayThenSameMapNoExtras!388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2278 (array!45306 array!45308 (_ BitVec 32) (_ BitVec 32) V!24407 V!24407 (_ BitVec 32) Int) ListLongMap!8457)

(assert (=> b!819166 (= lt!367466 (getCurrentListMapNoExtraKeys!2278 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819166 (= lt!367465 (getCurrentListMapNoExtraKeys!2278 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819168 () Bool)

(declare-fun res!559012 () Bool)

(assert (=> b!819168 (=> (not res!559012) (not e!454865))))

(declare-datatypes ((List!15465 0))(
  ( (Nil!15462) (Cons!15461 (h!16590 (_ BitVec 64)) (t!21794 List!15465)) )
))
(declare-fun arrayNoDuplicates!0 (array!45306 (_ BitVec 32) List!15465) Bool)

(assert (=> b!819168 (= res!559012 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15462))))

(declare-fun b!819169 () Bool)

(declare-fun e!454870 () Bool)

(declare-fun e!454866 () Bool)

(declare-fun mapRes!23431 () Bool)

(assert (=> b!819169 (= e!454870 (and e!454866 mapRes!23431))))

(declare-fun condMapEmpty!23431 () Bool)

(declare-fun mapDefault!23431 () ValueCell!6862)

