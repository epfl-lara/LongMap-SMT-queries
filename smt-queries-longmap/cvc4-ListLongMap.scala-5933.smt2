; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77374 () Bool)

(assert start!77374)

(declare-fun mapIsEmpty!29341 () Bool)

(declare-fun mapRes!29341 () Bool)

(assert (=> mapIsEmpty!29341 mapRes!29341))

(declare-datatypes ((V!29539 0))(
  ( (V!29540 (val!9266 Int)) )
))
(declare-datatypes ((ValueCell!8734 0))(
  ( (ValueCellFull!8734 (v!11770 V!29539)) (EmptyCell!8734) )
))
(declare-datatypes ((array!52924 0))(
  ( (array!52925 (arr!25427 (Array (_ BitVec 32) ValueCell!8734)) (size!25886 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52924)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun b!902202 () Bool)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52926 0))(
  ( (array!52927 (arr!25428 (Array (_ BitVec 32) (_ BitVec 64))) (size!25887 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52926)

(declare-fun e!505226 () Bool)

(assert (=> b!902202 (= e!505226 (and (= (size!25886 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25887 _keys!1386) (size!25886 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (= (size!25887 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)) (bvsgt #b00000000000000000000000000000000 (size!25887 _keys!1386))))))

(declare-fun b!902203 () Bool)

(declare-fun e!505224 () Bool)

(declare-fun tp_is_empty!18431 () Bool)

(assert (=> b!902203 (= e!505224 tp_is_empty!18431)))

(declare-fun b!902204 () Bool)

(declare-fun e!505225 () Bool)

(assert (=> b!902204 (= e!505225 tp_is_empty!18431)))

(declare-fun b!902205 () Bool)

(declare-fun e!505228 () Bool)

(assert (=> b!902205 (= e!505228 (and e!505224 mapRes!29341))))

(declare-fun condMapEmpty!29341 () Bool)

(declare-fun mapDefault!29341 () ValueCell!8734)

