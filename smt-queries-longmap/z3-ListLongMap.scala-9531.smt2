; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113272 () Bool)

(assert start!113272)

(declare-fun b_free!31099 () Bool)

(declare-fun b_next!31099 () Bool)

(assert (=> start!113272 (= b_free!31099 (not b_next!31099))))

(declare-fun tp!109101 () Bool)

(declare-fun b_and!50131 () Bool)

(assert (=> start!113272 (= tp!109101 b_and!50131)))

(declare-fun b!1341207 () Bool)

(declare-fun e!764066 () Bool)

(declare-fun tp_is_empty!37099 () Bool)

(assert (=> b!1341207 (= e!764066 tp_is_empty!37099)))

(declare-fun mapIsEmpty!57355 () Bool)

(declare-fun mapRes!57355 () Bool)

(assert (=> mapIsEmpty!57355 mapRes!57355))

(declare-fun b!1341208 () Bool)

(declare-fun res!889360 () Bool)

(declare-fun e!764065 () Bool)

(assert (=> b!1341208 (=> (not res!889360) (not e!764065))))

(declare-datatypes ((array!91175 0))(
  ( (array!91176 (arr!44039 (Array (_ BitVec 32) (_ BitVec 64))) (size!44590 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91175)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91175 (_ BitVec 32)) Bool)

(assert (=> b!1341208 (= res!889360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341209 () Bool)

(declare-fun res!889362 () Bool)

(assert (=> b!1341209 (=> (not res!889362) (not e!764065))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54569 0))(
  ( (V!54570 (val!18624 Int)) )
))
(declare-datatypes ((ValueCell!17651 0))(
  ( (ValueCellFull!17651 (v!21267 V!54569)) (EmptyCell!17651) )
))
(declare-datatypes ((array!91177 0))(
  ( (array!91178 (arr!44040 (Array (_ BitVec 32) ValueCell!17651)) (size!44591 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91177)

(assert (=> b!1341209 (= res!889362 (and (= (size!44591 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44590 _keys!1571) (size!44591 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!889363 () Bool)

(assert (=> start!113272 (=> (not res!889363) (not e!764065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113272 (= res!889363 (validMask!0 mask!1977))))

(assert (=> start!113272 e!764065))

(assert (=> start!113272 tp_is_empty!37099))

(assert (=> start!113272 true))

(declare-fun array_inv!33469 (array!91175) Bool)

(assert (=> start!113272 (array_inv!33469 _keys!1571)))

(declare-fun e!764064 () Bool)

(declare-fun array_inv!33470 (array!91177) Bool)

(assert (=> start!113272 (and (array_inv!33470 _values!1303) e!764064)))

(assert (=> start!113272 tp!109101))

(declare-fun b!1341210 () Bool)

(assert (=> b!1341210 (= e!764065 false)))

(declare-fun minValue!1245 () V!54569)

(declare-fun zeroValue!1245 () V!54569)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun lt!594419 () Bool)

(declare-datatypes ((tuple2!24028 0))(
  ( (tuple2!24029 (_1!12025 (_ BitVec 64)) (_2!12025 V!54569)) )
))
(declare-datatypes ((List!31184 0))(
  ( (Nil!31181) (Cons!31180 (h!32398 tuple2!24028) (t!45508 List!31184)) )
))
(declare-datatypes ((ListLongMap!21693 0))(
  ( (ListLongMap!21694 (toList!10862 List!31184)) )
))
(declare-fun contains!9050 (ListLongMap!21693 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5815 (array!91175 array!91177 (_ BitVec 32) (_ BitVec 32) V!54569 V!54569 (_ BitVec 32) Int) ListLongMap!21693)

(assert (=> b!1341210 (= lt!594419 (contains!9050 (getCurrentListMap!5815 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341211 () Bool)

(declare-fun e!764063 () Bool)

(assert (=> b!1341211 (= e!764063 tp_is_empty!37099)))

(declare-fun mapNonEmpty!57355 () Bool)

(declare-fun tp!109102 () Bool)

(assert (=> mapNonEmpty!57355 (= mapRes!57355 (and tp!109102 e!764066))))

(declare-fun mapValue!57355 () ValueCell!17651)

(declare-fun mapRest!57355 () (Array (_ BitVec 32) ValueCell!17651))

(declare-fun mapKey!57355 () (_ BitVec 32))

(assert (=> mapNonEmpty!57355 (= (arr!44040 _values!1303) (store mapRest!57355 mapKey!57355 mapValue!57355))))

(declare-fun b!1341212 () Bool)

(declare-fun res!889364 () Bool)

(assert (=> b!1341212 (=> (not res!889364) (not e!764065))))

(assert (=> b!1341212 (= res!889364 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44590 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341213 () Bool)

(declare-fun res!889361 () Bool)

(assert (=> b!1341213 (=> (not res!889361) (not e!764065))))

(declare-datatypes ((List!31185 0))(
  ( (Nil!31182) (Cons!31181 (h!32399 (_ BitVec 64)) (t!45509 List!31185)) )
))
(declare-fun arrayNoDuplicates!0 (array!91175 (_ BitVec 32) List!31185) Bool)

(assert (=> b!1341213 (= res!889361 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31182))))

(declare-fun b!1341214 () Bool)

(assert (=> b!1341214 (= e!764064 (and e!764063 mapRes!57355))))

(declare-fun condMapEmpty!57355 () Bool)

(declare-fun mapDefault!57355 () ValueCell!17651)

(assert (=> b!1341214 (= condMapEmpty!57355 (= (arr!44040 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17651)) mapDefault!57355)))))

(assert (= (and start!113272 res!889363) b!1341209))

(assert (= (and b!1341209 res!889362) b!1341208))

(assert (= (and b!1341208 res!889360) b!1341213))

(assert (= (and b!1341213 res!889361) b!1341212))

(assert (= (and b!1341212 res!889364) b!1341210))

(assert (= (and b!1341214 condMapEmpty!57355) mapIsEmpty!57355))

(assert (= (and b!1341214 (not condMapEmpty!57355)) mapNonEmpty!57355))

(get-info :version)

(assert (= (and mapNonEmpty!57355 ((_ is ValueCellFull!17651) mapValue!57355)) b!1341207))

(assert (= (and b!1341214 ((_ is ValueCellFull!17651) mapDefault!57355)) b!1341211))

(assert (= start!113272 b!1341214))

(declare-fun m!1229403 () Bool)

(assert (=> mapNonEmpty!57355 m!1229403))

(declare-fun m!1229405 () Bool)

(assert (=> start!113272 m!1229405))

(declare-fun m!1229407 () Bool)

(assert (=> start!113272 m!1229407))

(declare-fun m!1229409 () Bool)

(assert (=> start!113272 m!1229409))

(declare-fun m!1229411 () Bool)

(assert (=> b!1341208 m!1229411))

(declare-fun m!1229413 () Bool)

(assert (=> b!1341213 m!1229413))

(declare-fun m!1229415 () Bool)

(assert (=> b!1341210 m!1229415))

(assert (=> b!1341210 m!1229415))

(declare-fun m!1229417 () Bool)

(assert (=> b!1341210 m!1229417))

(check-sat (not b!1341208) tp_is_empty!37099 b_and!50131 (not mapNonEmpty!57355) (not b!1341213) (not b!1341210) (not start!113272) (not b_next!31099))
(check-sat b_and!50131 (not b_next!31099))
