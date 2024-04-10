; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33862 () Bool)

(assert start!33862)

(declare-fun b_free!7041 () Bool)

(declare-fun b_next!7041 () Bool)

(assert (=> start!33862 (= b_free!7041 (not b_next!7041))))

(declare-fun tp!24635 () Bool)

(declare-fun b_and!14227 () Bool)

(assert (=> start!33862 (= tp!24635 b_and!14227)))

(declare-fun b!336996 () Bool)

(declare-fun res!186077 () Bool)

(declare-fun e!206823 () Bool)

(assert (=> b!336996 (=> (not res!186077) (not e!206823))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336996 (= res!186077 (validKeyInArray!0 k0!1348))))

(declare-fun b!336997 () Bool)

(declare-fun res!186079 () Bool)

(assert (=> b!336997 (=> (not res!186079) (not e!206823))))

(declare-datatypes ((array!17581 0))(
  ( (array!17582 (arr!8318 (Array (_ BitVec 32) (_ BitVec 64))) (size!8670 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17581)

(declare-datatypes ((List!4757 0))(
  ( (Nil!4754) (Cons!4753 (h!5609 (_ BitVec 64)) (t!9851 List!4757)) )
))
(declare-fun arrayNoDuplicates!0 (array!17581 (_ BitVec 32) List!4757) Bool)

(assert (=> b!336997 (= res!186079 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4754))))

(declare-fun b!336998 () Bool)

(declare-fun e!206826 () Bool)

(declare-fun tp_is_empty!6993 () Bool)

(assert (=> b!336998 (= e!206826 tp_is_empty!6993)))

(declare-fun res!186073 () Bool)

(assert (=> start!33862 (=> (not res!186073) (not e!206823))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33862 (= res!186073 (validMask!0 mask!2385))))

(assert (=> start!33862 e!206823))

(assert (=> start!33862 true))

(assert (=> start!33862 tp_is_empty!6993))

(assert (=> start!33862 tp!24635))

(declare-datatypes ((V!10301 0))(
  ( (V!10302 (val!3541 Int)) )
))
(declare-datatypes ((ValueCell!3153 0))(
  ( (ValueCellFull!3153 (v!5706 V!10301)) (EmptyCell!3153) )
))
(declare-datatypes ((array!17583 0))(
  ( (array!17584 (arr!8319 (Array (_ BitVec 32) ValueCell!3153)) (size!8671 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17583)

(declare-fun e!206824 () Bool)

(declare-fun array_inv!6176 (array!17583) Bool)

(assert (=> start!33862 (and (array_inv!6176 _values!1525) e!206824)))

(declare-fun array_inv!6177 (array!17581) Bool)

(assert (=> start!33862 (array_inv!6177 _keys!1895)))

(declare-fun b!336999 () Bool)

(declare-fun e!206821 () Bool)

(assert (=> b!336999 (= e!206823 e!206821)))

(declare-fun res!186078 () Bool)

(assert (=> b!336999 (=> (not res!186078) (not e!206821))))

(declare-datatypes ((SeekEntryResult!3214 0))(
  ( (MissingZero!3214 (index!15035 (_ BitVec 32))) (Found!3214 (index!15036 (_ BitVec 32))) (Intermediate!3214 (undefined!4026 Bool) (index!15037 (_ BitVec 32)) (x!33586 (_ BitVec 32))) (Undefined!3214) (MissingVacant!3214 (index!15038 (_ BitVec 32))) )
))
(declare-fun lt!160354 () SeekEntryResult!3214)

(get-info :version)

(assert (=> b!336999 (= res!186078 (and (not ((_ is Found!3214) lt!160354)) ((_ is MissingZero!3214) lt!160354)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17581 (_ BitVec 32)) SeekEntryResult!3214)

(assert (=> b!336999 (= lt!160354 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11895 () Bool)

(declare-fun mapRes!11895 () Bool)

(assert (=> mapIsEmpty!11895 mapRes!11895))

(declare-fun b!337000 () Bool)

(declare-fun e!206825 () Bool)

(assert (=> b!337000 (= e!206824 (and e!206825 mapRes!11895))))

(declare-fun condMapEmpty!11895 () Bool)

(declare-fun mapDefault!11895 () ValueCell!3153)

(assert (=> b!337000 (= condMapEmpty!11895 (= (arr!8319 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3153)) mapDefault!11895)))))

(declare-fun b!337001 () Bool)

(declare-fun res!186074 () Bool)

(assert (=> b!337001 (=> (not res!186074) (not e!206821))))

(declare-fun arrayContainsKey!0 (array!17581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337001 (= res!186074 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337002 () Bool)

(declare-fun res!186080 () Bool)

(assert (=> b!337002 (=> (not res!186080) (not e!206823))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337002 (= res!186080 (and (= (size!8671 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8670 _keys!1895) (size!8671 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337003 () Bool)

(declare-fun res!186076 () Bool)

(assert (=> b!337003 (=> (not res!186076) (not e!206823))))

(declare-fun zeroValue!1467 () V!10301)

(declare-fun minValue!1467 () V!10301)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5142 0))(
  ( (tuple2!5143 (_1!2582 (_ BitVec 64)) (_2!2582 V!10301)) )
))
(declare-datatypes ((List!4758 0))(
  ( (Nil!4755) (Cons!4754 (h!5610 tuple2!5142) (t!9852 List!4758)) )
))
(declare-datatypes ((ListLongMap!4055 0))(
  ( (ListLongMap!4056 (toList!2043 List!4758)) )
))
(declare-fun contains!2090 (ListLongMap!4055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1564 (array!17581 array!17583 (_ BitVec 32) (_ BitVec 32) V!10301 V!10301 (_ BitVec 32) Int) ListLongMap!4055)

(assert (=> b!337003 (= res!186076 (not (contains!2090 (getCurrentListMap!1564 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337004 () Bool)

(declare-fun res!186075 () Bool)

(assert (=> b!337004 (=> (not res!186075) (not e!206823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17581 (_ BitVec 32)) Bool)

(assert (=> b!337004 (= res!186075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11895 () Bool)

(declare-fun tp!24636 () Bool)

(assert (=> mapNonEmpty!11895 (= mapRes!11895 (and tp!24636 e!206826))))

(declare-fun mapKey!11895 () (_ BitVec 32))

(declare-fun mapValue!11895 () ValueCell!3153)

(declare-fun mapRest!11895 () (Array (_ BitVec 32) ValueCell!3153))

(assert (=> mapNonEmpty!11895 (= (arr!8319 _values!1525) (store mapRest!11895 mapKey!11895 mapValue!11895))))

(declare-fun b!337005 () Bool)

(assert (=> b!337005 (= e!206825 tp_is_empty!6993)))

(declare-fun b!337006 () Bool)

(assert (=> b!337006 (= e!206821 false)))

(declare-fun lt!160353 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17581 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337006 (= lt!160353 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!33862 res!186073) b!337002))

(assert (= (and b!337002 res!186080) b!337004))

(assert (= (and b!337004 res!186075) b!336997))

(assert (= (and b!336997 res!186079) b!336996))

(assert (= (and b!336996 res!186077) b!337003))

(assert (= (and b!337003 res!186076) b!336999))

(assert (= (and b!336999 res!186078) b!337001))

(assert (= (and b!337001 res!186074) b!337006))

(assert (= (and b!337000 condMapEmpty!11895) mapIsEmpty!11895))

(assert (= (and b!337000 (not condMapEmpty!11895)) mapNonEmpty!11895))

(assert (= (and mapNonEmpty!11895 ((_ is ValueCellFull!3153) mapValue!11895)) b!336998))

(assert (= (and b!337000 ((_ is ValueCellFull!3153) mapDefault!11895)) b!337005))

(assert (= start!33862 b!337000))

(declare-fun m!340643 () Bool)

(assert (=> b!337004 m!340643))

(declare-fun m!340645 () Bool)

(assert (=> b!337003 m!340645))

(assert (=> b!337003 m!340645))

(declare-fun m!340647 () Bool)

(assert (=> b!337003 m!340647))

(declare-fun m!340649 () Bool)

(assert (=> b!337001 m!340649))

(declare-fun m!340651 () Bool)

(assert (=> b!336996 m!340651))

(declare-fun m!340653 () Bool)

(assert (=> b!336997 m!340653))

(declare-fun m!340655 () Bool)

(assert (=> mapNonEmpty!11895 m!340655))

(declare-fun m!340657 () Bool)

(assert (=> b!337006 m!340657))

(declare-fun m!340659 () Bool)

(assert (=> start!33862 m!340659))

(declare-fun m!340661 () Bool)

(assert (=> start!33862 m!340661))

(declare-fun m!340663 () Bool)

(assert (=> start!33862 m!340663))

(declare-fun m!340665 () Bool)

(assert (=> b!336999 m!340665))

(check-sat (not b!337003) (not b!336996) (not b_next!7041) (not b!337006) (not mapNonEmpty!11895) b_and!14227 (not b!336999) (not b!337001) (not b!337004) (not b!336997) (not start!33862) tp_is_empty!6993)
(check-sat b_and!14227 (not b_next!7041))
