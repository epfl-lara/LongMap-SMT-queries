; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19764 () Bool)

(assert start!19764)

(declare-fun b!193724 () Bool)

(declare-fun b_free!4715 () Bool)

(declare-fun b_next!4715 () Bool)

(assert (=> b!193724 (= b_free!4715 (not b_next!4715))))

(declare-fun tp!17012 () Bool)

(declare-fun b_and!11425 () Bool)

(assert (=> b!193724 (= tp!17012 b_and!11425)))

(declare-fun b!193711 () Bool)

(declare-datatypes ((Unit!5870 0))(
  ( (Unit!5871) )
))
(declare-fun e!127455 () Unit!5870)

(declare-fun lt!96455 () Unit!5870)

(assert (=> b!193711 (= e!127455 lt!96455)))

(declare-datatypes ((V!5629 0))(
  ( (V!5630 (val!2288 Int)) )
))
(declare-datatypes ((ValueCell!1900 0))(
  ( (ValueCellFull!1900 (v!4247 V!5629)) (EmptyCell!1900) )
))
(declare-datatypes ((array!8223 0))(
  ( (array!8224 (arr!3871 (Array (_ BitVec 32) (_ BitVec 64))) (size!4195 (_ BitVec 32))) )
))
(declare-datatypes ((array!8225 0))(
  ( (array!8226 (arr!3872 (Array (_ BitVec 32) ValueCell!1900)) (size!4196 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2708 0))(
  ( (LongMapFixedSize!2709 (defaultEntry!3954 Int) (mask!9211 (_ BitVec 32)) (extraKeys!3691 (_ BitVec 32)) (zeroValue!3795 V!5629) (minValue!3795 V!5629) (_size!1403 (_ BitVec 32)) (_keys!5946 array!8223) (_values!3937 array!8225) (_vacant!1403 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2708)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!185 (array!8223 array!8225 (_ BitVec 32) (_ BitVec 32) V!5629 V!5629 (_ BitVec 64) Int) Unit!5870)

(assert (=> b!193711 (= lt!96455 (lemmaInListMapThenSeekEntryOrOpenFindsIt!185 (_keys!5946 thiss!1248) (_values!3937 thiss!1248) (mask!9211 thiss!1248) (extraKeys!3691 thiss!1248) (zeroValue!3795 thiss!1248) (minValue!3795 thiss!1248) key!828 (defaultEntry!3954 thiss!1248)))))

(declare-fun res!91558 () Bool)

(declare-datatypes ((SeekEntryResult!692 0))(
  ( (MissingZero!692 (index!4938 (_ BitVec 32))) (Found!692 (index!4939 (_ BitVec 32))) (Intermediate!692 (undefined!1504 Bool) (index!4940 (_ BitVec 32)) (x!20670 (_ BitVec 32))) (Undefined!692) (MissingVacant!692 (index!4941 (_ BitVec 32))) )
))
(declare-fun lt!96458 () SeekEntryResult!692)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193711 (= res!91558 (inRange!0 (index!4939 lt!96458) (mask!9211 thiss!1248)))))

(declare-fun e!127449 () Bool)

(assert (=> b!193711 (=> (not res!91558) (not e!127449))))

(assert (=> b!193711 e!127449))

(declare-fun b!193712 () Bool)

(declare-fun res!91556 () Bool)

(declare-fun e!127454 () Bool)

(assert (=> b!193712 (=> (not res!91556) (not e!127454))))

(assert (=> b!193712 (= res!91556 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193713 () Bool)

(declare-fun res!91559 () Bool)

(declare-fun e!127456 () Bool)

(assert (=> b!193713 (=> res!91559 e!127456)))

(assert (=> b!193713 (= res!91559 (or (not (= (size!4196 (_values!3937 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9211 thiss!1248)))) (not (= (size!4195 (_keys!5946 thiss!1248)) (size!4196 (_values!3937 thiss!1248)))) (bvslt (mask!9211 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3691 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3691 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!91557 () Bool)

(assert (=> start!19764 (=> (not res!91557) (not e!127454))))

(declare-fun valid!1111 (LongMapFixedSize!2708) Bool)

(assert (=> start!19764 (= res!91557 (valid!1111 thiss!1248))))

(assert (=> start!19764 e!127454))

(declare-fun e!127451 () Bool)

(assert (=> start!19764 e!127451))

(assert (=> start!19764 true))

(declare-fun tp_is_empty!4487 () Bool)

(assert (=> start!19764 tp_is_empty!4487))

(declare-fun b!193714 () Bool)

(assert (=> b!193714 (= e!127449 (= (select (arr!3871 (_keys!5946 thiss!1248)) (index!4939 lt!96458)) key!828))))

(declare-fun mapIsEmpty!7760 () Bool)

(declare-fun mapRes!7760 () Bool)

(assert (=> mapIsEmpty!7760 mapRes!7760))

(declare-fun b!193715 () Bool)

(declare-fun res!91561 () Bool)

(assert (=> b!193715 (=> res!91561 e!127456)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8223 (_ BitVec 32)) Bool)

(assert (=> b!193715 (= res!91561 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5946 thiss!1248) (mask!9211 thiss!1248))))))

(declare-fun mapNonEmpty!7760 () Bool)

(declare-fun tp!17011 () Bool)

(declare-fun e!127453 () Bool)

(assert (=> mapNonEmpty!7760 (= mapRes!7760 (and tp!17011 e!127453))))

(declare-fun mapRest!7760 () (Array (_ BitVec 32) ValueCell!1900))

(declare-fun mapValue!7760 () ValueCell!1900)

(declare-fun mapKey!7760 () (_ BitVec 32))

(assert (=> mapNonEmpty!7760 (= (arr!3872 (_values!3937 thiss!1248)) (store mapRest!7760 mapKey!7760 mapValue!7760))))

(declare-fun b!193716 () Bool)

(declare-fun e!127457 () Bool)

(assert (=> b!193716 (= e!127454 e!127457)))

(declare-fun res!91560 () Bool)

(assert (=> b!193716 (=> (not res!91560) (not e!127457))))

(assert (=> b!193716 (= res!91560 (and (not (is-Undefined!692 lt!96458)) (not (is-MissingVacant!692 lt!96458)) (not (is-MissingZero!692 lt!96458)) (is-Found!692 lt!96458)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8223 (_ BitVec 32)) SeekEntryResult!692)

(assert (=> b!193716 (= lt!96458 (seekEntryOrOpen!0 key!828 (_keys!5946 thiss!1248) (mask!9211 thiss!1248)))))

(declare-fun b!193717 () Bool)

(assert (=> b!193717 (= e!127457 (not e!127456))))

(declare-fun res!91555 () Bool)

(assert (=> b!193717 (=> res!91555 e!127456)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193717 (= res!91555 (not (validMask!0 (mask!9211 thiss!1248))))))

(declare-datatypes ((tuple2!3556 0))(
  ( (tuple2!3557 (_1!1789 (_ BitVec 64)) (_2!1789 V!5629)) )
))
(declare-datatypes ((List!2447 0))(
  ( (Nil!2444) (Cons!2443 (h!3084 tuple2!3556) (t!7371 List!2447)) )
))
(declare-datatypes ((ListLongMap!2473 0))(
  ( (ListLongMap!2474 (toList!1252 List!2447)) )
))
(declare-fun lt!96454 () ListLongMap!2473)

(declare-fun v!309 () V!5629)

(declare-fun +!320 (ListLongMap!2473 tuple2!3556) ListLongMap!2473)

(declare-fun getCurrentListMap!900 (array!8223 array!8225 (_ BitVec 32) (_ BitVec 32) V!5629 V!5629 (_ BitVec 32) Int) ListLongMap!2473)

(assert (=> b!193717 (= (+!320 lt!96454 (tuple2!3557 key!828 v!309)) (getCurrentListMap!900 (_keys!5946 thiss!1248) (array!8226 (store (arr!3872 (_values!3937 thiss!1248)) (index!4939 lt!96458) (ValueCellFull!1900 v!309)) (size!4196 (_values!3937 thiss!1248))) (mask!9211 thiss!1248) (extraKeys!3691 thiss!1248) (zeroValue!3795 thiss!1248) (minValue!3795 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3954 thiss!1248)))))

(declare-fun lt!96456 () Unit!5870)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!121 (array!8223 array!8225 (_ BitVec 32) (_ BitVec 32) V!5629 V!5629 (_ BitVec 32) (_ BitVec 64) V!5629 Int) Unit!5870)

(assert (=> b!193717 (= lt!96456 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!121 (_keys!5946 thiss!1248) (_values!3937 thiss!1248) (mask!9211 thiss!1248) (extraKeys!3691 thiss!1248) (zeroValue!3795 thiss!1248) (minValue!3795 thiss!1248) (index!4939 lt!96458) key!828 v!309 (defaultEntry!3954 thiss!1248)))))

(declare-fun lt!96457 () Unit!5870)

(assert (=> b!193717 (= lt!96457 e!127455)))

(declare-fun c!34928 () Bool)

(declare-fun contains!1375 (ListLongMap!2473 (_ BitVec 64)) Bool)

(assert (=> b!193717 (= c!34928 (contains!1375 lt!96454 key!828))))

(assert (=> b!193717 (= lt!96454 (getCurrentListMap!900 (_keys!5946 thiss!1248) (_values!3937 thiss!1248) (mask!9211 thiss!1248) (extraKeys!3691 thiss!1248) (zeroValue!3795 thiss!1248) (minValue!3795 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3954 thiss!1248)))))

(declare-fun b!193718 () Bool)

(declare-fun e!127452 () Bool)

(assert (=> b!193718 (= e!127452 tp_is_empty!4487)))

(declare-fun b!193719 () Bool)

(declare-fun res!91554 () Bool)

(assert (=> b!193719 (=> res!91554 e!127456)))

(assert (=> b!193719 (= res!91554 (or (bvslt (index!4939 lt!96458) #b00000000000000000000000000000000) (bvsge (index!4939 lt!96458) (size!4195 (_keys!5946 thiss!1248)))))))

(declare-fun b!193720 () Bool)

(declare-fun e!127458 () Bool)

(assert (=> b!193720 (= e!127458 (and e!127452 mapRes!7760))))

(declare-fun condMapEmpty!7760 () Bool)

(declare-fun mapDefault!7760 () ValueCell!1900)

