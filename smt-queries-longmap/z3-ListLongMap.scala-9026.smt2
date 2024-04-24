; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109140 () Bool)

(assert start!109140)

(declare-fun b_free!28429 () Bool)

(declare-fun b_next!28429 () Bool)

(assert (=> start!109140 (= b_free!28429 (not b_next!28429))))

(declare-fun tp!100403 () Bool)

(declare-fun b_and!46515 () Bool)

(assert (=> start!109140 (= tp!100403 b_and!46515)))

(declare-fun mapIsEmpty!52661 () Bool)

(declare-fun mapRes!52661 () Bool)

(assert (=> mapIsEmpty!52661 mapRes!52661))

(declare-fun mapNonEmpty!52661 () Bool)

(declare-fun tp!100402 () Bool)

(declare-fun e!735798 () Bool)

(assert (=> mapNonEmpty!52661 (= mapRes!52661 (and tp!100402 e!735798))))

(declare-datatypes ((V!50529 0))(
  ( (V!50530 (val!17109 Int)) )
))
(declare-datatypes ((ValueCell!16136 0))(
  ( (ValueCellFull!16136 (v!19706 V!50529)) (EmptyCell!16136) )
))
(declare-fun mapRest!52661 () (Array (_ BitVec 32) ValueCell!16136))

(declare-fun mapValue!52661 () ValueCell!16136)

(declare-datatypes ((array!85223 0))(
  ( (array!85224 (arr!41109 (Array (_ BitVec 32) ValueCell!16136)) (size!41660 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85223)

(declare-fun mapKey!52661 () (_ BitVec 32))

(assert (=> mapNonEmpty!52661 (= (arr!41109 _values!1445) (store mapRest!52661 mapKey!52661 mapValue!52661))))

(declare-fun res!855250 () Bool)

(declare-fun e!735793 () Bool)

(assert (=> start!109140 (=> (not res!855250) (not e!735793))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109140 (= res!855250 (validMask!0 mask!2175))))

(assert (=> start!109140 e!735793))

(declare-fun tp_is_empty!34069 () Bool)

(assert (=> start!109140 tp_is_empty!34069))

(assert (=> start!109140 true))

(declare-fun e!735791 () Bool)

(declare-fun array_inv!31381 (array!85223) Bool)

(assert (=> start!109140 (and (array_inv!31381 _values!1445) e!735791)))

(declare-datatypes ((array!85225 0))(
  ( (array!85226 (arr!41110 (Array (_ BitVec 32) (_ BitVec 64))) (size!41661 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85225)

(declare-fun array_inv!31382 (array!85225) Bool)

(assert (=> start!109140 (array_inv!31382 _keys!1741)))

(assert (=> start!109140 tp!100403))

(declare-fun b!1288151 () Bool)

(declare-fun res!855249 () Bool)

(assert (=> b!1288151 (=> (not res!855249) (not e!735793))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1288151 (= res!855249 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41661 _keys!1741))))))

(declare-fun b!1288152 () Bool)

(assert (=> b!1288152 (= e!735793 (not true))))

(declare-datatypes ((tuple2!21964 0))(
  ( (tuple2!21965 (_1!10993 (_ BitVec 64)) (_2!10993 V!50529)) )
))
(declare-datatypes ((List!29158 0))(
  ( (Nil!29155) (Cons!29154 (h!30372 tuple2!21964) (t!42712 List!29158)) )
))
(declare-datatypes ((ListLongMap!19629 0))(
  ( (ListLongMap!19630 (toList!9830 List!29158)) )
))
(declare-fun contains!7960 (ListLongMap!19629 (_ BitVec 64)) Bool)

(assert (=> b!1288152 (not (contains!7960 (ListLongMap!19630 Nil!29155) k0!1205))))

(declare-datatypes ((Unit!42507 0))(
  ( (Unit!42508) )
))
(declare-fun lt!578023 () Unit!42507)

(declare-fun emptyContainsNothing!12 ((_ BitVec 64)) Unit!42507)

(assert (=> b!1288152 (= lt!578023 (emptyContainsNothing!12 k0!1205))))

(declare-fun lt!578022 () Unit!42507)

(declare-fun e!735794 () Unit!42507)

(assert (=> b!1288152 (= lt!578022 e!735794)))

(declare-fun c!124645 () Bool)

(declare-fun lt!578029 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288152 (= c!124645 (and (not lt!578029) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1288152 (= lt!578029 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1288153 () Bool)

(declare-fun e!735796 () Unit!42507)

(assert (=> b!1288153 (= e!735794 e!735796)))

(declare-fun c!124644 () Bool)

(assert (=> b!1288153 (= c!124644 (and (not lt!578029) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1288154 () Bool)

(declare-fun e!735795 () Unit!42507)

(declare-fun Unit!42509 () Unit!42507)

(assert (=> b!1288154 (= e!735795 Unit!42509)))

(declare-fun bm!63122 () Bool)

(declare-fun call!63126 () Unit!42507)

(declare-fun call!63128 () Unit!42507)

(assert (=> bm!63122 (= call!63126 call!63128)))

(declare-fun b!1288155 () Bool)

(declare-fun lt!578030 () Unit!42507)

(assert (=> b!1288155 (= e!735795 lt!578030)))

(declare-fun lt!578024 () ListLongMap!19629)

(declare-fun call!63130 () ListLongMap!19629)

(assert (=> b!1288155 (= lt!578024 call!63130)))

(assert (=> b!1288155 (= lt!578030 call!63126)))

(declare-fun call!63127 () Bool)

(assert (=> b!1288155 call!63127))

(declare-fun b!1288156 () Bool)

(declare-fun res!855245 () Bool)

(assert (=> b!1288156 (=> (not res!855245) (not e!735793))))

(declare-datatypes ((List!29159 0))(
  ( (Nil!29156) (Cons!29155 (h!30373 (_ BitVec 64)) (t!42713 List!29159)) )
))
(declare-fun arrayNoDuplicates!0 (array!85225 (_ BitVec 32) List!29159) Bool)

(assert (=> b!1288156 (= res!855245 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29156))))

(declare-fun bm!63123 () Bool)

(declare-fun call!63125 () Bool)

(assert (=> bm!63123 (= call!63127 call!63125)))

(declare-fun b!1288157 () Bool)

(declare-fun res!855247 () Bool)

(assert (=> b!1288157 (=> (not res!855247) (not e!735793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288157 (= res!855247 (validKeyInArray!0 (select (arr!41110 _keys!1741) from!2144)))))

(declare-fun b!1288158 () Bool)

(declare-fun e!735797 () Bool)

(assert (=> b!1288158 (= e!735797 tp_is_empty!34069)))

(declare-fun minValue!1387 () V!50529)

(declare-fun zeroValue!1387 () V!50529)

(declare-fun bm!63124 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun call!63129 () ListLongMap!19629)

(declare-fun getCurrentListMapNoExtraKeys!5998 (array!85225 array!85223 (_ BitVec 32) (_ BitVec 32) V!50529 V!50529 (_ BitVec 32) Int) ListLongMap!19629)

(assert (=> bm!63124 (= call!63129 (getCurrentListMapNoExtraKeys!5998 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63125 () Bool)

(assert (=> bm!63125 (= call!63130 call!63129)))

(declare-fun b!1288159 () Bool)

(declare-fun res!855243 () Bool)

(assert (=> b!1288159 (=> (not res!855243) (not e!735793))))

(assert (=> b!1288159 (= res!855243 (and (= (size!41660 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41661 _keys!1741) (size!41660 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288160 () Bool)

(declare-fun c!124646 () Bool)

(assert (=> b!1288160 (= c!124646 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!578029))))

(assert (=> b!1288160 (= e!735796 e!735795)))

(declare-fun b!1288161 () Bool)

(declare-fun res!855248 () Bool)

(assert (=> b!1288161 (=> (not res!855248) (not e!735793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85225 (_ BitVec 32)) Bool)

(assert (=> b!1288161 (= res!855248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288162 () Bool)

(assert (=> b!1288162 (= e!735798 tp_is_empty!34069)))

(declare-fun lt!578025 () ListLongMap!19629)

(declare-fun lt!578021 () ListLongMap!19629)

(declare-fun bm!63126 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!37 ((_ BitVec 64) (_ BitVec 64) V!50529 ListLongMap!19629) Unit!42507)

(assert (=> bm!63126 (= call!63128 (lemmaInListMapAfterAddingDiffThenInBefore!37 k0!1205 (ite c!124645 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124644 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124645 minValue!1387 (ite c!124644 zeroValue!1387 minValue!1387)) (ite c!124645 lt!578025 (ite c!124644 lt!578021 lt!578024))))))

(declare-fun b!1288163 () Bool)

(declare-fun res!855246 () Bool)

(assert (=> b!1288163 (=> (not res!855246) (not e!735793))))

(declare-fun getCurrentListMap!4886 (array!85225 array!85223 (_ BitVec 32) (_ BitVec 32) V!50529 V!50529 (_ BitVec 32) Int) ListLongMap!19629)

(assert (=> b!1288163 (= res!855246 (contains!7960 (getCurrentListMap!4886 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288164 () Bool)

(assert (=> b!1288164 (= e!735791 (and e!735797 mapRes!52661))))

(declare-fun condMapEmpty!52661 () Bool)

(declare-fun mapDefault!52661 () ValueCell!16136)

(assert (=> b!1288164 (= condMapEmpty!52661 (= (arr!41109 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16136)) mapDefault!52661)))))

(declare-fun b!1288165 () Bool)

(declare-fun res!855244 () Bool)

(assert (=> b!1288165 (=> (not res!855244) (not e!735793))))

(assert (=> b!1288165 (= res!855244 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41661 _keys!1741))))))

(declare-fun b!1288166 () Bool)

(declare-fun lt!578027 () Unit!42507)

(assert (=> b!1288166 (= e!735794 lt!578027)))

(declare-fun lt!578020 () ListLongMap!19629)

(assert (=> b!1288166 (= lt!578020 call!63129)))

(declare-fun +!4363 (ListLongMap!19629 tuple2!21964) ListLongMap!19629)

(assert (=> b!1288166 (= lt!578025 (+!4363 lt!578020 (tuple2!21965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578026 () Unit!42507)

(assert (=> b!1288166 (= lt!578026 call!63128)))

(assert (=> b!1288166 (contains!7960 lt!578025 k0!1205)))

(assert (=> b!1288166 (= lt!578027 (lemmaInListMapAfterAddingDiffThenInBefore!37 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!578020))))

(assert (=> b!1288166 call!63125))

(declare-fun b!1288167 () Bool)

(assert (=> b!1288167 call!63127))

(declare-fun lt!578028 () Unit!42507)

(assert (=> b!1288167 (= lt!578028 call!63126)))

(assert (=> b!1288167 (= lt!578021 call!63130)))

(assert (=> b!1288167 (= e!735796 lt!578028)))

(declare-fun bm!63127 () Bool)

(assert (=> bm!63127 (= call!63125 (contains!7960 (ite c!124645 lt!578020 (ite c!124644 lt!578021 lt!578024)) k0!1205))))

(assert (= (and start!109140 res!855250) b!1288159))

(assert (= (and b!1288159 res!855243) b!1288161))

(assert (= (and b!1288161 res!855248) b!1288156))

(assert (= (and b!1288156 res!855245) b!1288165))

(assert (= (and b!1288165 res!855244) b!1288163))

(assert (= (and b!1288163 res!855246) b!1288151))

(assert (= (and b!1288151 res!855249) b!1288157))

(assert (= (and b!1288157 res!855247) b!1288152))

(assert (= (and b!1288152 c!124645) b!1288166))

(assert (= (and b!1288152 (not c!124645)) b!1288153))

(assert (= (and b!1288153 c!124644) b!1288167))

(assert (= (and b!1288153 (not c!124644)) b!1288160))

(assert (= (and b!1288160 c!124646) b!1288155))

(assert (= (and b!1288160 (not c!124646)) b!1288154))

(assert (= (or b!1288167 b!1288155) bm!63125))

(assert (= (or b!1288167 b!1288155) bm!63122))

(assert (= (or b!1288167 b!1288155) bm!63123))

(assert (= (or b!1288166 bm!63125) bm!63124))

(assert (= (or b!1288166 bm!63122) bm!63126))

(assert (= (or b!1288166 bm!63123) bm!63127))

(assert (= (and b!1288164 condMapEmpty!52661) mapIsEmpty!52661))

(assert (= (and b!1288164 (not condMapEmpty!52661)) mapNonEmpty!52661))

(get-info :version)

(assert (= (and mapNonEmpty!52661 ((_ is ValueCellFull!16136) mapValue!52661)) b!1288162))

(assert (= (and b!1288164 ((_ is ValueCellFull!16136) mapDefault!52661)) b!1288158))

(assert (= start!109140 b!1288164))

(declare-fun m!1181449 () Bool)

(assert (=> start!109140 m!1181449))

(declare-fun m!1181451 () Bool)

(assert (=> start!109140 m!1181451))

(declare-fun m!1181453 () Bool)

(assert (=> start!109140 m!1181453))

(declare-fun m!1181455 () Bool)

(assert (=> bm!63127 m!1181455))

(declare-fun m!1181457 () Bool)

(assert (=> bm!63126 m!1181457))

(declare-fun m!1181459 () Bool)

(assert (=> mapNonEmpty!52661 m!1181459))

(declare-fun m!1181461 () Bool)

(assert (=> b!1288163 m!1181461))

(assert (=> b!1288163 m!1181461))

(declare-fun m!1181463 () Bool)

(assert (=> b!1288163 m!1181463))

(declare-fun m!1181465 () Bool)

(assert (=> b!1288161 m!1181465))

(declare-fun m!1181467 () Bool)

(assert (=> b!1288152 m!1181467))

(declare-fun m!1181469 () Bool)

(assert (=> b!1288152 m!1181469))

(declare-fun m!1181471 () Bool)

(assert (=> b!1288157 m!1181471))

(assert (=> b!1288157 m!1181471))

(declare-fun m!1181473 () Bool)

(assert (=> b!1288157 m!1181473))

(declare-fun m!1181475 () Bool)

(assert (=> bm!63124 m!1181475))

(declare-fun m!1181477 () Bool)

(assert (=> b!1288166 m!1181477))

(declare-fun m!1181479 () Bool)

(assert (=> b!1288166 m!1181479))

(declare-fun m!1181481 () Bool)

(assert (=> b!1288166 m!1181481))

(declare-fun m!1181483 () Bool)

(assert (=> b!1288156 m!1181483))

(check-sat (not start!109140) (not b!1288161) (not bm!63126) tp_is_empty!34069 (not bm!63127) (not bm!63124) (not b!1288163) b_and!46515 (not b!1288156) (not b!1288166) (not b!1288152) (not b_next!28429) (not b!1288157) (not mapNonEmpty!52661))
(check-sat b_and!46515 (not b_next!28429))
