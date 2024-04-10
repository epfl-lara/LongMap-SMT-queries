; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18042 () Bool)

(assert start!18042)

(declare-fun b!179678 () Bool)

(declare-fun b_free!4433 () Bool)

(declare-fun b_next!4433 () Bool)

(assert (=> b!179678 (= b_free!4433 (not b_next!4433))))

(declare-fun tp!16027 () Bool)

(declare-fun b_and!10965 () Bool)

(assert (=> b!179678 (= tp!16027 b_and!10965)))

(declare-fun b!179673 () Bool)

(declare-fun res!85114 () Bool)

(declare-fun e!118345 () Bool)

(assert (=> b!179673 (=> (not res!85114) (not e!118345))))

(declare-datatypes ((V!5253 0))(
  ( (V!5254 (val!2147 Int)) )
))
(declare-datatypes ((ValueCell!1759 0))(
  ( (ValueCellFull!1759 (v!4035 V!5253)) (EmptyCell!1759) )
))
(declare-datatypes ((array!7577 0))(
  ( (array!7578 (arr!3589 (Array (_ BitVec 32) (_ BitVec 64))) (size!3897 (_ BitVec 32))) )
))
(declare-datatypes ((array!7579 0))(
  ( (array!7580 (arr!3590 (Array (_ BitVec 32) ValueCell!1759)) (size!3898 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2426 0))(
  ( (LongMapFixedSize!2427 (defaultEntry!3688 Int) (mask!8674 (_ BitVec 32)) (extraKeys!3425 (_ BitVec 32)) (zeroValue!3529 V!5253) (minValue!3529 V!5253) (_size!1262 (_ BitVec 32)) (_keys!5577 array!7577) (_values!3671 array!7579) (_vacant!1262 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2426)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179673 (= res!85114 (validMask!0 (mask!8674 thiss!1248)))))

(declare-fun b!179674 () Bool)

(declare-fun e!118344 () Bool)

(declare-fun e!118343 () Bool)

(declare-fun mapRes!7198 () Bool)

(assert (=> b!179674 (= e!118344 (and e!118343 mapRes!7198))))

(declare-fun condMapEmpty!7198 () Bool)

(declare-fun mapDefault!7198 () ValueCell!1759)

