; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75684 () Bool)

(assert start!75684)

(declare-fun b!889852 () Bool)

(declare-fun b_free!15655 () Bool)

(declare-fun b_next!15655 () Bool)

(assert (=> b!889852 (= b_free!15655 (not b_next!15655))))

(declare-fun tp!54934 () Bool)

(declare-fun b_and!25895 () Bool)

(assert (=> b!889852 (= tp!54934 b_and!25895)))

(declare-fun b!889849 () Bool)

(declare-fun res!603012 () Bool)

(declare-fun e!496109 () Bool)

(assert (=> b!889849 (=> (not res!603012) (not e!496109))))

(declare-datatypes ((array!51946 0))(
  ( (array!51947 (arr!24979 (Array (_ BitVec 32) (_ BitVec 64))) (size!25423 (_ BitVec 32))) )
))
(declare-datatypes ((V!28943 0))(
  ( (V!28944 (val!9042 Int)) )
))
(declare-datatypes ((ValueCell!8510 0))(
  ( (ValueCellFull!8510 (v!11520 V!28943)) (EmptyCell!8510) )
))
(declare-datatypes ((array!51948 0))(
  ( (array!51949 (arr!24980 (Array (_ BitVec 32) ValueCell!8510)) (size!25424 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4036 0))(
  ( (LongMapFixedSize!4037 (defaultEntry!5215 Int) (mask!25674 (_ BitVec 32)) (extraKeys!4909 (_ BitVec 32)) (zeroValue!5013 V!28943) (minValue!5013 V!28943) (_size!2073 (_ BitVec 32)) (_keys!9898 array!51946) (_values!5200 array!51948) (_vacant!2073 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4036)

(assert (=> b!889849 (= res!603012 (and (= (size!25424 (_values!5200 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25674 thiss!1181))) (= (size!25423 (_keys!9898 thiss!1181)) (size!25424 (_values!5200 thiss!1181))) (bvsge (mask!25674 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4909 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4909 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889850 () Bool)

(declare-fun res!603013 () Bool)

(assert (=> b!889850 (=> (not res!603013) (not e!496109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51946 (_ BitVec 32)) Bool)

(assert (=> b!889850 (= res!603013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9898 thiss!1181) (mask!25674 thiss!1181)))))

(declare-fun b!889851 () Bool)

(declare-fun e!496106 () Bool)

(declare-fun e!496104 () Bool)

(declare-fun mapRes!28529 () Bool)

(assert (=> b!889851 (= e!496106 (and e!496104 mapRes!28529))))

(declare-fun condMapEmpty!28529 () Bool)

(declare-fun mapDefault!28529 () ValueCell!8510)

