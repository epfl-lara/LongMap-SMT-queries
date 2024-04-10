; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!564 () Bool)

(assert start!564)

(declare-fun b!3411 () Bool)

(declare-fun res!5167 () Bool)

(declare-fun e!1625 () Bool)

(assert (=> b!3411 (=> (not res!5167) (not e!1625))))

(declare-datatypes ((array!189 0))(
  ( (array!190 (arr!88 (Array (_ BitVec 32) (_ BitVec 64))) (size!150 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!189)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!189 (_ BitVec 32)) Bool)

(assert (=> b!3411 (= res!5167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3412 () Bool)

(declare-fun res!5166 () Bool)

(assert (=> b!3412 (=> (not res!5166) (not e!1625))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-datatypes ((V!343 0))(
  ( (V!344 (val!68 Int)) )
))
(declare-datatypes ((ValueCell!46 0))(
  ( (ValueCellFull!46 (v!1155 V!343)) (EmptyCell!46) )
))
(declare-datatypes ((array!191 0))(
  ( (array!192 (arr!89 (Array (_ BitVec 32) ValueCell!46)) (size!151 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!191)

(assert (=> b!3412 (= res!5166 (and (= (size!151 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!150 _keys!1806) (size!151 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5165 () Bool)

(assert (=> start!564 (=> (not res!5165) (not e!1625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!564 (= res!5165 (validMask!0 mask!2250))))

(assert (=> start!564 e!1625))

(assert (=> start!564 true))

(declare-fun e!1627 () Bool)

(declare-fun array_inv!63 (array!191) Bool)

(assert (=> start!564 (and (array_inv!63 _values!1492) e!1627)))

(declare-fun array_inv!64 (array!189) Bool)

(assert (=> start!564 (array_inv!64 _keys!1806)))

(declare-fun b!3413 () Bool)

(declare-fun e!1624 () Bool)

(declare-fun tp_is_empty!125 () Bool)

(assert (=> b!3413 (= e!1624 tp_is_empty!125)))

(declare-fun b!3414 () Bool)

(declare-fun e!1628 () Bool)

(assert (=> b!3414 (= e!1628 tp_is_empty!125)))

(declare-fun b!3415 () Bool)

(assert (=> b!3415 (= e!1625 false)))

(declare-fun lt!471 () Bool)

(declare-datatypes ((List!57 0))(
  ( (Nil!54) (Cons!53 (h!619 (_ BitVec 64)) (t!2184 List!57)) )
))
(declare-fun arrayNoDuplicates!0 (array!189 (_ BitVec 32) List!57) Bool)

(assert (=> b!3415 (= lt!471 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!54))))

(declare-fun mapNonEmpty!143 () Bool)

(declare-fun mapRes!143 () Bool)

(declare-fun tp!383 () Bool)

(assert (=> mapNonEmpty!143 (= mapRes!143 (and tp!383 e!1624))))

(declare-fun mapKey!143 () (_ BitVec 32))

(declare-fun mapValue!143 () ValueCell!46)

(declare-fun mapRest!143 () (Array (_ BitVec 32) ValueCell!46))

(assert (=> mapNonEmpty!143 (= (arr!89 _values!1492) (store mapRest!143 mapKey!143 mapValue!143))))

(declare-fun b!3416 () Bool)

(assert (=> b!3416 (= e!1627 (and e!1628 mapRes!143))))

(declare-fun condMapEmpty!143 () Bool)

(declare-fun mapDefault!143 () ValueCell!46)

