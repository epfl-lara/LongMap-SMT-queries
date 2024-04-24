; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133844 () Bool)

(assert start!133844)

(declare-fun b!1562334 () Bool)

(declare-fun res!1067554 () Bool)

(declare-fun e!870700 () Bool)

(assert (=> b!1562334 (=> (not res!1067554) (not e!870700))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103882 0))(
  ( (array!103883 (arr!50126 (Array (_ BitVec 32) (_ BitVec 64))) (size!50677 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103882)

(declare-datatypes ((V!59561 0))(
  ( (V!59562 (val!19341 Int)) )
))
(declare-datatypes ((ValueCell!18227 0))(
  ( (ValueCellFull!18227 (v!22085 V!59561)) (EmptyCell!18227) )
))
(declare-datatypes ((array!103884 0))(
  ( (array!103885 (arr!50127 (Array (_ BitVec 32) ValueCell!18227)) (size!50678 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103884)

(assert (=> b!1562334 (= res!1067554 (and (= (size!50678 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50677 _keys!637) (size!50678 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562335 () Bool)

(declare-fun res!1067553 () Bool)

(assert (=> b!1562335 (=> (not res!1067553) (not e!870700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103882 (_ BitVec 32)) Bool)

(assert (=> b!1562335 (= res!1067553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59148 () Bool)

(declare-fun mapRes!59148 () Bool)

(declare-fun tp!112803 () Bool)

(declare-fun e!870699 () Bool)

(assert (=> mapNonEmpty!59148 (= mapRes!59148 (and tp!112803 e!870699))))

(declare-fun mapKey!59148 () (_ BitVec 32))

(declare-fun mapValue!59148 () ValueCell!18227)

(declare-fun mapRest!59148 () (Array (_ BitVec 32) ValueCell!18227))

(assert (=> mapNonEmpty!59148 (= (arr!50127 _values!487) (store mapRest!59148 mapKey!59148 mapValue!59148))))

(declare-fun b!1562336 () Bool)

(declare-fun res!1067555 () Bool)

(assert (=> b!1562336 (=> (not res!1067555) (not e!870700))))

(declare-datatypes ((List!36393 0))(
  ( (Nil!36390) (Cons!36389 (h!37853 (_ BitVec 64)) (t!51118 List!36393)) )
))
(declare-fun arrayNoDuplicates!0 (array!103882 (_ BitVec 32) List!36393) Bool)

(assert (=> b!1562336 (= res!1067555 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36390))))

(declare-fun mapIsEmpty!59148 () Bool)

(assert (=> mapIsEmpty!59148 mapRes!59148))

(declare-fun b!1562337 () Bool)

(declare-fun tp_is_empty!38515 () Bool)

(assert (=> b!1562337 (= e!870699 tp_is_empty!38515)))

(declare-fun b!1562338 () Bool)

(declare-fun e!870701 () Bool)

(assert (=> b!1562338 (= e!870701 tp_is_empty!38515)))

(declare-fun res!1067552 () Bool)

(assert (=> start!133844 (=> (not res!1067552) (not e!870700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133844 (= res!1067552 (validMask!0 mask!947))))

(assert (=> start!133844 e!870700))

(assert (=> start!133844 true))

(declare-fun array_inv!39221 (array!103882) Bool)

(assert (=> start!133844 (array_inv!39221 _keys!637)))

(declare-fun e!870702 () Bool)

(declare-fun array_inv!39222 (array!103884) Bool)

(assert (=> start!133844 (and (array_inv!39222 _values!487) e!870702)))

(declare-fun b!1562339 () Bool)

(declare-fun res!1067551 () Bool)

(assert (=> b!1562339 (=> (not res!1067551) (not e!870700))))

(declare-datatypes ((tuple2!25068 0))(
  ( (tuple2!25069 (_1!12545 (_ BitVec 64)) (_2!12545 V!59561)) )
))
(declare-datatypes ((List!36394 0))(
  ( (Nil!36391) (Cons!36390 (h!37854 tuple2!25068) (t!51119 List!36394)) )
))
(declare-datatypes ((ListLongMap!22511 0))(
  ( (ListLongMap!22512 (toList!11271 List!36394)) )
))
(declare-fun contains!10272 (ListLongMap!22511 (_ BitVec 64)) Bool)

(assert (=> b!1562339 (= res!1067551 (not (contains!10272 (ListLongMap!22512 Nil!36391) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562340 () Bool)

(assert (=> b!1562340 (= e!870702 (and e!870701 mapRes!59148))))

(declare-fun condMapEmpty!59148 () Bool)

(declare-fun mapDefault!59148 () ValueCell!18227)

(assert (=> b!1562340 (= condMapEmpty!59148 (= (arr!50127 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18227)) mapDefault!59148)))))

(declare-fun b!1562341 () Bool)

(assert (=> b!1562341 (= e!870700 false)))

(declare-fun lt!671837 () Bool)

(assert (=> b!1562341 (= lt!671837 (contains!10272 (ListLongMap!22512 Nil!36391) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1562342 () Bool)

(declare-fun res!1067550 () Bool)

(assert (=> b!1562342 (=> (not res!1067550) (not e!870700))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562342 (= res!1067550 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50677 _keys!637)) (bvsge from!782 (size!50677 _keys!637))))))

(assert (= (and start!133844 res!1067552) b!1562334))

(assert (= (and b!1562334 res!1067554) b!1562335))

(assert (= (and b!1562335 res!1067553) b!1562336))

(assert (= (and b!1562336 res!1067555) b!1562342))

(assert (= (and b!1562342 res!1067550) b!1562339))

(assert (= (and b!1562339 res!1067551) b!1562341))

(assert (= (and b!1562340 condMapEmpty!59148) mapIsEmpty!59148))

(assert (= (and b!1562340 (not condMapEmpty!59148)) mapNonEmpty!59148))

(get-info :version)

(assert (= (and mapNonEmpty!59148 ((_ is ValueCellFull!18227) mapValue!59148)) b!1562337))

(assert (= (and b!1562340 ((_ is ValueCellFull!18227) mapDefault!59148)) b!1562338))

(assert (= start!133844 b!1562340))

(declare-fun m!1438215 () Bool)

(assert (=> mapNonEmpty!59148 m!1438215))

(declare-fun m!1438217 () Bool)

(assert (=> b!1562341 m!1438217))

(declare-fun m!1438219 () Bool)

(assert (=> b!1562335 m!1438219))

(declare-fun m!1438221 () Bool)

(assert (=> b!1562336 m!1438221))

(declare-fun m!1438223 () Bool)

(assert (=> b!1562339 m!1438223))

(declare-fun m!1438225 () Bool)

(assert (=> start!133844 m!1438225))

(declare-fun m!1438227 () Bool)

(assert (=> start!133844 m!1438227))

(declare-fun m!1438229 () Bool)

(assert (=> start!133844 m!1438229))

(check-sat (not b!1562339) (not b!1562335) tp_is_empty!38515 (not mapNonEmpty!59148) (not b!1562336) (not b!1562341) (not start!133844))
(check-sat)
