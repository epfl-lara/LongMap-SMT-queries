; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79892 () Bool)

(assert start!79892)

(declare-fun b!939593 () Bool)

(declare-fun b_free!17789 () Bool)

(declare-fun b_next!17789 () Bool)

(assert (=> b!939593 (= b_free!17789 (not b_next!17789))))

(declare-fun tp!61830 () Bool)

(declare-fun b_and!29201 () Bool)

(assert (=> b!939593 (= tp!61830 b_and!29201)))

(declare-fun b!939590 () Bool)

(declare-fun e!527795 () Bool)

(declare-fun tp_is_empty!20297 () Bool)

(assert (=> b!939590 (= e!527795 tp_is_empty!20297)))

(declare-fun lt!424564 () Bool)

(declare-datatypes ((V!32027 0))(
  ( (V!32028 (val!10199 Int)) )
))
(declare-datatypes ((ValueCell!9667 0))(
  ( (ValueCellFull!9667 (v!12730 V!32027)) (EmptyCell!9667) )
))
(declare-datatypes ((array!56536 0))(
  ( (array!56537 (arr!27206 (Array (_ BitVec 32) ValueCell!9667)) (size!27665 (_ BitVec 32))) )
))
(declare-datatypes ((array!56538 0))(
  ( (array!56539 (arr!27207 (Array (_ BitVec 32) (_ BitVec 64))) (size!27666 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4484 0))(
  ( (LongMapFixedSize!4485 (defaultEntry!5533 Int) (mask!27047 (_ BitVec 32)) (extraKeys!5265 (_ BitVec 32)) (zeroValue!5369 V!32027) (minValue!5369 V!32027) (_size!2297 (_ BitVec 32)) (_keys!10381 array!56538) (_values!5556 array!56536) (_vacant!2297 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4484)

(declare-fun valid!1723 (LongMapFixedSize!4484) Bool)

(assert (=> start!79892 (= lt!424564 (valid!1723 thiss!1141))))

(assert (=> start!79892 false))

(declare-fun e!527797 () Bool)

(assert (=> start!79892 e!527797))

(declare-fun b!939591 () Bool)

(declare-fun e!527799 () Bool)

(declare-fun e!527798 () Bool)

(declare-fun mapRes!32225 () Bool)

(assert (=> b!939591 (= e!527799 (and e!527798 mapRes!32225))))

(declare-fun condMapEmpty!32225 () Bool)

(declare-fun mapDefault!32225 () ValueCell!9667)

