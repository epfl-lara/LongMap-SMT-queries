; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42254 () Bool)

(assert start!42254)

(declare-fun b_free!11773 () Bool)

(declare-fun b_next!11773 () Bool)

(assert (=> start!42254 (= b_free!11773 (not b_next!11773))))

(declare-fun tp!41347 () Bool)

(declare-fun b_and!20221 () Bool)

(assert (=> start!42254 (= tp!41347 b_and!20221)))

(declare-fun b!471606 () Bool)

(declare-fun res!281761 () Bool)

(declare-fun e!276424 () Bool)

(assert (=> b!471606 (=> (not res!281761) (not e!276424))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30150 0))(
  ( (array!30151 (arr!14496 (Array (_ BitVec 32) (_ BitVec 64))) (size!14848 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30150)

(declare-datatypes ((V!18707 0))(
  ( (V!18708 (val!6645 Int)) )
))
(declare-datatypes ((ValueCell!6257 0))(
  ( (ValueCellFull!6257 (v!8937 V!18707)) (EmptyCell!6257) )
))
(declare-datatypes ((array!30152 0))(
  ( (array!30153 (arr!14497 (Array (_ BitVec 32) ValueCell!6257)) (size!14849 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30152)

(assert (=> b!471606 (= res!281761 (and (= (size!14849 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14848 _keys!1025) (size!14849 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471607 () Bool)

(declare-fun res!281758 () Bool)

(assert (=> b!471607 (=> (not res!281758) (not e!276424))))

(declare-datatypes ((List!8739 0))(
  ( (Nil!8736) (Cons!8735 (h!9591 (_ BitVec 64)) (t!14697 List!8739)) )
))
(declare-fun arrayNoDuplicates!0 (array!30150 (_ BitVec 32) List!8739) Bool)

(assert (=> b!471607 (= res!281758 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8736))))

(declare-fun b!471608 () Bool)

(assert (=> b!471608 (= e!276424 (not true))))

(declare-datatypes ((tuple2!8670 0))(
  ( (tuple2!8671 (_1!4346 (_ BitVec 64)) (_2!4346 V!18707)) )
))
(declare-datatypes ((List!8740 0))(
  ( (Nil!8737) (Cons!8736 (h!9592 tuple2!8670) (t!14698 List!8740)) )
))
(declare-datatypes ((ListLongMap!7585 0))(
  ( (ListLongMap!7586 (toList!3808 List!8740)) )
))
(declare-fun lt!213999 () ListLongMap!7585)

(declare-fun lt!214000 () ListLongMap!7585)

(assert (=> b!471608 (= lt!213999 lt!214000)))

(declare-fun minValueBefore!38 () V!18707)

(declare-datatypes ((Unit!13829 0))(
  ( (Unit!13830) )
))
(declare-fun lt!214001 () Unit!13829)

(declare-fun zeroValue!794 () V!18707)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18707)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!183 (array!30150 array!30152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18707 V!18707 V!18707 V!18707 (_ BitVec 32) Int) Unit!13829)

(assert (=> b!471608 (= lt!214001 (lemmaNoChangeToArrayThenSameMapNoExtras!183 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2023 (array!30150 array!30152 (_ BitVec 32) (_ BitVec 32) V!18707 V!18707 (_ BitVec 32) Int) ListLongMap!7585)

(assert (=> b!471608 (= lt!214000 (getCurrentListMapNoExtraKeys!2023 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471608 (= lt!213999 (getCurrentListMapNoExtraKeys!2023 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471609 () Bool)

(declare-fun e!276426 () Bool)

(declare-fun tp_is_empty!13201 () Bool)

(assert (=> b!471609 (= e!276426 tp_is_empty!13201)))

(declare-fun res!281759 () Bool)

(assert (=> start!42254 (=> (not res!281759) (not e!276424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42254 (= res!281759 (validMask!0 mask!1365))))

(assert (=> start!42254 e!276424))

(assert (=> start!42254 tp_is_empty!13201))

(assert (=> start!42254 tp!41347))

(assert (=> start!42254 true))

(declare-fun array_inv!10548 (array!30150) Bool)

(assert (=> start!42254 (array_inv!10548 _keys!1025)))

(declare-fun e!276425 () Bool)

(declare-fun array_inv!10549 (array!30152) Bool)

(assert (=> start!42254 (and (array_inv!10549 _values!833) e!276425)))

(declare-fun b!471610 () Bool)

(declare-fun e!276422 () Bool)

(assert (=> b!471610 (= e!276422 tp_is_empty!13201)))

(declare-fun b!471611 () Bool)

(declare-fun mapRes!21508 () Bool)

(assert (=> b!471611 (= e!276425 (and e!276426 mapRes!21508))))

(declare-fun condMapEmpty!21508 () Bool)

(declare-fun mapDefault!21508 () ValueCell!6257)

(assert (=> b!471611 (= condMapEmpty!21508 (= (arr!14497 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6257)) mapDefault!21508)))))

(declare-fun mapIsEmpty!21508 () Bool)

(assert (=> mapIsEmpty!21508 mapRes!21508))

(declare-fun mapNonEmpty!21508 () Bool)

(declare-fun tp!41346 () Bool)

(assert (=> mapNonEmpty!21508 (= mapRes!21508 (and tp!41346 e!276422))))

(declare-fun mapRest!21508 () (Array (_ BitVec 32) ValueCell!6257))

(declare-fun mapKey!21508 () (_ BitVec 32))

(declare-fun mapValue!21508 () ValueCell!6257)

(assert (=> mapNonEmpty!21508 (= (arr!14497 _values!833) (store mapRest!21508 mapKey!21508 mapValue!21508))))

(declare-fun b!471612 () Bool)

(declare-fun res!281760 () Bool)

(assert (=> b!471612 (=> (not res!281760) (not e!276424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30150 (_ BitVec 32)) Bool)

(assert (=> b!471612 (= res!281760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42254 res!281759) b!471606))

(assert (= (and b!471606 res!281761) b!471612))

(assert (= (and b!471612 res!281760) b!471607))

(assert (= (and b!471607 res!281758) b!471608))

(assert (= (and b!471611 condMapEmpty!21508) mapIsEmpty!21508))

(assert (= (and b!471611 (not condMapEmpty!21508)) mapNonEmpty!21508))

(get-info :version)

(assert (= (and mapNonEmpty!21508 ((_ is ValueCellFull!6257) mapValue!21508)) b!471610))

(assert (= (and b!471611 ((_ is ValueCellFull!6257) mapDefault!21508)) b!471609))

(assert (= start!42254 b!471611))

(declare-fun m!453949 () Bool)

(assert (=> b!471607 m!453949))

(declare-fun m!453951 () Bool)

(assert (=> mapNonEmpty!21508 m!453951))

(declare-fun m!453953 () Bool)

(assert (=> b!471612 m!453953))

(declare-fun m!453955 () Bool)

(assert (=> start!42254 m!453955))

(declare-fun m!453957 () Bool)

(assert (=> start!42254 m!453957))

(declare-fun m!453959 () Bool)

(assert (=> start!42254 m!453959))

(declare-fun m!453961 () Bool)

(assert (=> b!471608 m!453961))

(declare-fun m!453963 () Bool)

(assert (=> b!471608 m!453963))

(declare-fun m!453965 () Bool)

(assert (=> b!471608 m!453965))

(check-sat b_and!20221 (not mapNonEmpty!21508) (not b!471607) (not b_next!11773) tp_is_empty!13201 (not b!471612) (not b!471608) (not start!42254))
(check-sat b_and!20221 (not b_next!11773))
