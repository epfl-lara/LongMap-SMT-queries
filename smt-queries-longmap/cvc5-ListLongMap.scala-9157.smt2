; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109822 () Bool)

(assert start!109822)

(declare-fun b_free!29215 () Bool)

(declare-fun b_next!29215 () Bool)

(assert (=> start!109822 (= b_free!29215 (not b_next!29215))))

(declare-fun tp!102779 () Bool)

(declare-fun b_and!47329 () Bool)

(assert (=> start!109822 (= tp!102779 b_and!47329)))

(declare-fun b!1301216 () Bool)

(declare-datatypes ((Unit!43065 0))(
  ( (Unit!43066) )
))
(declare-fun e!742179 () Unit!43065)

(declare-fun lt!581831 () Unit!43065)

(assert (=> b!1301216 (= e!742179 lt!581831)))

(declare-datatypes ((V!51577 0))(
  ( (V!51578 (val!17502 Int)) )
))
(declare-datatypes ((tuple2!22578 0))(
  ( (tuple2!22579 (_1!11300 (_ BitVec 64)) (_2!11300 V!51577)) )
))
(declare-datatypes ((List!29707 0))(
  ( (Nil!29704) (Cons!29703 (h!30912 tuple2!22578) (t!43283 List!29707)) )
))
(declare-datatypes ((ListLongMap!20235 0))(
  ( (ListLongMap!20236 (toList!10133 List!29707)) )
))
(declare-fun lt!581836 () ListLongMap!20235)

(declare-fun call!63889 () ListLongMap!20235)

(assert (=> b!1301216 (= lt!581836 call!63889)))

(declare-fun lt!581837 () ListLongMap!20235)

(declare-fun zeroValue!1387 () V!51577)

(declare-fun +!4460 (ListLongMap!20235 tuple2!22578) ListLongMap!20235)

(assert (=> b!1301216 (= lt!581837 (+!4460 lt!581836 (tuple2!22579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581833 () Unit!43065)

(declare-fun call!63890 () Unit!43065)

(assert (=> b!1301216 (= lt!581833 call!63890)))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8259 (ListLongMap!20235 (_ BitVec 64)) Bool)

(assert (=> b!1301216 (contains!8259 lt!581837 k!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!83 ((_ BitVec 64) (_ BitVec 64) V!51577 ListLongMap!20235) Unit!43065)

(assert (=> b!1301216 (= lt!581831 (lemmaInListMapAfterAddingDiffThenInBefore!83 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581836))))

(declare-fun call!63893 () Bool)

(assert (=> b!1301216 call!63893))

(declare-fun mapNonEmpty!53858 () Bool)

(declare-fun mapRes!53858 () Bool)

(declare-fun tp!102778 () Bool)

(declare-fun e!742182 () Bool)

(assert (=> mapNonEmpty!53858 (= mapRes!53858 (and tp!102778 e!742182))))

(declare-datatypes ((ValueCell!16529 0))(
  ( (ValueCellFull!16529 (v!20110 V!51577)) (EmptyCell!16529) )
))
(declare-fun mapValue!53858 () ValueCell!16529)

(declare-datatypes ((array!86720 0))(
  ( (array!86721 (arr!41856 (Array (_ BitVec 32) ValueCell!16529)) (size!42406 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86720)

(declare-fun mapKey!53858 () (_ BitVec 32))

(declare-fun mapRest!53858 () (Array (_ BitVec 32) ValueCell!16529))

(assert (=> mapNonEmpty!53858 (= (arr!41856 _values!1445) (store mapRest!53858 mapKey!53858 mapValue!53858))))

(declare-fun b!1301217 () Bool)

(declare-fun c!124714 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!581826 () Bool)

(assert (=> b!1301217 (= c!124714 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581826))))

(declare-fun e!742184 () Unit!43065)

(declare-fun e!742186 () Unit!43065)

(assert (=> b!1301217 (= e!742184 e!742186)))

(declare-fun b!1301218 () Bool)

(declare-fun call!63891 () Bool)

(assert (=> b!1301218 call!63891))

(declare-fun lt!581830 () Unit!43065)

(declare-fun call!63894 () Unit!43065)

(assert (=> b!1301218 (= lt!581830 call!63894)))

(declare-fun lt!581827 () ListLongMap!20235)

(declare-fun call!63892 () ListLongMap!20235)

(assert (=> b!1301218 (= lt!581827 call!63892)))

(assert (=> b!1301218 (= e!742184 lt!581830)))

(declare-fun b!1301219 () Bool)

(declare-fun res!864559 () Bool)

(declare-fun e!742185 () Bool)

(assert (=> b!1301219 (=> (not res!864559) (not e!742185))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!86722 0))(
  ( (array!86723 (arr!41857 (Array (_ BitVec 32) (_ BitVec 64))) (size!42407 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86722)

(assert (=> b!1301219 (= res!864559 (and (= (size!42406 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42407 _keys!1741) (size!42406 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301220 () Bool)

(declare-fun res!864561 () Bool)

(assert (=> b!1301220 (=> (not res!864561) (not e!742185))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301220 (= res!864561 (validKeyInArray!0 (select (arr!41857 _keys!1741) from!2144)))))

(declare-fun minValue!1387 () V!51577)

(declare-fun bm!63886 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6092 (array!86722 array!86720 (_ BitVec 32) (_ BitVec 32) V!51577 V!51577 (_ BitVec 32) Int) ListLongMap!20235)

(assert (=> bm!63886 (= call!63889 (getCurrentListMapNoExtraKeys!6092 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301221 () Bool)

(declare-fun e!742183 () Bool)

(assert (=> b!1301221 (= e!742185 (not e!742183))))

(declare-fun res!864564 () Bool)

(assert (=> b!1301221 (=> res!864564 e!742183)))

(assert (=> b!1301221 (= res!864564 (= k!1205 (select (arr!41857 _keys!1741) from!2144)))))

(assert (=> b!1301221 (not (contains!8259 (ListLongMap!20236 Nil!29704) k!1205))))

(declare-fun lt!581825 () Unit!43065)

(declare-fun emptyContainsNothing!201 ((_ BitVec 64)) Unit!43065)

(assert (=> b!1301221 (= lt!581825 (emptyContainsNothing!201 k!1205))))

(declare-fun lt!581829 () Unit!43065)

(assert (=> b!1301221 (= lt!581829 e!742179)))

(declare-fun c!124713 () Bool)

(assert (=> b!1301221 (= c!124713 (and (not lt!581826) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301221 (= lt!581826 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301222 () Bool)

(declare-fun res!864566 () Bool)

(assert (=> b!1301222 (=> (not res!864566) (not e!742185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86722 (_ BitVec 32)) Bool)

(assert (=> b!1301222 (= res!864566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301223 () Bool)

(declare-fun tp_is_empty!34855 () Bool)

(assert (=> b!1301223 (= e!742182 tp_is_empty!34855)))

(declare-fun b!1301224 () Bool)

(declare-fun res!864558 () Bool)

(assert (=> b!1301224 (=> (not res!864558) (not e!742185))))

(declare-fun getCurrentListMap!5158 (array!86722 array!86720 (_ BitVec 32) (_ BitVec 32) V!51577 V!51577 (_ BitVec 32) Int) ListLongMap!20235)

(assert (=> b!1301224 (= res!864558 (contains!8259 (getCurrentListMap!5158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1301225 () Bool)

(assert (=> b!1301225 (= e!742179 e!742184)))

(declare-fun c!124715 () Bool)

(assert (=> b!1301225 (= c!124715 (and (not lt!581826) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301226 () Bool)

(declare-fun e!742187 () Bool)

(declare-fun e!742180 () Bool)

(assert (=> b!1301226 (= e!742187 (and e!742180 mapRes!53858))))

(declare-fun condMapEmpty!53858 () Bool)

(declare-fun mapDefault!53858 () ValueCell!16529)

