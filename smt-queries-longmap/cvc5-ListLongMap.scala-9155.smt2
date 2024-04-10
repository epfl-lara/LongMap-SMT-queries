; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109810 () Bool)

(assert start!109810)

(declare-fun b_free!29203 () Bool)

(declare-fun b_next!29203 () Bool)

(assert (=> start!109810 (= b_free!29203 (not b_next!29203))))

(declare-fun tp!102743 () Bool)

(declare-fun b_and!47317 () Bool)

(assert (=> start!109810 (= tp!102743 b_and!47317)))

(declare-fun b!1300908 () Bool)

(declare-fun res!864412 () Bool)

(declare-fun e!742039 () Bool)

(assert (=> b!1300908 (=> (not res!864412) (not e!742039))))

(declare-datatypes ((array!86698 0))(
  ( (array!86699 (arr!41845 (Array (_ BitVec 32) (_ BitVec 64))) (size!42395 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86698)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86698 (_ BitVec 32)) Bool)

(assert (=> b!1300908 (= res!864412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300909 () Bool)

(declare-fun e!742035 () Bool)

(declare-fun e!742040 () Bool)

(declare-fun mapRes!53840 () Bool)

(assert (=> b!1300909 (= e!742035 (and e!742040 mapRes!53840))))

(declare-fun condMapEmpty!53840 () Bool)

(declare-datatypes ((V!51561 0))(
  ( (V!51562 (val!17496 Int)) )
))
(declare-datatypes ((ValueCell!16523 0))(
  ( (ValueCellFull!16523 (v!20104 V!51561)) (EmptyCell!16523) )
))
(declare-datatypes ((array!86700 0))(
  ( (array!86701 (arr!41846 (Array (_ BitVec 32) ValueCell!16523)) (size!42396 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86700)

(declare-fun mapDefault!53840 () ValueCell!16523)

