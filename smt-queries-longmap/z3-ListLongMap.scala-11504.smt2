; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133872 () Bool)

(assert start!133872)

(declare-fun b_free!32133 () Bool)

(declare-fun b_next!32133 () Bool)

(assert (=> start!133872 (= b_free!32133 (not b_next!32133))))

(declare-fun tp!113695 () Bool)

(declare-fun b_and!51703 () Bool)

(assert (=> start!133872 (= tp!113695 b_and!51703)))

(declare-fun b!1565111 () Bool)

(declare-fun e!872366 () Bool)

(declare-fun e!872371 () Bool)

(assert (=> b!1565111 (= e!872366 e!872371)))

(declare-fun res!1069937 () Bool)

(assert (=> b!1565111 (=> res!1069937 e!872371)))

(declare-datatypes ((V!60083 0))(
  ( (V!60084 (val!19537 Int)) )
))
(declare-fun zeroValue!453 () V!60083)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60083)

(declare-datatypes ((array!104500 0))(
  ( (array!104501 (arr!50439 (Array (_ BitVec 32) (_ BitVec 64))) (size!50989 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104500)

(declare-datatypes ((ValueCell!18423 0))(
  ( (ValueCellFull!18423 (v!22291 V!60083)) (EmptyCell!18423) )
))
(declare-datatypes ((array!104502 0))(
  ( (array!104503 (arr!50440 (Array (_ BitVec 32) ValueCell!18423)) (size!50990 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104502)

(declare-fun defaultEntry!495 () Int)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((tuple2!25204 0))(
  ( (tuple2!25205 (_1!12613 (_ BitVec 64)) (_2!12613 V!60083)) )
))
(declare-datatypes ((List!36592 0))(
  ( (Nil!36589) (Cons!36588 (h!38034 tuple2!25204) (t!51439 List!36592)) )
))
(declare-datatypes ((ListLongMap!22639 0))(
  ( (ListLongMap!22640 (toList!11335 List!36592)) )
))
(declare-fun contains!10323 (ListLongMap!22639 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6700 (array!104500 array!104502 (_ BitVec 32) (_ BitVec 32) V!60083 V!60083 (_ BitVec 32) Int) ListLongMap!22639)

(assert (=> b!1565111 (= res!1069937 (contains!10323 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565112 () Bool)

(declare-fun res!1069935 () Bool)

(assert (=> b!1565112 (=> (not res!1069935) (not e!872366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104500 (_ BitVec 32)) Bool)

(assert (=> b!1565112 (= res!1069935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565113 () Bool)

(declare-fun res!1069939 () Bool)

(assert (=> b!1565113 (=> (not res!1069939) (not e!872366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565113 (= res!1069939 (validKeyInArray!0 (select (arr!50439 _keys!637) from!782)))))

(declare-fun b!1565114 () Bool)

(declare-fun e!872368 () Bool)

(declare-fun tp_is_empty!38907 () Bool)

(assert (=> b!1565114 (= e!872368 tp_is_empty!38907)))

(declare-fun b!1565115 () Bool)

(declare-fun res!1069938 () Bool)

(assert (=> b!1565115 (=> (not res!1069938) (not e!872366))))

(assert (=> b!1565115 (= res!1069938 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50989 _keys!637)) (bvslt from!782 (size!50989 _keys!637))))))

(declare-fun mapIsEmpty!59746 () Bool)

(declare-fun mapRes!59746 () Bool)

(assert (=> mapIsEmpty!59746 mapRes!59746))

(declare-fun mapNonEmpty!59746 () Bool)

(declare-fun tp!113694 () Bool)

(assert (=> mapNonEmpty!59746 (= mapRes!59746 (and tp!113694 e!872368))))

(declare-fun mapRest!59746 () (Array (_ BitVec 32) ValueCell!18423))

(declare-fun mapKey!59746 () (_ BitVec 32))

(declare-fun mapValue!59746 () ValueCell!18423)

(assert (=> mapNonEmpty!59746 (= (arr!50440 _values!487) (store mapRest!59746 mapKey!59746 mapValue!59746))))

(declare-fun b!1565116 () Bool)

(declare-fun res!1069936 () Bool)

(assert (=> b!1565116 (=> (not res!1069936) (not e!872366))))

(assert (=> b!1565116 (= res!1069936 (and (= (size!50990 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50989 _keys!637) (size!50990 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565117 () Bool)

(declare-fun e!872367 () Bool)

(assert (=> b!1565117 (= e!872367 tp_is_empty!38907)))

(declare-fun b!1565118 () Bool)

(assert (=> b!1565118 (= e!872371 (= (select (arr!50439 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1069934 () Bool)

(assert (=> start!133872 (=> (not res!1069934) (not e!872366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133872 (= res!1069934 (validMask!0 mask!947))))

(assert (=> start!133872 e!872366))

(assert (=> start!133872 tp!113695))

(assert (=> start!133872 tp_is_empty!38907))

(assert (=> start!133872 true))

(declare-fun array_inv!39197 (array!104500) Bool)

(assert (=> start!133872 (array_inv!39197 _keys!637)))

(declare-fun e!872369 () Bool)

(declare-fun array_inv!39198 (array!104502) Bool)

(assert (=> start!133872 (and (array_inv!39198 _values!487) e!872369)))

(declare-fun b!1565119 () Bool)

(declare-fun res!1069933 () Bool)

(assert (=> b!1565119 (=> (not res!1069933) (not e!872366))))

(declare-datatypes ((List!36593 0))(
  ( (Nil!36590) (Cons!36589 (h!38035 (_ BitVec 64)) (t!51440 List!36593)) )
))
(declare-fun arrayNoDuplicates!0 (array!104500 (_ BitVec 32) List!36593) Bool)

(assert (=> b!1565119 (= res!1069933 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36590))))

(declare-fun b!1565120 () Bool)

(assert (=> b!1565120 (= e!872369 (and e!872367 mapRes!59746))))

(declare-fun condMapEmpty!59746 () Bool)

(declare-fun mapDefault!59746 () ValueCell!18423)

(assert (=> b!1565120 (= condMapEmpty!59746 (= (arr!50440 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18423)) mapDefault!59746)))))

(assert (= (and start!133872 res!1069934) b!1565116))

(assert (= (and b!1565116 res!1069936) b!1565112))

(assert (= (and b!1565112 res!1069935) b!1565119))

(assert (= (and b!1565119 res!1069933) b!1565115))

(assert (= (and b!1565115 res!1069938) b!1565113))

(assert (= (and b!1565113 res!1069939) b!1565111))

(assert (= (and b!1565111 (not res!1069937)) b!1565118))

(assert (= (and b!1565120 condMapEmpty!59746) mapIsEmpty!59746))

(assert (= (and b!1565120 (not condMapEmpty!59746)) mapNonEmpty!59746))

(get-info :version)

(assert (= (and mapNonEmpty!59746 ((_ is ValueCellFull!18423) mapValue!59746)) b!1565114))

(assert (= (and b!1565120 ((_ is ValueCellFull!18423) mapDefault!59746)) b!1565117))

(assert (= start!133872 b!1565120))

(declare-fun m!1440075 () Bool)

(assert (=> b!1565112 m!1440075))

(declare-fun m!1440077 () Bool)

(assert (=> start!133872 m!1440077))

(declare-fun m!1440079 () Bool)

(assert (=> start!133872 m!1440079))

(declare-fun m!1440081 () Bool)

(assert (=> start!133872 m!1440081))

(declare-fun m!1440083 () Bool)

(assert (=> b!1565118 m!1440083))

(declare-fun m!1440085 () Bool)

(assert (=> b!1565119 m!1440085))

(declare-fun m!1440087 () Bool)

(assert (=> b!1565111 m!1440087))

(assert (=> b!1565111 m!1440087))

(declare-fun m!1440089 () Bool)

(assert (=> b!1565111 m!1440089))

(assert (=> b!1565113 m!1440083))

(assert (=> b!1565113 m!1440083))

(declare-fun m!1440091 () Bool)

(assert (=> b!1565113 m!1440091))

(declare-fun m!1440093 () Bool)

(assert (=> mapNonEmpty!59746 m!1440093))

(check-sat tp_is_empty!38907 (not b!1565111) (not start!133872) b_and!51703 (not b!1565119) (not mapNonEmpty!59746) (not b_next!32133) (not b!1565113) (not b!1565112))
(check-sat b_and!51703 (not b_next!32133))
(get-model)

(declare-fun d!163159 () Bool)

(assert (=> d!163159 (= (validKeyInArray!0 (select (arr!50439 _keys!637) from!782)) (and (not (= (select (arr!50439 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50439 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1565113 d!163159))

(declare-fun d!163161 () Bool)

(declare-fun e!872394 () Bool)

(assert (=> d!163161 e!872394))

(declare-fun res!1069963 () Bool)

(assert (=> d!163161 (=> res!1069963 e!872394)))

(declare-fun lt!672145 () Bool)

(assert (=> d!163161 (= res!1069963 (not lt!672145))))

(declare-fun lt!672143 () Bool)

(assert (=> d!163161 (= lt!672145 lt!672143)))

(declare-datatypes ((Unit!51992 0))(
  ( (Unit!51993) )
))
(declare-fun lt!672144 () Unit!51992)

(declare-fun e!872395 () Unit!51992)

(assert (=> d!163161 (= lt!672144 e!872395)))

(declare-fun c!144260 () Bool)

(assert (=> d!163161 (= c!144260 lt!672143)))

(declare-fun containsKey!849 (List!36592 (_ BitVec 64)) Bool)

(assert (=> d!163161 (= lt!672143 (containsKey!849 (toList!11335 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163161 (= (contains!10323 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672145)))

(declare-fun b!1565157 () Bool)

(declare-fun lt!672146 () Unit!51992)

(assert (=> b!1565157 (= e!872395 lt!672146)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!532 (List!36592 (_ BitVec 64)) Unit!51992)

(assert (=> b!1565157 (= lt!672146 (lemmaContainsKeyImpliesGetValueByKeyDefined!532 (toList!11335 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!867 0))(
  ( (Some!866 (v!22293 V!60083)) (None!865) )
))
(declare-fun isDefined!580 (Option!867) Bool)

(declare-fun getValueByKey!791 (List!36592 (_ BitVec 64)) Option!867)

(assert (=> b!1565157 (isDefined!580 (getValueByKey!791 (toList!11335 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565158 () Bool)

(declare-fun Unit!51994 () Unit!51992)

(assert (=> b!1565158 (= e!872395 Unit!51994)))

(declare-fun b!1565159 () Bool)

(assert (=> b!1565159 (= e!872394 (isDefined!580 (getValueByKey!791 (toList!11335 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163161 c!144260) b!1565157))

(assert (= (and d!163161 (not c!144260)) b!1565158))

(assert (= (and d!163161 (not res!1069963)) b!1565159))

(declare-fun m!1440115 () Bool)

(assert (=> d!163161 m!1440115))

(declare-fun m!1440117 () Bool)

(assert (=> b!1565157 m!1440117))

(declare-fun m!1440119 () Bool)

(assert (=> b!1565157 m!1440119))

(assert (=> b!1565157 m!1440119))

(declare-fun m!1440121 () Bool)

(assert (=> b!1565157 m!1440121))

(assert (=> b!1565159 m!1440119))

(assert (=> b!1565159 m!1440119))

(assert (=> b!1565159 m!1440121))

(assert (=> b!1565111 d!163161))

(declare-fun b!1565184 () Bool)

(declare-fun e!872410 () ListLongMap!22639)

(declare-fun call!71867 () ListLongMap!22639)

(assert (=> b!1565184 (= e!872410 call!71867)))

(declare-fun bm!71864 () Bool)

(assert (=> bm!71864 (= call!71867 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun d!163163 () Bool)

(declare-fun e!872413 () Bool)

(assert (=> d!163163 e!872413))

(declare-fun res!1069974 () Bool)

(assert (=> d!163163 (=> (not res!1069974) (not e!872413))))

(declare-fun lt!672161 () ListLongMap!22639)

(assert (=> d!163163 (= res!1069974 (not (contains!10323 lt!672161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!872412 () ListLongMap!22639)

(assert (=> d!163163 (= lt!672161 e!872412)))

(declare-fun c!144270 () Bool)

(assert (=> d!163163 (= c!144270 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!50989 _keys!637)))))

(assert (=> d!163163 (validMask!0 mask!947)))

(assert (=> d!163163 (= (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!672161)))

(declare-fun b!1565185 () Bool)

(declare-fun e!872414 () Bool)

(declare-fun e!872416 () Bool)

(assert (=> b!1565185 (= e!872414 e!872416)))

(assert (=> b!1565185 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50989 _keys!637)))))

(declare-fun res!1069973 () Bool)

(assert (=> b!1565185 (= res!1069973 (contains!10323 lt!672161 (select (arr!50439 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565185 (=> (not res!1069973) (not e!872416))))

(declare-fun b!1565186 () Bool)

(assert (=> b!1565186 (= e!872412 e!872410)))

(declare-fun c!144269 () Bool)

(assert (=> b!1565186 (= c!144269 (validKeyInArray!0 (select (arr!50439 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1565187 () Bool)

(declare-fun res!1069975 () Bool)

(assert (=> b!1565187 (=> (not res!1069975) (not e!872413))))

(assert (=> b!1565187 (= res!1069975 (not (contains!10323 lt!672161 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565188 () Bool)

(assert (=> b!1565188 (= e!872413 e!872414)))

(declare-fun c!144272 () Bool)

(declare-fun e!872415 () Bool)

(assert (=> b!1565188 (= c!144272 e!872415)))

(declare-fun res!1069972 () Bool)

(assert (=> b!1565188 (=> (not res!1069972) (not e!872415))))

(assert (=> b!1565188 (= res!1069972 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50989 _keys!637)))))

(declare-fun b!1565189 () Bool)

(assert (=> b!1565189 (= e!872415 (validKeyInArray!0 (select (arr!50439 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565189 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun b!1565190 () Bool)

(declare-fun e!872411 () Bool)

(assert (=> b!1565190 (= e!872411 (= lt!672161 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1565191 () Bool)

(assert (=> b!1565191 (= e!872414 e!872411)))

(declare-fun c!144271 () Bool)

(assert (=> b!1565191 (= c!144271 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50989 _keys!637)))))

(declare-fun b!1565192 () Bool)

(declare-fun lt!672162 () Unit!51992)

(declare-fun lt!672166 () Unit!51992)

(assert (=> b!1565192 (= lt!672162 lt!672166)))

(declare-fun lt!672167 () ListLongMap!22639)

(declare-fun lt!672164 () (_ BitVec 64))

(declare-fun lt!672165 () V!60083)

(declare-fun lt!672163 () (_ BitVec 64))

(declare-fun +!5065 (ListLongMap!22639 tuple2!25204) ListLongMap!22639)

(assert (=> b!1565192 (not (contains!10323 (+!5065 lt!672167 (tuple2!25205 lt!672163 lt!672165)) lt!672164))))

(declare-fun addStillNotContains!555 (ListLongMap!22639 (_ BitVec 64) V!60083 (_ BitVec 64)) Unit!51992)

(assert (=> b!1565192 (= lt!672166 (addStillNotContains!555 lt!672167 lt!672163 lt!672165 lt!672164))))

(assert (=> b!1565192 (= lt!672164 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!26322 (ValueCell!18423 V!60083) V!60083)

(declare-fun dynLambda!3849 (Int (_ BitVec 64)) V!60083)

(assert (=> b!1565192 (= lt!672165 (get!26322 (select (arr!50440 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3849 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1565192 (= lt!672163 (select (arr!50439 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1565192 (= lt!672167 call!71867)))

(assert (=> b!1565192 (= e!872410 (+!5065 call!71867 (tuple2!25205 (select (arr!50439 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26322 (select (arr!50440 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3849 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1565193 () Bool)

(assert (=> b!1565193 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50989 _keys!637)))))

(assert (=> b!1565193 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50990 _values!487)))))

(declare-fun apply!1116 (ListLongMap!22639 (_ BitVec 64)) V!60083)

(assert (=> b!1565193 (= e!872416 (= (apply!1116 lt!672161 (select (arr!50439 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26322 (select (arr!50440 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3849 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1565194 () Bool)

(declare-fun isEmpty!1144 (ListLongMap!22639) Bool)

(assert (=> b!1565194 (= e!872411 (isEmpty!1144 lt!672161))))

(declare-fun b!1565195 () Bool)

(assert (=> b!1565195 (= e!872412 (ListLongMap!22640 Nil!36589))))

(assert (= (and d!163163 c!144270) b!1565195))

(assert (= (and d!163163 (not c!144270)) b!1565186))

(assert (= (and b!1565186 c!144269) b!1565192))

(assert (= (and b!1565186 (not c!144269)) b!1565184))

(assert (= (or b!1565192 b!1565184) bm!71864))

(assert (= (and d!163163 res!1069974) b!1565187))

(assert (= (and b!1565187 res!1069975) b!1565188))

(assert (= (and b!1565188 res!1069972) b!1565189))

(assert (= (and b!1565188 c!144272) b!1565185))

(assert (= (and b!1565188 (not c!144272)) b!1565191))

(assert (= (and b!1565185 res!1069973) b!1565193))

(assert (= (and b!1565191 c!144271) b!1565190))

(assert (= (and b!1565191 (not c!144271)) b!1565194))

(declare-fun b_lambda!24933 () Bool)

(assert (=> (not b_lambda!24933) (not b!1565192)))

(declare-fun t!51443 () Bool)

(declare-fun tb!12603 () Bool)

(assert (=> (and start!133872 (= defaultEntry!495 defaultEntry!495) t!51443) tb!12603))

(declare-fun result!26493 () Bool)

(assert (=> tb!12603 (= result!26493 tp_is_empty!38907)))

(assert (=> b!1565192 t!51443))

(declare-fun b_and!51707 () Bool)

(assert (= b_and!51703 (and (=> t!51443 result!26493) b_and!51707)))

(declare-fun b_lambda!24935 () Bool)

(assert (=> (not b_lambda!24935) (not b!1565193)))

(assert (=> b!1565193 t!51443))

(declare-fun b_and!51709 () Bool)

(assert (= b_and!51707 (and (=> t!51443 result!26493) b_and!51709)))

(declare-fun m!1440123 () Bool)

(assert (=> b!1565186 m!1440123))

(assert (=> b!1565186 m!1440123))

(declare-fun m!1440125 () Bool)

(assert (=> b!1565186 m!1440125))

(declare-fun m!1440127 () Bool)

(assert (=> b!1565187 m!1440127))

(declare-fun m!1440129 () Bool)

(assert (=> d!163163 m!1440129))

(assert (=> d!163163 m!1440077))

(assert (=> b!1565189 m!1440123))

(assert (=> b!1565189 m!1440123))

(assert (=> b!1565189 m!1440125))

(declare-fun m!1440131 () Bool)

(assert (=> b!1565193 m!1440131))

(declare-fun m!1440133 () Bool)

(assert (=> b!1565193 m!1440133))

(declare-fun m!1440135 () Bool)

(assert (=> b!1565193 m!1440135))

(assert (=> b!1565193 m!1440133))

(assert (=> b!1565193 m!1440123))

(assert (=> b!1565193 m!1440131))

(assert (=> b!1565193 m!1440123))

(declare-fun m!1440137 () Bool)

(assert (=> b!1565193 m!1440137))

(declare-fun m!1440139 () Bool)

(assert (=> b!1565192 m!1440139))

(assert (=> b!1565192 m!1440131))

(assert (=> b!1565192 m!1440133))

(assert (=> b!1565192 m!1440135))

(declare-fun m!1440141 () Bool)

(assert (=> b!1565192 m!1440141))

(declare-fun m!1440143 () Bool)

(assert (=> b!1565192 m!1440143))

(assert (=> b!1565192 m!1440131))

(assert (=> b!1565192 m!1440133))

(assert (=> b!1565192 m!1440143))

(declare-fun m!1440145 () Bool)

(assert (=> b!1565192 m!1440145))

(assert (=> b!1565192 m!1440123))

(assert (=> b!1565185 m!1440123))

(assert (=> b!1565185 m!1440123))

(declare-fun m!1440147 () Bool)

(assert (=> b!1565185 m!1440147))

(declare-fun m!1440149 () Bool)

(assert (=> bm!71864 m!1440149))

(assert (=> b!1565190 m!1440149))

(declare-fun m!1440151 () Bool)

(assert (=> b!1565194 m!1440151))

(assert (=> b!1565111 d!163163))

(declare-fun b!1565208 () Bool)

(declare-fun e!872428 () Bool)

(declare-fun contains!10324 (List!36593 (_ BitVec 64)) Bool)

(assert (=> b!1565208 (= e!872428 (contains!10324 Nil!36590 (select (arr!50439 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71867 () Bool)

(declare-fun call!71870 () Bool)

(declare-fun c!144275 () Bool)

(assert (=> bm!71867 (= call!71870 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144275 (Cons!36589 (select (arr!50439 _keys!637) #b00000000000000000000000000000000) Nil!36590) Nil!36590)))))

(declare-fun b!1565210 () Bool)

(declare-fun e!872425 () Bool)

(declare-fun e!872426 () Bool)

(assert (=> b!1565210 (= e!872425 e!872426)))

(declare-fun res!1069982 () Bool)

(assert (=> b!1565210 (=> (not res!1069982) (not e!872426))))

(assert (=> b!1565210 (= res!1069982 (not e!872428))))

(declare-fun res!1069983 () Bool)

(assert (=> b!1565210 (=> (not res!1069983) (not e!872428))))

(assert (=> b!1565210 (= res!1069983 (validKeyInArray!0 (select (arr!50439 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565209 () Bool)

(declare-fun e!872427 () Bool)

(assert (=> b!1565209 (= e!872427 call!71870)))

(declare-fun d!163165 () Bool)

(declare-fun res!1069984 () Bool)

(assert (=> d!163165 (=> res!1069984 e!872425)))

(assert (=> d!163165 (= res!1069984 (bvsge #b00000000000000000000000000000000 (size!50989 _keys!637)))))

(assert (=> d!163165 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36590) e!872425)))

(declare-fun b!1565211 () Bool)

(assert (=> b!1565211 (= e!872426 e!872427)))

(assert (=> b!1565211 (= c!144275 (validKeyInArray!0 (select (arr!50439 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565212 () Bool)

(assert (=> b!1565212 (= e!872427 call!71870)))

(assert (= (and d!163165 (not res!1069984)) b!1565210))

(assert (= (and b!1565210 res!1069983) b!1565208))

(assert (= (and b!1565210 res!1069982) b!1565211))

(assert (= (and b!1565211 c!144275) b!1565212))

(assert (= (and b!1565211 (not c!144275)) b!1565209))

(assert (= (or b!1565212 b!1565209) bm!71867))

(declare-fun m!1440153 () Bool)

(assert (=> b!1565208 m!1440153))

(assert (=> b!1565208 m!1440153))

(declare-fun m!1440155 () Bool)

(assert (=> b!1565208 m!1440155))

(assert (=> bm!71867 m!1440153))

(declare-fun m!1440157 () Bool)

(assert (=> bm!71867 m!1440157))

(assert (=> b!1565210 m!1440153))

(assert (=> b!1565210 m!1440153))

(declare-fun m!1440159 () Bool)

(assert (=> b!1565210 m!1440159))

(assert (=> b!1565211 m!1440153))

(assert (=> b!1565211 m!1440153))

(assert (=> b!1565211 m!1440159))

(assert (=> b!1565119 d!163165))

(declare-fun d!163167 () Bool)

(assert (=> d!163167 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133872 d!163167))

(declare-fun d!163169 () Bool)

(assert (=> d!163169 (= (array_inv!39197 _keys!637) (bvsge (size!50989 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133872 d!163169))

(declare-fun d!163171 () Bool)

(assert (=> d!163171 (= (array_inv!39198 _values!487) (bvsge (size!50990 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133872 d!163171))

(declare-fun b!1565221 () Bool)

(declare-fun e!872436 () Bool)

(declare-fun call!71873 () Bool)

(assert (=> b!1565221 (= e!872436 call!71873)))

(declare-fun b!1565222 () Bool)

(declare-fun e!872437 () Bool)

(assert (=> b!1565222 (= e!872437 call!71873)))

(declare-fun d!163173 () Bool)

(declare-fun res!1069989 () Bool)

(declare-fun e!872435 () Bool)

(assert (=> d!163173 (=> res!1069989 e!872435)))

(assert (=> d!163173 (= res!1069989 (bvsge #b00000000000000000000000000000000 (size!50989 _keys!637)))))

(assert (=> d!163173 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872435)))

(declare-fun bm!71870 () Bool)

(assert (=> bm!71870 (= call!71873 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1565223 () Bool)

(assert (=> b!1565223 (= e!872435 e!872436)))

(declare-fun c!144278 () Bool)

(assert (=> b!1565223 (= c!144278 (validKeyInArray!0 (select (arr!50439 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565224 () Bool)

(assert (=> b!1565224 (= e!872436 e!872437)))

(declare-fun lt!672174 () (_ BitVec 64))

(assert (=> b!1565224 (= lt!672174 (select (arr!50439 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672176 () Unit!51992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104500 (_ BitVec 64) (_ BitVec 32)) Unit!51992)

(assert (=> b!1565224 (= lt!672176 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672174 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1565224 (arrayContainsKey!0 _keys!637 lt!672174 #b00000000000000000000000000000000)))

(declare-fun lt!672175 () Unit!51992)

(assert (=> b!1565224 (= lt!672175 lt!672176)))

(declare-fun res!1069990 () Bool)

(declare-datatypes ((SeekEntryResult!13524 0))(
  ( (MissingZero!13524 (index!56494 (_ BitVec 32))) (Found!13524 (index!56495 (_ BitVec 32))) (Intermediate!13524 (undefined!14336 Bool) (index!56496 (_ BitVec 32)) (x!140599 (_ BitVec 32))) (Undefined!13524) (MissingVacant!13524 (index!56497 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104500 (_ BitVec 32)) SeekEntryResult!13524)

(assert (=> b!1565224 (= res!1069990 (= (seekEntryOrOpen!0 (select (arr!50439 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13524 #b00000000000000000000000000000000)))))

(assert (=> b!1565224 (=> (not res!1069990) (not e!872437))))

(assert (= (and d!163173 (not res!1069989)) b!1565223))

(assert (= (and b!1565223 c!144278) b!1565224))

(assert (= (and b!1565223 (not c!144278)) b!1565221))

(assert (= (and b!1565224 res!1069990) b!1565222))

(assert (= (or b!1565222 b!1565221) bm!71870))

(declare-fun m!1440161 () Bool)

(assert (=> bm!71870 m!1440161))

(assert (=> b!1565223 m!1440153))

(assert (=> b!1565223 m!1440153))

(assert (=> b!1565223 m!1440159))

(assert (=> b!1565224 m!1440153))

(declare-fun m!1440163 () Bool)

(assert (=> b!1565224 m!1440163))

(declare-fun m!1440165 () Bool)

(assert (=> b!1565224 m!1440165))

(assert (=> b!1565224 m!1440153))

(declare-fun m!1440167 () Bool)

(assert (=> b!1565224 m!1440167))

(assert (=> b!1565112 d!163173))

(declare-fun b!1565231 () Bool)

(declare-fun e!872442 () Bool)

(assert (=> b!1565231 (= e!872442 tp_is_empty!38907)))

(declare-fun mapNonEmpty!59752 () Bool)

(declare-fun mapRes!59752 () Bool)

(declare-fun tp!113704 () Bool)

(assert (=> mapNonEmpty!59752 (= mapRes!59752 (and tp!113704 e!872442))))

(declare-fun mapRest!59752 () (Array (_ BitVec 32) ValueCell!18423))

(declare-fun mapValue!59752 () ValueCell!18423)

(declare-fun mapKey!59752 () (_ BitVec 32))

(assert (=> mapNonEmpty!59752 (= mapRest!59746 (store mapRest!59752 mapKey!59752 mapValue!59752))))

(declare-fun mapIsEmpty!59752 () Bool)

(assert (=> mapIsEmpty!59752 mapRes!59752))

(declare-fun condMapEmpty!59752 () Bool)

(declare-fun mapDefault!59752 () ValueCell!18423)

(assert (=> mapNonEmpty!59746 (= condMapEmpty!59752 (= mapRest!59746 ((as const (Array (_ BitVec 32) ValueCell!18423)) mapDefault!59752)))))

(declare-fun e!872443 () Bool)

(assert (=> mapNonEmpty!59746 (= tp!113694 (and e!872443 mapRes!59752))))

(declare-fun b!1565232 () Bool)

(assert (=> b!1565232 (= e!872443 tp_is_empty!38907)))

(assert (= (and mapNonEmpty!59746 condMapEmpty!59752) mapIsEmpty!59752))

(assert (= (and mapNonEmpty!59746 (not condMapEmpty!59752)) mapNonEmpty!59752))

(assert (= (and mapNonEmpty!59752 ((_ is ValueCellFull!18423) mapValue!59752)) b!1565231))

(assert (= (and mapNonEmpty!59746 ((_ is ValueCellFull!18423) mapDefault!59752)) b!1565232))

(declare-fun m!1440169 () Bool)

(assert (=> mapNonEmpty!59752 m!1440169))

(declare-fun b_lambda!24937 () Bool)

(assert (= b_lambda!24935 (or (and start!133872 b_free!32133) b_lambda!24937)))

(declare-fun b_lambda!24939 () Bool)

(assert (= b_lambda!24933 (or (and start!133872 b_free!32133) b_lambda!24939)))

(check-sat (not b_lambda!24937) (not b!1565223) tp_is_empty!38907 b_and!51709 (not b!1565159) (not b!1565187) (not b!1565210) (not bm!71864) (not bm!71867) (not b!1565189) (not mapNonEmpty!59752) (not d!163163) (not d!163161) (not b!1565185) (not b!1565157) (not bm!71870) (not b!1565186) (not b!1565190) (not b!1565224) (not b!1565211) (not b_lambda!24939) (not b!1565194) (not b!1565208) (not b_next!32133) (not b!1565192) (not b!1565193))
(check-sat b_and!51709 (not b_next!32133))
