; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41784 () Bool)

(assert start!41784)

(declare-fun b_free!11405 () Bool)

(declare-fun b_next!11405 () Bool)

(assert (=> start!41784 (= b_free!11405 (not b_next!11405))))

(declare-fun tp!40221 () Bool)

(declare-fun b_and!19773 () Bool)

(assert (=> start!41784 (= tp!40221 b_and!19773)))

(declare-fun b!466578 () Bool)

(declare-fun e!272830 () Bool)

(declare-fun e!272831 () Bool)

(declare-fun mapRes!20935 () Bool)

(assert (=> b!466578 (= e!272830 (and e!272831 mapRes!20935))))

(declare-fun condMapEmpty!20935 () Bool)

(declare-datatypes ((V!18215 0))(
  ( (V!18216 (val!6461 Int)) )
))
(declare-datatypes ((ValueCell!6073 0))(
  ( (ValueCellFull!6073 (v!8749 V!18215)) (EmptyCell!6073) )
))
(declare-datatypes ((array!29449 0))(
  ( (array!29450 (arr!14153 (Array (_ BitVec 32) ValueCell!6073)) (size!14505 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29449)

(declare-fun mapDefault!20935 () ValueCell!6073)

