; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113294 () Bool)

(assert start!113294)

(declare-fun b_free!31345 () Bool)

(declare-fun b_next!31345 () Bool)

(assert (=> start!113294 (= b_free!31345 (not b_next!31345))))

(declare-fun tp!109840 () Bool)

(declare-fun b_and!50549 () Bool)

(assert (=> start!113294 (= tp!109840 b_and!50549)))

(declare-fun res!891837 () Bool)

(declare-fun e!765031 () Bool)

(assert (=> start!113294 (=> (not res!891837) (not e!765031))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113294 (= res!891837 (validMask!0 mask!1977))))

(assert (=> start!113294 e!765031))

(declare-fun tp_is_empty!37345 () Bool)

(assert (=> start!113294 tp_is_empty!37345))

(assert (=> start!113294 true))

(declare-datatypes ((array!91477 0))(
  ( (array!91478 (arr!44195 (Array (_ BitVec 32) (_ BitVec 64))) (size!44747 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91477)

(declare-fun array_inv!33497 (array!91477) Bool)

(assert (=> start!113294 (array_inv!33497 _keys!1571)))

(declare-datatypes ((V!54897 0))(
  ( (V!54898 (val!18747 Int)) )
))
(declare-datatypes ((ValueCell!17774 0))(
  ( (ValueCellFull!17774 (v!21394 V!54897)) (EmptyCell!17774) )
))
(declare-datatypes ((array!91479 0))(
  ( (array!91480 (arr!44196 (Array (_ BitVec 32) ValueCell!17774)) (size!44748 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91479)

(declare-fun e!765035 () Bool)

(declare-fun array_inv!33498 (array!91479) Bool)

(assert (=> start!113294 (and (array_inv!33498 _values!1303) e!765035)))

(assert (=> start!113294 tp!109840))

(declare-fun b!1344161 () Bool)

(declare-fun e!765033 () Bool)

(declare-fun mapRes!57724 () Bool)

(assert (=> b!1344161 (= e!765035 (and e!765033 mapRes!57724))))

(declare-fun condMapEmpty!57724 () Bool)

(declare-fun mapDefault!57724 () ValueCell!17774)

(assert (=> b!1344161 (= condMapEmpty!57724 (= (arr!44196 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17774)) mapDefault!57724)))))

(declare-fun mapIsEmpty!57724 () Bool)

(assert (=> mapIsEmpty!57724 mapRes!57724))

(declare-fun b!1344162 () Bool)

(declare-fun res!891840 () Bool)

(assert (=> b!1344162 (=> (not res!891840) (not e!765031))))

(declare-datatypes ((List!31363 0))(
  ( (Nil!31360) (Cons!31359 (h!32568 (_ BitVec 64)) (t!45879 List!31363)) )
))
(declare-fun arrayNoDuplicates!0 (array!91477 (_ BitVec 32) List!31363) Bool)

(assert (=> b!1344162 (= res!891840 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31360))))

(declare-fun b!1344163 () Bool)

(assert (=> b!1344163 (= e!765031 false)))

(declare-fun minValue!1245 () V!54897)

(declare-fun lt!594981 () Bool)

(declare-fun zeroValue!1245 () V!54897)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24222 0))(
  ( (tuple2!24223 (_1!12122 (_ BitVec 64)) (_2!12122 V!54897)) )
))
(declare-datatypes ((List!31364 0))(
  ( (Nil!31361) (Cons!31360 (h!32569 tuple2!24222) (t!45880 List!31364)) )
))
(declare-datatypes ((ListLongMap!21879 0))(
  ( (ListLongMap!21880 (toList!10955 List!31364)) )
))
(declare-fun contains!9060 (ListLongMap!21879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5801 (array!91477 array!91479 (_ BitVec 32) (_ BitVec 32) V!54897 V!54897 (_ BitVec 32) Int) ListLongMap!21879)

(assert (=> b!1344163 (= lt!594981 (contains!9060 (getCurrentListMap!5801 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344164 () Bool)

(declare-fun res!891841 () Bool)

(assert (=> b!1344164 (=> (not res!891841) (not e!765031))))

(assert (=> b!1344164 (= res!891841 (and (= (size!44748 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44747 _keys!1571) (size!44748 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344165 () Bool)

(declare-fun res!891839 () Bool)

(assert (=> b!1344165 (=> (not res!891839) (not e!765031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91477 (_ BitVec 32)) Bool)

(assert (=> b!1344165 (= res!891839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344166 () Bool)

(declare-fun e!765034 () Bool)

(assert (=> b!1344166 (= e!765034 tp_is_empty!37345)))

(declare-fun b!1344167 () Bool)

(assert (=> b!1344167 (= e!765033 tp_is_empty!37345)))

(declare-fun mapNonEmpty!57724 () Bool)

(declare-fun tp!109841 () Bool)

(assert (=> mapNonEmpty!57724 (= mapRes!57724 (and tp!109841 e!765034))))

(declare-fun mapKey!57724 () (_ BitVec 32))

(declare-fun mapValue!57724 () ValueCell!17774)

(declare-fun mapRest!57724 () (Array (_ BitVec 32) ValueCell!17774))

(assert (=> mapNonEmpty!57724 (= (arr!44196 _values!1303) (store mapRest!57724 mapKey!57724 mapValue!57724))))

(declare-fun b!1344168 () Bool)

(declare-fun res!891838 () Bool)

(assert (=> b!1344168 (=> (not res!891838) (not e!765031))))

(assert (=> b!1344168 (= res!891838 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44747 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113294 res!891837) b!1344164))

(assert (= (and b!1344164 res!891841) b!1344165))

(assert (= (and b!1344165 res!891839) b!1344162))

(assert (= (and b!1344162 res!891840) b!1344168))

(assert (= (and b!1344168 res!891838) b!1344163))

(assert (= (and b!1344161 condMapEmpty!57724) mapIsEmpty!57724))

(assert (= (and b!1344161 (not condMapEmpty!57724)) mapNonEmpty!57724))

(get-info :version)

(assert (= (and mapNonEmpty!57724 ((_ is ValueCellFull!17774) mapValue!57724)) b!1344166))

(assert (= (and b!1344161 ((_ is ValueCellFull!17774) mapDefault!57724)) b!1344167))

(assert (= start!113294 b!1344161))

(declare-fun m!1231387 () Bool)

(assert (=> b!1344163 m!1231387))

(assert (=> b!1344163 m!1231387))

(declare-fun m!1231389 () Bool)

(assert (=> b!1344163 m!1231389))

(declare-fun m!1231391 () Bool)

(assert (=> b!1344165 m!1231391))

(declare-fun m!1231393 () Bool)

(assert (=> mapNonEmpty!57724 m!1231393))

(declare-fun m!1231395 () Bool)

(assert (=> b!1344162 m!1231395))

(declare-fun m!1231397 () Bool)

(assert (=> start!113294 m!1231397))

(declare-fun m!1231399 () Bool)

(assert (=> start!113294 m!1231399))

(declare-fun m!1231401 () Bool)

(assert (=> start!113294 m!1231401))

(check-sat (not b!1344162) (not start!113294) (not b!1344165) (not b!1344163) tp_is_empty!37345 (not mapNonEmpty!57724) b_and!50549 (not b_next!31345))
(check-sat b_and!50549 (not b_next!31345))
