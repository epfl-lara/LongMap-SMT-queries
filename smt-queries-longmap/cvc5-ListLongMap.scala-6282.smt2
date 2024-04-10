; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80370 () Bool)

(assert start!80370)

(declare-fun b!943890 () Bool)

(declare-fun b_free!18013 () Bool)

(declare-fun b_next!18013 () Bool)

(assert (=> b!943890 (= b_free!18013 (not b_next!18013))))

(declare-fun tp!62549 () Bool)

(declare-fun b_and!29431 () Bool)

(assert (=> b!943890 (= tp!62549 b_and!29431)))

(declare-fun b!943889 () Bool)

(declare-fun e!530721 () Bool)

(declare-fun e!530724 () Bool)

(declare-fun mapRes!32607 () Bool)

(assert (=> b!943889 (= e!530721 (and e!530724 mapRes!32607))))

(declare-fun condMapEmpty!32607 () Bool)

(declare-datatypes ((V!32327 0))(
  ( (V!32328 (val!10311 Int)) )
))
(declare-datatypes ((ValueCell!9779 0))(
  ( (ValueCellFull!9779 (v!12843 V!32327)) (EmptyCell!9779) )
))
(declare-datatypes ((array!57010 0))(
  ( (array!57011 (arr!27430 (Array (_ BitVec 32) ValueCell!9779)) (size!27896 (_ BitVec 32))) )
))
(declare-datatypes ((array!57012 0))(
  ( (array!57013 (arr!27431 (Array (_ BitVec 32) (_ BitVec 64))) (size!27897 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4708 0))(
  ( (LongMapFixedSize!4709 (defaultEntry!5649 Int) (mask!27287 (_ BitVec 32)) (extraKeys!5381 (_ BitVec 32)) (zeroValue!5485 V!32327) (minValue!5485 V!32327) (_size!2409 (_ BitVec 32)) (_keys!10527 array!57012) (_values!5672 array!57010) (_vacant!2409 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4708)

(declare-fun mapDefault!32607 () ValueCell!9779)

