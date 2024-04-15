; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133412 () Bool)

(assert start!133412)

(declare-fun b!1559990 () Bool)

(declare-fun e!869221 () Bool)

(declare-fun tp_is_empty!38545 () Bool)

(assert (=> b!1559990 (= e!869221 tp_is_empty!38545)))

(declare-fun res!1066833 () Bool)

(declare-fun e!869220 () Bool)

(assert (=> start!133412 (=> (not res!1066833) (not e!869220))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133412 (= res!1066833 (validMask!0 mask!947))))

(assert (=> start!133412 e!869220))

(assert (=> start!133412 true))

(declare-datatypes ((array!103732 0))(
  ( (array!103733 (arr!50059 (Array (_ BitVec 32) (_ BitVec 64))) (size!50611 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103732)

(declare-fun array_inv!39113 (array!103732) Bool)

(assert (=> start!133412 (array_inv!39113 _keys!637)))

(declare-datatypes ((V!59601 0))(
  ( (V!59602 (val!19356 Int)) )
))
(declare-datatypes ((ValueCell!18242 0))(
  ( (ValueCellFull!18242 (v!22104 V!59601)) (EmptyCell!18242) )
))
(declare-datatypes ((array!103734 0))(
  ( (array!103735 (arr!50060 (Array (_ BitVec 32) ValueCell!18242)) (size!50612 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103734)

(declare-fun e!869217 () Bool)

(declare-fun array_inv!39114 (array!103734) Bool)

(assert (=> start!133412 (and (array_inv!39114 _values!487) e!869217)))

(declare-fun b!1559991 () Bool)

(assert (=> b!1559991 (= e!869220 false)))

(declare-fun lt!670688 () Bool)

(declare-datatypes ((tuple2!25106 0))(
  ( (tuple2!25107 (_1!12564 (_ BitVec 64)) (_2!12564 V!59601)) )
))
(declare-datatypes ((List!36428 0))(
  ( (Nil!36425) (Cons!36424 (h!37871 tuple2!25106) (t!51153 List!36428)) )
))
(declare-datatypes ((ListLongMap!22541 0))(
  ( (ListLongMap!22542 (toList!11286 List!36428)) )
))
(declare-fun contains!10196 (ListLongMap!22541 (_ BitVec 64)) Bool)

(assert (=> b!1559991 (= lt!670688 (contains!10196 (ListLongMap!22542 Nil!36425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559992 () Bool)

(declare-fun e!869218 () Bool)

(declare-fun mapRes!59193 () Bool)

(assert (=> b!1559992 (= e!869217 (and e!869218 mapRes!59193))))

(declare-fun condMapEmpty!59193 () Bool)

(declare-fun mapDefault!59193 () ValueCell!18242)

(assert (=> b!1559992 (= condMapEmpty!59193 (= (arr!50060 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18242)) mapDefault!59193)))))

(declare-fun b!1559993 () Bool)

(declare-fun res!1066836 () Bool)

(assert (=> b!1559993 (=> (not res!1066836) (not e!869220))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559993 (= res!1066836 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50611 _keys!637)) (bvsge from!782 (size!50611 _keys!637))))))

(declare-fun b!1559994 () Bool)

(declare-fun res!1066831 () Bool)

(assert (=> b!1559994 (=> (not res!1066831) (not e!869220))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559994 (= res!1066831 (and (= (size!50612 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50611 _keys!637) (size!50612 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559995 () Bool)

(assert (=> b!1559995 (= e!869218 tp_is_empty!38545)))

(declare-fun b!1559996 () Bool)

(declare-fun res!1066834 () Bool)

(assert (=> b!1559996 (=> (not res!1066834) (not e!869220))))

(assert (=> b!1559996 (= res!1066834 (not (contains!10196 (ListLongMap!22542 Nil!36425) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!59193 () Bool)

(assert (=> mapIsEmpty!59193 mapRes!59193))

(declare-fun mapNonEmpty!59193 () Bool)

(declare-fun tp!112849 () Bool)

(assert (=> mapNonEmpty!59193 (= mapRes!59193 (and tp!112849 e!869221))))

(declare-fun mapKey!59193 () (_ BitVec 32))

(declare-fun mapValue!59193 () ValueCell!18242)

(declare-fun mapRest!59193 () (Array (_ BitVec 32) ValueCell!18242))

(assert (=> mapNonEmpty!59193 (= (arr!50060 _values!487) (store mapRest!59193 mapKey!59193 mapValue!59193))))

(declare-fun b!1559997 () Bool)

(declare-fun res!1066832 () Bool)

(assert (=> b!1559997 (=> (not res!1066832) (not e!869220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103732 (_ BitVec 32)) Bool)

(assert (=> b!1559997 (= res!1066832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559998 () Bool)

(declare-fun res!1066835 () Bool)

(assert (=> b!1559998 (=> (not res!1066835) (not e!869220))))

(declare-datatypes ((List!36429 0))(
  ( (Nil!36426) (Cons!36425 (h!37872 (_ BitVec 64)) (t!51154 List!36429)) )
))
(declare-fun arrayNoDuplicates!0 (array!103732 (_ BitVec 32) List!36429) Bool)

(assert (=> b!1559998 (= res!1066835 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36426))))

(assert (= (and start!133412 res!1066833) b!1559994))

(assert (= (and b!1559994 res!1066831) b!1559997))

(assert (= (and b!1559997 res!1066832) b!1559998))

(assert (= (and b!1559998 res!1066835) b!1559993))

(assert (= (and b!1559993 res!1066836) b!1559996))

(assert (= (and b!1559996 res!1066834) b!1559991))

(assert (= (and b!1559992 condMapEmpty!59193) mapIsEmpty!59193))

(assert (= (and b!1559992 (not condMapEmpty!59193)) mapNonEmpty!59193))

(get-info :version)

(assert (= (and mapNonEmpty!59193 ((_ is ValueCellFull!18242) mapValue!59193)) b!1559990))

(assert (= (and b!1559992 ((_ is ValueCellFull!18242) mapDefault!59193)) b!1559995))

(assert (= start!133412 b!1559992))

(declare-fun m!1435305 () Bool)

(assert (=> b!1559997 m!1435305))

(declare-fun m!1435307 () Bool)

(assert (=> b!1559996 m!1435307))

(declare-fun m!1435309 () Bool)

(assert (=> b!1559998 m!1435309))

(declare-fun m!1435311 () Bool)

(assert (=> b!1559991 m!1435311))

(declare-fun m!1435313 () Bool)

(assert (=> start!133412 m!1435313))

(declare-fun m!1435315 () Bool)

(assert (=> start!133412 m!1435315))

(declare-fun m!1435317 () Bool)

(assert (=> start!133412 m!1435317))

(declare-fun m!1435319 () Bool)

(assert (=> mapNonEmpty!59193 m!1435319))

(check-sat (not start!133412) (not b!1559998) (not b!1559996) (not b!1559991) (not mapNonEmpty!59193) (not b!1559997) tp_is_empty!38545)
(check-sat)
