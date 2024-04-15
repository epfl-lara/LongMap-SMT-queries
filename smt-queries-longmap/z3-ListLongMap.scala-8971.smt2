; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108552 () Bool)

(assert start!108552)

(declare-fun b_free!28099 () Bool)

(declare-fun b_next!28099 () Bool)

(assert (=> start!108552 (= b_free!28099 (not b_next!28099))))

(declare-fun tp!99408 () Bool)

(declare-fun b_and!46141 () Bool)

(assert (=> start!108552 (= tp!99408 b_and!46141)))

(declare-fun b!1281323 () Bool)

(declare-fun e!732084 () Bool)

(assert (=> b!1281323 (= e!732084 true)))

(declare-datatypes ((array!84445 0))(
  ( (array!84446 (arr!40727 (Array (_ BitVec 32) (_ BitVec 64))) (size!41279 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84445)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!84445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281323 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-datatypes ((V!50089 0))(
  ( (V!50090 (val!16944 Int)) )
))
(declare-fun zeroValue!1387 () V!50089)

(declare-datatypes ((ValueCell!15971 0))(
  ( (ValueCellFull!15971 (v!19543 V!50089)) (EmptyCell!15971) )
))
(declare-datatypes ((array!84447 0))(
  ( (array!84448 (arr!40728 (Array (_ BitVec 32) ValueCell!15971)) (size!41280 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84447)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((Unit!42277 0))(
  ( (Unit!42278) )
))
(declare-fun lt!576046 () Unit!42277)

(declare-fun minValue!1387 () V!50089)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!622 (array!84445 array!84447 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 64) (_ BitVec 32) Int) Unit!42277)

(assert (=> b!1281323 (= lt!576046 (lemmaListMapContainsThenArrayContainsFrom!622 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1281324 () Bool)

(declare-fun e!732082 () Bool)

(declare-fun tp_is_empty!33739 () Bool)

(assert (=> b!1281324 (= e!732082 tp_is_empty!33739)))

(declare-fun b!1281325 () Bool)

(declare-fun res!851170 () Bool)

(declare-fun e!732080 () Bool)

(assert (=> b!1281325 (=> (not res!851170) (not e!732080))))

(assert (=> b!1281325 (= res!851170 (and (= (size!41280 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41279 _keys!1741) (size!41280 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52160 () Bool)

(declare-fun mapRes!52160 () Bool)

(declare-fun tp!99407 () Bool)

(assert (=> mapNonEmpty!52160 (= mapRes!52160 (and tp!99407 e!732082))))

(declare-fun mapKey!52160 () (_ BitVec 32))

(declare-fun mapRest!52160 () (Array (_ BitVec 32) ValueCell!15971))

(declare-fun mapValue!52160 () ValueCell!15971)

(assert (=> mapNonEmpty!52160 (= (arr!40728 _values!1445) (store mapRest!52160 mapKey!52160 mapValue!52160))))

(declare-fun b!1281326 () Bool)

(declare-fun res!851177 () Bool)

(assert (=> b!1281326 (=> (not res!851177) (not e!732080))))

(assert (=> b!1281326 (= res!851177 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41279 _keys!1741)) (not (= (select (arr!40727 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!851175 () Bool)

(assert (=> start!108552 (=> (not res!851175) (not e!732080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108552 (= res!851175 (validMask!0 mask!2175))))

(assert (=> start!108552 e!732080))

(assert (=> start!108552 tp_is_empty!33739))

(assert (=> start!108552 true))

(declare-fun e!732081 () Bool)

(declare-fun array_inv!31065 (array!84447) Bool)

(assert (=> start!108552 (and (array_inv!31065 _values!1445) e!732081)))

(declare-fun array_inv!31066 (array!84445) Bool)

(assert (=> start!108552 (array_inv!31066 _keys!1741)))

(assert (=> start!108552 tp!99408))

(declare-fun mapIsEmpty!52160 () Bool)

(assert (=> mapIsEmpty!52160 mapRes!52160))

(declare-fun b!1281327 () Bool)

(declare-fun e!732079 () Bool)

(assert (=> b!1281327 (= e!732079 tp_is_empty!33739)))

(declare-fun b!1281328 () Bool)

(assert (=> b!1281328 (= e!732081 (and e!732079 mapRes!52160))))

(declare-fun condMapEmpty!52160 () Bool)

(declare-fun mapDefault!52160 () ValueCell!15971)

(assert (=> b!1281328 (= condMapEmpty!52160 (= (arr!40728 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15971)) mapDefault!52160)))))

(declare-fun b!1281329 () Bool)

(declare-fun res!851176 () Bool)

(assert (=> b!1281329 (=> (not res!851176) (not e!732080))))

(declare-datatypes ((tuple2!21766 0))(
  ( (tuple2!21767 (_1!10894 (_ BitVec 64)) (_2!10894 V!50089)) )
))
(declare-datatypes ((List!28955 0))(
  ( (Nil!28952) (Cons!28951 (h!30160 tuple2!21766) (t!42487 List!28955)) )
))
(declare-datatypes ((ListLongMap!19423 0))(
  ( (ListLongMap!19424 (toList!9727 List!28955)) )
))
(declare-fun contains!7772 (ListLongMap!19423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4701 (array!84445 array!84447 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 32) Int) ListLongMap!19423)

(assert (=> b!1281329 (= res!851176 (contains!7772 (getCurrentListMap!4701 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281330 () Bool)

(declare-fun res!851174 () Bool)

(assert (=> b!1281330 (=> (not res!851174) (not e!732080))))

(declare-datatypes ((List!28956 0))(
  ( (Nil!28953) (Cons!28952 (h!30161 (_ BitVec 64)) (t!42488 List!28956)) )
))
(declare-fun arrayNoDuplicates!0 (array!84445 (_ BitVec 32) List!28956) Bool)

(assert (=> b!1281330 (= res!851174 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28953))))

(declare-fun b!1281331 () Bool)

(declare-fun res!851172 () Bool)

(assert (=> b!1281331 (=> (not res!851172) (not e!732080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84445 (_ BitVec 32)) Bool)

(assert (=> b!1281331 (= res!851172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281332 () Bool)

(assert (=> b!1281332 (= e!732080 (not e!732084))))

(declare-fun res!851171 () Bool)

(assert (=> b!1281332 (=> res!851171 e!732084)))

(assert (=> b!1281332 (= res!851171 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(assert (=> b!1281332 (contains!7772 (getCurrentListMap!4701 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-fun lt!576045 () Unit!42277)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!20 (array!84445 array!84447 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 64) (_ BitVec 32) Int) Unit!42277)

(assert (=> b!1281332 (= lt!576045 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!20 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281333 () Bool)

(declare-fun res!851173 () Bool)

(assert (=> b!1281333 (=> (not res!851173) (not e!732080))))

(assert (=> b!1281333 (= res!851173 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41279 _keys!1741))))))

(assert (= (and start!108552 res!851175) b!1281325))

(assert (= (and b!1281325 res!851170) b!1281331))

(assert (= (and b!1281331 res!851172) b!1281330))

(assert (= (and b!1281330 res!851174) b!1281333))

(assert (= (and b!1281333 res!851173) b!1281329))

(assert (= (and b!1281329 res!851176) b!1281326))

(assert (= (and b!1281326 res!851177) b!1281332))

(assert (= (and b!1281332 (not res!851171)) b!1281323))

(assert (= (and b!1281328 condMapEmpty!52160) mapIsEmpty!52160))

(assert (= (and b!1281328 (not condMapEmpty!52160)) mapNonEmpty!52160))

(get-info :version)

(assert (= (and mapNonEmpty!52160 ((_ is ValueCellFull!15971) mapValue!52160)) b!1281324))

(assert (= (and b!1281328 ((_ is ValueCellFull!15971) mapDefault!52160)) b!1281327))

(assert (= start!108552 b!1281328))

(declare-fun m!1175313 () Bool)

(assert (=> b!1281323 m!1175313))

(declare-fun m!1175315 () Bool)

(assert (=> b!1281323 m!1175315))

(declare-fun m!1175317 () Bool)

(assert (=> mapNonEmpty!52160 m!1175317))

(declare-fun m!1175319 () Bool)

(assert (=> b!1281330 m!1175319))

(declare-fun m!1175321 () Bool)

(assert (=> b!1281332 m!1175321))

(assert (=> b!1281332 m!1175321))

(declare-fun m!1175323 () Bool)

(assert (=> b!1281332 m!1175323))

(declare-fun m!1175325 () Bool)

(assert (=> b!1281332 m!1175325))

(declare-fun m!1175327 () Bool)

(assert (=> start!108552 m!1175327))

(declare-fun m!1175329 () Bool)

(assert (=> start!108552 m!1175329))

(declare-fun m!1175331 () Bool)

(assert (=> start!108552 m!1175331))

(declare-fun m!1175333 () Bool)

(assert (=> b!1281331 m!1175333))

(declare-fun m!1175335 () Bool)

(assert (=> b!1281326 m!1175335))

(declare-fun m!1175337 () Bool)

(assert (=> b!1281329 m!1175337))

(assert (=> b!1281329 m!1175337))

(declare-fun m!1175339 () Bool)

(assert (=> b!1281329 m!1175339))

(check-sat (not mapNonEmpty!52160) (not b!1281323) (not b!1281329) (not b_next!28099) (not b!1281332) (not b!1281330) tp_is_empty!33739 b_and!46141 (not start!108552) (not b!1281331))
(check-sat b_and!46141 (not b_next!28099))
