; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133704 () Bool)

(assert start!133704)

(declare-fun b_free!32067 () Bool)

(declare-fun b_next!32067 () Bool)

(assert (=> start!133704 (= b_free!32067 (not b_next!32067))))

(declare-fun tp!113406 () Bool)

(declare-fun b_and!51637 () Bool)

(assert (=> start!133704 (= tp!113406 b_and!51637)))

(declare-fun b!1563275 () Bool)

(declare-fun res!1068733 () Bool)

(declare-fun e!871254 () Bool)

(assert (=> b!1563275 (=> (not res!1068733) (not e!871254))))

(declare-datatypes ((array!104272 0))(
  ( (array!104273 (arr!50328 (Array (_ BitVec 32) (_ BitVec 64))) (size!50878 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104272)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563275 (= res!1068733 (not (validKeyInArray!0 (select (arr!50328 _keys!637) from!782))))))

(declare-fun b!1563276 () Bool)

(declare-fun e!871255 () Bool)

(assert (=> b!1563276 (= e!871254 e!871255)))

(declare-fun res!1068730 () Bool)

(assert (=> b!1563276 (=> (not res!1068730) (not e!871255))))

(declare-datatypes ((V!59923 0))(
  ( (V!59924 (val!19477 Int)) )
))
(declare-datatypes ((tuple2!25130 0))(
  ( (tuple2!25131 (_1!12576 (_ BitVec 64)) (_2!12576 V!59923)) )
))
(declare-datatypes ((List!36514 0))(
  ( (Nil!36511) (Cons!36510 (h!37956 tuple2!25130) (t!51361 List!36514)) )
))
(declare-datatypes ((ListLongMap!22565 0))(
  ( (ListLongMap!22566 (toList!11298 List!36514)) )
))
(declare-fun lt!671855 () ListLongMap!22565)

(declare-fun contains!10288 (ListLongMap!22565 (_ BitVec 64)) Bool)

(assert (=> b!1563276 (= res!1068730 (not (contains!10288 lt!671855 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59923)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59923)

(declare-datatypes ((ValueCell!18363 0))(
  ( (ValueCellFull!18363 (v!22229 V!59923)) (EmptyCell!18363) )
))
(declare-datatypes ((array!104274 0))(
  ( (array!104275 (arr!50329 (Array (_ BitVec 32) ValueCell!18363)) (size!50879 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104274)

(declare-fun getCurrentListMapNoExtraKeys!6681 (array!104272 array!104274 (_ BitVec 32) (_ BitVec 32) V!59923 V!59923 (_ BitVec 32) Int) ListLongMap!22565)

(assert (=> b!1563276 (= lt!671855 (getCurrentListMapNoExtraKeys!6681 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59556 () Bool)

(declare-fun mapRes!59556 () Bool)

(assert (=> mapIsEmpty!59556 mapRes!59556))

(declare-fun b!1563277 () Bool)

(declare-fun res!1068729 () Bool)

(assert (=> b!1563277 (=> (not res!1068729) (not e!871254))))

(assert (=> b!1563277 (= res!1068729 (and (= (size!50879 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50878 _keys!637) (size!50879 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563278 () Bool)

(declare-fun res!1068732 () Bool)

(assert (=> b!1563278 (=> (not res!1068732) (not e!871254))))

(declare-datatypes ((List!36515 0))(
  ( (Nil!36512) (Cons!36511 (h!37957 (_ BitVec 64)) (t!51362 List!36515)) )
))
(declare-fun arrayNoDuplicates!0 (array!104272 (_ BitVec 32) List!36515) Bool)

(assert (=> b!1563278 (= res!1068732 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36512))))

(declare-fun b!1563279 () Bool)

(assert (=> b!1563279 (= e!871255 false)))

(declare-fun lt!671856 () Bool)

(assert (=> b!1563279 (= lt!671856 (contains!10288 lt!671855 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563280 () Bool)

(declare-fun e!871258 () Bool)

(declare-fun tp_is_empty!38787 () Bool)

(assert (=> b!1563280 (= e!871258 tp_is_empty!38787)))

(declare-fun res!1068734 () Bool)

(assert (=> start!133704 (=> (not res!1068734) (not e!871254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133704 (= res!1068734 (validMask!0 mask!947))))

(assert (=> start!133704 e!871254))

(assert (=> start!133704 tp!113406))

(assert (=> start!133704 tp_is_empty!38787))

(assert (=> start!133704 true))

(declare-fun array_inv!39115 (array!104272) Bool)

(assert (=> start!133704 (array_inv!39115 _keys!637)))

(declare-fun e!871253 () Bool)

(declare-fun array_inv!39116 (array!104274) Bool)

(assert (=> start!133704 (and (array_inv!39116 _values!487) e!871253)))

(declare-fun b!1563281 () Bool)

(declare-fun res!1068735 () Bool)

(assert (=> b!1563281 (=> (not res!1068735) (not e!871254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104272 (_ BitVec 32)) Bool)

(assert (=> b!1563281 (= res!1068735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563282 () Bool)

(assert (=> b!1563282 (= e!871253 (and e!871258 mapRes!59556))))

(declare-fun condMapEmpty!59556 () Bool)

(declare-fun mapDefault!59556 () ValueCell!18363)

(assert (=> b!1563282 (= condMapEmpty!59556 (= (arr!50329 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18363)) mapDefault!59556)))))

(declare-fun b!1563283 () Bool)

(declare-fun res!1068731 () Bool)

(assert (=> b!1563283 (=> (not res!1068731) (not e!871254))))

(assert (=> b!1563283 (= res!1068731 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50878 _keys!637)) (bvslt from!782 (size!50878 _keys!637))))))

(declare-fun b!1563284 () Bool)

(declare-fun e!871256 () Bool)

(assert (=> b!1563284 (= e!871256 tp_is_empty!38787)))

(declare-fun mapNonEmpty!59556 () Bool)

(declare-fun tp!113405 () Bool)

(assert (=> mapNonEmpty!59556 (= mapRes!59556 (and tp!113405 e!871256))))

(declare-fun mapKey!59556 () (_ BitVec 32))

(declare-fun mapRest!59556 () (Array (_ BitVec 32) ValueCell!18363))

(declare-fun mapValue!59556 () ValueCell!18363)

(assert (=> mapNonEmpty!59556 (= (arr!50329 _values!487) (store mapRest!59556 mapKey!59556 mapValue!59556))))

(assert (= (and start!133704 res!1068734) b!1563277))

(assert (= (and b!1563277 res!1068729) b!1563281))

(assert (= (and b!1563281 res!1068735) b!1563278))

(assert (= (and b!1563278 res!1068732) b!1563283))

(assert (= (and b!1563283 res!1068731) b!1563275))

(assert (= (and b!1563275 res!1068733) b!1563276))

(assert (= (and b!1563276 res!1068730) b!1563279))

(assert (= (and b!1563282 condMapEmpty!59556) mapIsEmpty!59556))

(assert (= (and b!1563282 (not condMapEmpty!59556)) mapNonEmpty!59556))

(get-info :version)

(assert (= (and mapNonEmpty!59556 ((_ is ValueCellFull!18363) mapValue!59556)) b!1563284))

(assert (= (and b!1563282 ((_ is ValueCellFull!18363) mapDefault!59556)) b!1563280))

(assert (= start!133704 b!1563282))

(declare-fun m!1438841 () Bool)

(assert (=> b!1563275 m!1438841))

(assert (=> b!1563275 m!1438841))

(declare-fun m!1438843 () Bool)

(assert (=> b!1563275 m!1438843))

(declare-fun m!1438845 () Bool)

(assert (=> b!1563281 m!1438845))

(declare-fun m!1438847 () Bool)

(assert (=> b!1563276 m!1438847))

(declare-fun m!1438849 () Bool)

(assert (=> b!1563276 m!1438849))

(declare-fun m!1438851 () Bool)

(assert (=> start!133704 m!1438851))

(declare-fun m!1438853 () Bool)

(assert (=> start!133704 m!1438853))

(declare-fun m!1438855 () Bool)

(assert (=> start!133704 m!1438855))

(declare-fun m!1438857 () Bool)

(assert (=> b!1563279 m!1438857))

(declare-fun m!1438859 () Bool)

(assert (=> b!1563278 m!1438859))

(declare-fun m!1438861 () Bool)

(assert (=> mapNonEmpty!59556 m!1438861))

(check-sat (not b_next!32067) b_and!51637 (not b!1563276) (not b!1563278) (not start!133704) (not mapNonEmpty!59556) (not b!1563281) (not b!1563279) tp_is_empty!38787 (not b!1563275))
(check-sat b_and!51637 (not b_next!32067))
