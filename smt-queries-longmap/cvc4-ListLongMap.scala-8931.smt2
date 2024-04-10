; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108304 () Bool)

(assert start!108304)

(declare-fun b!1278478 () Bool)

(declare-fun e!730309 () Bool)

(declare-fun e!730307 () Bool)

(assert (=> b!1278478 (= e!730309 e!730307)))

(declare-fun res!849369 () Bool)

(assert (=> b!1278478 (=> res!849369 e!730307)))

(declare-datatypes ((List!28741 0))(
  ( (Nil!28738) (Cons!28737 (h!29946 (_ BitVec 64)) (t!42281 List!28741)) )
))
(declare-fun contains!7738 (List!28741 (_ BitVec 64)) Bool)

(assert (=> b!1278478 (= res!849369 (contains!7738 Nil!28738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!51803 () Bool)

(declare-fun mapRes!51803 () Bool)

(assert (=> mapIsEmpty!51803 mapRes!51803))

(declare-fun res!849364 () Bool)

(assert (=> start!108304 (=> (not res!849364) (not e!730309))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108304 (= res!849364 (validMask!0 mask!2175))))

(assert (=> start!108304 e!730309))

(assert (=> start!108304 true))

(declare-datatypes ((V!49773 0))(
  ( (V!49774 (val!16826 Int)) )
))
(declare-datatypes ((ValueCell!15853 0))(
  ( (ValueCellFull!15853 (v!19425 V!49773)) (EmptyCell!15853) )
))
(declare-datatypes ((array!84100 0))(
  ( (array!84101 (arr!40555 (Array (_ BitVec 32) ValueCell!15853)) (size!41105 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84100)

(declare-fun e!730308 () Bool)

(declare-fun array_inv!30803 (array!84100) Bool)

(assert (=> start!108304 (and (array_inv!30803 _values!1445) e!730308)))

(declare-datatypes ((array!84102 0))(
  ( (array!84103 (arr!40556 (Array (_ BitVec 32) (_ BitVec 64))) (size!41106 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84102)

(declare-fun array_inv!30804 (array!84102) Bool)

(assert (=> start!108304 (array_inv!30804 _keys!1741)))

(declare-fun b!1278479 () Bool)

(declare-fun e!730310 () Bool)

(assert (=> b!1278479 (= e!730308 (and e!730310 mapRes!51803))))

(declare-fun condMapEmpty!51803 () Bool)

(declare-fun mapDefault!51803 () ValueCell!15853)

