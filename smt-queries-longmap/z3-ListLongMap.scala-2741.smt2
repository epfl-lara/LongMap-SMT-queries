; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40250 () Bool)

(assert start!40250)

(declare-fun b_free!10525 () Bool)

(declare-fun b_next!10525 () Bool)

(assert (=> start!40250 (= b_free!10525 (not b_next!10525))))

(declare-fun tp!37113 () Bool)

(declare-fun b_and!18507 () Bool)

(assert (=> start!40250 (= tp!37113 b_and!18507)))

(declare-fun b!442028 () Bool)

(declare-fun res!261819 () Bool)

(declare-fun e!260182 () Bool)

(assert (=> b!442028 (=> (not res!261819) (not e!260182))))

(declare-datatypes ((array!27182 0))(
  ( (array!27183 (arr!13040 (Array (_ BitVec 32) (_ BitVec 64))) (size!13392 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27182)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442028 (= res!261819 (or (= (select (arr!13040 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13040 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442029 () Bool)

(declare-fun res!261821 () Bool)

(declare-fun e!260184 () Bool)

(assert (=> b!442029 (=> (not res!261821) (not e!260184))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!442029 (= res!261821 (bvsle from!863 i!563))))

(declare-fun b!442030 () Bool)

(declare-datatypes ((V!16683 0))(
  ( (V!16684 (val!5886 Int)) )
))
(declare-datatypes ((tuple2!7734 0))(
  ( (tuple2!7735 (_1!3878 (_ BitVec 64)) (_2!3878 V!16683)) )
))
(declare-datatypes ((List!7727 0))(
  ( (Nil!7724) (Cons!7723 (h!8579 tuple2!7734) (t!13475 List!7727)) )
))
(declare-datatypes ((ListLongMap!6649 0))(
  ( (ListLongMap!6650 (toList!3340 List!7727)) )
))
(declare-fun call!29508 () ListLongMap!6649)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16683)

(declare-fun call!29509 () ListLongMap!6649)

(declare-fun e!260178 () Bool)

(declare-fun +!1526 (ListLongMap!6649 tuple2!7734) ListLongMap!6649)

(assert (=> b!442030 (= e!260178 (= call!29508 (+!1526 call!29509 (tuple2!7735 k0!794 v!412))))))

(declare-fun b!442031 () Bool)

(declare-fun res!261817 () Bool)

(assert (=> b!442031 (=> (not res!261817) (not e!260182))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442031 (= res!261817 (validMask!0 mask!1025))))

(declare-fun b!442032 () Bool)

(declare-fun res!261816 () Bool)

(assert (=> b!442032 (=> (not res!261816) (not e!260182))))

(declare-datatypes ((List!7728 0))(
  ( (Nil!7725) (Cons!7724 (h!8580 (_ BitVec 64)) (t!13476 List!7728)) )
))
(declare-fun arrayNoDuplicates!0 (array!27182 (_ BitVec 32) List!7728) Bool)

(assert (=> b!442032 (= res!261816 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7725))))

(declare-fun b!442034 () Bool)

(assert (=> b!442034 (= e!260178 (= call!29509 call!29508))))

(declare-fun minValue!515 () V!16683)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5498 0))(
  ( (ValueCellFull!5498 (v!8134 V!16683)) (EmptyCell!5498) )
))
(declare-datatypes ((array!27184 0))(
  ( (array!27185 (arr!13041 (Array (_ BitVec 32) ValueCell!5498)) (size!13393 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27184)

(declare-fun zeroValue!515 () V!16683)

(declare-fun c!55776 () Bool)

(declare-fun bm!29505 () Bool)

(declare-fun lt!203094 () array!27182)

(declare-fun lt!203096 () array!27184)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1573 (array!27182 array!27184 (_ BitVec 32) (_ BitVec 32) V!16683 V!16683 (_ BitVec 32) Int) ListLongMap!6649)

(assert (=> bm!29505 (= call!29509 (getCurrentListMapNoExtraKeys!1573 (ite c!55776 _keys!709 lt!203094) (ite c!55776 _values!549 lt!203096) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442035 () Bool)

(declare-fun res!261827 () Bool)

(assert (=> b!442035 (=> (not res!261827) (not e!260182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442035 (= res!261827 (validKeyInArray!0 k0!794))))

(declare-fun b!442036 () Bool)

(declare-fun res!261820 () Bool)

(assert (=> b!442036 (=> (not res!261820) (not e!260182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27182 (_ BitVec 32)) Bool)

(assert (=> b!442036 (= res!261820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442037 () Bool)

(assert (=> b!442037 (= e!260182 e!260184)))

(declare-fun res!261824 () Bool)

(assert (=> b!442037 (=> (not res!261824) (not e!260184))))

(assert (=> b!442037 (= res!261824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203094 mask!1025))))

(assert (=> b!442037 (= lt!203094 (array!27183 (store (arr!13040 _keys!709) i!563 k0!794) (size!13392 _keys!709)))))

(declare-fun b!442038 () Bool)

(declare-fun e!260180 () Bool)

(declare-fun e!260179 () Bool)

(declare-fun mapRes!19146 () Bool)

(assert (=> b!442038 (= e!260180 (and e!260179 mapRes!19146))))

(declare-fun condMapEmpty!19146 () Bool)

(declare-fun mapDefault!19146 () ValueCell!5498)

(assert (=> b!442038 (= condMapEmpty!19146 (= (arr!13041 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5498)) mapDefault!19146)))))

(declare-fun b!442039 () Bool)

(declare-fun res!261825 () Bool)

(assert (=> b!442039 (=> (not res!261825) (not e!260182))))

(assert (=> b!442039 (= res!261825 (and (= (size!13393 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13392 _keys!709) (size!13393 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19146 () Bool)

(declare-fun tp!37112 () Bool)

(declare-fun e!260185 () Bool)

(assert (=> mapNonEmpty!19146 (= mapRes!19146 (and tp!37112 e!260185))))

(declare-fun mapKey!19146 () (_ BitVec 32))

(declare-fun mapRest!19146 () (Array (_ BitVec 32) ValueCell!5498))

(declare-fun mapValue!19146 () ValueCell!5498)

(assert (=> mapNonEmpty!19146 (= (arr!13041 _values!549) (store mapRest!19146 mapKey!19146 mapValue!19146))))

(declare-fun b!442040 () Bool)

(declare-fun res!261822 () Bool)

(assert (=> b!442040 (=> (not res!261822) (not e!260184))))

(assert (=> b!442040 (= res!261822 (arrayNoDuplicates!0 lt!203094 #b00000000000000000000000000000000 Nil!7725))))

(declare-fun res!261828 () Bool)

(assert (=> start!40250 (=> (not res!261828) (not e!260182))))

(assert (=> start!40250 (= res!261828 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13392 _keys!709))))))

(assert (=> start!40250 e!260182))

(declare-fun tp_is_empty!11683 () Bool)

(assert (=> start!40250 tp_is_empty!11683))

(assert (=> start!40250 tp!37113))

(assert (=> start!40250 true))

(declare-fun array_inv!9528 (array!27184) Bool)

(assert (=> start!40250 (and (array_inv!9528 _values!549) e!260180)))

(declare-fun array_inv!9529 (array!27182) Bool)

(assert (=> start!40250 (array_inv!9529 _keys!709)))

(declare-fun b!442033 () Bool)

(assert (=> b!442033 (= e!260185 tp_is_empty!11683)))

(declare-fun b!442041 () Bool)

(declare-fun e!260181 () Bool)

(assert (=> b!442041 (= e!260181 (not (not (validKeyInArray!0 (select (arr!13040 _keys!709) from!863)))))))

(assert (=> b!442041 e!260178))

(assert (=> b!442041 (= c!55776 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13127 0))(
  ( (Unit!13128) )
))
(declare-fun lt!203095 () Unit!13127)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!686 (array!27182 array!27184 (_ BitVec 32) (_ BitVec 32) V!16683 V!16683 (_ BitVec 32) (_ BitVec 64) V!16683 (_ BitVec 32) Int) Unit!13127)

(assert (=> b!442041 (= lt!203095 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!686 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442042 () Bool)

(declare-fun res!261818 () Bool)

(assert (=> b!442042 (=> (not res!261818) (not e!260182))))

(declare-fun arrayContainsKey!0 (array!27182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442042 (= res!261818 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442043 () Bool)

(declare-fun res!261826 () Bool)

(assert (=> b!442043 (=> (not res!261826) (not e!260182))))

(assert (=> b!442043 (= res!261826 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13392 _keys!709))))))

(declare-fun b!442044 () Bool)

(assert (=> b!442044 (= e!260184 e!260181)))

(declare-fun res!261823 () Bool)

(assert (=> b!442044 (=> (not res!261823) (not e!260181))))

(assert (=> b!442044 (= res!261823 (= from!863 i!563))))

(declare-fun lt!203093 () ListLongMap!6649)

(assert (=> b!442044 (= lt!203093 (getCurrentListMapNoExtraKeys!1573 lt!203094 lt!203096 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!442044 (= lt!203096 (array!27185 (store (arr!13041 _values!549) i!563 (ValueCellFull!5498 v!412)) (size!13393 _values!549)))))

(declare-fun lt!203097 () ListLongMap!6649)

(assert (=> b!442044 (= lt!203097 (getCurrentListMapNoExtraKeys!1573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19146 () Bool)

(assert (=> mapIsEmpty!19146 mapRes!19146))

(declare-fun b!442045 () Bool)

(assert (=> b!442045 (= e!260179 tp_is_empty!11683)))

(declare-fun bm!29506 () Bool)

(assert (=> bm!29506 (= call!29508 (getCurrentListMapNoExtraKeys!1573 (ite c!55776 lt!203094 _keys!709) (ite c!55776 lt!203096 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40250 res!261828) b!442031))

(assert (= (and b!442031 res!261817) b!442039))

(assert (= (and b!442039 res!261825) b!442036))

(assert (= (and b!442036 res!261820) b!442032))

(assert (= (and b!442032 res!261816) b!442043))

(assert (= (and b!442043 res!261826) b!442035))

(assert (= (and b!442035 res!261827) b!442028))

(assert (= (and b!442028 res!261819) b!442042))

(assert (= (and b!442042 res!261818) b!442037))

(assert (= (and b!442037 res!261824) b!442040))

(assert (= (and b!442040 res!261822) b!442029))

(assert (= (and b!442029 res!261821) b!442044))

(assert (= (and b!442044 res!261823) b!442041))

(assert (= (and b!442041 c!55776) b!442030))

(assert (= (and b!442041 (not c!55776)) b!442034))

(assert (= (or b!442030 b!442034) bm!29506))

(assert (= (or b!442030 b!442034) bm!29505))

(assert (= (and b!442038 condMapEmpty!19146) mapIsEmpty!19146))

(assert (= (and b!442038 (not condMapEmpty!19146)) mapNonEmpty!19146))

(get-info :version)

(assert (= (and mapNonEmpty!19146 ((_ is ValueCellFull!5498) mapValue!19146)) b!442033))

(assert (= (and b!442038 ((_ is ValueCellFull!5498) mapDefault!19146)) b!442045))

(assert (= start!40250 b!442038))

(declare-fun m!428975 () Bool)

(assert (=> bm!29506 m!428975))

(declare-fun m!428977 () Bool)

(assert (=> b!442032 m!428977))

(declare-fun m!428979 () Bool)

(assert (=> b!442028 m!428979))

(declare-fun m!428981 () Bool)

(assert (=> b!442040 m!428981))

(declare-fun m!428983 () Bool)

(assert (=> bm!29505 m!428983))

(declare-fun m!428985 () Bool)

(assert (=> start!40250 m!428985))

(declare-fun m!428987 () Bool)

(assert (=> start!40250 m!428987))

(declare-fun m!428989 () Bool)

(assert (=> b!442030 m!428989))

(declare-fun m!428991 () Bool)

(assert (=> b!442036 m!428991))

(declare-fun m!428993 () Bool)

(assert (=> b!442037 m!428993))

(declare-fun m!428995 () Bool)

(assert (=> b!442037 m!428995))

(declare-fun m!428997 () Bool)

(assert (=> b!442031 m!428997))

(declare-fun m!428999 () Bool)

(assert (=> b!442041 m!428999))

(assert (=> b!442041 m!428999))

(declare-fun m!429001 () Bool)

(assert (=> b!442041 m!429001))

(declare-fun m!429003 () Bool)

(assert (=> b!442041 m!429003))

(declare-fun m!429005 () Bool)

(assert (=> b!442042 m!429005))

(declare-fun m!429007 () Bool)

(assert (=> b!442035 m!429007))

(declare-fun m!429009 () Bool)

(assert (=> b!442044 m!429009))

(declare-fun m!429011 () Bool)

(assert (=> b!442044 m!429011))

(declare-fun m!429013 () Bool)

(assert (=> b!442044 m!429013))

(declare-fun m!429015 () Bool)

(assert (=> mapNonEmpty!19146 m!429015))

(check-sat tp_is_empty!11683 (not b!442036) (not bm!29505) (not b!442031) (not b!442037) (not bm!29506) (not b!442035) (not start!40250) (not b!442030) (not b!442041) (not b!442032) (not b_next!10525) b_and!18507 (not b!442042) (not b!442044) (not b!442040) (not mapNonEmpty!19146))
(check-sat b_and!18507 (not b_next!10525))
(get-model)

(declare-fun b!442164 () Bool)

(declare-fun e!260245 () Bool)

(declare-fun contains!2465 (List!7728 (_ BitVec 64)) Bool)

(assert (=> b!442164 (= e!260245 (contains!2465 Nil!7725 (select (arr!13040 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!442165 () Bool)

(declare-fun e!260242 () Bool)

(declare-fun call!29524 () Bool)

(assert (=> b!442165 (= e!260242 call!29524)))

(declare-fun bm!29521 () Bool)

(declare-fun c!55785 () Bool)

(assert (=> bm!29521 (= call!29524 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55785 (Cons!7724 (select (arr!13040 _keys!709) #b00000000000000000000000000000000) Nil!7725) Nil!7725)))))

(declare-fun b!442166 () Bool)

(assert (=> b!442166 (= e!260242 call!29524)))

(declare-fun d!74059 () Bool)

(declare-fun res!261915 () Bool)

(declare-fun e!260243 () Bool)

(assert (=> d!74059 (=> res!261915 e!260243)))

(assert (=> d!74059 (= res!261915 (bvsge #b00000000000000000000000000000000 (size!13392 _keys!709)))))

(assert (=> d!74059 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7725) e!260243)))

(declare-fun b!442167 () Bool)

(declare-fun e!260244 () Bool)

(assert (=> b!442167 (= e!260244 e!260242)))

(assert (=> b!442167 (= c!55785 (validKeyInArray!0 (select (arr!13040 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!442168 () Bool)

(assert (=> b!442168 (= e!260243 e!260244)))

(declare-fun res!261914 () Bool)

(assert (=> b!442168 (=> (not res!261914) (not e!260244))))

(assert (=> b!442168 (= res!261914 (not e!260245))))

(declare-fun res!261913 () Bool)

(assert (=> b!442168 (=> (not res!261913) (not e!260245))))

(assert (=> b!442168 (= res!261913 (validKeyInArray!0 (select (arr!13040 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74059 (not res!261915)) b!442168))

(assert (= (and b!442168 res!261913) b!442164))

(assert (= (and b!442168 res!261914) b!442167))

(assert (= (and b!442167 c!55785) b!442165))

(assert (= (and b!442167 (not c!55785)) b!442166))

(assert (= (or b!442165 b!442166) bm!29521))

(declare-fun m!429101 () Bool)

(assert (=> b!442164 m!429101))

(assert (=> b!442164 m!429101))

(declare-fun m!429103 () Bool)

(assert (=> b!442164 m!429103))

(assert (=> bm!29521 m!429101))

(declare-fun m!429105 () Bool)

(assert (=> bm!29521 m!429105))

(assert (=> b!442167 m!429101))

(assert (=> b!442167 m!429101))

(declare-fun m!429107 () Bool)

(assert (=> b!442167 m!429107))

(assert (=> b!442168 m!429101))

(assert (=> b!442168 m!429101))

(assert (=> b!442168 m!429107))

(assert (=> b!442032 d!74059))

(declare-fun d!74061 () Bool)

(assert (=> d!74061 (= (validKeyInArray!0 (select (arr!13040 _keys!709) from!863)) (and (not (= (select (arr!13040 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13040 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!442041 d!74061))

(declare-fun e!260251 () Bool)

(declare-fun call!29529 () ListLongMap!6649)

(declare-fun b!442175 () Bool)

(declare-fun call!29530 () ListLongMap!6649)

(assert (=> b!442175 (= e!260251 (= call!29529 (+!1526 call!29530 (tuple2!7735 k0!794 v!412))))))

(declare-fun d!74063 () Bool)

(declare-fun e!260250 () Bool)

(assert (=> d!74063 e!260250))

(declare-fun res!261918 () Bool)

(assert (=> d!74063 (=> (not res!261918) (not e!260250))))

(assert (=> d!74063 (= res!261918 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13392 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13393 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13392 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13393 _values!549))))))))

(declare-fun lt!203130 () Unit!13127)

(declare-fun choose!1331 (array!27182 array!27184 (_ BitVec 32) (_ BitVec 32) V!16683 V!16683 (_ BitVec 32) (_ BitVec 64) V!16683 (_ BitVec 32) Int) Unit!13127)

(assert (=> d!74063 (= lt!203130 (choose!1331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74063 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13392 _keys!709)))))

(assert (=> d!74063 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!686 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203130)))

(declare-fun bm!29526 () Bool)

(assert (=> bm!29526 (= call!29530 (getCurrentListMapNoExtraKeys!1573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29527 () Bool)

(assert (=> bm!29527 (= call!29529 (getCurrentListMapNoExtraKeys!1573 (array!27183 (store (arr!13040 _keys!709) i!563 k0!794) (size!13392 _keys!709)) (array!27185 (store (arr!13041 _values!549) i!563 (ValueCellFull!5498 v!412)) (size!13393 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442176 () Bool)

(assert (=> b!442176 (= e!260251 (= call!29529 call!29530))))

(declare-fun b!442177 () Bool)

(assert (=> b!442177 (= e!260250 e!260251)))

(declare-fun c!55788 () Bool)

(assert (=> b!442177 (= c!55788 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (= (and d!74063 res!261918) b!442177))

(assert (= (and b!442177 c!55788) b!442175))

(assert (= (and b!442177 (not c!55788)) b!442176))

(assert (= (or b!442175 b!442176) bm!29526))

(assert (= (or b!442175 b!442176) bm!29527))

(declare-fun m!429109 () Bool)

(assert (=> b!442175 m!429109))

(declare-fun m!429111 () Bool)

(assert (=> d!74063 m!429111))

(declare-fun m!429113 () Bool)

(assert (=> bm!29526 m!429113))

(assert (=> bm!29527 m!428995))

(assert (=> bm!29527 m!429011))

(declare-fun m!429115 () Bool)

(assert (=> bm!29527 m!429115))

(assert (=> b!442041 d!74063))

(declare-fun b!442178 () Bool)

(declare-fun e!260255 () Bool)

(assert (=> b!442178 (= e!260255 (contains!2465 Nil!7725 (select (arr!13040 lt!203094) #b00000000000000000000000000000000)))))

(declare-fun b!442179 () Bool)

(declare-fun e!260252 () Bool)

(declare-fun call!29531 () Bool)

(assert (=> b!442179 (= e!260252 call!29531)))

(declare-fun bm!29528 () Bool)

(declare-fun c!55789 () Bool)

(assert (=> bm!29528 (= call!29531 (arrayNoDuplicates!0 lt!203094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55789 (Cons!7724 (select (arr!13040 lt!203094) #b00000000000000000000000000000000) Nil!7725) Nil!7725)))))

(declare-fun b!442180 () Bool)

(assert (=> b!442180 (= e!260252 call!29531)))

(declare-fun d!74065 () Bool)

(declare-fun res!261921 () Bool)

(declare-fun e!260253 () Bool)

(assert (=> d!74065 (=> res!261921 e!260253)))

(assert (=> d!74065 (= res!261921 (bvsge #b00000000000000000000000000000000 (size!13392 lt!203094)))))

(assert (=> d!74065 (= (arrayNoDuplicates!0 lt!203094 #b00000000000000000000000000000000 Nil!7725) e!260253)))

(declare-fun b!442181 () Bool)

(declare-fun e!260254 () Bool)

(assert (=> b!442181 (= e!260254 e!260252)))

(assert (=> b!442181 (= c!55789 (validKeyInArray!0 (select (arr!13040 lt!203094) #b00000000000000000000000000000000)))))

(declare-fun b!442182 () Bool)

(assert (=> b!442182 (= e!260253 e!260254)))

(declare-fun res!261920 () Bool)

(assert (=> b!442182 (=> (not res!261920) (not e!260254))))

(assert (=> b!442182 (= res!261920 (not e!260255))))

(declare-fun res!261919 () Bool)

(assert (=> b!442182 (=> (not res!261919) (not e!260255))))

(assert (=> b!442182 (= res!261919 (validKeyInArray!0 (select (arr!13040 lt!203094) #b00000000000000000000000000000000)))))

(assert (= (and d!74065 (not res!261921)) b!442182))

(assert (= (and b!442182 res!261919) b!442178))

(assert (= (and b!442182 res!261920) b!442181))

(assert (= (and b!442181 c!55789) b!442179))

(assert (= (and b!442181 (not c!55789)) b!442180))

(assert (= (or b!442179 b!442180) bm!29528))

(declare-fun m!429117 () Bool)

(assert (=> b!442178 m!429117))

(assert (=> b!442178 m!429117))

(declare-fun m!429119 () Bool)

(assert (=> b!442178 m!429119))

(assert (=> bm!29528 m!429117))

(declare-fun m!429121 () Bool)

(assert (=> bm!29528 m!429121))

(assert (=> b!442181 m!429117))

(assert (=> b!442181 m!429117))

(declare-fun m!429123 () Bool)

(assert (=> b!442181 m!429123))

(assert (=> b!442182 m!429117))

(assert (=> b!442182 m!429117))

(assert (=> b!442182 m!429123))

(assert (=> b!442040 d!74065))

(declare-fun d!74067 () Bool)

(assert (=> d!74067 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!442031 d!74067))

(declare-fun d!74069 () Bool)

(declare-fun e!260258 () Bool)

(assert (=> d!74069 e!260258))

(declare-fun res!261926 () Bool)

(assert (=> d!74069 (=> (not res!261926) (not e!260258))))

(declare-fun lt!203140 () ListLongMap!6649)

(declare-fun contains!2466 (ListLongMap!6649 (_ BitVec 64)) Bool)

(assert (=> d!74069 (= res!261926 (contains!2466 lt!203140 (_1!3878 (tuple2!7735 k0!794 v!412))))))

(declare-fun lt!203139 () List!7727)

(assert (=> d!74069 (= lt!203140 (ListLongMap!6650 lt!203139))))

(declare-fun lt!203142 () Unit!13127)

(declare-fun lt!203141 () Unit!13127)

(assert (=> d!74069 (= lt!203142 lt!203141)))

(declare-datatypes ((Option!374 0))(
  ( (Some!373 (v!8140 V!16683)) (None!372) )
))
(declare-fun getValueByKey!368 (List!7727 (_ BitVec 64)) Option!374)

(assert (=> d!74069 (= (getValueByKey!368 lt!203139 (_1!3878 (tuple2!7735 k0!794 v!412))) (Some!373 (_2!3878 (tuple2!7735 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!190 (List!7727 (_ BitVec 64) V!16683) Unit!13127)

(assert (=> d!74069 (= lt!203141 (lemmaContainsTupThenGetReturnValue!190 lt!203139 (_1!3878 (tuple2!7735 k0!794 v!412)) (_2!3878 (tuple2!7735 k0!794 v!412))))))

(declare-fun insertStrictlySorted!193 (List!7727 (_ BitVec 64) V!16683) List!7727)

(assert (=> d!74069 (= lt!203139 (insertStrictlySorted!193 (toList!3340 call!29509) (_1!3878 (tuple2!7735 k0!794 v!412)) (_2!3878 (tuple2!7735 k0!794 v!412))))))

(assert (=> d!74069 (= (+!1526 call!29509 (tuple2!7735 k0!794 v!412)) lt!203140)))

(declare-fun b!442187 () Bool)

(declare-fun res!261927 () Bool)

(assert (=> b!442187 (=> (not res!261927) (not e!260258))))

(assert (=> b!442187 (= res!261927 (= (getValueByKey!368 (toList!3340 lt!203140) (_1!3878 (tuple2!7735 k0!794 v!412))) (Some!373 (_2!3878 (tuple2!7735 k0!794 v!412)))))))

(declare-fun b!442188 () Bool)

(declare-fun contains!2467 (List!7727 tuple2!7734) Bool)

(assert (=> b!442188 (= e!260258 (contains!2467 (toList!3340 lt!203140) (tuple2!7735 k0!794 v!412)))))

(assert (= (and d!74069 res!261926) b!442187))

(assert (= (and b!442187 res!261927) b!442188))

(declare-fun m!429125 () Bool)

(assert (=> d!74069 m!429125))

(declare-fun m!429127 () Bool)

(assert (=> d!74069 m!429127))

(declare-fun m!429129 () Bool)

(assert (=> d!74069 m!429129))

(declare-fun m!429131 () Bool)

(assert (=> d!74069 m!429131))

(declare-fun m!429133 () Bool)

(assert (=> b!442187 m!429133))

(declare-fun m!429135 () Bool)

(assert (=> b!442188 m!429135))

(assert (=> b!442030 d!74069))

(declare-fun d!74071 () Bool)

(assert (=> d!74071 (= (array_inv!9528 _values!549) (bvsge (size!13393 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40250 d!74071))

(declare-fun d!74073 () Bool)

(assert (=> d!74073 (= (array_inv!9529 _keys!709) (bvsge (size!13392 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40250 d!74073))

(declare-fun b!442213 () Bool)

(declare-fun e!260278 () Bool)

(declare-fun e!260273 () Bool)

(assert (=> b!442213 (= e!260278 e!260273)))

(declare-fun c!55801 () Bool)

(declare-fun e!260275 () Bool)

(assert (=> b!442213 (= c!55801 e!260275)))

(declare-fun res!261936 () Bool)

(assert (=> b!442213 (=> (not res!261936) (not e!260275))))

(assert (=> b!442213 (= res!261936 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 _keys!709 lt!203094))))))

(declare-fun bm!29531 () Bool)

(declare-fun call!29534 () ListLongMap!6649)

(assert (=> bm!29531 (= call!29534 (getCurrentListMapNoExtraKeys!1573 (ite c!55776 _keys!709 lt!203094) (ite c!55776 _values!549 lt!203096) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74075 () Bool)

(assert (=> d!74075 e!260278))

(declare-fun res!261939 () Bool)

(assert (=> d!74075 (=> (not res!261939) (not e!260278))))

(declare-fun lt!203161 () ListLongMap!6649)

(assert (=> d!74075 (= res!261939 (not (contains!2466 lt!203161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!260274 () ListLongMap!6649)

(assert (=> d!74075 (= lt!203161 e!260274)))

(declare-fun c!55800 () Bool)

(assert (=> d!74075 (= c!55800 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 _keys!709 lt!203094))))))

(assert (=> d!74075 (validMask!0 mask!1025)))

(assert (=> d!74075 (= (getCurrentListMapNoExtraKeys!1573 (ite c!55776 _keys!709 lt!203094) (ite c!55776 _values!549 lt!203096) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203161)))

(declare-fun b!442214 () Bool)

(declare-fun res!261938 () Bool)

(assert (=> b!442214 (=> (not res!261938) (not e!260278))))

(assert (=> b!442214 (= res!261938 (not (contains!2466 lt!203161 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442215 () Bool)

(declare-fun e!260279 () Bool)

(assert (=> b!442215 (= e!260273 e!260279)))

(declare-fun c!55799 () Bool)

(assert (=> b!442215 (= c!55799 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 _keys!709 lt!203094))))))

(declare-fun b!442216 () Bool)

(declare-fun lt!203160 () Unit!13127)

(declare-fun lt!203159 () Unit!13127)

(assert (=> b!442216 (= lt!203160 lt!203159)))

(declare-fun lt!203158 () (_ BitVec 64))

(declare-fun lt!203163 () ListLongMap!6649)

(declare-fun lt!203157 () (_ BitVec 64))

(declare-fun lt!203162 () V!16683)

(assert (=> b!442216 (not (contains!2466 (+!1526 lt!203163 (tuple2!7735 lt!203158 lt!203162)) lt!203157))))

(declare-fun addStillNotContains!144 (ListLongMap!6649 (_ BitVec 64) V!16683 (_ BitVec 64)) Unit!13127)

(assert (=> b!442216 (= lt!203159 (addStillNotContains!144 lt!203163 lt!203158 lt!203162 lt!203157))))

(assert (=> b!442216 (= lt!203157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6483 (ValueCell!5498 V!16683) V!16683)

(declare-fun dynLambda!852 (Int (_ BitVec 64)) V!16683)

(assert (=> b!442216 (= lt!203162 (get!6483 (select (arr!13041 (ite c!55776 _values!549 lt!203096)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442216 (= lt!203158 (select (arr!13040 (ite c!55776 _keys!709 lt!203094)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!442216 (= lt!203163 call!29534)))

(declare-fun e!260276 () ListLongMap!6649)

(assert (=> b!442216 (= e!260276 (+!1526 call!29534 (tuple2!7735 (select (arr!13040 (ite c!55776 _keys!709 lt!203094)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6483 (select (arr!13041 (ite c!55776 _values!549 lt!203096)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442217 () Bool)

(declare-fun isEmpty!561 (ListLongMap!6649) Bool)

(assert (=> b!442217 (= e!260279 (isEmpty!561 lt!203161))))

(declare-fun b!442218 () Bool)

(assert (=> b!442218 (= e!260279 (= lt!203161 (getCurrentListMapNoExtraKeys!1573 (ite c!55776 _keys!709 lt!203094) (ite c!55776 _values!549 lt!203096) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442219 () Bool)

(assert (=> b!442219 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 _keys!709 lt!203094))))))

(assert (=> b!442219 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55776 _values!549 lt!203096))))))

(declare-fun e!260277 () Bool)

(declare-fun apply!309 (ListLongMap!6649 (_ BitVec 64)) V!16683)

(assert (=> b!442219 (= e!260277 (= (apply!309 lt!203161 (select (arr!13040 (ite c!55776 _keys!709 lt!203094)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6483 (select (arr!13041 (ite c!55776 _values!549 lt!203096)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442220 () Bool)

(assert (=> b!442220 (= e!260275 (validKeyInArray!0 (select (arr!13040 (ite c!55776 _keys!709 lt!203094)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442220 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!442221 () Bool)

(assert (=> b!442221 (= e!260276 call!29534)))

(declare-fun b!442222 () Bool)

(assert (=> b!442222 (= e!260274 e!260276)))

(declare-fun c!55798 () Bool)

(assert (=> b!442222 (= c!55798 (validKeyInArray!0 (select (arr!13040 (ite c!55776 _keys!709 lt!203094)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!442223 () Bool)

(assert (=> b!442223 (= e!260273 e!260277)))

(assert (=> b!442223 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 _keys!709 lt!203094))))))

(declare-fun res!261937 () Bool)

(assert (=> b!442223 (= res!261937 (contains!2466 lt!203161 (select (arr!13040 (ite c!55776 _keys!709 lt!203094)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442223 (=> (not res!261937) (not e!260277))))

(declare-fun b!442224 () Bool)

(assert (=> b!442224 (= e!260274 (ListLongMap!6650 Nil!7724))))

(assert (= (and d!74075 c!55800) b!442224))

(assert (= (and d!74075 (not c!55800)) b!442222))

(assert (= (and b!442222 c!55798) b!442216))

(assert (= (and b!442222 (not c!55798)) b!442221))

(assert (= (or b!442216 b!442221) bm!29531))

(assert (= (and d!74075 res!261939) b!442214))

(assert (= (and b!442214 res!261938) b!442213))

(assert (= (and b!442213 res!261936) b!442220))

(assert (= (and b!442213 c!55801) b!442223))

(assert (= (and b!442213 (not c!55801)) b!442215))

(assert (= (and b!442223 res!261937) b!442219))

(assert (= (and b!442215 c!55799) b!442218))

(assert (= (and b!442215 (not c!55799)) b!442217))

(declare-fun b_lambda!9419 () Bool)

(assert (=> (not b_lambda!9419) (not b!442216)))

(declare-fun t!13481 () Bool)

(declare-fun tb!3707 () Bool)

(assert (=> (and start!40250 (= defaultEntry!557 defaultEntry!557) t!13481) tb!3707))

(declare-fun result!6949 () Bool)

(assert (=> tb!3707 (= result!6949 tp_is_empty!11683)))

(assert (=> b!442216 t!13481))

(declare-fun b_and!18513 () Bool)

(assert (= b_and!18507 (and (=> t!13481 result!6949) b_and!18513)))

(declare-fun b_lambda!9421 () Bool)

(assert (=> (not b_lambda!9421) (not b!442219)))

(assert (=> b!442219 t!13481))

(declare-fun b_and!18515 () Bool)

(assert (= b_and!18513 (and (=> t!13481 result!6949) b_and!18515)))

(declare-fun m!429137 () Bool)

(assert (=> b!442216 m!429137))

(declare-fun m!429139 () Bool)

(assert (=> b!442216 m!429139))

(declare-fun m!429141 () Bool)

(assert (=> b!442216 m!429141))

(assert (=> b!442216 m!429137))

(assert (=> b!442216 m!429139))

(declare-fun m!429143 () Bool)

(assert (=> b!442216 m!429143))

(declare-fun m!429145 () Bool)

(assert (=> b!442216 m!429145))

(declare-fun m!429147 () Bool)

(assert (=> b!442216 m!429147))

(declare-fun m!429149 () Bool)

(assert (=> b!442216 m!429149))

(declare-fun m!429151 () Bool)

(assert (=> b!442216 m!429151))

(assert (=> b!442216 m!429145))

(assert (=> b!442222 m!429151))

(assert (=> b!442222 m!429151))

(declare-fun m!429153 () Bool)

(assert (=> b!442222 m!429153))

(assert (=> b!442219 m!429137))

(assert (=> b!442219 m!429139))

(assert (=> b!442219 m!429141))

(assert (=> b!442219 m!429151))

(assert (=> b!442219 m!429137))

(assert (=> b!442219 m!429139))

(assert (=> b!442219 m!429151))

(declare-fun m!429155 () Bool)

(assert (=> b!442219 m!429155))

(declare-fun m!429157 () Bool)

(assert (=> b!442217 m!429157))

(declare-fun m!429159 () Bool)

(assert (=> b!442218 m!429159))

(declare-fun m!429161 () Bool)

(assert (=> b!442214 m!429161))

(assert (=> b!442223 m!429151))

(assert (=> b!442223 m!429151))

(declare-fun m!429163 () Bool)

(assert (=> b!442223 m!429163))

(declare-fun m!429165 () Bool)

(assert (=> d!74075 m!429165))

(assert (=> d!74075 m!428997))

(assert (=> bm!29531 m!429159))

(assert (=> b!442220 m!429151))

(assert (=> b!442220 m!429151))

(assert (=> b!442220 m!429153))

(assert (=> bm!29505 d!74075))

(declare-fun d!74077 () Bool)

(declare-fun res!261944 () Bool)

(declare-fun e!260284 () Bool)

(assert (=> d!74077 (=> res!261944 e!260284)))

(assert (=> d!74077 (= res!261944 (= (select (arr!13040 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74077 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!260284)))

(declare-fun b!442231 () Bool)

(declare-fun e!260285 () Bool)

(assert (=> b!442231 (= e!260284 e!260285)))

(declare-fun res!261945 () Bool)

(assert (=> b!442231 (=> (not res!261945) (not e!260285))))

(assert (=> b!442231 (= res!261945 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13392 _keys!709)))))

(declare-fun b!442232 () Bool)

(assert (=> b!442232 (= e!260285 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74077 (not res!261944)) b!442231))

(assert (= (and b!442231 res!261945) b!442232))

(assert (=> d!74077 m!429101))

(declare-fun m!429167 () Bool)

(assert (=> b!442232 m!429167))

(assert (=> b!442042 d!74077))

(declare-fun d!74079 () Bool)

(declare-fun res!261950 () Bool)

(declare-fun e!260292 () Bool)

(assert (=> d!74079 (=> res!261950 e!260292)))

(assert (=> d!74079 (= res!261950 (bvsge #b00000000000000000000000000000000 (size!13392 _keys!709)))))

(assert (=> d!74079 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!260292)))

(declare-fun b!442241 () Bool)

(declare-fun e!260293 () Bool)

(declare-fun call!29537 () Bool)

(assert (=> b!442241 (= e!260293 call!29537)))

(declare-fun bm!29534 () Bool)

(assert (=> bm!29534 (= call!29537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!442242 () Bool)

(declare-fun e!260294 () Bool)

(assert (=> b!442242 (= e!260294 e!260293)))

(declare-fun lt!203171 () (_ BitVec 64))

(assert (=> b!442242 (= lt!203171 (select (arr!13040 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!203170 () Unit!13127)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27182 (_ BitVec 64) (_ BitVec 32)) Unit!13127)

(assert (=> b!442242 (= lt!203170 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203171 #b00000000000000000000000000000000))))

(assert (=> b!442242 (arrayContainsKey!0 _keys!709 lt!203171 #b00000000000000000000000000000000)))

(declare-fun lt!203172 () Unit!13127)

(assert (=> b!442242 (= lt!203172 lt!203170)))

(declare-fun res!261951 () Bool)

(declare-datatypes ((SeekEntryResult!3476 0))(
  ( (MissingZero!3476 (index!16083 (_ BitVec 32))) (Found!3476 (index!16084 (_ BitVec 32))) (Intermediate!3476 (undefined!4288 Bool) (index!16085 (_ BitVec 32)) (x!41682 (_ BitVec 32))) (Undefined!3476) (MissingVacant!3476 (index!16086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27182 (_ BitVec 32)) SeekEntryResult!3476)

(assert (=> b!442242 (= res!261951 (= (seekEntryOrOpen!0 (select (arr!13040 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3476 #b00000000000000000000000000000000)))))

(assert (=> b!442242 (=> (not res!261951) (not e!260293))))

(declare-fun b!442243 () Bool)

(assert (=> b!442243 (= e!260294 call!29537)))

(declare-fun b!442244 () Bool)

(assert (=> b!442244 (= e!260292 e!260294)))

(declare-fun c!55804 () Bool)

(assert (=> b!442244 (= c!55804 (validKeyInArray!0 (select (arr!13040 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74079 (not res!261950)) b!442244))

(assert (= (and b!442244 c!55804) b!442242))

(assert (= (and b!442244 (not c!55804)) b!442243))

(assert (= (and b!442242 res!261951) b!442241))

(assert (= (or b!442241 b!442243) bm!29534))

(declare-fun m!429169 () Bool)

(assert (=> bm!29534 m!429169))

(assert (=> b!442242 m!429101))

(declare-fun m!429171 () Bool)

(assert (=> b!442242 m!429171))

(declare-fun m!429173 () Bool)

(assert (=> b!442242 m!429173))

(assert (=> b!442242 m!429101))

(declare-fun m!429175 () Bool)

(assert (=> b!442242 m!429175))

(assert (=> b!442244 m!429101))

(assert (=> b!442244 m!429101))

(assert (=> b!442244 m!429107))

(assert (=> b!442036 d!74079))

(declare-fun d!74081 () Bool)

(assert (=> d!74081 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!442035 d!74081))

(declare-fun b!442245 () Bool)

(declare-fun e!260300 () Bool)

(declare-fun e!260295 () Bool)

(assert (=> b!442245 (= e!260300 e!260295)))

(declare-fun c!55808 () Bool)

(declare-fun e!260297 () Bool)

(assert (=> b!442245 (= c!55808 e!260297)))

(declare-fun res!261952 () Bool)

(assert (=> b!442245 (=> (not res!261952) (not e!260297))))

(assert (=> b!442245 (= res!261952 (bvslt from!863 (size!13392 lt!203094)))))

(declare-fun bm!29535 () Bool)

(declare-fun call!29538 () ListLongMap!6649)

(assert (=> bm!29535 (= call!29538 (getCurrentListMapNoExtraKeys!1573 lt!203094 lt!203096 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74083 () Bool)

(assert (=> d!74083 e!260300))

(declare-fun res!261955 () Bool)

(assert (=> d!74083 (=> (not res!261955) (not e!260300))))

(declare-fun lt!203177 () ListLongMap!6649)

(assert (=> d!74083 (= res!261955 (not (contains!2466 lt!203177 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!260296 () ListLongMap!6649)

(assert (=> d!74083 (= lt!203177 e!260296)))

(declare-fun c!55807 () Bool)

(assert (=> d!74083 (= c!55807 (bvsge from!863 (size!13392 lt!203094)))))

(assert (=> d!74083 (validMask!0 mask!1025)))

(assert (=> d!74083 (= (getCurrentListMapNoExtraKeys!1573 lt!203094 lt!203096 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203177)))

(declare-fun b!442246 () Bool)

(declare-fun res!261954 () Bool)

(assert (=> b!442246 (=> (not res!261954) (not e!260300))))

(assert (=> b!442246 (= res!261954 (not (contains!2466 lt!203177 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442247 () Bool)

(declare-fun e!260301 () Bool)

(assert (=> b!442247 (= e!260295 e!260301)))

(declare-fun c!55806 () Bool)

(assert (=> b!442247 (= c!55806 (bvslt from!863 (size!13392 lt!203094)))))

(declare-fun b!442248 () Bool)

(declare-fun lt!203176 () Unit!13127)

(declare-fun lt!203175 () Unit!13127)

(assert (=> b!442248 (= lt!203176 lt!203175)))

(declare-fun lt!203174 () (_ BitVec 64))

(declare-fun lt!203173 () (_ BitVec 64))

(declare-fun lt!203179 () ListLongMap!6649)

(declare-fun lt!203178 () V!16683)

(assert (=> b!442248 (not (contains!2466 (+!1526 lt!203179 (tuple2!7735 lt!203174 lt!203178)) lt!203173))))

(assert (=> b!442248 (= lt!203175 (addStillNotContains!144 lt!203179 lt!203174 lt!203178 lt!203173))))

(assert (=> b!442248 (= lt!203173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442248 (= lt!203178 (get!6483 (select (arr!13041 lt!203096) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442248 (= lt!203174 (select (arr!13040 lt!203094) from!863))))

(assert (=> b!442248 (= lt!203179 call!29538)))

(declare-fun e!260298 () ListLongMap!6649)

(assert (=> b!442248 (= e!260298 (+!1526 call!29538 (tuple2!7735 (select (arr!13040 lt!203094) from!863) (get!6483 (select (arr!13041 lt!203096) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442249 () Bool)

(assert (=> b!442249 (= e!260301 (isEmpty!561 lt!203177))))

(declare-fun b!442250 () Bool)

(assert (=> b!442250 (= e!260301 (= lt!203177 (getCurrentListMapNoExtraKeys!1573 lt!203094 lt!203096 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442251 () Bool)

(assert (=> b!442251 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 lt!203094)))))

(assert (=> b!442251 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13393 lt!203096)))))

(declare-fun e!260299 () Bool)

(assert (=> b!442251 (= e!260299 (= (apply!309 lt!203177 (select (arr!13040 lt!203094) from!863)) (get!6483 (select (arr!13041 lt!203096) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442252 () Bool)

(assert (=> b!442252 (= e!260297 (validKeyInArray!0 (select (arr!13040 lt!203094) from!863)))))

(assert (=> b!442252 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!442253 () Bool)

(assert (=> b!442253 (= e!260298 call!29538)))

(declare-fun b!442254 () Bool)

(assert (=> b!442254 (= e!260296 e!260298)))

(declare-fun c!55805 () Bool)

(assert (=> b!442254 (= c!55805 (validKeyInArray!0 (select (arr!13040 lt!203094) from!863)))))

(declare-fun b!442255 () Bool)

(assert (=> b!442255 (= e!260295 e!260299)))

(assert (=> b!442255 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 lt!203094)))))

(declare-fun res!261953 () Bool)

(assert (=> b!442255 (= res!261953 (contains!2466 lt!203177 (select (arr!13040 lt!203094) from!863)))))

(assert (=> b!442255 (=> (not res!261953) (not e!260299))))

(declare-fun b!442256 () Bool)

(assert (=> b!442256 (= e!260296 (ListLongMap!6650 Nil!7724))))

(assert (= (and d!74083 c!55807) b!442256))

(assert (= (and d!74083 (not c!55807)) b!442254))

(assert (= (and b!442254 c!55805) b!442248))

(assert (= (and b!442254 (not c!55805)) b!442253))

(assert (= (or b!442248 b!442253) bm!29535))

(assert (= (and d!74083 res!261955) b!442246))

(assert (= (and b!442246 res!261954) b!442245))

(assert (= (and b!442245 res!261952) b!442252))

(assert (= (and b!442245 c!55808) b!442255))

(assert (= (and b!442245 (not c!55808)) b!442247))

(assert (= (and b!442255 res!261953) b!442251))

(assert (= (and b!442247 c!55806) b!442250))

(assert (= (and b!442247 (not c!55806)) b!442249))

(declare-fun b_lambda!9423 () Bool)

(assert (=> (not b_lambda!9423) (not b!442248)))

(assert (=> b!442248 t!13481))

(declare-fun b_and!18517 () Bool)

(assert (= b_and!18515 (and (=> t!13481 result!6949) b_and!18517)))

(declare-fun b_lambda!9425 () Bool)

(assert (=> (not b_lambda!9425) (not b!442251)))

(assert (=> b!442251 t!13481))

(declare-fun b_and!18519 () Bool)

(assert (= b_and!18517 (and (=> t!13481 result!6949) b_and!18519)))

(declare-fun m!429177 () Bool)

(assert (=> b!442248 m!429177))

(assert (=> b!442248 m!429139))

(declare-fun m!429179 () Bool)

(assert (=> b!442248 m!429179))

(assert (=> b!442248 m!429177))

(assert (=> b!442248 m!429139))

(declare-fun m!429181 () Bool)

(assert (=> b!442248 m!429181))

(declare-fun m!429183 () Bool)

(assert (=> b!442248 m!429183))

(declare-fun m!429185 () Bool)

(assert (=> b!442248 m!429185))

(declare-fun m!429187 () Bool)

(assert (=> b!442248 m!429187))

(declare-fun m!429189 () Bool)

(assert (=> b!442248 m!429189))

(assert (=> b!442248 m!429183))

(assert (=> b!442254 m!429189))

(assert (=> b!442254 m!429189))

(declare-fun m!429191 () Bool)

(assert (=> b!442254 m!429191))

(assert (=> b!442251 m!429177))

(assert (=> b!442251 m!429139))

(assert (=> b!442251 m!429179))

(assert (=> b!442251 m!429189))

(assert (=> b!442251 m!429177))

(assert (=> b!442251 m!429139))

(assert (=> b!442251 m!429189))

(declare-fun m!429193 () Bool)

(assert (=> b!442251 m!429193))

(declare-fun m!429195 () Bool)

(assert (=> b!442249 m!429195))

(declare-fun m!429197 () Bool)

(assert (=> b!442250 m!429197))

(declare-fun m!429199 () Bool)

(assert (=> b!442246 m!429199))

(assert (=> b!442255 m!429189))

(assert (=> b!442255 m!429189))

(declare-fun m!429201 () Bool)

(assert (=> b!442255 m!429201))

(declare-fun m!429203 () Bool)

(assert (=> d!74083 m!429203))

(assert (=> d!74083 m!428997))

(assert (=> bm!29535 m!429197))

(assert (=> b!442252 m!429189))

(assert (=> b!442252 m!429189))

(assert (=> b!442252 m!429191))

(assert (=> b!442044 d!74083))

(declare-fun b!442257 () Bool)

(declare-fun e!260307 () Bool)

(declare-fun e!260302 () Bool)

(assert (=> b!442257 (= e!260307 e!260302)))

(declare-fun c!55812 () Bool)

(declare-fun e!260304 () Bool)

(assert (=> b!442257 (= c!55812 e!260304)))

(declare-fun res!261956 () Bool)

(assert (=> b!442257 (=> (not res!261956) (not e!260304))))

(assert (=> b!442257 (= res!261956 (bvslt from!863 (size!13392 _keys!709)))))

(declare-fun call!29539 () ListLongMap!6649)

(declare-fun bm!29536 () Bool)

(assert (=> bm!29536 (= call!29539 (getCurrentListMapNoExtraKeys!1573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74085 () Bool)

(assert (=> d!74085 e!260307))

(declare-fun res!261959 () Bool)

(assert (=> d!74085 (=> (not res!261959) (not e!260307))))

(declare-fun lt!203184 () ListLongMap!6649)

(assert (=> d!74085 (= res!261959 (not (contains!2466 lt!203184 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!260303 () ListLongMap!6649)

(assert (=> d!74085 (= lt!203184 e!260303)))

(declare-fun c!55811 () Bool)

(assert (=> d!74085 (= c!55811 (bvsge from!863 (size!13392 _keys!709)))))

(assert (=> d!74085 (validMask!0 mask!1025)))

(assert (=> d!74085 (= (getCurrentListMapNoExtraKeys!1573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203184)))

(declare-fun b!442258 () Bool)

(declare-fun res!261958 () Bool)

(assert (=> b!442258 (=> (not res!261958) (not e!260307))))

(assert (=> b!442258 (= res!261958 (not (contains!2466 lt!203184 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442259 () Bool)

(declare-fun e!260308 () Bool)

(assert (=> b!442259 (= e!260302 e!260308)))

(declare-fun c!55810 () Bool)

(assert (=> b!442259 (= c!55810 (bvslt from!863 (size!13392 _keys!709)))))

(declare-fun b!442260 () Bool)

(declare-fun lt!203183 () Unit!13127)

(declare-fun lt!203182 () Unit!13127)

(assert (=> b!442260 (= lt!203183 lt!203182)))

(declare-fun lt!203181 () (_ BitVec 64))

(declare-fun lt!203180 () (_ BitVec 64))

(declare-fun lt!203185 () V!16683)

(declare-fun lt!203186 () ListLongMap!6649)

(assert (=> b!442260 (not (contains!2466 (+!1526 lt!203186 (tuple2!7735 lt!203181 lt!203185)) lt!203180))))

(assert (=> b!442260 (= lt!203182 (addStillNotContains!144 lt!203186 lt!203181 lt!203185 lt!203180))))

(assert (=> b!442260 (= lt!203180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442260 (= lt!203185 (get!6483 (select (arr!13041 _values!549) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442260 (= lt!203181 (select (arr!13040 _keys!709) from!863))))

(assert (=> b!442260 (= lt!203186 call!29539)))

(declare-fun e!260305 () ListLongMap!6649)

(assert (=> b!442260 (= e!260305 (+!1526 call!29539 (tuple2!7735 (select (arr!13040 _keys!709) from!863) (get!6483 (select (arr!13041 _values!549) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442261 () Bool)

(assert (=> b!442261 (= e!260308 (isEmpty!561 lt!203184))))

(declare-fun b!442262 () Bool)

(assert (=> b!442262 (= e!260308 (= lt!203184 (getCurrentListMapNoExtraKeys!1573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442263 () Bool)

(assert (=> b!442263 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 _keys!709)))))

(assert (=> b!442263 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13393 _values!549)))))

(declare-fun e!260306 () Bool)

(assert (=> b!442263 (= e!260306 (= (apply!309 lt!203184 (select (arr!13040 _keys!709) from!863)) (get!6483 (select (arr!13041 _values!549) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442264 () Bool)

(assert (=> b!442264 (= e!260304 (validKeyInArray!0 (select (arr!13040 _keys!709) from!863)))))

(assert (=> b!442264 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!442265 () Bool)

(assert (=> b!442265 (= e!260305 call!29539)))

(declare-fun b!442266 () Bool)

(assert (=> b!442266 (= e!260303 e!260305)))

(declare-fun c!55809 () Bool)

(assert (=> b!442266 (= c!55809 (validKeyInArray!0 (select (arr!13040 _keys!709) from!863)))))

(declare-fun b!442267 () Bool)

(assert (=> b!442267 (= e!260302 e!260306)))

(assert (=> b!442267 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 _keys!709)))))

(declare-fun res!261957 () Bool)

(assert (=> b!442267 (= res!261957 (contains!2466 lt!203184 (select (arr!13040 _keys!709) from!863)))))

(assert (=> b!442267 (=> (not res!261957) (not e!260306))))

(declare-fun b!442268 () Bool)

(assert (=> b!442268 (= e!260303 (ListLongMap!6650 Nil!7724))))

(assert (= (and d!74085 c!55811) b!442268))

(assert (= (and d!74085 (not c!55811)) b!442266))

(assert (= (and b!442266 c!55809) b!442260))

(assert (= (and b!442266 (not c!55809)) b!442265))

(assert (= (or b!442260 b!442265) bm!29536))

(assert (= (and d!74085 res!261959) b!442258))

(assert (= (and b!442258 res!261958) b!442257))

(assert (= (and b!442257 res!261956) b!442264))

(assert (= (and b!442257 c!55812) b!442267))

(assert (= (and b!442257 (not c!55812)) b!442259))

(assert (= (and b!442267 res!261957) b!442263))

(assert (= (and b!442259 c!55810) b!442262))

(assert (= (and b!442259 (not c!55810)) b!442261))

(declare-fun b_lambda!9427 () Bool)

(assert (=> (not b_lambda!9427) (not b!442260)))

(assert (=> b!442260 t!13481))

(declare-fun b_and!18521 () Bool)

(assert (= b_and!18519 (and (=> t!13481 result!6949) b_and!18521)))

(declare-fun b_lambda!9429 () Bool)

(assert (=> (not b_lambda!9429) (not b!442263)))

(assert (=> b!442263 t!13481))

(declare-fun b_and!18523 () Bool)

(assert (= b_and!18521 (and (=> t!13481 result!6949) b_and!18523)))

(declare-fun m!429205 () Bool)

(assert (=> b!442260 m!429205))

(assert (=> b!442260 m!429139))

(declare-fun m!429207 () Bool)

(assert (=> b!442260 m!429207))

(assert (=> b!442260 m!429205))

(assert (=> b!442260 m!429139))

(declare-fun m!429209 () Bool)

(assert (=> b!442260 m!429209))

(declare-fun m!429211 () Bool)

(assert (=> b!442260 m!429211))

(declare-fun m!429213 () Bool)

(assert (=> b!442260 m!429213))

(declare-fun m!429215 () Bool)

(assert (=> b!442260 m!429215))

(assert (=> b!442260 m!428999))

(assert (=> b!442260 m!429211))

(assert (=> b!442266 m!428999))

(assert (=> b!442266 m!428999))

(assert (=> b!442266 m!429001))

(assert (=> b!442263 m!429205))

(assert (=> b!442263 m!429139))

(assert (=> b!442263 m!429207))

(assert (=> b!442263 m!428999))

(assert (=> b!442263 m!429205))

(assert (=> b!442263 m!429139))

(assert (=> b!442263 m!428999))

(declare-fun m!429217 () Bool)

(assert (=> b!442263 m!429217))

(declare-fun m!429219 () Bool)

(assert (=> b!442261 m!429219))

(declare-fun m!429221 () Bool)

(assert (=> b!442262 m!429221))

(declare-fun m!429223 () Bool)

(assert (=> b!442258 m!429223))

(assert (=> b!442267 m!428999))

(assert (=> b!442267 m!428999))

(declare-fun m!429225 () Bool)

(assert (=> b!442267 m!429225))

(declare-fun m!429227 () Bool)

(assert (=> d!74085 m!429227))

(assert (=> d!74085 m!428997))

(assert (=> bm!29536 m!429221))

(assert (=> b!442264 m!428999))

(assert (=> b!442264 m!428999))

(assert (=> b!442264 m!429001))

(assert (=> b!442044 d!74085))

(declare-fun d!74087 () Bool)

(declare-fun res!261960 () Bool)

(declare-fun e!260309 () Bool)

(assert (=> d!74087 (=> res!261960 e!260309)))

(assert (=> d!74087 (= res!261960 (bvsge #b00000000000000000000000000000000 (size!13392 lt!203094)))))

(assert (=> d!74087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203094 mask!1025) e!260309)))

(declare-fun b!442269 () Bool)

(declare-fun e!260310 () Bool)

(declare-fun call!29540 () Bool)

(assert (=> b!442269 (= e!260310 call!29540)))

(declare-fun bm!29537 () Bool)

(assert (=> bm!29537 (= call!29540 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203094 mask!1025))))

(declare-fun b!442270 () Bool)

(declare-fun e!260311 () Bool)

(assert (=> b!442270 (= e!260311 e!260310)))

(declare-fun lt!203188 () (_ BitVec 64))

(assert (=> b!442270 (= lt!203188 (select (arr!13040 lt!203094) #b00000000000000000000000000000000))))

(declare-fun lt!203187 () Unit!13127)

(assert (=> b!442270 (= lt!203187 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203094 lt!203188 #b00000000000000000000000000000000))))

(assert (=> b!442270 (arrayContainsKey!0 lt!203094 lt!203188 #b00000000000000000000000000000000)))

(declare-fun lt!203189 () Unit!13127)

(assert (=> b!442270 (= lt!203189 lt!203187)))

(declare-fun res!261961 () Bool)

(assert (=> b!442270 (= res!261961 (= (seekEntryOrOpen!0 (select (arr!13040 lt!203094) #b00000000000000000000000000000000) lt!203094 mask!1025) (Found!3476 #b00000000000000000000000000000000)))))

(assert (=> b!442270 (=> (not res!261961) (not e!260310))))

(declare-fun b!442271 () Bool)

(assert (=> b!442271 (= e!260311 call!29540)))

(declare-fun b!442272 () Bool)

(assert (=> b!442272 (= e!260309 e!260311)))

(declare-fun c!55813 () Bool)

(assert (=> b!442272 (= c!55813 (validKeyInArray!0 (select (arr!13040 lt!203094) #b00000000000000000000000000000000)))))

(assert (= (and d!74087 (not res!261960)) b!442272))

(assert (= (and b!442272 c!55813) b!442270))

(assert (= (and b!442272 (not c!55813)) b!442271))

(assert (= (and b!442270 res!261961) b!442269))

(assert (= (or b!442269 b!442271) bm!29537))

(declare-fun m!429229 () Bool)

(assert (=> bm!29537 m!429229))

(assert (=> b!442270 m!429117))

(declare-fun m!429231 () Bool)

(assert (=> b!442270 m!429231))

(declare-fun m!429233 () Bool)

(assert (=> b!442270 m!429233))

(assert (=> b!442270 m!429117))

(declare-fun m!429235 () Bool)

(assert (=> b!442270 m!429235))

(assert (=> b!442272 m!429117))

(assert (=> b!442272 m!429117))

(assert (=> b!442272 m!429123))

(assert (=> b!442037 d!74087))

(declare-fun b!442273 () Bool)

(declare-fun e!260317 () Bool)

(declare-fun e!260312 () Bool)

(assert (=> b!442273 (= e!260317 e!260312)))

(declare-fun c!55817 () Bool)

(declare-fun e!260314 () Bool)

(assert (=> b!442273 (= c!55817 e!260314)))

(declare-fun res!261962 () Bool)

(assert (=> b!442273 (=> (not res!261962) (not e!260314))))

(assert (=> b!442273 (= res!261962 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 lt!203094 _keys!709))))))

(declare-fun call!29541 () ListLongMap!6649)

(declare-fun bm!29538 () Bool)

(assert (=> bm!29538 (= call!29541 (getCurrentListMapNoExtraKeys!1573 (ite c!55776 lt!203094 _keys!709) (ite c!55776 lt!203096 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74089 () Bool)

(assert (=> d!74089 e!260317))

(declare-fun res!261965 () Bool)

(assert (=> d!74089 (=> (not res!261965) (not e!260317))))

(declare-fun lt!203194 () ListLongMap!6649)

(assert (=> d!74089 (= res!261965 (not (contains!2466 lt!203194 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!260313 () ListLongMap!6649)

(assert (=> d!74089 (= lt!203194 e!260313)))

(declare-fun c!55816 () Bool)

(assert (=> d!74089 (= c!55816 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 lt!203094 _keys!709))))))

(assert (=> d!74089 (validMask!0 mask!1025)))

(assert (=> d!74089 (= (getCurrentListMapNoExtraKeys!1573 (ite c!55776 lt!203094 _keys!709) (ite c!55776 lt!203096 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203194)))

(declare-fun b!442274 () Bool)

(declare-fun res!261964 () Bool)

(assert (=> b!442274 (=> (not res!261964) (not e!260317))))

(assert (=> b!442274 (= res!261964 (not (contains!2466 lt!203194 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442275 () Bool)

(declare-fun e!260318 () Bool)

(assert (=> b!442275 (= e!260312 e!260318)))

(declare-fun c!55815 () Bool)

(assert (=> b!442275 (= c!55815 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 lt!203094 _keys!709))))))

(declare-fun b!442276 () Bool)

(declare-fun lt!203193 () Unit!13127)

(declare-fun lt!203192 () Unit!13127)

(assert (=> b!442276 (= lt!203193 lt!203192)))

(declare-fun lt!203190 () (_ BitVec 64))

(declare-fun lt!203195 () V!16683)

(declare-fun lt!203191 () (_ BitVec 64))

(declare-fun lt!203196 () ListLongMap!6649)

(assert (=> b!442276 (not (contains!2466 (+!1526 lt!203196 (tuple2!7735 lt!203191 lt!203195)) lt!203190))))

(assert (=> b!442276 (= lt!203192 (addStillNotContains!144 lt!203196 lt!203191 lt!203195 lt!203190))))

(assert (=> b!442276 (= lt!203190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442276 (= lt!203195 (get!6483 (select (arr!13041 (ite c!55776 lt!203096 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442276 (= lt!203191 (select (arr!13040 (ite c!55776 lt!203094 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!442276 (= lt!203196 call!29541)))

(declare-fun e!260315 () ListLongMap!6649)

(assert (=> b!442276 (= e!260315 (+!1526 call!29541 (tuple2!7735 (select (arr!13040 (ite c!55776 lt!203094 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6483 (select (arr!13041 (ite c!55776 lt!203096 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442277 () Bool)

(assert (=> b!442277 (= e!260318 (isEmpty!561 lt!203194))))

(declare-fun b!442278 () Bool)

(assert (=> b!442278 (= e!260318 (= lt!203194 (getCurrentListMapNoExtraKeys!1573 (ite c!55776 lt!203094 _keys!709) (ite c!55776 lt!203096 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442279 () Bool)

(assert (=> b!442279 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 lt!203094 _keys!709))))))

(assert (=> b!442279 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55776 lt!203096 _values!549))))))

(declare-fun e!260316 () Bool)

(assert (=> b!442279 (= e!260316 (= (apply!309 lt!203194 (select (arr!13040 (ite c!55776 lt!203094 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6483 (select (arr!13041 (ite c!55776 lt!203096 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442280 () Bool)

(assert (=> b!442280 (= e!260314 (validKeyInArray!0 (select (arr!13040 (ite c!55776 lt!203094 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442280 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!442281 () Bool)

(assert (=> b!442281 (= e!260315 call!29541)))

(declare-fun b!442282 () Bool)

(assert (=> b!442282 (= e!260313 e!260315)))

(declare-fun c!55814 () Bool)

(assert (=> b!442282 (= c!55814 (validKeyInArray!0 (select (arr!13040 (ite c!55776 lt!203094 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!442283 () Bool)

(assert (=> b!442283 (= e!260312 e!260316)))

(assert (=> b!442283 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55776 lt!203094 _keys!709))))))

(declare-fun res!261963 () Bool)

(assert (=> b!442283 (= res!261963 (contains!2466 lt!203194 (select (arr!13040 (ite c!55776 lt!203094 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442283 (=> (not res!261963) (not e!260316))))

(declare-fun b!442284 () Bool)

(assert (=> b!442284 (= e!260313 (ListLongMap!6650 Nil!7724))))

(assert (= (and d!74089 c!55816) b!442284))

(assert (= (and d!74089 (not c!55816)) b!442282))

(assert (= (and b!442282 c!55814) b!442276))

(assert (= (and b!442282 (not c!55814)) b!442281))

(assert (= (or b!442276 b!442281) bm!29538))

(assert (= (and d!74089 res!261965) b!442274))

(assert (= (and b!442274 res!261964) b!442273))

(assert (= (and b!442273 res!261962) b!442280))

(assert (= (and b!442273 c!55817) b!442283))

(assert (= (and b!442273 (not c!55817)) b!442275))

(assert (= (and b!442283 res!261963) b!442279))

(assert (= (and b!442275 c!55815) b!442278))

(assert (= (and b!442275 (not c!55815)) b!442277))

(declare-fun b_lambda!9431 () Bool)

(assert (=> (not b_lambda!9431) (not b!442276)))

(assert (=> b!442276 t!13481))

(declare-fun b_and!18525 () Bool)

(assert (= b_and!18523 (and (=> t!13481 result!6949) b_and!18525)))

(declare-fun b_lambda!9433 () Bool)

(assert (=> (not b_lambda!9433) (not b!442279)))

(assert (=> b!442279 t!13481))

(declare-fun b_and!18527 () Bool)

(assert (= b_and!18525 (and (=> t!13481 result!6949) b_and!18527)))

(declare-fun m!429237 () Bool)

(assert (=> b!442276 m!429237))

(assert (=> b!442276 m!429139))

(declare-fun m!429239 () Bool)

(assert (=> b!442276 m!429239))

(assert (=> b!442276 m!429237))

(assert (=> b!442276 m!429139))

(declare-fun m!429241 () Bool)

(assert (=> b!442276 m!429241))

(declare-fun m!429243 () Bool)

(assert (=> b!442276 m!429243))

(declare-fun m!429245 () Bool)

(assert (=> b!442276 m!429245))

(declare-fun m!429247 () Bool)

(assert (=> b!442276 m!429247))

(declare-fun m!429249 () Bool)

(assert (=> b!442276 m!429249))

(assert (=> b!442276 m!429243))

(assert (=> b!442282 m!429249))

(assert (=> b!442282 m!429249))

(declare-fun m!429251 () Bool)

(assert (=> b!442282 m!429251))

(assert (=> b!442279 m!429237))

(assert (=> b!442279 m!429139))

(assert (=> b!442279 m!429239))

(assert (=> b!442279 m!429249))

(assert (=> b!442279 m!429237))

(assert (=> b!442279 m!429139))

(assert (=> b!442279 m!429249))

(declare-fun m!429253 () Bool)

(assert (=> b!442279 m!429253))

(declare-fun m!429255 () Bool)

(assert (=> b!442277 m!429255))

(declare-fun m!429257 () Bool)

(assert (=> b!442278 m!429257))

(declare-fun m!429259 () Bool)

(assert (=> b!442274 m!429259))

(assert (=> b!442283 m!429249))

(assert (=> b!442283 m!429249))

(declare-fun m!429261 () Bool)

(assert (=> b!442283 m!429261))

(declare-fun m!429263 () Bool)

(assert (=> d!74089 m!429263))

(assert (=> d!74089 m!428997))

(assert (=> bm!29538 m!429257))

(assert (=> b!442280 m!429249))

(assert (=> b!442280 m!429249))

(assert (=> b!442280 m!429251))

(assert (=> bm!29506 d!74089))

(declare-fun mapIsEmpty!19155 () Bool)

(declare-fun mapRes!19155 () Bool)

(assert (=> mapIsEmpty!19155 mapRes!19155))

(declare-fun b!442292 () Bool)

(declare-fun e!260324 () Bool)

(assert (=> b!442292 (= e!260324 tp_is_empty!11683)))

(declare-fun condMapEmpty!19155 () Bool)

(declare-fun mapDefault!19155 () ValueCell!5498)

(assert (=> mapNonEmpty!19146 (= condMapEmpty!19155 (= mapRest!19146 ((as const (Array (_ BitVec 32) ValueCell!5498)) mapDefault!19155)))))

(assert (=> mapNonEmpty!19146 (= tp!37112 (and e!260324 mapRes!19155))))

(declare-fun b!442291 () Bool)

(declare-fun e!260323 () Bool)

(assert (=> b!442291 (= e!260323 tp_is_empty!11683)))

(declare-fun mapNonEmpty!19155 () Bool)

(declare-fun tp!37128 () Bool)

(assert (=> mapNonEmpty!19155 (= mapRes!19155 (and tp!37128 e!260323))))

(declare-fun mapKey!19155 () (_ BitVec 32))

(declare-fun mapValue!19155 () ValueCell!5498)

(declare-fun mapRest!19155 () (Array (_ BitVec 32) ValueCell!5498))

(assert (=> mapNonEmpty!19155 (= mapRest!19146 (store mapRest!19155 mapKey!19155 mapValue!19155))))

(assert (= (and mapNonEmpty!19146 condMapEmpty!19155) mapIsEmpty!19155))

(assert (= (and mapNonEmpty!19146 (not condMapEmpty!19155)) mapNonEmpty!19155))

(assert (= (and mapNonEmpty!19155 ((_ is ValueCellFull!5498) mapValue!19155)) b!442291))

(assert (= (and mapNonEmpty!19146 ((_ is ValueCellFull!5498) mapDefault!19155)) b!442292))

(declare-fun m!429265 () Bool)

(assert (=> mapNonEmpty!19155 m!429265))

(declare-fun b_lambda!9435 () Bool)

(assert (= b_lambda!9433 (or (and start!40250 b_free!10525) b_lambda!9435)))

(declare-fun b_lambda!9437 () Bool)

(assert (= b_lambda!9423 (or (and start!40250 b_free!10525) b_lambda!9437)))

(declare-fun b_lambda!9439 () Bool)

(assert (= b_lambda!9425 (or (and start!40250 b_free!10525) b_lambda!9439)))

(declare-fun b_lambda!9441 () Bool)

(assert (= b_lambda!9431 (or (and start!40250 b_free!10525) b_lambda!9441)))

(declare-fun b_lambda!9443 () Bool)

(assert (= b_lambda!9421 (or (and start!40250 b_free!10525) b_lambda!9443)))

(declare-fun b_lambda!9445 () Bool)

(assert (= b_lambda!9429 (or (and start!40250 b_free!10525) b_lambda!9445)))

(declare-fun b_lambda!9447 () Bool)

(assert (= b_lambda!9427 (or (and start!40250 b_free!10525) b_lambda!9447)))

(declare-fun b_lambda!9449 () Bool)

(assert (= b_lambda!9419 (or (and start!40250 b_free!10525) b_lambda!9449)))

(check-sat (not b!442164) (not b_next!10525) (not b!442254) (not b!442258) (not bm!29535) (not b!442276) (not b!442262) (not d!74089) (not b_lambda!9437) (not b!442222) (not bm!29521) (not b!442278) (not mapNonEmpty!19155) (not b!442283) (not b!442220) (not b_lambda!9445) (not b_lambda!9447) (not b!442216) (not b!442182) (not d!74083) (not b!442249) (not b!442232) (not b_lambda!9435) tp_is_empty!11683 (not d!74069) (not b!442274) (not b!442282) (not b!442279) (not d!74085) (not b!442270) (not bm!29538) (not b!442261) (not b!442251) (not b_lambda!9443) (not b!442214) (not b!442218) (not b!442223) (not b!442242) (not b!442255) (not bm!29537) (not b!442246) (not b_lambda!9439) (not b!442252) (not b!442178) (not b!442168) (not b_lambda!9441) (not bm!29526) (not b_lambda!9449) (not d!74063) (not b!442217) (not b!442167) (not b!442175) (not b!442219) (not b!442260) (not bm!29534) (not b!442280) (not b!442181) (not bm!29528) (not b!442272) (not b!442267) (not b!442248) (not b!442244) (not d!74075) (not b!442264) (not bm!29527) (not b!442263) (not bm!29536) b_and!18527 (not b!442266) (not b!442188) (not bm!29531) (not b!442277) (not b!442187) (not b!442250))
(check-sat b_and!18527 (not b_next!10525))
