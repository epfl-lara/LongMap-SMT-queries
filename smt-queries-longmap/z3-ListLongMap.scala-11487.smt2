; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133722 () Bool)

(assert start!133722)

(declare-fun b_free!32085 () Bool)

(declare-fun b_next!32085 () Bool)

(assert (=> start!133722 (= b_free!32085 (not b_next!32085))))

(declare-fun tp!113459 () Bool)

(declare-fun b_and!51655 () Bool)

(assert (=> start!133722 (= tp!113459 b_and!51655)))

(declare-fun b!1563545 () Bool)

(declare-fun res!1068919 () Bool)

(declare-fun e!871416 () Bool)

(assert (=> b!1563545 (=> (not res!1068919) (not e!871416))))

(declare-datatypes ((array!104306 0))(
  ( (array!104307 (arr!50345 (Array (_ BitVec 32) (_ BitVec 64))) (size!50895 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104306)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104306 (_ BitVec 32)) Bool)

(assert (=> b!1563545 (= res!1068919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563546 () Bool)

(declare-fun res!1068924 () Bool)

(assert (=> b!1563546 (=> (not res!1068924) (not e!871416))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59947 0))(
  ( (V!59948 (val!19486 Int)) )
))
(declare-datatypes ((ValueCell!18372 0))(
  ( (ValueCellFull!18372 (v!22238 V!59947)) (EmptyCell!18372) )
))
(declare-datatypes ((array!104308 0))(
  ( (array!104309 (arr!50346 (Array (_ BitVec 32) ValueCell!18372)) (size!50896 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104308)

(assert (=> b!1563546 (= res!1068924 (and (= (size!50896 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50895 _keys!637) (size!50896 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563547 () Bool)

(declare-fun res!1068920 () Bool)

(assert (=> b!1563547 (=> (not res!1068920) (not e!871416))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563547 (= res!1068920 (not (validKeyInArray!0 (select (arr!50345 _keys!637) from!782))))))

(declare-fun b!1563548 () Bool)

(declare-fun e!871420 () Bool)

(declare-fun tp_is_empty!38805 () Bool)

(assert (=> b!1563548 (= e!871420 tp_is_empty!38805)))

(declare-fun b!1563549 () Bool)

(declare-fun e!871418 () Bool)

(declare-fun e!871419 () Bool)

(declare-fun mapRes!59583 () Bool)

(assert (=> b!1563549 (= e!871418 (and e!871419 mapRes!59583))))

(declare-fun condMapEmpty!59583 () Bool)

(declare-fun mapDefault!59583 () ValueCell!18372)

(assert (=> b!1563549 (= condMapEmpty!59583 (= (arr!50346 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18372)) mapDefault!59583)))))

(declare-fun res!1068923 () Bool)

(assert (=> start!133722 (=> (not res!1068923) (not e!871416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133722 (= res!1068923 (validMask!0 mask!947))))

(assert (=> start!133722 e!871416))

(assert (=> start!133722 tp!113459))

(assert (=> start!133722 tp_is_empty!38805))

(assert (=> start!133722 true))

(declare-fun array_inv!39123 (array!104306) Bool)

(assert (=> start!133722 (array_inv!39123 _keys!637)))

(declare-fun array_inv!39124 (array!104308) Bool)

(assert (=> start!133722 (and (array_inv!39124 _values!487) e!871418)))

(declare-fun b!1563550 () Bool)

(declare-fun e!871417 () Bool)

(assert (=> b!1563550 (= e!871417 false)))

(declare-fun lt!671909 () Bool)

(declare-datatypes ((tuple2!25140 0))(
  ( (tuple2!25141 (_1!12581 (_ BitVec 64)) (_2!12581 V!59947)) )
))
(declare-datatypes ((List!36524 0))(
  ( (Nil!36521) (Cons!36520 (h!37966 tuple2!25140) (t!51371 List!36524)) )
))
(declare-datatypes ((ListLongMap!22575 0))(
  ( (ListLongMap!22576 (toList!11303 List!36524)) )
))
(declare-fun lt!671910 () ListLongMap!22575)

(declare-fun contains!10293 (ListLongMap!22575 (_ BitVec 64)) Bool)

(assert (=> b!1563550 (= lt!671909 (contains!10293 lt!671910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563551 () Bool)

(declare-fun res!1068918 () Bool)

(assert (=> b!1563551 (=> (not res!1068918) (not e!871416))))

(declare-datatypes ((List!36525 0))(
  ( (Nil!36522) (Cons!36521 (h!37967 (_ BitVec 64)) (t!51372 List!36525)) )
))
(declare-fun arrayNoDuplicates!0 (array!104306 (_ BitVec 32) List!36525) Bool)

(assert (=> b!1563551 (= res!1068918 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36522))))

(declare-fun b!1563552 () Bool)

(assert (=> b!1563552 (= e!871419 tp_is_empty!38805)))

(declare-fun b!1563553 () Bool)

(declare-fun res!1068921 () Bool)

(assert (=> b!1563553 (=> (not res!1068921) (not e!871416))))

(assert (=> b!1563553 (= res!1068921 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50895 _keys!637)) (bvslt from!782 (size!50895 _keys!637))))))

(declare-fun b!1563554 () Bool)

(assert (=> b!1563554 (= e!871416 e!871417)))

(declare-fun res!1068922 () Bool)

(assert (=> b!1563554 (=> (not res!1068922) (not e!871417))))

(assert (=> b!1563554 (= res!1068922 (not (contains!10293 lt!671910 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!453 () V!59947)

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59947)

(declare-fun getCurrentListMapNoExtraKeys!6686 (array!104306 array!104308 (_ BitVec 32) (_ BitVec 32) V!59947 V!59947 (_ BitVec 32) Int) ListLongMap!22575)

(assert (=> b!1563554 (= lt!671910 (getCurrentListMapNoExtraKeys!6686 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59583 () Bool)

(assert (=> mapIsEmpty!59583 mapRes!59583))

(declare-fun mapNonEmpty!59583 () Bool)

(declare-fun tp!113460 () Bool)

(assert (=> mapNonEmpty!59583 (= mapRes!59583 (and tp!113460 e!871420))))

(declare-fun mapRest!59583 () (Array (_ BitVec 32) ValueCell!18372))

(declare-fun mapValue!59583 () ValueCell!18372)

(declare-fun mapKey!59583 () (_ BitVec 32))

(assert (=> mapNonEmpty!59583 (= (arr!50346 _values!487) (store mapRest!59583 mapKey!59583 mapValue!59583))))

(assert (= (and start!133722 res!1068923) b!1563546))

(assert (= (and b!1563546 res!1068924) b!1563545))

(assert (= (and b!1563545 res!1068919) b!1563551))

(assert (= (and b!1563551 res!1068918) b!1563553))

(assert (= (and b!1563553 res!1068921) b!1563547))

(assert (= (and b!1563547 res!1068920) b!1563554))

(assert (= (and b!1563554 res!1068922) b!1563550))

(assert (= (and b!1563549 condMapEmpty!59583) mapIsEmpty!59583))

(assert (= (and b!1563549 (not condMapEmpty!59583)) mapNonEmpty!59583))

(get-info :version)

(assert (= (and mapNonEmpty!59583 ((_ is ValueCellFull!18372) mapValue!59583)) b!1563548))

(assert (= (and b!1563549 ((_ is ValueCellFull!18372) mapDefault!59583)) b!1563552))

(assert (= start!133722 b!1563549))

(declare-fun m!1439039 () Bool)

(assert (=> b!1563545 m!1439039))

(declare-fun m!1439041 () Bool)

(assert (=> start!133722 m!1439041))

(declare-fun m!1439043 () Bool)

(assert (=> start!133722 m!1439043))

(declare-fun m!1439045 () Bool)

(assert (=> start!133722 m!1439045))

(declare-fun m!1439047 () Bool)

(assert (=> b!1563550 m!1439047))

(declare-fun m!1439049 () Bool)

(assert (=> b!1563551 m!1439049))

(declare-fun m!1439051 () Bool)

(assert (=> b!1563547 m!1439051))

(assert (=> b!1563547 m!1439051))

(declare-fun m!1439053 () Bool)

(assert (=> b!1563547 m!1439053))

(declare-fun m!1439055 () Bool)

(assert (=> mapNonEmpty!59583 m!1439055))

(declare-fun m!1439057 () Bool)

(assert (=> b!1563554 m!1439057))

(declare-fun m!1439059 () Bool)

(assert (=> b!1563554 m!1439059))

(check-sat (not b!1563554) (not mapNonEmpty!59583) (not b!1563545) (not start!133722) (not b!1563547) (not b!1563550) b_and!51655 (not b_next!32085) (not b!1563551) tp_is_empty!38805)
(check-sat b_and!51655 (not b_next!32085))
