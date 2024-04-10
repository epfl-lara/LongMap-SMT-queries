; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3278 () Bool)

(assert start!3278)

(declare-fun b!20082 () Bool)

(declare-fun b_free!707 () Bool)

(declare-fun b_next!707 () Bool)

(assert (=> b!20082 (= b_free!707 (not b_next!707))))

(declare-fun tp!3345 () Bool)

(declare-fun b_and!1379 () Bool)

(assert (=> b!20082 (= tp!3345 b_and!1379)))

(declare-fun res!13387 () Bool)

(declare-fun e!13096 () Bool)

(assert (=> start!3278 (=> (not res!13387) (not e!13096))))

(declare-datatypes ((V!1119 0))(
  ( (V!1120 (val!512 Int)) )
))
(declare-datatypes ((ValueCell!286 0))(
  ( (ValueCellFull!286 (v!1541 V!1119)) (EmptyCell!286) )
))
(declare-datatypes ((array!1165 0))(
  ( (array!1166 (arr!555 (Array (_ BitVec 32) ValueCell!286)) (size!648 (_ BitVec 32))) )
))
(declare-datatypes ((array!1167 0))(
  ( (array!1168 (arr!556 (Array (_ BitVec 32) (_ BitVec 64))) (size!649 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!158 0))(
  ( (LongMapFixedSize!159 (defaultEntry!1701 Int) (mask!4661 (_ BitVec 32)) (extraKeys!1608 (_ BitVec 32)) (zeroValue!1632 V!1119) (minValue!1632 V!1119) (_size!116 (_ BitVec 32)) (_keys!3126 array!1167) (_values!1694 array!1165) (_vacant!116 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!158 0))(
  ( (Cell!159 (v!1542 LongMapFixedSize!158)) )
))
(declare-datatypes ((LongMap!158 0))(
  ( (LongMap!159 (underlying!90 Cell!158)) )
))
(declare-fun thiss!938 () LongMap!158)

(declare-fun valid!79 (LongMap!158) Bool)

(assert (=> start!3278 (= res!13387 (valid!79 thiss!938))))

(assert (=> start!3278 e!13096))

(declare-fun e!13099 () Bool)

(assert (=> start!3278 e!13099))

(declare-fun b!20077 () Bool)

(declare-fun e!13101 () Bool)

(assert (=> b!20077 (= e!13096 e!13101)))

(declare-fun res!13386 () Bool)

(assert (=> b!20077 (=> (not res!13386) (not e!13101))))

(assert (=> b!20077 (= res!13386 (and (= (bvand (extraKeys!1608 (v!1542 (underlying!90 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1608 (v!1542 (underlying!90 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!5772 () LongMapFixedSize!158)

(declare-fun getNewLongMapFixedSize!19 ((_ BitVec 32) Int) LongMapFixedSize!158)

(declare-fun computeNewMask!15 (LongMap!158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20077 (= lt!5772 (getNewLongMapFixedSize!19 (computeNewMask!15 thiss!938 (mask!4661 (v!1542 (underlying!90 thiss!938))) (_vacant!116 (v!1542 (underlying!90 thiss!938))) (_size!116 (v!1542 (underlying!90 thiss!938)))) (defaultEntry!1701 (v!1542 (underlying!90 thiss!938)))))))

(declare-fun mapIsEmpty!925 () Bool)

(declare-fun mapRes!925 () Bool)

(assert (=> mapIsEmpty!925 mapRes!925))

(declare-fun b!20078 () Bool)

(declare-fun e!13095 () Bool)

(declare-fun e!13103 () Bool)

(assert (=> b!20078 (= e!13095 (and e!13103 mapRes!925))))

(declare-fun condMapEmpty!925 () Bool)

(declare-fun mapDefault!925 () ValueCell!286)

