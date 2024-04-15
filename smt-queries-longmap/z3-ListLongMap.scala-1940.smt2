; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34320 () Bool)

(assert start!34320)

(declare-fun b_free!7309 () Bool)

(declare-fun b_next!7309 () Bool)

(assert (=> start!34320 (= b_free!7309 (not b_next!7309))))

(declare-fun tp!25466 () Bool)

(declare-fun b_and!14487 () Bool)

(assert (=> start!34320 (= tp!25466 b_and!14487)))

(declare-fun b!342528 () Bool)

(declare-fun e!210031 () Bool)

(declare-fun e!210032 () Bool)

(declare-fun mapRes!12324 () Bool)

(assert (=> b!342528 (= e!210031 (and e!210032 mapRes!12324))))

(declare-fun condMapEmpty!12324 () Bool)

(declare-datatypes ((V!10659 0))(
  ( (V!10660 (val!3675 Int)) )
))
(declare-datatypes ((ValueCell!3287 0))(
  ( (ValueCellFull!3287 (v!5843 V!10659)) (EmptyCell!3287) )
))
(declare-datatypes ((array!18101 0))(
  ( (array!18102 (arr!8569 (Array (_ BitVec 32) ValueCell!3287)) (size!8922 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18101)

(declare-fun mapDefault!12324 () ValueCell!3287)

(assert (=> b!342528 (= condMapEmpty!12324 (= (arr!8569 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3287)) mapDefault!12324)))))

(declare-fun b!342529 () Bool)

(declare-fun tp_is_empty!7261 () Bool)

(assert (=> b!342529 (= e!210032 tp_is_empty!7261)))

(declare-fun res!189372 () Bool)

(declare-fun e!210030 () Bool)

(assert (=> start!34320 (=> (not res!189372) (not e!210030))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34320 (= res!189372 (validMask!0 mask!2385))))

(assert (=> start!34320 e!210030))

(assert (=> start!34320 true))

(assert (=> start!34320 tp_is_empty!7261))

(assert (=> start!34320 tp!25466))

(declare-fun array_inv!6372 (array!18101) Bool)

(assert (=> start!34320 (and (array_inv!6372 _values!1525) e!210031)))

(declare-datatypes ((array!18103 0))(
  ( (array!18104 (arr!8570 (Array (_ BitVec 32) (_ BitVec 64))) (size!8923 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18103)

(declare-fun array_inv!6373 (array!18103) Bool)

(assert (=> start!34320 (array_inv!6373 _keys!1895)))

(declare-fun b!342530 () Bool)

(declare-fun e!210034 () Bool)

(assert (=> b!342530 (= e!210034 tp_is_empty!7261)))

(declare-fun mapIsEmpty!12324 () Bool)

(assert (=> mapIsEmpty!12324 mapRes!12324))

(declare-fun b!342531 () Bool)

(declare-fun e!210033 () Bool)

(assert (=> b!342531 (= e!210030 e!210033)))

(declare-fun res!189373 () Bool)

(assert (=> b!342531 (=> (not res!189373) (not e!210033))))

(declare-datatypes ((SeekEntryResult!3301 0))(
  ( (MissingZero!3301 (index!15383 (_ BitVec 32))) (Found!3301 (index!15384 (_ BitVec 32))) (Intermediate!3301 (undefined!4113 Bool) (index!15385 (_ BitVec 32)) (x!34118 (_ BitVec 32))) (Undefined!3301) (MissingVacant!3301 (index!15386 (_ BitVec 32))) )
))
(declare-fun lt!162015 () SeekEntryResult!3301)

(get-info :version)

(assert (=> b!342531 (= res!189373 (and (not ((_ is Found!3301) lt!162015)) (not ((_ is MissingZero!3301) lt!162015)) ((_ is MissingVacant!3301) lt!162015)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18103 (_ BitVec 32)) SeekEntryResult!3301)

(assert (=> b!342531 (= lt!162015 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12324 () Bool)

(declare-fun tp!25467 () Bool)

(assert (=> mapNonEmpty!12324 (= mapRes!12324 (and tp!25467 e!210034))))

(declare-fun mapKey!12324 () (_ BitVec 32))

(declare-fun mapRest!12324 () (Array (_ BitVec 32) ValueCell!3287))

(declare-fun mapValue!12324 () ValueCell!3287)

(assert (=> mapNonEmpty!12324 (= (arr!8569 _values!1525) (store mapRest!12324 mapKey!12324 mapValue!12324))))

(declare-fun b!342532 () Bool)

(declare-fun res!189377 () Bool)

(assert (=> b!342532 (=> (not res!189377) (not e!210030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342532 (= res!189377 (validKeyInArray!0 k0!1348))))

(declare-fun b!342533 () Bool)

(declare-datatypes ((Unit!10659 0))(
  ( (Unit!10660) )
))
(declare-fun e!210028 () Unit!10659)

(declare-fun Unit!10661 () Unit!10659)

(assert (=> b!342533 (= e!210028 Unit!10661)))

(declare-fun zeroValue!1467 () V!10659)

(declare-fun lt!162013 () Unit!10659)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10659)

(declare-fun lemmaArrayContainsKeyThenInListMap!306 (array!18103 array!18101 (_ BitVec 32) (_ BitVec 32) V!10659 V!10659 (_ BitVec 64) (_ BitVec 32) Int) Unit!10659)

(declare-fun arrayScanForKey!0 (array!18103 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342533 (= lt!162013 (lemmaArrayContainsKeyThenInListMap!306 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342533 false))

(declare-fun b!342534 () Bool)

(declare-fun res!189374 () Bool)

(assert (=> b!342534 (=> (not res!189374) (not e!210030))))

(assert (=> b!342534 (= res!189374 (and (= (size!8922 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8923 _keys!1895) (size!8922 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342535 () Bool)

(declare-fun res!189376 () Bool)

(assert (=> b!342535 (=> (not res!189376) (not e!210030))))

(declare-datatypes ((tuple2!5274 0))(
  ( (tuple2!5275 (_1!2648 (_ BitVec 64)) (_2!2648 V!10659)) )
))
(declare-datatypes ((List!4896 0))(
  ( (Nil!4893) (Cons!4892 (h!5748 tuple2!5274) (t!9999 List!4896)) )
))
(declare-datatypes ((ListLongMap!4177 0))(
  ( (ListLongMap!4178 (toList!2104 List!4896)) )
))
(declare-fun contains!2171 (ListLongMap!4177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1610 (array!18103 array!18101 (_ BitVec 32) (_ BitVec 32) V!10659 V!10659 (_ BitVec 32) Int) ListLongMap!4177)

(assert (=> b!342535 (= res!189376 (not (contains!2171 (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342536 () Bool)

(declare-fun res!189375 () Bool)

(assert (=> b!342536 (=> (not res!189375) (not e!210030))))

(declare-datatypes ((List!4897 0))(
  ( (Nil!4894) (Cons!4893 (h!5749 (_ BitVec 64)) (t!10000 List!4897)) )
))
(declare-fun arrayNoDuplicates!0 (array!18103 (_ BitVec 32) List!4897) Bool)

(assert (=> b!342536 (= res!189375 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4894))))

(declare-fun b!342537 () Bool)

(assert (=> b!342537 (= e!210033 false)))

(declare-fun lt!162014 () Unit!10659)

(assert (=> b!342537 (= lt!162014 e!210028)))

(declare-fun c!52772 () Bool)

(declare-fun arrayContainsKey!0 (array!18103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342537 (= c!52772 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342538 () Bool)

(declare-fun Unit!10662 () Unit!10659)

(assert (=> b!342538 (= e!210028 Unit!10662)))

(declare-fun b!342539 () Bool)

(declare-fun res!189371 () Bool)

(assert (=> b!342539 (=> (not res!189371) (not e!210030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18103 (_ BitVec 32)) Bool)

(assert (=> b!342539 (= res!189371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34320 res!189372) b!342534))

(assert (= (and b!342534 res!189374) b!342539))

(assert (= (and b!342539 res!189371) b!342536))

(assert (= (and b!342536 res!189375) b!342532))

(assert (= (and b!342532 res!189377) b!342535))

(assert (= (and b!342535 res!189376) b!342531))

(assert (= (and b!342531 res!189373) b!342537))

(assert (= (and b!342537 c!52772) b!342533))

(assert (= (and b!342537 (not c!52772)) b!342538))

(assert (= (and b!342528 condMapEmpty!12324) mapIsEmpty!12324))

(assert (= (and b!342528 (not condMapEmpty!12324)) mapNonEmpty!12324))

(assert (= (and mapNonEmpty!12324 ((_ is ValueCellFull!3287) mapValue!12324)) b!342530))

(assert (= (and b!342528 ((_ is ValueCellFull!3287) mapDefault!12324)) b!342529))

(assert (= start!34320 b!342528))

(declare-fun m!344127 () Bool)

(assert (=> b!342532 m!344127))

(declare-fun m!344129 () Bool)

(assert (=> start!34320 m!344129))

(declare-fun m!344131 () Bool)

(assert (=> start!34320 m!344131))

(declare-fun m!344133 () Bool)

(assert (=> start!34320 m!344133))

(declare-fun m!344135 () Bool)

(assert (=> b!342531 m!344135))

(declare-fun m!344137 () Bool)

(assert (=> b!342533 m!344137))

(assert (=> b!342533 m!344137))

(declare-fun m!344139 () Bool)

(assert (=> b!342533 m!344139))

(declare-fun m!344141 () Bool)

(assert (=> b!342535 m!344141))

(assert (=> b!342535 m!344141))

(declare-fun m!344143 () Bool)

(assert (=> b!342535 m!344143))

(declare-fun m!344145 () Bool)

(assert (=> b!342537 m!344145))

(declare-fun m!344147 () Bool)

(assert (=> mapNonEmpty!12324 m!344147))

(declare-fun m!344149 () Bool)

(assert (=> b!342536 m!344149))

(declare-fun m!344151 () Bool)

(assert (=> b!342539 m!344151))

(check-sat (not b!342539) (not start!34320) (not b!342532) (not b!342537) (not b!342531) b_and!14487 (not b_next!7309) (not b!342533) (not mapNonEmpty!12324) (not b!342536) (not b!342535) tp_is_empty!7261)
(check-sat b_and!14487 (not b_next!7309))
