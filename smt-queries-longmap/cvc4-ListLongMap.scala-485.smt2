; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10512 () Bool)

(assert start!10512)

(declare-fun b!82758 () Bool)

(declare-fun b_free!2217 () Bool)

(declare-fun b_next!2217 () Bool)

(assert (=> b!82758 (= b_free!2217 (not b_next!2217))))

(declare-fun tp!8867 () Bool)

(declare-fun b_and!5031 () Bool)

(assert (=> b!82758 (= tp!8867 b_and!5031)))

(declare-fun b!82752 () Bool)

(declare-fun b_free!2219 () Bool)

(declare-fun b_next!2219 () Bool)

(assert (=> b!82752 (= b_free!2219 (not b_next!2219))))

(declare-fun tp!8870 () Bool)

(declare-fun b_and!5033 () Bool)

(assert (=> b!82752 (= tp!8870 b_and!5033)))

(declare-fun b!82743 () Bool)

(declare-fun e!54005 () Bool)

(declare-fun e!54004 () Bool)

(declare-fun mapRes!3362 () Bool)

(assert (=> b!82743 (= e!54005 (and e!54004 mapRes!3362))))

(declare-fun condMapEmpty!3361 () Bool)

(declare-datatypes ((V!3013 0))(
  ( (V!3014 (val!1307 Int)) )
))
(declare-datatypes ((array!4007 0))(
  ( (array!4008 (arr!1909 (Array (_ BitVec 32) (_ BitVec 64))) (size!2152 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!919 0))(
  ( (ValueCellFull!919 (v!2625 V!3013)) (EmptyCell!919) )
))
(declare-datatypes ((array!4009 0))(
  ( (array!4010 (arr!1910 (Array (_ BitVec 32) ValueCell!919)) (size!2153 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!746 0))(
  ( (LongMapFixedSize!747 (defaultEntry!2315 Int) (mask!6331 (_ BitVec 32)) (extraKeys!2158 (_ BitVec 32)) (zeroValue!2209 V!3013) (minValue!2209 V!3013) (_size!422 (_ BitVec 32)) (_keys!3983 array!4007) (_values!2298 array!4009) (_vacant!422 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!548 0))(
  ( (Cell!549 (v!2626 LongMapFixedSize!746)) )
))
(declare-datatypes ((LongMap!548 0))(
  ( (LongMap!549 (underlying!285 Cell!548)) )
))
(declare-fun thiss!992 () LongMap!548)

(declare-fun mapDefault!3361 () ValueCell!919)

