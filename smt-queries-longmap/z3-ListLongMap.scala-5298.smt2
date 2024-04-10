; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70994 () Bool)

(assert start!70994)

(declare-fun b_free!13197 () Bool)

(declare-fun b_next!13197 () Bool)

(assert (=> start!70994 (= b_free!13197 (not b_next!13197))))

(declare-fun tp!46344 () Bool)

(declare-fun b_and!22101 () Bool)

(assert (=> start!70994 (= tp!46344 b_and!22101)))

(declare-fun mapNonEmpty!23980 () Bool)

(declare-fun mapRes!23980 () Bool)

(declare-fun tp!46345 () Bool)

(declare-fun e!458658 () Bool)

(assert (=> mapNonEmpty!23980 (= mapRes!23980 (and tp!46345 e!458658))))

(declare-datatypes ((V!24877 0))(
  ( (V!24878 (val!7501 Int)) )
))
(declare-datatypes ((ValueCell!7038 0))(
  ( (ValueCellFull!7038 (v!9934 V!24877)) (EmptyCell!7038) )
))
(declare-fun mapRest!23980 () (Array (_ BitVec 32) ValueCell!7038))

(declare-fun mapValue!23980 () ValueCell!7038)

(declare-datatypes ((array!46002 0))(
  ( (array!46003 (arr!22048 (Array (_ BitVec 32) ValueCell!7038)) (size!22469 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46002)

(declare-fun mapKey!23980 () (_ BitVec 32))

(assert (=> mapNonEmpty!23980 (= (arr!22048 _values!788) (store mapRest!23980 mapKey!23980 mapValue!23980))))

(declare-fun b!824404 () Bool)

(declare-fun res!562058 () Bool)

(declare-fun e!458662 () Bool)

(assert (=> b!824404 (=> (not res!562058) (not e!458662))))

(declare-datatypes ((array!46004 0))(
  ( (array!46005 (arr!22049 (Array (_ BitVec 32) (_ BitVec 64))) (size!22470 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46004)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824404 (= res!562058 (and (= (size!22469 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22470 _keys!976) (size!22469 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824405 () Bool)

(declare-fun e!458660 () Bool)

(assert (=> b!824405 (= e!458662 (not e!458660))))

(declare-fun res!562062 () Bool)

(assert (=> b!824405 (=> res!562062 e!458660)))

(assert (=> b!824405 (= res!562062 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9926 0))(
  ( (tuple2!9927 (_1!4974 (_ BitVec 64)) (_2!4974 V!24877)) )
))
(declare-datatypes ((List!15738 0))(
  ( (Nil!15735) (Cons!15734 (h!16863 tuple2!9926) (t!22081 List!15738)) )
))
(declare-datatypes ((ListLongMap!8749 0))(
  ( (ListLongMap!8750 (toList!4390 List!15738)) )
))
(declare-fun lt!371810 () ListLongMap!8749)

(declare-fun lt!371807 () ListLongMap!8749)

(assert (=> b!824405 (= lt!371810 lt!371807)))

(declare-fun zeroValueBefore!34 () V!24877)

(declare-fun zeroValueAfter!34 () V!24877)

(declare-fun minValue!754 () V!24877)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28248 0))(
  ( (Unit!28249) )
))
(declare-fun lt!371809 () Unit!28248)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!515 (array!46004 array!46002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24877 V!24877 V!24877 V!24877 (_ BitVec 32) Int) Unit!28248)

(assert (=> b!824405 (= lt!371809 (lemmaNoChangeToArrayThenSameMapNoExtras!515 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2405 (array!46004 array!46002 (_ BitVec 32) (_ BitVec 32) V!24877 V!24877 (_ BitVec 32) Int) ListLongMap!8749)

(assert (=> b!824405 (= lt!371807 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824405 (= lt!371810 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824406 () Bool)

(declare-fun res!562059 () Bool)

(assert (=> b!824406 (=> (not res!562059) (not e!458662))))

(declare-datatypes ((List!15739 0))(
  ( (Nil!15736) (Cons!15735 (h!16864 (_ BitVec 64)) (t!22082 List!15739)) )
))
(declare-fun arrayNoDuplicates!0 (array!46004 (_ BitVec 32) List!15739) Bool)

(assert (=> b!824406 (= res!562059 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15736))))

(declare-fun mapIsEmpty!23980 () Bool)

(assert (=> mapIsEmpty!23980 mapRes!23980))

(declare-fun res!562061 () Bool)

(assert (=> start!70994 (=> (not res!562061) (not e!458662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70994 (= res!562061 (validMask!0 mask!1312))))

(assert (=> start!70994 e!458662))

(declare-fun tp_is_empty!14907 () Bool)

(assert (=> start!70994 tp_is_empty!14907))

(declare-fun array_inv!17591 (array!46004) Bool)

(assert (=> start!70994 (array_inv!17591 _keys!976)))

(assert (=> start!70994 true))

(declare-fun e!458663 () Bool)

(declare-fun array_inv!17592 (array!46002) Bool)

(assert (=> start!70994 (and (array_inv!17592 _values!788) e!458663)))

(assert (=> start!70994 tp!46344))

(declare-fun b!824407 () Bool)

(declare-fun e!458661 () Bool)

(assert (=> b!824407 (= e!458663 (and e!458661 mapRes!23980))))

(declare-fun condMapEmpty!23980 () Bool)

(declare-fun mapDefault!23980 () ValueCell!7038)

(assert (=> b!824407 (= condMapEmpty!23980 (= (arr!22048 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7038)) mapDefault!23980)))))

(declare-fun b!824408 () Bool)

(assert (=> b!824408 (= e!458660 true)))

(declare-fun lt!371808 () ListLongMap!8749)

(declare-fun getCurrentListMap!2531 (array!46004 array!46002 (_ BitVec 32) (_ BitVec 32) V!24877 V!24877 (_ BitVec 32) Int) ListLongMap!8749)

(assert (=> b!824408 (= lt!371808 (getCurrentListMap!2531 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824409 () Bool)

(assert (=> b!824409 (= e!458658 tp_is_empty!14907)))

(declare-fun b!824410 () Bool)

(assert (=> b!824410 (= e!458661 tp_is_empty!14907)))

(declare-fun b!824411 () Bool)

(declare-fun res!562060 () Bool)

(assert (=> b!824411 (=> (not res!562060) (not e!458662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46004 (_ BitVec 32)) Bool)

(assert (=> b!824411 (= res!562060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70994 res!562061) b!824404))

(assert (= (and b!824404 res!562058) b!824411))

(assert (= (and b!824411 res!562060) b!824406))

(assert (= (and b!824406 res!562059) b!824405))

(assert (= (and b!824405 (not res!562062)) b!824408))

(assert (= (and b!824407 condMapEmpty!23980) mapIsEmpty!23980))

(assert (= (and b!824407 (not condMapEmpty!23980)) mapNonEmpty!23980))

(get-info :version)

(assert (= (and mapNonEmpty!23980 ((_ is ValueCellFull!7038) mapValue!23980)) b!824409))

(assert (= (and b!824407 ((_ is ValueCellFull!7038) mapDefault!23980)) b!824410))

(assert (= start!70994 b!824407))

(declare-fun m!766497 () Bool)

(assert (=> start!70994 m!766497))

(declare-fun m!766499 () Bool)

(assert (=> start!70994 m!766499))

(declare-fun m!766501 () Bool)

(assert (=> start!70994 m!766501))

(declare-fun m!766503 () Bool)

(assert (=> mapNonEmpty!23980 m!766503))

(declare-fun m!766505 () Bool)

(assert (=> b!824406 m!766505))

(declare-fun m!766507 () Bool)

(assert (=> b!824408 m!766507))

(declare-fun m!766509 () Bool)

(assert (=> b!824405 m!766509))

(declare-fun m!766511 () Bool)

(assert (=> b!824405 m!766511))

(declare-fun m!766513 () Bool)

(assert (=> b!824405 m!766513))

(declare-fun m!766515 () Bool)

(assert (=> b!824411 m!766515))

(check-sat (not b_next!13197) (not b!824406) (not mapNonEmpty!23980) b_and!22101 (not b!824411) tp_is_empty!14907 (not b!824405) (not start!70994) (not b!824408))
(check-sat b_and!22101 (not b_next!13197))
