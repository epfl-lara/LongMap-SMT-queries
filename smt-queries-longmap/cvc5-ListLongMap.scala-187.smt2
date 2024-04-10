; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3720 () Bool)

(assert start!3720)

(declare-fun res!15447 () Bool)

(declare-fun e!16859 () Bool)

(assert (=> start!3720 (=> (not res!15447) (not e!16859))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3720 (= res!15447 (validMask!0 mask!2294))))

(assert (=> start!3720 e!16859))

(assert (=> start!3720 true))

(declare-datatypes ((V!1243 0))(
  ( (V!1244 (val!558 Int)) )
))
(declare-datatypes ((ValueCell!332 0))(
  ( (ValueCellFull!332 (v!1643 V!1243)) (EmptyCell!332) )
))
(declare-datatypes ((array!1369 0))(
  ( (array!1370 (arr!644 (Array (_ BitVec 32) ValueCell!332)) (size!745 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1369)

(declare-fun e!16856 () Bool)

(declare-fun array_inv!433 (array!1369) Bool)

(assert (=> start!3720 (and (array_inv!433 _values!1501) e!16856)))

(declare-datatypes ((array!1371 0))(
  ( (array!1372 (arr!645 (Array (_ BitVec 32) (_ BitVec 64))) (size!746 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1371)

(declare-fun array_inv!434 (array!1371) Bool)

(assert (=> start!3720 (array_inv!434 _keys!1833)))

(declare-fun b!25978 () Bool)

(declare-datatypes ((List!575 0))(
  ( (Nil!572) (Cons!571 (h!1138 (_ BitVec 64)) (t!3262 List!575)) )
))
(declare-fun noDuplicate!10 (List!575) Bool)

(assert (=> b!25978 (= e!16859 (not (noDuplicate!10 Nil!572)))))

(declare-fun b!25979 () Bool)

(declare-fun e!16857 () Bool)

(declare-fun tp_is_empty!1063 () Bool)

(assert (=> b!25979 (= e!16857 tp_is_empty!1063)))

(declare-fun b!25980 () Bool)

(declare-fun mapRes!1105 () Bool)

(assert (=> b!25980 (= e!16856 (and e!16857 mapRes!1105))))

(declare-fun condMapEmpty!1105 () Bool)

(declare-fun mapDefault!1105 () ValueCell!332)

