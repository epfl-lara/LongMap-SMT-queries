; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70028 () Bool)

(assert start!70028)

(declare-fun b_free!12449 () Bool)

(declare-fun b_next!12449 () Bool)

(assert (=> start!70028 (= b_free!12449 (not b_next!12449))))

(declare-fun tp!44062 () Bool)

(declare-fun b_and!21221 () Bool)

(assert (=> start!70028 (= tp!44062 b_and!21221)))

(declare-fun b!813869 () Bool)

(declare-fun res!555951 () Bool)

(declare-fun e!451053 () Bool)

(assert (=> b!813869 (=> (not res!555951) (not e!451053))))

(declare-datatypes ((array!44526 0))(
  ( (array!44527 (arr!21323 (Array (_ BitVec 32) (_ BitVec 64))) (size!21744 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44526)

(declare-datatypes ((List!15170 0))(
  ( (Nil!15167) (Cons!15166 (h!16295 (_ BitVec 64)) (t!21487 List!15170)) )
))
(declare-fun arrayNoDuplicates!0 (array!44526 (_ BitVec 32) List!15170) Bool)

(assert (=> b!813869 (= res!555951 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15167))))

(declare-fun b!813870 () Bool)

(assert (=> b!813870 (= e!451053 false)))

(declare-datatypes ((V!23879 0))(
  ( (V!23880 (val!7127 Int)) )
))
(declare-datatypes ((tuple2!9336 0))(
  ( (tuple2!9337 (_1!4679 (_ BitVec 64)) (_2!4679 V!23879)) )
))
(declare-datatypes ((List!15171 0))(
  ( (Nil!15168) (Cons!15167 (h!16296 tuple2!9336) (t!21488 List!15171)) )
))
(declare-datatypes ((ListLongMap!8159 0))(
  ( (ListLongMap!8160 (toList!4095 List!15171)) )
))
(declare-fun lt!364419 () ListLongMap!8159)

(declare-fun zeroValueAfter!34 () V!23879)

(declare-fun minValue!754 () V!23879)

(declare-datatypes ((ValueCell!6664 0))(
  ( (ValueCellFull!6664 (v!9554 V!23879)) (EmptyCell!6664) )
))
(declare-datatypes ((array!44528 0))(
  ( (array!44529 (arr!21324 (Array (_ BitVec 32) ValueCell!6664)) (size!21745 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44528)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2145 (array!44526 array!44528 (_ BitVec 32) (_ BitVec 32) V!23879 V!23879 (_ BitVec 32) Int) ListLongMap!8159)

(assert (=> b!813870 (= lt!364419 (getCurrentListMapNoExtraKeys!2145 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23879)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364418 () ListLongMap!8159)

(assert (=> b!813870 (= lt!364418 (getCurrentListMapNoExtraKeys!2145 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813871 () Bool)

(declare-fun e!451051 () Bool)

(declare-fun tp_is_empty!14159 () Bool)

(assert (=> b!813871 (= e!451051 tp_is_empty!14159)))

(declare-fun b!813872 () Bool)

(declare-fun res!555953 () Bool)

(assert (=> b!813872 (=> (not res!555953) (not e!451053))))

(assert (=> b!813872 (= res!555953 (and (= (size!21745 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21744 _keys!976) (size!21745 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22819 () Bool)

(declare-fun mapRes!22819 () Bool)

(declare-fun tp!44061 () Bool)

(declare-fun e!451049 () Bool)

(assert (=> mapNonEmpty!22819 (= mapRes!22819 (and tp!44061 e!451049))))

(declare-fun mapValue!22819 () ValueCell!6664)

(declare-fun mapKey!22819 () (_ BitVec 32))

(declare-fun mapRest!22819 () (Array (_ BitVec 32) ValueCell!6664))

(assert (=> mapNonEmpty!22819 (= (arr!21324 _values!788) (store mapRest!22819 mapKey!22819 mapValue!22819))))

(declare-fun b!813873 () Bool)

(assert (=> b!813873 (= e!451049 tp_is_empty!14159)))

(declare-fun mapIsEmpty!22819 () Bool)

(assert (=> mapIsEmpty!22819 mapRes!22819))

(declare-fun res!555954 () Bool)

(assert (=> start!70028 (=> (not res!555954) (not e!451053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70028 (= res!555954 (validMask!0 mask!1312))))

(assert (=> start!70028 e!451053))

(assert (=> start!70028 tp_is_empty!14159))

(declare-fun array_inv!17075 (array!44526) Bool)

(assert (=> start!70028 (array_inv!17075 _keys!976)))

(assert (=> start!70028 true))

(declare-fun e!451052 () Bool)

(declare-fun array_inv!17076 (array!44528) Bool)

(assert (=> start!70028 (and (array_inv!17076 _values!788) e!451052)))

(assert (=> start!70028 tp!44062))

(declare-fun b!813874 () Bool)

(declare-fun res!555952 () Bool)

(assert (=> b!813874 (=> (not res!555952) (not e!451053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44526 (_ BitVec 32)) Bool)

(assert (=> b!813874 (= res!555952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813875 () Bool)

(assert (=> b!813875 (= e!451052 (and e!451051 mapRes!22819))))

(declare-fun condMapEmpty!22819 () Bool)

(declare-fun mapDefault!22819 () ValueCell!6664)

