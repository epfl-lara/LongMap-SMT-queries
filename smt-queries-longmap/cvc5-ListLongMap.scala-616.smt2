; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16030 () Bool)

(assert start!16030)

(declare-fun b!159070 () Bool)

(declare-fun b_free!3505 () Bool)

(declare-fun b_next!3505 () Bool)

(assert (=> b!159070 (= b_free!3505 (not b_next!3505))))

(declare-fun tp!13082 () Bool)

(declare-fun b_and!9919 () Bool)

(assert (=> b!159070 (= tp!13082 b_and!9919)))

(declare-fun e!104153 () Bool)

(declare-fun e!104155 () Bool)

(declare-datatypes ((V!4057 0))(
  ( (V!4058 (val!1698 Int)) )
))
(declare-datatypes ((ValueCell!1310 0))(
  ( (ValueCellFull!1310 (v!3563 V!4057)) (EmptyCell!1310) )
))
(declare-datatypes ((array!5691 0))(
  ( (array!5692 (arr!2691 (Array (_ BitVec 32) (_ BitVec 64))) (size!2975 (_ BitVec 32))) )
))
(declare-datatypes ((array!5693 0))(
  ( (array!5694 (arr!2692 (Array (_ BitVec 32) ValueCell!1310)) (size!2976 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1528 0))(
  ( (LongMapFixedSize!1529 (defaultEntry!3206 Int) (mask!7747 (_ BitVec 32)) (extraKeys!2947 (_ BitVec 32)) (zeroValue!3049 V!4057) (minValue!3049 V!4057) (_size!813 (_ BitVec 32)) (_keys!5005 array!5691) (_values!3189 array!5693) (_vacant!813 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1528)

(declare-fun tp_is_empty!3307 () Bool)

(declare-fun array_inv!1711 (array!5691) Bool)

(declare-fun array_inv!1712 (array!5693) Bool)

(assert (=> b!159070 (= e!104155 (and tp!13082 tp_is_empty!3307 (array_inv!1711 (_keys!5005 thiss!1248)) (array_inv!1712 (_values!3189 thiss!1248)) e!104153))))

(declare-fun res!75116 () Bool)

(declare-fun e!104157 () Bool)

(assert (=> start!16030 (=> (not res!75116) (not e!104157))))

(declare-fun valid!717 (LongMapFixedSize!1528) Bool)

(assert (=> start!16030 (= res!75116 (valid!717 thiss!1248))))

(assert (=> start!16030 e!104157))

(assert (=> start!16030 e!104155))

(assert (=> start!16030 true))

(declare-fun mapNonEmpty!5645 () Bool)

(declare-fun mapRes!5645 () Bool)

(declare-fun tp!13081 () Bool)

(declare-fun e!104152 () Bool)

(assert (=> mapNonEmpty!5645 (= mapRes!5645 (and tp!13081 e!104152))))

(declare-fun mapRest!5645 () (Array (_ BitVec 32) ValueCell!1310))

(declare-fun mapKey!5645 () (_ BitVec 32))

(declare-fun mapValue!5645 () ValueCell!1310)

(assert (=> mapNonEmpty!5645 (= (arr!2692 (_values!3189 thiss!1248)) (store mapRest!5645 mapKey!5645 mapValue!5645))))

(declare-fun b!159071 () Bool)

(assert (=> b!159071 (= e!104152 tp_is_empty!3307)))

(declare-fun b!159072 () Bool)

(declare-fun res!75115 () Bool)

(assert (=> b!159072 (=> (not res!75115) (not e!104157))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!305 0))(
  ( (MissingZero!305 (index!3388 (_ BitVec 32))) (Found!305 (index!3389 (_ BitVec 32))) (Intermediate!305 (undefined!1117 Bool) (index!3390 (_ BitVec 32)) (x!17569 (_ BitVec 32))) (Undefined!305) (MissingVacant!305 (index!3391 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5691 (_ BitVec 32)) SeekEntryResult!305)

(assert (=> b!159072 (= res!75115 (is-Undefined!305 (seekEntryOrOpen!0 key!828 (_keys!5005 thiss!1248) (mask!7747 thiss!1248))))))

(declare-fun b!159073 () Bool)

(declare-fun res!75112 () Bool)

(assert (=> b!159073 (=> (not res!75112) (not e!104157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5691 (_ BitVec 32)) Bool)

(assert (=> b!159073 (= res!75112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5005 thiss!1248) (mask!7747 thiss!1248)))))

(declare-fun b!159074 () Bool)

(declare-fun res!75114 () Bool)

(assert (=> b!159074 (=> (not res!75114) (not e!104157))))

(declare-datatypes ((List!1895 0))(
  ( (Nil!1892) (Cons!1891 (h!2504 (_ BitVec 64)) (t!6697 List!1895)) )
))
(declare-fun arrayNoDuplicates!0 (array!5691 (_ BitVec 32) List!1895) Bool)

(assert (=> b!159074 (= res!75114 (arrayNoDuplicates!0 (_keys!5005 thiss!1248) #b00000000000000000000000000000000 Nil!1892))))

(declare-fun b!159075 () Bool)

(declare-fun e!104154 () Bool)

(assert (=> b!159075 (= e!104153 (and e!104154 mapRes!5645))))

(declare-fun condMapEmpty!5645 () Bool)

(declare-fun mapDefault!5645 () ValueCell!1310)

