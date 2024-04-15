; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41116 () Bool)

(assert start!41116)

(declare-fun b_free!10999 () Bool)

(declare-fun b_next!10999 () Bool)

(assert (=> start!41116 (= b_free!10999 (not b_next!10999))))

(declare-fun tp!38832 () Bool)

(declare-fun b_and!19211 () Bool)

(assert (=> start!41116 (= tp!38832 b_and!19211)))

(declare-fun b!458547 () Bool)

(declare-fun res!273989 () Bool)

(declare-fun e!267690 () Bool)

(assert (=> b!458547 (=> (not res!273989) (not e!267690))))

(declare-datatypes ((array!28471 0))(
  ( (array!28472 (arr!13676 (Array (_ BitVec 32) (_ BitVec 64))) (size!14029 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28471)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458547 (= res!273989 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458548 () Bool)

(declare-fun res!273988 () Bool)

(assert (=> b!458548 (=> (not res!273988) (not e!267690))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17555 0))(
  ( (V!17556 (val!6213 Int)) )
))
(declare-datatypes ((ValueCell!5825 0))(
  ( (ValueCellFull!5825 (v!8485 V!17555)) (EmptyCell!5825) )
))
(declare-datatypes ((array!28473 0))(
  ( (array!28474 (arr!13677 (Array (_ BitVec 32) ValueCell!5825)) (size!14030 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28473)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!458548 (= res!273988 (and (= (size!14030 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14029 _keys!709) (size!14030 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458549 () Bool)

(declare-fun res!273997 () Bool)

(assert (=> b!458549 (=> (not res!273997) (not e!267690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28471 (_ BitVec 32)) Bool)

(assert (=> b!458549 (= res!273997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!20155 () Bool)

(declare-fun mapRes!20155 () Bool)

(declare-fun tp!38833 () Bool)

(declare-fun e!267694 () Bool)

(assert (=> mapNonEmpty!20155 (= mapRes!20155 (and tp!38833 e!267694))))

(declare-fun mapValue!20155 () ValueCell!5825)

(declare-fun mapKey!20155 () (_ BitVec 32))

(declare-fun mapRest!20155 () (Array (_ BitVec 32) ValueCell!5825))

(assert (=> mapNonEmpty!20155 (= (arr!13677 _values!549) (store mapRest!20155 mapKey!20155 mapValue!20155))))

(declare-fun b!458550 () Bool)

(declare-fun e!267696 () Bool)

(declare-fun tp_is_empty!12337 () Bool)

(assert (=> b!458550 (= e!267696 tp_is_empty!12337)))

(declare-fun res!273984 () Bool)

(assert (=> start!41116 (=> (not res!273984) (not e!267690))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!41116 (= res!273984 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14029 _keys!709))))))

(assert (=> start!41116 e!267690))

(assert (=> start!41116 tp_is_empty!12337))

(assert (=> start!41116 tp!38832))

(assert (=> start!41116 true))

(declare-fun e!267693 () Bool)

(declare-fun array_inv!9960 (array!28473) Bool)

(assert (=> start!41116 (and (array_inv!9960 _values!549) e!267693)))

(declare-fun array_inv!9961 (array!28471) Bool)

(assert (=> start!41116 (array_inv!9961 _keys!709)))

(declare-fun b!458551 () Bool)

(declare-fun res!273985 () Bool)

(declare-fun e!267691 () Bool)

(assert (=> b!458551 (=> (not res!273985) (not e!267691))))

(declare-fun lt!207320 () array!28471)

(declare-datatypes ((List!8282 0))(
  ( (Nil!8279) (Cons!8278 (h!9134 (_ BitVec 64)) (t!14151 List!8282)) )
))
(declare-fun arrayNoDuplicates!0 (array!28471 (_ BitVec 32) List!8282) Bool)

(assert (=> b!458551 (= res!273985 (arrayNoDuplicates!0 lt!207320 #b00000000000000000000000000000000 Nil!8279))))

(declare-fun b!458552 () Bool)

(declare-fun e!267695 () Bool)

(assert (=> b!458552 (= e!267695 true)))

(assert (=> b!458552 false))

(declare-datatypes ((Unit!13301 0))(
  ( (Unit!13302) )
))
(declare-fun lt!207315 () Unit!13301)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28471 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13301)

(assert (=> b!458552 (= lt!207315 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(declare-fun b!458553 () Bool)

(declare-fun e!267692 () Bool)

(assert (=> b!458553 (= e!267691 e!267692)))

(declare-fun res!273990 () Bool)

(assert (=> b!458553 (=> (not res!273990) (not e!267692))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458553 (= res!273990 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17555)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8218 0))(
  ( (tuple2!8219 (_1!4120 (_ BitVec 64)) (_2!4120 V!17555)) )
))
(declare-datatypes ((List!8283 0))(
  ( (Nil!8280) (Cons!8279 (h!9135 tuple2!8218) (t!14152 List!8283)) )
))
(declare-datatypes ((ListLongMap!7121 0))(
  ( (ListLongMap!7122 (toList!3576 List!8283)) )
))
(declare-fun lt!207316 () ListLongMap!7121)

(declare-fun lt!207322 () array!28473)

(declare-fun zeroValue!515 () V!17555)

(declare-fun getCurrentListMapNoExtraKeys!1770 (array!28471 array!28473 (_ BitVec 32) (_ BitVec 32) V!17555 V!17555 (_ BitVec 32) Int) ListLongMap!7121)

(assert (=> b!458553 (= lt!207316 (getCurrentListMapNoExtraKeys!1770 lt!207320 lt!207322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17555)

(assert (=> b!458553 (= lt!207322 (array!28474 (store (arr!13677 _values!549) i!563 (ValueCellFull!5825 v!412)) (size!14030 _values!549)))))

(declare-fun lt!207319 () ListLongMap!7121)

(assert (=> b!458553 (= lt!207319 (getCurrentListMapNoExtraKeys!1770 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458554 () Bool)

(assert (=> b!458554 (= e!267694 tp_is_empty!12337)))

(declare-fun b!458555 () Bool)

(declare-fun res!273992 () Bool)

(assert (=> b!458555 (=> (not res!273992) (not e!267690))))

(assert (=> b!458555 (= res!273992 (or (= (select (arr!13676 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13676 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458556 () Bool)

(declare-fun e!267689 () Bool)

(assert (=> b!458556 (= e!267692 (not e!267689))))

(declare-fun res!273995 () Bool)

(assert (=> b!458556 (=> res!273995 e!267689)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458556 (= res!273995 (not (validKeyInArray!0 (select (arr!13676 _keys!709) from!863))))))

(declare-fun lt!207323 () ListLongMap!7121)

(declare-fun lt!207317 () ListLongMap!7121)

(assert (=> b!458556 (= lt!207323 lt!207317)))

(declare-fun lt!207318 () ListLongMap!7121)

(declare-fun +!1629 (ListLongMap!7121 tuple2!8218) ListLongMap!7121)

(assert (=> b!458556 (= lt!207317 (+!1629 lt!207318 (tuple2!8219 k0!794 v!412)))))

(assert (=> b!458556 (= lt!207323 (getCurrentListMapNoExtraKeys!1770 lt!207320 lt!207322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458556 (= lt!207318 (getCurrentListMapNoExtraKeys!1770 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207321 () Unit!13301)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!763 (array!28471 array!28473 (_ BitVec 32) (_ BitVec 32) V!17555 V!17555 (_ BitVec 32) (_ BitVec 64) V!17555 (_ BitVec 32) Int) Unit!13301)

(assert (=> b!458556 (= lt!207321 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!763 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458557 () Bool)

(assert (=> b!458557 (= e!267693 (and e!267696 mapRes!20155))))

(declare-fun condMapEmpty!20155 () Bool)

(declare-fun mapDefault!20155 () ValueCell!5825)

(assert (=> b!458557 (= condMapEmpty!20155 (= (arr!13677 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5825)) mapDefault!20155)))))

(declare-fun b!458558 () Bool)

(declare-fun res!273993 () Bool)

(assert (=> b!458558 (=> (not res!273993) (not e!267690))))

(assert (=> b!458558 (= res!273993 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14029 _keys!709))))))

(declare-fun b!458559 () Bool)

(declare-fun res!273991 () Bool)

(assert (=> b!458559 (=> (not res!273991) (not e!267691))))

(assert (=> b!458559 (= res!273991 (bvsle from!863 i!563))))

(declare-fun b!458560 () Bool)

(declare-fun res!273986 () Bool)

(assert (=> b!458560 (=> (not res!273986) (not e!267690))))

(assert (=> b!458560 (= res!273986 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8279))))

(declare-fun b!458561 () Bool)

(assert (=> b!458561 (= e!267689 e!267695)))

(declare-fun res!273994 () Bool)

(assert (=> b!458561 (=> res!273994 e!267695)))

(assert (=> b!458561 (= res!273994 (not (= (select (arr!13676 _keys!709) from!863) k0!794)))))

(declare-fun get!6747 (ValueCell!5825 V!17555) V!17555)

(declare-fun dynLambda!890 (Int (_ BitVec 64)) V!17555)

(assert (=> b!458561 (= lt!207316 (+!1629 lt!207317 (tuple2!8219 (select (arr!13676 _keys!709) from!863) (get!6747 (select (arr!13677 _values!549) from!863) (dynLambda!890 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458562 () Bool)

(assert (=> b!458562 (= e!267690 e!267691)))

(declare-fun res!273983 () Bool)

(assert (=> b!458562 (=> (not res!273983) (not e!267691))))

(assert (=> b!458562 (= res!273983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207320 mask!1025))))

(assert (=> b!458562 (= lt!207320 (array!28472 (store (arr!13676 _keys!709) i!563 k0!794) (size!14029 _keys!709)))))

(declare-fun b!458563 () Bool)

(declare-fun res!273996 () Bool)

(assert (=> b!458563 (=> (not res!273996) (not e!267690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458563 (= res!273996 (validMask!0 mask!1025))))

(declare-fun b!458564 () Bool)

(declare-fun res!273987 () Bool)

(assert (=> b!458564 (=> (not res!273987) (not e!267690))))

(assert (=> b!458564 (= res!273987 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!20155 () Bool)

(assert (=> mapIsEmpty!20155 mapRes!20155))

(assert (= (and start!41116 res!273984) b!458563))

(assert (= (and b!458563 res!273996) b!458548))

(assert (= (and b!458548 res!273988) b!458549))

(assert (= (and b!458549 res!273997) b!458560))

(assert (= (and b!458560 res!273986) b!458558))

(assert (= (and b!458558 res!273993) b!458564))

(assert (= (and b!458564 res!273987) b!458555))

(assert (= (and b!458555 res!273992) b!458547))

(assert (= (and b!458547 res!273989) b!458562))

(assert (= (and b!458562 res!273983) b!458551))

(assert (= (and b!458551 res!273985) b!458559))

(assert (= (and b!458559 res!273991) b!458553))

(assert (= (and b!458553 res!273990) b!458556))

(assert (= (and b!458556 (not res!273995)) b!458561))

(assert (= (and b!458561 (not res!273994)) b!458552))

(assert (= (and b!458557 condMapEmpty!20155) mapIsEmpty!20155))

(assert (= (and b!458557 (not condMapEmpty!20155)) mapNonEmpty!20155))

(get-info :version)

(assert (= (and mapNonEmpty!20155 ((_ is ValueCellFull!5825) mapValue!20155)) b!458554))

(assert (= (and b!458557 ((_ is ValueCellFull!5825) mapDefault!20155)) b!458550))

(assert (= start!41116 b!458557))

(declare-fun b_lambda!9815 () Bool)

(assert (=> (not b_lambda!9815) (not b!458561)))

(declare-fun t!14150 () Bool)

(declare-fun tb!3827 () Bool)

(assert (=> (and start!41116 (= defaultEntry!557 defaultEntry!557) t!14150) tb!3827))

(declare-fun result!7207 () Bool)

(assert (=> tb!3827 (= result!7207 tp_is_empty!12337)))

(assert (=> b!458561 t!14150))

(declare-fun b_and!19213 () Bool)

(assert (= b_and!19211 (and (=> t!14150 result!7207) b_and!19213)))

(declare-fun m!441433 () Bool)

(assert (=> b!458547 m!441433))

(declare-fun m!441435 () Bool)

(assert (=> start!41116 m!441435))

(declare-fun m!441437 () Bool)

(assert (=> start!41116 m!441437))

(declare-fun m!441439 () Bool)

(assert (=> b!458562 m!441439))

(declare-fun m!441441 () Bool)

(assert (=> b!458562 m!441441))

(declare-fun m!441443 () Bool)

(assert (=> b!458553 m!441443))

(declare-fun m!441445 () Bool)

(assert (=> b!458553 m!441445))

(declare-fun m!441447 () Bool)

(assert (=> b!458553 m!441447))

(declare-fun m!441449 () Bool)

(assert (=> b!458563 m!441449))

(declare-fun m!441451 () Bool)

(assert (=> b!458556 m!441451))

(declare-fun m!441453 () Bool)

(assert (=> b!458556 m!441453))

(declare-fun m!441455 () Bool)

(assert (=> b!458556 m!441455))

(declare-fun m!441457 () Bool)

(assert (=> b!458556 m!441457))

(assert (=> b!458556 m!441451))

(declare-fun m!441459 () Bool)

(assert (=> b!458556 m!441459))

(declare-fun m!441461 () Bool)

(assert (=> b!458556 m!441461))

(declare-fun m!441463 () Bool)

(assert (=> b!458564 m!441463))

(assert (=> b!458561 m!441451))

(declare-fun m!441465 () Bool)

(assert (=> b!458561 m!441465))

(declare-fun m!441467 () Bool)

(assert (=> b!458561 m!441467))

(declare-fun m!441469 () Bool)

(assert (=> b!458561 m!441469))

(assert (=> b!458561 m!441469))

(assert (=> b!458561 m!441465))

(declare-fun m!441471 () Bool)

(assert (=> b!458561 m!441471))

(declare-fun m!441473 () Bool)

(assert (=> b!458555 m!441473))

(declare-fun m!441475 () Bool)

(assert (=> b!458552 m!441475))

(declare-fun m!441477 () Bool)

(assert (=> mapNonEmpty!20155 m!441477))

(declare-fun m!441479 () Bool)

(assert (=> b!458549 m!441479))

(declare-fun m!441481 () Bool)

(assert (=> b!458551 m!441481))

(declare-fun m!441483 () Bool)

(assert (=> b!458560 m!441483))

(check-sat (not b!458564) (not b!458552) (not start!41116) (not b!458549) b_and!19213 (not mapNonEmpty!20155) (not b_next!10999) (not b!458556) tp_is_empty!12337 (not b!458560) (not b!458561) (not b!458562) (not b!458563) (not b!458553) (not b!458551) (not b_lambda!9815) (not b!458547))
(check-sat b_and!19213 (not b_next!10999))
