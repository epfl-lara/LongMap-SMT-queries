; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20512 () Bool)

(assert start!20512)

(declare-fun b_free!5171 () Bool)

(declare-fun b_next!5171 () Bool)

(assert (=> start!20512 (= b_free!5171 (not b_next!5171))))

(declare-fun tp!18544 () Bool)

(declare-fun b_and!11917 () Bool)

(assert (=> start!20512 (= tp!18544 b_and!11917)))

(declare-fun b!203715 () Bool)

(declare-fun res!97969 () Bool)

(declare-fun e!133349 () Bool)

(assert (=> b!203715 (=> (not res!97969) (not e!133349))))

(declare-datatypes ((array!9277 0))(
  ( (array!9278 (arr!4389 (Array (_ BitVec 32) (_ BitVec 64))) (size!4714 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9277)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6349 0))(
  ( (V!6350 (val!2558 Int)) )
))
(declare-datatypes ((ValueCell!2170 0))(
  ( (ValueCellFull!2170 (v!4528 V!6349)) (EmptyCell!2170) )
))
(declare-datatypes ((array!9279 0))(
  ( (array!9280 (arr!4390 (Array (_ BitVec 32) ValueCell!2170)) (size!4715 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9279)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203715 (= res!97969 (and (= (size!4715 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4714 _keys!825) (size!4715 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203716 () Bool)

(declare-fun e!133344 () Bool)

(declare-fun e!133343 () Bool)

(declare-fun mapRes!8609 () Bool)

(assert (=> b!203716 (= e!133344 (and e!133343 mapRes!8609))))

(declare-fun condMapEmpty!8609 () Bool)

(declare-fun mapDefault!8609 () ValueCell!2170)

