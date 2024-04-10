; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109814 () Bool)

(assert start!109814)

(declare-fun b_free!29207 () Bool)

(declare-fun b_next!29207 () Bool)

(assert (=> start!109814 (= b_free!29207 (not b_next!29207))))

(declare-fun tp!102755 () Bool)

(declare-fun b_and!47321 () Bool)

(assert (=> start!109814 (= tp!102755 b_and!47321)))

(declare-fun res!864461 () Bool)

(declare-fun e!742084 () Bool)

(assert (=> start!109814 (=> (not res!864461) (not e!742084))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109814 (= res!864461 (validMask!0 mask!2175))))

(assert (=> start!109814 e!742084))

(declare-fun tp_is_empty!34847 () Bool)

(assert (=> start!109814 tp_is_empty!34847))

(assert (=> start!109814 true))

(declare-datatypes ((V!51565 0))(
  ( (V!51566 (val!17498 Int)) )
))
(declare-datatypes ((ValueCell!16525 0))(
  ( (ValueCellFull!16525 (v!20106 V!51565)) (EmptyCell!16525) )
))
(declare-datatypes ((array!86706 0))(
  ( (array!86707 (arr!41849 (Array (_ BitVec 32) ValueCell!16525)) (size!42399 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86706)

(declare-fun e!742086 () Bool)

(declare-fun array_inv!31661 (array!86706) Bool)

(assert (=> start!109814 (and (array_inv!31661 _values!1445) e!742086)))

(declare-datatypes ((array!86708 0))(
  ( (array!86709 (arr!41850 (Array (_ BitVec 32) (_ BitVec 64))) (size!42400 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86708)

(declare-fun array_inv!31662 (array!86708) Bool)

(assert (=> start!109814 (array_inv!31662 _keys!1741)))

(assert (=> start!109814 tp!102755))

(declare-fun bm!63814 () Bool)

(declare-datatypes ((Unit!43057 0))(
  ( (Unit!43058) )
))
(declare-fun call!63821 () Unit!43057)

(declare-fun call!63819 () Unit!43057)

(assert (=> bm!63814 (= call!63821 call!63819)))

(declare-fun bm!63815 () Bool)

(declare-fun call!63822 () Bool)

(declare-fun call!63818 () Bool)

(assert (=> bm!63815 (= call!63822 call!63818)))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun b!1301010 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1301010 (= e!742084 (not (or (= k!1205 (select (arr!41850 _keys!1741) from!2144)) (bvslt from!2144 (size!42399 _values!1445)))))))

(declare-datatypes ((tuple2!22572 0))(
  ( (tuple2!22573 (_1!11297 (_ BitVec 64)) (_2!11297 V!51565)) )
))
(declare-datatypes ((List!29702 0))(
  ( (Nil!29699) (Cons!29698 (h!30907 tuple2!22572) (t!43276 List!29702)) )
))
(declare-datatypes ((ListLongMap!20229 0))(
  ( (ListLongMap!20230 (toList!10130 List!29702)) )
))
(declare-fun contains!8256 (ListLongMap!20229 (_ BitVec 64)) Bool)

(assert (=> b!1301010 (not (contains!8256 (ListLongMap!20230 Nil!29699) k!1205))))

(declare-fun lt!581689 () Unit!43057)

(declare-fun emptyContainsNothing!198 ((_ BitVec 64)) Unit!43057)

(assert (=> b!1301010 (= lt!581689 (emptyContainsNothing!198 k!1205))))

(declare-fun lt!581696 () Unit!43057)

(declare-fun e!742088 () Unit!43057)

(assert (=> b!1301010 (= lt!581696 e!742088)))

(declare-fun c!124678 () Bool)

(declare-fun lt!581690 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1301010 (= c!124678 (and (not lt!581690) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301010 (= lt!581690 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!53846 () Bool)

(declare-fun mapRes!53846 () Bool)

(declare-fun tp!102754 () Bool)

(declare-fun e!742082 () Bool)

(assert (=> mapNonEmpty!53846 (= mapRes!53846 (and tp!102754 e!742082))))

(declare-fun mapValue!53846 () ValueCell!16525)

(declare-fun mapRest!53846 () (Array (_ BitVec 32) ValueCell!16525))

(declare-fun mapKey!53846 () (_ BitVec 32))

(assert (=> mapNonEmpty!53846 (= (arr!41849 _values!1445) (store mapRest!53846 mapKey!53846 mapValue!53846))))

(declare-fun b!1301011 () Bool)

(declare-fun res!864460 () Bool)

(assert (=> b!1301011 (=> (not res!864460) (not e!742084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301011 (= res!864460 (validKeyInArray!0 (select (arr!41850 _keys!1741) from!2144)))))

(declare-fun b!1301012 () Bool)

(declare-fun e!742083 () Bool)

(assert (=> b!1301012 (= e!742083 tp_is_empty!34847)))

(declare-fun minValue!1387 () V!51565)

(declare-fun zeroValue!1387 () V!51565)

(declare-fun lt!581699 () ListLongMap!20229)

(declare-fun lt!581693 () ListLongMap!20229)

(declare-fun c!124679 () Bool)

(declare-fun lt!581691 () ListLongMap!20229)

(declare-fun bm!63816 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!80 ((_ BitVec 64) (_ BitVec 64) V!51565 ListLongMap!20229) Unit!43057)

(assert (=> bm!63816 (= call!63819 (lemmaInListMapAfterAddingDiffThenInBefore!80 k!1205 (ite c!124678 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124679 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124678 minValue!1387 (ite c!124679 zeroValue!1387 minValue!1387)) (ite c!124678 lt!581693 (ite c!124679 lt!581699 lt!581691))))))

(declare-fun b!1301013 () Bool)

(declare-fun c!124677 () Bool)

(assert (=> b!1301013 (= c!124677 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581690))))

(declare-fun e!742085 () Unit!43057)

(declare-fun e!742087 () Unit!43057)

(assert (=> b!1301013 (= e!742085 e!742087)))

(declare-fun b!1301014 () Bool)

(declare-fun res!864462 () Bool)

(assert (=> b!1301014 (=> (not res!864462) (not e!742084))))

(declare-datatypes ((List!29703 0))(
  ( (Nil!29700) (Cons!29699 (h!30908 (_ BitVec 64)) (t!43277 List!29703)) )
))
(declare-fun arrayNoDuplicates!0 (array!86708 (_ BitVec 32) List!29703) Bool)

(assert (=> b!1301014 (= res!864462 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29700))))

(declare-fun b!1301015 () Bool)

(declare-fun res!864465 () Bool)

(assert (=> b!1301015 (=> (not res!864465) (not e!742084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86708 (_ BitVec 32)) Bool)

(assert (=> b!1301015 (= res!864465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301016 () Bool)

(declare-fun res!864467 () Bool)

(assert (=> b!1301016 (=> (not res!864467) (not e!742084))))

(assert (=> b!1301016 (= res!864467 (and (= (size!42399 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42400 _keys!1741) (size!42399 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301017 () Bool)

(assert (=> b!1301017 (= e!742082 tp_is_empty!34847)))

(declare-fun b!1301018 () Bool)

(declare-fun res!864464 () Bool)

(assert (=> b!1301018 (=> (not res!864464) (not e!742084))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5155 (array!86708 array!86706 (_ BitVec 32) (_ BitVec 32) V!51565 V!51565 (_ BitVec 32) Int) ListLongMap!20229)

(assert (=> b!1301018 (= res!864464 (contains!8256 (getCurrentListMap!5155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1301019 () Bool)

(assert (=> b!1301019 (= e!742088 e!742085)))

(assert (=> b!1301019 (= c!124679 (and (not lt!581690) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301020 () Bool)

(declare-fun res!864466 () Bool)

(assert (=> b!1301020 (=> (not res!864466) (not e!742084))))

(assert (=> b!1301020 (= res!864466 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42400 _keys!1741))))))

(declare-fun bm!63817 () Bool)

(declare-fun call!63820 () ListLongMap!20229)

(declare-fun call!63817 () ListLongMap!20229)

(assert (=> bm!63817 (= call!63820 call!63817)))

(declare-fun bm!63818 () Bool)

(assert (=> bm!63818 (= call!63818 (contains!8256 (ite c!124678 lt!581693 (ite c!124679 lt!581699 lt!581691)) k!1205))))

(declare-fun b!1301021 () Bool)

(declare-fun Unit!43059 () Unit!43057)

(assert (=> b!1301021 (= e!742087 Unit!43059)))

(declare-fun bm!63819 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6089 (array!86708 array!86706 (_ BitVec 32) (_ BitVec 32) V!51565 V!51565 (_ BitVec 32) Int) ListLongMap!20229)

(assert (=> bm!63819 (= call!63817 (getCurrentListMapNoExtraKeys!6089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301022 () Bool)

(declare-fun res!864463 () Bool)

(assert (=> b!1301022 (=> (not res!864463) (not e!742084))))

(assert (=> b!1301022 (= res!864463 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42400 _keys!1741))))))

(declare-fun b!1301023 () Bool)

(declare-fun lt!581698 () Unit!43057)

(assert (=> b!1301023 (= e!742087 lt!581698)))

(assert (=> b!1301023 (= lt!581691 call!63820)))

(assert (=> b!1301023 (= lt!581698 call!63821)))

(assert (=> b!1301023 call!63822))

(declare-fun b!1301024 () Bool)

(declare-fun lt!581697 () Unit!43057)

(assert (=> b!1301024 (= e!742088 lt!581697)))

(declare-fun lt!581692 () ListLongMap!20229)

(assert (=> b!1301024 (= lt!581692 call!63817)))

(declare-fun +!4457 (ListLongMap!20229 tuple2!22572) ListLongMap!20229)

(assert (=> b!1301024 (= lt!581693 (+!4457 lt!581692 (tuple2!22573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581694 () Unit!43057)

(assert (=> b!1301024 (= lt!581694 call!63819)))

(assert (=> b!1301024 call!63818))

(assert (=> b!1301024 (= lt!581697 (lemmaInListMapAfterAddingDiffThenInBefore!80 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581692))))

(assert (=> b!1301024 (contains!8256 lt!581692 k!1205)))

(declare-fun b!1301025 () Bool)

(assert (=> b!1301025 (= e!742086 (and e!742083 mapRes!53846))))

(declare-fun condMapEmpty!53846 () Bool)

(declare-fun mapDefault!53846 () ValueCell!16525)

