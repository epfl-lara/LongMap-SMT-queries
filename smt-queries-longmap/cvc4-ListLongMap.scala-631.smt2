; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16138 () Bool)

(assert start!16138)

(declare-fun b!160689 () Bool)

(declare-fun b_free!3599 () Bool)

(declare-fun b_next!3599 () Bool)

(assert (=> b!160689 (= b_free!3599 (not b_next!3599))))

(declare-fun tp!13367 () Bool)

(declare-fun b_and!10013 () Bool)

(assert (=> b!160689 (= tp!13367 b_and!10013)))

(declare-fun b!160683 () Bool)

(declare-fun e!105038 () Bool)

(declare-fun tp_is_empty!3401 () Bool)

(assert (=> b!160683 (= e!105038 tp_is_empty!3401)))

(declare-fun b!160684 () Bool)

(declare-fun res!76126 () Bool)

(declare-fun e!105040 () Bool)

(assert (=> b!160684 (=> (not res!76126) (not e!105040))))

(declare-datatypes ((V!4181 0))(
  ( (V!4182 (val!1745 Int)) )
))
(declare-datatypes ((ValueCell!1357 0))(
  ( (ValueCellFull!1357 (v!3610 V!4181)) (EmptyCell!1357) )
))
(declare-datatypes ((array!5881 0))(
  ( (array!5882 (arr!2785 (Array (_ BitVec 32) (_ BitVec 64))) (size!3069 (_ BitVec 32))) )
))
(declare-datatypes ((array!5883 0))(
  ( (array!5884 (arr!2786 (Array (_ BitVec 32) ValueCell!1357)) (size!3070 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1622 0))(
  ( (LongMapFixedSize!1623 (defaultEntry!3253 Int) (mask!7827 (_ BitVec 32)) (extraKeys!2994 (_ BitVec 32)) (zeroValue!3096 V!4181) (minValue!3096 V!4181) (_size!860 (_ BitVec 32)) (_keys!5054 array!5881) (_values!3236 array!5883) (_vacant!860 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1622)

(assert (=> b!160684 (= res!76126 (and (= (size!3070 (_values!3236 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7827 thiss!1248))) (= (size!3069 (_keys!5054 thiss!1248)) (size!3070 (_values!3236 thiss!1248))) (bvsge (mask!7827 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2994 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2994 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160685 () Bool)

(declare-fun res!76127 () Bool)

(assert (=> b!160685 (=> (not res!76127) (not e!105040))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!338 0))(
  ( (MissingZero!338 (index!3520 (_ BitVec 32))) (Found!338 (index!3521 (_ BitVec 32))) (Intermediate!338 (undefined!1150 Bool) (index!3522 (_ BitVec 32)) (x!17730 (_ BitVec 32))) (Undefined!338) (MissingVacant!338 (index!3523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5881 (_ BitVec 32)) SeekEntryResult!338)

(assert (=> b!160685 (= res!76127 (is-Undefined!338 (seekEntryOrOpen!0 key!828 (_keys!5054 thiss!1248) (mask!7827 thiss!1248))))))

(declare-fun b!160687 () Bool)

(declare-fun res!76122 () Bool)

(assert (=> b!160687 (=> (not res!76122) (not e!105040))))

(declare-datatypes ((tuple2!2930 0))(
  ( (tuple2!2931 (_1!1476 (_ BitVec 64)) (_2!1476 V!4181)) )
))
(declare-datatypes ((List!1953 0))(
  ( (Nil!1950) (Cons!1949 (h!2562 tuple2!2930) (t!6755 List!1953)) )
))
(declare-datatypes ((ListLongMap!1917 0))(
  ( (ListLongMap!1918 (toList!974 List!1953)) )
))
(declare-fun contains!1010 (ListLongMap!1917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!638 (array!5881 array!5883 (_ BitVec 32) (_ BitVec 32) V!4181 V!4181 (_ BitVec 32) Int) ListLongMap!1917)

(assert (=> b!160687 (= res!76122 (not (contains!1010 (getCurrentListMap!638 (_keys!5054 thiss!1248) (_values!3236 thiss!1248) (mask!7827 thiss!1248) (extraKeys!2994 thiss!1248) (zeroValue!3096 thiss!1248) (minValue!3096 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3253 thiss!1248)) key!828)))))

(declare-fun b!160688 () Bool)

(declare-fun e!105037 () Bool)

(assert (=> b!160688 (= e!105037 tp_is_empty!3401)))

(declare-fun mapIsEmpty!5789 () Bool)

(declare-fun mapRes!5789 () Bool)

(assert (=> mapIsEmpty!5789 mapRes!5789))

(declare-fun e!105042 () Bool)

(declare-fun e!105039 () Bool)

(declare-fun array_inv!1779 (array!5881) Bool)

(declare-fun array_inv!1780 (array!5883) Bool)

(assert (=> b!160689 (= e!105039 (and tp!13367 tp_is_empty!3401 (array_inv!1779 (_keys!5054 thiss!1248)) (array_inv!1780 (_values!3236 thiss!1248)) e!105042))))

(declare-fun b!160690 () Bool)

(declare-fun res!76121 () Bool)

(assert (=> b!160690 (=> (not res!76121) (not e!105040))))

(assert (=> b!160690 (= res!76121 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160691 () Bool)

(declare-fun res!76125 () Bool)

(assert (=> b!160691 (=> (not res!76125) (not e!105040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160691 (= res!76125 (validMask!0 (mask!7827 thiss!1248)))))

(declare-fun res!76123 () Bool)

(assert (=> start!16138 (=> (not res!76123) (not e!105040))))

(declare-fun valid!751 (LongMapFixedSize!1622) Bool)

(assert (=> start!16138 (= res!76123 (valid!751 thiss!1248))))

(assert (=> start!16138 e!105040))

(assert (=> start!16138 e!105039))

(assert (=> start!16138 true))

(declare-fun b!160686 () Bool)

(assert (=> b!160686 (= e!105042 (and e!105038 mapRes!5789))))

(declare-fun condMapEmpty!5789 () Bool)

(declare-fun mapDefault!5789 () ValueCell!1357)

