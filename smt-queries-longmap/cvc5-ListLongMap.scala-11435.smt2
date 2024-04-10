; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133408 () Bool)

(assert start!133408)

(declare-fun b!1559574 () Bool)

(declare-fun e!869010 () Bool)

(assert (=> b!1559574 (= e!869010 false)))

(declare-fun lt!670893 () Bool)

(declare-datatypes ((V!59529 0))(
  ( (V!59530 (val!19329 Int)) )
))
(declare-datatypes ((tuple2!24998 0))(
  ( (tuple2!24999 (_1!12510 (_ BitVec 64)) (_2!12510 V!59529)) )
))
(declare-datatypes ((List!36349 0))(
  ( (Nil!36346) (Cons!36345 (h!37791 tuple2!24998) (t!51082 List!36349)) )
))
(declare-datatypes ((ListLongMap!22433 0))(
  ( (ListLongMap!22434 (toList!11232 List!36349)) )
))
(declare-fun contains!10222 (ListLongMap!22433 (_ BitVec 64)) Bool)

(assert (=> b!1559574 (= lt!670893 (contains!10222 (ListLongMap!22434 Nil!36346) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59112 () Bool)

(declare-fun mapRes!59112 () Bool)

(assert (=> mapIsEmpty!59112 mapRes!59112))

(declare-fun b!1559575 () Bool)

(declare-fun e!869011 () Bool)

(declare-fun tp_is_empty!38491 () Bool)

(assert (=> b!1559575 (= e!869011 tp_is_empty!38491)))

(declare-fun mapNonEmpty!59112 () Bool)

(declare-fun tp!112767 () Bool)

(declare-fun e!869012 () Bool)

(assert (=> mapNonEmpty!59112 (= mapRes!59112 (and tp!112767 e!869012))))

(declare-datatypes ((ValueCell!18215 0))(
  ( (ValueCellFull!18215 (v!22081 V!59529)) (EmptyCell!18215) )
))
(declare-fun mapValue!59112 () ValueCell!18215)

(declare-fun mapKey!59112 () (_ BitVec 32))

(declare-datatypes ((array!103708 0))(
  ( (array!103709 (arr!50046 (Array (_ BitVec 32) ValueCell!18215)) (size!50596 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103708)

(declare-fun mapRest!59112 () (Array (_ BitVec 32) ValueCell!18215))

(assert (=> mapNonEmpty!59112 (= (arr!50046 _values!487) (store mapRest!59112 mapKey!59112 mapValue!59112))))

(declare-fun res!1066477 () Bool)

(assert (=> start!133408 (=> (not res!1066477) (not e!869010))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133408 (= res!1066477 (validMask!0 mask!947))))

(assert (=> start!133408 e!869010))

(assert (=> start!133408 true))

(declare-datatypes ((array!103710 0))(
  ( (array!103711 (arr!50047 (Array (_ BitVec 32) (_ BitVec 64))) (size!50597 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103710)

(declare-fun array_inv!38903 (array!103710) Bool)

(assert (=> start!133408 (array_inv!38903 _keys!637)))

(declare-fun e!869013 () Bool)

(declare-fun array_inv!38904 (array!103708) Bool)

(assert (=> start!133408 (and (array_inv!38904 _values!487) e!869013)))

(declare-fun b!1559576 () Bool)

(declare-fun res!1066478 () Bool)

(assert (=> b!1559576 (=> (not res!1066478) (not e!869010))))

(declare-datatypes ((List!36350 0))(
  ( (Nil!36347) (Cons!36346 (h!37792 (_ BitVec 64)) (t!51083 List!36350)) )
))
(declare-fun arrayNoDuplicates!0 (array!103710 (_ BitVec 32) List!36350) Bool)

(assert (=> b!1559576 (= res!1066478 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36347))))

(declare-fun b!1559577 () Bool)

(declare-fun res!1066474 () Bool)

(assert (=> b!1559577 (=> (not res!1066474) (not e!869010))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559577 (= res!1066474 (and (= (size!50596 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50597 _keys!637) (size!50596 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559578 () Bool)

(declare-fun res!1066476 () Bool)

(assert (=> b!1559578 (=> (not res!1066476) (not e!869010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103710 (_ BitVec 32)) Bool)

(assert (=> b!1559578 (= res!1066476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559579 () Bool)

(declare-fun res!1066475 () Bool)

(assert (=> b!1559579 (=> (not res!1066475) (not e!869010))))

(assert (=> b!1559579 (= res!1066475 (not (contains!10222 (ListLongMap!22434 Nil!36346) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559580 () Bool)

(assert (=> b!1559580 (= e!869012 tp_is_empty!38491)))

(declare-fun b!1559581 () Bool)

(declare-fun res!1066479 () Bool)

(assert (=> b!1559581 (=> (not res!1066479) (not e!869010))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559581 (= res!1066479 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50597 _keys!637)) (bvsge from!782 (size!50597 _keys!637))))))

(declare-fun b!1559582 () Bool)

(assert (=> b!1559582 (= e!869013 (and e!869011 mapRes!59112))))

(declare-fun condMapEmpty!59112 () Bool)

(declare-fun mapDefault!59112 () ValueCell!18215)

