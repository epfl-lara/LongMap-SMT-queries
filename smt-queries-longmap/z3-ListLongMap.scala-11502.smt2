; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133808 () Bool)

(assert start!133808)

(declare-fun b_free!32119 () Bool)

(declare-fun b_next!32119 () Bool)

(assert (=> start!133808 (= b_free!32119 (not b_next!32119))))

(declare-fun tp!113654 () Bool)

(declare-fun b_and!51671 () Bool)

(assert (=> start!133808 (= tp!113654 b_and!51671)))

(declare-fun b!1564604 () Bool)

(declare-fun e!872062 () Bool)

(assert (=> b!1564604 (= e!872062 false)))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((V!60065 0))(
  ( (V!60066 (val!19530 Int)) )
))
(declare-fun zeroValue!453 () V!60065)

(declare-datatypes ((tuple2!25276 0))(
  ( (tuple2!25277 (_1!12649 (_ BitVec 64)) (_2!12649 V!60065)) )
))
(declare-datatypes ((List!36633 0))(
  ( (Nil!36630) (Cons!36629 (h!38076 tuple2!25276) (t!51472 List!36633)) )
))
(declare-datatypes ((ListLongMap!22711 0))(
  ( (ListLongMap!22712 (toList!11371 List!36633)) )
))
(declare-fun lt!671833 () ListLongMap!22711)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60065)

(declare-datatypes ((array!104404 0))(
  ( (array!104405 (arr!50392 (Array (_ BitVec 32) (_ BitVec 64))) (size!50944 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104404)

(declare-datatypes ((ValueCell!18416 0))(
  ( (ValueCellFull!18416 (v!22280 V!60065)) (EmptyCell!18416) )
))
(declare-datatypes ((array!104406 0))(
  ( (array!104407 (arr!50393 (Array (_ BitVec 32) ValueCell!18416)) (size!50945 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104406)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6723 (array!104404 array!104406 (_ BitVec 32) (_ BitVec 32) V!60065 V!60065 (_ BitVec 32) Int) ListLongMap!22711)

(assert (=> b!1564604 (= lt!671833 (getCurrentListMapNoExtraKeys!6723 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564605 () Bool)

(declare-fun res!1069673 () Bool)

(assert (=> b!1564605 (=> (not res!1069673) (not e!872062))))

(assert (=> b!1564605 (= res!1069673 (and (= (size!50945 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50944 _keys!637) (size!50945 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564606 () Bool)

(declare-fun res!1069678 () Bool)

(assert (=> b!1564606 (=> (not res!1069678) (not e!872062))))

(assert (=> b!1564606 (= res!1069678 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50944 _keys!637)) (bvslt from!782 (size!50944 _keys!637))))))

(declare-fun b!1564607 () Bool)

(declare-fun e!872060 () Bool)

(declare-fun e!872061 () Bool)

(declare-fun mapRes!59725 () Bool)

(assert (=> b!1564607 (= e!872060 (and e!872061 mapRes!59725))))

(declare-fun condMapEmpty!59725 () Bool)

(declare-fun mapDefault!59725 () ValueCell!18416)

(assert (=> b!1564607 (= condMapEmpty!59725 (= (arr!50393 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18416)) mapDefault!59725)))))

(declare-fun mapNonEmpty!59725 () Bool)

(declare-fun tp!113653 () Bool)

(declare-fun e!872058 () Bool)

(assert (=> mapNonEmpty!59725 (= mapRes!59725 (and tp!113653 e!872058))))

(declare-fun mapRest!59725 () (Array (_ BitVec 32) ValueCell!18416))

(declare-fun mapValue!59725 () ValueCell!18416)

(declare-fun mapKey!59725 () (_ BitVec 32))

(assert (=> mapNonEmpty!59725 (= (arr!50393 _values!487) (store mapRest!59725 mapKey!59725 mapValue!59725))))

(declare-fun b!1564608 () Bool)

(declare-fun res!1069674 () Bool)

(assert (=> b!1564608 (=> (not res!1069674) (not e!872062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564608 (= res!1069674 (validKeyInArray!0 (select (arr!50392 _keys!637) from!782)))))

(declare-fun b!1564609 () Bool)

(declare-fun tp_is_empty!38893 () Bool)

(assert (=> b!1564609 (= e!872061 tp_is_empty!38893)))

(declare-fun b!1564610 () Bool)

(declare-fun res!1069677 () Bool)

(assert (=> b!1564610 (=> (not res!1069677) (not e!872062))))

(declare-datatypes ((List!36634 0))(
  ( (Nil!36631) (Cons!36630 (h!38077 (_ BitVec 64)) (t!51473 List!36634)) )
))
(declare-fun arrayNoDuplicates!0 (array!104404 (_ BitVec 32) List!36634) Bool)

(assert (=> b!1564610 (= res!1069677 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36631))))

(declare-fun res!1069675 () Bool)

(assert (=> start!133808 (=> (not res!1069675) (not e!872062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133808 (= res!1069675 (validMask!0 mask!947))))

(assert (=> start!133808 e!872062))

(assert (=> start!133808 tp!113654))

(assert (=> start!133808 tp_is_empty!38893))

(assert (=> start!133808 true))

(declare-fun array_inv!39361 (array!104404) Bool)

(assert (=> start!133808 (array_inv!39361 _keys!637)))

(declare-fun array_inv!39362 (array!104406) Bool)

(assert (=> start!133808 (and (array_inv!39362 _values!487) e!872060)))

(declare-fun mapIsEmpty!59725 () Bool)

(assert (=> mapIsEmpty!59725 mapRes!59725))

(declare-fun b!1564611 () Bool)

(declare-fun res!1069676 () Bool)

(assert (=> b!1564611 (=> (not res!1069676) (not e!872062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104404 (_ BitVec 32)) Bool)

(assert (=> b!1564611 (= res!1069676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564612 () Bool)

(assert (=> b!1564612 (= e!872058 tp_is_empty!38893)))

(assert (= (and start!133808 res!1069675) b!1564605))

(assert (= (and b!1564605 res!1069673) b!1564611))

(assert (= (and b!1564611 res!1069676) b!1564610))

(assert (= (and b!1564610 res!1069677) b!1564606))

(assert (= (and b!1564606 res!1069678) b!1564608))

(assert (= (and b!1564608 res!1069674) b!1564604))

(assert (= (and b!1564607 condMapEmpty!59725) mapIsEmpty!59725))

(assert (= (and b!1564607 (not condMapEmpty!59725)) mapNonEmpty!59725))

(get-info :version)

(assert (= (and mapNonEmpty!59725 ((_ is ValueCellFull!18416) mapValue!59725)) b!1564612))

(assert (= (and b!1564607 ((_ is ValueCellFull!18416) mapDefault!59725)) b!1564609))

(assert (= start!133808 b!1564607))

(declare-fun m!1439055 () Bool)

(assert (=> b!1564608 m!1439055))

(assert (=> b!1564608 m!1439055))

(declare-fun m!1439057 () Bool)

(assert (=> b!1564608 m!1439057))

(declare-fun m!1439059 () Bool)

(assert (=> b!1564604 m!1439059))

(declare-fun m!1439061 () Bool)

(assert (=> b!1564610 m!1439061))

(declare-fun m!1439063 () Bool)

(assert (=> start!133808 m!1439063))

(declare-fun m!1439065 () Bool)

(assert (=> start!133808 m!1439065))

(declare-fun m!1439067 () Bool)

(assert (=> start!133808 m!1439067))

(declare-fun m!1439069 () Bool)

(assert (=> b!1564611 m!1439069))

(declare-fun m!1439071 () Bool)

(assert (=> mapNonEmpty!59725 m!1439071))

(check-sat (not mapNonEmpty!59725) (not b!1564611) (not b!1564604) (not b_next!32119) (not b!1564608) tp_is_empty!38893 b_and!51671 (not b!1564610) (not start!133808))
(check-sat b_and!51671 (not b_next!32119))
