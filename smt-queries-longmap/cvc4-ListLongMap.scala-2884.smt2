; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41438 () Bool)

(assert start!41438)

(declare-fun b_free!11117 () Bool)

(declare-fun b_next!11117 () Bool)

(assert (=> start!41438 (= b_free!11117 (not b_next!11117))))

(declare-fun tp!39346 () Bool)

(declare-fun b_and!19453 () Bool)

(assert (=> start!41438 (= tp!39346 b_and!19453)))

(declare-fun b!463002 () Bool)

(declare-fun e!270279 () Bool)

(declare-fun e!270275 () Bool)

(declare-fun mapRes!20491 () Bool)

(assert (=> b!463002 (= e!270279 (and e!270275 mapRes!20491))))

(declare-fun condMapEmpty!20491 () Bool)

(declare-datatypes ((V!17831 0))(
  ( (V!17832 (val!6317 Int)) )
))
(declare-datatypes ((ValueCell!5929 0))(
  ( (ValueCellFull!5929 (v!8604 V!17831)) (EmptyCell!5929) )
))
(declare-datatypes ((array!28889 0))(
  ( (array!28890 (arr!13877 (Array (_ BitVec 32) ValueCell!5929)) (size!14229 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28889)

(declare-fun mapDefault!20491 () ValueCell!5929)

