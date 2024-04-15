; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133740 () Bool)

(assert start!133740)

(declare-fun mapIsEmpty!59673 () Bool)

(declare-fun mapRes!59673 () Bool)

(assert (=> mapIsEmpty!59673 mapRes!59673))

(declare-fun b!1564090 () Bool)

(declare-fun e!871731 () Bool)

(declare-fun tp_is_empty!38863 () Bool)

(assert (=> b!1564090 (= e!871731 tp_is_empty!38863)))

(declare-fun mapNonEmpty!59673 () Bool)

(declare-fun tp!113599 () Bool)

(declare-fun e!871728 () Bool)

(assert (=> mapNonEmpty!59673 (= mapRes!59673 (and tp!113599 e!871728))))

(declare-fun mapKey!59673 () (_ BitVec 32))

(declare-datatypes ((V!60025 0))(
  ( (V!60026 (val!19515 Int)) )
))
(declare-datatypes ((ValueCell!18401 0))(
  ( (ValueCellFull!18401 (v!22263 V!60025)) (EmptyCell!18401) )
))
(declare-datatypes ((array!104344 0))(
  ( (array!104345 (arr!50364 (Array (_ BitVec 32) ValueCell!18401)) (size!50916 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104344)

(declare-fun mapValue!59673 () ValueCell!18401)

(declare-fun mapRest!59673 () (Array (_ BitVec 32) ValueCell!18401))

(assert (=> mapNonEmpty!59673 (= (arr!50364 _values!487) (store mapRest!59673 mapKey!59673 mapValue!59673))))

(declare-fun res!1069367 () Bool)

(declare-fun e!871729 () Bool)

(assert (=> start!133740 (=> (not res!1069367) (not e!871729))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133740 (= res!1069367 (validMask!0 mask!947))))

(assert (=> start!133740 e!871729))

(assert (=> start!133740 true))

(declare-datatypes ((array!104346 0))(
  ( (array!104347 (arr!50365 (Array (_ BitVec 32) (_ BitVec 64))) (size!50917 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104346)

(declare-fun array_inv!39337 (array!104346) Bool)

(assert (=> start!133740 (array_inv!39337 _keys!637)))

(declare-fun e!871730 () Bool)

(declare-fun array_inv!39338 (array!104344) Bool)

(assert (=> start!133740 (and (array_inv!39338 _values!487) e!871730)))

(declare-fun b!1564091 () Bool)

(assert (=> b!1564091 (= e!871728 tp_is_empty!38863)))

(declare-fun b!1564092 () Bool)

(assert (=> b!1564092 (= e!871730 (and e!871731 mapRes!59673))))

(declare-fun condMapEmpty!59673 () Bool)

(declare-fun mapDefault!59673 () ValueCell!18401)

(assert (=> b!1564092 (= condMapEmpty!59673 (= (arr!50364 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18401)) mapDefault!59673)))))

(declare-fun b!1564093 () Bool)

(assert (=> b!1564093 (= e!871729 false)))

(declare-fun lt!671750 () Bool)

(declare-datatypes ((tuple2!25260 0))(
  ( (tuple2!25261 (_1!12641 (_ BitVec 64)) (_2!12641 V!60025)) )
))
(declare-datatypes ((List!36615 0))(
  ( (Nil!36612) (Cons!36611 (h!38058 tuple2!25260) (t!51454 List!36615)) )
))
(declare-datatypes ((ListLongMap!22695 0))(
  ( (ListLongMap!22696 (toList!11363 List!36615)) )
))
(declare-fun contains!10274 (ListLongMap!22695 (_ BitVec 64)) Bool)

(assert (=> b!1564093 (= lt!671750 (contains!10274 (ListLongMap!22696 Nil!36612) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564094 () Bool)

(declare-fun res!1069368 () Bool)

(assert (=> b!1564094 (=> (not res!1069368) (not e!871729))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564094 (= res!1069368 (and (= (size!50916 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50917 _keys!637) (size!50916 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564095 () Bool)

(declare-fun res!1069366 () Bool)

(assert (=> b!1564095 (=> (not res!1069366) (not e!871729))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564095 (= res!1069366 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50917 _keys!637)) (bvsge from!782 (size!50917 _keys!637))))))

(declare-fun b!1564096 () Bool)

(declare-fun res!1069371 () Bool)

(assert (=> b!1564096 (=> (not res!1069371) (not e!871729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104346 (_ BitVec 32)) Bool)

(assert (=> b!1564096 (= res!1069371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564097 () Bool)

(declare-fun res!1069370 () Bool)

(assert (=> b!1564097 (=> (not res!1069370) (not e!871729))))

(declare-datatypes ((List!36616 0))(
  ( (Nil!36613) (Cons!36612 (h!38059 (_ BitVec 64)) (t!51455 List!36616)) )
))
(declare-fun arrayNoDuplicates!0 (array!104346 (_ BitVec 32) List!36616) Bool)

(assert (=> b!1564097 (= res!1069370 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36613))))

(declare-fun b!1564098 () Bool)

(declare-fun res!1069369 () Bool)

(assert (=> b!1564098 (=> (not res!1069369) (not e!871729))))

(assert (=> b!1564098 (= res!1069369 (not (contains!10274 (ListLongMap!22696 Nil!36612) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!133740 res!1069367) b!1564094))

(assert (= (and b!1564094 res!1069368) b!1564096))

(assert (= (and b!1564096 res!1069371) b!1564097))

(assert (= (and b!1564097 res!1069370) b!1564095))

(assert (= (and b!1564095 res!1069366) b!1564098))

(assert (= (and b!1564098 res!1069369) b!1564093))

(assert (= (and b!1564092 condMapEmpty!59673) mapIsEmpty!59673))

(assert (= (and b!1564092 (not condMapEmpty!59673)) mapNonEmpty!59673))

(get-info :version)

(assert (= (and mapNonEmpty!59673 ((_ is ValueCellFull!18401) mapValue!59673)) b!1564091))

(assert (= (and b!1564092 ((_ is ValueCellFull!18401) mapDefault!59673)) b!1564090))

(assert (= start!133740 b!1564092))

(declare-fun m!1438719 () Bool)

(assert (=> b!1564093 m!1438719))

(declare-fun m!1438721 () Bool)

(assert (=> mapNonEmpty!59673 m!1438721))

(declare-fun m!1438723 () Bool)

(assert (=> b!1564098 m!1438723))

(declare-fun m!1438725 () Bool)

(assert (=> b!1564096 m!1438725))

(declare-fun m!1438727 () Bool)

(assert (=> b!1564097 m!1438727))

(declare-fun m!1438729 () Bool)

(assert (=> start!133740 m!1438729))

(declare-fun m!1438731 () Bool)

(assert (=> start!133740 m!1438731))

(declare-fun m!1438733 () Bool)

(assert (=> start!133740 m!1438733))

(check-sat (not b!1564093) (not b!1564096) (not start!133740) (not b!1564097) tp_is_empty!38863 (not mapNonEmpty!59673) (not b!1564098))
(check-sat)
