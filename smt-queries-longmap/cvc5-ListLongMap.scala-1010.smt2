; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21660 () Bool)

(assert start!21660)

(declare-fun b!217366 () Bool)

(declare-fun b_free!5809 () Bool)

(declare-fun b_next!5809 () Bool)

(assert (=> b!217366 (= b_free!5809 (not b_next!5809))))

(declare-fun tp!20561 () Bool)

(declare-fun b_and!12699 () Bool)

(assert (=> b!217366 (= tp!20561 b_and!12699)))

(declare-fun b!217360 () Bool)

(declare-fun e!141403 () Bool)

(assert (=> b!217360 (= e!141403 false)))

(declare-fun lt!111333 () Bool)

(declare-datatypes ((V!7209 0))(
  ( (V!7210 (val!2880 Int)) )
))
(declare-datatypes ((ValueCell!2492 0))(
  ( (ValueCellFull!2492 (v!4898 V!7209)) (EmptyCell!2492) )
))
(declare-datatypes ((array!10581 0))(
  ( (array!10582 (arr!5012 (Array (_ BitVec 32) ValueCell!2492)) (size!5344 (_ BitVec 32))) )
))
(declare-datatypes ((array!10583 0))(
  ( (array!10584 (arr!5013 (Array (_ BitVec 32) (_ BitVec 64))) (size!5345 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2884 0))(
  ( (LongMapFixedSize!2885 (defaultEntry!4092 Int) (mask!9847 (_ BitVec 32)) (extraKeys!3829 (_ BitVec 32)) (zeroValue!3933 V!7209) (minValue!3933 V!7209) (_size!1491 (_ BitVec 32)) (_keys!6141 array!10583) (_values!4075 array!10581) (_vacant!1491 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2884)

(declare-datatypes ((List!3189 0))(
  ( (Nil!3186) (Cons!3185 (h!3832 (_ BitVec 64)) (t!8144 List!3189)) )
))
(declare-fun arrayNoDuplicates!0 (array!10583 (_ BitVec 32) List!3189) Bool)

(assert (=> b!217360 (= lt!111333 (arrayNoDuplicates!0 (_keys!6141 thiss!1504) #b00000000000000000000000000000000 Nil!3186))))

(declare-fun mapNonEmpty!9669 () Bool)

(declare-fun mapRes!9669 () Bool)

(declare-fun tp!20562 () Bool)

(declare-fun e!141408 () Bool)

(assert (=> mapNonEmpty!9669 (= mapRes!9669 (and tp!20562 e!141408))))

(declare-fun mapRest!9669 () (Array (_ BitVec 32) ValueCell!2492))

(declare-fun mapValue!9669 () ValueCell!2492)

(declare-fun mapKey!9669 () (_ BitVec 32))

(assert (=> mapNonEmpty!9669 (= (arr!5012 (_values!4075 thiss!1504)) (store mapRest!9669 mapKey!9669 mapValue!9669))))

(declare-fun res!106419 () Bool)

(declare-fun e!141406 () Bool)

(assert (=> start!21660 (=> (not res!106419) (not e!141406))))

(declare-fun valid!1172 (LongMapFixedSize!2884) Bool)

(assert (=> start!21660 (= res!106419 (valid!1172 thiss!1504))))

(assert (=> start!21660 e!141406))

(declare-fun e!141405 () Bool)

(assert (=> start!21660 e!141405))

(assert (=> start!21660 true))

(declare-fun b!217361 () Bool)

(declare-fun res!106423 () Bool)

(assert (=> b!217361 (=> (not res!106423) (not e!141403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10583 (_ BitVec 32)) Bool)

(assert (=> b!217361 (= res!106423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6141 thiss!1504) (mask!9847 thiss!1504)))))

(declare-fun b!217362 () Bool)

(declare-fun e!141407 () Bool)

(declare-fun e!141409 () Bool)

(assert (=> b!217362 (= e!141407 (and e!141409 mapRes!9669))))

(declare-fun condMapEmpty!9669 () Bool)

(declare-fun mapDefault!9669 () ValueCell!2492)

