; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93858 () Bool)

(assert start!93858)

(declare-fun b_free!21337 () Bool)

(declare-fun b_next!21337 () Bool)

(assert (=> start!93858 (= b_free!21337 (not b_next!21337))))

(declare-fun tp!75434 () Bool)

(declare-fun b_and!34025 () Bool)

(assert (=> start!93858 (= tp!75434 b_and!34025)))

(declare-fun res!708847 () Bool)

(declare-fun e!604469 () Bool)

(assert (=> start!93858 (=> (not res!708847) (not e!604469))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93858 (= res!708847 (validMask!0 mask!1515))))

(assert (=> start!93858 e!604469))

(assert (=> start!93858 true))

(declare-fun tp_is_empty!25147 () Bool)

(assert (=> start!93858 tp_is_empty!25147))

(declare-datatypes ((V!38665 0))(
  ( (V!38666 (val!12624 Int)) )
))
(declare-datatypes ((ValueCell!11870 0))(
  ( (ValueCellFull!11870 (v!15233 V!38665)) (EmptyCell!11870) )
))
(declare-datatypes ((array!67244 0))(
  ( (array!67245 (arr!32330 (Array (_ BitVec 32) ValueCell!11870)) (size!32868 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67244)

(declare-fun e!604470 () Bool)

(declare-fun array_inv!25052 (array!67244) Bool)

(assert (=> start!93858 (and (array_inv!25052 _values!955) e!604470)))

(assert (=> start!93858 tp!75434))

(declare-datatypes ((array!67246 0))(
  ( (array!67247 (arr!32331 (Array (_ BitVec 32) (_ BitVec 64))) (size!32869 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67246)

(declare-fun array_inv!25053 (array!67246) Bool)

(assert (=> start!93858 (array_inv!25053 _keys!1163)))

(declare-fun b!1061447 () Bool)

(declare-fun res!708844 () Bool)

(assert (=> b!1061447 (=> (not res!708844) (not e!604469))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1061447 (= res!708844 (and (= (size!32868 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32869 _keys!1163) (size!32868 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39391 () Bool)

(declare-fun mapRes!39391 () Bool)

(declare-fun tp!75433 () Bool)

(declare-fun e!604468 () Bool)

(assert (=> mapNonEmpty!39391 (= mapRes!39391 (and tp!75433 e!604468))))

(declare-fun mapValue!39391 () ValueCell!11870)

(declare-fun mapRest!39391 () (Array (_ BitVec 32) ValueCell!11870))

(declare-fun mapKey!39391 () (_ BitVec 32))

(assert (=> mapNonEmpty!39391 (= (arr!32330 _values!955) (store mapRest!39391 mapKey!39391 mapValue!39391))))

(declare-fun b!1061448 () Bool)

(assert (=> b!1061448 (= e!604469 (not true))))

(declare-datatypes ((tuple2!16028 0))(
  ( (tuple2!16029 (_1!8025 (_ BitVec 64)) (_2!8025 V!38665)) )
))
(declare-datatypes ((List!22583 0))(
  ( (Nil!22580) (Cons!22579 (h!23788 tuple2!16028) (t!31883 List!22583)) )
))
(declare-datatypes ((ListLongMap!13997 0))(
  ( (ListLongMap!13998 (toList!7014 List!22583)) )
))
(declare-fun lt!467466 () ListLongMap!13997)

(declare-fun lt!467468 () ListLongMap!13997)

(assert (=> b!1061448 (= lt!467466 lt!467468)))

(declare-fun zeroValueBefore!47 () V!38665)

(declare-fun minValue!907 () V!38665)

(declare-datatypes ((Unit!34627 0))(
  ( (Unit!34628) )
))
(declare-fun lt!467467 () Unit!34627)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38665)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!625 (array!67246 array!67244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38665 V!38665 V!38665 V!38665 (_ BitVec 32) Int) Unit!34627)

(assert (=> b!1061448 (= lt!467467 (lemmaNoChangeToArrayThenSameMapNoExtras!625 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3631 (array!67246 array!67244 (_ BitVec 32) (_ BitVec 32) V!38665 V!38665 (_ BitVec 32) Int) ListLongMap!13997)

(assert (=> b!1061448 (= lt!467468 (getCurrentListMapNoExtraKeys!3631 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061448 (= lt!467466 (getCurrentListMapNoExtraKeys!3631 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39391 () Bool)

(assert (=> mapIsEmpty!39391 mapRes!39391))

(declare-fun b!1061449 () Bool)

(declare-fun e!604466 () Bool)

(assert (=> b!1061449 (= e!604466 tp_is_empty!25147)))

(declare-fun b!1061450 () Bool)

(declare-fun res!708846 () Bool)

(assert (=> b!1061450 (=> (not res!708846) (not e!604469))))

(declare-datatypes ((List!22584 0))(
  ( (Nil!22581) (Cons!22580 (h!23789 (_ BitVec 64)) (t!31884 List!22584)) )
))
(declare-fun arrayNoDuplicates!0 (array!67246 (_ BitVec 32) List!22584) Bool)

(assert (=> b!1061450 (= res!708846 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22581))))

(declare-fun b!1061451 () Bool)

(declare-fun res!708845 () Bool)

(assert (=> b!1061451 (=> (not res!708845) (not e!604469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67246 (_ BitVec 32)) Bool)

(assert (=> b!1061451 (= res!708845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061452 () Bool)

(assert (=> b!1061452 (= e!604470 (and e!604466 mapRes!39391))))

(declare-fun condMapEmpty!39391 () Bool)

(declare-fun mapDefault!39391 () ValueCell!11870)

(assert (=> b!1061452 (= condMapEmpty!39391 (= (arr!32330 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11870)) mapDefault!39391)))))

(declare-fun b!1061453 () Bool)

(assert (=> b!1061453 (= e!604468 tp_is_empty!25147)))

(assert (= (and start!93858 res!708847) b!1061447))

(assert (= (and b!1061447 res!708844) b!1061451))

(assert (= (and b!1061451 res!708845) b!1061450))

(assert (= (and b!1061450 res!708846) b!1061448))

(assert (= (and b!1061452 condMapEmpty!39391) mapIsEmpty!39391))

(assert (= (and b!1061452 (not condMapEmpty!39391)) mapNonEmpty!39391))

(get-info :version)

(assert (= (and mapNonEmpty!39391 ((_ is ValueCellFull!11870) mapValue!39391)) b!1061453))

(assert (= (and b!1061452 ((_ is ValueCellFull!11870) mapDefault!39391)) b!1061449))

(assert (= start!93858 b!1061452))

(declare-fun m!979801 () Bool)

(assert (=> b!1061448 m!979801))

(declare-fun m!979803 () Bool)

(assert (=> b!1061448 m!979803))

(declare-fun m!979805 () Bool)

(assert (=> b!1061448 m!979805))

(declare-fun m!979807 () Bool)

(assert (=> b!1061450 m!979807))

(declare-fun m!979809 () Bool)

(assert (=> b!1061451 m!979809))

(declare-fun m!979811 () Bool)

(assert (=> mapNonEmpty!39391 m!979811))

(declare-fun m!979813 () Bool)

(assert (=> start!93858 m!979813))

(declare-fun m!979815 () Bool)

(assert (=> start!93858 m!979815))

(declare-fun m!979817 () Bool)

(assert (=> start!93858 m!979817))

(check-sat (not b!1061450) tp_is_empty!25147 b_and!34025 (not b_next!21337) (not start!93858) (not b!1061448) (not b!1061451) (not mapNonEmpty!39391))
(check-sat b_and!34025 (not b_next!21337))
