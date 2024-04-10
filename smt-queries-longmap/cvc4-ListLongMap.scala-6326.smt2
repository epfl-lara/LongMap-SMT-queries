; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81410 () Bool)

(assert start!81410)

(declare-fun b!951815 () Bool)

(declare-fun b_free!18281 () Bool)

(declare-fun b_next!18281 () Bool)

(assert (=> b!951815 (= b_free!18281 (not b_next!18281))))

(declare-fun tp!63458 () Bool)

(declare-fun b_and!29753 () Bool)

(assert (=> b!951815 (= tp!63458 b_and!29753)))

(declare-fun b!951812 () Bool)

(declare-fun e!536008 () Bool)

(declare-fun e!536006 () Bool)

(declare-fun mapRes!33114 () Bool)

(assert (=> b!951812 (= e!536008 (and e!536006 mapRes!33114))))

(declare-fun condMapEmpty!33114 () Bool)

(declare-datatypes ((V!32683 0))(
  ( (V!32684 (val!10445 Int)) )
))
(declare-datatypes ((ValueCell!9913 0))(
  ( (ValueCellFull!9913 (v!12994 V!32683)) (EmptyCell!9913) )
))
(declare-datatypes ((array!57608 0))(
  ( (array!57609 (arr!27698 (Array (_ BitVec 32) ValueCell!9913)) (size!28176 (_ BitVec 32))) )
))
(declare-datatypes ((array!57610 0))(
  ( (array!57611 (arr!27699 (Array (_ BitVec 32) (_ BitVec 64))) (size!28177 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4976 0))(
  ( (LongMapFixedSize!4977 (defaultEntry!5813 Int) (mask!27644 (_ BitVec 32)) (extraKeys!5545 (_ BitVec 32)) (zeroValue!5649 V!32683) (minValue!5649 V!32683) (_size!2543 (_ BitVec 32)) (_keys!10760 array!57610) (_values!5836 array!57608) (_vacant!2543 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4976)

(declare-fun mapDefault!33114 () ValueCell!9913)

