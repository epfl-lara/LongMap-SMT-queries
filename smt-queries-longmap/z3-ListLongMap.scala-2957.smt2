; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41980 () Bool)

(assert start!41980)

(declare-fun b_free!11553 () Bool)

(declare-fun b_next!11553 () Bool)

(assert (=> start!41980 (= b_free!11553 (not b_next!11553))))

(declare-fun tp!40675 () Bool)

(declare-fun b_and!19951 () Bool)

(assert (=> start!41980 (= tp!40675 b_and!19951)))

(declare-fun b!468690 () Bool)

(declare-fun e!274342 () Bool)

(declare-fun e!274343 () Bool)

(declare-fun mapRes!21166 () Bool)

(assert (=> b!468690 (= e!274342 (and e!274343 mapRes!21166))))

(declare-fun condMapEmpty!21166 () Bool)

(declare-datatypes ((V!18413 0))(
  ( (V!18414 (val!6535 Int)) )
))
(declare-datatypes ((ValueCell!6147 0))(
  ( (ValueCellFull!6147 (v!8824 V!18413)) (EmptyCell!6147) )
))
(declare-datatypes ((array!29737 0))(
  ( (array!29738 (arr!14294 (Array (_ BitVec 32) ValueCell!6147)) (size!14646 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29737)

(declare-fun mapDefault!21166 () ValueCell!6147)

(assert (=> b!468690 (= condMapEmpty!21166 (= (arr!14294 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6147)) mapDefault!21166)))))

(declare-fun mapIsEmpty!21166 () Bool)

(assert (=> mapIsEmpty!21166 mapRes!21166))

(declare-fun b!468691 () Bool)

(declare-fun e!274340 () Bool)

(declare-fun e!274338 () Bool)

(assert (=> b!468691 (= e!274340 (not e!274338))))

(declare-fun res!280090 () Bool)

(assert (=> b!468691 (=> res!280090 e!274338)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468691 (= res!280090 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8592 0))(
  ( (tuple2!8593 (_1!4307 (_ BitVec 64)) (_2!4307 V!18413)) )
))
(declare-datatypes ((List!8676 0))(
  ( (Nil!8673) (Cons!8672 (h!9528 tuple2!8592) (t!14634 List!8676)) )
))
(declare-datatypes ((ListLongMap!7505 0))(
  ( (ListLongMap!7506 (toList!3768 List!8676)) )
))
(declare-fun lt!212061 () ListLongMap!7505)

(declare-fun lt!212060 () ListLongMap!7505)

(assert (=> b!468691 (= lt!212061 lt!212060)))

(declare-fun minValueBefore!38 () V!18413)

(declare-datatypes ((Unit!13691 0))(
  ( (Unit!13692) )
))
(declare-fun lt!212065 () Unit!13691)

(declare-fun zeroValue!794 () V!18413)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29739 0))(
  ( (array!29740 (arr!14295 (Array (_ BitVec 32) (_ BitVec 64))) (size!14647 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29739)

(declare-fun minValueAfter!38 () V!18413)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!118 (array!29739 array!29737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18413 V!18413 V!18413 V!18413 (_ BitVec 32) Int) Unit!13691)

(assert (=> b!468691 (= lt!212065 (lemmaNoChangeToArrayThenSameMapNoExtras!118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1938 (array!29739 array!29737 (_ BitVec 32) (_ BitVec 32) V!18413 V!18413 (_ BitVec 32) Int) ListLongMap!7505)

(assert (=> b!468691 (= lt!212060 (getCurrentListMapNoExtraKeys!1938 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468691 (= lt!212061 (getCurrentListMapNoExtraKeys!1938 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21166 () Bool)

(declare-fun tp!40674 () Bool)

(declare-fun e!274341 () Bool)

(assert (=> mapNonEmpty!21166 (= mapRes!21166 (and tp!40674 e!274341))))

(declare-fun mapKey!21166 () (_ BitVec 32))

(declare-fun mapRest!21166 () (Array (_ BitVec 32) ValueCell!6147))

(declare-fun mapValue!21166 () ValueCell!6147)

(assert (=> mapNonEmpty!21166 (= (arr!14294 _values!833) (store mapRest!21166 mapKey!21166 mapValue!21166))))

(declare-fun b!468692 () Bool)

(declare-fun res!280093 () Bool)

(assert (=> b!468692 (=> (not res!280093) (not e!274340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29739 (_ BitVec 32)) Bool)

(assert (=> b!468692 (= res!280093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!280092 () Bool)

(assert (=> start!41980 (=> (not res!280092) (not e!274340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41980 (= res!280092 (validMask!0 mask!1365))))

(assert (=> start!41980 e!274340))

(declare-fun tp_is_empty!12981 () Bool)

(assert (=> start!41980 tp_is_empty!12981))

(assert (=> start!41980 tp!40675))

(assert (=> start!41980 true))

(declare-fun array_inv!10318 (array!29739) Bool)

(assert (=> start!41980 (array_inv!10318 _keys!1025)))

(declare-fun array_inv!10319 (array!29737) Bool)

(assert (=> start!41980 (and (array_inv!10319 _values!833) e!274342)))

(declare-fun b!468693 () Bool)

(declare-fun res!280091 () Bool)

(assert (=> b!468693 (=> (not res!280091) (not e!274340))))

(assert (=> b!468693 (= res!280091 (and (= (size!14646 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14647 _keys!1025) (size!14646 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468694 () Bool)

(assert (=> b!468694 (= e!274338 true)))

(declare-fun lt!212059 () tuple2!8592)

(declare-fun +!1680 (ListLongMap!7505 tuple2!8592) ListLongMap!7505)

(assert (=> b!468694 (= (+!1680 lt!212061 lt!212059) (+!1680 (+!1680 lt!212061 (tuple2!8593 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212059))))

(assert (=> b!468694 (= lt!212059 (tuple2!8593 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212062 () Unit!13691)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!93 (ListLongMap!7505 (_ BitVec 64) V!18413 V!18413) Unit!13691)

(assert (=> b!468694 (= lt!212062 (addSameAsAddTwiceSameKeyDiffValues!93 lt!212061 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212064 () ListLongMap!7505)

(declare-fun getCurrentListMap!2194 (array!29739 array!29737 (_ BitVec 32) (_ BitVec 32) V!18413 V!18413 (_ BitVec 32) Int) ListLongMap!7505)

(assert (=> b!468694 (= lt!212064 (getCurrentListMap!2194 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212063 () ListLongMap!7505)

(assert (=> b!468694 (= lt!212063 (getCurrentListMap!2194 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468695 () Bool)

(assert (=> b!468695 (= e!274343 tp_is_empty!12981)))

(declare-fun b!468696 () Bool)

(assert (=> b!468696 (= e!274341 tp_is_empty!12981)))

(declare-fun b!468697 () Bool)

(declare-fun res!280094 () Bool)

(assert (=> b!468697 (=> (not res!280094) (not e!274340))))

(declare-datatypes ((List!8677 0))(
  ( (Nil!8674) (Cons!8673 (h!9529 (_ BitVec 64)) (t!14635 List!8677)) )
))
(declare-fun arrayNoDuplicates!0 (array!29739 (_ BitVec 32) List!8677) Bool)

(assert (=> b!468697 (= res!280094 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8674))))

(assert (= (and start!41980 res!280092) b!468693))

(assert (= (and b!468693 res!280091) b!468692))

(assert (= (and b!468692 res!280093) b!468697))

(assert (= (and b!468697 res!280094) b!468691))

(assert (= (and b!468691 (not res!280090)) b!468694))

(assert (= (and b!468690 condMapEmpty!21166) mapIsEmpty!21166))

(assert (= (and b!468690 (not condMapEmpty!21166)) mapNonEmpty!21166))

(get-info :version)

(assert (= (and mapNonEmpty!21166 ((_ is ValueCellFull!6147) mapValue!21166)) b!468696))

(assert (= (and b!468690 ((_ is ValueCellFull!6147) mapDefault!21166)) b!468695))

(assert (= start!41980 b!468690))

(declare-fun m!450691 () Bool)

(assert (=> b!468697 m!450691))

(declare-fun m!450693 () Bool)

(assert (=> b!468692 m!450693))

(declare-fun m!450695 () Bool)

(assert (=> b!468694 m!450695))

(declare-fun m!450697 () Bool)

(assert (=> b!468694 m!450697))

(declare-fun m!450699 () Bool)

(assert (=> b!468694 m!450699))

(assert (=> b!468694 m!450695))

(declare-fun m!450701 () Bool)

(assert (=> b!468694 m!450701))

(declare-fun m!450703 () Bool)

(assert (=> b!468694 m!450703))

(declare-fun m!450705 () Bool)

(assert (=> b!468694 m!450705))

(declare-fun m!450707 () Bool)

(assert (=> b!468691 m!450707))

(declare-fun m!450709 () Bool)

(assert (=> b!468691 m!450709))

(declare-fun m!450711 () Bool)

(assert (=> b!468691 m!450711))

(declare-fun m!450713 () Bool)

(assert (=> start!41980 m!450713))

(declare-fun m!450715 () Bool)

(assert (=> start!41980 m!450715))

(declare-fun m!450717 () Bool)

(assert (=> start!41980 m!450717))

(declare-fun m!450719 () Bool)

(assert (=> mapNonEmpty!21166 m!450719))

(check-sat (not b!468697) (not b_next!11553) (not start!41980) (not b!468692) (not b!468694) b_and!19951 (not mapNonEmpty!21166) tp_is_empty!12981 (not b!468691))
(check-sat b_and!19951 (not b_next!11553))
