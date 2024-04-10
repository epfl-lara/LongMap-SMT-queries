; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75646 () Bool)

(assert start!75646)

(declare-fun b!889340 () Bool)

(declare-fun b_free!15617 () Bool)

(declare-fun b_next!15617 () Bool)

(assert (=> b!889340 (= b_free!15617 (not b_next!15617))))

(declare-fun tp!54819 () Bool)

(declare-fun b_and!25857 () Bool)

(assert (=> b!889340 (= tp!54819 b_and!25857)))

(declare-fun b!889336 () Bool)

(declare-fun e!495705 () Bool)

(declare-fun e!495707 () Bool)

(declare-fun mapRes!28472 () Bool)

(assert (=> b!889336 (= e!495705 (and e!495707 mapRes!28472))))

(declare-fun condMapEmpty!28472 () Bool)

(declare-datatypes ((array!51870 0))(
  ( (array!51871 (arr!24941 (Array (_ BitVec 32) (_ BitVec 64))) (size!25385 (_ BitVec 32))) )
))
(declare-datatypes ((V!28891 0))(
  ( (V!28892 (val!9023 Int)) )
))
(declare-datatypes ((ValueCell!8491 0))(
  ( (ValueCellFull!8491 (v!11501 V!28891)) (EmptyCell!8491) )
))
(declare-datatypes ((array!51872 0))(
  ( (array!51873 (arr!24942 (Array (_ BitVec 32) ValueCell!8491)) (size!25386 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3998 0))(
  ( (LongMapFixedSize!3999 (defaultEntry!5196 Int) (mask!25641 (_ BitVec 32)) (extraKeys!4890 (_ BitVec 32)) (zeroValue!4994 V!28891) (minValue!4994 V!28891) (_size!2054 (_ BitVec 32)) (_keys!9879 array!51870) (_values!5181 array!51872) (_vacant!2054 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3998)

(declare-fun mapDefault!28472 () ValueCell!8491)

