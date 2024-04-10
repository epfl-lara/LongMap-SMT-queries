; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40166 () Bool)

(assert start!40166)

(declare-fun b_free!10433 () Bool)

(declare-fun b_next!10433 () Bool)

(assert (=> start!40166 (= b_free!10433 (not b_next!10433))))

(declare-fun tp!36828 () Bool)

(declare-fun b_and!18401 () Bool)

(assert (=> start!40166 (= tp!36828 b_and!18401)))

(declare-fun b!439748 () Bool)

(declare-fun e!259193 () Bool)

(declare-fun e!259191 () Bool)

(declare-fun mapRes!18999 () Bool)

(assert (=> b!439748 (= e!259193 (and e!259191 mapRes!18999))))

(declare-fun condMapEmpty!18999 () Bool)

(declare-datatypes ((V!16551 0))(
  ( (V!16552 (val!5837 Int)) )
))
(declare-datatypes ((ValueCell!5449 0))(
  ( (ValueCellFull!5449 (v!8084 V!16551)) (EmptyCell!5449) )
))
(declare-datatypes ((array!26987 0))(
  ( (array!26988 (arr!12943 (Array (_ BitVec 32) ValueCell!5449)) (size!13295 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26987)

(declare-fun mapDefault!18999 () ValueCell!5449)

