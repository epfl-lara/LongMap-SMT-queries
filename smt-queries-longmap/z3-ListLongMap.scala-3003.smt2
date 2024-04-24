; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42322 () Bool)

(assert start!42322)

(declare-fun b_free!11827 () Bool)

(declare-fun b_next!11827 () Bool)

(assert (=> start!42322 (= b_free!11827 (not b_next!11827))))

(declare-fun tp!41511 () Bool)

(declare-fun b_and!20283 () Bool)

(assert (=> start!42322 (= tp!41511 b_and!20283)))

(declare-fun b!472287 () Bool)

(declare-fun e!276916 () Bool)

(declare-fun e!276913 () Bool)

(assert (=> b!472287 (= e!276916 (not e!276913))))

(declare-fun res!282142 () Bool)

(assert (=> b!472287 (=> res!282142 e!276913)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472287 (= res!282142 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18779 0))(
  ( (V!18780 (val!6672 Int)) )
))
(declare-datatypes ((tuple2!8710 0))(
  ( (tuple2!8711 (_1!4366 (_ BitVec 64)) (_2!4366 V!18779)) )
))
(declare-datatypes ((List!8776 0))(
  ( (Nil!8773) (Cons!8772 (h!9628 tuple2!8710) (t!14736 List!8776)) )
))
(declare-datatypes ((ListLongMap!7625 0))(
  ( (ListLongMap!7626 (toList!3828 List!8776)) )
))
(declare-fun lt!214313 () ListLongMap!7625)

(declare-fun lt!214311 () ListLongMap!7625)

(assert (=> b!472287 (= lt!214313 lt!214311)))

(declare-fun minValueBefore!38 () V!18779)

(declare-fun zeroValue!794 () V!18779)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13867 0))(
  ( (Unit!13868) )
))
(declare-fun lt!214314 () Unit!13867)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30256 0))(
  ( (array!30257 (arr!14548 (Array (_ BitVec 32) (_ BitVec 64))) (size!14900 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30256)

(declare-datatypes ((ValueCell!6284 0))(
  ( (ValueCellFull!6284 (v!8964 V!18779)) (EmptyCell!6284) )
))
(declare-datatypes ((array!30258 0))(
  ( (array!30259 (arr!14549 (Array (_ BitVec 32) ValueCell!6284)) (size!14901 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30258)

(declare-fun minValueAfter!38 () V!18779)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!202 (array!30256 array!30258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18779 V!18779 V!18779 V!18779 (_ BitVec 32) Int) Unit!13867)

(assert (=> b!472287 (= lt!214314 (lemmaNoChangeToArrayThenSameMapNoExtras!202 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2042 (array!30256 array!30258 (_ BitVec 32) (_ BitVec 32) V!18779 V!18779 (_ BitVec 32) Int) ListLongMap!7625)

(assert (=> b!472287 (= lt!214311 (getCurrentListMapNoExtraKeys!2042 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472287 (= lt!214313 (getCurrentListMapNoExtraKeys!2042 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472288 () Bool)

(declare-fun res!282146 () Bool)

(assert (=> b!472288 (=> (not res!282146) (not e!276916))))

(assert (=> b!472288 (= res!282146 (and (= (size!14901 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14900 _keys!1025) (size!14901 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472289 () Bool)

(assert (=> b!472289 (= e!276913 true)))

(declare-fun lt!214312 () ListLongMap!7625)

(declare-fun getCurrentListMap!2196 (array!30256 array!30258 (_ BitVec 32) (_ BitVec 32) V!18779 V!18779 (_ BitVec 32) Int) ListLongMap!7625)

(assert (=> b!472289 (= lt!214312 (getCurrentListMap!2196 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472290 () Bool)

(declare-fun e!276912 () Bool)

(declare-fun e!276914 () Bool)

(declare-fun mapRes!21592 () Bool)

(assert (=> b!472290 (= e!276912 (and e!276914 mapRes!21592))))

(declare-fun condMapEmpty!21592 () Bool)

(declare-fun mapDefault!21592 () ValueCell!6284)

(assert (=> b!472290 (= condMapEmpty!21592 (= (arr!14549 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6284)) mapDefault!21592)))))

(declare-fun mapIsEmpty!21592 () Bool)

(assert (=> mapIsEmpty!21592 mapRes!21592))

(declare-fun mapNonEmpty!21592 () Bool)

(declare-fun tp!41512 () Bool)

(declare-fun e!276915 () Bool)

(assert (=> mapNonEmpty!21592 (= mapRes!21592 (and tp!41512 e!276915))))

(declare-fun mapRest!21592 () (Array (_ BitVec 32) ValueCell!6284))

(declare-fun mapValue!21592 () ValueCell!6284)

(declare-fun mapKey!21592 () (_ BitVec 32))

(assert (=> mapNonEmpty!21592 (= (arr!14549 _values!833) (store mapRest!21592 mapKey!21592 mapValue!21592))))

(declare-fun res!282143 () Bool)

(assert (=> start!42322 (=> (not res!282143) (not e!276916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42322 (= res!282143 (validMask!0 mask!1365))))

(assert (=> start!42322 e!276916))

(declare-fun tp_is_empty!13255 () Bool)

(assert (=> start!42322 tp_is_empty!13255))

(assert (=> start!42322 tp!41511))

(assert (=> start!42322 true))

(declare-fun array_inv!10578 (array!30256) Bool)

(assert (=> start!42322 (array_inv!10578 _keys!1025)))

(declare-fun array_inv!10579 (array!30258) Bool)

(assert (=> start!42322 (and (array_inv!10579 _values!833) e!276912)))

(declare-fun b!472291 () Bool)

(assert (=> b!472291 (= e!276914 tp_is_empty!13255)))

(declare-fun b!472292 () Bool)

(declare-fun res!282144 () Bool)

(assert (=> b!472292 (=> (not res!282144) (not e!276916))))

(declare-datatypes ((List!8777 0))(
  ( (Nil!8774) (Cons!8773 (h!9629 (_ BitVec 64)) (t!14737 List!8777)) )
))
(declare-fun arrayNoDuplicates!0 (array!30256 (_ BitVec 32) List!8777) Bool)

(assert (=> b!472292 (= res!282144 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8774))))

(declare-fun b!472293 () Bool)

(assert (=> b!472293 (= e!276915 tp_is_empty!13255)))

(declare-fun b!472294 () Bool)

(declare-fun res!282145 () Bool)

(assert (=> b!472294 (=> (not res!282145) (not e!276916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30256 (_ BitVec 32)) Bool)

(assert (=> b!472294 (= res!282145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42322 res!282143) b!472288))

(assert (= (and b!472288 res!282146) b!472294))

(assert (= (and b!472294 res!282145) b!472292))

(assert (= (and b!472292 res!282144) b!472287))

(assert (= (and b!472287 (not res!282142)) b!472289))

(assert (= (and b!472290 condMapEmpty!21592) mapIsEmpty!21592))

(assert (= (and b!472290 (not condMapEmpty!21592)) mapNonEmpty!21592))

(get-info :version)

(assert (= (and mapNonEmpty!21592 ((_ is ValueCellFull!6284) mapValue!21592)) b!472293))

(assert (= (and b!472290 ((_ is ValueCellFull!6284) mapDefault!21592)) b!472291))

(assert (= start!42322 b!472290))

(declare-fun m!454519 () Bool)

(assert (=> b!472289 m!454519))

(declare-fun m!454521 () Bool)

(assert (=> b!472294 m!454521))

(declare-fun m!454523 () Bool)

(assert (=> mapNonEmpty!21592 m!454523))

(declare-fun m!454525 () Bool)

(assert (=> start!42322 m!454525))

(declare-fun m!454527 () Bool)

(assert (=> start!42322 m!454527))

(declare-fun m!454529 () Bool)

(assert (=> start!42322 m!454529))

(declare-fun m!454531 () Bool)

(assert (=> b!472287 m!454531))

(declare-fun m!454533 () Bool)

(assert (=> b!472287 m!454533))

(declare-fun m!454535 () Bool)

(assert (=> b!472287 m!454535))

(declare-fun m!454537 () Bool)

(assert (=> b!472292 m!454537))

(check-sat (not b!472294) (not start!42322) (not b!472292) b_and!20283 (not b!472287) (not b!472289) (not b_next!11827) (not mapNonEmpty!21592) tp_is_empty!13255)
(check-sat b_and!20283 (not b_next!11827))
