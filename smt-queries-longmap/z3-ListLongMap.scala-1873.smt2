; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33658 () Bool)

(assert start!33658)

(declare-fun b_free!6907 () Bool)

(declare-fun b_next!6907 () Bool)

(assert (=> start!33658 (= b_free!6907 (not b_next!6907))))

(declare-fun tp!24224 () Bool)

(declare-fun b_and!14101 () Bool)

(assert (=> start!33658 (= tp!24224 b_and!14101)))

(declare-fun b!334417 () Bool)

(declare-fun res!184396 () Bool)

(declare-fun e!205278 () Bool)

(assert (=> b!334417 (=> (not res!184396) (not e!205278))))

(declare-datatypes ((array!17304 0))(
  ( (array!17305 (arr!8182 (Array (_ BitVec 32) (_ BitVec 64))) (size!8534 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17304)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17304 (_ BitVec 32)) Bool)

(assert (=> b!334417 (= res!184396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334418 () Bool)

(declare-fun e!205281 () Bool)

(declare-fun tp_is_empty!6859 () Bool)

(assert (=> b!334418 (= e!205281 tp_is_empty!6859)))

(declare-fun b!334419 () Bool)

(declare-fun res!184394 () Bool)

(assert (=> b!334419 (=> (not res!184394) (not e!205278))))

(declare-datatypes ((V!10123 0))(
  ( (V!10124 (val!3474 Int)) )
))
(declare-datatypes ((ValueCell!3086 0))(
  ( (ValueCellFull!3086 (v!5637 V!10123)) (EmptyCell!3086) )
))
(declare-datatypes ((array!17306 0))(
  ( (array!17307 (arr!8183 (Array (_ BitVec 32) ValueCell!3086)) (size!8535 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17306)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334419 (= res!184394 (and (= (size!8535 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8534 _keys!1895) (size!8535 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334420 () Bool)

(declare-fun res!184400 () Bool)

(assert (=> b!334420 (=> (not res!184400) (not e!205278))))

(declare-datatypes ((List!4581 0))(
  ( (Nil!4578) (Cons!4577 (h!5433 (_ BitVec 64)) (t!9661 List!4581)) )
))
(declare-fun arrayNoDuplicates!0 (array!17304 (_ BitVec 32) List!4581) Bool)

(assert (=> b!334420 (= res!184400 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4578))))

(declare-fun b!334421 () Bool)

(declare-fun res!184397 () Bool)

(assert (=> b!334421 (=> (not res!184397) (not e!205278))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334421 (= res!184397 (validKeyInArray!0 k0!1348))))

(declare-fun b!334422 () Bool)

(declare-fun res!184393 () Bool)

(assert (=> b!334422 (=> (not res!184393) (not e!205278))))

(declare-fun zeroValue!1467 () V!10123)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10123)

(declare-datatypes ((tuple2!4966 0))(
  ( (tuple2!4967 (_1!2494 (_ BitVec 64)) (_2!2494 V!10123)) )
))
(declare-datatypes ((List!4582 0))(
  ( (Nil!4579) (Cons!4578 (h!5434 tuple2!4966) (t!9662 List!4582)) )
))
(declare-datatypes ((ListLongMap!3881 0))(
  ( (ListLongMap!3882 (toList!1956 List!4582)) )
))
(declare-fun contains!2019 (ListLongMap!3881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1488 (array!17304 array!17306 (_ BitVec 32) (_ BitVec 32) V!10123 V!10123 (_ BitVec 32) Int) ListLongMap!3881)

(assert (=> b!334422 (= res!184393 (not (contains!2019 (getCurrentListMap!1488 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334423 () Bool)

(declare-fun e!205280 () Bool)

(assert (=> b!334423 (= e!205278 e!205280)))

(declare-fun res!184395 () Bool)

(assert (=> b!334423 (=> (not res!184395) (not e!205280))))

(declare-datatypes ((SeekEntryResult!3127 0))(
  ( (MissingZero!3127 (index!14687 (_ BitVec 32))) (Found!3127 (index!14688 (_ BitVec 32))) (Intermediate!3127 (undefined!3939 Bool) (index!14689 (_ BitVec 32)) (x!33290 (_ BitVec 32))) (Undefined!3127) (MissingVacant!3127 (index!14690 (_ BitVec 32))) )
))
(declare-fun lt!159546 () SeekEntryResult!3127)

(get-info :version)

(assert (=> b!334423 (= res!184395 (and ((_ is Found!3127) lt!159546) (= (select (arr!8182 _keys!1895) (index!14688 lt!159546)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17304 (_ BitVec 32)) SeekEntryResult!3127)

(assert (=> b!334423 (= lt!159546 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334424 () Bool)

(assert (=> b!334424 (= e!205280 (not true))))

(declare-fun arrayContainsKey!0 (array!17304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334424 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10377 0))(
  ( (Unit!10378) )
))
(declare-fun lt!159547 () Unit!10377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17304 (_ BitVec 64) (_ BitVec 32)) Unit!10377)

(assert (=> b!334424 (= lt!159547 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14688 lt!159546)))))

(declare-fun mapNonEmpty!11685 () Bool)

(declare-fun mapRes!11685 () Bool)

(declare-fun tp!24225 () Bool)

(assert (=> mapNonEmpty!11685 (= mapRes!11685 (and tp!24225 e!205281))))

(declare-fun mapRest!11685 () (Array (_ BitVec 32) ValueCell!3086))

(declare-fun mapValue!11685 () ValueCell!3086)

(declare-fun mapKey!11685 () (_ BitVec 32))

(assert (=> mapNonEmpty!11685 (= (arr!8183 _values!1525) (store mapRest!11685 mapKey!11685 mapValue!11685))))

(declare-fun b!334425 () Bool)

(declare-fun res!184399 () Bool)

(assert (=> b!334425 (=> (not res!184399) (not e!205280))))

(assert (=> b!334425 (= res!184399 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14688 lt!159546)))))

(declare-fun res!184398 () Bool)

(assert (=> start!33658 (=> (not res!184398) (not e!205278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33658 (= res!184398 (validMask!0 mask!2385))))

(assert (=> start!33658 e!205278))

(assert (=> start!33658 true))

(assert (=> start!33658 tp_is_empty!6859))

(assert (=> start!33658 tp!24224))

(declare-fun e!205283 () Bool)

(declare-fun array_inv!6086 (array!17306) Bool)

(assert (=> start!33658 (and (array_inv!6086 _values!1525) e!205283)))

(declare-fun array_inv!6087 (array!17304) Bool)

(assert (=> start!33658 (array_inv!6087 _keys!1895)))

(declare-fun mapIsEmpty!11685 () Bool)

(assert (=> mapIsEmpty!11685 mapRes!11685))

(declare-fun b!334426 () Bool)

(declare-fun e!205282 () Bool)

(assert (=> b!334426 (= e!205282 tp_is_empty!6859)))

(declare-fun b!334427 () Bool)

(assert (=> b!334427 (= e!205283 (and e!205282 mapRes!11685))))

(declare-fun condMapEmpty!11685 () Bool)

(declare-fun mapDefault!11685 () ValueCell!3086)

(assert (=> b!334427 (= condMapEmpty!11685 (= (arr!8183 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3086)) mapDefault!11685)))))

(assert (= (and start!33658 res!184398) b!334419))

(assert (= (and b!334419 res!184394) b!334417))

(assert (= (and b!334417 res!184396) b!334420))

(assert (= (and b!334420 res!184400) b!334421))

(assert (= (and b!334421 res!184397) b!334422))

(assert (= (and b!334422 res!184393) b!334423))

(assert (= (and b!334423 res!184395) b!334425))

(assert (= (and b!334425 res!184399) b!334424))

(assert (= (and b!334427 condMapEmpty!11685) mapIsEmpty!11685))

(assert (= (and b!334427 (not condMapEmpty!11685)) mapNonEmpty!11685))

(assert (= (and mapNonEmpty!11685 ((_ is ValueCellFull!3086) mapValue!11685)) b!334418))

(assert (= (and b!334427 ((_ is ValueCellFull!3086) mapDefault!11685)) b!334426))

(assert (= start!33658 b!334427))

(declare-fun m!338753 () Bool)

(assert (=> mapNonEmpty!11685 m!338753))

(declare-fun m!338755 () Bool)

(assert (=> b!334421 m!338755))

(declare-fun m!338757 () Bool)

(assert (=> b!334420 m!338757))

(declare-fun m!338759 () Bool)

(assert (=> b!334424 m!338759))

(declare-fun m!338761 () Bool)

(assert (=> b!334424 m!338761))

(declare-fun m!338763 () Bool)

(assert (=> b!334423 m!338763))

(declare-fun m!338765 () Bool)

(assert (=> b!334423 m!338765))

(declare-fun m!338767 () Bool)

(assert (=> b!334425 m!338767))

(declare-fun m!338769 () Bool)

(assert (=> b!334422 m!338769))

(assert (=> b!334422 m!338769))

(declare-fun m!338771 () Bool)

(assert (=> b!334422 m!338771))

(declare-fun m!338773 () Bool)

(assert (=> b!334417 m!338773))

(declare-fun m!338775 () Bool)

(assert (=> start!33658 m!338775))

(declare-fun m!338777 () Bool)

(assert (=> start!33658 m!338777))

(declare-fun m!338779 () Bool)

(assert (=> start!33658 m!338779))

(check-sat (not b!334420) (not mapNonEmpty!11685) (not b!334424) (not b!334422) b_and!14101 (not b_next!6907) (not b!334421) (not b!334417) (not start!33658) tp_is_empty!6859 (not b!334423) (not b!334425))
(check-sat b_and!14101 (not b_next!6907))
