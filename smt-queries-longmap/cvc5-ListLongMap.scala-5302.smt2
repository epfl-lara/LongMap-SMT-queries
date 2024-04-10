; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71016 () Bool)

(assert start!71016)

(declare-fun b_free!13219 () Bool)

(declare-fun b_next!13219 () Bool)

(assert (=> start!71016 (= b_free!13219 (not b_next!13219))))

(declare-fun tp!46411 () Bool)

(declare-fun b_and!22123 () Bool)

(assert (=> start!71016 (= tp!46411 b_and!22123)))

(declare-fun b!824668 () Bool)

(declare-fun res!562223 () Bool)

(declare-fun e!458860 () Bool)

(assert (=> b!824668 (=> (not res!562223) (not e!458860))))

(declare-datatypes ((array!46046 0))(
  ( (array!46047 (arr!22070 (Array (_ BitVec 32) (_ BitVec 64))) (size!22491 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46046)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46046 (_ BitVec 32)) Bool)

(assert (=> b!824668 (= res!562223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24013 () Bool)

(declare-fun mapRes!24013 () Bool)

(assert (=> mapIsEmpty!24013 mapRes!24013))

(declare-fun b!824669 () Bool)

(declare-fun e!458857 () Bool)

(declare-fun e!458858 () Bool)

(assert (=> b!824669 (= e!458857 (and e!458858 mapRes!24013))))

(declare-fun condMapEmpty!24013 () Bool)

(declare-datatypes ((V!24907 0))(
  ( (V!24908 (val!7512 Int)) )
))
(declare-datatypes ((ValueCell!7049 0))(
  ( (ValueCellFull!7049 (v!9945 V!24907)) (EmptyCell!7049) )
))
(declare-datatypes ((array!46048 0))(
  ( (array!46049 (arr!22071 (Array (_ BitVec 32) ValueCell!7049)) (size!22492 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46048)

(declare-fun mapDefault!24013 () ValueCell!7049)

