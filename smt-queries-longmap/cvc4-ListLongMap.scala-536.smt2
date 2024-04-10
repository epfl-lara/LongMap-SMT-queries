; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13524 () Bool)

(assert start!13524)

(declare-fun b!124054 () Bool)

(declare-fun b_free!2829 () Bool)

(declare-fun b_next!2829 () Bool)

(assert (=> b!124054 (= b_free!2829 (not b_next!2829))))

(declare-fun tp!10881 () Bool)

(declare-fun b_and!7623 () Bool)

(assert (=> b!124054 (= tp!10881 b_and!7623)))

(declare-fun b!124051 () Bool)

(declare-fun b_free!2831 () Bool)

(declare-fun b_next!2831 () Bool)

(assert (=> b!124051 (= b_free!2831 (not b_next!2831))))

(declare-fun tp!10882 () Bool)

(declare-fun b_and!7625 () Bool)

(assert (=> b!124051 (= tp!10882 b_and!7625)))

(declare-fun b!124039 () Bool)

(declare-fun e!81100 () Bool)

(declare-fun e!81092 () Bool)

(assert (=> b!124039 (= e!81100 e!81092)))

(declare-fun b!124040 () Bool)

(declare-fun e!81101 () Bool)

(declare-fun e!81105 () Bool)

(declare-fun mapRes!4457 () Bool)

(assert (=> b!124040 (= e!81101 (and e!81105 mapRes!4457))))

(declare-fun condMapEmpty!4457 () Bool)

(declare-datatypes ((V!3421 0))(
  ( (V!3422 (val!1460 Int)) )
))
(declare-datatypes ((array!4675 0))(
  ( (array!4676 (arr!2215 (Array (_ BitVec 32) (_ BitVec 64))) (size!2478 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1072 0))(
  ( (ValueCellFull!1072 (v!3101 V!3421)) (EmptyCell!1072) )
))
(declare-datatypes ((array!4677 0))(
  ( (array!4678 (arr!2216 (Array (_ BitVec 32) ValueCell!1072)) (size!2479 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1052 0))(
  ( (LongMapFixedSize!1053 (defaultEntry!2761 Int) (mask!7004 (_ BitVec 32)) (extraKeys!2546 (_ BitVec 32)) (zeroValue!2626 V!3421) (minValue!2626 V!3421) (_size!575 (_ BitVec 32)) (_keys!4490 array!4675) (_values!2744 array!4677) (_vacant!575 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!846 0))(
  ( (Cell!847 (v!3102 LongMapFixedSize!1052)) )
))
(declare-datatypes ((LongMap!846 0))(
  ( (LongMap!847 (underlying!434 Cell!846)) )
))
(declare-fun thiss!992 () LongMap!846)

(declare-fun mapDefault!4458 () ValueCell!1072)

