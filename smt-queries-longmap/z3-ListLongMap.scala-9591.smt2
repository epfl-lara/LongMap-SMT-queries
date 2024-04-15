; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113408 () Bool)

(assert start!113408)

(declare-fun b_free!31459 () Bool)

(declare-fun b_next!31459 () Bool)

(assert (=> start!113408 (= b_free!31459 (not b_next!31459))))

(declare-fun tp!110182 () Bool)

(declare-fun b_and!50729 () Bool)

(assert (=> start!113408 (= tp!110182 b_and!50729)))

(declare-fun b!1346180 () Bool)

(declare-fun e!765970 () Bool)

(declare-fun tp_is_empty!37459 () Bool)

(assert (=> b!1346180 (= e!765970 tp_is_empty!37459)))

(declare-fun res!893278 () Bool)

(declare-fun e!765967 () Bool)

(assert (=> start!113408 (=> (not res!893278) (not e!765967))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113408 (= res!893278 (validMask!0 mask!1977))))

(assert (=> start!113408 e!765967))

(assert (=> start!113408 tp_is_empty!37459))

(assert (=> start!113408 true))

(declare-datatypes ((array!91697 0))(
  ( (array!91698 (arr!44305 (Array (_ BitVec 32) (_ BitVec 64))) (size!44857 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91697)

(declare-fun array_inv!33577 (array!91697) Bool)

(assert (=> start!113408 (array_inv!33577 _keys!1571)))

(declare-datatypes ((V!55049 0))(
  ( (V!55050 (val!18804 Int)) )
))
(declare-datatypes ((ValueCell!17831 0))(
  ( (ValueCellFull!17831 (v!21451 V!55049)) (EmptyCell!17831) )
))
(declare-datatypes ((array!91699 0))(
  ( (array!91700 (arr!44306 (Array (_ BitVec 32) ValueCell!17831)) (size!44858 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91699)

(declare-fun e!765971 () Bool)

(declare-fun array_inv!33578 (array!91699) Bool)

(assert (=> start!113408 (and (array_inv!33578 _values!1303) e!765971)))

(assert (=> start!113408 tp!110182))

(declare-fun b!1346181 () Bool)

(assert (=> b!1346181 (= e!765967 false)))

(declare-fun minValue!1245 () V!55049)

(declare-fun lt!595305 () Bool)

(declare-fun zeroValue!1245 () V!55049)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24306 0))(
  ( (tuple2!24307 (_1!12164 (_ BitVec 64)) (_2!12164 V!55049)) )
))
(declare-datatypes ((List!31442 0))(
  ( (Nil!31439) (Cons!31438 (h!32647 tuple2!24306) (t!46024 List!31442)) )
))
(declare-datatypes ((ListLongMap!21963 0))(
  ( (ListLongMap!21964 (toList!10997 List!31442)) )
))
(declare-fun contains!9102 (ListLongMap!21963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5836 (array!91697 array!91699 (_ BitVec 32) (_ BitVec 32) V!55049 V!55049 (_ BitVec 32) Int) ListLongMap!21963)

(assert (=> b!1346181 (= lt!595305 (contains!9102 (getCurrentListMap!5836 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57895 () Bool)

(declare-fun mapRes!57895 () Bool)

(declare-fun tp!110183 () Bool)

(assert (=> mapNonEmpty!57895 (= mapRes!57895 (and tp!110183 e!765970))))

(declare-fun mapKey!57895 () (_ BitVec 32))

(declare-fun mapRest!57895 () (Array (_ BitVec 32) ValueCell!17831))

(declare-fun mapValue!57895 () ValueCell!17831)

(assert (=> mapNonEmpty!57895 (= (arr!44306 _values!1303) (store mapRest!57895 mapKey!57895 mapValue!57895))))

(declare-fun b!1346182 () Bool)

(declare-fun res!893281 () Bool)

(assert (=> b!1346182 (=> (not res!893281) (not e!765967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91697 (_ BitVec 32)) Bool)

(assert (=> b!1346182 (= res!893281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346183 () Bool)

(declare-fun res!893280 () Bool)

(assert (=> b!1346183 (=> (not res!893280) (not e!765967))))

(assert (=> b!1346183 (= res!893280 (and (= (size!44858 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44857 _keys!1571) (size!44858 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346184 () Bool)

(declare-fun e!765969 () Bool)

(assert (=> b!1346184 (= e!765971 (and e!765969 mapRes!57895))))

(declare-fun condMapEmpty!57895 () Bool)

(declare-fun mapDefault!57895 () ValueCell!17831)

(assert (=> b!1346184 (= condMapEmpty!57895 (= (arr!44306 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17831)) mapDefault!57895)))))

(declare-fun mapIsEmpty!57895 () Bool)

(assert (=> mapIsEmpty!57895 mapRes!57895))

(declare-fun b!1346185 () Bool)

(assert (=> b!1346185 (= e!765969 tp_is_empty!37459)))

(declare-fun b!1346186 () Bool)

(declare-fun res!893277 () Bool)

(assert (=> b!1346186 (=> (not res!893277) (not e!765967))))

(assert (=> b!1346186 (= res!893277 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44857 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346187 () Bool)

(declare-fun res!893279 () Bool)

(assert (=> b!1346187 (=> (not res!893279) (not e!765967))))

(declare-datatypes ((List!31443 0))(
  ( (Nil!31440) (Cons!31439 (h!32648 (_ BitVec 64)) (t!46025 List!31443)) )
))
(declare-fun arrayNoDuplicates!0 (array!91697 (_ BitVec 32) List!31443) Bool)

(assert (=> b!1346187 (= res!893279 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31440))))

(assert (= (and start!113408 res!893278) b!1346183))

(assert (= (and b!1346183 res!893280) b!1346182))

(assert (= (and b!1346182 res!893281) b!1346187))

(assert (= (and b!1346187 res!893279) b!1346186))

(assert (= (and b!1346186 res!893277) b!1346181))

(assert (= (and b!1346184 condMapEmpty!57895) mapIsEmpty!57895))

(assert (= (and b!1346184 (not condMapEmpty!57895)) mapNonEmpty!57895))

(get-info :version)

(assert (= (and mapNonEmpty!57895 ((_ is ValueCellFull!17831) mapValue!57895)) b!1346180))

(assert (= (and b!1346184 ((_ is ValueCellFull!17831) mapDefault!57895)) b!1346185))

(assert (= start!113408 b!1346184))

(declare-fun m!1232947 () Bool)

(assert (=> b!1346181 m!1232947))

(assert (=> b!1346181 m!1232947))

(declare-fun m!1232949 () Bool)

(assert (=> b!1346181 m!1232949))

(declare-fun m!1232951 () Bool)

(assert (=> mapNonEmpty!57895 m!1232951))

(declare-fun m!1232953 () Bool)

(assert (=> b!1346182 m!1232953))

(declare-fun m!1232955 () Bool)

(assert (=> b!1346187 m!1232955))

(declare-fun m!1232957 () Bool)

(assert (=> start!113408 m!1232957))

(declare-fun m!1232959 () Bool)

(assert (=> start!113408 m!1232959))

(declare-fun m!1232961 () Bool)

(assert (=> start!113408 m!1232961))

(check-sat (not b_next!31459) b_and!50729 tp_is_empty!37459 (not b!1346181) (not b!1346182) (not start!113408) (not mapNonEmpty!57895) (not b!1346187))
(check-sat b_and!50729 (not b_next!31459))
