; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133358 () Bool)

(assert start!133358)

(declare-fun b!1559261 () Bool)

(declare-fun e!868813 () Bool)

(declare-fun e!868812 () Bool)

(declare-fun mapRes!59112 () Bool)

(assert (=> b!1559261 (= e!868813 (and e!868812 mapRes!59112))))

(declare-fun condMapEmpty!59112 () Bool)

(declare-datatypes ((V!59529 0))(
  ( (V!59530 (val!19329 Int)) )
))
(declare-datatypes ((ValueCell!18215 0))(
  ( (ValueCellFull!18215 (v!22077 V!59529)) (EmptyCell!18215) )
))
(declare-datatypes ((array!103632 0))(
  ( (array!103633 (arr!50009 (Array (_ BitVec 32) ValueCell!18215)) (size!50561 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103632)

(declare-fun mapDefault!59112 () ValueCell!18215)

(assert (=> b!1559261 (= condMapEmpty!59112 (= (arr!50009 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18215)) mapDefault!59112)))))

(declare-fun mapNonEmpty!59112 () Bool)

(declare-fun tp!112768 () Bool)

(declare-fun e!868816 () Bool)

(assert (=> mapNonEmpty!59112 (= mapRes!59112 (and tp!112768 e!868816))))

(declare-fun mapKey!59112 () (_ BitVec 32))

(declare-fun mapValue!59112 () ValueCell!18215)

(declare-fun mapRest!59112 () (Array (_ BitVec 32) ValueCell!18215))

(assert (=> mapNonEmpty!59112 (= (arr!50009 _values!487) (store mapRest!59112 mapKey!59112 mapValue!59112))))

(declare-fun b!1559262 () Bool)

(declare-fun res!1066350 () Bool)

(declare-fun e!868814 () Bool)

(assert (=> b!1559262 (=> (not res!1066350) (not e!868814))))

(declare-datatypes ((array!103634 0))(
  ( (array!103635 (arr!50010 (Array (_ BitVec 32) (_ BitVec 64))) (size!50562 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103634)

(declare-datatypes ((List!36394 0))(
  ( (Nil!36391) (Cons!36390 (h!37837 (_ BitVec 64)) (t!51119 List!36394)) )
))
(declare-fun arrayNoDuplicates!0 (array!103634 (_ BitVec 32) List!36394) Bool)

(assert (=> b!1559262 (= res!1066350 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36391))))

(declare-fun b!1559263 () Bool)

(declare-fun tp_is_empty!38491 () Bool)

(assert (=> b!1559263 (= e!868812 tp_is_empty!38491)))

(declare-fun res!1066345 () Bool)

(assert (=> start!133358 (=> (not res!1066345) (not e!868814))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133358 (= res!1066345 (validMask!0 mask!947))))

(assert (=> start!133358 e!868814))

(assert (=> start!133358 true))

(declare-fun array_inv!39079 (array!103634) Bool)

(assert (=> start!133358 (array_inv!39079 _keys!637)))

(declare-fun array_inv!39080 (array!103632) Bool)

(assert (=> start!133358 (and (array_inv!39080 _values!487) e!868813)))

(declare-fun mapIsEmpty!59112 () Bool)

(assert (=> mapIsEmpty!59112 mapRes!59112))

(declare-fun b!1559264 () Bool)

(assert (=> b!1559264 (= e!868814 false)))

(declare-fun lt!670607 () Bool)

(declare-datatypes ((tuple2!25070 0))(
  ( (tuple2!25071 (_1!12546 (_ BitVec 64)) (_2!12546 V!59529)) )
))
(declare-datatypes ((List!36395 0))(
  ( (Nil!36392) (Cons!36391 (h!37838 tuple2!25070) (t!51120 List!36395)) )
))
(declare-datatypes ((ListLongMap!22505 0))(
  ( (ListLongMap!22506 (toList!11268 List!36395)) )
))
(declare-fun contains!10178 (ListLongMap!22505 (_ BitVec 64)) Bool)

(assert (=> b!1559264 (= lt!670607 (contains!10178 (ListLongMap!22506 Nil!36392) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559265 () Bool)

(declare-fun res!1066347 () Bool)

(assert (=> b!1559265 (=> (not res!1066347) (not e!868814))))

(assert (=> b!1559265 (= res!1066347 (not (contains!10178 (ListLongMap!22506 Nil!36392) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559266 () Bool)

(declare-fun res!1066346 () Bool)

(assert (=> b!1559266 (=> (not res!1066346) (not e!868814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103634 (_ BitVec 32)) Bool)

(assert (=> b!1559266 (= res!1066346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559267 () Bool)

(assert (=> b!1559267 (= e!868816 tp_is_empty!38491)))

(declare-fun b!1559268 () Bool)

(declare-fun res!1066349 () Bool)

(assert (=> b!1559268 (=> (not res!1066349) (not e!868814))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559268 (= res!1066349 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50562 _keys!637)) (bvsge from!782 (size!50562 _keys!637))))))

(declare-fun b!1559269 () Bool)

(declare-fun res!1066348 () Bool)

(assert (=> b!1559269 (=> (not res!1066348) (not e!868814))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559269 (= res!1066348 (and (= (size!50561 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50562 _keys!637) (size!50561 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133358 res!1066345) b!1559269))

(assert (= (and b!1559269 res!1066348) b!1559266))

(assert (= (and b!1559266 res!1066346) b!1559262))

(assert (= (and b!1559262 res!1066350) b!1559268))

(assert (= (and b!1559268 res!1066349) b!1559265))

(assert (= (and b!1559265 res!1066347) b!1559264))

(assert (= (and b!1559261 condMapEmpty!59112) mapIsEmpty!59112))

(assert (= (and b!1559261 (not condMapEmpty!59112)) mapNonEmpty!59112))

(get-info :version)

(assert (= (and mapNonEmpty!59112 ((_ is ValueCellFull!18215) mapValue!59112)) b!1559267))

(assert (= (and b!1559261 ((_ is ValueCellFull!18215) mapDefault!59112)) b!1559263))

(assert (= start!133358 b!1559261))

(declare-fun m!1434873 () Bool)

(assert (=> mapNonEmpty!59112 m!1434873))

(declare-fun m!1434875 () Bool)

(assert (=> b!1559262 m!1434875))

(declare-fun m!1434877 () Bool)

(assert (=> b!1559264 m!1434877))

(declare-fun m!1434879 () Bool)

(assert (=> b!1559266 m!1434879))

(declare-fun m!1434881 () Bool)

(assert (=> b!1559265 m!1434881))

(declare-fun m!1434883 () Bool)

(assert (=> start!133358 m!1434883))

(declare-fun m!1434885 () Bool)

(assert (=> start!133358 m!1434885))

(declare-fun m!1434887 () Bool)

(assert (=> start!133358 m!1434887))

(check-sat tp_is_empty!38491 (not b!1559262) (not b!1559265) (not b!1559266) (not mapNonEmpty!59112) (not b!1559264) (not start!133358))
(check-sat)
