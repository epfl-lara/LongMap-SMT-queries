; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42380 () Bool)

(assert start!42380)

(declare-fun b_free!11869 () Bool)

(declare-fun b_next!11869 () Bool)

(assert (=> start!42380 (= b_free!11869 (not b_next!11869))))

(declare-fun tp!41640 () Bool)

(declare-fun b_and!20299 () Bool)

(assert (=> start!42380 (= tp!41640 b_and!20299)))

(declare-fun b!472729 () Bool)

(declare-fun e!277253 () Bool)

(declare-fun tp_is_empty!13297 () Bool)

(assert (=> b!472729 (= e!277253 tp_is_empty!13297)))

(declare-fun b!472730 () Bool)

(declare-fun res!282397 () Bool)

(declare-fun e!277249 () Bool)

(assert (=> b!472730 (=> (not res!282397) (not e!277249))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30335 0))(
  ( (array!30336 (arr!14587 (Array (_ BitVec 32) (_ BitVec 64))) (size!14940 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30335)

(declare-datatypes ((V!18835 0))(
  ( (V!18836 (val!6693 Int)) )
))
(declare-datatypes ((ValueCell!6305 0))(
  ( (ValueCellFull!6305 (v!8978 V!18835)) (EmptyCell!6305) )
))
(declare-datatypes ((array!30337 0))(
  ( (array!30338 (arr!14588 (Array (_ BitVec 32) ValueCell!6305)) (size!14941 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30337)

(assert (=> b!472730 (= res!282397 (and (= (size!14941 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14940 _keys!1025) (size!14941 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21658 () Bool)

(declare-fun mapRes!21658 () Bool)

(declare-fun tp!41641 () Bool)

(declare-fun e!277252 () Bool)

(assert (=> mapNonEmpty!21658 (= mapRes!21658 (and tp!41641 e!277252))))

(declare-fun mapRest!21658 () (Array (_ BitVec 32) ValueCell!6305))

(declare-fun mapValue!21658 () ValueCell!6305)

(declare-fun mapKey!21658 () (_ BitVec 32))

(assert (=> mapNonEmpty!21658 (= (arr!14588 _values!833) (store mapRest!21658 mapKey!21658 mapValue!21658))))

(declare-fun b!472731 () Bool)

(declare-fun res!282393 () Bool)

(assert (=> b!472731 (=> (not res!282393) (not e!277249))))

(declare-datatypes ((List!8931 0))(
  ( (Nil!8928) (Cons!8927 (h!9783 (_ BitVec 64)) (t!14892 List!8931)) )
))
(declare-fun arrayNoDuplicates!0 (array!30335 (_ BitVec 32) List!8931) Bool)

(assert (=> b!472731 (= res!282393 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8928))))

(declare-fun b!472732 () Bool)

(declare-fun e!277250 () Bool)

(assert (=> b!472732 (= e!277250 (and e!277253 mapRes!21658))))

(declare-fun condMapEmpty!21658 () Bool)

(declare-fun mapDefault!21658 () ValueCell!6305)

(assert (=> b!472732 (= condMapEmpty!21658 (= (arr!14588 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6305)) mapDefault!21658)))))

(declare-fun b!472733 () Bool)

(assert (=> b!472733 (= e!277252 tp_is_empty!13297)))

(declare-fun mapIsEmpty!21658 () Bool)

(assert (=> mapIsEmpty!21658 mapRes!21658))

(declare-fun res!282396 () Bool)

(assert (=> start!42380 (=> (not res!282396) (not e!277249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42380 (= res!282396 (validMask!0 mask!1365))))

(assert (=> start!42380 e!277249))

(assert (=> start!42380 tp_is_empty!13297))

(assert (=> start!42380 tp!41640))

(assert (=> start!42380 true))

(declare-fun array_inv!10612 (array!30335) Bool)

(assert (=> start!42380 (array_inv!10612 _keys!1025)))

(declare-fun array_inv!10613 (array!30337) Bool)

(assert (=> start!42380 (and (array_inv!10613 _values!833) e!277250)))

(declare-fun b!472734 () Bool)

(declare-fun res!282394 () Bool)

(assert (=> b!472734 (=> (not res!282394) (not e!277249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30335 (_ BitVec 32)) Bool)

(assert (=> b!472734 (= res!282394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472735 () Bool)

(declare-fun e!277251 () Bool)

(assert (=> b!472735 (= e!277249 (not e!277251))))

(declare-fun res!282395 () Bool)

(assert (=> b!472735 (=> res!282395 e!277251)))

(assert (=> b!472735 (= res!282395 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8862 0))(
  ( (tuple2!8863 (_1!4442 (_ BitVec 64)) (_2!4442 V!18835)) )
))
(declare-datatypes ((List!8932 0))(
  ( (Nil!8929) (Cons!8928 (h!9784 tuple2!8862) (t!14893 List!8932)) )
))
(declare-datatypes ((ListLongMap!7765 0))(
  ( (ListLongMap!7766 (toList!3898 List!8932)) )
))
(declare-fun lt!214474 () ListLongMap!7765)

(declare-fun lt!214470 () ListLongMap!7765)

(assert (=> b!472735 (= lt!214474 lt!214470)))

(declare-fun minValueBefore!38 () V!18835)

(declare-fun zeroValue!794 () V!18835)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18835)

(declare-datatypes ((Unit!13890 0))(
  ( (Unit!13891) )
))
(declare-fun lt!214468 () Unit!13890)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!226 (array!30335 array!30337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18835 V!18835 V!18835 V!18835 (_ BitVec 32) Int) Unit!13890)

(assert (=> b!472735 (= lt!214468 (lemmaNoChangeToArrayThenSameMapNoExtras!226 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2069 (array!30335 array!30337 (_ BitVec 32) (_ BitVec 32) V!18835 V!18835 (_ BitVec 32) Int) ListLongMap!7765)

(assert (=> b!472735 (= lt!214470 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472735 (= lt!214474 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472736 () Bool)

(assert (=> b!472736 (= e!277251 true)))

(declare-fun lt!214469 () ListLongMap!7765)

(declare-fun lt!214473 () tuple2!8862)

(declare-fun +!1750 (ListLongMap!7765 tuple2!8862) ListLongMap!7765)

(assert (=> b!472736 (= (+!1750 lt!214469 lt!214473) (+!1750 (+!1750 lt!214469 (tuple2!8863 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214473))))

(assert (=> b!472736 (= lt!214473 (tuple2!8863 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214467 () Unit!13890)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!129 (ListLongMap!7765 (_ BitVec 64) V!18835 V!18835) Unit!13890)

(assert (=> b!472736 (= lt!214467 (addSameAsAddTwiceSameKeyDiffValues!129 lt!214469 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!472736 (= lt!214469 (+!1750 lt!214474 (tuple2!8863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214472 () ListLongMap!7765)

(declare-fun getCurrentListMap!2202 (array!30335 array!30337 (_ BitVec 32) (_ BitVec 32) V!18835 V!18835 (_ BitVec 32) Int) ListLongMap!7765)

(assert (=> b!472736 (= lt!214472 (getCurrentListMap!2202 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214471 () ListLongMap!7765)

(assert (=> b!472736 (= lt!214471 (getCurrentListMap!2202 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42380 res!282396) b!472730))

(assert (= (and b!472730 res!282397) b!472734))

(assert (= (and b!472734 res!282394) b!472731))

(assert (= (and b!472731 res!282393) b!472735))

(assert (= (and b!472735 (not res!282395)) b!472736))

(assert (= (and b!472732 condMapEmpty!21658) mapIsEmpty!21658))

(assert (= (and b!472732 (not condMapEmpty!21658)) mapNonEmpty!21658))

(get-info :version)

(assert (= (and mapNonEmpty!21658 ((_ is ValueCellFull!6305) mapValue!21658)) b!472733))

(assert (= (and b!472732 ((_ is ValueCellFull!6305) mapDefault!21658)) b!472729))

(assert (= start!42380 b!472732))

(declare-fun m!454171 () Bool)

(assert (=> b!472736 m!454171))

(declare-fun m!454173 () Bool)

(assert (=> b!472736 m!454173))

(declare-fun m!454175 () Bool)

(assert (=> b!472736 m!454175))

(declare-fun m!454177 () Bool)

(assert (=> b!472736 m!454177))

(assert (=> b!472736 m!454171))

(declare-fun m!454179 () Bool)

(assert (=> b!472736 m!454179))

(declare-fun m!454181 () Bool)

(assert (=> b!472736 m!454181))

(declare-fun m!454183 () Bool)

(assert (=> b!472736 m!454183))

(declare-fun m!454185 () Bool)

(assert (=> start!42380 m!454185))

(declare-fun m!454187 () Bool)

(assert (=> start!42380 m!454187))

(declare-fun m!454189 () Bool)

(assert (=> start!42380 m!454189))

(declare-fun m!454191 () Bool)

(assert (=> b!472734 m!454191))

(declare-fun m!454193 () Bool)

(assert (=> b!472735 m!454193))

(declare-fun m!454195 () Bool)

(assert (=> b!472735 m!454195))

(declare-fun m!454197 () Bool)

(assert (=> b!472735 m!454197))

(declare-fun m!454199 () Bool)

(assert (=> b!472731 m!454199))

(declare-fun m!454201 () Bool)

(assert (=> mapNonEmpty!21658 m!454201))

(check-sat (not b!472736) (not b!472731) (not b!472735) tp_is_empty!13297 (not b_next!11869) (not mapNonEmpty!21658) (not start!42380) (not b!472734) b_and!20299)
(check-sat b_and!20299 (not b_next!11869))
