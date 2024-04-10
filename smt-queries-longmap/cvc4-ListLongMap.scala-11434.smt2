; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133394 () Bool)

(assert start!133394)

(declare-fun b!1559513 () Bool)

(declare-fun e!868970 () Bool)

(declare-fun tp_is_empty!38489 () Bool)

(assert (=> b!1559513 (= e!868970 tp_is_empty!38489)))

(declare-fun b!1559514 () Bool)

(declare-fun e!868966 () Bool)

(declare-datatypes ((List!36348 0))(
  ( (Nil!36345) (Cons!36344 (h!37790 (_ BitVec 64)) (t!51081 List!36348)) )
))
(declare-fun contains!10221 (List!36348 (_ BitVec 64)) Bool)

(assert (=> b!1559514 (= e!868966 (contains!10221 Nil!36345 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59106 () Bool)

(declare-fun mapRes!59106 () Bool)

(assert (=> mapIsEmpty!59106 mapRes!59106))

(declare-fun b!1559515 () Bool)

(declare-fun e!868965 () Bool)

(assert (=> b!1559515 (= e!868965 tp_is_empty!38489)))

(declare-fun b!1559516 () Bool)

(declare-fun e!868968 () Bool)

(assert (=> b!1559516 (= e!868968 e!868966)))

(declare-fun res!1066438 () Bool)

(assert (=> b!1559516 (=> res!1066438 e!868966)))

(assert (=> b!1559516 (= res!1066438 (contains!10221 Nil!36345 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559517 () Bool)

(declare-fun res!1066441 () Bool)

(assert (=> b!1559517 (=> (not res!1066441) (not e!868968))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103702 0))(
  ( (array!103703 (arr!50044 (Array (_ BitVec 32) (_ BitVec 64))) (size!50594 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103702)

(declare-datatypes ((V!59525 0))(
  ( (V!59526 (val!19328 Int)) )
))
(declare-datatypes ((ValueCell!18214 0))(
  ( (ValueCellFull!18214 (v!22079 V!59525)) (EmptyCell!18214) )
))
(declare-datatypes ((array!103704 0))(
  ( (array!103705 (arr!50045 (Array (_ BitVec 32) ValueCell!18214)) (size!50595 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103704)

(assert (=> b!1559517 (= res!1066441 (and (= (size!50595 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50594 _keys!637) (size!50595 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559518 () Bool)

(declare-fun res!1066440 () Bool)

(assert (=> b!1559518 (=> (not res!1066440) (not e!868968))))

(declare-fun noDuplicate!2641 (List!36348) Bool)

(assert (=> b!1559518 (= res!1066440 (noDuplicate!2641 Nil!36345))))

(declare-fun b!1559519 () Bool)

(declare-fun res!1066436 () Bool)

(assert (=> b!1559519 (=> (not res!1066436) (not e!868968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103702 (_ BitVec 32)) Bool)

(assert (=> b!1559519 (= res!1066436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59106 () Bool)

(declare-fun tp!112761 () Bool)

(assert (=> mapNonEmpty!59106 (= mapRes!59106 (and tp!112761 e!868965))))

(declare-fun mapKey!59106 () (_ BitVec 32))

(declare-fun mapRest!59106 () (Array (_ BitVec 32) ValueCell!18214))

(declare-fun mapValue!59106 () ValueCell!18214)

(assert (=> mapNonEmpty!59106 (= (arr!50045 _values!487) (store mapRest!59106 mapKey!59106 mapValue!59106))))

(declare-fun res!1066439 () Bool)

(assert (=> start!133394 (=> (not res!1066439) (not e!868968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133394 (= res!1066439 (validMask!0 mask!947))))

(assert (=> start!133394 e!868968))

(assert (=> start!133394 true))

(declare-fun e!868967 () Bool)

(declare-fun array_inv!38901 (array!103704) Bool)

(assert (=> start!133394 (and (array_inv!38901 _values!487) e!868967)))

(declare-fun array_inv!38902 (array!103702) Bool)

(assert (=> start!133394 (array_inv!38902 _keys!637)))

(declare-fun b!1559520 () Bool)

(assert (=> b!1559520 (= e!868967 (and e!868970 mapRes!59106))))

(declare-fun condMapEmpty!59106 () Bool)

(declare-fun mapDefault!59106 () ValueCell!18214)

