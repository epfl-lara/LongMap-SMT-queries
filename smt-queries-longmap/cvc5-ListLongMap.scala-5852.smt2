; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75642 () Bool)

(assert start!75642)

(declare-fun b!889285 () Bool)

(declare-fun b_free!15613 () Bool)

(declare-fun b_next!15613 () Bool)

(assert (=> b!889285 (= b_free!15613 (not b_next!15613))))

(declare-fun tp!54807 () Bool)

(declare-fun b_and!25853 () Bool)

(assert (=> b!889285 (= tp!54807 b_and!25853)))

(declare-fun b!889282 () Bool)

(declare-fun e!495668 () Bool)

(declare-fun e!495669 () Bool)

(declare-fun mapRes!28466 () Bool)

(assert (=> b!889282 (= e!495668 (and e!495669 mapRes!28466))))

(declare-fun condMapEmpty!28466 () Bool)

(declare-datatypes ((array!51862 0))(
  ( (array!51863 (arr!24937 (Array (_ BitVec 32) (_ BitVec 64))) (size!25381 (_ BitVec 32))) )
))
(declare-datatypes ((V!28887 0))(
  ( (V!28888 (val!9021 Int)) )
))
(declare-datatypes ((ValueCell!8489 0))(
  ( (ValueCellFull!8489 (v!11499 V!28887)) (EmptyCell!8489) )
))
(declare-datatypes ((array!51864 0))(
  ( (array!51865 (arr!24938 (Array (_ BitVec 32) ValueCell!8489)) (size!25382 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3994 0))(
  ( (LongMapFixedSize!3995 (defaultEntry!5194 Int) (mask!25639 (_ BitVec 32)) (extraKeys!4888 (_ BitVec 32)) (zeroValue!4992 V!28887) (minValue!4992 V!28887) (_size!2052 (_ BitVec 32)) (_keys!9877 array!51862) (_values!5179 array!51864) (_vacant!2052 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3994)

(declare-fun mapDefault!28466 () ValueCell!8489)

