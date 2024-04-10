; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!540 () Bool)

(assert start!540)

(declare-fun b!3195 () Bool)

(declare-fun e!1447 () Bool)

(assert (=> b!3195 (= e!1447 false)))

(declare-fun lt!435 () Bool)

(declare-datatypes ((array!141 0))(
  ( (array!142 (arr!64 (Array (_ BitVec 32) (_ BitVec 64))) (size!126 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!141)

(declare-datatypes ((List!48 0))(
  ( (Nil!45) (Cons!44 (h!610 (_ BitVec 64)) (t!2175 List!48)) )
))
(declare-fun arrayNoDuplicates!0 (array!141 (_ BitVec 32) List!48) Bool)

(assert (=> b!3195 (= lt!435 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!45))))

(declare-fun res!5057 () Bool)

(assert (=> start!540 (=> (not res!5057) (not e!1447))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!540 (= res!5057 (validMask!0 mask!2250))))

(assert (=> start!540 e!1447))

(assert (=> start!540 true))

(declare-datatypes ((V!311 0))(
  ( (V!312 (val!56 Int)) )
))
(declare-datatypes ((ValueCell!34 0))(
  ( (ValueCellFull!34 (v!1143 V!311)) (EmptyCell!34) )
))
(declare-datatypes ((array!143 0))(
  ( (array!144 (arr!65 (Array (_ BitVec 32) ValueCell!34)) (size!127 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!143)

(declare-fun e!1445 () Bool)

(declare-fun array_inv!43 (array!143) Bool)

(assert (=> start!540 (and (array_inv!43 _values!1492) e!1445)))

(declare-fun array_inv!44 (array!141) Bool)

(assert (=> start!540 (array_inv!44 _keys!1806)))

(declare-fun b!3196 () Bool)

(declare-fun res!5058 () Bool)

(assert (=> b!3196 (=> (not res!5058) (not e!1447))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3196 (= res!5058 (and (= (size!127 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!126 _keys!1806) (size!127 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3197 () Bool)

(declare-fun e!1444 () Bool)

(declare-fun tp_is_empty!101 () Bool)

(assert (=> b!3197 (= e!1444 tp_is_empty!101)))

(declare-fun b!3198 () Bool)

(declare-fun e!1446 () Bool)

(declare-fun mapRes!107 () Bool)

(assert (=> b!3198 (= e!1445 (and e!1446 mapRes!107))))

(declare-fun condMapEmpty!107 () Bool)

(declare-fun mapDefault!107 () ValueCell!34)

