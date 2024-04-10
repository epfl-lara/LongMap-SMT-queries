; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91580 () Bool)

(assert start!91580)

(declare-fun b!1042865 () Bool)

(declare-fun b_free!21073 () Bool)

(declare-fun b_next!21073 () Bool)

(assert (=> b!1042865 (= b_free!21073 (not b_next!21073))))

(declare-fun tp!74450 () Bool)

(declare-fun b_and!33605 () Bool)

(assert (=> b!1042865 (= tp!74450 b_and!33605)))

(declare-fun res!694828 () Bool)

(declare-fun e!590798 () Bool)

(assert (=> start!91580 (=> (not res!694828) (not e!590798))))

(declare-datatypes ((V!37931 0))(
  ( (V!37932 (val!12447 Int)) )
))
(declare-datatypes ((ValueCell!11693 0))(
  ( (ValueCellFull!11693 (v!15038 V!37931)) (EmptyCell!11693) )
))
(declare-datatypes ((array!65744 0))(
  ( (array!65745 (arr!31627 (Array (_ BitVec 32) (_ BitVec 64))) (size!32162 (_ BitVec 32))) )
))
(declare-datatypes ((array!65746 0))(
  ( (array!65747 (arr!31628 (Array (_ BitVec 32) ValueCell!11693)) (size!32163 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5980 0))(
  ( (LongMapFixedSize!5981 (defaultEntry!6372 Int) (mask!30447 (_ BitVec 32)) (extraKeys!6100 (_ BitVec 32)) (zeroValue!6206 V!37931) (minValue!6206 V!37931) (_size!3045 (_ BitVec 32)) (_keys!11626 array!65744) (_values!6395 array!65746) (_vacant!3045 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5980)

(declare-fun valid!2245 (LongMapFixedSize!5980) Bool)

(assert (=> start!91580 (= res!694828 (valid!2245 thiss!1427))))

(assert (=> start!91580 e!590798))

(declare-fun e!590794 () Bool)

(assert (=> start!91580 e!590794))

(assert (=> start!91580 true))

(declare-fun b!1042854 () Bool)

(declare-fun res!694822 () Bool)

(declare-fun e!590795 () Bool)

(assert (=> b!1042854 (=> res!694822 e!590795)))

(assert (=> b!1042854 (= res!694822 (or (not (= (size!32163 (_values!6395 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30447 thiss!1427)))) (not (= (size!32162 (_keys!11626 thiss!1427)) (size!32163 (_values!6395 thiss!1427)))) (bvslt (mask!30447 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6100 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6100 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1042855 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042855 (= e!590795 (validKeyInArray!0 key!909))))

(declare-fun b!1042856 () Bool)

(declare-fun e!590793 () Bool)

(declare-fun e!590796 () Bool)

(declare-fun mapRes!38804 () Bool)

(assert (=> b!1042856 (= e!590793 (and e!590796 mapRes!38804))))

(declare-fun condMapEmpty!38804 () Bool)

(declare-fun mapDefault!38804 () ValueCell!11693)

