; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82888 () Bool)

(assert start!82888)

(declare-fun b_free!19015 () Bool)

(declare-fun b_next!19015 () Bool)

(assert (=> start!82888 (= b_free!19015 (not b_next!19015))))

(declare-fun tp!66174 () Bool)

(declare-fun b_and!30503 () Bool)

(assert (=> start!82888 (= tp!66174 b_and!30503)))

(declare-fun b!967086 () Bool)

(declare-fun res!647356 () Bool)

(declare-fun e!545123 () Bool)

(assert (=> b!967086 (=> (not res!647356) (not e!545123))))

(declare-datatypes ((array!59721 0))(
  ( (array!59722 (arr!28729 (Array (_ BitVec 32) (_ BitVec 64))) (size!29208 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59721)

(declare-datatypes ((List!19945 0))(
  ( (Nil!19942) (Cons!19941 (h!21103 (_ BitVec 64)) (t!28308 List!19945)) )
))
(declare-fun arrayNoDuplicates!0 (array!59721 (_ BitVec 32) List!19945) Bool)

(assert (=> b!967086 (= res!647356 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19942))))

(declare-fun b!967088 () Bool)

(declare-fun e!545125 () Bool)

(declare-fun tp_is_empty!21823 () Bool)

(assert (=> b!967088 (= e!545125 tp_is_empty!21823)))

(declare-fun b!967089 () Bool)

(declare-fun res!647358 () Bool)

(assert (=> b!967089 (=> (not res!647358) (not e!545123))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967089 (= res!647358 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967090 () Bool)

(declare-fun res!647355 () Bool)

(assert (=> b!967090 (=> (not res!647355) (not e!545123))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-datatypes ((V!34081 0))(
  ( (V!34082 (val!10962 Int)) )
))
(declare-datatypes ((ValueCell!10430 0))(
  ( (ValueCellFull!10430 (v!13520 V!34081)) (EmptyCell!10430) )
))
(declare-datatypes ((array!59723 0))(
  ( (array!59724 (arr!28730 (Array (_ BitVec 32) ValueCell!10430)) (size!29209 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59723)

(assert (=> b!967090 (= res!647355 (and (= (size!29209 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29208 _keys!1686) (size!29209 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967091 () Bool)

(declare-fun e!545124 () Bool)

(declare-fun e!545122 () Bool)

(declare-fun mapRes!34729 () Bool)

(assert (=> b!967091 (= e!545124 (and e!545122 mapRes!34729))))

(declare-fun condMapEmpty!34729 () Bool)

(declare-fun mapDefault!34729 () ValueCell!10430)

