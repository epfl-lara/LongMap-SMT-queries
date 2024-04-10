; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70946 () Bool)

(assert start!70946)

(declare-fun b_free!13163 () Bool)

(declare-fun b_next!13163 () Bool)

(assert (=> start!70946 (= b_free!13163 (not b_next!13163))))

(declare-fun tp!46240 () Bool)

(declare-fun b_and!22059 () Bool)

(assert (=> start!70946 (= tp!46240 b_and!22059)))

(declare-fun b!823948 () Bool)

(declare-fun e!458335 () Bool)

(declare-fun tp_is_empty!14873 () Bool)

(assert (=> b!823948 (= e!458335 tp_is_empty!14873)))

(declare-fun b!823949 () Bool)

(declare-fun e!458337 () Bool)

(assert (=> b!823949 (= e!458337 (not true))))

(declare-datatypes ((V!24831 0))(
  ( (V!24832 (val!7484 Int)) )
))
(declare-datatypes ((tuple2!9900 0))(
  ( (tuple2!9901 (_1!4961 (_ BitVec 64)) (_2!4961 V!24831)) )
))
(declare-datatypes ((List!15711 0))(
  ( (Nil!15708) (Cons!15707 (h!16836 tuple2!9900) (t!22052 List!15711)) )
))
(declare-datatypes ((ListLongMap!8723 0))(
  ( (ListLongMap!8724 (toList!4377 List!15711)) )
))
(declare-fun lt!371600 () ListLongMap!8723)

(declare-fun lt!371601 () ListLongMap!8723)

(assert (=> b!823949 (= lt!371600 lt!371601)))

(declare-fun zeroValueBefore!34 () V!24831)

(declare-datatypes ((array!45936 0))(
  ( (array!45937 (arr!22016 (Array (_ BitVec 32) (_ BitVec 64))) (size!22437 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45936)

(declare-datatypes ((Unit!28222 0))(
  ( (Unit!28223) )
))
(declare-fun lt!371602 () Unit!28222)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24831)

(declare-fun minValue!754 () V!24831)

(declare-datatypes ((ValueCell!7021 0))(
  ( (ValueCellFull!7021 (v!9917 V!24831)) (EmptyCell!7021) )
))
(declare-datatypes ((array!45938 0))(
  ( (array!45939 (arr!22017 (Array (_ BitVec 32) ValueCell!7021)) (size!22438 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45938)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!502 (array!45936 array!45938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24831 V!24831 V!24831 V!24831 (_ BitVec 32) Int) Unit!28222)

(assert (=> b!823949 (= lt!371602 (lemmaNoChangeToArrayThenSameMapNoExtras!502 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2392 (array!45936 array!45938 (_ BitVec 32) (_ BitVec 32) V!24831 V!24831 (_ BitVec 32) Int) ListLongMap!8723)

(assert (=> b!823949 (= lt!371601 (getCurrentListMapNoExtraKeys!2392 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823949 (= lt!371600 (getCurrentListMapNoExtraKeys!2392 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23926 () Bool)

(declare-fun mapRes!23926 () Bool)

(declare-fun tp!46239 () Bool)

(declare-fun e!458334 () Bool)

(assert (=> mapNonEmpty!23926 (= mapRes!23926 (and tp!46239 e!458334))))

(declare-fun mapKey!23926 () (_ BitVec 32))

(declare-fun mapRest!23926 () (Array (_ BitVec 32) ValueCell!7021))

(declare-fun mapValue!23926 () ValueCell!7021)

(assert (=> mapNonEmpty!23926 (= (arr!22017 _values!788) (store mapRest!23926 mapKey!23926 mapValue!23926))))

(declare-fun b!823950 () Bool)

(declare-fun res!561810 () Bool)

(assert (=> b!823950 (=> (not res!561810) (not e!458337))))

(declare-datatypes ((List!15712 0))(
  ( (Nil!15709) (Cons!15708 (h!16837 (_ BitVec 64)) (t!22053 List!15712)) )
))
(declare-fun arrayNoDuplicates!0 (array!45936 (_ BitVec 32) List!15712) Bool)

(assert (=> b!823950 (= res!561810 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15709))))

(declare-fun b!823951 () Bool)

(declare-fun e!458336 () Bool)

(assert (=> b!823951 (= e!458336 (and e!458335 mapRes!23926))))

(declare-fun condMapEmpty!23926 () Bool)

(declare-fun mapDefault!23926 () ValueCell!7021)

