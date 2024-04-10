; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108688 () Bool)

(assert start!108688)

(declare-fun b_free!28201 () Bool)

(declare-fun b_next!28201 () Bool)

(assert (=> start!108688 (= b_free!28201 (not b_next!28201))))

(declare-fun tp!99718 () Bool)

(declare-fun b_and!46267 () Bool)

(assert (=> start!108688 (= tp!99718 b_and!46267)))

(declare-fun b!1283056 () Bool)

(declare-fun res!852265 () Bool)

(declare-fun e!733070 () Bool)

(assert (=> b!1283056 (=> (not res!852265) (not e!733070))))

(declare-datatypes ((array!84744 0))(
  ( (array!84745 (arr!40874 (Array (_ BitVec 32) (_ BitVec 64))) (size!41424 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84744)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84744 (_ BitVec 32)) Bool)

(assert (=> b!1283056 (= res!852265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283057 () Bool)

(declare-fun res!852267 () Bool)

(assert (=> b!1283057 (=> (not res!852267) (not e!733070))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283057 (= res!852267 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283058 () Bool)

(declare-fun res!852261 () Bool)

(assert (=> b!1283058 (=> (not res!852261) (not e!733070))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1283058 (= res!852261 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41424 _keys!1741))))))

(declare-fun b!1283059 () Bool)

(declare-fun e!733066 () Bool)

(declare-fun tp_is_empty!33841 () Bool)

(assert (=> b!1283059 (= e!733066 tp_is_empty!33841)))

(declare-fun mapIsEmpty!52319 () Bool)

(declare-fun mapRes!52319 () Bool)

(assert (=> mapIsEmpty!52319 mapRes!52319))

(declare-fun b!1283060 () Bool)

(declare-fun res!852263 () Bool)

(assert (=> b!1283060 (=> (not res!852263) (not e!733070))))

(assert (=> b!1283060 (= res!852263 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41424 _keys!1741))))))

(declare-fun mapNonEmpty!52319 () Bool)

(declare-fun tp!99719 () Bool)

(declare-fun e!733068 () Bool)

(assert (=> mapNonEmpty!52319 (= mapRes!52319 (and tp!99719 e!733068))))

(declare-fun mapKey!52319 () (_ BitVec 32))

(declare-datatypes ((V!50225 0))(
  ( (V!50226 (val!16995 Int)) )
))
(declare-datatypes ((ValueCell!16022 0))(
  ( (ValueCellFull!16022 (v!19597 V!50225)) (EmptyCell!16022) )
))
(declare-fun mapRest!52319 () (Array (_ BitVec 32) ValueCell!16022))

(declare-fun mapValue!52319 () ValueCell!16022)

(declare-datatypes ((array!84746 0))(
  ( (array!84747 (arr!40875 (Array (_ BitVec 32) ValueCell!16022)) (size!41425 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84746)

(assert (=> mapNonEmpty!52319 (= (arr!40875 _values!1445) (store mapRest!52319 mapKey!52319 mapValue!52319))))

(declare-fun b!1283061 () Bool)

(assert (=> b!1283061 (= e!733070 (not true))))

(declare-datatypes ((tuple2!21762 0))(
  ( (tuple2!21763 (_1!10892 (_ BitVec 64)) (_2!10892 V!50225)) )
))
(declare-datatypes ((List!28959 0))(
  ( (Nil!28956) (Cons!28955 (h!30164 tuple2!21762) (t!42503 List!28959)) )
))
(declare-datatypes ((ListLongMap!19419 0))(
  ( (ListLongMap!19420 (toList!9725 List!28959)) )
))
(declare-fun lt!576591 () ListLongMap!19419)

(declare-fun contains!7842 (ListLongMap!19419 (_ BitVec 64)) Bool)

(assert (=> b!1283061 (contains!7842 lt!576591 k!1205)))

(declare-fun minValue!1387 () V!50225)

(declare-datatypes ((Unit!42461 0))(
  ( (Unit!42462) )
))
(declare-fun lt!576592 () Unit!42461)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!1 ((_ BitVec 64) (_ BitVec 64) V!50225 ListLongMap!19419) Unit!42461)

(assert (=> b!1283061 (= lt!576592 (lemmaInListMapAfterAddingDiffThenInBefore!1 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576591))))

(declare-fun zeroValue!1387 () V!50225)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4277 (ListLongMap!19419 tuple2!21762) ListLongMap!19419)

(declare-fun getCurrentListMapNoExtraKeys!5907 (array!84744 array!84746 (_ BitVec 32) (_ BitVec 32) V!50225 V!50225 (_ BitVec 32) Int) ListLongMap!19419)

(assert (=> b!1283061 (= lt!576591 (+!4277 (getCurrentListMapNoExtraKeys!5907 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283062 () Bool)

(declare-fun res!852262 () Bool)

(assert (=> b!1283062 (=> (not res!852262) (not e!733070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283062 (= res!852262 (validKeyInArray!0 (select (arr!40874 _keys!1741) from!2144)))))

(declare-fun b!1283063 () Bool)

(declare-fun res!852264 () Bool)

(assert (=> b!1283063 (=> (not res!852264) (not e!733070))))

(declare-fun getCurrentListMap!4809 (array!84744 array!84746 (_ BitVec 32) (_ BitVec 32) V!50225 V!50225 (_ BitVec 32) Int) ListLongMap!19419)

(assert (=> b!1283063 (= res!852264 (contains!7842 (getCurrentListMap!4809 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1283064 () Bool)

(declare-fun res!852260 () Bool)

(assert (=> b!1283064 (=> (not res!852260) (not e!733070))))

(assert (=> b!1283064 (= res!852260 (and (= (size!41425 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41424 _keys!1741) (size!41425 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!852266 () Bool)

(assert (=> start!108688 (=> (not res!852266) (not e!733070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108688 (= res!852266 (validMask!0 mask!2175))))

(assert (=> start!108688 e!733070))

(assert (=> start!108688 tp_is_empty!33841))

(assert (=> start!108688 true))

(declare-fun e!733067 () Bool)

(declare-fun array_inv!31007 (array!84746) Bool)

(assert (=> start!108688 (and (array_inv!31007 _values!1445) e!733067)))

(declare-fun array_inv!31008 (array!84744) Bool)

(assert (=> start!108688 (array_inv!31008 _keys!1741)))

(assert (=> start!108688 tp!99718))

(declare-fun b!1283065 () Bool)

(declare-fun res!852259 () Bool)

(assert (=> b!1283065 (=> (not res!852259) (not e!733070))))

(declare-datatypes ((List!28960 0))(
  ( (Nil!28957) (Cons!28956 (h!30165 (_ BitVec 64)) (t!42504 List!28960)) )
))
(declare-fun arrayNoDuplicates!0 (array!84744 (_ BitVec 32) List!28960) Bool)

(assert (=> b!1283065 (= res!852259 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28957))))

(declare-fun b!1283066 () Bool)

(assert (=> b!1283066 (= e!733068 tp_is_empty!33841)))

(declare-fun b!1283067 () Bool)

(assert (=> b!1283067 (= e!733067 (and e!733066 mapRes!52319))))

(declare-fun condMapEmpty!52319 () Bool)

(declare-fun mapDefault!52319 () ValueCell!16022)

