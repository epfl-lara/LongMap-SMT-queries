; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75744 () Bool)

(assert start!75744)

(declare-fun b!890669 () Bool)

(declare-fun b_free!15715 () Bool)

(declare-fun b_next!15715 () Bool)

(assert (=> b!890669 (= b_free!15715 (not b_next!15715))))

(declare-fun tp!55113 () Bool)

(declare-fun b_and!25955 () Bool)

(assert (=> b!890669 (= tp!55113 b_and!25955)))

(declare-fun b!890663 () Bool)

(declare-fun res!603470 () Bool)

(declare-fun e!496810 () Bool)

(assert (=> b!890663 (=> res!603470 e!496810)))

(declare-datatypes ((array!52066 0))(
  ( (array!52067 (arr!25039 (Array (_ BitVec 32) (_ BitVec 64))) (size!25483 (_ BitVec 32))) )
))
(declare-datatypes ((V!29023 0))(
  ( (V!29024 (val!9072 Int)) )
))
(declare-datatypes ((ValueCell!8540 0))(
  ( (ValueCellFull!8540 (v!11550 V!29023)) (EmptyCell!8540) )
))
(declare-datatypes ((array!52068 0))(
  ( (array!52069 (arr!25040 (Array (_ BitVec 32) ValueCell!8540)) (size!25484 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4096 0))(
  ( (LongMapFixedSize!4097 (defaultEntry!5245 Int) (mask!25724 (_ BitVec 32)) (extraKeys!4939 (_ BitVec 32)) (zeroValue!5043 V!29023) (minValue!5043 V!29023) (_size!2103 (_ BitVec 32)) (_keys!9928 array!52066) (_values!5230 array!52068) (_vacant!2103 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4096)

(assert (=> b!890663 (= res!603470 (or (not (= (size!25484 (_values!5230 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25724 thiss!1181)))) (not (= (size!25483 (_keys!9928 thiss!1181)) (size!25484 (_values!5230 thiss!1181)))) (bvslt (mask!25724 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4939 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4939 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun res!603465 () Bool)

(declare-fun e!496814 () Bool)

(assert (=> start!75744 (=> (not res!603465) (not e!496814))))

(declare-fun valid!1590 (LongMapFixedSize!4096) Bool)

(assert (=> start!75744 (= res!603465 (valid!1590 thiss!1181))))

(assert (=> start!75744 e!496814))

(declare-fun e!496816 () Bool)

(assert (=> start!75744 e!496816))

(assert (=> start!75744 true))

(declare-fun mapIsEmpty!28619 () Bool)

(declare-fun mapRes!28619 () Bool)

(assert (=> mapIsEmpty!28619 mapRes!28619))

(declare-fun b!890664 () Bool)

(assert (=> b!890664 (= e!496810 true)))

(declare-fun lt!402381 () Bool)

(declare-datatypes ((List!17724 0))(
  ( (Nil!17721) (Cons!17720 (h!18851 (_ BitVec 64)) (t!25023 List!17724)) )
))
(declare-fun arrayNoDuplicates!0 (array!52066 (_ BitVec 32) List!17724) Bool)

(assert (=> b!890664 (= lt!402381 (arrayNoDuplicates!0 (_keys!9928 thiss!1181) #b00000000000000000000000000000000 Nil!17721))))

(declare-fun b!890665 () Bool)

(declare-fun e!496818 () Bool)

(declare-fun e!496817 () Bool)

(assert (=> b!890665 (= e!496818 (and e!496817 mapRes!28619))))

(declare-fun condMapEmpty!28619 () Bool)

(declare-fun mapDefault!28619 () ValueCell!8540)

