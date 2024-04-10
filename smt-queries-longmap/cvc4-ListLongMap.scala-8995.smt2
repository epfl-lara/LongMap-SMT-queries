; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108734 () Bool)

(assert start!108734)

(declare-fun b_free!28247 () Bool)

(declare-fun b_next!28247 () Bool)

(assert (=> start!108734 (= b_free!28247 (not b_next!28247))))

(declare-fun tp!99857 () Bool)

(declare-fun b_and!46313 () Bool)

(assert (=> start!108734 (= tp!99857 b_and!46313)))

(declare-fun res!852888 () Bool)

(declare-fun e!733414 () Bool)

(assert (=> start!108734 (=> (not res!852888) (not e!733414))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108734 (= res!852888 (validMask!0 mask!2175))))

(assert (=> start!108734 e!733414))

(declare-fun tp_is_empty!33887 () Bool)

(assert (=> start!108734 tp_is_empty!33887))

(assert (=> start!108734 true))

(declare-datatypes ((V!50285 0))(
  ( (V!50286 (val!17018 Int)) )
))
(declare-datatypes ((ValueCell!16045 0))(
  ( (ValueCellFull!16045 (v!19620 V!50285)) (EmptyCell!16045) )
))
(declare-datatypes ((array!84834 0))(
  ( (array!84835 (arr!40919 (Array (_ BitVec 32) ValueCell!16045)) (size!41469 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84834)

(declare-fun e!733415 () Bool)

(declare-fun array_inv!31037 (array!84834) Bool)

(assert (=> start!108734 (and (array_inv!31037 _values!1445) e!733415)))

(declare-datatypes ((array!84836 0))(
  ( (array!84837 (arr!40920 (Array (_ BitVec 32) (_ BitVec 64))) (size!41470 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84836)

(declare-fun array_inv!31038 (array!84836) Bool)

(assert (=> start!108734 (array_inv!31038 _keys!1741)))

(assert (=> start!108734 tp!99857))

(declare-fun b!1283884 () Bool)

(declare-fun res!852882 () Bool)

(assert (=> b!1283884 (=> (not res!852882) (not e!733414))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1283884 (= res!852882 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41470 _keys!1741))))))

(declare-fun b!1283885 () Bool)

(declare-fun e!733411 () Bool)

(assert (=> b!1283885 (= e!733411 tp_is_empty!33887)))

(declare-fun b!1283886 () Bool)

(declare-fun res!852887 () Bool)

(assert (=> b!1283886 (=> (not res!852887) (not e!733414))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1283886 (= res!852887 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41470 _keys!1741))))))

(declare-fun b!1283887 () Bool)

(declare-fun e!733412 () Bool)

(assert (=> b!1283887 (= e!733412 tp_is_empty!33887)))

(declare-fun b!1283888 () Bool)

(assert (=> b!1283888 (= e!733414 (not true))))

(declare-datatypes ((tuple2!21796 0))(
  ( (tuple2!21797 (_1!10909 (_ BitVec 64)) (_2!10909 V!50285)) )
))
(declare-datatypes ((List!28992 0))(
  ( (Nil!28989) (Cons!28988 (h!30197 tuple2!21796) (t!42536 List!28992)) )
))
(declare-datatypes ((ListLongMap!19453 0))(
  ( (ListLongMap!19454 (toList!9742 List!28992)) )
))
(declare-fun lt!576730 () ListLongMap!19453)

(declare-fun contains!7859 (ListLongMap!19453 (_ BitVec 64)) Bool)

(assert (=> b!1283888 (contains!7859 lt!576730 k!1205)))

(declare-fun minValue!1387 () V!50285)

(declare-datatypes ((Unit!42491 0))(
  ( (Unit!42492) )
))
(declare-fun lt!576729 () Unit!42491)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!16 ((_ BitVec 64) (_ BitVec 64) V!50285 ListLongMap!19453) Unit!42491)

(assert (=> b!1283888 (= lt!576729 (lemmaInListMapAfterAddingDiffThenInBefore!16 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576730))))

(declare-fun zeroValue!1387 () V!50285)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4292 (ListLongMap!19453 tuple2!21796) ListLongMap!19453)

(declare-fun getCurrentListMapNoExtraKeys!5922 (array!84836 array!84834 (_ BitVec 32) (_ BitVec 32) V!50285 V!50285 (_ BitVec 32) Int) ListLongMap!19453)

(assert (=> b!1283888 (= lt!576730 (+!4292 (getCurrentListMapNoExtraKeys!5922 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283889 () Bool)

(declare-fun res!852885 () Bool)

(assert (=> b!1283889 (=> (not res!852885) (not e!733414))))

(assert (=> b!1283889 (= res!852885 (and (= (size!41469 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41470 _keys!1741) (size!41469 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52388 () Bool)

(declare-fun mapRes!52388 () Bool)

(declare-fun tp!99856 () Bool)

(assert (=> mapNonEmpty!52388 (= mapRes!52388 (and tp!99856 e!733411))))

(declare-fun mapValue!52388 () ValueCell!16045)

(declare-fun mapRest!52388 () (Array (_ BitVec 32) ValueCell!16045))

(declare-fun mapKey!52388 () (_ BitVec 32))

(assert (=> mapNonEmpty!52388 (= (arr!40919 _values!1445) (store mapRest!52388 mapKey!52388 mapValue!52388))))

(declare-fun b!1283890 () Bool)

(declare-fun res!852880 () Bool)

(assert (=> b!1283890 (=> (not res!852880) (not e!733414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84836 (_ BitVec 32)) Bool)

(assert (=> b!1283890 (= res!852880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283891 () Bool)

(declare-fun res!852886 () Bool)

(assert (=> b!1283891 (=> (not res!852886) (not e!733414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283891 (= res!852886 (validKeyInArray!0 (select (arr!40920 _keys!1741) from!2144)))))

(declare-fun b!1283892 () Bool)

(declare-fun res!852883 () Bool)

(assert (=> b!1283892 (=> (not res!852883) (not e!733414))))

(declare-fun getCurrentListMap!4822 (array!84836 array!84834 (_ BitVec 32) (_ BitVec 32) V!50285 V!50285 (_ BitVec 32) Int) ListLongMap!19453)

(assert (=> b!1283892 (= res!852883 (contains!7859 (getCurrentListMap!4822 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52388 () Bool)

(assert (=> mapIsEmpty!52388 mapRes!52388))

(declare-fun b!1283893 () Bool)

(assert (=> b!1283893 (= e!733415 (and e!733412 mapRes!52388))))

(declare-fun condMapEmpty!52388 () Bool)

(declare-fun mapDefault!52388 () ValueCell!16045)

