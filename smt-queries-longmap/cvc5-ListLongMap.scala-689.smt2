; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16638 () Bool)

(assert start!16638)

(declare-fun b!166208 () Bool)

(declare-fun b_free!3943 () Bool)

(declare-fun b_next!3943 () Bool)

(assert (=> b!166208 (= b_free!3943 (not b_next!3943))))

(declare-fun tp!14430 () Bool)

(declare-fun b_and!10357 () Bool)

(assert (=> b!166208 (= tp!14430 b_and!10357)))

(declare-fun b!166200 () Bool)

(declare-datatypes ((Unit!5049 0))(
  ( (Unit!5050) )
))
(declare-fun e!109019 () Unit!5049)

(declare-fun lt!83215 () Unit!5049)

(assert (=> b!166200 (= e!109019 lt!83215)))

(declare-datatypes ((V!4641 0))(
  ( (V!4642 (val!1917 Int)) )
))
(declare-datatypes ((ValueCell!1529 0))(
  ( (ValueCellFull!1529 (v!3782 V!4641)) (EmptyCell!1529) )
))
(declare-datatypes ((array!6587 0))(
  ( (array!6588 (arr!3129 (Array (_ BitVec 32) (_ BitVec 64))) (size!3417 (_ BitVec 32))) )
))
(declare-datatypes ((array!6589 0))(
  ( (array!6590 (arr!3130 (Array (_ BitVec 32) ValueCell!1529)) (size!3418 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1966 0))(
  ( (LongMapFixedSize!1967 (defaultEntry!3425 Int) (mask!8152 (_ BitVec 32)) (extraKeys!3166 (_ BitVec 32)) (zeroValue!3268 V!4641) (minValue!3268 V!4641) (_size!1032 (_ BitVec 32)) (_keys!5250 array!6587) (_values!3408 array!6589) (_vacant!1032 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1966)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!83 (array!6587 array!6589 (_ BitVec 32) (_ BitVec 32) V!4641 V!4641 (_ BitVec 64) Int) Unit!5049)

(assert (=> b!166200 (= lt!83215 (lemmaInListMapThenSeekEntryOrOpenFindsIt!83 (_keys!5250 thiss!1248) (_values!3408 thiss!1248) (mask!8152 thiss!1248) (extraKeys!3166 thiss!1248) (zeroValue!3268 thiss!1248) (minValue!3268 thiss!1248) key!828 (defaultEntry!3425 thiss!1248)))))

(declare-fun res!78977 () Bool)

(declare-datatypes ((SeekEntryResult!451 0))(
  ( (MissingZero!451 (index!3972 (_ BitVec 32))) (Found!451 (index!3973 (_ BitVec 32))) (Intermediate!451 (undefined!1263 Bool) (index!3974 (_ BitVec 32)) (x!18415 (_ BitVec 32))) (Undefined!451) (MissingVacant!451 (index!3975 (_ BitVec 32))) )
))
(declare-fun lt!83218 () SeekEntryResult!451)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166200 (= res!78977 (inRange!0 (index!3973 lt!83218) (mask!8152 thiss!1248)))))

(declare-fun e!109011 () Bool)

(assert (=> b!166200 (=> (not res!78977) (not e!109011))))

(assert (=> b!166200 e!109011))

(declare-fun b!166201 () Bool)

(assert (=> b!166201 (= e!109011 (= (select (arr!3129 (_keys!5250 thiss!1248)) (index!3973 lt!83218)) key!828))))

(declare-fun b!166202 () Bool)

(declare-fun res!78975 () Bool)

(declare-fun e!109012 () Bool)

(assert (=> b!166202 (=> (not res!78975) (not e!109012))))

(assert (=> b!166202 (= res!78975 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166203 () Bool)

(declare-fun Unit!5051 () Unit!5049)

(assert (=> b!166203 (= e!109019 Unit!5051)))

(declare-fun lt!83214 () Unit!5049)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!84 (array!6587 array!6589 (_ BitVec 32) (_ BitVec 32) V!4641 V!4641 (_ BitVec 64) Int) Unit!5049)

(assert (=> b!166203 (= lt!83214 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!84 (_keys!5250 thiss!1248) (_values!3408 thiss!1248) (mask!8152 thiss!1248) (extraKeys!3166 thiss!1248) (zeroValue!3268 thiss!1248) (minValue!3268 thiss!1248) key!828 (defaultEntry!3425 thiss!1248)))))

(assert (=> b!166203 false))

(declare-fun mapNonEmpty!6336 () Bool)

(declare-fun mapRes!6336 () Bool)

(declare-fun tp!14429 () Bool)

(declare-fun e!109010 () Bool)

(assert (=> mapNonEmpty!6336 (= mapRes!6336 (and tp!14429 e!109010))))

(declare-fun mapRest!6336 () (Array (_ BitVec 32) ValueCell!1529))

(declare-fun mapKey!6336 () (_ BitVec 32))

(declare-fun mapValue!6336 () ValueCell!1529)

(assert (=> mapNonEmpty!6336 (= (arr!3130 (_values!3408 thiss!1248)) (store mapRest!6336 mapKey!6336 mapValue!6336))))

(declare-fun b!166204 () Bool)

(declare-fun e!109015 () Bool)

(assert (=> b!166204 (= e!109015 false)))

(declare-fun lt!83216 () Bool)

(declare-datatypes ((List!2083 0))(
  ( (Nil!2080) (Cons!2079 (h!2696 (_ BitVec 64)) (t!6885 List!2083)) )
))
(declare-fun arrayNoDuplicates!0 (array!6587 (_ BitVec 32) List!2083) Bool)

(assert (=> b!166204 (= lt!83216 (arrayNoDuplicates!0 (_keys!5250 thiss!1248) #b00000000000000000000000000000000 Nil!2080))))

(declare-fun b!166205 () Bool)

(declare-fun e!109018 () Bool)

(declare-fun e!109014 () Bool)

(assert (=> b!166205 (= e!109018 (and e!109014 mapRes!6336))))

(declare-fun condMapEmpty!6336 () Bool)

(declare-fun mapDefault!6336 () ValueCell!1529)

