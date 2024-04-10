; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104814 () Bool)

(assert start!104814)

(declare-fun b_free!26619 () Bool)

(declare-fun b_next!26619 () Bool)

(assert (=> start!104814 (= b_free!26619 (not b_next!26619))))

(declare-fun tp!93346 () Bool)

(declare-fun b_and!44387 () Bool)

(assert (=> start!104814 (= tp!93346 b_and!44387)))

(declare-fun res!833439 () Bool)

(declare-fun e!709102 () Bool)

(assert (=> start!104814 (=> (not res!833439) (not e!709102))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104814 (= res!833439 (validMask!0 mask!1466))))

(assert (=> start!104814 e!709102))

(assert (=> start!104814 true))

(assert (=> start!104814 tp!93346))

(declare-fun tp_is_empty!31521 () Bool)

(assert (=> start!104814 tp_is_empty!31521))

(declare-datatypes ((array!80724 0))(
  ( (array!80725 (arr!38929 (Array (_ BitVec 32) (_ BitVec 64))) (size!39465 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80724)

(declare-fun array_inv!29707 (array!80724) Bool)

(assert (=> start!104814 (array_inv!29707 _keys!1118)))

(declare-datatypes ((V!47393 0))(
  ( (V!47394 (val!15823 Int)) )
))
(declare-datatypes ((ValueCell!14997 0))(
  ( (ValueCellFull!14997 (v!18519 V!47393)) (EmptyCell!14997) )
))
(declare-datatypes ((array!80726 0))(
  ( (array!80727 (arr!38930 (Array (_ BitVec 32) ValueCell!14997)) (size!39466 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80726)

(declare-fun e!709101 () Bool)

(declare-fun array_inv!29708 (array!80726) Bool)

(assert (=> start!104814 (and (array_inv!29708 _values!914) e!709101)))

(declare-fun b!1249389 () Bool)

(declare-fun res!833436 () Bool)

(assert (=> b!1249389 (=> (not res!833436) (not e!709102))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249389 (= res!833436 (and (= (size!39466 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39465 _keys!1118) (size!39466 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249390 () Bool)

(declare-fun res!833437 () Bool)

(assert (=> b!1249390 (=> (not res!833437) (not e!709102))))

(declare-datatypes ((List!27630 0))(
  ( (Nil!27627) (Cons!27626 (h!28835 (_ BitVec 64)) (t!41101 List!27630)) )
))
(declare-fun arrayNoDuplicates!0 (array!80724 (_ BitVec 32) List!27630) Bool)

(assert (=> b!1249390 (= res!833437 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27627))))

(declare-fun b!1249391 () Bool)

(declare-fun e!709100 () Bool)

(assert (=> b!1249391 (= e!709100 tp_is_empty!31521)))

(declare-fun mapNonEmpty!49042 () Bool)

(declare-fun mapRes!49042 () Bool)

(declare-fun tp!93347 () Bool)

(declare-fun e!709098 () Bool)

(assert (=> mapNonEmpty!49042 (= mapRes!49042 (and tp!93347 e!709098))))

(declare-fun mapRest!49042 () (Array (_ BitVec 32) ValueCell!14997))

(declare-fun mapKey!49042 () (_ BitVec 32))

(declare-fun mapValue!49042 () ValueCell!14997)

(assert (=> mapNonEmpty!49042 (= (arr!38930 _values!914) (store mapRest!49042 mapKey!49042 mapValue!49042))))

(declare-fun b!1249392 () Bool)

(assert (=> b!1249392 (= e!709101 (and e!709100 mapRes!49042))))

(declare-fun condMapEmpty!49042 () Bool)

(declare-fun mapDefault!49042 () ValueCell!14997)

(assert (=> b!1249392 (= condMapEmpty!49042 (= (arr!38930 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14997)) mapDefault!49042)))))

(declare-fun b!1249393 () Bool)

(assert (=> b!1249393 (= e!709102 (not true))))

(declare-datatypes ((tuple2!20386 0))(
  ( (tuple2!20387 (_1!10204 (_ BitVec 64)) (_2!10204 V!47393)) )
))
(declare-datatypes ((List!27631 0))(
  ( (Nil!27628) (Cons!27627 (h!28836 tuple2!20386) (t!41102 List!27631)) )
))
(declare-datatypes ((ListLongMap!18259 0))(
  ( (ListLongMap!18260 (toList!9145 List!27631)) )
))
(declare-fun lt!563709 () ListLongMap!18259)

(declare-fun lt!563710 () ListLongMap!18259)

(assert (=> b!1249393 (= lt!563709 lt!563710)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47393)

(declare-fun zeroValue!871 () V!47393)

(declare-fun minValueBefore!43 () V!47393)

(declare-datatypes ((Unit!41487 0))(
  ( (Unit!41488) )
))
(declare-fun lt!563708 () Unit!41487)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!916 (array!80724 array!80726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47393 V!47393 V!47393 V!47393 (_ BitVec 32) Int) Unit!41487)

(assert (=> b!1249393 (= lt!563708 (lemmaNoChangeToArrayThenSameMapNoExtras!916 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5552 (array!80724 array!80726 (_ BitVec 32) (_ BitVec 32) V!47393 V!47393 (_ BitVec 32) Int) ListLongMap!18259)

(assert (=> b!1249393 (= lt!563710 (getCurrentListMapNoExtraKeys!5552 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249393 (= lt!563709 (getCurrentListMapNoExtraKeys!5552 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249394 () Bool)

(declare-fun res!833438 () Bool)

(assert (=> b!1249394 (=> (not res!833438) (not e!709102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80724 (_ BitVec 32)) Bool)

(assert (=> b!1249394 (= res!833438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49042 () Bool)

(assert (=> mapIsEmpty!49042 mapRes!49042))

(declare-fun b!1249395 () Bool)

(assert (=> b!1249395 (= e!709098 tp_is_empty!31521)))

(assert (= (and start!104814 res!833439) b!1249389))

(assert (= (and b!1249389 res!833436) b!1249394))

(assert (= (and b!1249394 res!833438) b!1249390))

(assert (= (and b!1249390 res!833437) b!1249393))

(assert (= (and b!1249392 condMapEmpty!49042) mapIsEmpty!49042))

(assert (= (and b!1249392 (not condMapEmpty!49042)) mapNonEmpty!49042))

(get-info :version)

(assert (= (and mapNonEmpty!49042 ((_ is ValueCellFull!14997) mapValue!49042)) b!1249395))

(assert (= (and b!1249392 ((_ is ValueCellFull!14997) mapDefault!49042)) b!1249391))

(assert (= start!104814 b!1249392))

(declare-fun m!1150325 () Bool)

(assert (=> b!1249393 m!1150325))

(declare-fun m!1150327 () Bool)

(assert (=> b!1249393 m!1150327))

(declare-fun m!1150329 () Bool)

(assert (=> b!1249393 m!1150329))

(declare-fun m!1150331 () Bool)

(assert (=> b!1249390 m!1150331))

(declare-fun m!1150333 () Bool)

(assert (=> mapNonEmpty!49042 m!1150333))

(declare-fun m!1150335 () Bool)

(assert (=> b!1249394 m!1150335))

(declare-fun m!1150337 () Bool)

(assert (=> start!104814 m!1150337))

(declare-fun m!1150339 () Bool)

(assert (=> start!104814 m!1150339))

(declare-fun m!1150341 () Bool)

(assert (=> start!104814 m!1150341))

(check-sat tp_is_empty!31521 (not b!1249394) (not start!104814) b_and!44387 (not b!1249393) (not b!1249390) (not mapNonEmpty!49042) (not b_next!26619))
(check-sat b_and!44387 (not b_next!26619))
