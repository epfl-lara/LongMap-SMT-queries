; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109820 () Bool)

(assert start!109820)

(declare-fun b_free!29213 () Bool)

(declare-fun b_next!29213 () Bool)

(assert (=> start!109820 (= b_free!29213 (not b_next!29213))))

(declare-fun tp!102773 () Bool)

(declare-fun b_and!47327 () Bool)

(assert (=> start!109820 (= tp!102773 b_and!47327)))

(declare-fun b!1301163 () Bool)

(declare-fun res!864533 () Bool)

(declare-fun e!742154 () Bool)

(assert (=> b!1301163 (=> (not res!864533) (not e!742154))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51573 0))(
  ( (V!51574 (val!17501 Int)) )
))
(declare-datatypes ((ValueCell!16528 0))(
  ( (ValueCellFull!16528 (v!20109 V!51573)) (EmptyCell!16528) )
))
(declare-datatypes ((array!86716 0))(
  ( (array!86717 (arr!41854 (Array (_ BitVec 32) ValueCell!16528)) (size!42404 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86716)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86718 0))(
  ( (array!86719 (arr!41855 (Array (_ BitVec 32) (_ BitVec 64))) (size!42405 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86718)

(assert (=> b!1301163 (= res!864533 (and (= (size!42404 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42405 _keys!1741) (size!42404 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63868 () Bool)

(declare-fun call!63873 () Bool)

(declare-fun call!63871 () Bool)

(assert (=> bm!63868 (= call!63873 call!63871)))

(declare-fun b!1301164 () Bool)

(declare-fun res!864536 () Bool)

(assert (=> b!1301164 (=> (not res!864536) (not e!742154))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1301164 (= res!864536 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42405 _keys!1741))))))

(declare-fun b!1301165 () Bool)

(assert (=> b!1301165 call!63873))

(declare-datatypes ((Unit!43063 0))(
  ( (Unit!43064) )
))
(declare-fun lt!581791 () Unit!43063)

(declare-fun call!63875 () Unit!43063)

(assert (=> b!1301165 (= lt!581791 call!63875)))

(declare-datatypes ((tuple2!22576 0))(
  ( (tuple2!22577 (_1!11299 (_ BitVec 64)) (_2!11299 V!51573)) )
))
(declare-datatypes ((List!29706 0))(
  ( (Nil!29703) (Cons!29702 (h!30911 tuple2!22576) (t!43280 List!29706)) )
))
(declare-datatypes ((ListLongMap!20233 0))(
  ( (ListLongMap!20234 (toList!10132 List!29706)) )
))
(declare-fun lt!581792 () ListLongMap!20233)

(declare-fun call!63872 () ListLongMap!20233)

(assert (=> b!1301165 (= lt!581792 call!63872)))

(declare-fun e!742160 () Unit!43063)

(assert (=> b!1301165 (= e!742160 lt!581791)))

(declare-fun b!1301166 () Bool)

(declare-fun res!864538 () Bool)

(assert (=> b!1301166 (=> (not res!864538) (not e!742154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301166 (= res!864538 (validKeyInArray!0 (select (arr!41855 _keys!1741) from!2144)))))

(declare-fun b!1301167 () Bool)

(declare-fun res!864535 () Bool)

(assert (=> b!1301167 (=> (not res!864535) (not e!742154))))

(declare-fun minValue!1387 () V!51573)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!51573)

(declare-fun defaultEntry!1448 () Int)

(declare-fun contains!8258 (ListLongMap!20233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5157 (array!86718 array!86716 (_ BitVec 32) (_ BitVec 32) V!51573 V!51573 (_ BitVec 32) Int) ListLongMap!20233)

(assert (=> b!1301167 (= res!864535 (contains!8258 (getCurrentListMap!5157 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1301168 () Bool)

(declare-fun res!864534 () Bool)

(assert (=> b!1301168 (=> (not res!864534) (not e!742154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86718 (_ BitVec 32)) Bool)

(assert (=> b!1301168 (= res!864534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!63869 () Bool)

(declare-fun call!63874 () ListLongMap!20233)

(declare-fun getCurrentListMapNoExtraKeys!6091 (array!86718 array!86716 (_ BitVec 32) (_ BitVec 32) V!51573 V!51573 (_ BitVec 32) Int) ListLongMap!20233)

(assert (=> bm!63869 (= call!63874 (getCurrentListMapNoExtraKeys!6091 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301169 () Bool)

(assert (=> b!1301169 (= e!742154 (not (or (= k!1205 (select (arr!41855 _keys!1741) from!2144)) (not (= (select (arr!41855 _keys!1741) from!2144) k!1205)))))))

(assert (=> b!1301169 (not (contains!8258 (ListLongMap!20234 Nil!29703) k!1205))))

(declare-fun lt!581788 () Unit!43063)

(declare-fun emptyContainsNothing!200 ((_ BitVec 64)) Unit!43063)

(assert (=> b!1301169 (= lt!581788 (emptyContainsNothing!200 k!1205))))

(declare-fun lt!581796 () Unit!43063)

(declare-fun e!742155 () Unit!43063)

(assert (=> b!1301169 (= lt!581796 e!742155)))

(declare-fun c!124705 () Bool)

(declare-fun lt!581794 () Bool)

(assert (=> b!1301169 (= c!124705 (and (not lt!581794) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301169 (= lt!581794 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!581797 () ListLongMap!20233)

(declare-fun c!124704 () Bool)

(declare-fun lt!581789 () ListLongMap!20233)

(declare-fun bm!63870 () Bool)

(assert (=> bm!63870 (= call!63871 (contains!8258 (ite c!124705 lt!581789 (ite c!124704 lt!581792 lt!581797)) k!1205))))

(declare-fun b!1301170 () Bool)

(declare-fun lt!581790 () Unit!43063)

(assert (=> b!1301170 (= e!742155 lt!581790)))

(declare-fun lt!581798 () ListLongMap!20233)

(assert (=> b!1301170 (= lt!581798 call!63874)))

(declare-fun +!4459 (ListLongMap!20233 tuple2!22576) ListLongMap!20233)

(assert (=> b!1301170 (= lt!581789 (+!4459 lt!581798 (tuple2!22577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581793 () Unit!43063)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!82 ((_ BitVec 64) (_ BitVec 64) V!51573 ListLongMap!20233) Unit!43063)

(assert (=> b!1301170 (= lt!581793 (lemmaInListMapAfterAddingDiffThenInBefore!82 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581789))))

(assert (=> b!1301170 call!63871))

(declare-fun call!63876 () Unit!43063)

(assert (=> b!1301170 (= lt!581790 call!63876)))

(assert (=> b!1301170 (contains!8258 lt!581798 k!1205)))

(declare-fun b!1301171 () Bool)

(assert (=> b!1301171 (= e!742155 e!742160)))

(assert (=> b!1301171 (= c!124704 (and (not lt!581794) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301172 () Bool)

(declare-fun e!742157 () Bool)

(declare-fun e!742159 () Bool)

(declare-fun mapRes!53855 () Bool)

(assert (=> b!1301172 (= e!742157 (and e!742159 mapRes!53855))))

(declare-fun condMapEmpty!53855 () Bool)

(declare-fun mapDefault!53855 () ValueCell!16528)

