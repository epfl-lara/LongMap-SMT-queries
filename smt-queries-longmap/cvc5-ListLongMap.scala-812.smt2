; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19760 () Bool)

(assert start!19760)

(declare-fun b!193631 () Bool)

(declare-fun b_free!4711 () Bool)

(declare-fun b_next!4711 () Bool)

(assert (=> b!193631 (= b_free!4711 (not b_next!4711))))

(declare-fun tp!17000 () Bool)

(declare-fun b_and!11421 () Bool)

(assert (=> b!193631 (= tp!17000 b_and!11421)))

(declare-fun b!193621 () Bool)

(declare-fun e!127396 () Bool)

(declare-fun tp_is_empty!4483 () Bool)

(assert (=> b!193621 (= e!127396 tp_is_empty!4483)))

(declare-fun res!91502 () Bool)

(declare-fun e!127394 () Bool)

(assert (=> start!19760 (=> (not res!91502) (not e!127394))))

(declare-datatypes ((V!5625 0))(
  ( (V!5626 (val!2286 Int)) )
))
(declare-datatypes ((ValueCell!1898 0))(
  ( (ValueCellFull!1898 (v!4245 V!5625)) (EmptyCell!1898) )
))
(declare-datatypes ((array!8215 0))(
  ( (array!8216 (arr!3867 (Array (_ BitVec 32) (_ BitVec 64))) (size!4191 (_ BitVec 32))) )
))
(declare-datatypes ((array!8217 0))(
  ( (array!8218 (arr!3868 (Array (_ BitVec 32) ValueCell!1898)) (size!4192 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2704 0))(
  ( (LongMapFixedSize!2705 (defaultEntry!3952 Int) (mask!9209 (_ BitVec 32)) (extraKeys!3689 (_ BitVec 32)) (zeroValue!3793 V!5625) (minValue!3793 V!5625) (_size!1401 (_ BitVec 32)) (_keys!5944 array!8215) (_values!3935 array!8217) (_vacant!1401 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2704)

(declare-fun valid!1109 (LongMapFixedSize!2704) Bool)

(assert (=> start!19760 (= res!91502 (valid!1109 thiss!1248))))

(assert (=> start!19760 e!127394))

(declare-fun e!127389 () Bool)

(assert (=> start!19760 e!127389))

(assert (=> start!19760 true))

(assert (=> start!19760 tp_is_empty!4483))

(declare-fun b!193622 () Bool)

(declare-fun res!91506 () Bool)

(declare-fun e!127393 () Bool)

(assert (=> b!193622 (=> res!91506 e!127393)))

(declare-datatypes ((SeekEntryResult!690 0))(
  ( (MissingZero!690 (index!4930 (_ BitVec 32))) (Found!690 (index!4931 (_ BitVec 32))) (Intermediate!690 (undefined!1502 Bool) (index!4932 (_ BitVec 32)) (x!20668 (_ BitVec 32))) (Undefined!690) (MissingVacant!690 (index!4933 (_ BitVec 32))) )
))
(declare-fun lt!96418 () SeekEntryResult!690)

(assert (=> b!193622 (= res!91506 (or (bvslt (index!4931 lt!96418) #b00000000000000000000000000000000) (bvsge (index!4931 lt!96418) (size!4191 (_keys!5944 thiss!1248)))))))

(declare-fun mapIsEmpty!7754 () Bool)

(declare-fun mapRes!7754 () Bool)

(assert (=> mapIsEmpty!7754 mapRes!7754))

(declare-fun mapNonEmpty!7754 () Bool)

(declare-fun tp!16999 () Bool)

(assert (=> mapNonEmpty!7754 (= mapRes!7754 (and tp!16999 e!127396))))

(declare-fun mapKey!7754 () (_ BitVec 32))

(declare-fun mapRest!7754 () (Array (_ BitVec 32) ValueCell!1898))

(declare-fun mapValue!7754 () ValueCell!1898)

(assert (=> mapNonEmpty!7754 (= (arr!3868 (_values!3935 thiss!1248)) (store mapRest!7754 mapKey!7754 mapValue!7754))))

(declare-fun b!193623 () Bool)

(declare-fun e!127398 () Bool)

(assert (=> b!193623 (= e!127398 (not e!127393))))

(declare-fun res!91507 () Bool)

(assert (=> b!193623 (=> res!91507 e!127393)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193623 (= res!91507 (not (validMask!0 (mask!9209 thiss!1248))))))

(declare-datatypes ((tuple2!3552 0))(
  ( (tuple2!3553 (_1!1787 (_ BitVec 64)) (_2!1787 V!5625)) )
))
(declare-datatypes ((List!2443 0))(
  ( (Nil!2440) (Cons!2439 (h!3080 tuple2!3552) (t!7367 List!2443)) )
))
(declare-datatypes ((ListLongMap!2469 0))(
  ( (ListLongMap!2470 (toList!1250 List!2443)) )
))
(declare-fun lt!96420 () ListLongMap!2469)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5625)

(declare-fun +!318 (ListLongMap!2469 tuple2!3552) ListLongMap!2469)

(declare-fun getCurrentListMap!898 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) Int) ListLongMap!2469)

(assert (=> b!193623 (= (+!318 lt!96420 (tuple2!3553 key!828 v!309)) (getCurrentListMap!898 (_keys!5944 thiss!1248) (array!8218 (store (arr!3868 (_values!3935 thiss!1248)) (index!4931 lt!96418) (ValueCellFull!1898 v!309)) (size!4192 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-datatypes ((Unit!5864 0))(
  ( (Unit!5865) )
))
(declare-fun lt!96417 () Unit!5864)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!119 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) (_ BitVec 64) V!5625 Int) Unit!5864)

(assert (=> b!193623 (= lt!96417 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!119 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) (index!4931 lt!96418) key!828 v!309 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96419 () Unit!5864)

(declare-fun e!127395 () Unit!5864)

(assert (=> b!193623 (= lt!96419 e!127395)))

(declare-fun c!34922 () Bool)

(declare-fun contains!1373 (ListLongMap!2469 (_ BitVec 64)) Bool)

(assert (=> b!193623 (= c!34922 (contains!1373 lt!96420 key!828))))

(assert (=> b!193623 (= lt!96420 (getCurrentListMap!898 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun b!193624 () Bool)

(declare-fun res!91501 () Bool)

(assert (=> b!193624 (=> res!91501 e!127393)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8215 (_ BitVec 32)) Bool)

(assert (=> b!193624 (= res!91501 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5944 thiss!1248) (mask!9209 thiss!1248))))))

(declare-fun b!193625 () Bool)

(declare-fun res!91500 () Bool)

(assert (=> b!193625 (=> res!91500 e!127393)))

(assert (=> b!193625 (= res!91500 (or (not (= (size!4192 (_values!3935 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9209 thiss!1248)))) (not (= (size!4191 (_keys!5944 thiss!1248)) (size!4192 (_values!3935 thiss!1248)))) (bvslt (mask!9209 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3689 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3689 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!193626 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193626 (= e!127393 (validKeyInArray!0 (select (arr!3867 (_keys!5944 thiss!1248)) (index!4931 lt!96418))))))

(declare-fun b!193627 () Bool)

(declare-fun Unit!5866 () Unit!5864)

(assert (=> b!193627 (= e!127395 Unit!5866)))

(declare-fun lt!96422 () Unit!5864)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!193 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5864)

(assert (=> b!193627 (= lt!96422 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!193 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(assert (=> b!193627 false))

(declare-fun b!193628 () Bool)

(assert (=> b!193628 (= e!127394 e!127398)))

(declare-fun res!91505 () Bool)

(assert (=> b!193628 (=> (not res!91505) (not e!127398))))

(assert (=> b!193628 (= res!91505 (and (not (is-Undefined!690 lt!96418)) (not (is-MissingVacant!690 lt!96418)) (not (is-MissingZero!690 lt!96418)) (is-Found!690 lt!96418)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8215 (_ BitVec 32)) SeekEntryResult!690)

(assert (=> b!193628 (= lt!96418 (seekEntryOrOpen!0 key!828 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)))))

(declare-fun b!193629 () Bool)

(declare-fun res!91503 () Bool)

(assert (=> b!193629 (=> res!91503 e!127393)))

(declare-datatypes ((List!2444 0))(
  ( (Nil!2441) (Cons!2440 (h!3081 (_ BitVec 64)) (t!7368 List!2444)) )
))
(declare-fun arrayNoDuplicates!0 (array!8215 (_ BitVec 32) List!2444) Bool)

(assert (=> b!193629 (= res!91503 (not (arrayNoDuplicates!0 (_keys!5944 thiss!1248) #b00000000000000000000000000000000 Nil!2441)))))

(declare-fun b!193630 () Bool)

(declare-fun e!127397 () Bool)

(assert (=> b!193630 (= e!127397 tp_is_empty!4483)))

(declare-fun e!127391 () Bool)

(declare-fun array_inv!2509 (array!8215) Bool)

(declare-fun array_inv!2510 (array!8217) Bool)

(assert (=> b!193631 (= e!127389 (and tp!17000 tp_is_empty!4483 (array_inv!2509 (_keys!5944 thiss!1248)) (array_inv!2510 (_values!3935 thiss!1248)) e!127391))))

(declare-fun b!193632 () Bool)

(assert (=> b!193632 (= e!127391 (and e!127397 mapRes!7754))))

(declare-fun condMapEmpty!7754 () Bool)

(declare-fun mapDefault!7754 () ValueCell!1898)

