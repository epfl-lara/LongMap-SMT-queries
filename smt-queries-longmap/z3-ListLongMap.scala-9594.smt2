; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113426 () Bool)

(assert start!113426)

(declare-fun b_free!31477 () Bool)

(declare-fun b_next!31477 () Bool)

(assert (=> start!113426 (= b_free!31477 (not b_next!31477))))

(declare-fun tp!110237 () Bool)

(declare-fun b_and!50747 () Bool)

(assert (=> start!113426 (= tp!110237 b_and!50747)))

(declare-fun b!1346397 () Bool)

(declare-fun res!893412 () Bool)

(declare-fun e!766102 () Bool)

(assert (=> b!1346397 (=> (not res!893412) (not e!766102))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91733 0))(
  ( (array!91734 (arr!44323 (Array (_ BitVec 32) (_ BitVec 64))) (size!44875 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91733)

(declare-datatypes ((V!55073 0))(
  ( (V!55074 (val!18813 Int)) )
))
(declare-datatypes ((ValueCell!17840 0))(
  ( (ValueCellFull!17840 (v!21460 V!55073)) (EmptyCell!17840) )
))
(declare-datatypes ((array!91735 0))(
  ( (array!91736 (arr!44324 (Array (_ BitVec 32) ValueCell!17840)) (size!44876 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91735)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346397 (= res!893412 (and (= (size!44876 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44875 _keys!1571) (size!44876 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57922 () Bool)

(declare-fun mapRes!57922 () Bool)

(assert (=> mapIsEmpty!57922 mapRes!57922))

(declare-fun b!1346398 () Bool)

(declare-fun res!893416 () Bool)

(assert (=> b!1346398 (=> (not res!893416) (not e!766102))))

(declare-datatypes ((List!31456 0))(
  ( (Nil!31453) (Cons!31452 (h!32661 (_ BitVec 64)) (t!46038 List!31456)) )
))
(declare-fun arrayNoDuplicates!0 (array!91733 (_ BitVec 32) List!31456) Bool)

(assert (=> b!1346398 (= res!893416 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31453))))

(declare-fun b!1346399 () Bool)

(assert (=> b!1346399 (= e!766102 false)))

(declare-fun minValue!1245 () V!55073)

(declare-fun lt!595332 () Bool)

(declare-fun zeroValue!1245 () V!55073)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24320 0))(
  ( (tuple2!24321 (_1!12171 (_ BitVec 64)) (_2!12171 V!55073)) )
))
(declare-datatypes ((List!31457 0))(
  ( (Nil!31454) (Cons!31453 (h!32662 tuple2!24320) (t!46039 List!31457)) )
))
(declare-datatypes ((ListLongMap!21977 0))(
  ( (ListLongMap!21978 (toList!11004 List!31457)) )
))
(declare-fun contains!9109 (ListLongMap!21977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5843 (array!91733 array!91735 (_ BitVec 32) (_ BitVec 32) V!55073 V!55073 (_ BitVec 32) Int) ListLongMap!21977)

(assert (=> b!1346399 (= lt!595332 (contains!9109 (getCurrentListMap!5843 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346400 () Bool)

(declare-fun e!766105 () Bool)

(declare-fun tp_is_empty!37477 () Bool)

(assert (=> b!1346400 (= e!766105 tp_is_empty!37477)))

(declare-fun b!1346401 () Bool)

(declare-fun res!893414 () Bool)

(assert (=> b!1346401 (=> (not res!893414) (not e!766102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91733 (_ BitVec 32)) Bool)

(assert (=> b!1346401 (= res!893414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346402 () Bool)

(declare-fun e!766104 () Bool)

(assert (=> b!1346402 (= e!766104 tp_is_empty!37477)))

(declare-fun mapNonEmpty!57922 () Bool)

(declare-fun tp!110236 () Bool)

(assert (=> mapNonEmpty!57922 (= mapRes!57922 (and tp!110236 e!766105))))

(declare-fun mapKey!57922 () (_ BitVec 32))

(declare-fun mapRest!57922 () (Array (_ BitVec 32) ValueCell!17840))

(declare-fun mapValue!57922 () ValueCell!17840)

(assert (=> mapNonEmpty!57922 (= (arr!44324 _values!1303) (store mapRest!57922 mapKey!57922 mapValue!57922))))

(declare-fun b!1346403 () Bool)

(declare-fun e!766103 () Bool)

(assert (=> b!1346403 (= e!766103 (and e!766104 mapRes!57922))))

(declare-fun condMapEmpty!57922 () Bool)

(declare-fun mapDefault!57922 () ValueCell!17840)

(assert (=> b!1346403 (= condMapEmpty!57922 (= (arr!44324 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17840)) mapDefault!57922)))))

(declare-fun res!893415 () Bool)

(assert (=> start!113426 (=> (not res!893415) (not e!766102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113426 (= res!893415 (validMask!0 mask!1977))))

(assert (=> start!113426 e!766102))

(assert (=> start!113426 tp_is_empty!37477))

(assert (=> start!113426 true))

(declare-fun array_inv!33591 (array!91733) Bool)

(assert (=> start!113426 (array_inv!33591 _keys!1571)))

(declare-fun array_inv!33592 (array!91735) Bool)

(assert (=> start!113426 (and (array_inv!33592 _values!1303) e!766103)))

(assert (=> start!113426 tp!110237))

(declare-fun b!1346396 () Bool)

(declare-fun res!893413 () Bool)

(assert (=> b!1346396 (=> (not res!893413) (not e!766102))))

(assert (=> b!1346396 (= res!893413 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44875 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113426 res!893415) b!1346397))

(assert (= (and b!1346397 res!893412) b!1346401))

(assert (= (and b!1346401 res!893414) b!1346398))

(assert (= (and b!1346398 res!893416) b!1346396))

(assert (= (and b!1346396 res!893413) b!1346399))

(assert (= (and b!1346403 condMapEmpty!57922) mapIsEmpty!57922))

(assert (= (and b!1346403 (not condMapEmpty!57922)) mapNonEmpty!57922))

(get-info :version)

(assert (= (and mapNonEmpty!57922 ((_ is ValueCellFull!17840) mapValue!57922)) b!1346400))

(assert (= (and b!1346403 ((_ is ValueCellFull!17840) mapDefault!57922)) b!1346402))

(assert (= start!113426 b!1346403))

(declare-fun m!1233091 () Bool)

(assert (=> b!1346401 m!1233091))

(declare-fun m!1233093 () Bool)

(assert (=> mapNonEmpty!57922 m!1233093))

(declare-fun m!1233095 () Bool)

(assert (=> start!113426 m!1233095))

(declare-fun m!1233097 () Bool)

(assert (=> start!113426 m!1233097))

(declare-fun m!1233099 () Bool)

(assert (=> start!113426 m!1233099))

(declare-fun m!1233101 () Bool)

(assert (=> b!1346398 m!1233101))

(declare-fun m!1233103 () Bool)

(assert (=> b!1346399 m!1233103))

(assert (=> b!1346399 m!1233103))

(declare-fun m!1233105 () Bool)

(assert (=> b!1346399 m!1233105))

(check-sat (not b!1346398) b_and!50747 (not mapNonEmpty!57922) (not b!1346401) tp_is_empty!37477 (not start!113426) (not b!1346399) (not b_next!31477))
(check-sat b_and!50747 (not b_next!31477))
