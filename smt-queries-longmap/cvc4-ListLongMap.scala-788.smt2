; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18776 () Bool)

(assert start!18776)

(declare-fun b!185577 () Bool)

(declare-fun b_free!4571 () Bool)

(declare-fun b_next!4571 () Bool)

(assert (=> b!185577 (= b_free!4571 (not b_next!4571))))

(declare-fun tp!16508 () Bool)

(declare-fun b_and!11171 () Bool)

(assert (=> b!185577 (= tp!16508 b_and!11171)))

(declare-fun b!185568 () Bool)

(declare-fun res!87794 () Bool)

(declare-fun e!122110 () Bool)

(assert (=> b!185568 (=> (not res!87794) (not e!122110))))

(declare-datatypes ((V!5437 0))(
  ( (V!5438 (val!2216 Int)) )
))
(declare-datatypes ((ValueCell!1828 0))(
  ( (ValueCellFull!1828 (v!4126 V!5437)) (EmptyCell!1828) )
))
(declare-datatypes ((array!7893 0))(
  ( (array!7894 (arr!3727 (Array (_ BitVec 32) (_ BitVec 64))) (size!4043 (_ BitVec 32))) )
))
(declare-datatypes ((array!7895 0))(
  ( (array!7896 (arr!3728 (Array (_ BitVec 32) ValueCell!1828)) (size!4044 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2564 0))(
  ( (LongMapFixedSize!2565 (defaultEntry!3783 Int) (mask!8891 (_ BitVec 32)) (extraKeys!3520 (_ BitVec 32)) (zeroValue!3624 V!5437) (minValue!3624 V!5437) (_size!1331 (_ BitVec 32)) (_keys!5722 array!7893) (_values!3766 array!7895) (_vacant!1331 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2564)

(assert (=> b!185568 (= res!87794 (and (= (size!4044 (_values!3766 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8891 thiss!1248))) (= (size!4043 (_keys!5722 thiss!1248)) (size!4044 (_values!3766 thiss!1248))) (bvsge (mask!8891 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3520 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3520 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!87790 () Bool)

(declare-fun e!122107 () Bool)

(assert (=> start!18776 (=> (not res!87790) (not e!122107))))

(declare-fun valid!1058 (LongMapFixedSize!2564) Bool)

(assert (=> start!18776 (= res!87790 (valid!1058 thiss!1248))))

(assert (=> start!18776 e!122107))

(declare-fun e!122106 () Bool)

(assert (=> start!18776 e!122106))

(assert (=> start!18776 true))

(declare-fun mapIsEmpty!7473 () Bool)

(declare-fun mapRes!7473 () Bool)

(assert (=> mapIsEmpty!7473 mapRes!7473))

(declare-fun b!185569 () Bool)

(declare-fun e!122109 () Bool)

(declare-fun tp_is_empty!4343 () Bool)

(assert (=> b!185569 (= e!122109 tp_is_empty!4343)))

(declare-fun b!185570 () Bool)

(declare-fun e!122108 () Bool)

(assert (=> b!185570 (= e!122108 (and e!122109 mapRes!7473))))

(declare-fun condMapEmpty!7473 () Bool)

(declare-fun mapDefault!7473 () ValueCell!1828)

