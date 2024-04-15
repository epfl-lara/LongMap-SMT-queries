; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108706 () Bool)

(assert start!108706)

(declare-fun b_free!28219 () Bool)

(declare-fun b_next!28219 () Bool)

(assert (=> start!108706 (= b_free!28219 (not b_next!28219))))

(declare-fun tp!99773 () Bool)

(declare-fun b_and!46267 () Bool)

(assert (=> start!108706 (= tp!99773 b_and!46267)))

(declare-fun b!1283316 () Bool)

(declare-fun res!852480 () Bool)

(declare-fun e!733174 () Bool)

(assert (=> b!1283316 (=> (not res!852480) (not e!733174))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84679 0))(
  ( (array!84680 (arr!40842 (Array (_ BitVec 32) (_ BitVec 64))) (size!41394 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84679)

(assert (=> b!1283316 (= res!852480 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41394 _keys!1741))))))

(declare-fun b!1283317 () Bool)

(declare-fun e!733175 () Bool)

(declare-fun tp_is_empty!33859 () Bool)

(assert (=> b!1283317 (= e!733175 tp_is_empty!33859)))

(declare-fun b!1283318 () Bool)

(declare-fun res!852477 () Bool)

(assert (=> b!1283318 (=> (not res!852477) (not e!733174))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283318 (= res!852477 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283319 () Bool)

(declare-fun res!852475 () Bool)

(assert (=> b!1283319 (=> (not res!852475) (not e!733174))))

(declare-datatypes ((V!50249 0))(
  ( (V!50250 (val!17004 Int)) )
))
(declare-fun minValue!1387 () V!50249)

(declare-fun zeroValue!1387 () V!50249)

(declare-datatypes ((ValueCell!16031 0))(
  ( (ValueCellFull!16031 (v!19605 V!50249)) (EmptyCell!16031) )
))
(declare-datatypes ((array!84681 0))(
  ( (array!84682 (arr!40843 (Array (_ BitVec 32) ValueCell!16031)) (size!41395 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84681)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21844 0))(
  ( (tuple2!21845 (_1!10933 (_ BitVec 64)) (_2!10933 V!50249)) )
))
(declare-datatypes ((List!29032 0))(
  ( (Nil!29029) (Cons!29028 (h!30237 tuple2!21844) (t!42568 List!29032)) )
))
(declare-datatypes ((ListLongMap!19501 0))(
  ( (ListLongMap!19502 (toList!9766 List!29032)) )
))
(declare-fun contains!7813 (ListLongMap!19501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4739 (array!84679 array!84681 (_ BitVec 32) (_ BitVec 32) V!50249 V!50249 (_ BitVec 32) Int) ListLongMap!19501)

(assert (=> b!1283319 (= res!852475 (contains!7813 (getCurrentListMap!4739 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283320 () Bool)

(declare-fun e!733176 () Bool)

(declare-fun e!733172 () Bool)

(declare-fun mapRes!52346 () Bool)

(assert (=> b!1283320 (= e!733176 (and e!733172 mapRes!52346))))

(declare-fun condMapEmpty!52346 () Bool)

(declare-fun mapDefault!52346 () ValueCell!16031)

(assert (=> b!1283320 (= condMapEmpty!52346 (= (arr!40843 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16031)) mapDefault!52346)))))

(declare-fun b!1283321 () Bool)

(declare-fun res!852479 () Bool)

(assert (=> b!1283321 (=> (not res!852479) (not e!733174))))

(assert (=> b!1283321 (= res!852479 (and (= (size!41395 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41394 _keys!1741) (size!41395 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283322 () Bool)

(declare-fun res!852478 () Bool)

(assert (=> b!1283322 (=> (not res!852478) (not e!733174))))

(declare-datatypes ((List!29033 0))(
  ( (Nil!29030) (Cons!29029 (h!30238 (_ BitVec 64)) (t!42569 List!29033)) )
))
(declare-fun arrayNoDuplicates!0 (array!84679 (_ BitVec 32) List!29033) Bool)

(assert (=> b!1283322 (= res!852478 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29030))))

(declare-fun b!1283323 () Bool)

(declare-fun res!852481 () Bool)

(assert (=> b!1283323 (=> (not res!852481) (not e!733174))))

(assert (=> b!1283323 (= res!852481 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41394 _keys!1741))))))

(declare-fun mapNonEmpty!52346 () Bool)

(declare-fun tp!99774 () Bool)

(assert (=> mapNonEmpty!52346 (= mapRes!52346 (and tp!99774 e!733175))))

(declare-fun mapRest!52346 () (Array (_ BitVec 32) ValueCell!16031))

(declare-fun mapValue!52346 () ValueCell!16031)

(declare-fun mapKey!52346 () (_ BitVec 32))

(assert (=> mapNonEmpty!52346 (= (arr!40843 _values!1445) (store mapRest!52346 mapKey!52346 mapValue!52346))))

(declare-fun res!852476 () Bool)

(assert (=> start!108706 (=> (not res!852476) (not e!733174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108706 (= res!852476 (validMask!0 mask!2175))))

(assert (=> start!108706 e!733174))

(assert (=> start!108706 tp_is_empty!33859))

(assert (=> start!108706 true))

(declare-fun array_inv!31137 (array!84681) Bool)

(assert (=> start!108706 (and (array_inv!31137 _values!1445) e!733176)))

(declare-fun array_inv!31138 (array!84679) Bool)

(assert (=> start!108706 (array_inv!31138 _keys!1741)))

(assert (=> start!108706 tp!99773))

(declare-fun b!1283324 () Bool)

(assert (=> b!1283324 (= e!733172 tp_is_empty!33859)))

(declare-fun mapIsEmpty!52346 () Bool)

(assert (=> mapIsEmpty!52346 mapRes!52346))

(declare-fun b!1283325 () Bool)

(declare-fun res!852482 () Bool)

(assert (=> b!1283325 (=> (not res!852482) (not e!733174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283325 (= res!852482 (validKeyInArray!0 (select (arr!40842 _keys!1741) from!2144)))))

(declare-fun b!1283326 () Bool)

(declare-fun res!852483 () Bool)

(assert (=> b!1283326 (=> (not res!852483) (not e!733174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84679 (_ BitVec 32)) Bool)

(assert (=> b!1283326 (= res!852483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283327 () Bool)

(assert (=> b!1283327 (= e!733174 (not true))))

(declare-fun lt!576468 () ListLongMap!19501)

(assert (=> b!1283327 (contains!7813 lt!576468 k0!1205)))

(declare-datatypes ((Unit!42317 0))(
  ( (Unit!42318) )
))
(declare-fun lt!576467 () Unit!42317)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!9 ((_ BitVec 64) (_ BitVec 64) V!50249 ListLongMap!19501) Unit!42317)

(assert (=> b!1283327 (= lt!576467 (lemmaInListMapAfterAddingDiffThenInBefore!9 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576468))))

(declare-fun +!4324 (ListLongMap!19501 tuple2!21844) ListLongMap!19501)

(declare-fun getCurrentListMapNoExtraKeys!5955 (array!84679 array!84681 (_ BitVec 32) (_ BitVec 32) V!50249 V!50249 (_ BitVec 32) Int) ListLongMap!19501)

(assert (=> b!1283327 (= lt!576468 (+!4324 (getCurrentListMapNoExtraKeys!5955 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and start!108706 res!852476) b!1283321))

(assert (= (and b!1283321 res!852479) b!1283326))

(assert (= (and b!1283326 res!852483) b!1283322))

(assert (= (and b!1283322 res!852478) b!1283323))

(assert (= (and b!1283323 res!852481) b!1283319))

(assert (= (and b!1283319 res!852475) b!1283316))

(assert (= (and b!1283316 res!852480) b!1283325))

(assert (= (and b!1283325 res!852482) b!1283318))

(assert (= (and b!1283318 res!852477) b!1283327))

(assert (= (and b!1283320 condMapEmpty!52346) mapIsEmpty!52346))

(assert (= (and b!1283320 (not condMapEmpty!52346)) mapNonEmpty!52346))

(get-info :version)

(assert (= (and mapNonEmpty!52346 ((_ is ValueCellFull!16031) mapValue!52346)) b!1283317))

(assert (= (and b!1283320 ((_ is ValueCellFull!16031) mapDefault!52346)) b!1283324))

(assert (= start!108706 b!1283320))

(declare-fun m!1176817 () Bool)

(assert (=> b!1283326 m!1176817))

(declare-fun m!1176819 () Bool)

(assert (=> b!1283319 m!1176819))

(assert (=> b!1283319 m!1176819))

(declare-fun m!1176821 () Bool)

(assert (=> b!1283319 m!1176821))

(declare-fun m!1176823 () Bool)

(assert (=> mapNonEmpty!52346 m!1176823))

(declare-fun m!1176825 () Bool)

(assert (=> b!1283322 m!1176825))

(declare-fun m!1176827 () Bool)

(assert (=> start!108706 m!1176827))

(declare-fun m!1176829 () Bool)

(assert (=> start!108706 m!1176829))

(declare-fun m!1176831 () Bool)

(assert (=> start!108706 m!1176831))

(declare-fun m!1176833 () Bool)

(assert (=> b!1283327 m!1176833))

(declare-fun m!1176835 () Bool)

(assert (=> b!1283327 m!1176835))

(declare-fun m!1176837 () Bool)

(assert (=> b!1283327 m!1176837))

(assert (=> b!1283327 m!1176837))

(declare-fun m!1176839 () Bool)

(assert (=> b!1283327 m!1176839))

(declare-fun m!1176841 () Bool)

(assert (=> b!1283325 m!1176841))

(assert (=> b!1283325 m!1176841))

(declare-fun m!1176843 () Bool)

(assert (=> b!1283325 m!1176843))

(check-sat b_and!46267 (not b!1283326) (not b!1283327) (not b!1283322) (not start!108706) (not b_next!28219) (not mapNonEmpty!52346) (not b!1283319) tp_is_empty!33859 (not b!1283325))
(check-sat b_and!46267 (not b_next!28219))
