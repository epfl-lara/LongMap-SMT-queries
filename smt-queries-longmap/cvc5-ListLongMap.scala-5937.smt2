; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77426 () Bool)

(assert start!77426)

(declare-fun b!902469 () Bool)

(declare-fun e!505435 () Bool)

(declare-fun tp_is_empty!18451 () Bool)

(assert (=> b!902469 (= e!505435 tp_is_empty!18451)))

(declare-fun b!902470 () Bool)

(declare-fun e!505434 () Bool)

(declare-datatypes ((List!17884 0))(
  ( (Nil!17881) (Cons!17880 (h!19026 (_ BitVec 64)) (t!25267 List!17884)) )
))
(declare-fun contains!4451 (List!17884 (_ BitVec 64)) Bool)

(assert (=> b!902470 (= e!505434 (contains!4451 Nil!17881 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902471 () Bool)

(declare-fun res!609020 () Bool)

(declare-fun e!505438 () Bool)

(assert (=> b!902471 (=> (not res!609020) (not e!505438))))

(declare-datatypes ((V!29567 0))(
  ( (V!29568 (val!9276 Int)) )
))
(declare-datatypes ((ValueCell!8744 0))(
  ( (ValueCellFull!8744 (v!11780 V!29567)) (EmptyCell!8744) )
))
(declare-datatypes ((array!52964 0))(
  ( (array!52965 (arr!25443 (Array (_ BitVec 32) ValueCell!8744)) (size!25902 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52964)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52966 0))(
  ( (array!52967 (arr!25444 (Array (_ BitVec 32) (_ BitVec 64))) (size!25903 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52966)

(assert (=> b!902471 (= res!609020 (and (= (size!25902 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25903 _keys!1386) (size!25902 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902472 () Bool)

(declare-fun e!505436 () Bool)

(declare-fun mapRes!29383 () Bool)

(assert (=> b!902472 (= e!505436 (and e!505435 mapRes!29383))))

(declare-fun condMapEmpty!29383 () Bool)

(declare-fun mapDefault!29383 () ValueCell!8744)

