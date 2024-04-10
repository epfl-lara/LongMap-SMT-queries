; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40266 () Bool)

(assert start!40266)

(declare-fun b_free!10527 () Bool)

(declare-fun b_next!10527 () Bool)

(assert (=> start!40266 (= b_free!10527 (not b_next!10527))))

(declare-fun tp!37119 () Bool)

(declare-fun b_and!18495 () Bool)

(assert (=> start!40266 (= tp!37119 b_and!18495)))

(declare-fun b!442131 () Bool)

(declare-fun e!260240 () Bool)

(declare-fun e!260241 () Bool)

(declare-fun mapRes!19149 () Bool)

(assert (=> b!442131 (= e!260240 (and e!260241 mapRes!19149))))

(declare-fun condMapEmpty!19149 () Bool)

(declare-datatypes ((V!16685 0))(
  ( (V!16686 (val!5887 Int)) )
))
(declare-datatypes ((ValueCell!5499 0))(
  ( (ValueCellFull!5499 (v!8134 V!16685)) (EmptyCell!5499) )
))
(declare-datatypes ((array!27181 0))(
  ( (array!27182 (arr!13040 (Array (_ BitVec 32) ValueCell!5499)) (size!13392 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27181)

(declare-fun mapDefault!19149 () ValueCell!5499)

(assert (=> b!442131 (= condMapEmpty!19149 (= (arr!13040 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5499)) mapDefault!19149)))))

(declare-fun b!442132 () Bool)

(declare-fun res!261870 () Bool)

(declare-fun e!260235 () Bool)

(assert (=> b!442132 (=> (not res!261870) (not e!260235))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442132 (= res!261870 (bvsle from!863 i!563))))

(declare-fun b!442133 () Bool)

(declare-fun res!261868 () Bool)

(declare-fun e!260234 () Bool)

(assert (=> b!442133 (=> (not res!261868) (not e!260234))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442133 (= res!261868 (validKeyInArray!0 k0!794))))

(declare-fun b!442134 () Bool)

(declare-fun e!260236 () Bool)

(declare-datatypes ((tuple2!7834 0))(
  ( (tuple2!7835 (_1!3928 (_ BitVec 64)) (_2!3928 V!16685)) )
))
(declare-datatypes ((List!7831 0))(
  ( (Nil!7828) (Cons!7827 (h!8683 tuple2!7834) (t!13587 List!7831)) )
))
(declare-datatypes ((ListLongMap!6747 0))(
  ( (ListLongMap!6748 (toList!3389 List!7831)) )
))
(declare-fun call!29527 () ListLongMap!6747)

(declare-fun call!29528 () ListLongMap!6747)

(assert (=> b!442134 (= e!260236 (= call!29527 call!29528))))

(declare-fun mapIsEmpty!19149 () Bool)

(assert (=> mapIsEmpty!19149 mapRes!19149))

(declare-fun b!442135 () Bool)

(declare-fun res!261867 () Bool)

(assert (=> b!442135 (=> (not res!261867) (not e!260234))))

(declare-datatypes ((array!27183 0))(
  ( (array!27184 (arr!13041 (Array (_ BitVec 32) (_ BitVec 64))) (size!13393 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27183)

(declare-fun arrayContainsKey!0 (array!27183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442135 (= res!261867 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun c!55802 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16685)

(declare-fun bm!29524 () Bool)

(declare-fun lt!203091 () array!27183)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!203090 () array!27181)

(declare-fun minValue!515 () V!16685)

(declare-fun getCurrentListMapNoExtraKeys!1578 (array!27183 array!27181 (_ BitVec 32) (_ BitVec 32) V!16685 V!16685 (_ BitVec 32) Int) ListLongMap!6747)

(assert (=> bm!29524 (= call!29528 (getCurrentListMapNoExtraKeys!1578 (ite c!55802 lt!203091 _keys!709) (ite c!55802 lt!203090 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442137 () Bool)

(declare-fun res!261869 () Bool)

(assert (=> b!442137 (=> (not res!261869) (not e!260234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27183 (_ BitVec 32)) Bool)

(assert (=> b!442137 (= res!261869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442138 () Bool)

(declare-fun res!261859 () Bool)

(assert (=> b!442138 (=> (not res!261859) (not e!260234))))

(assert (=> b!442138 (= res!261859 (and (= (size!13392 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13393 _keys!709) (size!13392 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442139 () Bool)

(declare-fun res!261864 () Bool)

(assert (=> b!442139 (=> (not res!261864) (not e!260234))))

(assert (=> b!442139 (= res!261864 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13393 _keys!709))))))

(declare-fun b!442140 () Bool)

(declare-fun e!260237 () Bool)

(assert (=> b!442140 (= e!260237 (not (not (validKeyInArray!0 (select (arr!13041 _keys!709) from!863)))))))

(assert (=> b!442140 e!260236))

(assert (=> b!442140 (= c!55802 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!16685)

(declare-datatypes ((Unit!13150 0))(
  ( (Unit!13151) )
))
(declare-fun lt!203092 () Unit!13150)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!692 (array!27183 array!27181 (_ BitVec 32) (_ BitVec 32) V!16685 V!16685 (_ BitVec 32) (_ BitVec 64) V!16685 (_ BitVec 32) Int) Unit!13150)

(assert (=> b!442140 (= lt!203092 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442141 () Bool)

(declare-fun res!261861 () Bool)

(assert (=> b!442141 (=> (not res!261861) (not e!260234))))

(declare-datatypes ((List!7832 0))(
  ( (Nil!7829) (Cons!7828 (h!8684 (_ BitVec 64)) (t!13588 List!7832)) )
))
(declare-fun arrayNoDuplicates!0 (array!27183 (_ BitVec 32) List!7832) Bool)

(assert (=> b!442141 (= res!261861 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7829))))

(declare-fun b!442142 () Bool)

(assert (=> b!442142 (= e!260234 e!260235)))

(declare-fun res!261865 () Bool)

(assert (=> b!442142 (=> (not res!261865) (not e!260235))))

(assert (=> b!442142 (= res!261865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203091 mask!1025))))

(assert (=> b!442142 (= lt!203091 (array!27184 (store (arr!13041 _keys!709) i!563 k0!794) (size!13393 _keys!709)))))

(declare-fun b!442143 () Bool)

(declare-fun res!261860 () Bool)

(assert (=> b!442143 (=> (not res!261860) (not e!260235))))

(assert (=> b!442143 (= res!261860 (arrayNoDuplicates!0 lt!203091 #b00000000000000000000000000000000 Nil!7829))))

(declare-fun mapNonEmpty!19149 () Bool)

(declare-fun tp!37118 () Bool)

(declare-fun e!260239 () Bool)

(assert (=> mapNonEmpty!19149 (= mapRes!19149 (and tp!37118 e!260239))))

(declare-fun mapValue!19149 () ValueCell!5499)

(declare-fun mapRest!19149 () (Array (_ BitVec 32) ValueCell!5499))

(declare-fun mapKey!19149 () (_ BitVec 32))

(assert (=> mapNonEmpty!19149 (= (arr!13040 _values!549) (store mapRest!19149 mapKey!19149 mapValue!19149))))

(declare-fun b!442144 () Bool)

(declare-fun tp_is_empty!11685 () Bool)

(assert (=> b!442144 (= e!260241 tp_is_empty!11685)))

(declare-fun b!442145 () Bool)

(assert (=> b!442145 (= e!260235 e!260237)))

(declare-fun res!261858 () Bool)

(assert (=> b!442145 (=> (not res!261858) (not e!260237))))

(assert (=> b!442145 (= res!261858 (= from!863 i!563))))

(declare-fun lt!203089 () ListLongMap!6747)

(assert (=> b!442145 (= lt!203089 (getCurrentListMapNoExtraKeys!1578 lt!203091 lt!203090 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!442145 (= lt!203090 (array!27182 (store (arr!13040 _values!549) i!563 (ValueCellFull!5499 v!412)) (size!13392 _values!549)))))

(declare-fun lt!203093 () ListLongMap!6747)

(assert (=> b!442145 (= lt!203093 (getCurrentListMapNoExtraKeys!1578 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!442146 () Bool)

(declare-fun +!1523 (ListLongMap!6747 tuple2!7834) ListLongMap!6747)

(assert (=> b!442146 (= e!260236 (= call!29528 (+!1523 call!29527 (tuple2!7835 k0!794 v!412))))))

(declare-fun b!442147 () Bool)

(declare-fun res!261862 () Bool)

(assert (=> b!442147 (=> (not res!261862) (not e!260234))))

(assert (=> b!442147 (= res!261862 (or (= (select (arr!13041 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13041 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442136 () Bool)

(assert (=> b!442136 (= e!260239 tp_is_empty!11685)))

(declare-fun res!261866 () Bool)

(assert (=> start!40266 (=> (not res!261866) (not e!260234))))

(assert (=> start!40266 (= res!261866 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13393 _keys!709))))))

(assert (=> start!40266 e!260234))

(assert (=> start!40266 tp_is_empty!11685))

(assert (=> start!40266 tp!37119))

(assert (=> start!40266 true))

(declare-fun array_inv!9462 (array!27181) Bool)

(assert (=> start!40266 (and (array_inv!9462 _values!549) e!260240)))

(declare-fun array_inv!9463 (array!27183) Bool)

(assert (=> start!40266 (array_inv!9463 _keys!709)))

(declare-fun bm!29525 () Bool)

(assert (=> bm!29525 (= call!29527 (getCurrentListMapNoExtraKeys!1578 (ite c!55802 _keys!709 lt!203091) (ite c!55802 _values!549 lt!203090) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442148 () Bool)

(declare-fun res!261863 () Bool)

(assert (=> b!442148 (=> (not res!261863) (not e!260234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442148 (= res!261863 (validMask!0 mask!1025))))

(assert (= (and start!40266 res!261866) b!442148))

(assert (= (and b!442148 res!261863) b!442138))

(assert (= (and b!442138 res!261859) b!442137))

(assert (= (and b!442137 res!261869) b!442141))

(assert (= (and b!442141 res!261861) b!442139))

(assert (= (and b!442139 res!261864) b!442133))

(assert (= (and b!442133 res!261868) b!442147))

(assert (= (and b!442147 res!261862) b!442135))

(assert (= (and b!442135 res!261867) b!442142))

(assert (= (and b!442142 res!261865) b!442143))

(assert (= (and b!442143 res!261860) b!442132))

(assert (= (and b!442132 res!261870) b!442145))

(assert (= (and b!442145 res!261858) b!442140))

(assert (= (and b!442140 c!55802) b!442146))

(assert (= (and b!442140 (not c!55802)) b!442134))

(assert (= (or b!442146 b!442134) bm!29524))

(assert (= (or b!442146 b!442134) bm!29525))

(assert (= (and b!442131 condMapEmpty!19149) mapIsEmpty!19149))

(assert (= (and b!442131 (not condMapEmpty!19149)) mapNonEmpty!19149))

(get-info :version)

(assert (= (and mapNonEmpty!19149 ((_ is ValueCellFull!5499) mapValue!19149)) b!442136))

(assert (= (and b!442131 ((_ is ValueCellFull!5499) mapDefault!19149)) b!442144))

(assert (= start!40266 b!442131))

(declare-fun m!428799 () Bool)

(assert (=> bm!29525 m!428799))

(declare-fun m!428801 () Bool)

(assert (=> b!442147 m!428801))

(declare-fun m!428803 () Bool)

(assert (=> b!442143 m!428803))

(declare-fun m!428805 () Bool)

(assert (=> start!40266 m!428805))

(declare-fun m!428807 () Bool)

(assert (=> start!40266 m!428807))

(declare-fun m!428809 () Bool)

(assert (=> mapNonEmpty!19149 m!428809))

(declare-fun m!428811 () Bool)

(assert (=> b!442135 m!428811))

(declare-fun m!428813 () Bool)

(assert (=> b!442141 m!428813))

(declare-fun m!428815 () Bool)

(assert (=> bm!29524 m!428815))

(declare-fun m!428817 () Bool)

(assert (=> b!442140 m!428817))

(assert (=> b!442140 m!428817))

(declare-fun m!428819 () Bool)

(assert (=> b!442140 m!428819))

(declare-fun m!428821 () Bool)

(assert (=> b!442140 m!428821))

(declare-fun m!428823 () Bool)

(assert (=> b!442142 m!428823))

(declare-fun m!428825 () Bool)

(assert (=> b!442142 m!428825))

(declare-fun m!428827 () Bool)

(assert (=> b!442133 m!428827))

(declare-fun m!428829 () Bool)

(assert (=> b!442146 m!428829))

(declare-fun m!428831 () Bool)

(assert (=> b!442148 m!428831))

(declare-fun m!428833 () Bool)

(assert (=> b!442145 m!428833))

(declare-fun m!428835 () Bool)

(assert (=> b!442145 m!428835))

(declare-fun m!428837 () Bool)

(assert (=> b!442145 m!428837))

(declare-fun m!428839 () Bool)

(assert (=> b!442137 m!428839))

(check-sat (not b_next!10527) b_and!18495 (not b!442135) (not b!442142) (not b!442141) tp_is_empty!11685 (not b!442145) (not b!442137) (not start!40266) (not b!442146) (not b!442140) (not b!442133) (not b!442143) (not bm!29524) (not b!442148) (not bm!29525) (not mapNonEmpty!19149))
(check-sat b_and!18495 (not b_next!10527))
(get-model)

(declare-fun d!74029 () Bool)

(assert (=> d!74029 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!442133 d!74029))

(declare-fun d!74031 () Bool)

(assert (=> d!74031 (= (array_inv!9462 _values!549) (bvsge (size!13392 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40266 d!74031))

(declare-fun d!74033 () Bool)

(assert (=> d!74033 (= (array_inv!9463 _keys!709) (bvsge (size!13393 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40266 d!74033))

(declare-fun b!442211 () Bool)

(declare-fun e!260272 () Bool)

(declare-fun call!29537 () Bool)

(assert (=> b!442211 (= e!260272 call!29537)))

(declare-fun b!442212 () Bool)

(declare-fun e!260274 () Bool)

(assert (=> b!442212 (= e!260274 call!29537)))

(declare-fun b!442213 () Bool)

(declare-fun e!260273 () Bool)

(assert (=> b!442213 (= e!260273 e!260274)))

(declare-fun c!55808 () Bool)

(assert (=> b!442213 (= c!55808 (validKeyInArray!0 (select (arr!13041 lt!203091) #b00000000000000000000000000000000)))))

(declare-fun d!74035 () Bool)

(declare-fun res!261914 () Bool)

(assert (=> d!74035 (=> res!261914 e!260273)))

(assert (=> d!74035 (= res!261914 (bvsge #b00000000000000000000000000000000 (size!13393 lt!203091)))))

(assert (=> d!74035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203091 mask!1025) e!260273)))

(declare-fun b!442214 () Bool)

(assert (=> b!442214 (= e!260274 e!260272)))

(declare-fun lt!203117 () (_ BitVec 64))

(assert (=> b!442214 (= lt!203117 (select (arr!13041 lt!203091) #b00000000000000000000000000000000))))

(declare-fun lt!203116 () Unit!13150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27183 (_ BitVec 64) (_ BitVec 32)) Unit!13150)

(assert (=> b!442214 (= lt!203116 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203091 lt!203117 #b00000000000000000000000000000000))))

(assert (=> b!442214 (arrayContainsKey!0 lt!203091 lt!203117 #b00000000000000000000000000000000)))

(declare-fun lt!203115 () Unit!13150)

(assert (=> b!442214 (= lt!203115 lt!203116)))

(declare-fun res!261915 () Bool)

(declare-datatypes ((SeekEntryResult!3527 0))(
  ( (MissingZero!3527 (index!16287 (_ BitVec 32))) (Found!3527 (index!16288 (_ BitVec 32))) (Intermediate!3527 (undefined!4339 Bool) (index!16289 (_ BitVec 32)) (x!41736 (_ BitVec 32))) (Undefined!3527) (MissingVacant!3527 (index!16290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27183 (_ BitVec 32)) SeekEntryResult!3527)

(assert (=> b!442214 (= res!261915 (= (seekEntryOrOpen!0 (select (arr!13041 lt!203091) #b00000000000000000000000000000000) lt!203091 mask!1025) (Found!3527 #b00000000000000000000000000000000)))))

(assert (=> b!442214 (=> (not res!261915) (not e!260272))))

(declare-fun bm!29534 () Bool)

(assert (=> bm!29534 (= call!29537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203091 mask!1025))))

(assert (= (and d!74035 (not res!261914)) b!442213))

(assert (= (and b!442213 c!55808) b!442214))

(assert (= (and b!442213 (not c!55808)) b!442212))

(assert (= (and b!442214 res!261915) b!442211))

(assert (= (or b!442211 b!442212) bm!29534))

(declare-fun m!428883 () Bool)

(assert (=> b!442213 m!428883))

(assert (=> b!442213 m!428883))

(declare-fun m!428885 () Bool)

(assert (=> b!442213 m!428885))

(assert (=> b!442214 m!428883))

(declare-fun m!428887 () Bool)

(assert (=> b!442214 m!428887))

(declare-fun m!428889 () Bool)

(assert (=> b!442214 m!428889))

(assert (=> b!442214 m!428883))

(declare-fun m!428891 () Bool)

(assert (=> b!442214 m!428891))

(declare-fun m!428893 () Bool)

(assert (=> bm!29534 m!428893))

(assert (=> b!442142 d!74035))

(declare-fun d!74037 () Bool)

(assert (=> d!74037 (= (validKeyInArray!0 (select (arr!13041 _keys!709) from!863)) (and (not (= (select (arr!13041 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13041 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!442140 d!74037))

(declare-fun b!442221 () Bool)

(declare-fun e!260280 () Bool)

(declare-fun call!29543 () ListLongMap!6747)

(declare-fun call!29542 () ListLongMap!6747)

(assert (=> b!442221 (= e!260280 (= call!29543 call!29542))))

(declare-fun bm!29539 () Bool)

(assert (=> bm!29539 (= call!29542 (getCurrentListMapNoExtraKeys!1578 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29540 () Bool)

(assert (=> bm!29540 (= call!29543 (getCurrentListMapNoExtraKeys!1578 (array!27184 (store (arr!13041 _keys!709) i!563 k0!794) (size!13393 _keys!709)) (array!27182 (store (arr!13040 _values!549) i!563 (ValueCellFull!5499 v!412)) (size!13392 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442222 () Bool)

(declare-fun e!260279 () Bool)

(assert (=> b!442222 (= e!260279 e!260280)))

(declare-fun c!55811 () Bool)

(assert (=> b!442222 (= c!55811 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun d!74039 () Bool)

(assert (=> d!74039 e!260279))

(declare-fun res!261918 () Bool)

(assert (=> d!74039 (=> (not res!261918) (not e!260279))))

(assert (=> d!74039 (= res!261918 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13393 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13392 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13393 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13392 _values!549))))))))

(declare-fun lt!203120 () Unit!13150)

(declare-fun choose!1324 (array!27183 array!27181 (_ BitVec 32) (_ BitVec 32) V!16685 V!16685 (_ BitVec 32) (_ BitVec 64) V!16685 (_ BitVec 32) Int) Unit!13150)

(assert (=> d!74039 (= lt!203120 (choose!1324 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74039 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13393 _keys!709)))))

(assert (=> d!74039 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203120)))

(declare-fun b!442223 () Bool)

(assert (=> b!442223 (= e!260280 (= call!29543 (+!1523 call!29542 (tuple2!7835 k0!794 v!412))))))

(assert (= (and d!74039 res!261918) b!442222))

(assert (= (and b!442222 c!55811) b!442223))

(assert (= (and b!442222 (not c!55811)) b!442221))

(assert (= (or b!442223 b!442221) bm!29539))

(assert (= (or b!442223 b!442221) bm!29540))

(declare-fun m!428895 () Bool)

(assert (=> bm!29539 m!428895))

(assert (=> bm!29540 m!428825))

(assert (=> bm!29540 m!428835))

(declare-fun m!428897 () Bool)

(assert (=> bm!29540 m!428897))

(declare-fun m!428899 () Bool)

(assert (=> d!74039 m!428899))

(declare-fun m!428901 () Bool)

(assert (=> b!442223 m!428901))

(assert (=> b!442140 d!74039))

(declare-fun b!442235 () Bool)

(declare-fun e!260291 () Bool)

(declare-fun contains!2485 (List!7832 (_ BitVec 64)) Bool)

(assert (=> b!442235 (= e!260291 (contains!2485 Nil!7829 (select (arr!13041 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!442236 () Bool)

(declare-fun e!260292 () Bool)

(declare-fun e!260290 () Bool)

(assert (=> b!442236 (= e!260292 e!260290)))

(declare-fun c!55814 () Bool)

(assert (=> b!442236 (= c!55814 (validKeyInArray!0 (select (arr!13041 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!29543 () Bool)

(declare-fun call!29546 () Bool)

(assert (=> bm!29543 (= call!29546 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55814 (Cons!7828 (select (arr!13041 _keys!709) #b00000000000000000000000000000000) Nil!7829) Nil!7829)))))

(declare-fun b!442237 () Bool)

(assert (=> b!442237 (= e!260290 call!29546)))

(declare-fun b!442238 () Bool)

(assert (=> b!442238 (= e!260290 call!29546)))

(declare-fun d!74041 () Bool)

(declare-fun res!261927 () Bool)

(declare-fun e!260289 () Bool)

(assert (=> d!74041 (=> res!261927 e!260289)))

(assert (=> d!74041 (= res!261927 (bvsge #b00000000000000000000000000000000 (size!13393 _keys!709)))))

(assert (=> d!74041 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7829) e!260289)))

(declare-fun b!442234 () Bool)

(assert (=> b!442234 (= e!260289 e!260292)))

(declare-fun res!261926 () Bool)

(assert (=> b!442234 (=> (not res!261926) (not e!260292))))

(assert (=> b!442234 (= res!261926 (not e!260291))))

(declare-fun res!261925 () Bool)

(assert (=> b!442234 (=> (not res!261925) (not e!260291))))

(assert (=> b!442234 (= res!261925 (validKeyInArray!0 (select (arr!13041 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74041 (not res!261927)) b!442234))

(assert (= (and b!442234 res!261925) b!442235))

(assert (= (and b!442234 res!261926) b!442236))

(assert (= (and b!442236 c!55814) b!442238))

(assert (= (and b!442236 (not c!55814)) b!442237))

(assert (= (or b!442238 b!442237) bm!29543))

(declare-fun m!428903 () Bool)

(assert (=> b!442235 m!428903))

(assert (=> b!442235 m!428903))

(declare-fun m!428905 () Bool)

(assert (=> b!442235 m!428905))

(assert (=> b!442236 m!428903))

(assert (=> b!442236 m!428903))

(declare-fun m!428907 () Bool)

(assert (=> b!442236 m!428907))

(assert (=> bm!29543 m!428903))

(declare-fun m!428909 () Bool)

(assert (=> bm!29543 m!428909))

(assert (=> b!442234 m!428903))

(assert (=> b!442234 m!428903))

(assert (=> b!442234 m!428907))

(assert (=> b!442141 d!74041))

(declare-fun d!74043 () Bool)

(declare-fun res!261932 () Bool)

(declare-fun e!260297 () Bool)

(assert (=> d!74043 (=> res!261932 e!260297)))

(assert (=> d!74043 (= res!261932 (= (select (arr!13041 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74043 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!260297)))

(declare-fun b!442243 () Bool)

(declare-fun e!260298 () Bool)

(assert (=> b!442243 (= e!260297 e!260298)))

(declare-fun res!261933 () Bool)

(assert (=> b!442243 (=> (not res!261933) (not e!260298))))

(assert (=> b!442243 (= res!261933 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13393 _keys!709)))))

(declare-fun b!442244 () Bool)

(assert (=> b!442244 (= e!260298 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74043 (not res!261932)) b!442243))

(assert (= (and b!442243 res!261933) b!442244))

(assert (=> d!74043 m!428903))

(declare-fun m!428911 () Bool)

(assert (=> b!442244 m!428911))

(assert (=> b!442135 d!74043))

(declare-fun b!442246 () Bool)

(declare-fun e!260301 () Bool)

(assert (=> b!442246 (= e!260301 (contains!2485 Nil!7829 (select (arr!13041 lt!203091) #b00000000000000000000000000000000)))))

(declare-fun b!442247 () Bool)

(declare-fun e!260302 () Bool)

(declare-fun e!260300 () Bool)

(assert (=> b!442247 (= e!260302 e!260300)))

(declare-fun c!55815 () Bool)

(assert (=> b!442247 (= c!55815 (validKeyInArray!0 (select (arr!13041 lt!203091) #b00000000000000000000000000000000)))))

(declare-fun bm!29544 () Bool)

(declare-fun call!29547 () Bool)

(assert (=> bm!29544 (= call!29547 (arrayNoDuplicates!0 lt!203091 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55815 (Cons!7828 (select (arr!13041 lt!203091) #b00000000000000000000000000000000) Nil!7829) Nil!7829)))))

(declare-fun b!442248 () Bool)

(assert (=> b!442248 (= e!260300 call!29547)))

(declare-fun b!442249 () Bool)

(assert (=> b!442249 (= e!260300 call!29547)))

(declare-fun d!74045 () Bool)

(declare-fun res!261936 () Bool)

(declare-fun e!260299 () Bool)

(assert (=> d!74045 (=> res!261936 e!260299)))

(assert (=> d!74045 (= res!261936 (bvsge #b00000000000000000000000000000000 (size!13393 lt!203091)))))

(assert (=> d!74045 (= (arrayNoDuplicates!0 lt!203091 #b00000000000000000000000000000000 Nil!7829) e!260299)))

(declare-fun b!442245 () Bool)

(assert (=> b!442245 (= e!260299 e!260302)))

(declare-fun res!261935 () Bool)

(assert (=> b!442245 (=> (not res!261935) (not e!260302))))

(assert (=> b!442245 (= res!261935 (not e!260301))))

(declare-fun res!261934 () Bool)

(assert (=> b!442245 (=> (not res!261934) (not e!260301))))

(assert (=> b!442245 (= res!261934 (validKeyInArray!0 (select (arr!13041 lt!203091) #b00000000000000000000000000000000)))))

(assert (= (and d!74045 (not res!261936)) b!442245))

(assert (= (and b!442245 res!261934) b!442246))

(assert (= (and b!442245 res!261935) b!442247))

(assert (= (and b!442247 c!55815) b!442249))

(assert (= (and b!442247 (not c!55815)) b!442248))

(assert (= (or b!442249 b!442248) bm!29544))

(assert (=> b!442246 m!428883))

(assert (=> b!442246 m!428883))

(declare-fun m!428913 () Bool)

(assert (=> b!442246 m!428913))

(assert (=> b!442247 m!428883))

(assert (=> b!442247 m!428883))

(assert (=> b!442247 m!428885))

(assert (=> bm!29544 m!428883))

(declare-fun m!428915 () Bool)

(assert (=> bm!29544 m!428915))

(assert (=> b!442245 m!428883))

(assert (=> b!442245 m!428883))

(assert (=> b!442245 m!428885))

(assert (=> b!442143 d!74045))

(declare-fun d!74047 () Bool)

(declare-fun e!260305 () Bool)

(assert (=> d!74047 e!260305))

(declare-fun res!261942 () Bool)

(assert (=> d!74047 (=> (not res!261942) (not e!260305))))

(declare-fun lt!203129 () ListLongMap!6747)

(declare-fun contains!2486 (ListLongMap!6747 (_ BitVec 64)) Bool)

(assert (=> d!74047 (= res!261942 (contains!2486 lt!203129 (_1!3928 (tuple2!7835 k0!794 v!412))))))

(declare-fun lt!203130 () List!7831)

(assert (=> d!74047 (= lt!203129 (ListLongMap!6748 lt!203130))))

(declare-fun lt!203132 () Unit!13150)

(declare-fun lt!203131 () Unit!13150)

(assert (=> d!74047 (= lt!203132 lt!203131)))

(declare-datatypes ((Option!373 0))(
  ( (Some!372 (v!8139 V!16685)) (None!371) )
))
(declare-fun getValueByKey!367 (List!7831 (_ BitVec 64)) Option!373)

(assert (=> d!74047 (= (getValueByKey!367 lt!203130 (_1!3928 (tuple2!7835 k0!794 v!412))) (Some!372 (_2!3928 (tuple2!7835 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!189 (List!7831 (_ BitVec 64) V!16685) Unit!13150)

(assert (=> d!74047 (= lt!203131 (lemmaContainsTupThenGetReturnValue!189 lt!203130 (_1!3928 (tuple2!7835 k0!794 v!412)) (_2!3928 (tuple2!7835 k0!794 v!412))))))

(declare-fun insertStrictlySorted!192 (List!7831 (_ BitVec 64) V!16685) List!7831)

(assert (=> d!74047 (= lt!203130 (insertStrictlySorted!192 (toList!3389 call!29527) (_1!3928 (tuple2!7835 k0!794 v!412)) (_2!3928 (tuple2!7835 k0!794 v!412))))))

(assert (=> d!74047 (= (+!1523 call!29527 (tuple2!7835 k0!794 v!412)) lt!203129)))

(declare-fun b!442254 () Bool)

(declare-fun res!261941 () Bool)

(assert (=> b!442254 (=> (not res!261941) (not e!260305))))

(assert (=> b!442254 (= res!261941 (= (getValueByKey!367 (toList!3389 lt!203129) (_1!3928 (tuple2!7835 k0!794 v!412))) (Some!372 (_2!3928 (tuple2!7835 k0!794 v!412)))))))

(declare-fun b!442255 () Bool)

(declare-fun contains!2487 (List!7831 tuple2!7834) Bool)

(assert (=> b!442255 (= e!260305 (contains!2487 (toList!3389 lt!203129) (tuple2!7835 k0!794 v!412)))))

(assert (= (and d!74047 res!261942) b!442254))

(assert (= (and b!442254 res!261941) b!442255))

(declare-fun m!428917 () Bool)

(assert (=> d!74047 m!428917))

(declare-fun m!428919 () Bool)

(assert (=> d!74047 m!428919))

(declare-fun m!428921 () Bool)

(assert (=> d!74047 m!428921))

(declare-fun m!428923 () Bool)

(assert (=> d!74047 m!428923))

(declare-fun m!428925 () Bool)

(assert (=> b!442254 m!428925))

(declare-fun m!428927 () Bool)

(assert (=> b!442255 m!428927))

(assert (=> b!442146 d!74047))

(declare-fun b!442256 () Bool)

(declare-fun e!260306 () Bool)

(declare-fun call!29548 () Bool)

(assert (=> b!442256 (= e!260306 call!29548)))

(declare-fun b!442257 () Bool)

(declare-fun e!260308 () Bool)

(assert (=> b!442257 (= e!260308 call!29548)))

(declare-fun b!442258 () Bool)

(declare-fun e!260307 () Bool)

(assert (=> b!442258 (= e!260307 e!260308)))

(declare-fun c!55816 () Bool)

(assert (=> b!442258 (= c!55816 (validKeyInArray!0 (select (arr!13041 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74049 () Bool)

(declare-fun res!261943 () Bool)

(assert (=> d!74049 (=> res!261943 e!260307)))

(assert (=> d!74049 (= res!261943 (bvsge #b00000000000000000000000000000000 (size!13393 _keys!709)))))

(assert (=> d!74049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!260307)))

(declare-fun b!442259 () Bool)

(assert (=> b!442259 (= e!260308 e!260306)))

(declare-fun lt!203135 () (_ BitVec 64))

(assert (=> b!442259 (= lt!203135 (select (arr!13041 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!203134 () Unit!13150)

(assert (=> b!442259 (= lt!203134 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203135 #b00000000000000000000000000000000))))

(assert (=> b!442259 (arrayContainsKey!0 _keys!709 lt!203135 #b00000000000000000000000000000000)))

(declare-fun lt!203133 () Unit!13150)

(assert (=> b!442259 (= lt!203133 lt!203134)))

(declare-fun res!261944 () Bool)

(assert (=> b!442259 (= res!261944 (= (seekEntryOrOpen!0 (select (arr!13041 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3527 #b00000000000000000000000000000000)))))

(assert (=> b!442259 (=> (not res!261944) (not e!260306))))

(declare-fun bm!29545 () Bool)

(assert (=> bm!29545 (= call!29548 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!74049 (not res!261943)) b!442258))

(assert (= (and b!442258 c!55816) b!442259))

(assert (= (and b!442258 (not c!55816)) b!442257))

(assert (= (and b!442259 res!261944) b!442256))

(assert (= (or b!442256 b!442257) bm!29545))

(assert (=> b!442258 m!428903))

(assert (=> b!442258 m!428903))

(assert (=> b!442258 m!428907))

(assert (=> b!442259 m!428903))

(declare-fun m!428929 () Bool)

(assert (=> b!442259 m!428929))

(declare-fun m!428931 () Bool)

(assert (=> b!442259 m!428931))

(assert (=> b!442259 m!428903))

(declare-fun m!428933 () Bool)

(assert (=> b!442259 m!428933))

(declare-fun m!428935 () Bool)

(assert (=> bm!29545 m!428935))

(assert (=> b!442137 d!74049))

(declare-fun b!442284 () Bool)

(assert (=> b!442284 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 lt!203091 _keys!709))))))

(assert (=> b!442284 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55802 lt!203090 _values!549))))))

(declare-fun e!260325 () Bool)

(declare-fun lt!203154 () ListLongMap!6747)

(declare-fun apply!309 (ListLongMap!6747 (_ BitVec 64)) V!16685)

(declare-fun get!6473 (ValueCell!5499 V!16685) V!16685)

(declare-fun dynLambda!848 (Int (_ BitVec 64)) V!16685)

(assert (=> b!442284 (= e!260325 (= (apply!309 lt!203154 (select (arr!13041 (ite c!55802 lt!203091 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6473 (select (arr!13040 (ite c!55802 lt!203090 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442285 () Bool)

(declare-fun e!260326 () Bool)

(declare-fun e!260327 () Bool)

(assert (=> b!442285 (= e!260326 e!260327)))

(declare-fun c!55826 () Bool)

(assert (=> b!442285 (= c!55826 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 lt!203091 _keys!709))))))

(declare-fun b!442286 () Bool)

(declare-fun lt!203155 () Unit!13150)

(declare-fun lt!203153 () Unit!13150)

(assert (=> b!442286 (= lt!203155 lt!203153)))

(declare-fun lt!203151 () (_ BitVec 64))

(declare-fun lt!203156 () V!16685)

(declare-fun lt!203150 () (_ BitVec 64))

(declare-fun lt!203152 () ListLongMap!6747)

(assert (=> b!442286 (not (contains!2486 (+!1523 lt!203152 (tuple2!7835 lt!203150 lt!203156)) lt!203151))))

(declare-fun addStillNotContains!142 (ListLongMap!6747 (_ BitVec 64) V!16685 (_ BitVec 64)) Unit!13150)

(assert (=> b!442286 (= lt!203153 (addStillNotContains!142 lt!203152 lt!203150 lt!203156 lt!203151))))

(assert (=> b!442286 (= lt!203151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442286 (= lt!203156 (get!6473 (select (arr!13040 (ite c!55802 lt!203090 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442286 (= lt!203150 (select (arr!13041 (ite c!55802 lt!203091 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!29551 () ListLongMap!6747)

(assert (=> b!442286 (= lt!203152 call!29551)))

(declare-fun e!260329 () ListLongMap!6747)

(assert (=> b!442286 (= e!260329 (+!1523 call!29551 (tuple2!7835 (select (arr!13041 (ite c!55802 lt!203091 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6473 (select (arr!13040 (ite c!55802 lt!203090 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442287 () Bool)

(declare-fun e!260324 () ListLongMap!6747)

(assert (=> b!442287 (= e!260324 e!260329)))

(declare-fun c!55828 () Bool)

(assert (=> b!442287 (= c!55828 (validKeyInArray!0 (select (arr!13041 (ite c!55802 lt!203091 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!442288 () Bool)

(declare-fun isEmpty!555 (ListLongMap!6747) Bool)

(assert (=> b!442288 (= e!260327 (isEmpty!555 lt!203154))))

(declare-fun d!74051 () Bool)

(declare-fun e!260323 () Bool)

(assert (=> d!74051 e!260323))

(declare-fun res!261953 () Bool)

(assert (=> d!74051 (=> (not res!261953) (not e!260323))))

(assert (=> d!74051 (= res!261953 (not (contains!2486 lt!203154 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74051 (= lt!203154 e!260324)))

(declare-fun c!55825 () Bool)

(assert (=> d!74051 (= c!55825 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 lt!203091 _keys!709))))))

(assert (=> d!74051 (validMask!0 mask!1025)))

(assert (=> d!74051 (= (getCurrentListMapNoExtraKeys!1578 (ite c!55802 lt!203091 _keys!709) (ite c!55802 lt!203090 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203154)))

(declare-fun b!442289 () Bool)

(assert (=> b!442289 (= e!260323 e!260326)))

(declare-fun c!55827 () Bool)

(declare-fun e!260328 () Bool)

(assert (=> b!442289 (= c!55827 e!260328)))

(declare-fun res!261956 () Bool)

(assert (=> b!442289 (=> (not res!261956) (not e!260328))))

(assert (=> b!442289 (= res!261956 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 lt!203091 _keys!709))))))

(declare-fun b!442290 () Bool)

(declare-fun res!261954 () Bool)

(assert (=> b!442290 (=> (not res!261954) (not e!260323))))

(assert (=> b!442290 (= res!261954 (not (contains!2486 lt!203154 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442291 () Bool)

(assert (=> b!442291 (= e!260329 call!29551)))

(declare-fun b!442292 () Bool)

(assert (=> b!442292 (= e!260328 (validKeyInArray!0 (select (arr!13041 (ite c!55802 lt!203091 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442292 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!442293 () Bool)

(assert (=> b!442293 (= e!260324 (ListLongMap!6748 Nil!7828))))

(declare-fun bm!29548 () Bool)

(assert (=> bm!29548 (= call!29551 (getCurrentListMapNoExtraKeys!1578 (ite c!55802 lt!203091 _keys!709) (ite c!55802 lt!203090 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!442294 () Bool)

(assert (=> b!442294 (= e!260327 (= lt!203154 (getCurrentListMapNoExtraKeys!1578 (ite c!55802 lt!203091 _keys!709) (ite c!55802 lt!203090 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442295 () Bool)

(assert (=> b!442295 (= e!260326 e!260325)))

(assert (=> b!442295 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 lt!203091 _keys!709))))))

(declare-fun res!261955 () Bool)

(assert (=> b!442295 (= res!261955 (contains!2486 lt!203154 (select (arr!13041 (ite c!55802 lt!203091 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442295 (=> (not res!261955) (not e!260325))))

(assert (= (and d!74051 c!55825) b!442293))

(assert (= (and d!74051 (not c!55825)) b!442287))

(assert (= (and b!442287 c!55828) b!442286))

(assert (= (and b!442287 (not c!55828)) b!442291))

(assert (= (or b!442286 b!442291) bm!29548))

(assert (= (and d!74051 res!261953) b!442290))

(assert (= (and b!442290 res!261954) b!442289))

(assert (= (and b!442289 res!261956) b!442292))

(assert (= (and b!442289 c!55827) b!442295))

(assert (= (and b!442289 (not c!55827)) b!442285))

(assert (= (and b!442295 res!261955) b!442284))

(assert (= (and b!442285 c!55826) b!442294))

(assert (= (and b!442285 (not c!55826)) b!442288))

(declare-fun b_lambda!9397 () Bool)

(assert (=> (not b_lambda!9397) (not b!442284)))

(declare-fun t!13592 () Bool)

(declare-fun tb!3715 () Bool)

(assert (=> (and start!40266 (= defaultEntry!557 defaultEntry!557) t!13592) tb!3715))

(declare-fun result!6957 () Bool)

(assert (=> tb!3715 (= result!6957 tp_is_empty!11685)))

(assert (=> b!442284 t!13592))

(declare-fun b_and!18499 () Bool)

(assert (= b_and!18495 (and (=> t!13592 result!6957) b_and!18499)))

(declare-fun b_lambda!9399 () Bool)

(assert (=> (not b_lambda!9399) (not b!442286)))

(assert (=> b!442286 t!13592))

(declare-fun b_and!18501 () Bool)

(assert (= b_and!18499 (and (=> t!13592 result!6957) b_and!18501)))

(declare-fun m!428937 () Bool)

(assert (=> b!442287 m!428937))

(assert (=> b!442287 m!428937))

(declare-fun m!428939 () Bool)

(assert (=> b!442287 m!428939))

(assert (=> b!442292 m!428937))

(assert (=> b!442292 m!428937))

(assert (=> b!442292 m!428939))

(declare-fun m!428941 () Bool)

(assert (=> bm!29548 m!428941))

(declare-fun m!428943 () Bool)

(assert (=> b!442286 m!428943))

(declare-fun m!428945 () Bool)

(assert (=> b!442286 m!428945))

(assert (=> b!442286 m!428943))

(declare-fun m!428947 () Bool)

(assert (=> b!442286 m!428947))

(declare-fun m!428949 () Bool)

(assert (=> b!442286 m!428949))

(declare-fun m!428951 () Bool)

(assert (=> b!442286 m!428951))

(assert (=> b!442286 m!428949))

(declare-fun m!428953 () Bool)

(assert (=> b!442286 m!428953))

(declare-fun m!428955 () Bool)

(assert (=> b!442286 m!428955))

(assert (=> b!442286 m!428937))

(assert (=> b!442286 m!428953))

(assert (=> b!442295 m!428937))

(assert (=> b!442295 m!428937))

(declare-fun m!428957 () Bool)

(assert (=> b!442295 m!428957))

(declare-fun m!428959 () Bool)

(assert (=> d!74051 m!428959))

(assert (=> d!74051 m!428831))

(assert (=> b!442294 m!428941))

(declare-fun m!428961 () Bool)

(assert (=> b!442288 m!428961))

(assert (=> b!442284 m!428949))

(assert (=> b!442284 m!428949))

(assert (=> b!442284 m!428953))

(assert (=> b!442284 m!428955))

(assert (=> b!442284 m!428937))

(assert (=> b!442284 m!428953))

(assert (=> b!442284 m!428937))

(declare-fun m!428963 () Bool)

(assert (=> b!442284 m!428963))

(declare-fun m!428965 () Bool)

(assert (=> b!442290 m!428965))

(assert (=> bm!29524 d!74051))

(declare-fun b!442298 () Bool)

(assert (=> b!442298 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13393 lt!203091)))))

(assert (=> b!442298 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 lt!203090)))))

(declare-fun lt!203161 () ListLongMap!6747)

(declare-fun e!260332 () Bool)

(assert (=> b!442298 (= e!260332 (= (apply!309 lt!203161 (select (arr!13041 lt!203091) from!863)) (get!6473 (select (arr!13040 lt!203090) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442299 () Bool)

(declare-fun e!260333 () Bool)

(declare-fun e!260334 () Bool)

(assert (=> b!442299 (= e!260333 e!260334)))

(declare-fun c!55830 () Bool)

(assert (=> b!442299 (= c!55830 (bvslt from!863 (size!13393 lt!203091)))))

(declare-fun b!442300 () Bool)

(declare-fun lt!203162 () Unit!13150)

(declare-fun lt!203160 () Unit!13150)

(assert (=> b!442300 (= lt!203162 lt!203160)))

(declare-fun lt!203159 () ListLongMap!6747)

(declare-fun lt!203163 () V!16685)

(declare-fun lt!203158 () (_ BitVec 64))

(declare-fun lt!203157 () (_ BitVec 64))

(assert (=> b!442300 (not (contains!2486 (+!1523 lt!203159 (tuple2!7835 lt!203157 lt!203163)) lt!203158))))

(assert (=> b!442300 (= lt!203160 (addStillNotContains!142 lt!203159 lt!203157 lt!203163 lt!203158))))

(assert (=> b!442300 (= lt!203158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442300 (= lt!203163 (get!6473 (select (arr!13040 lt!203090) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442300 (= lt!203157 (select (arr!13041 lt!203091) from!863))))

(declare-fun call!29552 () ListLongMap!6747)

(assert (=> b!442300 (= lt!203159 call!29552)))

(declare-fun e!260336 () ListLongMap!6747)

(assert (=> b!442300 (= e!260336 (+!1523 call!29552 (tuple2!7835 (select (arr!13041 lt!203091) from!863) (get!6473 (select (arr!13040 lt!203090) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442301 () Bool)

(declare-fun e!260331 () ListLongMap!6747)

(assert (=> b!442301 (= e!260331 e!260336)))

(declare-fun c!55832 () Bool)

(assert (=> b!442301 (= c!55832 (validKeyInArray!0 (select (arr!13041 lt!203091) from!863)))))

(declare-fun b!442302 () Bool)

(assert (=> b!442302 (= e!260334 (isEmpty!555 lt!203161))))

(declare-fun d!74053 () Bool)

(declare-fun e!260330 () Bool)

(assert (=> d!74053 e!260330))

(declare-fun res!261957 () Bool)

(assert (=> d!74053 (=> (not res!261957) (not e!260330))))

(assert (=> d!74053 (= res!261957 (not (contains!2486 lt!203161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74053 (= lt!203161 e!260331)))

(declare-fun c!55829 () Bool)

(assert (=> d!74053 (= c!55829 (bvsge from!863 (size!13393 lt!203091)))))

(assert (=> d!74053 (validMask!0 mask!1025)))

(assert (=> d!74053 (= (getCurrentListMapNoExtraKeys!1578 lt!203091 lt!203090 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203161)))

(declare-fun b!442303 () Bool)

(assert (=> b!442303 (= e!260330 e!260333)))

(declare-fun c!55831 () Bool)

(declare-fun e!260335 () Bool)

(assert (=> b!442303 (= c!55831 e!260335)))

(declare-fun res!261960 () Bool)

(assert (=> b!442303 (=> (not res!261960) (not e!260335))))

(assert (=> b!442303 (= res!261960 (bvslt from!863 (size!13393 lt!203091)))))

(declare-fun b!442304 () Bool)

(declare-fun res!261958 () Bool)

(assert (=> b!442304 (=> (not res!261958) (not e!260330))))

(assert (=> b!442304 (= res!261958 (not (contains!2486 lt!203161 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442305 () Bool)

(assert (=> b!442305 (= e!260336 call!29552)))

(declare-fun b!442306 () Bool)

(assert (=> b!442306 (= e!260335 (validKeyInArray!0 (select (arr!13041 lt!203091) from!863)))))

(assert (=> b!442306 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!442307 () Bool)

(assert (=> b!442307 (= e!260331 (ListLongMap!6748 Nil!7828))))

(declare-fun bm!29549 () Bool)

(assert (=> bm!29549 (= call!29552 (getCurrentListMapNoExtraKeys!1578 lt!203091 lt!203090 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!442308 () Bool)

(assert (=> b!442308 (= e!260334 (= lt!203161 (getCurrentListMapNoExtraKeys!1578 lt!203091 lt!203090 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442309 () Bool)

(assert (=> b!442309 (= e!260333 e!260332)))

(assert (=> b!442309 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13393 lt!203091)))))

(declare-fun res!261959 () Bool)

(assert (=> b!442309 (= res!261959 (contains!2486 lt!203161 (select (arr!13041 lt!203091) from!863)))))

(assert (=> b!442309 (=> (not res!261959) (not e!260332))))

(assert (= (and d!74053 c!55829) b!442307))

(assert (= (and d!74053 (not c!55829)) b!442301))

(assert (= (and b!442301 c!55832) b!442300))

(assert (= (and b!442301 (not c!55832)) b!442305))

(assert (= (or b!442300 b!442305) bm!29549))

(assert (= (and d!74053 res!261957) b!442304))

(assert (= (and b!442304 res!261958) b!442303))

(assert (= (and b!442303 res!261960) b!442306))

(assert (= (and b!442303 c!55831) b!442309))

(assert (= (and b!442303 (not c!55831)) b!442299))

(assert (= (and b!442309 res!261959) b!442298))

(assert (= (and b!442299 c!55830) b!442308))

(assert (= (and b!442299 (not c!55830)) b!442302))

(declare-fun b_lambda!9401 () Bool)

(assert (=> (not b_lambda!9401) (not b!442298)))

(assert (=> b!442298 t!13592))

(declare-fun b_and!18503 () Bool)

(assert (= b_and!18501 (and (=> t!13592 result!6957) b_and!18503)))

(declare-fun b_lambda!9403 () Bool)

(assert (=> (not b_lambda!9403) (not b!442300)))

(assert (=> b!442300 t!13592))

(declare-fun b_and!18505 () Bool)

(assert (= b_and!18503 (and (=> t!13592 result!6957) b_and!18505)))

(declare-fun m!428967 () Bool)

(assert (=> b!442301 m!428967))

(assert (=> b!442301 m!428967))

(declare-fun m!428969 () Bool)

(assert (=> b!442301 m!428969))

(assert (=> b!442306 m!428967))

(assert (=> b!442306 m!428967))

(assert (=> b!442306 m!428969))

(declare-fun m!428971 () Bool)

(assert (=> bm!29549 m!428971))

(declare-fun m!428973 () Bool)

(assert (=> b!442300 m!428973))

(declare-fun m!428975 () Bool)

(assert (=> b!442300 m!428975))

(assert (=> b!442300 m!428973))

(declare-fun m!428977 () Bool)

(assert (=> b!442300 m!428977))

(declare-fun m!428979 () Bool)

(assert (=> b!442300 m!428979))

(declare-fun m!428981 () Bool)

(assert (=> b!442300 m!428981))

(assert (=> b!442300 m!428979))

(assert (=> b!442300 m!428953))

(declare-fun m!428983 () Bool)

(assert (=> b!442300 m!428983))

(assert (=> b!442300 m!428967))

(assert (=> b!442300 m!428953))

(assert (=> b!442309 m!428967))

(assert (=> b!442309 m!428967))

(declare-fun m!428985 () Bool)

(assert (=> b!442309 m!428985))

(declare-fun m!428987 () Bool)

(assert (=> d!74053 m!428987))

(assert (=> d!74053 m!428831))

(assert (=> b!442308 m!428971))

(declare-fun m!428989 () Bool)

(assert (=> b!442302 m!428989))

(assert (=> b!442298 m!428979))

(assert (=> b!442298 m!428979))

(assert (=> b!442298 m!428953))

(assert (=> b!442298 m!428983))

(assert (=> b!442298 m!428967))

(assert (=> b!442298 m!428953))

(assert (=> b!442298 m!428967))

(declare-fun m!428991 () Bool)

(assert (=> b!442298 m!428991))

(declare-fun m!428993 () Bool)

(assert (=> b!442304 m!428993))

(assert (=> b!442145 d!74053))

(declare-fun b!442310 () Bool)

(assert (=> b!442310 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13393 _keys!709)))))

(assert (=> b!442310 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 _values!549)))))

(declare-fun e!260339 () Bool)

(declare-fun lt!203168 () ListLongMap!6747)

(assert (=> b!442310 (= e!260339 (= (apply!309 lt!203168 (select (arr!13041 _keys!709) from!863)) (get!6473 (select (arr!13040 _values!549) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442311 () Bool)

(declare-fun e!260340 () Bool)

(declare-fun e!260341 () Bool)

(assert (=> b!442311 (= e!260340 e!260341)))

(declare-fun c!55834 () Bool)

(assert (=> b!442311 (= c!55834 (bvslt from!863 (size!13393 _keys!709)))))

(declare-fun b!442312 () Bool)

(declare-fun lt!203169 () Unit!13150)

(declare-fun lt!203167 () Unit!13150)

(assert (=> b!442312 (= lt!203169 lt!203167)))

(declare-fun lt!203170 () V!16685)

(declare-fun lt!203166 () ListLongMap!6747)

(declare-fun lt!203165 () (_ BitVec 64))

(declare-fun lt!203164 () (_ BitVec 64))

(assert (=> b!442312 (not (contains!2486 (+!1523 lt!203166 (tuple2!7835 lt!203164 lt!203170)) lt!203165))))

(assert (=> b!442312 (= lt!203167 (addStillNotContains!142 lt!203166 lt!203164 lt!203170 lt!203165))))

(assert (=> b!442312 (= lt!203165 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442312 (= lt!203170 (get!6473 (select (arr!13040 _values!549) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442312 (= lt!203164 (select (arr!13041 _keys!709) from!863))))

(declare-fun call!29553 () ListLongMap!6747)

(assert (=> b!442312 (= lt!203166 call!29553)))

(declare-fun e!260343 () ListLongMap!6747)

(assert (=> b!442312 (= e!260343 (+!1523 call!29553 (tuple2!7835 (select (arr!13041 _keys!709) from!863) (get!6473 (select (arr!13040 _values!549) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442313 () Bool)

(declare-fun e!260338 () ListLongMap!6747)

(assert (=> b!442313 (= e!260338 e!260343)))

(declare-fun c!55836 () Bool)

(assert (=> b!442313 (= c!55836 (validKeyInArray!0 (select (arr!13041 _keys!709) from!863)))))

(declare-fun b!442314 () Bool)

(assert (=> b!442314 (= e!260341 (isEmpty!555 lt!203168))))

(declare-fun d!74055 () Bool)

(declare-fun e!260337 () Bool)

(assert (=> d!74055 e!260337))

(declare-fun res!261961 () Bool)

(assert (=> d!74055 (=> (not res!261961) (not e!260337))))

(assert (=> d!74055 (= res!261961 (not (contains!2486 lt!203168 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74055 (= lt!203168 e!260338)))

(declare-fun c!55833 () Bool)

(assert (=> d!74055 (= c!55833 (bvsge from!863 (size!13393 _keys!709)))))

(assert (=> d!74055 (validMask!0 mask!1025)))

(assert (=> d!74055 (= (getCurrentListMapNoExtraKeys!1578 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203168)))

(declare-fun b!442315 () Bool)

(assert (=> b!442315 (= e!260337 e!260340)))

(declare-fun c!55835 () Bool)

(declare-fun e!260342 () Bool)

(assert (=> b!442315 (= c!55835 e!260342)))

(declare-fun res!261964 () Bool)

(assert (=> b!442315 (=> (not res!261964) (not e!260342))))

(assert (=> b!442315 (= res!261964 (bvslt from!863 (size!13393 _keys!709)))))

(declare-fun b!442316 () Bool)

(declare-fun res!261962 () Bool)

(assert (=> b!442316 (=> (not res!261962) (not e!260337))))

(assert (=> b!442316 (= res!261962 (not (contains!2486 lt!203168 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442317 () Bool)

(assert (=> b!442317 (= e!260343 call!29553)))

(declare-fun b!442318 () Bool)

(assert (=> b!442318 (= e!260342 (validKeyInArray!0 (select (arr!13041 _keys!709) from!863)))))

(assert (=> b!442318 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!442319 () Bool)

(assert (=> b!442319 (= e!260338 (ListLongMap!6748 Nil!7828))))

(declare-fun bm!29550 () Bool)

(assert (=> bm!29550 (= call!29553 (getCurrentListMapNoExtraKeys!1578 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!442320 () Bool)

(assert (=> b!442320 (= e!260341 (= lt!203168 (getCurrentListMapNoExtraKeys!1578 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442321 () Bool)

(assert (=> b!442321 (= e!260340 e!260339)))

(assert (=> b!442321 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13393 _keys!709)))))

(declare-fun res!261963 () Bool)

(assert (=> b!442321 (= res!261963 (contains!2486 lt!203168 (select (arr!13041 _keys!709) from!863)))))

(assert (=> b!442321 (=> (not res!261963) (not e!260339))))

(assert (= (and d!74055 c!55833) b!442319))

(assert (= (and d!74055 (not c!55833)) b!442313))

(assert (= (and b!442313 c!55836) b!442312))

(assert (= (and b!442313 (not c!55836)) b!442317))

(assert (= (or b!442312 b!442317) bm!29550))

(assert (= (and d!74055 res!261961) b!442316))

(assert (= (and b!442316 res!261962) b!442315))

(assert (= (and b!442315 res!261964) b!442318))

(assert (= (and b!442315 c!55835) b!442321))

(assert (= (and b!442315 (not c!55835)) b!442311))

(assert (= (and b!442321 res!261963) b!442310))

(assert (= (and b!442311 c!55834) b!442320))

(assert (= (and b!442311 (not c!55834)) b!442314))

(declare-fun b_lambda!9405 () Bool)

(assert (=> (not b_lambda!9405) (not b!442310)))

(assert (=> b!442310 t!13592))

(declare-fun b_and!18507 () Bool)

(assert (= b_and!18505 (and (=> t!13592 result!6957) b_and!18507)))

(declare-fun b_lambda!9407 () Bool)

(assert (=> (not b_lambda!9407) (not b!442312)))

(assert (=> b!442312 t!13592))

(declare-fun b_and!18509 () Bool)

(assert (= b_and!18507 (and (=> t!13592 result!6957) b_and!18509)))

(assert (=> b!442313 m!428817))

(assert (=> b!442313 m!428817))

(assert (=> b!442313 m!428819))

(assert (=> b!442318 m!428817))

(assert (=> b!442318 m!428817))

(assert (=> b!442318 m!428819))

(declare-fun m!428995 () Bool)

(assert (=> bm!29550 m!428995))

(declare-fun m!428997 () Bool)

(assert (=> b!442312 m!428997))

(declare-fun m!428999 () Bool)

(assert (=> b!442312 m!428999))

(assert (=> b!442312 m!428997))

(declare-fun m!429001 () Bool)

(assert (=> b!442312 m!429001))

(declare-fun m!429003 () Bool)

(assert (=> b!442312 m!429003))

(declare-fun m!429005 () Bool)

(assert (=> b!442312 m!429005))

(assert (=> b!442312 m!429003))

(assert (=> b!442312 m!428953))

(declare-fun m!429007 () Bool)

(assert (=> b!442312 m!429007))

(assert (=> b!442312 m!428817))

(assert (=> b!442312 m!428953))

(assert (=> b!442321 m!428817))

(assert (=> b!442321 m!428817))

(declare-fun m!429009 () Bool)

(assert (=> b!442321 m!429009))

(declare-fun m!429011 () Bool)

(assert (=> d!74055 m!429011))

(assert (=> d!74055 m!428831))

(assert (=> b!442320 m!428995))

(declare-fun m!429013 () Bool)

(assert (=> b!442314 m!429013))

(assert (=> b!442310 m!429003))

(assert (=> b!442310 m!429003))

(assert (=> b!442310 m!428953))

(assert (=> b!442310 m!429007))

(assert (=> b!442310 m!428817))

(assert (=> b!442310 m!428953))

(assert (=> b!442310 m!428817))

(declare-fun m!429015 () Bool)

(assert (=> b!442310 m!429015))

(declare-fun m!429017 () Bool)

(assert (=> b!442316 m!429017))

(assert (=> b!442145 d!74055))

(declare-fun d!74057 () Bool)

(assert (=> d!74057 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!442148 d!74057))

(declare-fun b!442322 () Bool)

(assert (=> b!442322 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 _keys!709 lt!203091))))))

(assert (=> b!442322 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55802 _values!549 lt!203090))))))

(declare-fun lt!203175 () ListLongMap!6747)

(declare-fun e!260346 () Bool)

(assert (=> b!442322 (= e!260346 (= (apply!309 lt!203175 (select (arr!13041 (ite c!55802 _keys!709 lt!203091)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6473 (select (arr!13040 (ite c!55802 _values!549 lt!203090)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442323 () Bool)

(declare-fun e!260347 () Bool)

(declare-fun e!260348 () Bool)

(assert (=> b!442323 (= e!260347 e!260348)))

(declare-fun c!55838 () Bool)

(assert (=> b!442323 (= c!55838 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 _keys!709 lt!203091))))))

(declare-fun b!442324 () Bool)

(declare-fun lt!203176 () Unit!13150)

(declare-fun lt!203174 () Unit!13150)

(assert (=> b!442324 (= lt!203176 lt!203174)))

(declare-fun lt!203171 () (_ BitVec 64))

(declare-fun lt!203173 () ListLongMap!6747)

(declare-fun lt!203177 () V!16685)

(declare-fun lt!203172 () (_ BitVec 64))

(assert (=> b!442324 (not (contains!2486 (+!1523 lt!203173 (tuple2!7835 lt!203171 lt!203177)) lt!203172))))

(assert (=> b!442324 (= lt!203174 (addStillNotContains!142 lt!203173 lt!203171 lt!203177 lt!203172))))

(assert (=> b!442324 (= lt!203172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442324 (= lt!203177 (get!6473 (select (arr!13040 (ite c!55802 _values!549 lt!203090)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442324 (= lt!203171 (select (arr!13041 (ite c!55802 _keys!709 lt!203091)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!29554 () ListLongMap!6747)

(assert (=> b!442324 (= lt!203173 call!29554)))

(declare-fun e!260350 () ListLongMap!6747)

(assert (=> b!442324 (= e!260350 (+!1523 call!29554 (tuple2!7835 (select (arr!13041 (ite c!55802 _keys!709 lt!203091)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6473 (select (arr!13040 (ite c!55802 _values!549 lt!203090)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442325 () Bool)

(declare-fun e!260345 () ListLongMap!6747)

(assert (=> b!442325 (= e!260345 e!260350)))

(declare-fun c!55840 () Bool)

(assert (=> b!442325 (= c!55840 (validKeyInArray!0 (select (arr!13041 (ite c!55802 _keys!709 lt!203091)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!442326 () Bool)

(assert (=> b!442326 (= e!260348 (isEmpty!555 lt!203175))))

(declare-fun d!74059 () Bool)

(declare-fun e!260344 () Bool)

(assert (=> d!74059 e!260344))

(declare-fun res!261965 () Bool)

(assert (=> d!74059 (=> (not res!261965) (not e!260344))))

(assert (=> d!74059 (= res!261965 (not (contains!2486 lt!203175 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74059 (= lt!203175 e!260345)))

(declare-fun c!55837 () Bool)

(assert (=> d!74059 (= c!55837 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 _keys!709 lt!203091))))))

(assert (=> d!74059 (validMask!0 mask!1025)))

(assert (=> d!74059 (= (getCurrentListMapNoExtraKeys!1578 (ite c!55802 _keys!709 lt!203091) (ite c!55802 _values!549 lt!203090) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203175)))

(declare-fun b!442327 () Bool)

(assert (=> b!442327 (= e!260344 e!260347)))

(declare-fun c!55839 () Bool)

(declare-fun e!260349 () Bool)

(assert (=> b!442327 (= c!55839 e!260349)))

(declare-fun res!261968 () Bool)

(assert (=> b!442327 (=> (not res!261968) (not e!260349))))

(assert (=> b!442327 (= res!261968 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 _keys!709 lt!203091))))))

(declare-fun b!442328 () Bool)

(declare-fun res!261966 () Bool)

(assert (=> b!442328 (=> (not res!261966) (not e!260344))))

(assert (=> b!442328 (= res!261966 (not (contains!2486 lt!203175 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442329 () Bool)

(assert (=> b!442329 (= e!260350 call!29554)))

(declare-fun b!442330 () Bool)

(assert (=> b!442330 (= e!260349 (validKeyInArray!0 (select (arr!13041 (ite c!55802 _keys!709 lt!203091)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442330 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!442331 () Bool)

(assert (=> b!442331 (= e!260345 (ListLongMap!6748 Nil!7828))))

(declare-fun bm!29551 () Bool)

(assert (=> bm!29551 (= call!29554 (getCurrentListMapNoExtraKeys!1578 (ite c!55802 _keys!709 lt!203091) (ite c!55802 _values!549 lt!203090) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!442332 () Bool)

(assert (=> b!442332 (= e!260348 (= lt!203175 (getCurrentListMapNoExtraKeys!1578 (ite c!55802 _keys!709 lt!203091) (ite c!55802 _values!549 lt!203090) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442333 () Bool)

(assert (=> b!442333 (= e!260347 e!260346)))

(assert (=> b!442333 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55802 _keys!709 lt!203091))))))

(declare-fun res!261967 () Bool)

(assert (=> b!442333 (= res!261967 (contains!2486 lt!203175 (select (arr!13041 (ite c!55802 _keys!709 lt!203091)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442333 (=> (not res!261967) (not e!260346))))

(assert (= (and d!74059 c!55837) b!442331))

(assert (= (and d!74059 (not c!55837)) b!442325))

(assert (= (and b!442325 c!55840) b!442324))

(assert (= (and b!442325 (not c!55840)) b!442329))

(assert (= (or b!442324 b!442329) bm!29551))

(assert (= (and d!74059 res!261965) b!442328))

(assert (= (and b!442328 res!261966) b!442327))

(assert (= (and b!442327 res!261968) b!442330))

(assert (= (and b!442327 c!55839) b!442333))

(assert (= (and b!442327 (not c!55839)) b!442323))

(assert (= (and b!442333 res!261967) b!442322))

(assert (= (and b!442323 c!55838) b!442332))

(assert (= (and b!442323 (not c!55838)) b!442326))

(declare-fun b_lambda!9409 () Bool)

(assert (=> (not b_lambda!9409) (not b!442322)))

(assert (=> b!442322 t!13592))

(declare-fun b_and!18511 () Bool)

(assert (= b_and!18509 (and (=> t!13592 result!6957) b_and!18511)))

(declare-fun b_lambda!9411 () Bool)

(assert (=> (not b_lambda!9411) (not b!442324)))

(assert (=> b!442324 t!13592))

(declare-fun b_and!18513 () Bool)

(assert (= b_and!18511 (and (=> t!13592 result!6957) b_and!18513)))

(declare-fun m!429019 () Bool)

(assert (=> b!442325 m!429019))

(assert (=> b!442325 m!429019))

(declare-fun m!429021 () Bool)

(assert (=> b!442325 m!429021))

(assert (=> b!442330 m!429019))

(assert (=> b!442330 m!429019))

(assert (=> b!442330 m!429021))

(declare-fun m!429023 () Bool)

(assert (=> bm!29551 m!429023))

(declare-fun m!429025 () Bool)

(assert (=> b!442324 m!429025))

(declare-fun m!429027 () Bool)

(assert (=> b!442324 m!429027))

(assert (=> b!442324 m!429025))

(declare-fun m!429029 () Bool)

(assert (=> b!442324 m!429029))

(declare-fun m!429031 () Bool)

(assert (=> b!442324 m!429031))

(declare-fun m!429033 () Bool)

(assert (=> b!442324 m!429033))

(assert (=> b!442324 m!429031))

(assert (=> b!442324 m!428953))

(declare-fun m!429035 () Bool)

(assert (=> b!442324 m!429035))

(assert (=> b!442324 m!429019))

(assert (=> b!442324 m!428953))

(assert (=> b!442333 m!429019))

(assert (=> b!442333 m!429019))

(declare-fun m!429037 () Bool)

(assert (=> b!442333 m!429037))

(declare-fun m!429039 () Bool)

(assert (=> d!74059 m!429039))

(assert (=> d!74059 m!428831))

(assert (=> b!442332 m!429023))

(declare-fun m!429041 () Bool)

(assert (=> b!442326 m!429041))

(assert (=> b!442322 m!429031))

(assert (=> b!442322 m!429031))

(assert (=> b!442322 m!428953))

(assert (=> b!442322 m!429035))

(assert (=> b!442322 m!429019))

(assert (=> b!442322 m!428953))

(assert (=> b!442322 m!429019))

(declare-fun m!429043 () Bool)

(assert (=> b!442322 m!429043))

(declare-fun m!429045 () Bool)

(assert (=> b!442328 m!429045))

(assert (=> bm!29525 d!74059))

(declare-fun b!442341 () Bool)

(declare-fun e!260355 () Bool)

(assert (=> b!442341 (= e!260355 tp_is_empty!11685)))

(declare-fun b!442340 () Bool)

(declare-fun e!260356 () Bool)

(assert (=> b!442340 (= e!260356 tp_is_empty!11685)))

(declare-fun mapIsEmpty!19155 () Bool)

(declare-fun mapRes!19155 () Bool)

(assert (=> mapIsEmpty!19155 mapRes!19155))

(declare-fun condMapEmpty!19155 () Bool)

(declare-fun mapDefault!19155 () ValueCell!5499)

(assert (=> mapNonEmpty!19149 (= condMapEmpty!19155 (= mapRest!19149 ((as const (Array (_ BitVec 32) ValueCell!5499)) mapDefault!19155)))))

(assert (=> mapNonEmpty!19149 (= tp!37118 (and e!260355 mapRes!19155))))

(declare-fun mapNonEmpty!19155 () Bool)

(declare-fun tp!37128 () Bool)

(assert (=> mapNonEmpty!19155 (= mapRes!19155 (and tp!37128 e!260356))))

(declare-fun mapRest!19155 () (Array (_ BitVec 32) ValueCell!5499))

(declare-fun mapKey!19155 () (_ BitVec 32))

(declare-fun mapValue!19155 () ValueCell!5499)

(assert (=> mapNonEmpty!19155 (= mapRest!19149 (store mapRest!19155 mapKey!19155 mapValue!19155))))

(assert (= (and mapNonEmpty!19149 condMapEmpty!19155) mapIsEmpty!19155))

(assert (= (and mapNonEmpty!19149 (not condMapEmpty!19155)) mapNonEmpty!19155))

(assert (= (and mapNonEmpty!19155 ((_ is ValueCellFull!5499) mapValue!19155)) b!442340))

(assert (= (and mapNonEmpty!19149 ((_ is ValueCellFull!5499) mapDefault!19155)) b!442341))

(declare-fun m!429047 () Bool)

(assert (=> mapNonEmpty!19155 m!429047))

(declare-fun b_lambda!9413 () Bool)

(assert (= b_lambda!9401 (or (and start!40266 b_free!10527) b_lambda!9413)))

(declare-fun b_lambda!9415 () Bool)

(assert (= b_lambda!9403 (or (and start!40266 b_free!10527) b_lambda!9415)))

(declare-fun b_lambda!9417 () Bool)

(assert (= b_lambda!9397 (or (and start!40266 b_free!10527) b_lambda!9417)))

(declare-fun b_lambda!9419 () Bool)

(assert (= b_lambda!9409 (or (and start!40266 b_free!10527) b_lambda!9419)))

(declare-fun b_lambda!9421 () Bool)

(assert (= b_lambda!9405 (or (and start!40266 b_free!10527) b_lambda!9421)))

(declare-fun b_lambda!9423 () Bool)

(assert (= b_lambda!9411 (or (and start!40266 b_free!10527) b_lambda!9423)))

(declare-fun b_lambda!9425 () Bool)

(assert (= b_lambda!9407 (or (and start!40266 b_free!10527) b_lambda!9425)))

(declare-fun b_lambda!9427 () Bool)

(assert (= b_lambda!9399 (or (and start!40266 b_free!10527) b_lambda!9427)))

(check-sat (not b_next!10527) (not b!442245) (not b!442298) (not b!442284) (not b!442236) (not bm!29550) (not b!442213) (not b_lambda!9413) (not b!442321) (not b!442333) (not bm!29548) (not b!442306) (not b!442304) (not b!442301) (not b_lambda!9425) (not b!442308) (not bm!29540) (not b!442247) (not b!442310) (not b!442302) (not b!442324) (not bm!29551) (not b_lambda!9419) (not b_lambda!9417) (not b!442332) (not d!74047) (not b!442318) (not b!442235) (not d!74051) (not b!442258) (not b_lambda!9423) (not b!442316) (not b!442300) (not b!442292) (not mapNonEmpty!19155) (not b!442326) (not b!442286) (not b!442313) (not b!442234) tp_is_empty!11685 (not bm!29543) (not d!74039) (not b_lambda!9415) (not b!442290) (not b!442295) (not bm!29549) (not bm!29534) (not b!442214) (not bm!29539) (not b_lambda!9427) (not d!74053) (not b!442255) (not b!442330) b_and!18513 (not b!442325) (not d!74055) (not bm!29544) (not b_lambda!9421) (not b!442259) (not bm!29545) (not b!442294) (not b!442287) (not b!442322) (not b!442320) (not b!442244) (not b!442314) (not b!442254) (not b!442246) (not b!442312) (not b!442223) (not b!442288) (not b!442328) (not b!442309) (not d!74059))
(check-sat b_and!18513 (not b_next!10527))
