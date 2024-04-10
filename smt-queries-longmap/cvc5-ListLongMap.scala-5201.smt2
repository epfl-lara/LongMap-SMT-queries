; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70220 () Bool)

(assert start!70220)

(declare-fun b_free!12613 () Bool)

(declare-fun b_next!12613 () Bool)

(assert (=> start!70220 (= b_free!12613 (not b_next!12613))))

(declare-fun tp!44560 () Bool)

(declare-fun b_and!21401 () Bool)

(assert (=> start!70220 (= tp!44560 b_and!21401)))

(declare-fun mapIsEmpty!23071 () Bool)

(declare-fun mapRes!23071 () Bool)

(assert (=> mapIsEmpty!23071 mapRes!23071))

(declare-fun res!557039 () Bool)

(declare-fun e!452428 () Bool)

(assert (=> start!70220 (=> (not res!557039) (not e!452428))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70220 (= res!557039 (validMask!0 mask!1312))))

(assert (=> start!70220 e!452428))

(declare-fun tp_is_empty!14323 () Bool)

(assert (=> start!70220 tp_is_empty!14323))

(declare-datatypes ((array!44846 0))(
  ( (array!44847 (arr!21481 (Array (_ BitVec 32) (_ BitVec 64))) (size!21902 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44846)

(declare-fun array_inv!17189 (array!44846) Bool)

(assert (=> start!70220 (array_inv!17189 _keys!976)))

(assert (=> start!70220 true))

(declare-datatypes ((V!24099 0))(
  ( (V!24100 (val!7209 Int)) )
))
(declare-datatypes ((ValueCell!6746 0))(
  ( (ValueCellFull!6746 (v!9636 V!24099)) (EmptyCell!6746) )
))
(declare-datatypes ((array!44848 0))(
  ( (array!44849 (arr!21482 (Array (_ BitVec 32) ValueCell!6746)) (size!21903 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44848)

(declare-fun e!452432 () Bool)

(declare-fun array_inv!17190 (array!44848) Bool)

(assert (=> start!70220 (and (array_inv!17190 _values!788) e!452432)))

(assert (=> start!70220 tp!44560))

(declare-fun b!815799 () Bool)

(declare-fun e!452430 () Bool)

(assert (=> b!815799 (= e!452430 tp_is_empty!14323)))

(declare-fun b!815800 () Bool)

(declare-fun res!557036 () Bool)

(assert (=> b!815800 (=> (not res!557036) (not e!452428))))

(declare-datatypes ((List!15291 0))(
  ( (Nil!15288) (Cons!15287 (h!16416 (_ BitVec 64)) (t!21612 List!15291)) )
))
(declare-fun arrayNoDuplicates!0 (array!44846 (_ BitVec 32) List!15291) Bool)

(assert (=> b!815800 (= res!557036 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15288))))

(declare-fun mapNonEmpty!23071 () Bool)

(declare-fun tp!44559 () Bool)

(declare-fun e!452427 () Bool)

(assert (=> mapNonEmpty!23071 (= mapRes!23071 (and tp!44559 e!452427))))

(declare-fun mapValue!23071 () ValueCell!6746)

(declare-fun mapRest!23071 () (Array (_ BitVec 32) ValueCell!6746))

(declare-fun mapKey!23071 () (_ BitVec 32))

(assert (=> mapNonEmpty!23071 (= (arr!21482 _values!788) (store mapRest!23071 mapKey!23071 mapValue!23071))))

(declare-fun b!815801 () Bool)

(declare-fun e!452431 () Bool)

(assert (=> b!815801 (= e!452431 true)))

(declare-fun zeroValueAfter!34 () V!24099)

(declare-fun minValue!754 () V!24099)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9460 0))(
  ( (tuple2!9461 (_1!4741 (_ BitVec 64)) (_2!4741 V!24099)) )
))
(declare-datatypes ((List!15292 0))(
  ( (Nil!15289) (Cons!15288 (h!16417 tuple2!9460) (t!21613 List!15292)) )
))
(declare-datatypes ((ListLongMap!8283 0))(
  ( (ListLongMap!8284 (toList!4157 List!15292)) )
))
(declare-fun lt!365267 () ListLongMap!8283)

(declare-fun getCurrentListMap!2385 (array!44846 array!44848 (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 (_ BitVec 32) Int) ListLongMap!8283)

(assert (=> b!815801 (= lt!365267 (getCurrentListMap!2385 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24099)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365270 () ListLongMap!8283)

(declare-fun +!1791 (ListLongMap!8283 tuple2!9460) ListLongMap!8283)

(assert (=> b!815801 (= lt!365270 (+!1791 (getCurrentListMap!2385 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815802 () Bool)

(assert (=> b!815802 (= e!452428 (not e!452431))))

(declare-fun res!557038 () Bool)

(assert (=> b!815802 (=> res!557038 e!452431)))

(assert (=> b!815802 (= res!557038 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365268 () ListLongMap!8283)

(declare-fun lt!365269 () ListLongMap!8283)

(assert (=> b!815802 (= lt!365268 lt!365269)))

(declare-datatypes ((Unit!27808 0))(
  ( (Unit!27809) )
))
(declare-fun lt!365266 () Unit!27808)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!315 (array!44846 array!44848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 V!24099 V!24099 (_ BitVec 32) Int) Unit!27808)

(assert (=> b!815802 (= lt!365266 (lemmaNoChangeToArrayThenSameMapNoExtras!315 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2205 (array!44846 array!44848 (_ BitVec 32) (_ BitVec 32) V!24099 V!24099 (_ BitVec 32) Int) ListLongMap!8283)

(assert (=> b!815802 (= lt!365269 (getCurrentListMapNoExtraKeys!2205 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815802 (= lt!365268 (getCurrentListMapNoExtraKeys!2205 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815803 () Bool)

(assert (=> b!815803 (= e!452432 (and e!452430 mapRes!23071))))

(declare-fun condMapEmpty!23071 () Bool)

(declare-fun mapDefault!23071 () ValueCell!6746)

