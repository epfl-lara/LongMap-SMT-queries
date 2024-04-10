; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133752 () Bool)

(assert start!133752)

(declare-fun b_free!32115 () Bool)

(declare-fun b_next!32115 () Bool)

(assert (=> start!133752 (= b_free!32115 (not b_next!32115))))

(declare-fun tp!113549 () Bool)

(declare-fun b_and!51685 () Bool)

(assert (=> start!133752 (= tp!113549 b_and!51685)))

(declare-fun mapIsEmpty!59628 () Bool)

(declare-fun mapRes!59628 () Bool)

(assert (=> mapIsEmpty!59628 mapRes!59628))

(declare-fun res!1069244 () Bool)

(declare-fun e!871687 () Bool)

(assert (=> start!133752 (=> (not res!1069244) (not e!871687))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133752 (= res!1069244 (validMask!0 mask!947))))

(assert (=> start!133752 e!871687))

(assert (=> start!133752 tp!113549))

(declare-fun tp_is_empty!38835 () Bool)

(assert (=> start!133752 tp_is_empty!38835))

(assert (=> start!133752 true))

(declare-datatypes ((array!104362 0))(
  ( (array!104363 (arr!50373 (Array (_ BitVec 32) (_ BitVec 64))) (size!50923 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104362)

(declare-fun array_inv!39147 (array!104362) Bool)

(assert (=> start!133752 (array_inv!39147 _keys!637)))

(declare-datatypes ((V!59987 0))(
  ( (V!59988 (val!19501 Int)) )
))
(declare-datatypes ((ValueCell!18387 0))(
  ( (ValueCellFull!18387 (v!22253 V!59987)) (EmptyCell!18387) )
))
(declare-datatypes ((array!104364 0))(
  ( (array!104365 (arr!50374 (Array (_ BitVec 32) ValueCell!18387)) (size!50924 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104364)

(declare-fun e!871688 () Bool)

(declare-fun array_inv!39148 (array!104364) Bool)

(assert (=> start!133752 (and (array_inv!39148 _values!487) e!871688)))

(declare-fun b!1564000 () Bool)

(declare-fun res!1069239 () Bool)

(assert (=> b!1564000 (=> (not res!1069239) (not e!871687))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564000 (= res!1069239 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50923 _keys!637)) (bvslt from!782 (size!50923 _keys!637))))))

(declare-fun b!1564001 () Bool)

(declare-fun res!1069245 () Bool)

(declare-fun e!871686 () Bool)

(assert (=> b!1564001 (=> (not res!1069245) (not e!871686))))

(declare-datatypes ((tuple2!25162 0))(
  ( (tuple2!25163 (_1!12592 (_ BitVec 64)) (_2!12592 V!59987)) )
))
(declare-datatypes ((List!36548 0))(
  ( (Nil!36545) (Cons!36544 (h!37990 tuple2!25162) (t!51395 List!36548)) )
))
(declare-datatypes ((ListLongMap!22597 0))(
  ( (ListLongMap!22598 (toList!11314 List!36548)) )
))
(declare-fun lt!671994 () ListLongMap!22597)

(declare-fun contains!10304 (ListLongMap!22597 (_ BitVec 64)) Bool)

(assert (=> b!1564001 (= res!1069245 (not (contains!10304 lt!671994 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564002 () Bool)

(declare-fun res!1069241 () Bool)

(assert (=> b!1564002 (=> (not res!1069241) (not e!871687))))

(declare-datatypes ((List!36549 0))(
  ( (Nil!36546) (Cons!36545 (h!37991 (_ BitVec 64)) (t!51396 List!36549)) )
))
(declare-fun arrayNoDuplicates!0 (array!104362 (_ BitVec 32) List!36549) Bool)

(assert (=> b!1564002 (= res!1069241 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36546))))

(declare-fun b!1564003 () Bool)

(declare-fun e!871689 () Bool)

(assert (=> b!1564003 (= e!871689 tp_is_empty!38835)))

(declare-fun b!1564004 () Bool)

(declare-fun e!871685 () Bool)

(assert (=> b!1564004 (= e!871685 tp_is_empty!38835)))

(declare-fun b!1564005 () Bool)

(declare-fun res!1069242 () Bool)

(assert (=> b!1564005 (=> (not res!1069242) (not e!871687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104362 (_ BitVec 32)) Bool)

(assert (=> b!1564005 (= res!1069242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564006 () Bool)

(declare-fun res!1069238 () Bool)

(assert (=> b!1564006 (=> (not res!1069238) (not e!871687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564006 (= res!1069238 (not (validKeyInArray!0 (select (arr!50373 _keys!637) from!782))))))

(declare-fun b!1564007 () Bool)

(assert (=> b!1564007 (= e!871688 (and e!871689 mapRes!59628))))

(declare-fun condMapEmpty!59628 () Bool)

(declare-fun mapDefault!59628 () ValueCell!18387)

(assert (=> b!1564007 (= condMapEmpty!59628 (= (arr!50374 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18387)) mapDefault!59628)))))

(declare-fun b!1564008 () Bool)

(assert (=> b!1564008 (= e!871687 e!871686)))

(declare-fun res!1069240 () Bool)

(assert (=> b!1564008 (=> (not res!1069240) (not e!871686))))

(assert (=> b!1564008 (= res!1069240 (not (contains!10304 lt!671994 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59987)

(declare-fun zeroValue!453 () V!59987)

(declare-fun getCurrentListMapNoExtraKeys!6695 (array!104362 array!104364 (_ BitVec 32) (_ BitVec 32) V!59987 V!59987 (_ BitVec 32) Int) ListLongMap!22597)

(assert (=> b!1564008 (= lt!671994 (getCurrentListMapNoExtraKeys!6695 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59628 () Bool)

(declare-fun tp!113550 () Bool)

(assert (=> mapNonEmpty!59628 (= mapRes!59628 (and tp!113550 e!871685))))

(declare-fun mapRest!59628 () (Array (_ BitVec 32) ValueCell!18387))

(declare-fun mapKey!59628 () (_ BitVec 32))

(declare-fun mapValue!59628 () ValueCell!18387)

(assert (=> mapNonEmpty!59628 (= (arr!50374 _values!487) (store mapRest!59628 mapKey!59628 mapValue!59628))))

(declare-fun b!1564009 () Bool)

(assert (=> b!1564009 (= e!871686 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun b!1564010 () Bool)

(declare-fun res!1069243 () Bool)

(assert (=> b!1564010 (=> (not res!1069243) (not e!871687))))

(assert (=> b!1564010 (= res!1069243 (and (= (size!50924 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50923 _keys!637) (size!50924 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133752 res!1069244) b!1564010))

(assert (= (and b!1564010 res!1069243) b!1564005))

(assert (= (and b!1564005 res!1069242) b!1564002))

(assert (= (and b!1564002 res!1069241) b!1564000))

(assert (= (and b!1564000 res!1069239) b!1564006))

(assert (= (and b!1564006 res!1069238) b!1564008))

(assert (= (and b!1564008 res!1069240) b!1564001))

(assert (= (and b!1564001 res!1069245) b!1564009))

(assert (= (and b!1564007 condMapEmpty!59628) mapIsEmpty!59628))

(assert (= (and b!1564007 (not condMapEmpty!59628)) mapNonEmpty!59628))

(get-info :version)

(assert (= (and mapNonEmpty!59628 ((_ is ValueCellFull!18387) mapValue!59628)) b!1564004))

(assert (= (and b!1564007 ((_ is ValueCellFull!18387) mapDefault!59628)) b!1564003))

(assert (= start!133752 b!1564007))

(declare-fun m!1439369 () Bool)

(assert (=> start!133752 m!1439369))

(declare-fun m!1439371 () Bool)

(assert (=> start!133752 m!1439371))

(declare-fun m!1439373 () Bool)

(assert (=> start!133752 m!1439373))

(declare-fun m!1439375 () Bool)

(assert (=> b!1564001 m!1439375))

(declare-fun m!1439377 () Bool)

(assert (=> mapNonEmpty!59628 m!1439377))

(declare-fun m!1439379 () Bool)

(assert (=> b!1564008 m!1439379))

(declare-fun m!1439381 () Bool)

(assert (=> b!1564008 m!1439381))

(declare-fun m!1439383 () Bool)

(assert (=> b!1564005 m!1439383))

(declare-fun m!1439385 () Bool)

(assert (=> b!1564002 m!1439385))

(declare-fun m!1439387 () Bool)

(assert (=> b!1564006 m!1439387))

(assert (=> b!1564006 m!1439387))

(declare-fun m!1439389 () Bool)

(assert (=> b!1564006 m!1439389))

(check-sat (not b!1564005) (not b!1564006) b_and!51685 (not b_next!32115) tp_is_empty!38835 (not mapNonEmpty!59628) (not b!1564001) (not start!133752) (not b!1564002) (not b!1564008))
(check-sat b_and!51685 (not b_next!32115))
