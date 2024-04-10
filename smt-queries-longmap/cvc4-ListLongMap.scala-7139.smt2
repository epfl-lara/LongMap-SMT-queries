; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90702 () Bool)

(assert start!90702)

(declare-fun b!1037231 () Bool)

(declare-fun b_free!20891 () Bool)

(declare-fun b_next!20891 () Bool)

(assert (=> b!1037231 (= b_free!20891 (not b_next!20891))))

(declare-fun tp!73815 () Bool)

(declare-fun b_and!33423 () Bool)

(assert (=> b!1037231 (= tp!73815 b_and!33423)))

(declare-fun b!1037228 () Bool)

(declare-fun e!586688 () Bool)

(declare-fun e!586694 () Bool)

(declare-fun mapRes!38442 () Bool)

(assert (=> b!1037228 (= e!586688 (and e!586694 mapRes!38442))))

(declare-fun condMapEmpty!38442 () Bool)

(declare-datatypes ((V!37687 0))(
  ( (V!37688 (val!12356 Int)) )
))
(declare-datatypes ((ValueCell!11602 0))(
  ( (ValueCellFull!11602 (v!14939 V!37687)) (EmptyCell!11602) )
))
(declare-datatypes ((array!65324 0))(
  ( (array!65325 (arr!31445 (Array (_ BitVec 32) (_ BitVec 64))) (size!31975 (_ BitVec 32))) )
))
(declare-datatypes ((array!65326 0))(
  ( (array!65327 (arr!31446 (Array (_ BitVec 32) ValueCell!11602)) (size!31976 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5798 0))(
  ( (LongMapFixedSize!5799 (defaultEntry!6281 Int) (mask!30195 (_ BitVec 32)) (extraKeys!6009 (_ BitVec 32)) (zeroValue!6115 V!37687) (minValue!6115 V!37687) (_size!2954 (_ BitVec 32)) (_keys!11476 array!65324) (_values!6304 array!65326) (_vacant!2954 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5798)

(declare-fun mapDefault!38442 () ValueCell!11602)

