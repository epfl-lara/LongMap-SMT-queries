; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41964 () Bool)

(assert start!41964)

(declare-fun b_free!11551 () Bool)

(declare-fun b_next!11551 () Bool)

(assert (=> start!41964 (= b_free!11551 (not b_next!11551))))

(declare-fun tp!40668 () Bool)

(declare-fun b_and!19959 () Bool)

(assert (=> start!41964 (= tp!40668 b_and!19959)))

(declare-fun mapNonEmpty!21163 () Bool)

(declare-fun mapRes!21163 () Bool)

(declare-fun tp!40669 () Bool)

(declare-fun e!274283 () Bool)

(assert (=> mapNonEmpty!21163 (= mapRes!21163 (and tp!40669 e!274283))))

(declare-datatypes ((V!18411 0))(
  ( (V!18412 (val!6534 Int)) )
))
(declare-datatypes ((ValueCell!6146 0))(
  ( (ValueCellFull!6146 (v!8824 V!18411)) (EmptyCell!6146) )
))
(declare-fun mapRest!21163 () (Array (_ BitVec 32) ValueCell!6146))

(declare-datatypes ((array!29722 0))(
  ( (array!29723 (arr!14286 (Array (_ BitVec 32) ValueCell!6146)) (size!14638 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29722)

(declare-fun mapValue!21163 () ValueCell!6146)

(declare-fun mapKey!21163 () (_ BitVec 32))

(assert (=> mapNonEmpty!21163 (= (arr!14286 _values!833) (store mapRest!21163 mapKey!21163 mapValue!21163))))

(declare-fun res!280072 () Bool)

(declare-fun e!274285 () Bool)

(assert (=> start!41964 (=> (not res!280072) (not e!274285))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41964 (= res!280072 (validMask!0 mask!1365))))

(assert (=> start!41964 e!274285))

(declare-fun tp_is_empty!12979 () Bool)

(assert (=> start!41964 tp_is_empty!12979))

(assert (=> start!41964 tp!40668))

(assert (=> start!41964 true))

(declare-datatypes ((array!29724 0))(
  ( (array!29725 (arr!14287 (Array (_ BitVec 32) (_ BitVec 64))) (size!14639 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29724)

(declare-fun array_inv!10402 (array!29724) Bool)

(assert (=> start!41964 (array_inv!10402 _keys!1025)))

(declare-fun e!274284 () Bool)

(declare-fun array_inv!10403 (array!29722) Bool)

(assert (=> start!41964 (and (array_inv!10403 _values!833) e!274284)))

(declare-fun b!468605 () Bool)

(declare-fun e!274286 () Bool)

(assert (=> b!468605 (= e!274284 (and e!274286 mapRes!21163))))

(declare-fun condMapEmpty!21163 () Bool)

(declare-fun mapDefault!21163 () ValueCell!6146)

(assert (=> b!468605 (= condMapEmpty!21163 (= (arr!14286 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6146)) mapDefault!21163)))))

(declare-fun b!468606 () Bool)

(declare-fun res!280069 () Bool)

(assert (=> b!468606 (=> (not res!280069) (not e!274285))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468606 (= res!280069 (and (= (size!14638 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14639 _keys!1025) (size!14638 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468607 () Bool)

(declare-fun res!280070 () Bool)

(assert (=> b!468607 (=> (not res!280070) (not e!274285))))

(declare-datatypes ((List!8586 0))(
  ( (Nil!8583) (Cons!8582 (h!9438 (_ BitVec 64)) (t!14536 List!8586)) )
))
(declare-fun arrayNoDuplicates!0 (array!29724 (_ BitVec 32) List!8586) Bool)

(assert (=> b!468607 (= res!280070 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8583))))

(declare-fun mapIsEmpty!21163 () Bool)

(assert (=> mapIsEmpty!21163 mapRes!21163))

(declare-fun b!468608 () Bool)

(assert (=> b!468608 (= e!274283 tp_is_empty!12979)))

(declare-fun b!468609 () Bool)

(declare-fun res!280068 () Bool)

(assert (=> b!468609 (=> (not res!280068) (not e!274285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29724 (_ BitVec 32)) Bool)

(assert (=> b!468609 (= res!280068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468610 () Bool)

(declare-fun e!274281 () Bool)

(assert (=> b!468610 (= e!274285 (not e!274281))))

(declare-fun res!280071 () Bool)

(assert (=> b!468610 (=> res!280071 e!274281)))

(assert (=> b!468610 (= res!280071 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8510 0))(
  ( (tuple2!8511 (_1!4266 (_ BitVec 64)) (_2!4266 V!18411)) )
))
(declare-datatypes ((List!8587 0))(
  ( (Nil!8584) (Cons!8583 (h!9439 tuple2!8510) (t!14537 List!8587)) )
))
(declare-datatypes ((ListLongMap!7425 0))(
  ( (ListLongMap!7426 (toList!3728 List!8587)) )
))
(declare-fun lt!212053 () ListLongMap!7425)

(declare-fun lt!212051 () ListLongMap!7425)

(assert (=> b!468610 (= lt!212053 lt!212051)))

(declare-fun minValueBefore!38 () V!18411)

(declare-fun zeroValue!794 () V!18411)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13665 0))(
  ( (Unit!13666) )
))
(declare-fun lt!212055 () Unit!13665)

(declare-fun minValueAfter!38 () V!18411)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!107 (array!29724 array!29722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 V!18411 V!18411 (_ BitVec 32) Int) Unit!13665)

(assert (=> b!468610 (= lt!212055 (lemmaNoChangeToArrayThenSameMapNoExtras!107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1947 (array!29724 array!29722 (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 (_ BitVec 32) Int) ListLongMap!7425)

(assert (=> b!468610 (= lt!212051 (getCurrentListMapNoExtraKeys!1947 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468610 (= lt!212053 (getCurrentListMapNoExtraKeys!1947 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468611 () Bool)

(assert (=> b!468611 (= e!274286 tp_is_empty!12979)))

(declare-fun b!468612 () Bool)

(assert (=> b!468612 (= e!274281 true)))

(declare-fun lt!212050 () tuple2!8510)

(declare-fun +!1690 (ListLongMap!7425 tuple2!8510) ListLongMap!7425)

(assert (=> b!468612 (= (+!1690 lt!212053 lt!212050) (+!1690 (+!1690 lt!212053 (tuple2!8511 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212050))))

(assert (=> b!468612 (= lt!212050 (tuple2!8511 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212052 () Unit!13665)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!96 (ListLongMap!7425 (_ BitVec 64) V!18411 V!18411) Unit!13665)

(assert (=> b!468612 (= lt!212052 (addSameAsAddTwiceSameKeyDiffValues!96 lt!212053 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212056 () ListLongMap!7425)

(declare-fun getCurrentListMap!2156 (array!29724 array!29722 (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 (_ BitVec 32) Int) ListLongMap!7425)

(assert (=> b!468612 (= lt!212056 (getCurrentListMap!2156 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212054 () ListLongMap!7425)

(assert (=> b!468612 (= lt!212054 (getCurrentListMap!2156 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41964 res!280072) b!468606))

(assert (= (and b!468606 res!280069) b!468609))

(assert (= (and b!468609 res!280068) b!468607))

(assert (= (and b!468607 res!280070) b!468610))

(assert (= (and b!468610 (not res!280071)) b!468612))

(assert (= (and b!468605 condMapEmpty!21163) mapIsEmpty!21163))

(assert (= (and b!468605 (not condMapEmpty!21163)) mapNonEmpty!21163))

(get-info :version)

(assert (= (and mapNonEmpty!21163 ((_ is ValueCellFull!6146) mapValue!21163)) b!468608))

(assert (= (and b!468605 ((_ is ValueCellFull!6146) mapDefault!21163)) b!468611))

(assert (= start!41964 b!468605))

(declare-fun m!450843 () Bool)

(assert (=> mapNonEmpty!21163 m!450843))

(declare-fun m!450845 () Bool)

(assert (=> b!468607 m!450845))

(declare-fun m!450847 () Bool)

(assert (=> b!468612 m!450847))

(declare-fun m!450849 () Bool)

(assert (=> b!468612 m!450849))

(declare-fun m!450851 () Bool)

(assert (=> b!468612 m!450851))

(declare-fun m!450853 () Bool)

(assert (=> b!468612 m!450853))

(assert (=> b!468612 m!450851))

(declare-fun m!450855 () Bool)

(assert (=> b!468612 m!450855))

(declare-fun m!450857 () Bool)

(assert (=> b!468612 m!450857))

(declare-fun m!450859 () Bool)

(assert (=> b!468610 m!450859))

(declare-fun m!450861 () Bool)

(assert (=> b!468610 m!450861))

(declare-fun m!450863 () Bool)

(assert (=> b!468610 m!450863))

(declare-fun m!450865 () Bool)

(assert (=> start!41964 m!450865))

(declare-fun m!450867 () Bool)

(assert (=> start!41964 m!450867))

(declare-fun m!450869 () Bool)

(assert (=> start!41964 m!450869))

(declare-fun m!450871 () Bool)

(assert (=> b!468609 m!450871))

(check-sat (not b_next!11551) (not start!41964) (not b!468609) b_and!19959 tp_is_empty!12979 (not mapNonEmpty!21163) (not b!468607) (not b!468610) (not b!468612))
(check-sat b_and!19959 (not b_next!11551))
