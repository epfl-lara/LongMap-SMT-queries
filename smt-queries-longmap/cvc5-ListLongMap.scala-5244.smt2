; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70564 () Bool)

(assert start!70564)

(declare-fun b_free!12871 () Bool)

(declare-fun b_next!12871 () Bool)

(assert (=> start!70564 (= b_free!12871 (not b_next!12871))))

(declare-fun tp!45349 () Bool)

(declare-fun b_and!21713 () Bool)

(assert (=> start!70564 (= tp!45349 b_and!21713)))

(declare-fun res!559340 () Bool)

(declare-fun e!455262 () Bool)

(assert (=> start!70564 (=> (not res!559340) (not e!455262))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70564 (= res!559340 (validMask!0 mask!1312))))

(assert (=> start!70564 e!455262))

(declare-fun tp_is_empty!14581 () Bool)

(assert (=> start!70564 tp_is_empty!14581))

(declare-datatypes ((array!45360 0))(
  ( (array!45361 (arr!21733 (Array (_ BitVec 32) (_ BitVec 64))) (size!22154 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45360)

(declare-fun array_inv!17371 (array!45360) Bool)

(assert (=> start!70564 (array_inv!17371 _keys!976)))

(assert (=> start!70564 true))

(declare-datatypes ((V!24443 0))(
  ( (V!24444 (val!7338 Int)) )
))
(declare-datatypes ((ValueCell!6875 0))(
  ( (ValueCellFull!6875 (v!9768 V!24443)) (EmptyCell!6875) )
))
(declare-datatypes ((array!45362 0))(
  ( (array!45363 (arr!21734 (Array (_ BitVec 32) ValueCell!6875)) (size!22155 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45362)

(declare-fun e!455264 () Bool)

(declare-fun array_inv!17372 (array!45362) Bool)

(assert (=> start!70564 (and (array_inv!17372 _values!788) e!455264)))

(assert (=> start!70564 tp!45349))

(declare-fun b!819710 () Bool)

(declare-fun e!455268 () Bool)

(assert (=> b!819710 (= e!455262 (not e!455268))))

(declare-fun res!559339 () Bool)

(assert (=> b!819710 (=> res!559339 e!455268)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819710 (= res!559339 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9660 0))(
  ( (tuple2!9661 (_1!4841 (_ BitVec 64)) (_2!4841 V!24443)) )
))
(declare-datatypes ((List!15485 0))(
  ( (Nil!15482) (Cons!15481 (h!16610 tuple2!9660) (t!21816 List!15485)) )
))
(declare-datatypes ((ListLongMap!8483 0))(
  ( (ListLongMap!8484 (toList!4257 List!15485)) )
))
(declare-fun lt!368008 () ListLongMap!8483)

(declare-fun lt!368011 () ListLongMap!8483)

(assert (=> b!819710 (= lt!368008 lt!368011)))

(declare-fun zeroValueBefore!34 () V!24443)

(declare-fun zeroValueAfter!34 () V!24443)

(declare-fun minValue!754 () V!24443)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27993 0))(
  ( (Unit!27994) )
))
(declare-fun lt!368013 () Unit!27993)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!398 (array!45360 array!45362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24443 V!24443 V!24443 V!24443 (_ BitVec 32) Int) Unit!27993)

(assert (=> b!819710 (= lt!368013 (lemmaNoChangeToArrayThenSameMapNoExtras!398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2288 (array!45360 array!45362 (_ BitVec 32) (_ BitVec 32) V!24443 V!24443 (_ BitVec 32) Int) ListLongMap!8483)

(assert (=> b!819710 (= lt!368011 (getCurrentListMapNoExtraKeys!2288 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819710 (= lt!368008 (getCurrentListMapNoExtraKeys!2288 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819711 () Bool)

(declare-fun res!559337 () Bool)

(assert (=> b!819711 (=> (not res!559337) (not e!455262))))

(assert (=> b!819711 (= res!559337 (and (= (size!22155 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22154 _keys!976) (size!22155 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819712 () Bool)

(declare-fun e!455265 () Bool)

(assert (=> b!819712 (= e!455265 tp_is_empty!14581)))

(declare-fun b!819713 () Bool)

(declare-fun res!559338 () Bool)

(assert (=> b!819713 (=> (not res!559338) (not e!455262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45360 (_ BitVec 32)) Bool)

(assert (=> b!819713 (= res!559338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819714 () Bool)

(declare-fun mapRes!23473 () Bool)

(assert (=> b!819714 (= e!455264 (and e!455265 mapRes!23473))))

(declare-fun condMapEmpty!23473 () Bool)

(declare-fun mapDefault!23473 () ValueCell!6875)

