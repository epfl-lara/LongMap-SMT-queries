; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133934 () Bool)

(assert start!133934)

(declare-fun b_free!31939 () Bool)

(declare-fun b_next!31939 () Bool)

(assert (=> start!133934 (= b_free!31939 (not b_next!31939))))

(declare-fun tp!112941 () Bool)

(declare-fun b_and!51397 () Bool)

(assert (=> start!133934 (= tp!112941 b_and!51397)))

(declare-fun b!1563333 () Bool)

(declare-fun e!871376 () Bool)

(assert (=> b!1563333 (= e!871376 false)))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((V!59681 0))(
  ( (V!59682 (val!19386 Int)) )
))
(declare-fun zeroValue!453 () V!59681)

(declare-fun lt!671963 () Bool)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59681)

(declare-datatypes ((array!104046 0))(
  ( (array!104047 (arr!50208 (Array (_ BitVec 32) (_ BitVec 64))) (size!50759 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104046)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18272 0))(
  ( (ValueCellFull!18272 (v!22130 V!59681)) (EmptyCell!18272) )
))
(declare-datatypes ((array!104048 0))(
  ( (array!104049 (arr!50209 (Array (_ BitVec 32) ValueCell!18272)) (size!50760 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104048)

(declare-datatypes ((tuple2!25096 0))(
  ( (tuple2!25097 (_1!12559 (_ BitVec 64)) (_2!12559 V!59681)) )
))
(declare-datatypes ((List!36438 0))(
  ( (Nil!36435) (Cons!36434 (h!37898 tuple2!25096) (t!51163 List!36438)) )
))
(declare-datatypes ((ListLongMap!22539 0))(
  ( (ListLongMap!22540 (toList!11285 List!36438)) )
))
(declare-fun contains!10286 (ListLongMap!22539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6684 (array!104046 array!104048 (_ BitVec 32) (_ BitVec 32) V!59681 V!59681 (_ BitVec 32) Int) ListLongMap!22539)

(assert (=> b!1563333 (= lt!671963 (contains!10286 (getCurrentListMapNoExtraKeys!6684 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563334 () Bool)

(declare-fun e!871378 () Bool)

(declare-fun tp_is_empty!38605 () Bool)

(assert (=> b!1563334 (= e!871378 tp_is_empty!38605)))

(declare-fun b!1563335 () Bool)

(declare-fun res!1068149 () Bool)

(assert (=> b!1563335 (=> (not res!1068149) (not e!871376))))

(assert (=> b!1563335 (= res!1068149 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50759 _keys!637)) (bvslt from!782 (size!50759 _keys!637))))))

(declare-fun b!1563336 () Bool)

(declare-fun e!871374 () Bool)

(assert (=> b!1563336 (= e!871374 tp_is_empty!38605)))

(declare-fun res!1068144 () Bool)

(assert (=> start!133934 (=> (not res!1068144) (not e!871376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133934 (= res!1068144 (validMask!0 mask!947))))

(assert (=> start!133934 e!871376))

(assert (=> start!133934 tp!112941))

(assert (=> start!133934 tp_is_empty!38605))

(assert (=> start!133934 true))

(declare-fun array_inv!39275 (array!104046) Bool)

(assert (=> start!133934 (array_inv!39275 _keys!637)))

(declare-fun e!871375 () Bool)

(declare-fun array_inv!39276 (array!104048) Bool)

(assert (=> start!133934 (and (array_inv!39276 _values!487) e!871375)))

(declare-fun mapIsEmpty!59283 () Bool)

(declare-fun mapRes!59283 () Bool)

(assert (=> mapIsEmpty!59283 mapRes!59283))

(declare-fun mapNonEmpty!59283 () Bool)

(declare-fun tp!112940 () Bool)

(assert (=> mapNonEmpty!59283 (= mapRes!59283 (and tp!112940 e!871378))))

(declare-fun mapRest!59283 () (Array (_ BitVec 32) ValueCell!18272))

(declare-fun mapKey!59283 () (_ BitVec 32))

(declare-fun mapValue!59283 () ValueCell!18272)

(assert (=> mapNonEmpty!59283 (= (arr!50209 _values!487) (store mapRest!59283 mapKey!59283 mapValue!59283))))

(declare-fun b!1563337 () Bool)

(assert (=> b!1563337 (= e!871375 (and e!871374 mapRes!59283))))

(declare-fun condMapEmpty!59283 () Bool)

(declare-fun mapDefault!59283 () ValueCell!18272)

(assert (=> b!1563337 (= condMapEmpty!59283 (= (arr!50209 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18272)) mapDefault!59283)))))

(declare-fun b!1563338 () Bool)

(declare-fun res!1068147 () Bool)

(assert (=> b!1563338 (=> (not res!1068147) (not e!871376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104046 (_ BitVec 32)) Bool)

(assert (=> b!1563338 (= res!1068147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563339 () Bool)

(declare-fun res!1068146 () Bool)

(assert (=> b!1563339 (=> (not res!1068146) (not e!871376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563339 (= res!1068146 (validKeyInArray!0 (select (arr!50208 _keys!637) from!782)))))

(declare-fun b!1563340 () Bool)

(declare-fun res!1068148 () Bool)

(assert (=> b!1563340 (=> (not res!1068148) (not e!871376))))

(declare-datatypes ((List!36439 0))(
  ( (Nil!36436) (Cons!36435 (h!37899 (_ BitVec 64)) (t!51164 List!36439)) )
))
(declare-fun arrayNoDuplicates!0 (array!104046 (_ BitVec 32) List!36439) Bool)

(assert (=> b!1563340 (= res!1068148 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36436))))

(declare-fun b!1563341 () Bool)

(declare-fun res!1068145 () Bool)

(assert (=> b!1563341 (=> (not res!1068145) (not e!871376))))

(assert (=> b!1563341 (= res!1068145 (and (= (size!50760 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50759 _keys!637) (size!50760 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133934 res!1068144) b!1563341))

(assert (= (and b!1563341 res!1068145) b!1563338))

(assert (= (and b!1563338 res!1068147) b!1563340))

(assert (= (and b!1563340 res!1068148) b!1563335))

(assert (= (and b!1563335 res!1068149) b!1563339))

(assert (= (and b!1563339 res!1068146) b!1563333))

(assert (= (and b!1563337 condMapEmpty!59283) mapIsEmpty!59283))

(assert (= (and b!1563337 (not condMapEmpty!59283)) mapNonEmpty!59283))

(get-info :version)

(assert (= (and mapNonEmpty!59283 ((_ is ValueCellFull!18272) mapValue!59283)) b!1563334))

(assert (= (and b!1563337 ((_ is ValueCellFull!18272) mapDefault!59283)) b!1563336))

(assert (= start!133934 b!1563337))

(declare-fun m!1438839 () Bool)

(assert (=> mapNonEmpty!59283 m!1438839))

(declare-fun m!1438841 () Bool)

(assert (=> start!133934 m!1438841))

(declare-fun m!1438843 () Bool)

(assert (=> start!133934 m!1438843))

(declare-fun m!1438845 () Bool)

(assert (=> start!133934 m!1438845))

(declare-fun m!1438847 () Bool)

(assert (=> b!1563339 m!1438847))

(assert (=> b!1563339 m!1438847))

(declare-fun m!1438849 () Bool)

(assert (=> b!1563339 m!1438849))

(declare-fun m!1438851 () Bool)

(assert (=> b!1563333 m!1438851))

(assert (=> b!1563333 m!1438851))

(declare-fun m!1438853 () Bool)

(assert (=> b!1563333 m!1438853))

(declare-fun m!1438855 () Bool)

(assert (=> b!1563338 m!1438855))

(declare-fun m!1438857 () Bool)

(assert (=> b!1563340 m!1438857))

(check-sat b_and!51397 (not start!133934) (not b_next!31939) (not b!1563339) (not b!1563338) (not b!1563340) (not b!1563333) (not mapNonEmpty!59283) tp_is_empty!38605)
(check-sat b_and!51397 (not b_next!31939))
