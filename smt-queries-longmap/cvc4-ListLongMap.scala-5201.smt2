; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70224 () Bool)

(assert start!70224)

(declare-fun b_free!12617 () Bool)

(declare-fun b_next!12617 () Bool)

(assert (=> start!70224 (= b_free!12617 (not b_next!12617))))

(declare-fun tp!44571 () Bool)

(declare-fun b_and!21405 () Bool)

(assert (=> start!70224 (= tp!44571 b_and!21405)))

(declare-fun b!815847 () Bool)

(declare-fun e!452466 () Bool)

(assert (=> b!815847 (= e!452466 true)))

(declare-datatypes ((array!44854 0))(
  ( (array!44855 (arr!21485 (Array (_ BitVec 32) (_ BitVec 64))) (size!21906 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44854)

(declare-datatypes ((V!24103 0))(
  ( (V!24104 (val!7211 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24103)

(declare-fun minValue!754 () V!24103)

(declare-datatypes ((ValueCell!6748 0))(
  ( (ValueCellFull!6748 (v!9638 V!24103)) (EmptyCell!6748) )
))
(declare-datatypes ((array!44856 0))(
  ( (array!44857 (arr!21486 (Array (_ BitVec 32) ValueCell!6748)) (size!21907 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44856)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9464 0))(
  ( (tuple2!9465 (_1!4743 (_ BitVec 64)) (_2!4743 V!24103)) )
))
(declare-datatypes ((List!15295 0))(
  ( (Nil!15292) (Cons!15291 (h!16420 tuple2!9464) (t!21616 List!15295)) )
))
(declare-datatypes ((ListLongMap!8287 0))(
  ( (ListLongMap!8288 (toList!4159 List!15295)) )
))
(declare-fun lt!365299 () ListLongMap!8287)

(declare-fun getCurrentListMap!2387 (array!44854 array!44856 (_ BitVec 32) (_ BitVec 32) V!24103 V!24103 (_ BitVec 32) Int) ListLongMap!8287)

(assert (=> b!815847 (= lt!365299 (getCurrentListMap!2387 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24103)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365300 () ListLongMap!8287)

(declare-fun +!1793 (ListLongMap!8287 tuple2!9464) ListLongMap!8287)

(assert (=> b!815847 (= lt!365300 (+!1793 (getCurrentListMap!2387 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815848 () Bool)

(declare-fun res!557065 () Bool)

(declare-fun e!452463 () Bool)

(assert (=> b!815848 (=> (not res!557065) (not e!452463))))

(assert (=> b!815848 (= res!557065 (and (= (size!21907 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21906 _keys!976) (size!21907 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815849 () Bool)

(declare-fun res!557067 () Bool)

(assert (=> b!815849 (=> (not res!557067) (not e!452463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44854 (_ BitVec 32)) Bool)

(assert (=> b!815849 (= res!557067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23077 () Bool)

(declare-fun mapRes!23077 () Bool)

(declare-fun tp!44572 () Bool)

(declare-fun e!452465 () Bool)

(assert (=> mapNonEmpty!23077 (= mapRes!23077 (and tp!44572 e!452465))))

(declare-fun mapKey!23077 () (_ BitVec 32))

(declare-fun mapValue!23077 () ValueCell!6748)

(declare-fun mapRest!23077 () (Array (_ BitVec 32) ValueCell!6748))

(assert (=> mapNonEmpty!23077 (= (arr!21486 _values!788) (store mapRest!23077 mapKey!23077 mapValue!23077))))

(declare-fun b!815850 () Bool)

(declare-fun tp_is_empty!14327 () Bool)

(assert (=> b!815850 (= e!452465 tp_is_empty!14327)))

(declare-fun res!557068 () Bool)

(assert (=> start!70224 (=> (not res!557068) (not e!452463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70224 (= res!557068 (validMask!0 mask!1312))))

(assert (=> start!70224 e!452463))

(assert (=> start!70224 tp_is_empty!14327))

(declare-fun array_inv!17193 (array!44854) Bool)

(assert (=> start!70224 (array_inv!17193 _keys!976)))

(assert (=> start!70224 true))

(declare-fun e!452464 () Bool)

(declare-fun array_inv!17194 (array!44856) Bool)

(assert (=> start!70224 (and (array_inv!17194 _values!788) e!452464)))

(assert (=> start!70224 tp!44571))

(declare-fun b!815851 () Bool)

(assert (=> b!815851 (= e!452463 (not e!452466))))

(declare-fun res!557069 () Bool)

(assert (=> b!815851 (=> res!557069 e!452466)))

(assert (=> b!815851 (= res!557069 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365297 () ListLongMap!8287)

(declare-fun lt!365296 () ListLongMap!8287)

(assert (=> b!815851 (= lt!365297 lt!365296)))

(declare-datatypes ((Unit!27812 0))(
  ( (Unit!27813) )
))
(declare-fun lt!365298 () Unit!27812)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!317 (array!44854 array!44856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24103 V!24103 V!24103 V!24103 (_ BitVec 32) Int) Unit!27812)

(assert (=> b!815851 (= lt!365298 (lemmaNoChangeToArrayThenSameMapNoExtras!317 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2207 (array!44854 array!44856 (_ BitVec 32) (_ BitVec 32) V!24103 V!24103 (_ BitVec 32) Int) ListLongMap!8287)

(assert (=> b!815851 (= lt!365296 (getCurrentListMapNoExtraKeys!2207 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815851 (= lt!365297 (getCurrentListMapNoExtraKeys!2207 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23077 () Bool)

(assert (=> mapIsEmpty!23077 mapRes!23077))

(declare-fun b!815852 () Bool)

(declare-fun e!452468 () Bool)

(assert (=> b!815852 (= e!452468 tp_is_empty!14327)))

(declare-fun b!815853 () Bool)

(declare-fun res!557066 () Bool)

(assert (=> b!815853 (=> (not res!557066) (not e!452463))))

(declare-datatypes ((List!15296 0))(
  ( (Nil!15293) (Cons!15292 (h!16421 (_ BitVec 64)) (t!21617 List!15296)) )
))
(declare-fun arrayNoDuplicates!0 (array!44854 (_ BitVec 32) List!15296) Bool)

(assert (=> b!815853 (= res!557066 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15293))))

(declare-fun b!815854 () Bool)

(assert (=> b!815854 (= e!452464 (and e!452468 mapRes!23077))))

(declare-fun condMapEmpty!23077 () Bool)

(declare-fun mapDefault!23077 () ValueCell!6748)

