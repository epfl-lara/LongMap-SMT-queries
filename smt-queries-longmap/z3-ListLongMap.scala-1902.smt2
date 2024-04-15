; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33888 () Bool)

(assert start!33888)

(declare-fun b_free!7081 () Bool)

(declare-fun b_next!7081 () Bool)

(assert (=> start!33888 (= b_free!7081 (not b_next!7081))))

(declare-fun tp!24756 () Bool)

(declare-fun b_and!14241 () Bool)

(assert (=> start!33888 (= tp!24756 b_and!14241)))

(declare-fun res!186422 () Bool)

(declare-fun e!207013 () Bool)

(assert (=> start!33888 (=> (not res!186422) (not e!207013))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33888 (= res!186422 (validMask!0 mask!2385))))

(assert (=> start!33888 e!207013))

(assert (=> start!33888 true))

(declare-fun tp_is_empty!7033 () Bool)

(assert (=> start!33888 tp_is_empty!7033))

(assert (=> start!33888 tp!24756))

(declare-datatypes ((V!10355 0))(
  ( (V!10356 (val!3561 Int)) )
))
(declare-datatypes ((ValueCell!3173 0))(
  ( (ValueCellFull!3173 (v!5720 V!10355)) (EmptyCell!3173) )
))
(declare-datatypes ((array!17641 0))(
  ( (array!17642 (arr!8348 (Array (_ BitVec 32) ValueCell!3173)) (size!8701 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17641)

(declare-fun e!207010 () Bool)

(declare-fun array_inv!6224 (array!17641) Bool)

(assert (=> start!33888 (and (array_inv!6224 _values!1525) e!207010)))

(declare-datatypes ((array!17643 0))(
  ( (array!17644 (arr!8349 (Array (_ BitVec 32) (_ BitVec 64))) (size!8702 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17643)

(declare-fun array_inv!6225 (array!17643) Bool)

(assert (=> start!33888 (array_inv!6225 _keys!1895)))

(declare-fun b!337383 () Bool)

(declare-fun e!207011 () Bool)

(assert (=> b!337383 (= e!207013 e!207011)))

(declare-fun res!186428 () Bool)

(assert (=> b!337383 (=> (not res!186428) (not e!207011))))

(declare-datatypes ((SeekEntryResult!3226 0))(
  ( (MissingZero!3226 (index!15083 (_ BitVec 32))) (Found!3226 (index!15084 (_ BitVec 32))) (Intermediate!3226 (undefined!4038 Bool) (index!15085 (_ BitVec 32)) (x!33649 (_ BitVec 32))) (Undefined!3226) (MissingVacant!3226 (index!15086 (_ BitVec 32))) )
))
(declare-fun lt!160242 () SeekEntryResult!3226)

(get-info :version)

(assert (=> b!337383 (= res!186428 (and (not ((_ is Found!3226) lt!160242)) ((_ is MissingZero!3226) lt!160242)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17643 (_ BitVec 32)) SeekEntryResult!3226)

(assert (=> b!337383 (= lt!160242 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337384 () Bool)

(declare-datatypes ((Unit!10446 0))(
  ( (Unit!10447) )
))
(declare-fun e!207009 () Unit!10446)

(declare-fun Unit!10448 () Unit!10446)

(assert (=> b!337384 (= e!207009 Unit!10448)))

(declare-fun b!337385 () Bool)

(declare-fun res!186425 () Bool)

(assert (=> b!337385 (=> (not res!186425) (not e!207013))))

(declare-datatypes ((List!4748 0))(
  ( (Nil!4745) (Cons!4744 (h!5600 (_ BitVec 64)) (t!9833 List!4748)) )
))
(declare-fun arrayNoDuplicates!0 (array!17643 (_ BitVec 32) List!4748) Bool)

(assert (=> b!337385 (= res!186425 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4745))))

(declare-fun b!337386 () Bool)

(assert (=> b!337386 (= e!207011 false)))

(declare-fun lt!160240 () Unit!10446)

(assert (=> b!337386 (= lt!160240 e!207009)))

(declare-fun c!52232 () Bool)

(declare-fun arrayContainsKey!0 (array!17643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337386 (= c!52232 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337387 () Bool)

(declare-fun Unit!10449 () Unit!10446)

(assert (=> b!337387 (= e!207009 Unit!10449)))

(declare-fun zeroValue!1467 () V!10355)

(declare-fun lt!160241 () Unit!10446)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10355)

(declare-fun lemmaArrayContainsKeyThenInListMap!265 (array!17643 array!17641 (_ BitVec 32) (_ BitVec 32) V!10355 V!10355 (_ BitVec 64) (_ BitVec 32) Int) Unit!10446)

(declare-fun arrayScanForKey!0 (array!17643 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337387 (= lt!160241 (lemmaArrayContainsKeyThenInListMap!265 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337387 false))

(declare-fun b!337388 () Bool)

(declare-fun e!207008 () Bool)

(assert (=> b!337388 (= e!207008 tp_is_empty!7033)))

(declare-fun b!337389 () Bool)

(declare-fun res!186426 () Bool)

(assert (=> b!337389 (=> (not res!186426) (not e!207013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17643 (_ BitVec 32)) Bool)

(assert (=> b!337389 (= res!186426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11955 () Bool)

(declare-fun mapRes!11955 () Bool)

(declare-fun tp!24755 () Bool)

(declare-fun e!207007 () Bool)

(assert (=> mapNonEmpty!11955 (= mapRes!11955 (and tp!24755 e!207007))))

(declare-fun mapRest!11955 () (Array (_ BitVec 32) ValueCell!3173))

(declare-fun mapValue!11955 () ValueCell!3173)

(declare-fun mapKey!11955 () (_ BitVec 32))

(assert (=> mapNonEmpty!11955 (= (arr!8348 _values!1525) (store mapRest!11955 mapKey!11955 mapValue!11955))))

(declare-fun b!337390 () Bool)

(declare-fun res!186424 () Bool)

(assert (=> b!337390 (=> (not res!186424) (not e!207013))))

(assert (=> b!337390 (= res!186424 (and (= (size!8701 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8702 _keys!1895) (size!8701 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337391 () Bool)

(assert (=> b!337391 (= e!207007 tp_is_empty!7033)))

(declare-fun mapIsEmpty!11955 () Bool)

(assert (=> mapIsEmpty!11955 mapRes!11955))

(declare-fun b!337392 () Bool)

(declare-fun res!186423 () Bool)

(assert (=> b!337392 (=> (not res!186423) (not e!207013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337392 (= res!186423 (validKeyInArray!0 k0!1348))))

(declare-fun b!337393 () Bool)

(assert (=> b!337393 (= e!207010 (and e!207008 mapRes!11955))))

(declare-fun condMapEmpty!11955 () Bool)

(declare-fun mapDefault!11955 () ValueCell!3173)

(assert (=> b!337393 (= condMapEmpty!11955 (= (arr!8348 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3173)) mapDefault!11955)))))

(declare-fun b!337394 () Bool)

(declare-fun res!186427 () Bool)

(assert (=> b!337394 (=> (not res!186427) (not e!207013))))

(declare-datatypes ((tuple2!5114 0))(
  ( (tuple2!5115 (_1!2568 (_ BitVec 64)) (_2!2568 V!10355)) )
))
(declare-datatypes ((List!4749 0))(
  ( (Nil!4746) (Cons!4745 (h!5601 tuple2!5114) (t!9834 List!4749)) )
))
(declare-datatypes ((ListLongMap!4017 0))(
  ( (ListLongMap!4018 (toList!2024 List!4749)) )
))
(declare-fun contains!2082 (ListLongMap!4017 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1530 (array!17643 array!17641 (_ BitVec 32) (_ BitVec 32) V!10355 V!10355 (_ BitVec 32) Int) ListLongMap!4017)

(assert (=> b!337394 (= res!186427 (not (contains!2082 (getCurrentListMap!1530 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33888 res!186422) b!337390))

(assert (= (and b!337390 res!186424) b!337389))

(assert (= (and b!337389 res!186426) b!337385))

(assert (= (and b!337385 res!186425) b!337392))

(assert (= (and b!337392 res!186423) b!337394))

(assert (= (and b!337394 res!186427) b!337383))

(assert (= (and b!337383 res!186428) b!337386))

(assert (= (and b!337386 c!52232) b!337387))

(assert (= (and b!337386 (not c!52232)) b!337384))

(assert (= (and b!337393 condMapEmpty!11955) mapIsEmpty!11955))

(assert (= (and b!337393 (not condMapEmpty!11955)) mapNonEmpty!11955))

(assert (= (and mapNonEmpty!11955 ((_ is ValueCellFull!3173) mapValue!11955)) b!337391))

(assert (= (and b!337393 ((_ is ValueCellFull!3173) mapDefault!11955)) b!337388))

(assert (= start!33888 b!337393))

(declare-fun m!340393 () Bool)

(assert (=> mapNonEmpty!11955 m!340393))

(declare-fun m!340395 () Bool)

(assert (=> b!337392 m!340395))

(declare-fun m!340397 () Bool)

(assert (=> b!337383 m!340397))

(declare-fun m!340399 () Bool)

(assert (=> b!337386 m!340399))

(declare-fun m!340401 () Bool)

(assert (=> start!33888 m!340401))

(declare-fun m!340403 () Bool)

(assert (=> start!33888 m!340403))

(declare-fun m!340405 () Bool)

(assert (=> start!33888 m!340405))

(declare-fun m!340407 () Bool)

(assert (=> b!337385 m!340407))

(declare-fun m!340409 () Bool)

(assert (=> b!337394 m!340409))

(assert (=> b!337394 m!340409))

(declare-fun m!340411 () Bool)

(assert (=> b!337394 m!340411))

(declare-fun m!340413 () Bool)

(assert (=> b!337387 m!340413))

(assert (=> b!337387 m!340413))

(declare-fun m!340415 () Bool)

(assert (=> b!337387 m!340415))

(declare-fun m!340417 () Bool)

(assert (=> b!337389 m!340417))

(check-sat (not b!337392) (not b!337387) tp_is_empty!7033 (not b!337385) (not b!337394) (not b!337389) (not start!33888) (not b_next!7081) b_and!14241 (not b!337383) (not b!337386) (not mapNonEmpty!11955))
(check-sat b_and!14241 (not b_next!7081))
