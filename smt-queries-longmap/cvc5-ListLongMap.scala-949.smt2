; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20790 () Bool)

(assert start!20790)

(declare-fun b_free!5443 () Bool)

(declare-fun b_next!5443 () Bool)

(assert (=> start!20790 (= b_free!5443 (not b_next!5443))))

(declare-fun tp!19369 () Bool)

(declare-fun b_and!12189 () Bool)

(assert (=> start!20790 (= tp!19369 b_and!12189)))

(declare-fun b!208310 () Bool)

(declare-fun e!135881 () Bool)

(declare-fun tp_is_empty!5305 () Bool)

(assert (=> b!208310 (= e!135881 tp_is_empty!5305)))

(declare-fun b!208311 () Bool)

(declare-fun e!135883 () Bool)

(declare-fun e!135884 () Bool)

(declare-fun mapRes!9026 () Bool)

(assert (=> b!208311 (= e!135883 (and e!135884 mapRes!9026))))

(declare-fun condMapEmpty!9026 () Bool)

(declare-datatypes ((V!6721 0))(
  ( (V!6722 (val!2697 Int)) )
))
(declare-datatypes ((ValueCell!2309 0))(
  ( (ValueCellFull!2309 (v!4667 V!6721)) (EmptyCell!2309) )
))
(declare-datatypes ((array!9815 0))(
  ( (array!9816 (arr!4658 (Array (_ BitVec 32) ValueCell!2309)) (size!4983 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9815)

(declare-fun mapDefault!9026 () ValueCell!2309)

