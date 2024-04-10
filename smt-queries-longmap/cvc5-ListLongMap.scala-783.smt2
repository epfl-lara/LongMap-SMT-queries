; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18594 () Bool)

(assert start!18594)

(declare-fun b!184086 () Bool)

(declare-fun b_free!4537 () Bool)

(declare-fun b_next!4537 () Bool)

(assert (=> b!184086 (= b_free!4537 (not b_next!4537))))

(declare-fun tp!16390 () Bool)

(declare-fun b_and!11119 () Bool)

(assert (=> b!184086 (= tp!16390 b_and!11119)))

(declare-fun b!184082 () Bool)

(declare-fun e!121173 () Bool)

(declare-fun tp_is_empty!4309 () Bool)

(assert (=> b!184082 (= e!121173 tp_is_empty!4309)))

(declare-fun res!87105 () Bool)

(declare-fun e!121175 () Bool)

(assert (=> start!18594 (=> (not res!87105) (not e!121175))))

(declare-datatypes ((V!5393 0))(
  ( (V!5394 (val!2199 Int)) )
))
(declare-datatypes ((ValueCell!1811 0))(
  ( (ValueCellFull!1811 (v!4104 V!5393)) (EmptyCell!1811) )
))
(declare-datatypes ((array!7815 0))(
  ( (array!7816 (arr!3693 (Array (_ BitVec 32) (_ BitVec 64))) (size!4007 (_ BitVec 32))) )
))
(declare-datatypes ((array!7817 0))(
  ( (array!7818 (arr!3694 (Array (_ BitVec 32) ValueCell!1811)) (size!4008 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2530 0))(
  ( (LongMapFixedSize!2531 (defaultEntry!3759 Int) (mask!8837 (_ BitVec 32)) (extraKeys!3496 (_ BitVec 32)) (zeroValue!3600 V!5393) (minValue!3600 V!5393) (_size!1314 (_ BitVec 32)) (_keys!5685 array!7815) (_values!3742 array!7817) (_vacant!1314 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2530)

(declare-fun valid!1047 (LongMapFixedSize!2530) Bool)

(assert (=> start!18594 (= res!87105 (valid!1047 thiss!1248))))

(assert (=> start!18594 e!121175))

(declare-fun e!121171 () Bool)

(assert (=> start!18594 e!121171))

(assert (=> start!18594 true))

(declare-fun b!184083 () Bool)

(declare-fun e!121176 () Bool)

(assert (=> b!184083 (= e!121176 (and (= (size!4008 (_values!3742 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8837 thiss!1248))) (= (size!4007 (_keys!5685 thiss!1248)) (size!4008 (_values!3742 thiss!1248))) (bvslt (mask!8837 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184084 () Bool)

(declare-fun res!87102 () Bool)

(assert (=> b!184084 (=> (not res!87102) (not e!121176))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3426 0))(
  ( (tuple2!3427 (_1!1724 (_ BitVec 64)) (_2!1724 V!5393)) )
))
(declare-datatypes ((List!2342 0))(
  ( (Nil!2339) (Cons!2338 (h!2969 tuple2!3426) (t!7214 List!2342)) )
))
(declare-datatypes ((ListLongMap!2343 0))(
  ( (ListLongMap!2344 (toList!1187 List!2342)) )
))
(declare-fun contains!1277 (ListLongMap!2343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!835 (array!7815 array!7817 (_ BitVec 32) (_ BitVec 32) V!5393 V!5393 (_ BitVec 32) Int) ListLongMap!2343)

(assert (=> b!184084 (= res!87102 (not (contains!1277 (getCurrentListMap!835 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)) key!828)))))

(declare-fun b!184085 () Bool)

(assert (=> b!184085 (= e!121175 e!121176)))

(declare-fun res!87103 () Bool)

(assert (=> b!184085 (=> (not res!87103) (not e!121176))))

(declare-datatypes ((SeekEntryResult!624 0))(
  ( (MissingZero!624 (index!4666 (_ BitVec 32))) (Found!624 (index!4667 (_ BitVec 32))) (Intermediate!624 (undefined!1436 Bool) (index!4668 (_ BitVec 32)) (x!20030 (_ BitVec 32))) (Undefined!624) (MissingVacant!624 (index!4669 (_ BitVec 32))) )
))
(declare-fun lt!91031 () SeekEntryResult!624)

(assert (=> b!184085 (= res!87103 (and (not (is-Undefined!624 lt!91031)) (not (is-MissingVacant!624 lt!91031)) (not (is-MissingZero!624 lt!91031)) (is-Found!624 lt!91031)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7815 (_ BitVec 32)) SeekEntryResult!624)

(assert (=> b!184085 (= lt!91031 (seekEntryOrOpen!0 key!828 (_keys!5685 thiss!1248) (mask!8837 thiss!1248)))))

(declare-fun e!121172 () Bool)

(declare-fun array_inv!2389 (array!7815) Bool)

(declare-fun array_inv!2390 (array!7817) Bool)

(assert (=> b!184086 (= e!121171 (and tp!16390 tp_is_empty!4309 (array_inv!2389 (_keys!5685 thiss!1248)) (array_inv!2390 (_values!3742 thiss!1248)) e!121172))))

(declare-fun b!184087 () Bool)

(declare-fun e!121170 () Bool)

(assert (=> b!184087 (= e!121170 tp_is_empty!4309)))

(declare-fun b!184088 () Bool)

(declare-fun res!87106 () Bool)

(assert (=> b!184088 (=> (not res!87106) (not e!121175))))

(assert (=> b!184088 (= res!87106 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184089 () Bool)

(declare-fun res!87104 () Bool)

(assert (=> b!184089 (=> (not res!87104) (not e!121176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184089 (= res!87104 (validMask!0 (mask!8837 thiss!1248)))))

(declare-fun mapIsEmpty!7405 () Bool)

(declare-fun mapRes!7405 () Bool)

(assert (=> mapIsEmpty!7405 mapRes!7405))

(declare-fun b!184090 () Bool)

(assert (=> b!184090 (= e!121172 (and e!121173 mapRes!7405))))

(declare-fun condMapEmpty!7405 () Bool)

(declare-fun mapDefault!7405 () ValueCell!1811)

