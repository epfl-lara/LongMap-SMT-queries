; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108284 () Bool)

(assert start!108284)

(declare-fun b!1278331 () Bool)

(declare-fun e!730205 () Bool)

(declare-datatypes ((List!28736 0))(
  ( (Nil!28733) (Cons!28732 (h!29941 (_ BitVec 64)) (t!42276 List!28736)) )
))
(declare-fun noDuplicate!2053 (List!28736) Bool)

(assert (=> b!1278331 (= e!730205 (not (noDuplicate!2053 Nil!28733)))))

(declare-fun b!1278332 () Bool)

(declare-fun res!849276 () Bool)

(assert (=> b!1278332 (=> (not res!849276) (not e!730205))))

(declare-datatypes ((array!84078 0))(
  ( (array!84079 (arr!40545 (Array (_ BitVec 32) (_ BitVec 64))) (size!41095 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84078)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84078 (_ BitVec 32)) Bool)

(assert (=> b!1278332 (= res!849276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278333 () Bool)

(declare-fun e!730204 () Bool)

(declare-fun e!730202 () Bool)

(declare-fun mapRes!51785 () Bool)

(assert (=> b!1278333 (= e!730204 (and e!730202 mapRes!51785))))

(declare-fun condMapEmpty!51785 () Bool)

(declare-datatypes ((V!49761 0))(
  ( (V!49762 (val!16821 Int)) )
))
(declare-datatypes ((ValueCell!15848 0))(
  ( (ValueCellFull!15848 (v!19420 V!49761)) (EmptyCell!15848) )
))
(declare-datatypes ((array!84080 0))(
  ( (array!84081 (arr!40546 (Array (_ BitVec 32) ValueCell!15848)) (size!41096 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84080)

(declare-fun mapDefault!51785 () ValueCell!15848)

