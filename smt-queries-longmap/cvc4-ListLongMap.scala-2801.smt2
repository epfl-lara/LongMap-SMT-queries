; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40698 () Bool)

(assert start!40698)

(declare-fun b_free!10709 () Bool)

(declare-fun b_next!10709 () Bool)

(assert (=> start!40698 (= b_free!10709 (not b_next!10709))))

(declare-fun tp!37946 () Bool)

(declare-fun b_and!18717 () Bool)

(assert (=> start!40698 (= tp!37946 b_and!18717)))

(declare-fun b!450173 () Bool)

(declare-fun res!267904 () Bool)

(declare-fun e!263836 () Bool)

(assert (=> b!450173 (=> (not res!267904) (not e!263836))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450173 (= res!267904 (validMask!0 mask!1025))))

(declare-fun b!450174 () Bool)

(declare-fun res!267903 () Bool)

(assert (=> b!450174 (=> (not res!267903) (not e!263836))))

(declare-datatypes ((array!27901 0))(
  ( (array!27902 (arr!13396 (Array (_ BitVec 32) (_ BitVec 64))) (size!13748 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27901)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27901 (_ BitVec 32)) Bool)

(assert (=> b!450174 (= res!267903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450175 () Bool)

(declare-fun res!267907 () Bool)

(assert (=> b!450175 (=> (not res!267907) (not e!263836))))

(declare-datatypes ((List!8036 0))(
  ( (Nil!8033) (Cons!8032 (h!8888 (_ BitVec 64)) (t!13798 List!8036)) )
))
(declare-fun arrayNoDuplicates!0 (array!27901 (_ BitVec 32) List!8036) Bool)

(assert (=> b!450175 (= res!267907 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8033))))

(declare-fun b!450176 () Bool)

(declare-fun e!263837 () Bool)

(declare-fun e!263838 () Bool)

(declare-fun mapRes!19704 () Bool)

(assert (=> b!450176 (= e!263837 (and e!263838 mapRes!19704))))

(declare-fun condMapEmpty!19704 () Bool)

(declare-datatypes ((V!17167 0))(
  ( (V!17168 (val!6068 Int)) )
))
(declare-datatypes ((ValueCell!5680 0))(
  ( (ValueCellFull!5680 (v!8323 V!17167)) (EmptyCell!5680) )
))
(declare-datatypes ((array!27903 0))(
  ( (array!27904 (arr!13397 (Array (_ BitVec 32) ValueCell!5680)) (size!13749 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27903)

(declare-fun mapDefault!19704 () ValueCell!5680)

