; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41688 () Bool)

(assert start!41688)

(declare-fun b_free!11327 () Bool)

(declare-fun b_next!11327 () Bool)

(assert (=> start!41688 (= b_free!11327 (not b_next!11327))))

(declare-fun tp!39984 () Bool)

(declare-fun b_and!19683 () Bool)

(assert (=> start!41688 (= tp!39984 b_and!19683)))

(declare-fun b!465458 () Bool)

(declare-fun e!272018 () Bool)

(declare-fun e!272019 () Bool)

(declare-fun mapRes!20815 () Bool)

(assert (=> b!465458 (= e!272018 (and e!272019 mapRes!20815))))

(declare-fun condMapEmpty!20815 () Bool)

(declare-datatypes ((V!18111 0))(
  ( (V!18112 (val!6422 Int)) )
))
(declare-datatypes ((ValueCell!6034 0))(
  ( (ValueCellFull!6034 (v!8709 V!18111)) (EmptyCell!6034) )
))
(declare-datatypes ((array!29295 0))(
  ( (array!29296 (arr!14077 (Array (_ BitVec 32) ValueCell!6034)) (size!14429 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29295)

(declare-fun mapDefault!20815 () ValueCell!6034)

