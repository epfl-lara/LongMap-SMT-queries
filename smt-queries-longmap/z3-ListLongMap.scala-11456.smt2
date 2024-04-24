; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133946 () Bool)

(assert start!133946)

(declare-fun b_free!31951 () Bool)

(declare-fun b_next!31951 () Bool)

(assert (=> start!133946 (= b_free!31951 (not b_next!31951))))

(declare-fun tp!112976 () Bool)

(declare-fun b_and!51415 () Bool)

(assert (=> start!133946 (= tp!112976 b_and!51415)))

(declare-fun b!1563501 () Bool)

(declare-fun res!1068252 () Bool)

(declare-fun e!871467 () Bool)

(assert (=> b!1563501 (=> (not res!1068252) (not e!871467))))

(declare-datatypes ((array!104068 0))(
  ( (array!104069 (arr!50219 (Array (_ BitVec 32) (_ BitVec 64))) (size!50770 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104068)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563501 (= res!1068252 (validKeyInArray!0 (select (arr!50219 _keys!637) from!782)))))

(declare-fun b!1563502 () Bool)

(assert (=> b!1563502 (= e!871467 (not true))))

(declare-datatypes ((V!59697 0))(
  ( (V!59698 (val!19392 Int)) )
))
(declare-datatypes ((tuple2!25106 0))(
  ( (tuple2!25107 (_1!12564 (_ BitVec 64)) (_2!12564 V!59697)) )
))
(declare-datatypes ((List!36446 0))(
  ( (Nil!36443) (Cons!36442 (h!37906 tuple2!25106) (t!51179 List!36446)) )
))
(declare-datatypes ((ListLongMap!22549 0))(
  ( (ListLongMap!22550 (toList!11290 List!36446)) )
))
(declare-fun lt!672003 () ListLongMap!22549)

(declare-fun lt!672004 () V!59697)

(declare-fun contains!10291 (ListLongMap!22549 (_ BitVec 64)) Bool)

(declare-fun +!5066 (ListLongMap!22549 tuple2!25106) ListLongMap!22549)

(assert (=> b!1563502 (not (contains!10291 (+!5066 lt!672003 (tuple2!25107 (select (arr!50219 _keys!637) from!782) lt!672004)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51817 0))(
  ( (Unit!51818) )
))
(declare-fun lt!672005 () Unit!51817)

(declare-fun addStillNotContains!517 (ListLongMap!22549 (_ BitVec 64) V!59697 (_ BitVec 64)) Unit!51817)

(assert (=> b!1563502 (= lt!672005 (addStillNotContains!517 lt!672003 (select (arr!50219 _keys!637) from!782) lt!672004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18278 0))(
  ( (ValueCellFull!18278 (v!22136 V!59697)) (EmptyCell!18278) )
))
(declare-datatypes ((array!104070 0))(
  ( (array!104071 (arr!50220 (Array (_ BitVec 32) ValueCell!18278)) (size!50771 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104070)

(declare-fun get!26228 (ValueCell!18278 V!59697) V!59697)

(declare-fun dynLambda!3864 (Int (_ BitVec 64)) V!59697)

(assert (=> b!1563502 (= lt!672004 (get!26228 (select (arr!50220 _values!487) from!782) (dynLambda!3864 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59697)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59697)

(declare-fun getCurrentListMapNoExtraKeys!6689 (array!104068 array!104070 (_ BitVec 32) (_ BitVec 32) V!59697 V!59697 (_ BitVec 32) Int) ListLongMap!22549)

(assert (=> b!1563502 (= lt!672003 (getCurrentListMapNoExtraKeys!6689 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563503 () Bool)

(declare-fun e!871465 () Bool)

(declare-fun e!871466 () Bool)

(declare-fun mapRes!59301 () Bool)

(assert (=> b!1563503 (= e!871465 (and e!871466 mapRes!59301))))

(declare-fun condMapEmpty!59301 () Bool)

(declare-fun mapDefault!59301 () ValueCell!18278)

(assert (=> b!1563503 (= condMapEmpty!59301 (= (arr!50220 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18278)) mapDefault!59301)))))

(declare-fun b!1563504 () Bool)

(declare-fun e!871464 () Bool)

(declare-fun tp_is_empty!38617 () Bool)

(assert (=> b!1563504 (= e!871464 tp_is_empty!38617)))

(declare-fun b!1563506 () Bool)

(declare-fun res!1068255 () Bool)

(assert (=> b!1563506 (=> (not res!1068255) (not e!871467))))

(assert (=> b!1563506 (= res!1068255 (and (= (size!50771 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50770 _keys!637) (size!50771 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563507 () Bool)

(declare-fun res!1068253 () Bool)

(assert (=> b!1563507 (=> (not res!1068253) (not e!871467))))

(declare-datatypes ((List!36447 0))(
  ( (Nil!36444) (Cons!36443 (h!37907 (_ BitVec 64)) (t!51180 List!36447)) )
))
(declare-fun arrayNoDuplicates!0 (array!104068 (_ BitVec 32) List!36447) Bool)

(assert (=> b!1563507 (= res!1068253 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36444))))

(declare-fun mapIsEmpty!59301 () Bool)

(assert (=> mapIsEmpty!59301 mapRes!59301))

(declare-fun mapNonEmpty!59301 () Bool)

(declare-fun tp!112977 () Bool)

(assert (=> mapNonEmpty!59301 (= mapRes!59301 (and tp!112977 e!871464))))

(declare-fun mapKey!59301 () (_ BitVec 32))

(declare-fun mapValue!59301 () ValueCell!18278)

(declare-fun mapRest!59301 () (Array (_ BitVec 32) ValueCell!18278))

(assert (=> mapNonEmpty!59301 (= (arr!50220 _values!487) (store mapRest!59301 mapKey!59301 mapValue!59301))))

(declare-fun b!1563508 () Bool)

(assert (=> b!1563508 (= e!871466 tp_is_empty!38617)))

(declare-fun b!1563509 () Bool)

(declare-fun res!1068257 () Bool)

(assert (=> b!1563509 (=> (not res!1068257) (not e!871467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104068 (_ BitVec 32)) Bool)

(assert (=> b!1563509 (= res!1068257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1068254 () Bool)

(assert (=> start!133946 (=> (not res!1068254) (not e!871467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133946 (= res!1068254 (validMask!0 mask!947))))

(assert (=> start!133946 e!871467))

(assert (=> start!133946 tp!112976))

(assert (=> start!133946 tp_is_empty!38617))

(assert (=> start!133946 true))

(declare-fun array_inv!39281 (array!104068) Bool)

(assert (=> start!133946 (array_inv!39281 _keys!637)))

(declare-fun array_inv!39282 (array!104070) Bool)

(assert (=> start!133946 (and (array_inv!39282 _values!487) e!871465)))

(declare-fun b!1563505 () Bool)

(declare-fun res!1068256 () Bool)

(assert (=> b!1563505 (=> (not res!1068256) (not e!871467))))

(assert (=> b!1563505 (= res!1068256 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50770 _keys!637)) (bvslt from!782 (size!50770 _keys!637))))))

(assert (= (and start!133946 res!1068254) b!1563506))

(assert (= (and b!1563506 res!1068255) b!1563509))

(assert (= (and b!1563509 res!1068257) b!1563507))

(assert (= (and b!1563507 res!1068253) b!1563505))

(assert (= (and b!1563505 res!1068256) b!1563501))

(assert (= (and b!1563501 res!1068252) b!1563502))

(assert (= (and b!1563503 condMapEmpty!59301) mapIsEmpty!59301))

(assert (= (and b!1563503 (not condMapEmpty!59301)) mapNonEmpty!59301))

(get-info :version)

(assert (= (and mapNonEmpty!59301 ((_ is ValueCellFull!18278) mapValue!59301)) b!1563504))

(assert (= (and b!1563503 ((_ is ValueCellFull!18278) mapDefault!59301)) b!1563508))

(assert (= start!133946 b!1563503))

(declare-fun b_lambda!24819 () Bool)

(assert (=> (not b_lambda!24819) (not b!1563502)))

(declare-fun t!51178 () Bool)

(declare-fun tb!12487 () Bool)

(assert (=> (and start!133946 (= defaultEntry!495 defaultEntry!495) t!51178) tb!12487))

(declare-fun result!26263 () Bool)

(assert (=> tb!12487 (= result!26263 tp_is_empty!38617)))

(assert (=> b!1563502 t!51178))

(declare-fun b_and!51417 () Bool)

(assert (= b_and!51415 (and (=> t!51178 result!26263) b_and!51417)))

(declare-fun m!1438989 () Bool)

(assert (=> mapNonEmpty!59301 m!1438989))

(declare-fun m!1438991 () Bool)

(assert (=> b!1563501 m!1438991))

(assert (=> b!1563501 m!1438991))

(declare-fun m!1438993 () Bool)

(assert (=> b!1563501 m!1438993))

(declare-fun m!1438995 () Bool)

(assert (=> b!1563509 m!1438995))

(declare-fun m!1438997 () Bool)

(assert (=> start!133946 m!1438997))

(declare-fun m!1438999 () Bool)

(assert (=> start!133946 m!1438999))

(declare-fun m!1439001 () Bool)

(assert (=> start!133946 m!1439001))

(declare-fun m!1439003 () Bool)

(assert (=> b!1563507 m!1439003))

(declare-fun m!1439005 () Bool)

(assert (=> b!1563502 m!1439005))

(declare-fun m!1439007 () Bool)

(assert (=> b!1563502 m!1439007))

(declare-fun m!1439009 () Bool)

(assert (=> b!1563502 m!1439009))

(declare-fun m!1439011 () Bool)

(assert (=> b!1563502 m!1439011))

(assert (=> b!1563502 m!1439005))

(assert (=> b!1563502 m!1438991))

(assert (=> b!1563502 m!1438991))

(declare-fun m!1439013 () Bool)

(assert (=> b!1563502 m!1439013))

(assert (=> b!1563502 m!1439011))

(declare-fun m!1439015 () Bool)

(assert (=> b!1563502 m!1439015))

(assert (=> b!1563502 m!1439007))

(declare-fun m!1439017 () Bool)

(assert (=> b!1563502 m!1439017))

(check-sat (not b!1563502) (not b!1563501) (not b_next!31951) (not b!1563509) (not b!1563507) tp_is_empty!38617 (not start!133946) b_and!51417 (not mapNonEmpty!59301) (not b_lambda!24819))
(check-sat b_and!51417 (not b_next!31951))
