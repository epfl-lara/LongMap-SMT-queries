; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16648 () Bool)

(assert start!16648)

(declare-fun b!166396 () Bool)

(declare-fun b_free!3953 () Bool)

(declare-fun b_next!3953 () Bool)

(assert (=> b!166396 (= b_free!3953 (not b_next!3953))))

(declare-fun tp!14459 () Bool)

(declare-fun b_and!10367 () Bool)

(assert (=> b!166396 (= tp!14459 b_and!10367)))

(declare-fun b!166395 () Bool)

(declare-fun res!79083 () Bool)

(declare-fun e!109166 () Bool)

(assert (=> b!166395 (=> (not res!79083) (not e!109166))))

(declare-datatypes ((V!4653 0))(
  ( (V!4654 (val!1922 Int)) )
))
(declare-datatypes ((ValueCell!1534 0))(
  ( (ValueCellFull!1534 (v!3787 V!4653)) (EmptyCell!1534) )
))
(declare-datatypes ((array!6607 0))(
  ( (array!6608 (arr!3139 (Array (_ BitVec 32) (_ BitVec 64))) (size!3427 (_ BitVec 32))) )
))
(declare-datatypes ((array!6609 0))(
  ( (array!6610 (arr!3140 (Array (_ BitVec 32) ValueCell!1534)) (size!3428 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1976 0))(
  ( (LongMapFixedSize!1977 (defaultEntry!3430 Int) (mask!8159 (_ BitVec 32)) (extraKeys!3171 (_ BitVec 32)) (zeroValue!3273 V!4653) (minValue!3273 V!4653) (_size!1037 (_ BitVec 32)) (_keys!5255 array!6607) (_values!3413 array!6609) (_vacant!1037 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1976)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6607 (_ BitVec 32)) Bool)

(assert (=> b!166395 (= res!79083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5255 thiss!1248) (mask!8159 thiss!1248)))))

(declare-fun e!109162 () Bool)

(declare-fun e!109168 () Bool)

(declare-fun tp_is_empty!3755 () Bool)

(declare-fun array_inv!2013 (array!6607) Bool)

(declare-fun array_inv!2014 (array!6609) Bool)

(assert (=> b!166396 (= e!109168 (and tp!14459 tp_is_empty!3755 (array_inv!2013 (_keys!5255 thiss!1248)) (array_inv!2014 (_values!3413 thiss!1248)) e!109162))))

(declare-fun mapIsEmpty!6351 () Bool)

(declare-fun mapRes!6351 () Bool)

(assert (=> mapIsEmpty!6351 mapRes!6351))

(declare-fun res!79080 () Bool)

(declare-fun e!109161 () Bool)

(assert (=> start!16648 (=> (not res!79080) (not e!109161))))

(declare-fun valid!868 (LongMapFixedSize!1976) Bool)

(assert (=> start!16648 (= res!79080 (valid!868 thiss!1248))))

(assert (=> start!16648 e!109161))

(assert (=> start!16648 e!109168))

(assert (=> start!16648 true))

(declare-fun b!166397 () Bool)

(assert (=> b!166397 (= e!109166 false)))

(declare-fun lt!83291 () Bool)

(declare-datatypes ((List!2090 0))(
  ( (Nil!2087) (Cons!2086 (h!2703 (_ BitVec 64)) (t!6892 List!2090)) )
))
(declare-fun arrayNoDuplicates!0 (array!6607 (_ BitVec 32) List!2090) Bool)

(assert (=> b!166397 (= lt!83291 (arrayNoDuplicates!0 (_keys!5255 thiss!1248) #b00000000000000000000000000000000 Nil!2087))))

(declare-fun b!166398 () Bool)

(declare-fun e!109163 () Bool)

(declare-datatypes ((SeekEntryResult!455 0))(
  ( (MissingZero!455 (index!3988 (_ BitVec 32))) (Found!455 (index!3989 (_ BitVec 32))) (Intermediate!455 (undefined!1267 Bool) (index!3990 (_ BitVec 32)) (x!18427 (_ BitVec 32))) (Undefined!455) (MissingVacant!455 (index!3991 (_ BitVec 32))) )
))
(declare-fun lt!83289 () SeekEntryResult!455)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!166398 (= e!109163 (= (select (arr!3139 (_keys!5255 thiss!1248)) (index!3989 lt!83289)) key!828))))

(declare-fun b!166399 () Bool)

(declare-fun res!79081 () Bool)

(assert (=> b!166399 (=> (not res!79081) (not e!109161))))

(assert (=> b!166399 (= res!79081 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166400 () Bool)

(declare-fun e!109169 () Bool)

(assert (=> b!166400 (= e!109161 e!109169)))

(declare-fun res!79078 () Bool)

(assert (=> b!166400 (=> (not res!79078) (not e!109169))))

(assert (=> b!166400 (= res!79078 (and (not (is-Undefined!455 lt!83289)) (not (is-MissingVacant!455 lt!83289)) (not (is-MissingZero!455 lt!83289)) (is-Found!455 lt!83289)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6607 (_ BitVec 32)) SeekEntryResult!455)

(assert (=> b!166400 (= lt!83289 (seekEntryOrOpen!0 key!828 (_keys!5255 thiss!1248) (mask!8159 thiss!1248)))))

(declare-fun b!166401 () Bool)

(declare-fun e!109164 () Bool)

(assert (=> b!166401 (= e!109162 (and e!109164 mapRes!6351))))

(declare-fun condMapEmpty!6351 () Bool)

(declare-fun mapDefault!6351 () ValueCell!1534)

