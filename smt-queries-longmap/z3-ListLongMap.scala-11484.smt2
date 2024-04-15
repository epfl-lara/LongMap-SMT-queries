; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133652 () Bool)

(assert start!133652)

(declare-fun b_free!32065 () Bool)

(declare-fun b_next!32065 () Bool)

(assert (=> start!133652 (= b_free!32065 (not b_next!32065))))

(declare-fun tp!113401 () Bool)

(declare-fun b_and!51617 () Bool)

(assert (=> start!133652 (= tp!113401 b_and!51617)))

(declare-fun b!1562932 () Bool)

(declare-fun res!1068582 () Bool)

(declare-fun e!871042 () Bool)

(assert (=> b!1562932 (=> (not res!1068582) (not e!871042))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104188 0))(
  ( (array!104189 (arr!50287 (Array (_ BitVec 32) (_ BitVec 64))) (size!50839 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104188)

(assert (=> b!1562932 (= res!1068582 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50839 _keys!637)) (bvslt from!782 (size!50839 _keys!637))))))

(declare-fun b!1562933 () Bool)

(declare-fun res!1068580 () Bool)

(assert (=> b!1562933 (=> (not res!1068580) (not e!871042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562933 (= res!1068580 (not (validKeyInArray!0 (select (arr!50287 _keys!637) from!782))))))

(declare-fun b!1562934 () Bool)

(declare-fun res!1068581 () Bool)

(assert (=> b!1562934 (=> (not res!1068581) (not e!871042))))

(declare-datatypes ((List!36559 0))(
  ( (Nil!36556) (Cons!36555 (h!38002 (_ BitVec 64)) (t!51398 List!36559)) )
))
(declare-fun arrayNoDuplicates!0 (array!104188 (_ BitVec 32) List!36559) Bool)

(assert (=> b!1562934 (= res!1068581 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36556))))

(declare-fun b!1562936 () Bool)

(declare-fun e!871037 () Bool)

(declare-fun tp_is_empty!38785 () Bool)

(assert (=> b!1562936 (= e!871037 tp_is_empty!38785)))

(declare-fun b!1562937 () Bool)

(declare-fun res!1068584 () Bool)

(assert (=> b!1562937 (=> (not res!1068584) (not e!871042))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104188 (_ BitVec 32)) Bool)

(assert (=> b!1562937 (= res!1068584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562938 () Bool)

(declare-fun res!1068579 () Bool)

(assert (=> b!1562938 (=> (not res!1068579) (not e!871042))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59921 0))(
  ( (V!59922 (val!19476 Int)) )
))
(declare-datatypes ((ValueCell!18362 0))(
  ( (ValueCellFull!18362 (v!22224 V!59921)) (EmptyCell!18362) )
))
(declare-datatypes ((array!104190 0))(
  ( (array!104191 (arr!50288 (Array (_ BitVec 32) ValueCell!18362)) (size!50840 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104190)

(assert (=> b!1562938 (= res!1068579 (and (= (size!50840 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50839 _keys!637) (size!50840 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562939 () Bool)

(declare-fun e!871038 () Bool)

(assert (=> b!1562939 (= e!871038 tp_is_empty!38785)))

(declare-fun b!1562940 () Bool)

(declare-fun e!871040 () Bool)

(assert (=> b!1562940 (= e!871040 false)))

(declare-fun lt!671564 () Bool)

(declare-datatypes ((tuple2!25200 0))(
  ( (tuple2!25201 (_1!12611 (_ BitVec 64)) (_2!12611 V!59921)) )
))
(declare-datatypes ((List!36560 0))(
  ( (Nil!36557) (Cons!36556 (h!38003 tuple2!25200) (t!51399 List!36560)) )
))
(declare-datatypes ((ListLongMap!22635 0))(
  ( (ListLongMap!22636 (toList!11333 List!36560)) )
))
(declare-fun lt!671563 () ListLongMap!22635)

(declare-fun contains!10243 (ListLongMap!22635 (_ BitVec 64)) Bool)

(assert (=> b!1562940 (= lt!671564 (contains!10243 lt!671563 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59553 () Bool)

(declare-fun mapRes!59553 () Bool)

(assert (=> mapIsEmpty!59553 mapRes!59553))

(declare-fun mapNonEmpty!59553 () Bool)

(declare-fun tp!113400 () Bool)

(assert (=> mapNonEmpty!59553 (= mapRes!59553 (and tp!113400 e!871037))))

(declare-fun mapKey!59553 () (_ BitVec 32))

(declare-fun mapRest!59553 () (Array (_ BitVec 32) ValueCell!18362))

(declare-fun mapValue!59553 () ValueCell!18362)

(assert (=> mapNonEmpty!59553 (= (arr!50288 _values!487) (store mapRest!59553 mapKey!59553 mapValue!59553))))

(declare-fun b!1562941 () Bool)

(assert (=> b!1562941 (= e!871042 e!871040)))

(declare-fun res!1068583 () Bool)

(assert (=> b!1562941 (=> (not res!1068583) (not e!871040))))

(assert (=> b!1562941 (= res!1068583 (not (contains!10243 lt!671563 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59921)

(declare-fun minValue!453 () V!59921)

(declare-fun getCurrentListMapNoExtraKeys!6706 (array!104188 array!104190 (_ BitVec 32) (_ BitVec 32) V!59921 V!59921 (_ BitVec 32) Int) ListLongMap!22635)

(assert (=> b!1562941 (= lt!671563 (getCurrentListMapNoExtraKeys!6706 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1068585 () Bool)

(assert (=> start!133652 (=> (not res!1068585) (not e!871042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133652 (= res!1068585 (validMask!0 mask!947))))

(assert (=> start!133652 e!871042))

(assert (=> start!133652 tp!113401))

(assert (=> start!133652 tp_is_empty!38785))

(assert (=> start!133652 true))

(declare-fun array_inv!39271 (array!104188) Bool)

(assert (=> start!133652 (array_inv!39271 _keys!637)))

(declare-fun e!871041 () Bool)

(declare-fun array_inv!39272 (array!104190) Bool)

(assert (=> start!133652 (and (array_inv!39272 _values!487) e!871041)))

(declare-fun b!1562935 () Bool)

(assert (=> b!1562935 (= e!871041 (and e!871038 mapRes!59553))))

(declare-fun condMapEmpty!59553 () Bool)

(declare-fun mapDefault!59553 () ValueCell!18362)

(assert (=> b!1562935 (= condMapEmpty!59553 (= (arr!50288 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18362)) mapDefault!59553)))))

(assert (= (and start!133652 res!1068585) b!1562938))

(assert (= (and b!1562938 res!1068579) b!1562937))

(assert (= (and b!1562937 res!1068584) b!1562934))

(assert (= (and b!1562934 res!1068581) b!1562932))

(assert (= (and b!1562932 res!1068582) b!1562933))

(assert (= (and b!1562933 res!1068580) b!1562941))

(assert (= (and b!1562941 res!1068583) b!1562940))

(assert (= (and b!1562935 condMapEmpty!59553) mapIsEmpty!59553))

(assert (= (and b!1562935 (not condMapEmpty!59553)) mapNonEmpty!59553))

(get-info :version)

(assert (= (and mapNonEmpty!59553 ((_ is ValueCellFull!18362) mapValue!59553)) b!1562936))

(assert (= (and b!1562935 ((_ is ValueCellFull!18362) mapDefault!59553)) b!1562939))

(assert (= start!133652 b!1562935))

(declare-fun m!1437927 () Bool)

(assert (=> b!1562937 m!1437927))

(declare-fun m!1437929 () Bool)

(assert (=> b!1562934 m!1437929))

(declare-fun m!1437931 () Bool)

(assert (=> start!133652 m!1437931))

(declare-fun m!1437933 () Bool)

(assert (=> start!133652 m!1437933))

(declare-fun m!1437935 () Bool)

(assert (=> start!133652 m!1437935))

(declare-fun m!1437937 () Bool)

(assert (=> b!1562933 m!1437937))

(assert (=> b!1562933 m!1437937))

(declare-fun m!1437939 () Bool)

(assert (=> b!1562933 m!1437939))

(declare-fun m!1437941 () Bool)

(assert (=> b!1562940 m!1437941))

(declare-fun m!1437943 () Bool)

(assert (=> mapNonEmpty!59553 m!1437943))

(declare-fun m!1437945 () Bool)

(assert (=> b!1562941 m!1437945))

(declare-fun m!1437947 () Bool)

(assert (=> b!1562941 m!1437947))

(check-sat (not b!1562934) (not b!1562941) (not b!1562937) (not b!1562940) (not mapNonEmpty!59553) (not b_next!32065) (not start!133652) b_and!51617 (not b!1562933) tp_is_empty!38785)
(check-sat b_and!51617 (not b_next!32065))
