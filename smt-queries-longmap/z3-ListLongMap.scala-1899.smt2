; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33886 () Bool)

(assert start!33886)

(declare-fun b_free!7065 () Bool)

(declare-fun b_next!7065 () Bool)

(assert (=> start!33886 (= b_free!7065 (not b_next!7065))))

(declare-fun tp!24708 () Bool)

(declare-fun b_and!14251 () Bool)

(assert (=> start!33886 (= tp!24708 b_and!14251)))

(declare-fun mapNonEmpty!11931 () Bool)

(declare-fun mapRes!11931 () Bool)

(declare-fun tp!24707 () Bool)

(declare-fun e!207038 () Bool)

(assert (=> mapNonEmpty!11931 (= mapRes!11931 (and tp!24707 e!207038))))

(declare-fun mapKey!11931 () (_ BitVec 32))

(declare-datatypes ((V!10333 0))(
  ( (V!10334 (val!3553 Int)) )
))
(declare-datatypes ((ValueCell!3165 0))(
  ( (ValueCellFull!3165 (v!5718 V!10333)) (EmptyCell!3165) )
))
(declare-fun mapRest!11931 () (Array (_ BitVec 32) ValueCell!3165))

(declare-datatypes ((array!17629 0))(
  ( (array!17630 (arr!8342 (Array (_ BitVec 32) ValueCell!3165)) (size!8694 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17629)

(declare-fun mapValue!11931 () ValueCell!3165)

(assert (=> mapNonEmpty!11931 (= (arr!8342 _values!1525) (store mapRest!11931 mapKey!11931 mapValue!11931))))

(declare-fun b!337392 () Bool)

(declare-fun tp_is_empty!7017 () Bool)

(assert (=> b!337392 (= e!207038 tp_is_empty!7017)))

(declare-fun b!337393 () Bool)

(declare-fun e!207037 () Bool)

(assert (=> b!337393 (= e!207037 tp_is_empty!7017)))

(declare-fun b!337394 () Bool)

(declare-fun e!207040 () Bool)

(declare-fun e!207042 () Bool)

(assert (=> b!337394 (= e!207040 e!207042)))

(declare-fun res!186368 () Bool)

(assert (=> b!337394 (=> (not res!186368) (not e!207042))))

(declare-datatypes ((SeekEntryResult!3224 0))(
  ( (MissingZero!3224 (index!15075 (_ BitVec 32))) (Found!3224 (index!15076 (_ BitVec 32))) (Intermediate!3224 (undefined!4036 Bool) (index!15077 (_ BitVec 32)) (x!33628 (_ BitVec 32))) (Undefined!3224) (MissingVacant!3224 (index!15078 (_ BitVec 32))) )
))
(declare-fun lt!160426 () SeekEntryResult!3224)

(get-info :version)

(assert (=> b!337394 (= res!186368 (and (not ((_ is Found!3224) lt!160426)) ((_ is MissingZero!3224) lt!160426)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17631 0))(
  ( (array!17632 (arr!8343 (Array (_ BitVec 32) (_ BitVec 64))) (size!8695 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17631)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17631 (_ BitVec 32)) SeekEntryResult!3224)

(assert (=> b!337394 (= lt!160426 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11931 () Bool)

(assert (=> mapIsEmpty!11931 mapRes!11931))

(declare-fun b!337395 () Bool)

(assert (=> b!337395 (= e!207042 false)))

(declare-fun lt!160425 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17631 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337395 (= lt!160425 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!186361 () Bool)

(assert (=> start!33886 (=> (not res!186361) (not e!207040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33886 (= res!186361 (validMask!0 mask!2385))))

(assert (=> start!33886 e!207040))

(assert (=> start!33886 true))

(assert (=> start!33886 tp_is_empty!7017))

(assert (=> start!33886 tp!24708))

(declare-fun e!207041 () Bool)

(declare-fun array_inv!6190 (array!17629) Bool)

(assert (=> start!33886 (and (array_inv!6190 _values!1525) e!207041)))

(declare-fun array_inv!6191 (array!17631) Bool)

(assert (=> start!33886 (array_inv!6191 _keys!1895)))

(declare-fun b!337396 () Bool)

(declare-fun res!186362 () Bool)

(assert (=> b!337396 (=> (not res!186362) (not e!207040))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337396 (= res!186362 (and (= (size!8694 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8695 _keys!1895) (size!8694 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337397 () Bool)

(declare-fun res!186367 () Bool)

(assert (=> b!337397 (=> (not res!186367) (not e!207040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17631 (_ BitVec 32)) Bool)

(assert (=> b!337397 (= res!186367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337398 () Bool)

(declare-fun res!186363 () Bool)

(assert (=> b!337398 (=> (not res!186363) (not e!207040))))

(declare-fun zeroValue!1467 () V!10333)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10333)

(declare-datatypes ((tuple2!5158 0))(
  ( (tuple2!5159 (_1!2590 (_ BitVec 64)) (_2!2590 V!10333)) )
))
(declare-datatypes ((List!4774 0))(
  ( (Nil!4771) (Cons!4770 (h!5626 tuple2!5158) (t!9868 List!4774)) )
))
(declare-datatypes ((ListLongMap!4071 0))(
  ( (ListLongMap!4072 (toList!2051 List!4774)) )
))
(declare-fun contains!2098 (ListLongMap!4071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1572 (array!17631 array!17629 (_ BitVec 32) (_ BitVec 32) V!10333 V!10333 (_ BitVec 32) Int) ListLongMap!4071)

(assert (=> b!337398 (= res!186363 (not (contains!2098 (getCurrentListMap!1572 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337399 () Bool)

(declare-fun res!186364 () Bool)

(assert (=> b!337399 (=> (not res!186364) (not e!207040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337399 (= res!186364 (validKeyInArray!0 k0!1348))))

(declare-fun b!337400 () Bool)

(assert (=> b!337400 (= e!207041 (and e!207037 mapRes!11931))))

(declare-fun condMapEmpty!11931 () Bool)

(declare-fun mapDefault!11931 () ValueCell!3165)

(assert (=> b!337400 (= condMapEmpty!11931 (= (arr!8342 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3165)) mapDefault!11931)))))

(declare-fun b!337401 () Bool)

(declare-fun res!186365 () Bool)

(assert (=> b!337401 (=> (not res!186365) (not e!207042))))

(declare-fun arrayContainsKey!0 (array!17631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337401 (= res!186365 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337402 () Bool)

(declare-fun res!186366 () Bool)

(assert (=> b!337402 (=> (not res!186366) (not e!207040))))

(declare-datatypes ((List!4775 0))(
  ( (Nil!4772) (Cons!4771 (h!5627 (_ BitVec 64)) (t!9869 List!4775)) )
))
(declare-fun arrayNoDuplicates!0 (array!17631 (_ BitVec 32) List!4775) Bool)

(assert (=> b!337402 (= res!186366 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4772))))

(assert (= (and start!33886 res!186361) b!337396))

(assert (= (and b!337396 res!186362) b!337397))

(assert (= (and b!337397 res!186367) b!337402))

(assert (= (and b!337402 res!186366) b!337399))

(assert (= (and b!337399 res!186364) b!337398))

(assert (= (and b!337398 res!186363) b!337394))

(assert (= (and b!337394 res!186368) b!337401))

(assert (= (and b!337401 res!186365) b!337395))

(assert (= (and b!337400 condMapEmpty!11931) mapIsEmpty!11931))

(assert (= (and b!337400 (not condMapEmpty!11931)) mapNonEmpty!11931))

(assert (= (and mapNonEmpty!11931 ((_ is ValueCellFull!3165) mapValue!11931)) b!337392))

(assert (= (and b!337400 ((_ is ValueCellFull!3165) mapDefault!11931)) b!337393))

(assert (= start!33886 b!337400))

(declare-fun m!340931 () Bool)

(assert (=> b!337399 m!340931))

(declare-fun m!340933 () Bool)

(assert (=> b!337394 m!340933))

(declare-fun m!340935 () Bool)

(assert (=> b!337398 m!340935))

(assert (=> b!337398 m!340935))

(declare-fun m!340937 () Bool)

(assert (=> b!337398 m!340937))

(declare-fun m!340939 () Bool)

(assert (=> b!337401 m!340939))

(declare-fun m!340941 () Bool)

(assert (=> start!33886 m!340941))

(declare-fun m!340943 () Bool)

(assert (=> start!33886 m!340943))

(declare-fun m!340945 () Bool)

(assert (=> start!33886 m!340945))

(declare-fun m!340947 () Bool)

(assert (=> mapNonEmpty!11931 m!340947))

(declare-fun m!340949 () Bool)

(assert (=> b!337397 m!340949))

(declare-fun m!340951 () Bool)

(assert (=> b!337395 m!340951))

(declare-fun m!340953 () Bool)

(assert (=> b!337402 m!340953))

(check-sat (not b_next!7065) (not b!337398) (not b!337402) (not b!337394) tp_is_empty!7017 (not b!337397) (not b!337399) (not start!33886) (not b!337401) b_and!14251 (not mapNonEmpty!11931) (not b!337395))
(check-sat b_and!14251 (not b_next!7065))
