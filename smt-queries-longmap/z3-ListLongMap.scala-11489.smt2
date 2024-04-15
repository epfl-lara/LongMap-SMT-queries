; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133682 () Bool)

(assert start!133682)

(declare-fun b_free!32095 () Bool)

(declare-fun b_next!32095 () Bool)

(assert (=> start!133682 (= b_free!32095 (not b_next!32095))))

(declare-fun tp!113490 () Bool)

(declare-fun b_and!51647 () Bool)

(assert (=> start!133682 (= tp!113490 b_and!51647)))

(declare-fun b!1563382 () Bool)

(declare-fun e!871307 () Bool)

(declare-fun tp_is_empty!38815 () Bool)

(assert (=> b!1563382 (= e!871307 tp_is_empty!38815)))

(declare-fun b!1563383 () Bool)

(declare-fun res!1068900 () Bool)

(declare-fun e!871309 () Bool)

(assert (=> b!1563383 (=> (not res!1068900) (not e!871309))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104246 0))(
  ( (array!104247 (arr!50316 (Array (_ BitVec 32) (_ BitVec 64))) (size!50868 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104246)

(assert (=> b!1563383 (= res!1068900 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50868 _keys!637)) (bvslt from!782 (size!50868 _keys!637))))))

(declare-fun b!1563384 () Bool)

(declare-fun e!871312 () Bool)

(assert (=> b!1563384 (= e!871312 tp_is_empty!38815)))

(declare-fun b!1563385 () Bool)

(declare-fun res!1068897 () Bool)

(assert (=> b!1563385 (=> (not res!1068897) (not e!871309))))

(declare-datatypes ((List!36578 0))(
  ( (Nil!36575) (Cons!36574 (h!38021 (_ BitVec 64)) (t!51417 List!36578)) )
))
(declare-fun arrayNoDuplicates!0 (array!104246 (_ BitVec 32) List!36578) Bool)

(assert (=> b!1563385 (= res!1068897 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36575))))

(declare-fun res!1068899 () Bool)

(assert (=> start!133682 (=> (not res!1068899) (not e!871309))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133682 (= res!1068899 (validMask!0 mask!947))))

(assert (=> start!133682 e!871309))

(assert (=> start!133682 tp!113490))

(assert (=> start!133682 tp_is_empty!38815))

(assert (=> start!133682 true))

(declare-fun array_inv!39295 (array!104246) Bool)

(assert (=> start!133682 (array_inv!39295 _keys!637)))

(declare-datatypes ((V!59961 0))(
  ( (V!59962 (val!19491 Int)) )
))
(declare-datatypes ((ValueCell!18377 0))(
  ( (ValueCellFull!18377 (v!22239 V!59961)) (EmptyCell!18377) )
))
(declare-datatypes ((array!104248 0))(
  ( (array!104249 (arr!50317 (Array (_ BitVec 32) ValueCell!18377)) (size!50869 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104248)

(declare-fun e!871308 () Bool)

(declare-fun array_inv!39296 (array!104248) Bool)

(assert (=> start!133682 (and (array_inv!39296 _values!487) e!871308)))

(declare-fun b!1563386 () Bool)

(declare-fun res!1068895 () Bool)

(assert (=> b!1563386 (=> (not res!1068895) (not e!871309))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563386 (= res!1068895 (and (= (size!50869 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50868 _keys!637) (size!50869 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563387 () Bool)

(declare-fun res!1068894 () Bool)

(assert (=> b!1563387 (=> (not res!1068894) (not e!871309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563387 (= res!1068894 (not (validKeyInArray!0 (select (arr!50316 _keys!637) from!782))))))

(declare-fun b!1563388 () Bool)

(declare-fun e!871311 () Bool)

(assert (=> b!1563388 (= e!871311 false)))

(declare-fun lt!671653 () Bool)

(declare-datatypes ((tuple2!25222 0))(
  ( (tuple2!25223 (_1!12622 (_ BitVec 64)) (_2!12622 V!59961)) )
))
(declare-datatypes ((List!36579 0))(
  ( (Nil!36576) (Cons!36575 (h!38022 tuple2!25222) (t!51418 List!36579)) )
))
(declare-datatypes ((ListLongMap!22657 0))(
  ( (ListLongMap!22658 (toList!11344 List!36579)) )
))
(declare-fun lt!671654 () ListLongMap!22657)

(declare-fun contains!10254 (ListLongMap!22657 (_ BitVec 64)) Bool)

(assert (=> b!1563388 (= lt!671653 (contains!10254 lt!671654 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59598 () Bool)

(declare-fun mapRes!59598 () Bool)

(assert (=> mapIsEmpty!59598 mapRes!59598))

(declare-fun b!1563389 () Bool)

(assert (=> b!1563389 (= e!871309 e!871311)))

(declare-fun res!1068896 () Bool)

(assert (=> b!1563389 (=> (not res!1068896) (not e!871311))))

(assert (=> b!1563389 (= res!1068896 (not (contains!10254 lt!671654 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59961)

(declare-fun minValue!453 () V!59961)

(declare-fun getCurrentListMapNoExtraKeys!6715 (array!104246 array!104248 (_ BitVec 32) (_ BitVec 32) V!59961 V!59961 (_ BitVec 32) Int) ListLongMap!22657)

(assert (=> b!1563389 (= lt!671654 (getCurrentListMapNoExtraKeys!6715 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563390 () Bool)

(assert (=> b!1563390 (= e!871308 (and e!871307 mapRes!59598))))

(declare-fun condMapEmpty!59598 () Bool)

(declare-fun mapDefault!59598 () ValueCell!18377)

(assert (=> b!1563390 (= condMapEmpty!59598 (= (arr!50317 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18377)) mapDefault!59598)))))

(declare-fun mapNonEmpty!59598 () Bool)

(declare-fun tp!113491 () Bool)

(assert (=> mapNonEmpty!59598 (= mapRes!59598 (and tp!113491 e!871312))))

(declare-fun mapRest!59598 () (Array (_ BitVec 32) ValueCell!18377))

(declare-fun mapKey!59598 () (_ BitVec 32))

(declare-fun mapValue!59598 () ValueCell!18377)

(assert (=> mapNonEmpty!59598 (= (arr!50317 _values!487) (store mapRest!59598 mapKey!59598 mapValue!59598))))

(declare-fun b!1563391 () Bool)

(declare-fun res!1068898 () Bool)

(assert (=> b!1563391 (=> (not res!1068898) (not e!871309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104246 (_ BitVec 32)) Bool)

(assert (=> b!1563391 (= res!1068898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133682 res!1068899) b!1563386))

(assert (= (and b!1563386 res!1068895) b!1563391))

(assert (= (and b!1563391 res!1068898) b!1563385))

(assert (= (and b!1563385 res!1068897) b!1563383))

(assert (= (and b!1563383 res!1068900) b!1563387))

(assert (= (and b!1563387 res!1068894) b!1563389))

(assert (= (and b!1563389 res!1068896) b!1563388))

(assert (= (and b!1563390 condMapEmpty!59598) mapIsEmpty!59598))

(assert (= (and b!1563390 (not condMapEmpty!59598)) mapNonEmpty!59598))

(get-info :version)

(assert (= (and mapNonEmpty!59598 ((_ is ValueCellFull!18377) mapValue!59598)) b!1563384))

(assert (= (and b!1563390 ((_ is ValueCellFull!18377) mapDefault!59598)) b!1563382))

(assert (= start!133682 b!1563390))

(declare-fun m!1438257 () Bool)

(assert (=> b!1563385 m!1438257))

(declare-fun m!1438259 () Bool)

(assert (=> b!1563389 m!1438259))

(declare-fun m!1438261 () Bool)

(assert (=> b!1563389 m!1438261))

(declare-fun m!1438263 () Bool)

(assert (=> mapNonEmpty!59598 m!1438263))

(declare-fun m!1438265 () Bool)

(assert (=> start!133682 m!1438265))

(declare-fun m!1438267 () Bool)

(assert (=> start!133682 m!1438267))

(declare-fun m!1438269 () Bool)

(assert (=> start!133682 m!1438269))

(declare-fun m!1438271 () Bool)

(assert (=> b!1563388 m!1438271))

(declare-fun m!1438273 () Bool)

(assert (=> b!1563387 m!1438273))

(assert (=> b!1563387 m!1438273))

(declare-fun m!1438275 () Bool)

(assert (=> b!1563387 m!1438275))

(declare-fun m!1438277 () Bool)

(assert (=> b!1563391 m!1438277))

(check-sat b_and!51647 (not b!1563391) tp_is_empty!38815 (not start!133682) (not b!1563389) (not mapNonEmpty!59598) (not b!1563388) (not b!1563387) (not b_next!32095) (not b!1563385))
(check-sat b_and!51647 (not b_next!32095))
