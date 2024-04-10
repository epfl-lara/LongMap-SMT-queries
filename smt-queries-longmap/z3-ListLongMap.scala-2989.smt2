; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42226 () Bool)

(assert start!42226)

(declare-fun b_free!11745 () Bool)

(declare-fun b_next!11745 () Bool)

(assert (=> start!42226 (= b_free!11745 (not b_next!11745))))

(declare-fun tp!41260 () Bool)

(declare-fun b_and!20175 () Bool)

(assert (=> start!42226 (= tp!41260 b_and!20175)))

(declare-fun b!471288 () Bool)

(declare-fun e!276199 () Bool)

(declare-fun tp_is_empty!13173 () Bool)

(assert (=> b!471288 (= e!276199 tp_is_empty!13173)))

(declare-fun mapNonEmpty!21463 () Bool)

(declare-fun mapRes!21463 () Bool)

(declare-fun tp!41259 () Bool)

(declare-fun e!276197 () Bool)

(assert (=> mapNonEmpty!21463 (= mapRes!21463 (and tp!41259 e!276197))))

(declare-datatypes ((V!18669 0))(
  ( (V!18670 (val!6631 Int)) )
))
(declare-datatypes ((ValueCell!6243 0))(
  ( (ValueCellFull!6243 (v!8922 V!18669)) (EmptyCell!6243) )
))
(declare-fun mapRest!21463 () (Array (_ BitVec 32) ValueCell!6243))

(declare-fun mapValue!21463 () ValueCell!6243)

(declare-datatypes ((array!30109 0))(
  ( (array!30110 (arr!14477 (Array (_ BitVec 32) ValueCell!6243)) (size!14829 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30109)

(declare-fun mapKey!21463 () (_ BitVec 32))

(assert (=> mapNonEmpty!21463 (= (arr!14477 _values!833) (store mapRest!21463 mapKey!21463 mapValue!21463))))

(declare-fun mapIsEmpty!21463 () Bool)

(assert (=> mapIsEmpty!21463 mapRes!21463))

(declare-fun b!471289 () Bool)

(declare-fun res!281568 () Bool)

(declare-fun e!276198 () Bool)

(assert (=> b!471289 (=> (not res!281568) (not e!276198))))

(declare-datatypes ((array!30111 0))(
  ( (array!30112 (arr!14478 (Array (_ BitVec 32) (_ BitVec 64))) (size!14830 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30111)

(declare-datatypes ((List!8813 0))(
  ( (Nil!8810) (Cons!8809 (h!9665 (_ BitVec 64)) (t!14777 List!8813)) )
))
(declare-fun arrayNoDuplicates!0 (array!30111 (_ BitVec 32) List!8813) Bool)

(assert (=> b!471289 (= res!281568 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8810))))

(declare-fun b!471290 () Bool)

(assert (=> b!471290 (= e!276198 (not true))))

(declare-datatypes ((tuple2!8732 0))(
  ( (tuple2!8733 (_1!4377 (_ BitVec 64)) (_2!4377 V!18669)) )
))
(declare-datatypes ((List!8814 0))(
  ( (Nil!8811) (Cons!8810 (h!9666 tuple2!8732) (t!14778 List!8814)) )
))
(declare-datatypes ((ListLongMap!7645 0))(
  ( (ListLongMap!7646 (toList!3838 List!8814)) )
))
(declare-fun lt!213822 () ListLongMap!7645)

(declare-fun lt!213823 () ListLongMap!7645)

(assert (=> b!471290 (= lt!213822 lt!213823)))

(declare-datatypes ((Unit!13835 0))(
  ( (Unit!13836) )
))
(declare-fun lt!213821 () Unit!13835)

(declare-fun minValueBefore!38 () V!18669)

(declare-fun zeroValue!794 () V!18669)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18669)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!181 (array!30111 array!30109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18669 V!18669 V!18669 V!18669 (_ BitVec 32) Int) Unit!13835)

(assert (=> b!471290 (= lt!213821 (lemmaNoChangeToArrayThenSameMapNoExtras!181 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2001 (array!30111 array!30109 (_ BitVec 32) (_ BitVec 32) V!18669 V!18669 (_ BitVec 32) Int) ListLongMap!7645)

(assert (=> b!471290 (= lt!213823 (getCurrentListMapNoExtraKeys!2001 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471290 (= lt!213822 (getCurrentListMapNoExtraKeys!2001 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471291 () Bool)

(declare-fun res!281567 () Bool)

(assert (=> b!471291 (=> (not res!281567) (not e!276198))))

(assert (=> b!471291 (= res!281567 (and (= (size!14829 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14830 _keys!1025) (size!14829 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471293 () Bool)

(assert (=> b!471293 (= e!276197 tp_is_empty!13173)))

(declare-fun b!471294 () Bool)

(declare-fun res!281569 () Bool)

(assert (=> b!471294 (=> (not res!281569) (not e!276198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30111 (_ BitVec 32)) Bool)

(assert (=> b!471294 (= res!281569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!281566 () Bool)

(assert (=> start!42226 (=> (not res!281566) (not e!276198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42226 (= res!281566 (validMask!0 mask!1365))))

(assert (=> start!42226 e!276198))

(assert (=> start!42226 tp_is_empty!13173))

(assert (=> start!42226 tp!41260))

(assert (=> start!42226 true))

(declare-fun array_inv!10442 (array!30111) Bool)

(assert (=> start!42226 (array_inv!10442 _keys!1025)))

(declare-fun e!276196 () Bool)

(declare-fun array_inv!10443 (array!30109) Bool)

(assert (=> start!42226 (and (array_inv!10443 _values!833) e!276196)))

(declare-fun b!471292 () Bool)

(assert (=> b!471292 (= e!276196 (and e!276199 mapRes!21463))))

(declare-fun condMapEmpty!21463 () Bool)

(declare-fun mapDefault!21463 () ValueCell!6243)

(assert (=> b!471292 (= condMapEmpty!21463 (= (arr!14477 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6243)) mapDefault!21463)))))

(assert (= (and start!42226 res!281566) b!471291))

(assert (= (and b!471291 res!281567) b!471294))

(assert (= (and b!471294 res!281569) b!471289))

(assert (= (and b!471289 res!281568) b!471290))

(assert (= (and b!471292 condMapEmpty!21463) mapIsEmpty!21463))

(assert (= (and b!471292 (not condMapEmpty!21463)) mapNonEmpty!21463))

(get-info :version)

(assert (= (and mapNonEmpty!21463 ((_ is ValueCellFull!6243) mapValue!21463)) b!471293))

(assert (= (and b!471292 ((_ is ValueCellFull!6243) mapDefault!21463)) b!471288))

(assert (= start!42226 b!471292))

(declare-fun m!453449 () Bool)

(assert (=> b!471290 m!453449))

(declare-fun m!453451 () Bool)

(assert (=> b!471290 m!453451))

(declare-fun m!453453 () Bool)

(assert (=> b!471290 m!453453))

(declare-fun m!453455 () Bool)

(assert (=> b!471294 m!453455))

(declare-fun m!453457 () Bool)

(assert (=> start!42226 m!453457))

(declare-fun m!453459 () Bool)

(assert (=> start!42226 m!453459))

(declare-fun m!453461 () Bool)

(assert (=> start!42226 m!453461))

(declare-fun m!453463 () Bool)

(assert (=> mapNonEmpty!21463 m!453463))

(declare-fun m!453465 () Bool)

(assert (=> b!471289 m!453465))

(check-sat (not mapNonEmpty!21463) (not b!471290) (not b!471289) (not b_next!11745) b_and!20175 (not b!471294) (not start!42226) tp_is_empty!13173)
(check-sat b_and!20175 (not b_next!11745))
