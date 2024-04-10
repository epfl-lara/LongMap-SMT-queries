; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18410 () Bool)

(assert start!18410)

(declare-fun b!182623 () Bool)

(declare-fun b_free!4505 () Bool)

(declare-fun b_next!4505 () Bool)

(assert (=> b!182623 (= b_free!4505 (not b_next!4505))))

(declare-fun tp!16277 () Bool)

(declare-fun b_and!11069 () Bool)

(assert (=> b!182623 (= tp!16277 b_and!11069)))

(declare-fun b!182621 () Bool)

(declare-fun e!120250 () Bool)

(declare-fun e!120246 () Bool)

(assert (=> b!182621 (= e!120250 e!120246)))

(declare-fun res!86436 () Bool)

(assert (=> b!182621 (=> (not res!86436) (not e!120246))))

(declare-datatypes ((SeekEntryResult!609 0))(
  ( (MissingZero!609 (index!4606 (_ BitVec 32))) (Found!609 (index!4607 (_ BitVec 32))) (Intermediate!609 (undefined!1421 Bool) (index!4608 (_ BitVec 32)) (x!19901 (_ BitVec 32))) (Undefined!609) (MissingVacant!609 (index!4609 (_ BitVec 32))) )
))
(declare-fun lt!90301 () SeekEntryResult!609)

(assert (=> b!182621 (= res!86436 (and (not (is-Undefined!609 lt!90301)) (not (is-MissingVacant!609 lt!90301)) (not (is-MissingZero!609 lt!90301)) (is-Found!609 lt!90301)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5349 0))(
  ( (V!5350 (val!2183 Int)) )
))
(declare-datatypes ((ValueCell!1795 0))(
  ( (ValueCellFull!1795 (v!4083 V!5349)) (EmptyCell!1795) )
))
(declare-datatypes ((array!7741 0))(
  ( (array!7742 (arr!3661 (Array (_ BitVec 32) (_ BitVec 64))) (size!3973 (_ BitVec 32))) )
))
(declare-datatypes ((array!7743 0))(
  ( (array!7744 (arr!3662 (Array (_ BitVec 32) ValueCell!1795)) (size!3974 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2498 0))(
  ( (LongMapFixedSize!2499 (defaultEntry!3736 Int) (mask!8782 (_ BitVec 32)) (extraKeys!3473 (_ BitVec 32)) (zeroValue!3577 V!5349) (minValue!3577 V!5349) (_size!1298 (_ BitVec 32)) (_keys!5649 array!7741) (_values!3719 array!7743) (_vacant!1298 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2498)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7741 (_ BitVec 32)) SeekEntryResult!609)

(assert (=> b!182621 (= lt!90301 (seekEntryOrOpen!0 key!828 (_keys!5649 thiss!1248) (mask!8782 thiss!1248)))))

(declare-fun b!182622 () Bool)

(declare-fun res!86437 () Bool)

(assert (=> b!182622 (=> (not res!86437) (not e!120246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182622 (= res!86437 (validMask!0 (mask!8782 thiss!1248)))))

(declare-fun mapNonEmpty!7340 () Bool)

(declare-fun mapRes!7340 () Bool)

(declare-fun tp!16276 () Bool)

(declare-fun e!120251 () Bool)

(assert (=> mapNonEmpty!7340 (= mapRes!7340 (and tp!16276 e!120251))))

(declare-fun mapRest!7340 () (Array (_ BitVec 32) ValueCell!1795))

(declare-fun mapKey!7340 () (_ BitVec 32))

(declare-fun mapValue!7340 () ValueCell!1795)

(assert (=> mapNonEmpty!7340 (= (arr!3662 (_values!3719 thiss!1248)) (store mapRest!7340 mapKey!7340 mapValue!7340))))

(declare-fun tp_is_empty!4277 () Bool)

(declare-fun e!120245 () Bool)

(declare-fun e!120249 () Bool)

(declare-fun array_inv!2363 (array!7741) Bool)

(declare-fun array_inv!2364 (array!7743) Bool)

(assert (=> b!182623 (= e!120249 (and tp!16277 tp_is_empty!4277 (array_inv!2363 (_keys!5649 thiss!1248)) (array_inv!2364 (_values!3719 thiss!1248)) e!120245))))

(declare-fun b!182624 () Bool)

(declare-fun res!86434 () Bool)

(assert (=> b!182624 (=> (not res!86434) (not e!120250))))

(assert (=> b!182624 (= res!86434 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182625 () Bool)

(declare-fun res!86438 () Bool)

(assert (=> b!182625 (=> (not res!86438) (not e!120246))))

(declare-datatypes ((tuple2!3402 0))(
  ( (tuple2!3403 (_1!1712 (_ BitVec 64)) (_2!1712 V!5349)) )
))
(declare-datatypes ((List!2320 0))(
  ( (Nil!2317) (Cons!2316 (h!2945 tuple2!3402) (t!7182 List!2320)) )
))
(declare-datatypes ((ListLongMap!2319 0))(
  ( (ListLongMap!2320 (toList!1175 List!2320)) )
))
(declare-fun contains!1259 (ListLongMap!2319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!823 (array!7741 array!7743 (_ BitVec 32) (_ BitVec 32) V!5349 V!5349 (_ BitVec 32) Int) ListLongMap!2319)

(assert (=> b!182625 (= res!86438 (contains!1259 (getCurrentListMap!823 (_keys!5649 thiss!1248) (_values!3719 thiss!1248) (mask!8782 thiss!1248) (extraKeys!3473 thiss!1248) (zeroValue!3577 thiss!1248) (minValue!3577 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3736 thiss!1248)) key!828))))

(declare-fun b!182626 () Bool)

(declare-fun res!86435 () Bool)

(assert (=> b!182626 (=> (not res!86435) (not e!120246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7741 (_ BitVec 32)) Bool)

(assert (=> b!182626 (= res!86435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5649 thiss!1248) (mask!8782 thiss!1248)))))

(declare-fun b!182627 () Bool)

(declare-fun res!86433 () Bool)

(assert (=> b!182627 (=> (not res!86433) (not e!120246))))

(assert (=> b!182627 (= res!86433 (and (= (size!3974 (_values!3719 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8782 thiss!1248))) (= (size!3973 (_keys!5649 thiss!1248)) (size!3974 (_values!3719 thiss!1248))) (bvsge (mask!8782 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3473 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3473 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182629 () Bool)

(assert (=> b!182629 (= e!120251 tp_is_empty!4277)))

(declare-fun mapIsEmpty!7340 () Bool)

(assert (=> mapIsEmpty!7340 mapRes!7340))

(declare-fun b!182630 () Bool)

(declare-datatypes ((List!2321 0))(
  ( (Nil!2318) (Cons!2317 (h!2946 (_ BitVec 64)) (t!7183 List!2321)) )
))
(declare-fun arrayNoDuplicates!0 (array!7741 (_ BitVec 32) List!2321) Bool)

(assert (=> b!182630 (= e!120246 (not (arrayNoDuplicates!0 (_keys!5649 thiss!1248) #b00000000000000000000000000000000 Nil!2318)))))

(declare-fun b!182631 () Bool)

(declare-fun e!120247 () Bool)

(assert (=> b!182631 (= e!120247 tp_is_empty!4277)))

(declare-fun res!86439 () Bool)

(assert (=> start!18410 (=> (not res!86439) (not e!120250))))

(declare-fun valid!1035 (LongMapFixedSize!2498) Bool)

(assert (=> start!18410 (= res!86439 (valid!1035 thiss!1248))))

(assert (=> start!18410 e!120250))

(assert (=> start!18410 e!120249))

(assert (=> start!18410 true))

(declare-fun b!182628 () Bool)

(assert (=> b!182628 (= e!120245 (and e!120247 mapRes!7340))))

(declare-fun condMapEmpty!7340 () Bool)

(declare-fun mapDefault!7340 () ValueCell!1795)

