; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75442 () Bool)

(assert start!75442)

(declare-fun b!888075 () Bool)

(declare-fun b_free!15557 () Bool)

(declare-fun b_next!15557 () Bool)

(assert (=> b!888075 (= b_free!15557 (not b_next!15557))))

(declare-fun tp!54617 () Bool)

(declare-fun b_and!25793 () Bool)

(assert (=> b!888075 (= tp!54617 b_and!25793)))

(declare-fun res!602267 () Bool)

(declare-fun e!494782 () Bool)

(assert (=> start!75442 (=> (not res!602267) (not e!494782))))

(declare-datatypes ((array!51738 0))(
  ( (array!51739 (arr!24881 (Array (_ BitVec 32) (_ BitVec 64))) (size!25321 (_ BitVec 32))) )
))
(declare-datatypes ((V!28811 0))(
  ( (V!28812 (val!8993 Int)) )
))
(declare-datatypes ((ValueCell!8461 0))(
  ( (ValueCellFull!8461 (v!11466 V!28811)) (EmptyCell!8461) )
))
(declare-datatypes ((array!51740 0))(
  ( (array!51741 (arr!24882 (Array (_ BitVec 32) ValueCell!8461)) (size!25322 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3938 0))(
  ( (LongMapFixedSize!3939 (defaultEntry!5160 Int) (mask!25572 (_ BitVec 32)) (extraKeys!4854 (_ BitVec 32)) (zeroValue!4958 V!28811) (minValue!4958 V!28811) (_size!2024 (_ BitVec 32)) (_keys!9837 array!51738) (_values!5145 array!51740) (_vacant!2024 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3938)

(declare-fun valid!1536 (LongMapFixedSize!3938) Bool)

(assert (=> start!75442 (= res!602267 (valid!1536 thiss!1181))))

(assert (=> start!75442 e!494782))

(declare-fun e!494781 () Bool)

(assert (=> start!75442 e!494781))

(assert (=> start!75442 true))

(declare-fun b!888074 () Bool)

(declare-fun e!494778 () Bool)

(declare-fun e!494779 () Bool)

(declare-fun mapRes!28360 () Bool)

(assert (=> b!888074 (= e!494778 (and e!494779 mapRes!28360))))

(declare-fun condMapEmpty!28360 () Bool)

(declare-fun mapDefault!28360 () ValueCell!8461)

