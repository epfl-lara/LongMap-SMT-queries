; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134132 () Bool)

(assert start!134132)

(declare-fun b_free!32083 () Bool)

(declare-fun b_next!32083 () Bool)

(assert (=> start!134132 (= b_free!32083 (not b_next!32083))))

(declare-fun tp!113454 () Bool)

(declare-fun b_and!51655 () Bool)

(assert (=> start!134132 (= tp!113454 b_and!51655)))

(declare-fun b!1565951 () Bool)

(declare-fun res!1069763 () Bool)

(declare-fun e!872910 () Bool)

(assert (=> b!1565951 (=> (not res!1069763) (not e!872910))))

(declare-datatypes ((array!104426 0))(
  ( (array!104427 (arr!50398 (Array (_ BitVec 32) (_ BitVec 64))) (size!50949 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104426)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104426 (_ BitVec 32)) Bool)

(assert (=> b!1565951 (= res!1069763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59580 () Bool)

(declare-fun mapRes!59580 () Bool)

(assert (=> mapIsEmpty!59580 mapRes!59580))

(declare-fun b!1565952 () Bool)

(declare-fun e!872909 () Bool)

(assert (=> b!1565952 (= e!872909 false)))

(declare-fun lt!672811 () Bool)

(declare-datatypes ((V!59945 0))(
  ( (V!59946 (val!19485 Int)) )
))
(declare-datatypes ((tuple2!25196 0))(
  ( (tuple2!25197 (_1!12609 (_ BitVec 64)) (_2!12609 V!59945)) )
))
(declare-datatypes ((List!36560 0))(
  ( (Nil!36557) (Cons!36556 (h!38020 tuple2!25196) (t!51399 List!36560)) )
))
(declare-datatypes ((ListLongMap!22639 0))(
  ( (ListLongMap!22640 (toList!11335 List!36560)) )
))
(declare-fun lt!672812 () ListLongMap!22639)

(declare-fun contains!10336 (ListLongMap!22639 (_ BitVec 64)) Bool)

(assert (=> b!1565952 (= lt!672811 (contains!10336 lt!672812 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565953 () Bool)

(declare-fun res!1069758 () Bool)

(assert (=> b!1565953 (=> (not res!1069758) (not e!872910))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1565953 (= res!1069758 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50949 _keys!637)) (bvslt from!782 (size!50949 _keys!637))))))

(declare-fun b!1565954 () Bool)

(declare-fun e!872908 () Bool)

(declare-fun tp_is_empty!38803 () Bool)

(assert (=> b!1565954 (= e!872908 tp_is_empty!38803)))

(declare-fun b!1565955 () Bool)

(assert (=> b!1565955 (= e!872910 e!872909)))

(declare-fun res!1069762 () Bool)

(assert (=> b!1565955 (=> (not res!1069762) (not e!872909))))

(assert (=> b!1565955 (= res!1069762 (not (contains!10336 lt!672812 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59945)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59945)

(declare-datatypes ((ValueCell!18371 0))(
  ( (ValueCellFull!18371 (v!22229 V!59945)) (EmptyCell!18371) )
))
(declare-datatypes ((array!104428 0))(
  ( (array!104429 (arr!50399 (Array (_ BitVec 32) ValueCell!18371)) (size!50950 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104428)

(declare-fun getCurrentListMapNoExtraKeys!6731 (array!104426 array!104428 (_ BitVec 32) (_ BitVec 32) V!59945 V!59945 (_ BitVec 32) Int) ListLongMap!22639)

(assert (=> b!1565955 (= lt!672812 (getCurrentListMapNoExtraKeys!6731 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59580 () Bool)

(declare-fun tp!113453 () Bool)

(declare-fun e!872906 () Bool)

(assert (=> mapNonEmpty!59580 (= mapRes!59580 (and tp!113453 e!872906))))

(declare-fun mapKey!59580 () (_ BitVec 32))

(declare-fun mapValue!59580 () ValueCell!18371)

(declare-fun mapRest!59580 () (Array (_ BitVec 32) ValueCell!18371))

(assert (=> mapNonEmpty!59580 (= (arr!50399 _values!487) (store mapRest!59580 mapKey!59580 mapValue!59580))))

(declare-fun res!1069761 () Bool)

(assert (=> start!134132 (=> (not res!1069761) (not e!872910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134132 (= res!1069761 (validMask!0 mask!947))))

(assert (=> start!134132 e!872910))

(assert (=> start!134132 tp!113454))

(assert (=> start!134132 tp_is_empty!38803))

(assert (=> start!134132 true))

(declare-fun array_inv!39411 (array!104426) Bool)

(assert (=> start!134132 (array_inv!39411 _keys!637)))

(declare-fun e!872907 () Bool)

(declare-fun array_inv!39412 (array!104428) Bool)

(assert (=> start!134132 (and (array_inv!39412 _values!487) e!872907)))

(declare-fun b!1565956 () Bool)

(declare-fun res!1069757 () Bool)

(assert (=> b!1565956 (=> (not res!1069757) (not e!872910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565956 (= res!1069757 (not (validKeyInArray!0 (select (arr!50398 _keys!637) from!782))))))

(declare-fun b!1565957 () Bool)

(assert (=> b!1565957 (= e!872906 tp_is_empty!38803)))

(declare-fun b!1565958 () Bool)

(declare-fun res!1069760 () Bool)

(assert (=> b!1565958 (=> (not res!1069760) (not e!872910))))

(assert (=> b!1565958 (= res!1069760 (and (= (size!50950 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50949 _keys!637) (size!50950 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565959 () Bool)

(assert (=> b!1565959 (= e!872907 (and e!872908 mapRes!59580))))

(declare-fun condMapEmpty!59580 () Bool)

(declare-fun mapDefault!59580 () ValueCell!18371)

(assert (=> b!1565959 (= condMapEmpty!59580 (= (arr!50399 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18371)) mapDefault!59580)))))

(declare-fun b!1565960 () Bool)

(declare-fun res!1069759 () Bool)

(assert (=> b!1565960 (=> (not res!1069759) (not e!872910))))

(declare-datatypes ((List!36561 0))(
  ( (Nil!36558) (Cons!36557 (h!38021 (_ BitVec 64)) (t!51400 List!36561)) )
))
(declare-fun arrayNoDuplicates!0 (array!104426 (_ BitVec 32) List!36561) Bool)

(assert (=> b!1565960 (= res!1069759 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36558))))

(assert (= (and start!134132 res!1069761) b!1565958))

(assert (= (and b!1565958 res!1069760) b!1565951))

(assert (= (and b!1565951 res!1069763) b!1565960))

(assert (= (and b!1565960 res!1069759) b!1565953))

(assert (= (and b!1565953 res!1069758) b!1565956))

(assert (= (and b!1565956 res!1069757) b!1565955))

(assert (= (and b!1565955 res!1069762) b!1565952))

(assert (= (and b!1565959 condMapEmpty!59580) mapIsEmpty!59580))

(assert (= (and b!1565959 (not condMapEmpty!59580)) mapNonEmpty!59580))

(get-info :version)

(assert (= (and mapNonEmpty!59580 ((_ is ValueCellFull!18371) mapValue!59580)) b!1565957))

(assert (= (and b!1565959 ((_ is ValueCellFull!18371) mapDefault!59580)) b!1565954))

(assert (= start!134132 b!1565959))

(declare-fun m!1441275 () Bool)

(assert (=> mapNonEmpty!59580 m!1441275))

(declare-fun m!1441277 () Bool)

(assert (=> b!1565951 m!1441277))

(declare-fun m!1441279 () Bool)

(assert (=> b!1565952 m!1441279))

(declare-fun m!1441281 () Bool)

(assert (=> start!134132 m!1441281))

(declare-fun m!1441283 () Bool)

(assert (=> start!134132 m!1441283))

(declare-fun m!1441285 () Bool)

(assert (=> start!134132 m!1441285))

(declare-fun m!1441287 () Bool)

(assert (=> b!1565960 m!1441287))

(declare-fun m!1441289 () Bool)

(assert (=> b!1565955 m!1441289))

(declare-fun m!1441291 () Bool)

(assert (=> b!1565955 m!1441291))

(declare-fun m!1441293 () Bool)

(assert (=> b!1565956 m!1441293))

(assert (=> b!1565956 m!1441293))

(declare-fun m!1441295 () Bool)

(assert (=> b!1565956 m!1441295))

(check-sat (not b!1565960) tp_is_empty!38803 (not b!1565956) (not b!1565952) (not mapNonEmpty!59580) (not b!1565951) (not b!1565955) (not b_next!32083) b_and!51655 (not start!134132))
(check-sat b_and!51655 (not b_next!32083))
