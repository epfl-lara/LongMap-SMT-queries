; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108676 () Bool)

(assert start!108676)

(declare-fun b_free!28189 () Bool)

(declare-fun b_next!28189 () Bool)

(assert (=> start!108676 (= b_free!28189 (not b_next!28189))))

(declare-fun tp!99683 () Bool)

(declare-fun b_and!46255 () Bool)

(assert (=> start!108676 (= tp!99683 b_and!46255)))

(declare-fun b!1282840 () Bool)

(declare-fun e!732980 () Bool)

(declare-fun tp_is_empty!33829 () Bool)

(assert (=> b!1282840 (= e!732980 tp_is_empty!33829)))

(declare-fun b!1282841 () Bool)

(declare-fun res!852099 () Bool)

(declare-fun e!732978 () Bool)

(assert (=> b!1282841 (=> (not res!852099) (not e!732978))))

(declare-datatypes ((array!84726 0))(
  ( (array!84727 (arr!40865 (Array (_ BitVec 32) (_ BitVec 64))) (size!41415 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84726)

(declare-datatypes ((List!28953 0))(
  ( (Nil!28950) (Cons!28949 (h!30158 (_ BitVec 64)) (t!42497 List!28953)) )
))
(declare-fun arrayNoDuplicates!0 (array!84726 (_ BitVec 32) List!28953) Bool)

(assert (=> b!1282841 (= res!852099 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28950))))

(declare-fun b!1282842 () Bool)

(declare-fun res!852103 () Bool)

(assert (=> b!1282842 (=> (not res!852103) (not e!732978))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282842 (= res!852103 (validKeyInArray!0 (select (arr!40865 _keys!1741) from!2144)))))

(declare-fun b!1282843 () Bool)

(declare-fun res!852104 () Bool)

(assert (=> b!1282843 (=> (not res!852104) (not e!732978))))

(declare-datatypes ((V!50209 0))(
  ( (V!50210 (val!16989 Int)) )
))
(declare-fun minValue!1387 () V!50209)

(declare-fun zeroValue!1387 () V!50209)

(declare-datatypes ((ValueCell!16016 0))(
  ( (ValueCellFull!16016 (v!19591 V!50209)) (EmptyCell!16016) )
))
(declare-datatypes ((array!84728 0))(
  ( (array!84729 (arr!40866 (Array (_ BitVec 32) ValueCell!16016)) (size!41416 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84728)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21756 0))(
  ( (tuple2!21757 (_1!10889 (_ BitVec 64)) (_2!10889 V!50209)) )
))
(declare-datatypes ((List!28954 0))(
  ( (Nil!28951) (Cons!28950 (h!30159 tuple2!21756) (t!42498 List!28954)) )
))
(declare-datatypes ((ListLongMap!19413 0))(
  ( (ListLongMap!19414 (toList!9722 List!28954)) )
))
(declare-fun contains!7839 (ListLongMap!19413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4806 (array!84726 array!84728 (_ BitVec 32) (_ BitVec 32) V!50209 V!50209 (_ BitVec 32) Int) ListLongMap!19413)

(assert (=> b!1282843 (= res!852104 (contains!7839 (getCurrentListMap!4806 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!52301 () Bool)

(declare-fun mapRes!52301 () Bool)

(declare-fun tp!99682 () Bool)

(declare-fun e!732977 () Bool)

(assert (=> mapNonEmpty!52301 (= mapRes!52301 (and tp!99682 e!732977))))

(declare-fun mapRest!52301 () (Array (_ BitVec 32) ValueCell!16016))

(declare-fun mapValue!52301 () ValueCell!16016)

(declare-fun mapKey!52301 () (_ BitVec 32))

(assert (=> mapNonEmpty!52301 (= (arr!40866 _values!1445) (store mapRest!52301 mapKey!52301 mapValue!52301))))

(declare-fun res!852100 () Bool)

(assert (=> start!108676 (=> (not res!852100) (not e!732978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108676 (= res!852100 (validMask!0 mask!2175))))

(assert (=> start!108676 e!732978))

(assert (=> start!108676 tp_is_empty!33829))

(assert (=> start!108676 true))

(declare-fun e!732979 () Bool)

(declare-fun array_inv!31001 (array!84728) Bool)

(assert (=> start!108676 (and (array_inv!31001 _values!1445) e!732979)))

(declare-fun array_inv!31002 (array!84726) Bool)

(assert (=> start!108676 (array_inv!31002 _keys!1741)))

(assert (=> start!108676 tp!99683))

(declare-fun mapIsEmpty!52301 () Bool)

(assert (=> mapIsEmpty!52301 mapRes!52301))

(declare-fun b!1282844 () Bool)

(declare-fun res!852097 () Bool)

(assert (=> b!1282844 (=> (not res!852097) (not e!732978))))

(assert (=> b!1282844 (= res!852097 (and (= (size!41416 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41415 _keys!1741) (size!41416 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282845 () Bool)

(assert (=> b!1282845 (= e!732978 false)))

(declare-fun lt!576571 () Bool)

(declare-fun +!4274 (ListLongMap!19413 tuple2!21756) ListLongMap!19413)

(declare-fun getCurrentListMapNoExtraKeys!5904 (array!84726 array!84728 (_ BitVec 32) (_ BitVec 32) V!50209 V!50209 (_ BitVec 32) Int) ListLongMap!19413)

(assert (=> b!1282845 (= lt!576571 (contains!7839 (+!4274 (+!4274 (getCurrentListMapNoExtraKeys!5904 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!21757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun b!1282846 () Bool)

(declare-fun res!852105 () Bool)

(assert (=> b!1282846 (=> (not res!852105) (not e!732978))))

(assert (=> b!1282846 (= res!852105 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41415 _keys!1741))))))

(declare-fun b!1282847 () Bool)

(declare-fun res!852101 () Bool)

(assert (=> b!1282847 (=> (not res!852101) (not e!732978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84726 (_ BitVec 32)) Bool)

(assert (=> b!1282847 (= res!852101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282848 () Bool)

(assert (=> b!1282848 (= e!732977 tp_is_empty!33829)))

(declare-fun b!1282849 () Bool)

(declare-fun res!852098 () Bool)

(assert (=> b!1282849 (=> (not res!852098) (not e!732978))))

(assert (=> b!1282849 (= res!852098 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1282850 () Bool)

(declare-fun res!852102 () Bool)

(assert (=> b!1282850 (=> (not res!852102) (not e!732978))))

(assert (=> b!1282850 (= res!852102 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41415 _keys!1741))))))

(declare-fun b!1282851 () Bool)

(assert (=> b!1282851 (= e!732979 (and e!732980 mapRes!52301))))

(declare-fun condMapEmpty!52301 () Bool)

(declare-fun mapDefault!52301 () ValueCell!16016)

