; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89498 () Bool)

(assert start!89498)

(declare-fun b!1026407 () Bool)

(declare-fun b_free!20497 () Bool)

(declare-fun b_next!20497 () Bool)

(assert (=> b!1026407 (= b_free!20497 (not b_next!20497))))

(declare-fun tp!72536 () Bool)

(declare-fun b_and!32743 () Bool)

(assert (=> b!1026407 (= tp!72536 b_and!32743)))

(declare-fun mapIsEmpty!37754 () Bool)

(declare-fun mapRes!37754 () Bool)

(assert (=> mapIsEmpty!37754 mapRes!37754))

(declare-fun b!1026402 () Bool)

(declare-fun e!579020 () Bool)

(declare-fun e!579019 () Bool)

(assert (=> b!1026402 (= e!579020 (and e!579019 mapRes!37754))))

(declare-fun condMapEmpty!37754 () Bool)

(declare-datatypes ((V!37163 0))(
  ( (V!37164 (val!12159 Int)) )
))
(declare-datatypes ((ValueCell!11405 0))(
  ( (ValueCellFull!11405 (v!14728 V!37163)) (EmptyCell!11405) )
))
(declare-datatypes ((array!64484 0))(
  ( (array!64485 (arr!31051 (Array (_ BitVec 32) (_ BitVec 64))) (size!31564 (_ BitVec 32))) )
))
(declare-datatypes ((array!64486 0))(
  ( (array!64487 (arr!31052 (Array (_ BitVec 32) ValueCell!11405)) (size!31565 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5404 0))(
  ( (LongMapFixedSize!5405 (defaultEntry!6054 Int) (mask!29748 (_ BitVec 32)) (extraKeys!5786 (_ BitVec 32)) (zeroValue!5890 V!37163) (minValue!5890 V!37163) (_size!2757 (_ BitVec 32)) (_keys!11201 array!64484) (_values!6077 array!64486) (_vacant!2757 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5404)

(declare-fun mapDefault!37754 () ValueCell!11405)

