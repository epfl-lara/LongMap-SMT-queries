; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134184 () Bool)

(assert start!134184)

(declare-fun b!1566596 () Bool)

(declare-fun res!1070195 () Bool)

(declare-fun e!873301 () Bool)

(assert (=> b!1566596 (=> (not res!1070195) (not e!873301))))

(declare-datatypes ((V!60001 0))(
  ( (V!60002 (val!19506 Int)) )
))
(declare-datatypes ((tuple2!25226 0))(
  ( (tuple2!25227 (_1!12624 (_ BitVec 64)) (_2!12624 V!60001)) )
))
(declare-datatypes ((List!36589 0))(
  ( (Nil!36586) (Cons!36585 (h!38049 tuple2!25226) (t!51428 List!36589)) )
))
(declare-datatypes ((ListLongMap!22669 0))(
  ( (ListLongMap!22670 (toList!11350 List!36589)) )
))
(declare-fun contains!10352 (ListLongMap!22669 (_ BitVec 64)) Bool)

(assert (=> b!1566596 (= res!1070195 (not (contains!10352 (ListLongMap!22670 Nil!36586) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566597 () Bool)

(declare-fun res!1070193 () Bool)

(assert (=> b!1566597 (=> (not res!1070193) (not e!873301))))

(declare-datatypes ((array!104508 0))(
  ( (array!104509 (arr!50438 (Array (_ BitVec 32) (_ BitVec 64))) (size!50989 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104508)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104508 (_ BitVec 32)) Bool)

(assert (=> b!1566597 (= res!1070193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566598 () Bool)

(declare-fun res!1070194 () Bool)

(assert (=> b!1566598 (=> (not res!1070194) (not e!873301))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18392 0))(
  ( (ValueCellFull!18392 (v!22250 V!60001)) (EmptyCell!18392) )
))
(declare-datatypes ((array!104510 0))(
  ( (array!104511 (arr!50439 (Array (_ BitVec 32) ValueCell!18392)) (size!50990 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104510)

(assert (=> b!1566598 (= res!1070194 (and (= (size!50990 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50989 _keys!637) (size!50990 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566599 () Bool)

(declare-fun res!1070196 () Bool)

(assert (=> b!1566599 (=> (not res!1070196) (not e!873301))))

(declare-datatypes ((List!36590 0))(
  ( (Nil!36587) (Cons!36586 (h!38050 (_ BitVec 64)) (t!51429 List!36590)) )
))
(declare-fun arrayNoDuplicates!0 (array!104508 (_ BitVec 32) List!36590) Bool)

(assert (=> b!1566599 (= res!1070196 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36587))))

(declare-fun mapNonEmpty!59646 () Bool)

(declare-fun mapRes!59646 () Bool)

(declare-fun tp!113571 () Bool)

(declare-fun e!873300 () Bool)

(assert (=> mapNonEmpty!59646 (= mapRes!59646 (and tp!113571 e!873300))))

(declare-fun mapValue!59646 () ValueCell!18392)

(declare-fun mapRest!59646 () (Array (_ BitVec 32) ValueCell!18392))

(declare-fun mapKey!59646 () (_ BitVec 32))

(assert (=> mapNonEmpty!59646 (= (arr!50439 _values!487) (store mapRest!59646 mapKey!59646 mapValue!59646))))

(declare-fun b!1566601 () Bool)

(declare-fun res!1070197 () Bool)

(assert (=> b!1566601 (=> (not res!1070197) (not e!873301))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566601 (= res!1070197 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50989 _keys!637)) (bvsge from!782 (size!50989 _keys!637))))))

(declare-fun b!1566602 () Bool)

(declare-fun e!873302 () Bool)

(declare-fun e!873303 () Bool)

(assert (=> b!1566602 (= e!873302 (and e!873303 mapRes!59646))))

(declare-fun condMapEmpty!59646 () Bool)

(declare-fun mapDefault!59646 () ValueCell!18392)

(assert (=> b!1566602 (= condMapEmpty!59646 (= (arr!50439 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18392)) mapDefault!59646)))))

(declare-fun mapIsEmpty!59646 () Bool)

(assert (=> mapIsEmpty!59646 mapRes!59646))

(declare-fun res!1070198 () Bool)

(assert (=> start!134184 (=> (not res!1070198) (not e!873301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134184 (= res!1070198 (validMask!0 mask!947))))

(assert (=> start!134184 e!873301))

(assert (=> start!134184 true))

(declare-fun array_inv!39441 (array!104508) Bool)

(assert (=> start!134184 (array_inv!39441 _keys!637)))

(declare-fun array_inv!39442 (array!104510) Bool)

(assert (=> start!134184 (and (array_inv!39442 _values!487) e!873302)))

(declare-fun b!1566600 () Bool)

(declare-fun tp_is_empty!38845 () Bool)

(assert (=> b!1566600 (= e!873300 tp_is_empty!38845)))

(declare-fun b!1566603 () Bool)

(assert (=> b!1566603 (= e!873303 tp_is_empty!38845)))

(declare-fun b!1566604 () Bool)

(assert (=> b!1566604 (= e!873301 false)))

(declare-fun lt!672917 () Bool)

(assert (=> b!1566604 (= lt!672917 (contains!10352 (ListLongMap!22670 Nil!36586) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134184 res!1070198) b!1566598))

(assert (= (and b!1566598 res!1070194) b!1566597))

(assert (= (and b!1566597 res!1070193) b!1566599))

(assert (= (and b!1566599 res!1070196) b!1566601))

(assert (= (and b!1566601 res!1070197) b!1566596))

(assert (= (and b!1566596 res!1070195) b!1566604))

(assert (= (and b!1566602 condMapEmpty!59646) mapIsEmpty!59646))

(assert (= (and b!1566602 (not condMapEmpty!59646)) mapNonEmpty!59646))

(get-info :version)

(assert (= (and mapNonEmpty!59646 ((_ is ValueCellFull!18392) mapValue!59646)) b!1566600))

(assert (= (and b!1566602 ((_ is ValueCellFull!18392) mapDefault!59646)) b!1566603))

(assert (= start!134184 b!1566602))

(declare-fun m!1441725 () Bool)

(assert (=> b!1566596 m!1441725))

(declare-fun m!1441727 () Bool)

(assert (=> b!1566599 m!1441727))

(declare-fun m!1441729 () Bool)

(assert (=> start!134184 m!1441729))

(declare-fun m!1441731 () Bool)

(assert (=> start!134184 m!1441731))

(declare-fun m!1441733 () Bool)

(assert (=> start!134184 m!1441733))

(declare-fun m!1441735 () Bool)

(assert (=> b!1566604 m!1441735))

(declare-fun m!1441737 () Bool)

(assert (=> b!1566597 m!1441737))

(declare-fun m!1441739 () Bool)

(assert (=> mapNonEmpty!59646 m!1441739))

(check-sat (not start!134184) (not mapNonEmpty!59646) (not b!1566599) tp_is_empty!38845 (not b!1566597) (not b!1566596) (not b!1566604))
(check-sat)
