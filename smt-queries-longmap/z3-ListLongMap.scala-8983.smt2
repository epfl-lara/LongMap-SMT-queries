; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108882 () Bool)

(assert start!108882)

(declare-fun b_free!28171 () Bool)

(declare-fun b_next!28171 () Bool)

(assert (=> start!108882 (= b_free!28171 (not b_next!28171))))

(declare-fun tp!99629 () Bool)

(declare-fun b_and!46239 () Bool)

(assert (=> start!108882 (= tp!99629 b_and!46239)))

(declare-fun res!852450 () Bool)

(declare-fun e!733690 () Bool)

(assert (=> start!108882 (=> (not res!852450) (not e!733690))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108882 (= res!852450 (validMask!0 mask!2175))))

(assert (=> start!108882 e!733690))

(declare-fun tp_is_empty!33811 () Bool)

(assert (=> start!108882 tp_is_empty!33811))

(assert (=> start!108882 true))

(declare-datatypes ((V!50185 0))(
  ( (V!50186 (val!16980 Int)) )
))
(declare-datatypes ((ValueCell!16007 0))(
  ( (ValueCellFull!16007 (v!19577 V!50185)) (EmptyCell!16007) )
))
(declare-datatypes ((array!84721 0))(
  ( (array!84722 (arr!40858 (Array (_ BitVec 32) ValueCell!16007)) (size!41409 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84721)

(declare-fun e!733689 () Bool)

(declare-fun array_inv!31205 (array!84721) Bool)

(assert (=> start!108882 (and (array_inv!31205 _values!1445) e!733689)))

(declare-datatypes ((array!84723 0))(
  ( (array!84724 (arr!40859 (Array (_ BitVec 32) (_ BitVec 64))) (size!41410 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84723)

(declare-fun array_inv!31206 (array!84723) Bool)

(assert (=> start!108882 (array_inv!31206 _keys!1741)))

(assert (=> start!108882 tp!99629))

(declare-fun b!1283894 () Bool)

(declare-fun res!852449 () Bool)

(assert (=> b!1283894 (=> (not res!852449) (not e!733690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84723 (_ BitVec 32)) Bool)

(assert (=> b!1283894 (= res!852449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283895 () Bool)

(declare-fun res!852447 () Bool)

(assert (=> b!1283895 (=> (not res!852447) (not e!733690))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283895 (= res!852447 (and (= (size!41409 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41410 _keys!1741) (size!41409 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52274 () Bool)

(declare-fun mapRes!52274 () Bool)

(assert (=> mapIsEmpty!52274 mapRes!52274))

(declare-fun b!1283896 () Bool)

(declare-fun res!852451 () Bool)

(assert (=> b!1283896 (=> (not res!852451) (not e!733690))))

(declare-datatypes ((List!28971 0))(
  ( (Nil!28968) (Cons!28967 (h!30185 (_ BitVec 64)) (t!42507 List!28971)) )
))
(declare-fun arrayNoDuplicates!0 (array!84723 (_ BitVec 32) List!28971) Bool)

(assert (=> b!1283896 (= res!852451 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28968))))

(declare-fun b!1283897 () Bool)

(declare-fun e!733691 () Bool)

(assert (=> b!1283897 (= e!733691 tp_is_empty!33811)))

(declare-fun b!1283898 () Bool)

(declare-fun e!733692 () Bool)

(assert (=> b!1283898 (= e!733692 tp_is_empty!33811)))

(declare-fun b!1283899 () Bool)

(assert (=> b!1283899 (= e!733690 false)))

(declare-fun minValue!1387 () V!50185)

(declare-fun zeroValue!1387 () V!50185)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577037 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21758 0))(
  ( (tuple2!21759 (_1!10890 (_ BitVec 64)) (_2!10890 V!50185)) )
))
(declare-datatypes ((List!28972 0))(
  ( (Nil!28969) (Cons!28968 (h!30186 tuple2!21758) (t!42508 List!28972)) )
))
(declare-datatypes ((ListLongMap!19423 0))(
  ( (ListLongMap!19424 (toList!9727 List!28972)) )
))
(declare-fun contains!7858 (ListLongMap!19423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4796 (array!84723 array!84721 (_ BitVec 32) (_ BitVec 32) V!50185 V!50185 (_ BitVec 32) Int) ListLongMap!19423)

(assert (=> b!1283899 (= lt!577037 (contains!7858 (getCurrentListMap!4796 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52274 () Bool)

(declare-fun tp!99628 () Bool)

(assert (=> mapNonEmpty!52274 (= mapRes!52274 (and tp!99628 e!733692))))

(declare-fun mapValue!52274 () ValueCell!16007)

(declare-fun mapRest!52274 () (Array (_ BitVec 32) ValueCell!16007))

(declare-fun mapKey!52274 () (_ BitVec 32))

(assert (=> mapNonEmpty!52274 (= (arr!40858 _values!1445) (store mapRest!52274 mapKey!52274 mapValue!52274))))

(declare-fun b!1283900 () Bool)

(assert (=> b!1283900 (= e!733689 (and e!733691 mapRes!52274))))

(declare-fun condMapEmpty!52274 () Bool)

(declare-fun mapDefault!52274 () ValueCell!16007)

(assert (=> b!1283900 (= condMapEmpty!52274 (= (arr!40858 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16007)) mapDefault!52274)))))

(declare-fun b!1283901 () Bool)

(declare-fun res!852448 () Bool)

(assert (=> b!1283901 (=> (not res!852448) (not e!733690))))

(assert (=> b!1283901 (= res!852448 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41410 _keys!1741))))))

(assert (= (and start!108882 res!852450) b!1283895))

(assert (= (and b!1283895 res!852447) b!1283894))

(assert (= (and b!1283894 res!852449) b!1283896))

(assert (= (and b!1283896 res!852451) b!1283901))

(assert (= (and b!1283901 res!852448) b!1283899))

(assert (= (and b!1283900 condMapEmpty!52274) mapIsEmpty!52274))

(assert (= (and b!1283900 (not condMapEmpty!52274)) mapNonEmpty!52274))

(get-info :version)

(assert (= (and mapNonEmpty!52274 ((_ is ValueCellFull!16007) mapValue!52274)) b!1283898))

(assert (= (and b!1283900 ((_ is ValueCellFull!16007) mapDefault!52274)) b!1283897))

(assert (= start!108882 b!1283900))

(declare-fun m!1178353 () Bool)

(assert (=> b!1283899 m!1178353))

(assert (=> b!1283899 m!1178353))

(declare-fun m!1178355 () Bool)

(assert (=> b!1283899 m!1178355))

(declare-fun m!1178357 () Bool)

(assert (=> mapNonEmpty!52274 m!1178357))

(declare-fun m!1178359 () Bool)

(assert (=> b!1283896 m!1178359))

(declare-fun m!1178361 () Bool)

(assert (=> start!108882 m!1178361))

(declare-fun m!1178363 () Bool)

(assert (=> start!108882 m!1178363))

(declare-fun m!1178365 () Bool)

(assert (=> start!108882 m!1178365))

(declare-fun m!1178367 () Bool)

(assert (=> b!1283894 m!1178367))

(check-sat (not b!1283899) (not b_next!28171) tp_is_empty!33811 b_and!46239 (not start!108882) (not b!1283894) (not b!1283896) (not mapNonEmpty!52274))
(check-sat b_and!46239 (not b_next!28171))
