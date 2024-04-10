; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42320 () Bool)

(assert start!42320)

(declare-fun b_free!11811 () Bool)

(declare-fun b_next!11811 () Bool)

(assert (=> start!42320 (= b_free!11811 (not b_next!11811))))

(declare-fun tp!41464 () Bool)

(declare-fun b_and!20257 () Bool)

(assert (=> start!42320 (= tp!41464 b_and!20257)))

(declare-fun mapIsEmpty!21568 () Bool)

(declare-fun mapRes!21568 () Bool)

(assert (=> mapIsEmpty!21568 mapRes!21568))

(declare-fun b!472156 () Bool)

(declare-fun res!282032 () Bool)

(declare-fun e!276811 () Bool)

(assert (=> b!472156 (=> (not res!282032) (not e!276811))))

(declare-datatypes ((array!30237 0))(
  ( (array!30238 (arr!14539 (Array (_ BitVec 32) (_ BitVec 64))) (size!14891 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30237)

(declare-datatypes ((List!8855 0))(
  ( (Nil!8852) (Cons!8851 (h!9707 (_ BitVec 64)) (t!14823 List!8855)) )
))
(declare-fun arrayNoDuplicates!0 (array!30237 (_ BitVec 32) List!8855) Bool)

(assert (=> b!472156 (= res!282032 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8852))))

(declare-fun b!472157 () Bool)

(declare-fun res!282029 () Bool)

(assert (=> b!472157 (=> (not res!282029) (not e!276811))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18757 0))(
  ( (V!18758 (val!6664 Int)) )
))
(declare-datatypes ((ValueCell!6276 0))(
  ( (ValueCellFull!6276 (v!8955 V!18757)) (EmptyCell!6276) )
))
(declare-datatypes ((array!30239 0))(
  ( (array!30240 (arr!14540 (Array (_ BitVec 32) ValueCell!6276)) (size!14892 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30239)

(assert (=> b!472157 (= res!282029 (and (= (size!14892 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14891 _keys!1025) (size!14892 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472158 () Bool)

(declare-fun res!282031 () Bool)

(assert (=> b!472158 (=> (not res!282031) (not e!276811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30237 (_ BitVec 32)) Bool)

(assert (=> b!472158 (= res!282031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472159 () Bool)

(declare-fun e!276807 () Bool)

(declare-fun e!276808 () Bool)

(assert (=> b!472159 (= e!276807 (and e!276808 mapRes!21568))))

(declare-fun condMapEmpty!21568 () Bool)

(declare-fun mapDefault!21568 () ValueCell!6276)

(assert (=> b!472159 (= condMapEmpty!21568 (= (arr!14540 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6276)) mapDefault!21568)))))

(declare-fun mapNonEmpty!21568 () Bool)

(declare-fun tp!41463 () Bool)

(declare-fun e!276810 () Bool)

(assert (=> mapNonEmpty!21568 (= mapRes!21568 (and tp!41463 e!276810))))

(declare-fun mapKey!21568 () (_ BitVec 32))

(declare-fun mapValue!21568 () ValueCell!6276)

(declare-fun mapRest!21568 () (Array (_ BitVec 32) ValueCell!6276))

(assert (=> mapNonEmpty!21568 (= (arr!14540 _values!833) (store mapRest!21568 mapKey!21568 mapValue!21568))))

(declare-fun b!472160 () Bool)

(declare-fun e!276809 () Bool)

(assert (=> b!472160 (= e!276809 true)))

(declare-fun minValueBefore!38 () V!18757)

(declare-fun zeroValue!794 () V!18757)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8772 0))(
  ( (tuple2!8773 (_1!4397 (_ BitVec 64)) (_2!4397 V!18757)) )
))
(declare-datatypes ((List!8856 0))(
  ( (Nil!8853) (Cons!8852 (h!9708 tuple2!8772) (t!14824 List!8856)) )
))
(declare-datatypes ((ListLongMap!7685 0))(
  ( (ListLongMap!7686 (toList!3858 List!8856)) )
))
(declare-fun lt!214205 () ListLongMap!7685)

(declare-fun getCurrentListMap!2229 (array!30237 array!30239 (_ BitVec 32) (_ BitVec 32) V!18757 V!18757 (_ BitVec 32) Int) ListLongMap!7685)

(assert (=> b!472160 (= lt!214205 (getCurrentListMap!2229 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282033 () Bool)

(assert (=> start!42320 (=> (not res!282033) (not e!276811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42320 (= res!282033 (validMask!0 mask!1365))))

(assert (=> start!42320 e!276811))

(declare-fun tp_is_empty!13239 () Bool)

(assert (=> start!42320 tp_is_empty!13239))

(assert (=> start!42320 tp!41464))

(assert (=> start!42320 true))

(declare-fun array_inv!10480 (array!30237) Bool)

(assert (=> start!42320 (array_inv!10480 _keys!1025)))

(declare-fun array_inv!10481 (array!30239) Bool)

(assert (=> start!42320 (and (array_inv!10481 _values!833) e!276807)))

(declare-fun b!472161 () Bool)

(assert (=> b!472161 (= e!276811 (not e!276809))))

(declare-fun res!282030 () Bool)

(assert (=> b!472161 (=> res!282030 e!276809)))

(assert (=> b!472161 (= res!282030 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214203 () ListLongMap!7685)

(declare-fun lt!214204 () ListLongMap!7685)

(assert (=> b!472161 (= lt!214203 lt!214204)))

(declare-datatypes ((Unit!13875 0))(
  ( (Unit!13876) )
))
(declare-fun lt!214206 () Unit!13875)

(declare-fun minValueAfter!38 () V!18757)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!201 (array!30237 array!30239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18757 V!18757 V!18757 V!18757 (_ BitVec 32) Int) Unit!13875)

(assert (=> b!472161 (= lt!214206 (lemmaNoChangeToArrayThenSameMapNoExtras!201 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2021 (array!30237 array!30239 (_ BitVec 32) (_ BitVec 32) V!18757 V!18757 (_ BitVec 32) Int) ListLongMap!7685)

(assert (=> b!472161 (= lt!214204 (getCurrentListMapNoExtraKeys!2021 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472161 (= lt!214203 (getCurrentListMapNoExtraKeys!2021 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472162 () Bool)

(assert (=> b!472162 (= e!276810 tp_is_empty!13239)))

(declare-fun b!472163 () Bool)

(assert (=> b!472163 (= e!276808 tp_is_empty!13239)))

(assert (= (and start!42320 res!282033) b!472157))

(assert (= (and b!472157 res!282029) b!472158))

(assert (= (and b!472158 res!282031) b!472156))

(assert (= (and b!472156 res!282032) b!472161))

(assert (= (and b!472161 (not res!282030)) b!472160))

(assert (= (and b!472159 condMapEmpty!21568) mapIsEmpty!21568))

(assert (= (and b!472159 (not condMapEmpty!21568)) mapNonEmpty!21568))

(get-info :version)

(assert (= (and mapNonEmpty!21568 ((_ is ValueCellFull!6276) mapValue!21568)) b!472162))

(assert (= (and b!472159 ((_ is ValueCellFull!6276) mapDefault!21568)) b!472163))

(assert (= start!42320 b!472159))

(declare-fun m!454177 () Bool)

(assert (=> mapNonEmpty!21568 m!454177))

(declare-fun m!454179 () Bool)

(assert (=> b!472161 m!454179))

(declare-fun m!454181 () Bool)

(assert (=> b!472161 m!454181))

(declare-fun m!454183 () Bool)

(assert (=> b!472161 m!454183))

(declare-fun m!454185 () Bool)

(assert (=> start!42320 m!454185))

(declare-fun m!454187 () Bool)

(assert (=> start!42320 m!454187))

(declare-fun m!454189 () Bool)

(assert (=> start!42320 m!454189))

(declare-fun m!454191 () Bool)

(assert (=> b!472160 m!454191))

(declare-fun m!454193 () Bool)

(assert (=> b!472158 m!454193))

(declare-fun m!454195 () Bool)

(assert (=> b!472156 m!454195))

(check-sat (not b!472161) (not b!472160) tp_is_empty!13239 (not start!42320) (not mapNonEmpty!21568) (not b!472158) b_and!20257 (not b_next!11811) (not b!472156))
(check-sat b_and!20257 (not b_next!11811))
