; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16764 () Bool)

(assert start!16764)

(declare-fun b!168658 () Bool)

(declare-fun b_free!4069 () Bool)

(declare-fun b_next!4069 () Bool)

(assert (=> b!168658 (= b_free!4069 (not b_next!4069))))

(declare-fun tp!14808 () Bool)

(declare-fun b_and!10483 () Bool)

(assert (=> b!168658 (= tp!14808 b_and!10483)))

(declare-fun b!168651 () Bool)

(declare-fun e!110899 () Bool)

(declare-fun tp_is_empty!3871 () Bool)

(assert (=> b!168651 (= e!110899 tp_is_empty!3871)))

(declare-fun b!168652 () Bool)

(declare-fun res!80289 () Bool)

(declare-fun e!110902 () Bool)

(assert (=> b!168652 (=> (not res!80289) (not e!110902))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168652 (= res!80289 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168653 () Bool)

(declare-fun e!110901 () Bool)

(declare-fun mapRes!6525 () Bool)

(assert (=> b!168653 (= e!110901 (and e!110899 mapRes!6525))))

(declare-fun condMapEmpty!6525 () Bool)

(declare-datatypes ((V!4809 0))(
  ( (V!4810 (val!1980 Int)) )
))
(declare-datatypes ((ValueCell!1592 0))(
  ( (ValueCellFull!1592 (v!3845 V!4809)) (EmptyCell!1592) )
))
(declare-datatypes ((array!6839 0))(
  ( (array!6840 (arr!3255 (Array (_ BitVec 32) (_ BitVec 64))) (size!3543 (_ BitVec 32))) )
))
(declare-datatypes ((array!6841 0))(
  ( (array!6842 (arr!3256 (Array (_ BitVec 32) ValueCell!1592)) (size!3544 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2092 0))(
  ( (LongMapFixedSize!2093 (defaultEntry!3488 Int) (mask!8257 (_ BitVec 32)) (extraKeys!3229 (_ BitVec 32)) (zeroValue!3331 V!4809) (minValue!3331 V!4809) (_size!1095 (_ BitVec 32)) (_keys!5313 array!6839) (_values!3471 array!6841) (_vacant!1095 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2092)

(declare-fun mapDefault!6525 () ValueCell!1592)

