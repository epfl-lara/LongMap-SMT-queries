; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42174 () Bool)

(assert start!42174)

(declare-fun b_free!11707 () Bool)

(declare-fun b_next!11707 () Bool)

(assert (=> start!42174 (= b_free!11707 (not b_next!11707))))

(declare-fun tp!41145 () Bool)

(declare-fun b_and!20147 () Bool)

(assert (=> start!42174 (= tp!41145 b_and!20147)))

(declare-fun res!281333 () Bool)

(declare-fun e!275872 () Bool)

(assert (=> start!42174 (=> (not res!281333) (not e!275872))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42174 (= res!281333 (validMask!0 mask!1365))))

(assert (=> start!42174 e!275872))

(declare-fun tp_is_empty!13135 () Bool)

(assert (=> start!42174 tp_is_empty!13135))

(assert (=> start!42174 tp!41145))

(assert (=> start!42174 true))

(declare-datatypes ((array!30024 0))(
  ( (array!30025 (arr!14434 (Array (_ BitVec 32) (_ BitVec 64))) (size!14786 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30024)

(declare-fun array_inv!10504 (array!30024) Bool)

(assert (=> start!42174 (array_inv!10504 _keys!1025)))

(declare-datatypes ((V!18619 0))(
  ( (V!18620 (val!6612 Int)) )
))
(declare-datatypes ((ValueCell!6224 0))(
  ( (ValueCellFull!6224 (v!8904 V!18619)) (EmptyCell!6224) )
))
(declare-datatypes ((array!30026 0))(
  ( (array!30027 (arr!14435 (Array (_ BitVec 32) ValueCell!6224)) (size!14787 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30026)

(declare-fun e!275874 () Bool)

(declare-fun array_inv!10505 (array!30026) Bool)

(assert (=> start!42174 (and (array_inv!10505 _values!833) e!275874)))

(declare-fun b!470828 () Bool)

(declare-fun res!281331 () Bool)

(assert (=> b!470828 (=> (not res!281331) (not e!275872))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470828 (= res!281331 (and (= (size!14787 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14786 _keys!1025) (size!14787 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470829 () Bool)

(declare-fun res!281334 () Bool)

(assert (=> b!470829 (=> (not res!281334) (not e!275872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30024 (_ BitVec 32)) Bool)

(assert (=> b!470829 (= res!281334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470830 () Bool)

(declare-fun e!275873 () Bool)

(declare-fun mapRes!21406 () Bool)

(assert (=> b!470830 (= e!275874 (and e!275873 mapRes!21406))))

(declare-fun condMapEmpty!21406 () Bool)

(declare-fun mapDefault!21406 () ValueCell!6224)

(assert (=> b!470830 (= condMapEmpty!21406 (= (arr!14435 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6224)) mapDefault!21406)))))

(declare-fun b!470831 () Bool)

(declare-fun res!281332 () Bool)

(assert (=> b!470831 (=> (not res!281332) (not e!275872))))

(declare-datatypes ((List!8699 0))(
  ( (Nil!8696) (Cons!8695 (h!9551 (_ BitVec 64)) (t!14655 List!8699)) )
))
(declare-fun arrayNoDuplicates!0 (array!30024 (_ BitVec 32) List!8699) Bool)

(assert (=> b!470831 (= res!281332 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8696))))

(declare-fun mapNonEmpty!21406 () Bool)

(declare-fun tp!41146 () Bool)

(declare-fun e!275876 () Bool)

(assert (=> mapNonEmpty!21406 (= mapRes!21406 (and tp!41146 e!275876))))

(declare-fun mapKey!21406 () (_ BitVec 32))

(declare-fun mapRest!21406 () (Array (_ BitVec 32) ValueCell!6224))

(declare-fun mapValue!21406 () ValueCell!6224)

(assert (=> mapNonEmpty!21406 (= (arr!14435 _values!833) (store mapRest!21406 mapKey!21406 mapValue!21406))))

(declare-fun mapIsEmpty!21406 () Bool)

(assert (=> mapIsEmpty!21406 mapRes!21406))

(declare-fun b!470832 () Bool)

(assert (=> b!470832 (= e!275872 (not true))))

(declare-datatypes ((tuple2!8626 0))(
  ( (tuple2!8627 (_1!4324 (_ BitVec 64)) (_2!4324 V!18619)) )
))
(declare-datatypes ((List!8700 0))(
  ( (Nil!8697) (Cons!8696 (h!9552 tuple2!8626) (t!14656 List!8700)) )
))
(declare-datatypes ((ListLongMap!7541 0))(
  ( (ListLongMap!7542 (toList!3786 List!8700)) )
))
(declare-fun lt!213662 () ListLongMap!7541)

(declare-fun lt!213664 () ListLongMap!7541)

(assert (=> b!470832 (= lt!213662 lt!213664)))

(declare-fun minValueBefore!38 () V!18619)

(declare-fun zeroValue!794 () V!18619)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18619)

(declare-datatypes ((Unit!13785 0))(
  ( (Unit!13786) )
))
(declare-fun lt!213663 () Unit!13785)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!161 (array!30024 array!30026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18619 V!18619 V!18619 V!18619 (_ BitVec 32) Int) Unit!13785)

(assert (=> b!470832 (= lt!213663 (lemmaNoChangeToArrayThenSameMapNoExtras!161 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2001 (array!30024 array!30026 (_ BitVec 32) (_ BitVec 32) V!18619 V!18619 (_ BitVec 32) Int) ListLongMap!7541)

(assert (=> b!470832 (= lt!213664 (getCurrentListMapNoExtraKeys!2001 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470832 (= lt!213662 (getCurrentListMapNoExtraKeys!2001 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470833 () Bool)

(assert (=> b!470833 (= e!275876 tp_is_empty!13135)))

(declare-fun b!470834 () Bool)

(assert (=> b!470834 (= e!275873 tp_is_empty!13135)))

(assert (= (and start!42174 res!281333) b!470828))

(assert (= (and b!470828 res!281331) b!470829))

(assert (= (and b!470829 res!281334) b!470831))

(assert (= (and b!470831 res!281332) b!470832))

(assert (= (and b!470830 condMapEmpty!21406) mapIsEmpty!21406))

(assert (= (and b!470830 (not condMapEmpty!21406)) mapNonEmpty!21406))

(get-info :version)

(assert (= (and mapNonEmpty!21406 ((_ is ValueCellFull!6224) mapValue!21406)) b!470833))

(assert (= (and b!470830 ((_ is ValueCellFull!6224) mapDefault!21406)) b!470834))

(assert (= start!42174 b!470830))

(declare-fun m!453289 () Bool)

(assert (=> start!42174 m!453289))

(declare-fun m!453291 () Bool)

(assert (=> start!42174 m!453291))

(declare-fun m!453293 () Bool)

(assert (=> start!42174 m!453293))

(declare-fun m!453295 () Bool)

(assert (=> b!470829 m!453295))

(declare-fun m!453297 () Bool)

(assert (=> b!470831 m!453297))

(declare-fun m!453299 () Bool)

(assert (=> b!470832 m!453299))

(declare-fun m!453301 () Bool)

(assert (=> b!470832 m!453301))

(declare-fun m!453303 () Bool)

(assert (=> b!470832 m!453303))

(declare-fun m!453305 () Bool)

(assert (=> mapNonEmpty!21406 m!453305))

(check-sat tp_is_empty!13135 (not start!42174) (not b!470829) (not mapNonEmpty!21406) b_and!20147 (not b!470832) (not b!470831) (not b_next!11707))
(check-sat b_and!20147 (not b_next!11707))
