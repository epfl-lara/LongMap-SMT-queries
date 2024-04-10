; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15214 () Bool)

(assert start!15214)

(declare-fun b!146547 () Bool)

(declare-fun b_free!3133 () Bool)

(declare-fun b_next!3133 () Bool)

(assert (=> b!146547 (= b_free!3133 (not b_next!3133))))

(declare-fun tp!11901 () Bool)

(declare-fun b_and!9183 () Bool)

(assert (=> b!146547 (= tp!11901 b_and!9183)))

(declare-fun b!146555 () Bool)

(declare-fun b_free!3135 () Bool)

(declare-fun b_next!3135 () Bool)

(assert (=> b!146555 (= b_free!3135 (not b_next!3135))))

(declare-fun tp!11902 () Bool)

(declare-fun b_and!9185 () Bool)

(assert (=> b!146555 (= tp!11902 b_and!9185)))

(declare-fun b!146542 () Bool)

(declare-fun res!69709 () Bool)

(declare-fun e!95664 () Bool)

(assert (=> b!146542 (=> (not res!69709) (not e!95664))))

(declare-datatypes ((V!3625 0))(
  ( (V!3626 (val!1536 Int)) )
))
(declare-datatypes ((array!5011 0))(
  ( (array!5012 (arr!2367 (Array (_ BitVec 32) (_ BitVec 64))) (size!2643 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1148 0))(
  ( (ValueCellFull!1148 (v!3361 V!3625)) (EmptyCell!1148) )
))
(declare-datatypes ((array!5013 0))(
  ( (array!5014 (arr!2368 (Array (_ BitVec 32) ValueCell!1148)) (size!2644 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1204 0))(
  ( (LongMapFixedSize!1205 (defaultEntry!3018 Int) (mask!7398 (_ BitVec 32)) (extraKeys!2763 (_ BitVec 32)) (zeroValue!2863 V!3625) (minValue!2863 V!3625) (_size!651 (_ BitVec 32)) (_keys!4787 array!5011) (_values!3001 array!5013) (_vacant!651 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1204)

(declare-datatypes ((Cell!986 0))(
  ( (Cell!987 (v!3362 LongMapFixedSize!1204)) )
))
(declare-datatypes ((LongMap!986 0))(
  ( (LongMap!987 (underlying!504 Cell!986)) )
))
(declare-fun thiss!992 () LongMap!986)

(assert (=> b!146542 (= res!69709 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7398 newMap!16)) (_size!651 (v!3362 (underlying!504 thiss!992)))))))

(declare-fun b!146543 () Bool)

(declare-fun e!95658 () Bool)

(declare-fun tp_is_empty!2983 () Bool)

(assert (=> b!146543 (= e!95658 tp_is_empty!2983)))

(declare-fun b!146544 () Bool)

(declare-fun e!95653 () Bool)

(assert (=> b!146544 (= e!95653 tp_is_empty!2983)))

(declare-fun res!69715 () Bool)

(assert (=> start!15214 (=> (not res!69715) (not e!95664))))

(declare-fun valid!587 (LongMap!986) Bool)

(assert (=> start!15214 (= res!69715 (valid!587 thiss!992))))

(assert (=> start!15214 e!95664))

(declare-fun e!95649 () Bool)

(assert (=> start!15214 e!95649))

(assert (=> start!15214 true))

(declare-fun e!95656 () Bool)

(assert (=> start!15214 e!95656))

(declare-fun b!146545 () Bool)

(declare-fun e!95650 () Bool)

(assert (=> b!146545 (= e!95649 e!95650)))

(declare-fun b!146546 () Bool)

(declare-fun e!95655 () Bool)

(declare-fun e!95667 () Bool)

(declare-fun mapRes!5021 () Bool)

(assert (=> b!146546 (= e!95655 (and e!95667 mapRes!5021))))

(declare-fun condMapEmpty!5022 () Bool)

(declare-fun mapDefault!5022 () ValueCell!1148)

