; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108738 () Bool)

(assert start!108738)

(declare-fun b_free!28251 () Bool)

(declare-fun b_next!28251 () Bool)

(assert (=> start!108738 (= b_free!28251 (not b_next!28251))))

(declare-fun tp!99869 () Bool)

(declare-fun b_and!46317 () Bool)

(assert (=> start!108738 (= tp!99869 b_and!46317)))

(declare-fun b!1283957 () Bool)

(declare-fun res!852935 () Bool)

(declare-fun e!733443 () Bool)

(assert (=> b!1283957 (=> (not res!852935) (not e!733443))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50291 0))(
  ( (V!50292 (val!17020 Int)) )
))
(declare-datatypes ((ValueCell!16047 0))(
  ( (ValueCellFull!16047 (v!19622 V!50291)) (EmptyCell!16047) )
))
(declare-datatypes ((array!84840 0))(
  ( (array!84841 (arr!40922 (Array (_ BitVec 32) ValueCell!16047)) (size!41472 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84840)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84842 0))(
  ( (array!84843 (arr!40923 (Array (_ BitVec 32) (_ BitVec 64))) (size!41473 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84842)

(assert (=> b!1283957 (= res!852935 (and (= (size!41472 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41473 _keys!1741) (size!41472 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283958 () Bool)

(declare-fun res!852936 () Bool)

(assert (=> b!1283958 (=> (not res!852936) (not e!733443))))

(assert (=> b!1283958 (= res!852936 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!52394 () Bool)

(declare-fun mapRes!52394 () Bool)

(declare-fun tp!99868 () Bool)

(declare-fun e!733445 () Bool)

(assert (=> mapNonEmpty!52394 (= mapRes!52394 (and tp!99868 e!733445))))

(declare-fun mapKey!52394 () (_ BitVec 32))

(declare-fun mapValue!52394 () ValueCell!16047)

(declare-fun mapRest!52394 () (Array (_ BitVec 32) ValueCell!16047))

(assert (=> mapNonEmpty!52394 (= (arr!40922 _values!1445) (store mapRest!52394 mapKey!52394 mapValue!52394))))

(declare-fun b!1283959 () Bool)

(declare-fun res!852934 () Bool)

(assert (=> b!1283959 (=> (not res!852934) (not e!733443))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1283959 (= res!852934 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41473 _keys!1741))))))

(declare-fun b!1283960 () Bool)

(declare-fun e!733444 () Bool)

(declare-fun tp_is_empty!33891 () Bool)

(assert (=> b!1283960 (= e!733444 tp_is_empty!33891)))

(declare-fun b!1283961 () Bool)

(declare-fun res!852942 () Bool)

(assert (=> b!1283961 (=> (not res!852942) (not e!733443))))

(declare-datatypes ((List!28993 0))(
  ( (Nil!28990) (Cons!28989 (h!30198 (_ BitVec 64)) (t!42537 List!28993)) )
))
(declare-fun arrayNoDuplicates!0 (array!84842 (_ BitVec 32) List!28993) Bool)

(assert (=> b!1283961 (= res!852942 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28990))))

(declare-fun b!1283962 () Bool)

(assert (=> b!1283962 (= e!733445 tp_is_empty!33891)))

(declare-fun res!852941 () Bool)

(assert (=> start!108738 (=> (not res!852941) (not e!733443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108738 (= res!852941 (validMask!0 mask!2175))))

(assert (=> start!108738 e!733443))

(assert (=> start!108738 tp_is_empty!33891))

(assert (=> start!108738 true))

(declare-fun e!733441 () Bool)

(declare-fun array_inv!31039 (array!84840) Bool)

(assert (=> start!108738 (and (array_inv!31039 _values!1445) e!733441)))

(declare-fun array_inv!31040 (array!84842) Bool)

(assert (=> start!108738 (array_inv!31040 _keys!1741)))

(assert (=> start!108738 tp!99869))

(declare-fun b!1283956 () Bool)

(declare-fun res!852940 () Bool)

(assert (=> b!1283956 (=> (not res!852940) (not e!733443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283956 (= res!852940 (validKeyInArray!0 (select (arr!40923 _keys!1741) from!2144)))))

(declare-fun mapIsEmpty!52394 () Bool)

(assert (=> mapIsEmpty!52394 mapRes!52394))

(declare-fun b!1283963 () Bool)

(declare-fun res!852937 () Bool)

(assert (=> b!1283963 (=> (not res!852937) (not e!733443))))

(assert (=> b!1283963 (= res!852937 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41473 _keys!1741))))))

(declare-fun b!1283964 () Bool)

(assert (=> b!1283964 (= e!733441 (and e!733444 mapRes!52394))))

(declare-fun condMapEmpty!52394 () Bool)

(declare-fun mapDefault!52394 () ValueCell!16047)

(assert (=> b!1283964 (= condMapEmpty!52394 (= (arr!40922 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16047)) mapDefault!52394)))))

(declare-fun b!1283965 () Bool)

(declare-fun res!852938 () Bool)

(assert (=> b!1283965 (=> (not res!852938) (not e!733443))))

(declare-fun minValue!1387 () V!50291)

(declare-fun zeroValue!1387 () V!50291)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21798 0))(
  ( (tuple2!21799 (_1!10910 (_ BitVec 64)) (_2!10910 V!50291)) )
))
(declare-datatypes ((List!28994 0))(
  ( (Nil!28991) (Cons!28990 (h!30199 tuple2!21798) (t!42538 List!28994)) )
))
(declare-datatypes ((ListLongMap!19455 0))(
  ( (ListLongMap!19456 (toList!9743 List!28994)) )
))
(declare-fun contains!7860 (ListLongMap!19455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4823 (array!84842 array!84840 (_ BitVec 32) (_ BitVec 32) V!50291 V!50291 (_ BitVec 32) Int) ListLongMap!19455)

(assert (=> b!1283965 (= res!852938 (contains!7860 (getCurrentListMap!4823 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283966 () Bool)

(declare-fun res!852939 () Bool)

(assert (=> b!1283966 (=> (not res!852939) (not e!733443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84842 (_ BitVec 32)) Bool)

(assert (=> b!1283966 (= res!852939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283967 () Bool)

(assert (=> b!1283967 (= e!733443 (not (bvsle from!2144 (size!41473 _keys!1741))))))

(declare-fun lt!576741 () ListLongMap!19455)

(assert (=> b!1283967 (contains!7860 lt!576741 k0!1205)))

(declare-datatypes ((Unit!42493 0))(
  ( (Unit!42494) )
))
(declare-fun lt!576742 () Unit!42493)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!17 ((_ BitVec 64) (_ BitVec 64) V!50291 ListLongMap!19455) Unit!42493)

(assert (=> b!1283967 (= lt!576742 (lemmaInListMapAfterAddingDiffThenInBefore!17 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576741))))

(declare-fun +!4293 (ListLongMap!19455 tuple2!21798) ListLongMap!19455)

(declare-fun getCurrentListMapNoExtraKeys!5923 (array!84842 array!84840 (_ BitVec 32) (_ BitVec 32) V!50291 V!50291 (_ BitVec 32) Int) ListLongMap!19455)

(assert (=> b!1283967 (= lt!576741 (+!4293 (getCurrentListMapNoExtraKeys!5923 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and start!108738 res!852941) b!1283957))

(assert (= (and b!1283957 res!852935) b!1283966))

(assert (= (and b!1283966 res!852939) b!1283961))

(assert (= (and b!1283961 res!852942) b!1283963))

(assert (= (and b!1283963 res!852937) b!1283965))

(assert (= (and b!1283965 res!852938) b!1283959))

(assert (= (and b!1283959 res!852934) b!1283956))

(assert (= (and b!1283956 res!852940) b!1283958))

(assert (= (and b!1283958 res!852936) b!1283967))

(assert (= (and b!1283964 condMapEmpty!52394) mapIsEmpty!52394))

(assert (= (and b!1283964 (not condMapEmpty!52394)) mapNonEmpty!52394))

(get-info :version)

(assert (= (and mapNonEmpty!52394 ((_ is ValueCellFull!16047) mapValue!52394)) b!1283962))

(assert (= (and b!1283964 ((_ is ValueCellFull!16047) mapDefault!52394)) b!1283960))

(assert (= start!108738 b!1283964))

(declare-fun m!1177765 () Bool)

(assert (=> mapNonEmpty!52394 m!1177765))

(declare-fun m!1177767 () Bool)

(assert (=> b!1283961 m!1177767))

(declare-fun m!1177769 () Bool)

(assert (=> b!1283967 m!1177769))

(declare-fun m!1177771 () Bool)

(assert (=> b!1283967 m!1177771))

(declare-fun m!1177773 () Bool)

(assert (=> b!1283967 m!1177773))

(assert (=> b!1283967 m!1177773))

(declare-fun m!1177775 () Bool)

(assert (=> b!1283967 m!1177775))

(declare-fun m!1177777 () Bool)

(assert (=> b!1283965 m!1177777))

(assert (=> b!1283965 m!1177777))

(declare-fun m!1177779 () Bool)

(assert (=> b!1283965 m!1177779))

(declare-fun m!1177781 () Bool)

(assert (=> b!1283956 m!1177781))

(assert (=> b!1283956 m!1177781))

(declare-fun m!1177783 () Bool)

(assert (=> b!1283956 m!1177783))

(declare-fun m!1177785 () Bool)

(assert (=> b!1283966 m!1177785))

(declare-fun m!1177787 () Bool)

(assert (=> start!108738 m!1177787))

(declare-fun m!1177789 () Bool)

(assert (=> start!108738 m!1177789))

(declare-fun m!1177791 () Bool)

(assert (=> start!108738 m!1177791))

(check-sat (not b!1283967) (not b!1283956) (not mapNonEmpty!52394) (not b_next!28251) b_and!46317 (not start!108738) (not b!1283961) (not b!1283966) tp_is_empty!33891 (not b!1283965))
(check-sat b_and!46317 (not b_next!28251))
