; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108534 () Bool)

(assert start!108534)

(declare-fun b_free!28081 () Bool)

(declare-fun b_next!28081 () Bool)

(assert (=> start!108534 (= b_free!28081 (not b_next!28081))))

(declare-fun tp!99354 () Bool)

(declare-fun b_and!46123 () Bool)

(assert (=> start!108534 (= tp!99354 b_and!46123)))

(declare-fun res!850981 () Bool)

(declare-fun e!731945 () Bool)

(assert (=> start!108534 (=> (not res!850981) (not e!731945))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108534 (= res!850981 (validMask!0 mask!2175))))

(assert (=> start!108534 e!731945))

(declare-fun tp_is_empty!33721 () Bool)

(assert (=> start!108534 tp_is_empty!33721))

(assert (=> start!108534 true))

(declare-datatypes ((V!50065 0))(
  ( (V!50066 (val!16935 Int)) )
))
(declare-datatypes ((ValueCell!15962 0))(
  ( (ValueCellFull!15962 (v!19534 V!50065)) (EmptyCell!15962) )
))
(declare-datatypes ((array!84409 0))(
  ( (array!84410 (arr!40709 (Array (_ BitVec 32) ValueCell!15962)) (size!41261 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84409)

(declare-fun e!731944 () Bool)

(declare-fun array_inv!31055 (array!84409) Bool)

(assert (=> start!108534 (and (array_inv!31055 _values!1445) e!731944)))

(declare-datatypes ((array!84411 0))(
  ( (array!84412 (arr!40710 (Array (_ BitVec 32) (_ BitVec 64))) (size!41262 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84411)

(declare-fun array_inv!31056 (array!84411) Bool)

(assert (=> start!108534 (array_inv!31056 _keys!1741)))

(assert (=> start!108534 tp!99354))

(declare-fun b!1281051 () Bool)

(assert (=> b!1281051 (= e!731945 (not true))))

(declare-fun zeroValue!1387 () V!50065)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!50065)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21750 0))(
  ( (tuple2!21751 (_1!10886 (_ BitVec 64)) (_2!10886 V!50065)) )
))
(declare-datatypes ((List!28942 0))(
  ( (Nil!28939) (Cons!28938 (h!30147 tuple2!21750) (t!42474 List!28942)) )
))
(declare-datatypes ((ListLongMap!19407 0))(
  ( (ListLongMap!19408 (toList!9719 List!28942)) )
))
(declare-fun contains!7764 (ListLongMap!19407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4693 (array!84411 array!84409 (_ BitVec 32) (_ BitVec 32) V!50065 V!50065 (_ BitVec 32) Int) ListLongMap!19407)

(assert (=> b!1281051 (contains!7764 (getCurrentListMap!4693 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42265 0))(
  ( (Unit!42266) )
))
(declare-fun lt!576016 () Unit!42265)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!14 (array!84411 array!84409 (_ BitVec 32) (_ BitVec 32) V!50065 V!50065 (_ BitVec 64) (_ BitVec 32) Int) Unit!42265)

(assert (=> b!1281051 (= lt!576016 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!14 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52133 () Bool)

(declare-fun mapRes!52133 () Bool)

(assert (=> mapIsEmpty!52133 mapRes!52133))

(declare-fun mapNonEmpty!52133 () Bool)

(declare-fun tp!99353 () Bool)

(declare-fun e!731943 () Bool)

(assert (=> mapNonEmpty!52133 (= mapRes!52133 (and tp!99353 e!731943))))

(declare-fun mapKey!52133 () (_ BitVec 32))

(declare-fun mapRest!52133 () (Array (_ BitVec 32) ValueCell!15962))

(declare-fun mapValue!52133 () ValueCell!15962)

(assert (=> mapNonEmpty!52133 (= (arr!40709 _values!1445) (store mapRest!52133 mapKey!52133 mapValue!52133))))

(declare-fun b!1281052 () Bool)

(declare-fun res!850982 () Bool)

(assert (=> b!1281052 (=> (not res!850982) (not e!731945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84411 (_ BitVec 32)) Bool)

(assert (=> b!1281052 (= res!850982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281053 () Bool)

(declare-fun e!731946 () Bool)

(assert (=> b!1281053 (= e!731946 tp_is_empty!33721)))

(declare-fun b!1281054 () Bool)

(assert (=> b!1281054 (= e!731943 tp_is_empty!33721)))

(declare-fun b!1281055 () Bool)

(declare-fun res!850979 () Bool)

(assert (=> b!1281055 (=> (not res!850979) (not e!731945))))

(assert (=> b!1281055 (= res!850979 (contains!7764 (getCurrentListMap!4693 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281056 () Bool)

(assert (=> b!1281056 (= e!731944 (and e!731946 mapRes!52133))))

(declare-fun condMapEmpty!52133 () Bool)

(declare-fun mapDefault!52133 () ValueCell!15962)

(assert (=> b!1281056 (= condMapEmpty!52133 (= (arr!40709 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15962)) mapDefault!52133)))))

(declare-fun b!1281057 () Bool)

(declare-fun res!850984 () Bool)

(assert (=> b!1281057 (=> (not res!850984) (not e!731945))))

(assert (=> b!1281057 (= res!850984 (and (= (size!41261 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41262 _keys!1741) (size!41261 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281058 () Bool)

(declare-fun res!850980 () Bool)

(assert (=> b!1281058 (=> (not res!850980) (not e!731945))))

(assert (=> b!1281058 (= res!850980 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41262 _keys!1741))))))

(declare-fun b!1281059 () Bool)

(declare-fun res!850985 () Bool)

(assert (=> b!1281059 (=> (not res!850985) (not e!731945))))

(assert (=> b!1281059 (= res!850985 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41262 _keys!1741)) (not (= (select (arr!40710 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281060 () Bool)

(declare-fun res!850983 () Bool)

(assert (=> b!1281060 (=> (not res!850983) (not e!731945))))

(declare-datatypes ((List!28943 0))(
  ( (Nil!28940) (Cons!28939 (h!30148 (_ BitVec 64)) (t!42475 List!28943)) )
))
(declare-fun arrayNoDuplicates!0 (array!84411 (_ BitVec 32) List!28943) Bool)

(assert (=> b!1281060 (= res!850983 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28940))))

(assert (= (and start!108534 res!850981) b!1281057))

(assert (= (and b!1281057 res!850984) b!1281052))

(assert (= (and b!1281052 res!850982) b!1281060))

(assert (= (and b!1281060 res!850983) b!1281058))

(assert (= (and b!1281058 res!850980) b!1281055))

(assert (= (and b!1281055 res!850979) b!1281059))

(assert (= (and b!1281059 res!850985) b!1281051))

(assert (= (and b!1281056 condMapEmpty!52133) mapIsEmpty!52133))

(assert (= (and b!1281056 (not condMapEmpty!52133)) mapNonEmpty!52133))

(get-info :version)

(assert (= (and mapNonEmpty!52133 ((_ is ValueCellFull!15962) mapValue!52133)) b!1281054))

(assert (= (and b!1281056 ((_ is ValueCellFull!15962) mapDefault!52133)) b!1281053))

(assert (= start!108534 b!1281056))

(declare-fun m!1175097 () Bool)

(assert (=> mapNonEmpty!52133 m!1175097))

(declare-fun m!1175099 () Bool)

(assert (=> b!1281051 m!1175099))

(assert (=> b!1281051 m!1175099))

(declare-fun m!1175101 () Bool)

(assert (=> b!1281051 m!1175101))

(declare-fun m!1175103 () Bool)

(assert (=> b!1281051 m!1175103))

(declare-fun m!1175105 () Bool)

(assert (=> b!1281055 m!1175105))

(assert (=> b!1281055 m!1175105))

(declare-fun m!1175107 () Bool)

(assert (=> b!1281055 m!1175107))

(declare-fun m!1175109 () Bool)

(assert (=> start!108534 m!1175109))

(declare-fun m!1175111 () Bool)

(assert (=> start!108534 m!1175111))

(declare-fun m!1175113 () Bool)

(assert (=> start!108534 m!1175113))

(declare-fun m!1175115 () Bool)

(assert (=> b!1281052 m!1175115))

(declare-fun m!1175117 () Bool)

(assert (=> b!1281060 m!1175117))

(declare-fun m!1175119 () Bool)

(assert (=> b!1281059 m!1175119))

(check-sat b_and!46123 (not b_next!28081) (not mapNonEmpty!52133) (not b!1281052) (not start!108534) (not b!1281051) (not b!1281055) (not b!1281060) tp_is_empty!33721)
(check-sat b_and!46123 (not b_next!28081))
