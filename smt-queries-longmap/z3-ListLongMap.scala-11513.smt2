; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133912 () Bool)

(assert start!133912)

(declare-fun b_free!32185 () Bool)

(declare-fun b_next!32185 () Bool)

(assert (=> start!133912 (= b_free!32185 (not b_next!32185))))

(declare-fun tp!113858 () Bool)

(declare-fun b_and!51793 () Bool)

(assert (=> start!133912 (= tp!113858 b_and!51793)))

(declare-fun b!1565761 () Bool)

(declare-fun e!872703 () Bool)

(declare-fun tp_is_empty!38959 () Bool)

(assert (=> b!1565761 (= e!872703 tp_is_empty!38959)))

(declare-datatypes ((V!60153 0))(
  ( (V!60154 (val!19563 Int)) )
))
(declare-datatypes ((tuple2!25320 0))(
  ( (tuple2!25321 (_1!12671 (_ BitVec 64)) (_2!12671 V!60153)) )
))
(declare-datatypes ((List!36678 0))(
  ( (Nil!36675) (Cons!36674 (h!38121 tuple2!25320) (t!51569 List!36678)) )
))
(declare-datatypes ((ListLongMap!22755 0))(
  ( (ListLongMap!22756 (toList!11393 List!36678)) )
))
(declare-fun lt!672254 () ListLongMap!22755)

(declare-fun b!1565762 () Bool)

(declare-fun lt!672256 () V!60153)

(declare-fun e!872700 () Bool)

(declare-datatypes ((array!104534 0))(
  ( (array!104535 (arr!50455 (Array (_ BitVec 32) (_ BitVec 64))) (size!51007 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104534)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun apply!1105 (ListLongMap!22755 (_ BitVec 64)) V!60153)

(assert (=> b!1565762 (= e!872700 (= (apply!1105 lt!672254 (select (arr!50455 _keys!637) from!782)) lt!672256))))

(declare-fun b!1565763 () Bool)

(declare-fun res!1070382 () Bool)

(declare-fun e!872701 () Bool)

(assert (=> b!1565763 (=> (not res!1070382) (not e!872701))))

(assert (=> b!1565763 (= res!1070382 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51007 _keys!637)) (bvslt from!782 (size!51007 _keys!637))))))

(declare-fun mapNonEmpty!59830 () Bool)

(declare-fun mapRes!59830 () Bool)

(declare-fun tp!113857 () Bool)

(assert (=> mapNonEmpty!59830 (= mapRes!59830 (and tp!113857 e!872703))))

(declare-datatypes ((ValueCell!18449 0))(
  ( (ValueCellFull!18449 (v!22315 V!60153)) (EmptyCell!18449) )
))
(declare-fun mapRest!59830 () (Array (_ BitVec 32) ValueCell!18449))

(declare-fun mapValue!59830 () ValueCell!18449)

(declare-fun mapKey!59830 () (_ BitVec 32))

(declare-datatypes ((array!104536 0))(
  ( (array!104537 (arr!50456 (Array (_ BitVec 32) ValueCell!18449)) (size!51008 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104536)

(assert (=> mapNonEmpty!59830 (= (arr!50456 _values!487) (store mapRest!59830 mapKey!59830 mapValue!59830))))

(declare-fun b!1565764 () Bool)

(declare-fun res!1070383 () Bool)

(assert (=> b!1565764 (=> (not res!1070383) (not e!872700))))

(declare-fun contains!10306 (ListLongMap!22755 (_ BitVec 64)) Bool)

(assert (=> b!1565764 (= res!1070383 (contains!10306 lt!672254 (select (arr!50455 _keys!637) from!782)))))

(declare-fun b!1565765 () Bool)

(declare-fun res!1070380 () Bool)

(assert (=> b!1565765 (=> (not res!1070380) (not e!872701))))

(declare-datatypes ((List!36679 0))(
  ( (Nil!36676) (Cons!36675 (h!38122 (_ BitVec 64)) (t!51570 List!36679)) )
))
(declare-fun arrayNoDuplicates!0 (array!104534 (_ BitVec 32) List!36679) Bool)

(assert (=> b!1565765 (= res!1070380 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36676))))

(declare-fun b!1565766 () Bool)

(declare-fun e!872699 () Bool)

(assert (=> b!1565766 (= e!872699 tp_is_empty!38959)))

(declare-fun mapIsEmpty!59830 () Bool)

(assert (=> mapIsEmpty!59830 mapRes!59830))

(declare-fun b!1565767 () Bool)

(declare-fun res!1070377 () Bool)

(assert (=> b!1565767 (=> (not res!1070377) (not e!872701))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565767 (= res!1070377 (and (= (size!51008 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51007 _keys!637) (size!51008 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565768 () Bool)

(declare-fun res!1070378 () Bool)

(assert (=> b!1565768 (=> (not res!1070378) (not e!872701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104534 (_ BitVec 32)) Bool)

(assert (=> b!1565768 (= res!1070378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565769 () Bool)

(assert (=> b!1565769 (= e!872701 (not e!872700))))

(declare-fun res!1070376 () Bool)

(assert (=> b!1565769 (=> (not res!1070376) (not e!872700))))

(assert (=> b!1565769 (= res!1070376 (not (contains!10306 lt!672254 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1565769 (not (contains!10306 lt!672254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672253 () ListLongMap!22755)

(declare-fun +!5114 (ListLongMap!22755 tuple2!25320) ListLongMap!22755)

(assert (=> b!1565769 (= lt!672254 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))

(declare-datatypes ((Unit!51846 0))(
  ( (Unit!51847) )
))
(declare-fun lt!672255 () Unit!51846)

(declare-fun addStillNotContains!561 (ListLongMap!22755 (_ BitVec 64) V!60153 (_ BitVec 64)) Unit!51846)

(assert (=> b!1565769 (= lt!672255 (addStillNotContains!561 lt!672253 (select (arr!50455 _keys!637) from!782) lt!672256 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26359 (ValueCell!18449 V!60153) V!60153)

(declare-fun dynLambda!3890 (Int (_ BitVec 64)) V!60153)

(assert (=> b!1565769 (= lt!672256 (get!26359 (select (arr!50456 _values!487) from!782) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60153)

(declare-fun minValue!453 () V!60153)

(declare-fun getCurrentListMapNoExtraKeys!6745 (array!104534 array!104536 (_ BitVec 32) (_ BitVec 32) V!60153 V!60153 (_ BitVec 32) Int) ListLongMap!22755)

(assert (=> b!1565769 (= lt!672253 (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565770 () Bool)

(declare-fun res!1070379 () Bool)

(assert (=> b!1565770 (=> (not res!1070379) (not e!872701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565770 (= res!1070379 (validKeyInArray!0 (select (arr!50455 _keys!637) from!782)))))

(declare-fun res!1070381 () Bool)

(assert (=> start!133912 (=> (not res!1070381) (not e!872701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133912 (= res!1070381 (validMask!0 mask!947))))

(assert (=> start!133912 e!872701))

(assert (=> start!133912 tp!113858))

(assert (=> start!133912 tp_is_empty!38959))

(assert (=> start!133912 true))

(declare-fun array_inv!39407 (array!104534) Bool)

(assert (=> start!133912 (array_inv!39407 _keys!637)))

(declare-fun e!872704 () Bool)

(declare-fun array_inv!39408 (array!104536) Bool)

(assert (=> start!133912 (and (array_inv!39408 _values!487) e!872704)))

(declare-fun b!1565771 () Bool)

(assert (=> b!1565771 (= e!872704 (and e!872699 mapRes!59830))))

(declare-fun condMapEmpty!59830 () Bool)

(declare-fun mapDefault!59830 () ValueCell!18449)

(assert (=> b!1565771 (= condMapEmpty!59830 (= (arr!50456 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18449)) mapDefault!59830)))))

(assert (= (and start!133912 res!1070381) b!1565767))

(assert (= (and b!1565767 res!1070377) b!1565768))

(assert (= (and b!1565768 res!1070378) b!1565765))

(assert (= (and b!1565765 res!1070380) b!1565763))

(assert (= (and b!1565763 res!1070382) b!1565770))

(assert (= (and b!1565770 res!1070379) b!1565769))

(assert (= (and b!1565769 res!1070376) b!1565764))

(assert (= (and b!1565764 res!1070383) b!1565762))

(assert (= (and b!1565771 condMapEmpty!59830) mapIsEmpty!59830))

(assert (= (and b!1565771 (not condMapEmpty!59830)) mapNonEmpty!59830))

(get-info :version)

(assert (= (and mapNonEmpty!59830 ((_ is ValueCellFull!18449) mapValue!59830)) b!1565761))

(assert (= (and b!1565771 ((_ is ValueCellFull!18449) mapDefault!59830)) b!1565766))

(assert (= start!133912 b!1565771))

(declare-fun b_lambda!24989 () Bool)

(assert (=> (not b_lambda!24989) (not b!1565769)))

(declare-fun t!51568 () Bool)

(declare-fun tb!12645 () Bool)

(assert (=> (and start!133912 (= defaultEntry!495 defaultEntry!495) t!51568) tb!12645))

(declare-fun result!26589 () Bool)

(assert (=> tb!12645 (= result!26589 tp_is_empty!38959)))

(assert (=> b!1565769 t!51568))

(declare-fun b_and!51795 () Bool)

(assert (= b_and!51793 (and (=> t!51568 result!26589) b_and!51795)))

(declare-fun m!1440115 () Bool)

(assert (=> mapNonEmpty!59830 m!1440115))

(declare-fun m!1440117 () Bool)

(assert (=> b!1565765 m!1440117))

(declare-fun m!1440119 () Bool)

(assert (=> b!1565764 m!1440119))

(assert (=> b!1565764 m!1440119))

(declare-fun m!1440121 () Bool)

(assert (=> b!1565764 m!1440121))

(declare-fun m!1440123 () Bool)

(assert (=> start!133912 m!1440123))

(declare-fun m!1440125 () Bool)

(assert (=> start!133912 m!1440125))

(declare-fun m!1440127 () Bool)

(assert (=> start!133912 m!1440127))

(declare-fun m!1440129 () Bool)

(assert (=> b!1565768 m!1440129))

(assert (=> b!1565770 m!1440119))

(assert (=> b!1565770 m!1440119))

(declare-fun m!1440131 () Bool)

(assert (=> b!1565770 m!1440131))

(declare-fun m!1440133 () Bool)

(assert (=> b!1565769 m!1440133))

(declare-fun m!1440135 () Bool)

(assert (=> b!1565769 m!1440135))

(declare-fun m!1440137 () Bool)

(assert (=> b!1565769 m!1440137))

(assert (=> b!1565769 m!1440119))

(declare-fun m!1440139 () Bool)

(assert (=> b!1565769 m!1440139))

(declare-fun m!1440141 () Bool)

(assert (=> b!1565769 m!1440141))

(assert (=> b!1565769 m!1440133))

(assert (=> b!1565769 m!1440119))

(assert (=> b!1565769 m!1440135))

(declare-fun m!1440143 () Bool)

(assert (=> b!1565769 m!1440143))

(declare-fun m!1440145 () Bool)

(assert (=> b!1565769 m!1440145))

(declare-fun m!1440147 () Bool)

(assert (=> b!1565769 m!1440147))

(assert (=> b!1565762 m!1440119))

(assert (=> b!1565762 m!1440119))

(declare-fun m!1440149 () Bool)

(assert (=> b!1565762 m!1440149))

(check-sat (not b!1565762) (not b_next!32185) (not mapNonEmpty!59830) b_and!51795 (not b!1565769) (not b!1565764) (not b!1565765) (not b_lambda!24989) (not b!1565770) (not b!1565768) (not start!133912) tp_is_empty!38959)
(check-sat b_and!51795 (not b_next!32185))
(get-model)

(declare-fun b_lambda!24995 () Bool)

(assert (= b_lambda!24989 (or (and start!133912 b_free!32185) b_lambda!24995)))

(check-sat (not b!1565762) (not b_next!32185) (not b!1565770) (not mapNonEmpty!59830) b_and!51795 (not b_lambda!24995) (not b!1565769) (not b!1565764) (not b!1565765) (not b!1565768) (not start!133912) tp_is_empty!38959)
(check-sat b_and!51795 (not b_next!32185))
(get-model)

(declare-fun d!162961 () Bool)

(declare-fun c!144216 () Bool)

(assert (=> d!162961 (= c!144216 ((_ is ValueCellFull!18449) (select (arr!50456 _values!487) from!782)))))

(declare-fun e!872743 () V!60153)

(assert (=> d!162961 (= (get!26359 (select (arr!50456 _values!487) from!782) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!872743)))

(declare-fun b!1565848 () Bool)

(declare-fun get!26360 (ValueCell!18449 V!60153) V!60153)

(assert (=> b!1565848 (= e!872743 (get!26360 (select (arr!50456 _values!487) from!782) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565849 () Bool)

(declare-fun get!26361 (ValueCell!18449 V!60153) V!60153)

(assert (=> b!1565849 (= e!872743 (get!26361 (select (arr!50456 _values!487) from!782) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162961 c!144216) b!1565848))

(assert (= (and d!162961 (not c!144216)) b!1565849))

(assert (=> b!1565848 m!1440133))

(assert (=> b!1565848 m!1440135))

(declare-fun m!1440223 () Bool)

(assert (=> b!1565848 m!1440223))

(assert (=> b!1565849 m!1440133))

(assert (=> b!1565849 m!1440135))

(declare-fun m!1440225 () Bool)

(assert (=> b!1565849 m!1440225))

(assert (=> b!1565769 d!162961))

(declare-fun d!162963 () Bool)

(declare-fun e!872749 () Bool)

(assert (=> d!162963 e!872749))

(declare-fun res!1070434 () Bool)

(assert (=> d!162963 (=> res!1070434 e!872749)))

(declare-fun lt!672291 () Bool)

(assert (=> d!162963 (= res!1070434 (not lt!672291))))

(declare-fun lt!672292 () Bool)

(assert (=> d!162963 (= lt!672291 lt!672292)))

(declare-fun lt!672290 () Unit!51846)

(declare-fun e!872748 () Unit!51846)

(assert (=> d!162963 (= lt!672290 e!872748)))

(declare-fun c!144219 () Bool)

(assert (=> d!162963 (= c!144219 lt!672292)))

(declare-fun containsKey!849 (List!36678 (_ BitVec 64)) Bool)

(assert (=> d!162963 (= lt!672292 (containsKey!849 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162963 (= (contains!10306 lt!672254 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672291)))

(declare-fun b!1565856 () Bool)

(declare-fun lt!672289 () Unit!51846)

(assert (=> b!1565856 (= e!872748 lt!672289)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!533 (List!36678 (_ BitVec 64)) Unit!51846)

(assert (=> b!1565856 (= lt!672289 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!871 0))(
  ( (Some!870 (v!22318 V!60153)) (None!869) )
))
(declare-fun isDefined!584 (Option!871) Bool)

(declare-fun getValueByKey!796 (List!36678 (_ BitVec 64)) Option!871)

(assert (=> b!1565856 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565857 () Bool)

(declare-fun Unit!51848 () Unit!51846)

(assert (=> b!1565857 (= e!872748 Unit!51848)))

(declare-fun b!1565858 () Bool)

(assert (=> b!1565858 (= e!872749 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162963 c!144219) b!1565856))

(assert (= (and d!162963 (not c!144219)) b!1565857))

(assert (= (and d!162963 (not res!1070434)) b!1565858))

(declare-fun m!1440227 () Bool)

(assert (=> d!162963 m!1440227))

(declare-fun m!1440229 () Bool)

(assert (=> b!1565856 m!1440229))

(declare-fun m!1440231 () Bool)

(assert (=> b!1565856 m!1440231))

(assert (=> b!1565856 m!1440231))

(declare-fun m!1440233 () Bool)

(assert (=> b!1565856 m!1440233))

(assert (=> b!1565858 m!1440231))

(assert (=> b!1565858 m!1440231))

(assert (=> b!1565858 m!1440233))

(assert (=> b!1565769 d!162963))

(declare-fun b!1565883 () Bool)

(declare-fun e!872765 () Bool)

(assert (=> b!1565883 (= e!872765 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565883 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun d!162965 () Bool)

(declare-fun e!872770 () Bool)

(assert (=> d!162965 e!872770))

(declare-fun res!1070444 () Bool)

(assert (=> d!162965 (=> (not res!1070444) (not e!872770))))

(declare-fun lt!672313 () ListLongMap!22755)

(assert (=> d!162965 (= res!1070444 (not (contains!10306 lt!672313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!872768 () ListLongMap!22755)

(assert (=> d!162965 (= lt!672313 e!872768)))

(declare-fun c!144231 () Bool)

(assert (=> d!162965 (= c!144231 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51007 _keys!637)))))

(assert (=> d!162965 (validMask!0 mask!947)))

(assert (=> d!162965 (= (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!672313)))

(declare-fun b!1565884 () Bool)

(declare-fun e!872766 () Bool)

(declare-fun isEmpty!1151 (ListLongMap!22755) Bool)

(assert (=> b!1565884 (= e!872766 (isEmpty!1151 lt!672313))))

(declare-fun b!1565885 () Bool)

(declare-fun e!872764 () Bool)

(assert (=> b!1565885 (= e!872764 e!872766)))

(declare-fun c!144230 () Bool)

(assert (=> b!1565885 (= c!144230 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51007 _keys!637)))))

(declare-fun b!1565886 () Bool)

(assert (=> b!1565886 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51007 _keys!637)))))

(assert (=> b!1565886 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51008 _values!487)))))

(declare-fun e!872767 () Bool)

(assert (=> b!1565886 (= e!872767 (= (apply!1105 lt!672313 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1565887 () Bool)

(declare-fun e!872769 () ListLongMap!22755)

(declare-fun call!71850 () ListLongMap!22755)

(assert (=> b!1565887 (= e!872769 call!71850)))

(declare-fun b!1565888 () Bool)

(declare-fun res!1070445 () Bool)

(assert (=> b!1565888 (=> (not res!1070445) (not e!872770))))

(assert (=> b!1565888 (= res!1070445 (not (contains!10306 lt!672313 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565889 () Bool)

(assert (=> b!1565889 (= e!872764 e!872767)))

(assert (=> b!1565889 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51007 _keys!637)))))

(declare-fun res!1070446 () Bool)

(assert (=> b!1565889 (= res!1070446 (contains!10306 lt!672313 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565889 (=> (not res!1070446) (not e!872767))))

(declare-fun b!1565890 () Bool)

(assert (=> b!1565890 (= e!872766 (= lt!672313 (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1565891 () Bool)

(assert (=> b!1565891 (= e!872768 e!872769)))

(declare-fun c!144228 () Bool)

(assert (=> b!1565891 (= c!144228 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun bm!71847 () Bool)

(assert (=> bm!71847 (= call!71850 (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1565892 () Bool)

(assert (=> b!1565892 (= e!872770 e!872764)))

(declare-fun c!144229 () Bool)

(assert (=> b!1565892 (= c!144229 e!872765)))

(declare-fun res!1070443 () Bool)

(assert (=> b!1565892 (=> (not res!1070443) (not e!872765))))

(assert (=> b!1565892 (= res!1070443 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51007 _keys!637)))))

(declare-fun b!1565893 () Bool)

(declare-fun lt!672308 () Unit!51846)

(declare-fun lt!672309 () Unit!51846)

(assert (=> b!1565893 (= lt!672308 lt!672309)))

(declare-fun lt!672312 () V!60153)

(declare-fun lt!672307 () (_ BitVec 64))

(declare-fun lt!672311 () ListLongMap!22755)

(declare-fun lt!672310 () (_ BitVec 64))

(assert (=> b!1565893 (not (contains!10306 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)) lt!672310))))

(assert (=> b!1565893 (= lt!672309 (addStillNotContains!561 lt!672311 lt!672307 lt!672312 lt!672310))))

(assert (=> b!1565893 (= lt!672310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1565893 (= lt!672312 (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1565893 (= lt!672307 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1565893 (= lt!672311 call!71850)))

(assert (=> b!1565893 (= e!872769 (+!5114 call!71850 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1565894 () Bool)

(assert (=> b!1565894 (= e!872768 (ListLongMap!22756 Nil!36675))))

(assert (= (and d!162965 c!144231) b!1565894))

(assert (= (and d!162965 (not c!144231)) b!1565891))

(assert (= (and b!1565891 c!144228) b!1565893))

(assert (= (and b!1565891 (not c!144228)) b!1565887))

(assert (= (or b!1565893 b!1565887) bm!71847))

(assert (= (and d!162965 res!1070444) b!1565888))

(assert (= (and b!1565888 res!1070445) b!1565892))

(assert (= (and b!1565892 res!1070443) b!1565883))

(assert (= (and b!1565892 c!144229) b!1565889))

(assert (= (and b!1565892 (not c!144229)) b!1565885))

(assert (= (and b!1565889 res!1070446) b!1565886))

(assert (= (and b!1565885 c!144230) b!1565890))

(assert (= (and b!1565885 (not c!144230)) b!1565884))

(declare-fun b_lambda!24997 () Bool)

(assert (=> (not b_lambda!24997) (not b!1565886)))

(assert (=> b!1565886 t!51568))

(declare-fun b_and!51805 () Bool)

(assert (= b_and!51795 (and (=> t!51568 result!26589) b_and!51805)))

(declare-fun b_lambda!24999 () Bool)

(assert (=> (not b_lambda!24999) (not b!1565893)))

(assert (=> b!1565893 t!51568))

(declare-fun b_and!51807 () Bool)

(assert (= b_and!51805 (and (=> t!51568 result!26589) b_and!51807)))

(declare-fun m!1440235 () Bool)

(assert (=> b!1565888 m!1440235))

(declare-fun m!1440237 () Bool)

(assert (=> b!1565883 m!1440237))

(assert (=> b!1565883 m!1440237))

(declare-fun m!1440239 () Bool)

(assert (=> b!1565883 m!1440239))

(declare-fun m!1440241 () Bool)

(assert (=> d!162965 m!1440241))

(assert (=> d!162965 m!1440123))

(assert (=> b!1565893 m!1440237))

(declare-fun m!1440243 () Bool)

(assert (=> b!1565893 m!1440243))

(declare-fun m!1440245 () Bool)

(assert (=> b!1565893 m!1440245))

(declare-fun m!1440247 () Bool)

(assert (=> b!1565893 m!1440247))

(declare-fun m!1440249 () Bool)

(assert (=> b!1565893 m!1440249))

(assert (=> b!1565893 m!1440247))

(declare-fun m!1440251 () Bool)

(assert (=> b!1565893 m!1440251))

(assert (=> b!1565893 m!1440245))

(assert (=> b!1565893 m!1440135))

(declare-fun m!1440253 () Bool)

(assert (=> b!1565893 m!1440253))

(assert (=> b!1565893 m!1440135))

(assert (=> b!1565886 m!1440237))

(declare-fun m!1440255 () Bool)

(assert (=> b!1565886 m!1440255))

(assert (=> b!1565886 m!1440237))

(assert (=> b!1565886 m!1440245))

(assert (=> b!1565886 m!1440245))

(assert (=> b!1565886 m!1440135))

(assert (=> b!1565886 m!1440253))

(assert (=> b!1565886 m!1440135))

(assert (=> b!1565889 m!1440237))

(assert (=> b!1565889 m!1440237))

(declare-fun m!1440257 () Bool)

(assert (=> b!1565889 m!1440257))

(declare-fun m!1440259 () Bool)

(assert (=> b!1565890 m!1440259))

(assert (=> b!1565891 m!1440237))

(assert (=> b!1565891 m!1440237))

(assert (=> b!1565891 m!1440239))

(declare-fun m!1440261 () Bool)

(assert (=> b!1565884 m!1440261))

(assert (=> bm!71847 m!1440259))

(assert (=> b!1565769 d!162965))

(declare-fun d!162967 () Bool)

(assert (=> d!162967 (not (contains!10306 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672316 () Unit!51846)

(declare-fun choose!2084 (ListLongMap!22755 (_ BitVec 64) V!60153 (_ BitVec 64)) Unit!51846)

(assert (=> d!162967 (= lt!672316 (choose!2084 lt!672253 (select (arr!50455 _keys!637) from!782) lt!672256 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872773 () Bool)

(assert (=> d!162967 e!872773))

(declare-fun res!1070449 () Bool)

(assert (=> d!162967 (=> (not res!1070449) (not e!872773))))

(assert (=> d!162967 (= res!1070449 (not (contains!10306 lt!672253 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!162967 (= (addStillNotContains!561 lt!672253 (select (arr!50455 _keys!637) from!782) lt!672256 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672316)))

(declare-fun b!1565898 () Bool)

(assert (=> b!1565898 (= e!872773 (not (= (select (arr!50455 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162967 res!1070449) b!1565898))

(assert (=> d!162967 m!1440145))

(assert (=> d!162967 m!1440145))

(declare-fun m!1440263 () Bool)

(assert (=> d!162967 m!1440263))

(assert (=> d!162967 m!1440119))

(declare-fun m!1440265 () Bool)

(assert (=> d!162967 m!1440265))

(declare-fun m!1440267 () Bool)

(assert (=> d!162967 m!1440267))

(assert (=> b!1565769 d!162967))

(declare-fun d!162969 () Bool)

(declare-fun e!872775 () Bool)

(assert (=> d!162969 e!872775))

(declare-fun res!1070450 () Bool)

(assert (=> d!162969 (=> res!1070450 e!872775)))

(declare-fun lt!672319 () Bool)

(assert (=> d!162969 (= res!1070450 (not lt!672319))))

(declare-fun lt!672320 () Bool)

(assert (=> d!162969 (= lt!672319 lt!672320)))

(declare-fun lt!672318 () Unit!51846)

(declare-fun e!872774 () Unit!51846)

(assert (=> d!162969 (= lt!672318 e!872774)))

(declare-fun c!144232 () Bool)

(assert (=> d!162969 (= c!144232 lt!672320)))

(assert (=> d!162969 (= lt!672320 (containsKey!849 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162969 (= (contains!10306 lt!672254 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672319)))

(declare-fun b!1565899 () Bool)

(declare-fun lt!672317 () Unit!51846)

(assert (=> b!1565899 (= e!872774 lt!672317)))

(assert (=> b!1565899 (= lt!672317 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565899 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565900 () Bool)

(declare-fun Unit!51849 () Unit!51846)

(assert (=> b!1565900 (= e!872774 Unit!51849)))

(declare-fun b!1565901 () Bool)

(assert (=> b!1565901 (= e!872775 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162969 c!144232) b!1565899))

(assert (= (and d!162969 (not c!144232)) b!1565900))

(assert (= (and d!162969 (not res!1070450)) b!1565901))

(declare-fun m!1440269 () Bool)

(assert (=> d!162969 m!1440269))

(declare-fun m!1440271 () Bool)

(assert (=> b!1565899 m!1440271))

(declare-fun m!1440273 () Bool)

(assert (=> b!1565899 m!1440273))

(assert (=> b!1565899 m!1440273))

(declare-fun m!1440275 () Bool)

(assert (=> b!1565899 m!1440275))

(assert (=> b!1565901 m!1440273))

(assert (=> b!1565901 m!1440273))

(assert (=> b!1565901 m!1440275))

(assert (=> b!1565769 d!162969))

(declare-fun d!162971 () Bool)

(declare-fun e!872778 () Bool)

(assert (=> d!162971 e!872778))

(declare-fun res!1070456 () Bool)

(assert (=> d!162971 (=> (not res!1070456) (not e!872778))))

(declare-fun lt!672330 () ListLongMap!22755)

(assert (=> d!162971 (= res!1070456 (contains!10306 lt!672330 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun lt!672331 () List!36678)

(assert (=> d!162971 (= lt!672330 (ListLongMap!22756 lt!672331))))

(declare-fun lt!672332 () Unit!51846)

(declare-fun lt!672329 () Unit!51846)

(assert (=> d!162971 (= lt!672332 lt!672329)))

(assert (=> d!162971 (= (getValueByKey!796 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun lemmaContainsTupThenGetReturnValue!388 (List!36678 (_ BitVec 64) V!60153) Unit!51846)

(assert (=> d!162971 (= lt!672329 (lemmaContainsTupThenGetReturnValue!388 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun insertStrictlySorted!578 (List!36678 (_ BitVec 64) V!60153) List!36678)

(assert (=> d!162971 (= lt!672331 (insertStrictlySorted!578 (toList!11393 lt!672253) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (=> d!162971 (= (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) lt!672330)))

(declare-fun b!1565906 () Bool)

(declare-fun res!1070455 () Bool)

(assert (=> b!1565906 (=> (not res!1070455) (not e!872778))))

(assert (=> b!1565906 (= res!1070455 (= (getValueByKey!796 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1565907 () Bool)

(declare-fun contains!10307 (List!36678 tuple2!25320) Bool)

(assert (=> b!1565907 (= e!872778 (contains!10307 (toList!11393 lt!672330) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))

(assert (= (and d!162971 res!1070456) b!1565906))

(assert (= (and b!1565906 res!1070455) b!1565907))

(declare-fun m!1440277 () Bool)

(assert (=> d!162971 m!1440277))

(declare-fun m!1440279 () Bool)

(assert (=> d!162971 m!1440279))

(declare-fun m!1440281 () Bool)

(assert (=> d!162971 m!1440281))

(declare-fun m!1440283 () Bool)

(assert (=> d!162971 m!1440283))

(declare-fun m!1440285 () Bool)

(assert (=> b!1565906 m!1440285))

(declare-fun m!1440287 () Bool)

(assert (=> b!1565907 m!1440287))

(assert (=> b!1565769 d!162971))

(declare-fun d!162973 () Bool)

(assert (=> d!162973 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133912 d!162973))

(declare-fun d!162975 () Bool)

(assert (=> d!162975 (= (array_inv!39407 _keys!637) (bvsge (size!51007 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133912 d!162975))

(declare-fun d!162977 () Bool)

(assert (=> d!162977 (= (array_inv!39408 _values!487) (bvsge (size!51008 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133912 d!162977))

(declare-fun b!1565918 () Bool)

(declare-fun e!872789 () Bool)

(declare-fun call!71853 () Bool)

(assert (=> b!1565918 (= e!872789 call!71853)))

(declare-fun b!1565919 () Bool)

(declare-fun e!872788 () Bool)

(declare-fun contains!10308 (List!36679 (_ BitVec 64)) Bool)

(assert (=> b!1565919 (= e!872788 (contains!10308 Nil!36676 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71850 () Bool)

(declare-fun c!144235 () Bool)

(assert (=> bm!71850 (= call!71853 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)))))

(declare-fun b!1565920 () Bool)

(declare-fun e!872787 () Bool)

(declare-fun e!872790 () Bool)

(assert (=> b!1565920 (= e!872787 e!872790)))

(declare-fun res!1070465 () Bool)

(assert (=> b!1565920 (=> (not res!1070465) (not e!872790))))

(assert (=> b!1565920 (= res!1070465 (not e!872788))))

(declare-fun res!1070464 () Bool)

(assert (=> b!1565920 (=> (not res!1070464) (not e!872788))))

(assert (=> b!1565920 (= res!1070464 (validKeyInArray!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565921 () Bool)

(assert (=> b!1565921 (= e!872789 call!71853)))

(declare-fun d!162979 () Bool)

(declare-fun res!1070463 () Bool)

(assert (=> d!162979 (=> res!1070463 e!872787)))

(assert (=> d!162979 (= res!1070463 (bvsge #b00000000000000000000000000000000 (size!51007 _keys!637)))))

(assert (=> d!162979 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36676) e!872787)))

(declare-fun b!1565922 () Bool)

(assert (=> b!1565922 (= e!872790 e!872789)))

(assert (=> b!1565922 (= c!144235 (validKeyInArray!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!162979 (not res!1070463)) b!1565920))

(assert (= (and b!1565920 res!1070464) b!1565919))

(assert (= (and b!1565920 res!1070465) b!1565922))

(assert (= (and b!1565922 c!144235) b!1565918))

(assert (= (and b!1565922 (not c!144235)) b!1565921))

(assert (= (or b!1565918 b!1565921) bm!71850))

(declare-fun m!1440289 () Bool)

(assert (=> b!1565919 m!1440289))

(assert (=> b!1565919 m!1440289))

(declare-fun m!1440291 () Bool)

(assert (=> b!1565919 m!1440291))

(assert (=> bm!71850 m!1440289))

(declare-fun m!1440293 () Bool)

(assert (=> bm!71850 m!1440293))

(assert (=> b!1565920 m!1440289))

(assert (=> b!1565920 m!1440289))

(declare-fun m!1440295 () Bool)

(assert (=> b!1565920 m!1440295))

(assert (=> b!1565922 m!1440289))

(assert (=> b!1565922 m!1440289))

(assert (=> b!1565922 m!1440295))

(assert (=> b!1565765 d!162979))

(declare-fun d!162981 () Bool)

(declare-fun e!872792 () Bool)

(assert (=> d!162981 e!872792))

(declare-fun res!1070466 () Bool)

(assert (=> d!162981 (=> res!1070466 e!872792)))

(declare-fun lt!672335 () Bool)

(assert (=> d!162981 (= res!1070466 (not lt!672335))))

(declare-fun lt!672336 () Bool)

(assert (=> d!162981 (= lt!672335 lt!672336)))

(declare-fun lt!672334 () Unit!51846)

(declare-fun e!872791 () Unit!51846)

(assert (=> d!162981 (= lt!672334 e!872791)))

(declare-fun c!144236 () Bool)

(assert (=> d!162981 (= c!144236 lt!672336)))

(assert (=> d!162981 (= lt!672336 (containsKey!849 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))

(assert (=> d!162981 (= (contains!10306 lt!672254 (select (arr!50455 _keys!637) from!782)) lt!672335)))

(declare-fun b!1565923 () Bool)

(declare-fun lt!672333 () Unit!51846)

(assert (=> b!1565923 (= e!872791 lt!672333)))

(assert (=> b!1565923 (= lt!672333 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))

(assert (=> b!1565923 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))

(declare-fun b!1565924 () Bool)

(declare-fun Unit!51850 () Unit!51846)

(assert (=> b!1565924 (= e!872791 Unit!51850)))

(declare-fun b!1565925 () Bool)

(assert (=> b!1565925 (= e!872792 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782))))))

(assert (= (and d!162981 c!144236) b!1565923))

(assert (= (and d!162981 (not c!144236)) b!1565924))

(assert (= (and d!162981 (not res!1070466)) b!1565925))

(assert (=> d!162981 m!1440119))

(declare-fun m!1440297 () Bool)

(assert (=> d!162981 m!1440297))

(assert (=> b!1565923 m!1440119))

(declare-fun m!1440299 () Bool)

(assert (=> b!1565923 m!1440299))

(assert (=> b!1565923 m!1440119))

(declare-fun m!1440301 () Bool)

(assert (=> b!1565923 m!1440301))

(assert (=> b!1565923 m!1440301))

(declare-fun m!1440303 () Bool)

(assert (=> b!1565923 m!1440303))

(assert (=> b!1565925 m!1440119))

(assert (=> b!1565925 m!1440301))

(assert (=> b!1565925 m!1440301))

(assert (=> b!1565925 m!1440303))

(assert (=> b!1565764 d!162981))

(declare-fun b!1565934 () Bool)

(declare-fun e!872801 () Bool)

(declare-fun call!71856 () Bool)

(assert (=> b!1565934 (= e!872801 call!71856)))

(declare-fun d!162983 () Bool)

(declare-fun res!1070472 () Bool)

(declare-fun e!872799 () Bool)

(assert (=> d!162983 (=> res!1070472 e!872799)))

(assert (=> d!162983 (= res!1070472 (bvsge #b00000000000000000000000000000000 (size!51007 _keys!637)))))

(assert (=> d!162983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872799)))

(declare-fun bm!71853 () Bool)

(assert (=> bm!71853 (= call!71856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1565935 () Bool)

(declare-fun e!872800 () Bool)

(assert (=> b!1565935 (= e!872801 e!872800)))

(declare-fun lt!672345 () (_ BitVec 64))

(assert (=> b!1565935 (= lt!672345 (select (arr!50455 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672344 () Unit!51846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104534 (_ BitVec 64) (_ BitVec 32)) Unit!51846)

(assert (=> b!1565935 (= lt!672344 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672345 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1565935 (arrayContainsKey!0 _keys!637 lt!672345 #b00000000000000000000000000000000)))

(declare-fun lt!672343 () Unit!51846)

(assert (=> b!1565935 (= lt!672343 lt!672344)))

(declare-fun res!1070471 () Bool)

(declare-datatypes ((SeekEntryResult!13526 0))(
  ( (MissingZero!13526 (index!56502 (_ BitVec 32))) (Found!13526 (index!56503 (_ BitVec 32))) (Intermediate!13526 (undefined!14338 Bool) (index!56504 (_ BitVec 32)) (x!140744 (_ BitVec 32))) (Undefined!13526) (MissingVacant!13526 (index!56505 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104534 (_ BitVec 32)) SeekEntryResult!13526)

(assert (=> b!1565935 (= res!1070471 (= (seekEntryOrOpen!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13526 #b00000000000000000000000000000000)))))

(assert (=> b!1565935 (=> (not res!1070471) (not e!872800))))

(declare-fun b!1565936 () Bool)

(assert (=> b!1565936 (= e!872799 e!872801)))

(declare-fun c!144239 () Bool)

(assert (=> b!1565936 (= c!144239 (validKeyInArray!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565937 () Bool)

(assert (=> b!1565937 (= e!872800 call!71856)))

(assert (= (and d!162983 (not res!1070472)) b!1565936))

(assert (= (and b!1565936 c!144239) b!1565935))

(assert (= (and b!1565936 (not c!144239)) b!1565934))

(assert (= (and b!1565935 res!1070471) b!1565937))

(assert (= (or b!1565937 b!1565934) bm!71853))

(declare-fun m!1440305 () Bool)

(assert (=> bm!71853 m!1440305))

(assert (=> b!1565935 m!1440289))

(declare-fun m!1440307 () Bool)

(assert (=> b!1565935 m!1440307))

(declare-fun m!1440309 () Bool)

(assert (=> b!1565935 m!1440309))

(assert (=> b!1565935 m!1440289))

(declare-fun m!1440311 () Bool)

(assert (=> b!1565935 m!1440311))

(assert (=> b!1565936 m!1440289))

(assert (=> b!1565936 m!1440289))

(assert (=> b!1565936 m!1440295))

(assert (=> b!1565768 d!162983))

(declare-fun d!162985 () Bool)

(assert (=> d!162985 (= (validKeyInArray!0 (select (arr!50455 _keys!637) from!782)) (and (not (= (select (arr!50455 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50455 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1565770 d!162985))

(declare-fun d!162987 () Bool)

(declare-fun get!26362 (Option!871) V!60153)

(assert (=> d!162987 (= (apply!1105 lt!672254 (select (arr!50455 _keys!637) from!782)) (get!26362 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782))))))

(declare-fun bs!45021 () Bool)

(assert (= bs!45021 d!162987))

(assert (=> bs!45021 m!1440119))

(assert (=> bs!45021 m!1440301))

(assert (=> bs!45021 m!1440301))

(declare-fun m!1440313 () Bool)

(assert (=> bs!45021 m!1440313))

(assert (=> b!1565762 d!162987))

(declare-fun mapIsEmpty!59839 () Bool)

(declare-fun mapRes!59839 () Bool)

(assert (=> mapIsEmpty!59839 mapRes!59839))

(declare-fun mapNonEmpty!59839 () Bool)

(declare-fun tp!113873 () Bool)

(declare-fun e!872807 () Bool)

(assert (=> mapNonEmpty!59839 (= mapRes!59839 (and tp!113873 e!872807))))

(declare-fun mapRest!59839 () (Array (_ BitVec 32) ValueCell!18449))

(declare-fun mapKey!59839 () (_ BitVec 32))

(declare-fun mapValue!59839 () ValueCell!18449)

(assert (=> mapNonEmpty!59839 (= mapRest!59830 (store mapRest!59839 mapKey!59839 mapValue!59839))))

(declare-fun condMapEmpty!59839 () Bool)

(declare-fun mapDefault!59839 () ValueCell!18449)

(assert (=> mapNonEmpty!59830 (= condMapEmpty!59839 (= mapRest!59830 ((as const (Array (_ BitVec 32) ValueCell!18449)) mapDefault!59839)))))

(declare-fun e!872806 () Bool)

(assert (=> mapNonEmpty!59830 (= tp!113857 (and e!872806 mapRes!59839))))

(declare-fun b!1565945 () Bool)

(assert (=> b!1565945 (= e!872806 tp_is_empty!38959)))

(declare-fun b!1565944 () Bool)

(assert (=> b!1565944 (= e!872807 tp_is_empty!38959)))

(assert (= (and mapNonEmpty!59830 condMapEmpty!59839) mapIsEmpty!59839))

(assert (= (and mapNonEmpty!59830 (not condMapEmpty!59839)) mapNonEmpty!59839))

(assert (= (and mapNonEmpty!59839 ((_ is ValueCellFull!18449) mapValue!59839)) b!1565944))

(assert (= (and mapNonEmpty!59830 ((_ is ValueCellFull!18449) mapDefault!59839)) b!1565945))

(declare-fun m!1440315 () Bool)

(assert (=> mapNonEmpty!59839 m!1440315))

(declare-fun b_lambda!25001 () Bool)

(assert (= b_lambda!24999 (or (and start!133912 b_free!32185) b_lambda!25001)))

(declare-fun b_lambda!25003 () Bool)

(assert (= b_lambda!24997 (or (and start!133912 b_free!32185) b_lambda!25003)))

(check-sat (not b!1565849) (not b!1565906) (not d!162981) (not b!1565884) (not b!1565922) (not b!1565889) (not b!1565901) (not b!1565858) (not b!1565936) (not d!162969) (not b!1565891) (not bm!71847) (not b!1565883) (not b!1565899) (not b!1565888) (not mapNonEmpty!59839) (not d!162967) (not b!1565893) (not d!162971) (not b_next!32185) (not b!1565890) (not b!1565920) (not b_lambda!25003) (not b!1565919) (not b!1565856) (not d!162965) (not bm!71853) (not b!1565907) (not d!162963) (not b!1565935) (not b_lambda!25001) (not b!1565848) (not b!1565923) (not bm!71850) (not b!1565886) (not d!162987) tp_is_empty!38959 (not b!1565925) (not b_lambda!24995) b_and!51807)
(check-sat b_and!51807 (not b_next!32185))
(get-model)

(declare-fun d!162989 () Bool)

(declare-fun res!1070477 () Bool)

(declare-fun e!872812 () Bool)

(assert (=> d!162989 (=> res!1070477 e!872812)))

(assert (=> d!162989 (= res!1070477 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (= (_1!12671 (h!38121 (toList!11393 lt!672254))) (select (arr!50455 _keys!637) from!782))))))

(assert (=> d!162989 (= (containsKey!849 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)) e!872812)))

(declare-fun b!1565950 () Bool)

(declare-fun e!872813 () Bool)

(assert (=> b!1565950 (= e!872812 e!872813)))

(declare-fun res!1070478 () Bool)

(assert (=> b!1565950 (=> (not res!1070478) (not e!872813))))

(assert (=> b!1565950 (= res!1070478 (and (or (not ((_ is Cons!36674) (toList!11393 lt!672254))) (bvsle (_1!12671 (h!38121 (toList!11393 lt!672254))) (select (arr!50455 _keys!637) from!782))) ((_ is Cons!36674) (toList!11393 lt!672254)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672254))) (select (arr!50455 _keys!637) from!782))))))

(declare-fun b!1565951 () Bool)

(assert (=> b!1565951 (= e!872813 (containsKey!849 (t!51569 (toList!11393 lt!672254)) (select (arr!50455 _keys!637) from!782)))))

(assert (= (and d!162989 (not res!1070477)) b!1565950))

(assert (= (and b!1565950 res!1070478) b!1565951))

(assert (=> b!1565951 m!1440119))

(declare-fun m!1440317 () Bool)

(assert (=> b!1565951 m!1440317))

(assert (=> d!162981 d!162989))

(declare-fun d!162991 () Bool)

(assert (=> d!162991 (= (get!26362 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782))) (v!22318 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782))))))

(assert (=> d!162987 d!162991))

(declare-fun b!1565961 () Bool)

(declare-fun e!872818 () Option!871)

(declare-fun e!872819 () Option!871)

(assert (=> b!1565961 (= e!872818 e!872819)))

(declare-fun c!144245 () Bool)

(assert (=> b!1565961 (= c!144245 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672254))) (select (arr!50455 _keys!637) from!782)))))))

(declare-fun b!1565960 () Bool)

(assert (=> b!1565960 (= e!872818 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672254)))))))

(declare-fun c!144244 () Bool)

(declare-fun d!162993 () Bool)

(assert (=> d!162993 (= c!144244 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (= (_1!12671 (h!38121 (toList!11393 lt!672254))) (select (arr!50455 _keys!637) from!782))))))

(assert (=> d!162993 (= (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)) e!872818)))

(declare-fun b!1565963 () Bool)

(assert (=> b!1565963 (= e!872819 None!869)))

(declare-fun b!1565962 () Bool)

(assert (=> b!1565962 (= e!872819 (getValueByKey!796 (t!51569 (toList!11393 lt!672254)) (select (arr!50455 _keys!637) from!782)))))

(assert (= (and d!162993 c!144244) b!1565960))

(assert (= (and d!162993 (not c!144244)) b!1565961))

(assert (= (and b!1565961 c!144245) b!1565962))

(assert (= (and b!1565961 (not c!144245)) b!1565963))

(assert (=> b!1565962 m!1440119))

(declare-fun m!1440319 () Bool)

(assert (=> b!1565962 m!1440319))

(assert (=> d!162987 d!162993))

(declare-fun d!162995 () Bool)

(assert (=> d!162995 (= (apply!1105 lt!672313 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26362 (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(declare-fun bs!45022 () Bool)

(assert (= bs!45022 d!162995))

(assert (=> bs!45022 m!1440237))

(declare-fun m!1440321 () Bool)

(assert (=> bs!45022 m!1440321))

(assert (=> bs!45022 m!1440321))

(declare-fun m!1440323 () Bool)

(assert (=> bs!45022 m!1440323))

(assert (=> b!1565886 d!162995))

(declare-fun d!162997 () Bool)

(declare-fun c!144246 () Bool)

(assert (=> d!162997 (= c!144246 ((_ is ValueCellFull!18449) (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun e!872820 () V!60153)

(assert (=> d!162997 (= (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!872820)))

(declare-fun b!1565964 () Bool)

(assert (=> b!1565964 (= e!872820 (get!26360 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565965 () Bool)

(assert (=> b!1565965 (= e!872820 (get!26361 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162997 c!144246) b!1565964))

(assert (= (and d!162997 (not c!144246)) b!1565965))

(assert (=> b!1565964 m!1440245))

(assert (=> b!1565964 m!1440135))

(declare-fun m!1440325 () Bool)

(assert (=> b!1565964 m!1440325))

(assert (=> b!1565965 m!1440245))

(assert (=> b!1565965 m!1440135))

(declare-fun m!1440327 () Bool)

(assert (=> b!1565965 m!1440327))

(assert (=> b!1565886 d!162997))

(declare-fun d!162999 () Bool)

(declare-fun e!872822 () Bool)

(assert (=> d!162999 e!872822))

(declare-fun res!1070479 () Bool)

(assert (=> d!162999 (=> res!1070479 e!872822)))

(declare-fun lt!672348 () Bool)

(assert (=> d!162999 (= res!1070479 (not lt!672348))))

(declare-fun lt!672349 () Bool)

(assert (=> d!162999 (= lt!672348 lt!672349)))

(declare-fun lt!672347 () Unit!51846)

(declare-fun e!872821 () Unit!51846)

(assert (=> d!162999 (= lt!672347 e!872821)))

(declare-fun c!144247 () Bool)

(assert (=> d!162999 (= c!144247 lt!672349)))

(assert (=> d!162999 (= lt!672349 (containsKey!849 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162999 (= (contains!10306 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672348)))

(declare-fun b!1565966 () Bool)

(declare-fun lt!672346 () Unit!51846)

(assert (=> b!1565966 (= e!872821 lt!672346)))

(assert (=> b!1565966 (= lt!672346 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565966 (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565967 () Bool)

(declare-fun Unit!51851 () Unit!51846)

(assert (=> b!1565967 (= e!872821 Unit!51851)))

(declare-fun b!1565968 () Bool)

(assert (=> b!1565968 (= e!872822 (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162999 c!144247) b!1565966))

(assert (= (and d!162999 (not c!144247)) b!1565967))

(assert (= (and d!162999 (not res!1070479)) b!1565968))

(declare-fun m!1440329 () Bool)

(assert (=> d!162999 m!1440329))

(declare-fun m!1440331 () Bool)

(assert (=> b!1565966 m!1440331))

(declare-fun m!1440333 () Bool)

(assert (=> b!1565966 m!1440333))

(assert (=> b!1565966 m!1440333))

(declare-fun m!1440335 () Bool)

(assert (=> b!1565966 m!1440335))

(assert (=> b!1565968 m!1440333))

(assert (=> b!1565968 m!1440333))

(assert (=> b!1565968 m!1440335))

(assert (=> d!162967 d!162999))

(assert (=> d!162967 d!162971))

(declare-fun d!163001 () Bool)

(assert (=> d!163001 (not (contains!10306 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163001 true))

(declare-fun _$36!388 () Unit!51846)

(assert (=> d!163001 (= (choose!2084 lt!672253 (select (arr!50455 _keys!637) from!782) lt!672256 #b0000000000000000000000000000000000000000000000000000000000000000) _$36!388)))

(declare-fun bs!45023 () Bool)

(assert (= bs!45023 d!163001))

(assert (=> bs!45023 m!1440145))

(assert (=> bs!45023 m!1440145))

(assert (=> bs!45023 m!1440263))

(assert (=> d!162967 d!163001))

(declare-fun d!163003 () Bool)

(declare-fun e!872824 () Bool)

(assert (=> d!163003 e!872824))

(declare-fun res!1070480 () Bool)

(assert (=> d!163003 (=> res!1070480 e!872824)))

(declare-fun lt!672352 () Bool)

(assert (=> d!163003 (= res!1070480 (not lt!672352))))

(declare-fun lt!672353 () Bool)

(assert (=> d!163003 (= lt!672352 lt!672353)))

(declare-fun lt!672351 () Unit!51846)

(declare-fun e!872823 () Unit!51846)

(assert (=> d!163003 (= lt!672351 e!872823)))

(declare-fun c!144248 () Bool)

(assert (=> d!163003 (= c!144248 lt!672353)))

(assert (=> d!163003 (= lt!672353 (containsKey!849 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163003 (= (contains!10306 lt!672253 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672352)))

(declare-fun b!1565970 () Bool)

(declare-fun lt!672350 () Unit!51846)

(assert (=> b!1565970 (= e!872823 lt!672350)))

(assert (=> b!1565970 (= lt!672350 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565970 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565971 () Bool)

(declare-fun Unit!51852 () Unit!51846)

(assert (=> b!1565971 (= e!872823 Unit!51852)))

(declare-fun b!1565972 () Bool)

(assert (=> b!1565972 (= e!872824 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163003 c!144248) b!1565970))

(assert (= (and d!163003 (not c!144248)) b!1565971))

(assert (= (and d!163003 (not res!1070480)) b!1565972))

(declare-fun m!1440337 () Bool)

(assert (=> d!163003 m!1440337))

(declare-fun m!1440339 () Bool)

(assert (=> b!1565970 m!1440339))

(declare-fun m!1440341 () Bool)

(assert (=> b!1565970 m!1440341))

(assert (=> b!1565970 m!1440341))

(declare-fun m!1440343 () Bool)

(assert (=> b!1565970 m!1440343))

(assert (=> b!1565972 m!1440341))

(assert (=> b!1565972 m!1440341))

(assert (=> b!1565972 m!1440343))

(assert (=> d!162967 d!163003))

(declare-fun b!1565973 () Bool)

(declare-fun e!872826 () Bool)

(assert (=> b!1565973 (= e!872826 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1565973 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!163005 () Bool)

(declare-fun e!872831 () Bool)

(assert (=> d!163005 e!872831))

(declare-fun res!1070482 () Bool)

(assert (=> d!163005 (=> (not res!1070482) (not e!872831))))

(declare-fun lt!672360 () ListLongMap!22755)

(assert (=> d!163005 (= res!1070482 (not (contains!10306 lt!672360 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!872829 () ListLongMap!22755)

(assert (=> d!163005 (= lt!672360 e!872829)))

(declare-fun c!144252 () Bool)

(assert (=> d!163005 (= c!144252 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(assert (=> d!163005 (validMask!0 mask!947)))

(assert (=> d!163005 (= (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495) lt!672360)))

(declare-fun b!1565974 () Bool)

(declare-fun e!872827 () Bool)

(assert (=> b!1565974 (= e!872827 (isEmpty!1151 lt!672360))))

(declare-fun b!1565975 () Bool)

(declare-fun e!872825 () Bool)

(assert (=> b!1565975 (= e!872825 e!872827)))

(declare-fun c!144251 () Bool)

(assert (=> b!1565975 (= c!144251 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun b!1565976 () Bool)

(assert (=> b!1565976 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(assert (=> b!1565976 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51008 _values!487)))))

(declare-fun e!872828 () Bool)

(assert (=> b!1565976 (= e!872828 (= (apply!1105 lt!672360 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1565977 () Bool)

(declare-fun e!872830 () ListLongMap!22755)

(declare-fun call!71857 () ListLongMap!22755)

(assert (=> b!1565977 (= e!872830 call!71857)))

(declare-fun b!1565978 () Bool)

(declare-fun res!1070483 () Bool)

(assert (=> b!1565978 (=> (not res!1070483) (not e!872831))))

(assert (=> b!1565978 (= res!1070483 (not (contains!10306 lt!672360 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565979 () Bool)

(assert (=> b!1565979 (= e!872825 e!872828)))

(assert (=> b!1565979 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun res!1070484 () Bool)

(assert (=> b!1565979 (= res!1070484 (contains!10306 lt!672360 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1565979 (=> (not res!1070484) (not e!872828))))

(declare-fun b!1565980 () Bool)

(assert (=> b!1565980 (= e!872827 (= lt!672360 (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1565981 () Bool)

(assert (=> b!1565981 (= e!872829 e!872830)))

(declare-fun c!144249 () Bool)

(assert (=> b!1565981 (= c!144249 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun bm!71854 () Bool)

(assert (=> bm!71854 (= call!71857 (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1565982 () Bool)

(assert (=> b!1565982 (= e!872831 e!872825)))

(declare-fun c!144250 () Bool)

(assert (=> b!1565982 (= c!144250 e!872826)))

(declare-fun res!1070481 () Bool)

(assert (=> b!1565982 (=> (not res!1070481) (not e!872826))))

(assert (=> b!1565982 (= res!1070481 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun b!1565983 () Bool)

(declare-fun lt!672355 () Unit!51846)

(declare-fun lt!672356 () Unit!51846)

(assert (=> b!1565983 (= lt!672355 lt!672356)))

(declare-fun lt!672354 () (_ BitVec 64))

(declare-fun lt!672359 () V!60153)

(declare-fun lt!672358 () ListLongMap!22755)

(declare-fun lt!672357 () (_ BitVec 64))

(assert (=> b!1565983 (not (contains!10306 (+!5114 lt!672358 (tuple2!25321 lt!672354 lt!672359)) lt!672357))))

(assert (=> b!1565983 (= lt!672356 (addStillNotContains!561 lt!672358 lt!672354 lt!672359 lt!672357))))

(assert (=> b!1565983 (= lt!672357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1565983 (= lt!672359 (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1565983 (= lt!672354 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))

(assert (=> b!1565983 (= lt!672358 call!71857)))

(assert (=> b!1565983 (= e!872830 (+!5114 call!71857 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1565984 () Bool)

(assert (=> b!1565984 (= e!872829 (ListLongMap!22756 Nil!36675))))

(assert (= (and d!163005 c!144252) b!1565984))

(assert (= (and d!163005 (not c!144252)) b!1565981))

(assert (= (and b!1565981 c!144249) b!1565983))

(assert (= (and b!1565981 (not c!144249)) b!1565977))

(assert (= (or b!1565983 b!1565977) bm!71854))

(assert (= (and d!163005 res!1070482) b!1565978))

(assert (= (and b!1565978 res!1070483) b!1565982))

(assert (= (and b!1565982 res!1070481) b!1565973))

(assert (= (and b!1565982 c!144250) b!1565979))

(assert (= (and b!1565982 (not c!144250)) b!1565975))

(assert (= (and b!1565979 res!1070484) b!1565976))

(assert (= (and b!1565975 c!144251) b!1565980))

(assert (= (and b!1565975 (not c!144251)) b!1565974))

(declare-fun b_lambda!25005 () Bool)

(assert (=> (not b_lambda!25005) (not b!1565976)))

(assert (=> b!1565976 t!51568))

(declare-fun b_and!51809 () Bool)

(assert (= b_and!51807 (and (=> t!51568 result!26589) b_and!51809)))

(declare-fun b_lambda!25007 () Bool)

(assert (=> (not b_lambda!25007) (not b!1565983)))

(assert (=> b!1565983 t!51568))

(declare-fun b_and!51811 () Bool)

(assert (= b_and!51809 (and (=> t!51568 result!26589) b_and!51811)))

(declare-fun m!1440345 () Bool)

(assert (=> b!1565978 m!1440345))

(declare-fun m!1440347 () Bool)

(assert (=> b!1565973 m!1440347))

(assert (=> b!1565973 m!1440347))

(declare-fun m!1440349 () Bool)

(assert (=> b!1565973 m!1440349))

(declare-fun m!1440351 () Bool)

(assert (=> d!163005 m!1440351))

(assert (=> d!163005 m!1440123))

(assert (=> b!1565983 m!1440347))

(declare-fun m!1440353 () Bool)

(assert (=> b!1565983 m!1440353))

(declare-fun m!1440355 () Bool)

(assert (=> b!1565983 m!1440355))

(declare-fun m!1440357 () Bool)

(assert (=> b!1565983 m!1440357))

(declare-fun m!1440359 () Bool)

(assert (=> b!1565983 m!1440359))

(assert (=> b!1565983 m!1440357))

(declare-fun m!1440361 () Bool)

(assert (=> b!1565983 m!1440361))

(assert (=> b!1565983 m!1440355))

(assert (=> b!1565983 m!1440135))

(declare-fun m!1440363 () Bool)

(assert (=> b!1565983 m!1440363))

(assert (=> b!1565983 m!1440135))

(assert (=> b!1565976 m!1440347))

(declare-fun m!1440365 () Bool)

(assert (=> b!1565976 m!1440365))

(assert (=> b!1565976 m!1440347))

(assert (=> b!1565976 m!1440355))

(assert (=> b!1565976 m!1440355))

(assert (=> b!1565976 m!1440135))

(assert (=> b!1565976 m!1440363))

(assert (=> b!1565976 m!1440135))

(assert (=> b!1565979 m!1440347))

(assert (=> b!1565979 m!1440347))

(declare-fun m!1440367 () Bool)

(assert (=> b!1565979 m!1440367))

(declare-fun m!1440369 () Bool)

(assert (=> b!1565980 m!1440369))

(assert (=> b!1565981 m!1440347))

(assert (=> b!1565981 m!1440347))

(assert (=> b!1565981 m!1440349))

(declare-fun m!1440371 () Bool)

(assert (=> b!1565974 m!1440371))

(assert (=> bm!71854 m!1440369))

(assert (=> b!1565890 d!163005))

(declare-fun d!163007 () Bool)

(declare-fun e!872833 () Bool)

(assert (=> d!163007 e!872833))

(declare-fun res!1070485 () Bool)

(assert (=> d!163007 (=> res!1070485 e!872833)))

(declare-fun lt!672363 () Bool)

(assert (=> d!163007 (= res!1070485 (not lt!672363))))

(declare-fun lt!672364 () Bool)

(assert (=> d!163007 (= lt!672363 lt!672364)))

(declare-fun lt!672362 () Unit!51846)

(declare-fun e!872832 () Unit!51846)

(assert (=> d!163007 (= lt!672362 e!872832)))

(declare-fun c!144253 () Bool)

(assert (=> d!163007 (= c!144253 lt!672364)))

(assert (=> d!163007 (= lt!672364 (containsKey!849 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163007 (= (contains!10306 lt!672313 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672363)))

(declare-fun b!1565985 () Bool)

(declare-fun lt!672361 () Unit!51846)

(assert (=> b!1565985 (= e!872832 lt!672361)))

(assert (=> b!1565985 (= lt!672361 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565985 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565986 () Bool)

(declare-fun Unit!51853 () Unit!51846)

(assert (=> b!1565986 (= e!872832 Unit!51853)))

(declare-fun b!1565987 () Bool)

(assert (=> b!1565987 (= e!872833 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163007 c!144253) b!1565985))

(assert (= (and d!163007 (not c!144253)) b!1565986))

(assert (= (and d!163007 (not res!1070485)) b!1565987))

(declare-fun m!1440373 () Bool)

(assert (=> d!163007 m!1440373))

(declare-fun m!1440375 () Bool)

(assert (=> b!1565985 m!1440375))

(declare-fun m!1440377 () Bool)

(assert (=> b!1565985 m!1440377))

(assert (=> b!1565985 m!1440377))

(declare-fun m!1440379 () Bool)

(assert (=> b!1565985 m!1440379))

(assert (=> b!1565987 m!1440377))

(assert (=> b!1565987 m!1440377))

(assert (=> b!1565987 m!1440379))

(assert (=> b!1565888 d!163007))

(declare-fun d!163009 () Bool)

(declare-fun e!872835 () Bool)

(assert (=> d!163009 e!872835))

(declare-fun res!1070486 () Bool)

(assert (=> d!163009 (=> res!1070486 e!872835)))

(declare-fun lt!672367 () Bool)

(assert (=> d!163009 (= res!1070486 (not lt!672367))))

(declare-fun lt!672368 () Bool)

(assert (=> d!163009 (= lt!672367 lt!672368)))

(declare-fun lt!672366 () Unit!51846)

(declare-fun e!872834 () Unit!51846)

(assert (=> d!163009 (= lt!672366 e!872834)))

(declare-fun c!144254 () Bool)

(assert (=> d!163009 (= c!144254 lt!672368)))

(assert (=> d!163009 (= lt!672368 (containsKey!849 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> d!163009 (= (contains!10306 lt!672313 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) lt!672367)))

(declare-fun b!1565988 () Bool)

(declare-fun lt!672365 () Unit!51846)

(assert (=> b!1565988 (= e!872834 lt!672365)))

(assert (=> b!1565988 (= lt!672365 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565988 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1565989 () Bool)

(declare-fun Unit!51854 () Unit!51846)

(assert (=> b!1565989 (= e!872834 Unit!51854)))

(declare-fun b!1565990 () Bool)

(assert (=> b!1565990 (= e!872835 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (= (and d!163009 c!144254) b!1565988))

(assert (= (and d!163009 (not c!144254)) b!1565989))

(assert (= (and d!163009 (not res!1070486)) b!1565990))

(assert (=> d!163009 m!1440237))

(declare-fun m!1440381 () Bool)

(assert (=> d!163009 m!1440381))

(assert (=> b!1565988 m!1440237))

(declare-fun m!1440383 () Bool)

(assert (=> b!1565988 m!1440383))

(assert (=> b!1565988 m!1440237))

(assert (=> b!1565988 m!1440321))

(assert (=> b!1565988 m!1440321))

(declare-fun m!1440385 () Bool)

(assert (=> b!1565988 m!1440385))

(assert (=> b!1565990 m!1440237))

(assert (=> b!1565990 m!1440321))

(assert (=> b!1565990 m!1440321))

(assert (=> b!1565990 m!1440385))

(assert (=> b!1565889 d!163009))

(declare-fun b!1565992 () Bool)

(declare-fun e!872836 () Option!871)

(declare-fun e!872837 () Option!871)

(assert (=> b!1565992 (= e!872836 e!872837)))

(declare-fun c!144256 () Bool)

(assert (=> b!1565992 (= c!144256 (and ((_ is Cons!36674) (toList!11393 lt!672330)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672330))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))))

(declare-fun b!1565991 () Bool)

(assert (=> b!1565991 (= e!872836 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672330)))))))

(declare-fun d!163011 () Bool)

(declare-fun c!144255 () Bool)

(assert (=> d!163011 (= c!144255 (and ((_ is Cons!36674) (toList!11393 lt!672330)) (= (_1!12671 (h!38121 (toList!11393 lt!672330))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163011 (= (getValueByKey!796 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) e!872836)))

(declare-fun b!1565994 () Bool)

(assert (=> b!1565994 (= e!872837 None!869)))

(declare-fun b!1565993 () Bool)

(assert (=> b!1565993 (= e!872837 (getValueByKey!796 (t!51569 (toList!11393 lt!672330)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (= (and d!163011 c!144255) b!1565991))

(assert (= (and d!163011 (not c!144255)) b!1565992))

(assert (= (and b!1565992 c!144256) b!1565993))

(assert (= (and b!1565992 (not c!144256)) b!1565994))

(declare-fun m!1440387 () Bool)

(assert (=> b!1565993 m!1440387))

(assert (=> b!1565906 d!163011))

(declare-fun d!163013 () Bool)

(declare-fun isEmpty!1152 (List!36678) Bool)

(assert (=> d!163013 (= (isEmpty!1151 lt!672313) (isEmpty!1152 (toList!11393 lt!672313)))))

(declare-fun bs!45024 () Bool)

(assert (= bs!45024 d!163013))

(declare-fun m!1440389 () Bool)

(assert (=> bs!45024 m!1440389))

(assert (=> b!1565884 d!163013))

(declare-fun d!163015 () Bool)

(declare-fun isEmpty!1153 (Option!871) Bool)

(assert (=> d!163015 (= (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45025 () Bool)

(assert (= bs!45025 d!163015))

(assert (=> bs!45025 m!1440273))

(declare-fun m!1440391 () Bool)

(assert (=> bs!45025 m!1440391))

(assert (=> b!1565901 d!163015))

(declare-fun b!1565996 () Bool)

(declare-fun e!872838 () Option!871)

(declare-fun e!872839 () Option!871)

(assert (=> b!1565996 (= e!872838 e!872839)))

(declare-fun c!144258 () Bool)

(assert (=> b!1565996 (= c!144258 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672254))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1565995 () Bool)

(assert (=> b!1565995 (= e!872838 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672254)))))))

(declare-fun d!163017 () Bool)

(declare-fun c!144257 () Bool)

(assert (=> d!163017 (= c!144257 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (= (_1!12671 (h!38121 (toList!11393 lt!672254))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163017 (= (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000) e!872838)))

(declare-fun b!1565998 () Bool)

(assert (=> b!1565998 (= e!872839 None!869)))

(declare-fun b!1565997 () Bool)

(assert (=> b!1565997 (= e!872839 (getValueByKey!796 (t!51569 (toList!11393 lt!672254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163017 c!144257) b!1565995))

(assert (= (and d!163017 (not c!144257)) b!1565996))

(assert (= (and b!1565996 c!144258) b!1565997))

(assert (= (and b!1565996 (not c!144258)) b!1565998))

(declare-fun m!1440393 () Bool)

(assert (=> b!1565997 m!1440393))

(assert (=> b!1565901 d!163017))

(declare-fun d!163019 () Bool)

(assert (=> d!163019 (= (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (and (not (= (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1565883 d!163019))

(declare-fun d!163021 () Bool)

(assert (=> d!163021 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672371 () Unit!51846)

(declare-fun choose!2085 (List!36678 (_ BitVec 64)) Unit!51846)

(assert (=> d!163021 (= lt!672371 (choose!2085 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872842 () Bool)

(assert (=> d!163021 e!872842))

(declare-fun res!1070489 () Bool)

(assert (=> d!163021 (=> (not res!1070489) (not e!872842))))

(declare-fun isStrictlySorted!985 (List!36678) Bool)

(assert (=> d!163021 (= res!1070489 (isStrictlySorted!985 (toList!11393 lt!672254)))))

(assert (=> d!163021 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672371)))

(declare-fun b!1566001 () Bool)

(assert (=> b!1566001 (= e!872842 (containsKey!849 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163021 res!1070489) b!1566001))

(assert (=> d!163021 m!1440273))

(assert (=> d!163021 m!1440273))

(assert (=> d!163021 m!1440275))

(declare-fun m!1440395 () Bool)

(assert (=> d!163021 m!1440395))

(declare-fun m!1440397 () Bool)

(assert (=> d!163021 m!1440397))

(assert (=> b!1566001 m!1440269))

(assert (=> b!1565899 d!163021))

(assert (=> b!1565899 d!163015))

(assert (=> b!1565899 d!163017))

(declare-fun d!163023 () Bool)

(declare-fun e!872844 () Bool)

(assert (=> d!163023 e!872844))

(declare-fun res!1070490 () Bool)

(assert (=> d!163023 (=> res!1070490 e!872844)))

(declare-fun lt!672374 () Bool)

(assert (=> d!163023 (= res!1070490 (not lt!672374))))

(declare-fun lt!672375 () Bool)

(assert (=> d!163023 (= lt!672374 lt!672375)))

(declare-fun lt!672373 () Unit!51846)

(declare-fun e!872843 () Unit!51846)

(assert (=> d!163023 (= lt!672373 e!872843)))

(declare-fun c!144259 () Bool)

(assert (=> d!163023 (= c!144259 lt!672375)))

(assert (=> d!163023 (= lt!672375 (containsKey!849 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163023 (= (contains!10306 lt!672313 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672374)))

(declare-fun b!1566002 () Bool)

(declare-fun lt!672372 () Unit!51846)

(assert (=> b!1566002 (= e!872843 lt!672372)))

(assert (=> b!1566002 (= lt!672372 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566002 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566003 () Bool)

(declare-fun Unit!51855 () Unit!51846)

(assert (=> b!1566003 (= e!872843 Unit!51855)))

(declare-fun b!1566004 () Bool)

(assert (=> b!1566004 (= e!872844 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163023 c!144259) b!1566002))

(assert (= (and d!163023 (not c!144259)) b!1566003))

(assert (= (and d!163023 (not res!1070490)) b!1566004))

(declare-fun m!1440399 () Bool)

(assert (=> d!163023 m!1440399))

(declare-fun m!1440401 () Bool)

(assert (=> b!1566002 m!1440401))

(declare-fun m!1440403 () Bool)

(assert (=> b!1566002 m!1440403))

(assert (=> b!1566002 m!1440403))

(declare-fun m!1440405 () Bool)

(assert (=> b!1566002 m!1440405))

(assert (=> b!1566004 m!1440403))

(assert (=> b!1566004 m!1440403))

(assert (=> b!1566004 m!1440405))

(assert (=> d!162965 d!163023))

(assert (=> d!162965 d!162973))

(declare-fun d!163025 () Bool)

(declare-fun lt!672378 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!798 (List!36678) (InoxSet tuple2!25320))

(assert (=> d!163025 (= lt!672378 (select (content!798 (toList!11393 lt!672330)) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))

(declare-fun e!872849 () Bool)

(assert (=> d!163025 (= lt!672378 e!872849)))

(declare-fun res!1070495 () Bool)

(assert (=> d!163025 (=> (not res!1070495) (not e!872849))))

(assert (=> d!163025 (= res!1070495 ((_ is Cons!36674) (toList!11393 lt!672330)))))

(assert (=> d!163025 (= (contains!10307 (toList!11393 lt!672330) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) lt!672378)))

(declare-fun b!1566009 () Bool)

(declare-fun e!872850 () Bool)

(assert (=> b!1566009 (= e!872849 e!872850)))

(declare-fun res!1070496 () Bool)

(assert (=> b!1566009 (=> res!1070496 e!872850)))

(assert (=> b!1566009 (= res!1070496 (= (h!38121 (toList!11393 lt!672330)) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))

(declare-fun b!1566010 () Bool)

(assert (=> b!1566010 (= e!872850 (contains!10307 (t!51569 (toList!11393 lt!672330)) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))

(assert (= (and d!163025 res!1070495) b!1566009))

(assert (= (and b!1566009 (not res!1070496)) b!1566010))

(declare-fun m!1440407 () Bool)

(assert (=> d!163025 m!1440407))

(declare-fun m!1440409 () Bool)

(assert (=> d!163025 m!1440409))

(declare-fun m!1440411 () Bool)

(assert (=> b!1566010 m!1440411))

(assert (=> b!1565907 d!163025))

(declare-fun d!163027 () Bool)

(assert (=> d!163027 (= (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782))) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))))

(declare-fun bs!45026 () Bool)

(assert (= bs!45026 d!163027))

(assert (=> bs!45026 m!1440301))

(declare-fun m!1440413 () Bool)

(assert (=> bs!45026 m!1440413))

(assert (=> b!1565925 d!163027))

(assert (=> b!1565925 d!162993))

(declare-fun d!163029 () Bool)

(assert (=> d!163029 (= (validKeyInArray!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)) (and (not (= (select (arr!50455 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50455 _keys!637) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1565922 d!163029))

(assert (=> b!1565920 d!163029))

(declare-fun d!163031 () Bool)

(declare-fun res!1070497 () Bool)

(declare-fun e!872851 () Bool)

(assert (=> d!163031 (=> res!1070497 e!872851)))

(assert (=> d!163031 (= res!1070497 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (= (_1!12671 (h!38121 (toList!11393 lt!672254))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163031 (= (containsKey!849 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000) e!872851)))

(declare-fun b!1566011 () Bool)

(declare-fun e!872852 () Bool)

(assert (=> b!1566011 (= e!872851 e!872852)))

(declare-fun res!1070498 () Bool)

(assert (=> b!1566011 (=> (not res!1070498) (not e!872852))))

(assert (=> b!1566011 (= res!1070498 (and (or (not ((_ is Cons!36674) (toList!11393 lt!672254))) (bvsle (_1!12671 (h!38121 (toList!11393 lt!672254))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36674) (toList!11393 lt!672254)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672254))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566012 () Bool)

(assert (=> b!1566012 (= e!872852 (containsKey!849 (t!51569 (toList!11393 lt!672254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163031 (not res!1070497)) b!1566011))

(assert (= (and b!1566011 res!1070498) b!1566012))

(declare-fun m!1440415 () Bool)

(assert (=> b!1566012 m!1440415))

(assert (=> d!162963 d!163031))

(declare-fun d!163033 () Bool)

(assert (=> d!163033 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672379 () Unit!51846)

(assert (=> d!163033 (= lt!672379 (choose!2085 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872853 () Bool)

(assert (=> d!163033 e!872853))

(declare-fun res!1070499 () Bool)

(assert (=> d!163033 (=> (not res!1070499) (not e!872853))))

(assert (=> d!163033 (= res!1070499 (isStrictlySorted!985 (toList!11393 lt!672254)))))

(assert (=> d!163033 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000) lt!672379)))

(declare-fun b!1566013 () Bool)

(assert (=> b!1566013 (= e!872853 (containsKey!849 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163033 res!1070499) b!1566013))

(assert (=> d!163033 m!1440231))

(assert (=> d!163033 m!1440231))

(assert (=> d!163033 m!1440233))

(declare-fun m!1440417 () Bool)

(assert (=> d!163033 m!1440417))

(assert (=> d!163033 m!1440397))

(assert (=> b!1566013 m!1440227))

(assert (=> b!1565856 d!163033))

(declare-fun d!163035 () Bool)

(assert (=> d!163035 (= (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45027 () Bool)

(assert (= bs!45027 d!163035))

(assert (=> bs!45027 m!1440231))

(declare-fun m!1440419 () Bool)

(assert (=> bs!45027 m!1440419))

(assert (=> b!1565856 d!163035))

(declare-fun b!1566015 () Bool)

(declare-fun e!872854 () Option!871)

(declare-fun e!872855 () Option!871)

(assert (=> b!1566015 (= e!872854 e!872855)))

(declare-fun c!144261 () Bool)

(assert (=> b!1566015 (= c!144261 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672254))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566014 () Bool)

(assert (=> b!1566014 (= e!872854 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672254)))))))

(declare-fun d!163037 () Bool)

(declare-fun c!144260 () Bool)

(assert (=> d!163037 (= c!144260 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (= (_1!12671 (h!38121 (toList!11393 lt!672254))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163037 (= (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000) e!872854)))

(declare-fun b!1566017 () Bool)

(assert (=> b!1566017 (= e!872855 None!869)))

(declare-fun b!1566016 () Bool)

(assert (=> b!1566016 (= e!872855 (getValueByKey!796 (t!51569 (toList!11393 lt!672254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163037 c!144260) b!1566014))

(assert (= (and d!163037 (not c!144260)) b!1566015))

(assert (= (and b!1566015 c!144261) b!1566016))

(assert (= (and b!1566015 (not c!144261)) b!1566017))

(declare-fun m!1440421 () Bool)

(assert (=> b!1566016 m!1440421))

(assert (=> b!1565856 d!163037))

(assert (=> bm!71847 d!163005))

(assert (=> b!1565936 d!163029))

(declare-fun d!163039 () Bool)

(assert (=> d!163039 (= (get!26360 (select (arr!50456 _values!487) from!782) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!22315 (select (arr!50456 _values!487) from!782)))))

(assert (=> b!1565848 d!163039))

(assert (=> b!1565891 d!163019))

(declare-fun b!1566018 () Bool)

(declare-fun e!872858 () Bool)

(declare-fun call!71858 () Bool)

(assert (=> b!1566018 (= e!872858 call!71858)))

(declare-fun d!163041 () Bool)

(declare-fun res!1070501 () Bool)

(declare-fun e!872856 () Bool)

(assert (=> d!163041 (=> res!1070501 e!872856)))

(assert (=> d!163041 (= res!1070501 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(assert (=> d!163041 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947) e!872856)))

(declare-fun bm!71855 () Bool)

(assert (=> bm!71855 (= call!71858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566019 () Bool)

(declare-fun e!872857 () Bool)

(assert (=> b!1566019 (= e!872858 e!872857)))

(declare-fun lt!672382 () (_ BitVec 64))

(assert (=> b!1566019 (= lt!672382 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!672381 () Unit!51846)

(assert (=> b!1566019 (= lt!672381 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672382 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1566019 (arrayContainsKey!0 _keys!637 lt!672382 #b00000000000000000000000000000000)))

(declare-fun lt!672380 () Unit!51846)

(assert (=> b!1566019 (= lt!672380 lt!672381)))

(declare-fun res!1070500 () Bool)

(assert (=> b!1566019 (= res!1070500 (= (seekEntryOrOpen!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13526 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1566019 (=> (not res!1070500) (not e!872857))))

(declare-fun b!1566020 () Bool)

(assert (=> b!1566020 (= e!872856 e!872858)))

(declare-fun c!144262 () Bool)

(assert (=> b!1566020 (= c!144262 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1566021 () Bool)

(assert (=> b!1566021 (= e!872857 call!71858)))

(assert (= (and d!163041 (not res!1070501)) b!1566020))

(assert (= (and b!1566020 c!144262) b!1566019))

(assert (= (and b!1566020 (not c!144262)) b!1566018))

(assert (= (and b!1566019 res!1070500) b!1566021))

(assert (= (or b!1566021 b!1566018) bm!71855))

(declare-fun m!1440423 () Bool)

(assert (=> bm!71855 m!1440423))

(declare-fun m!1440425 () Bool)

(assert (=> b!1566019 m!1440425))

(declare-fun m!1440427 () Bool)

(assert (=> b!1566019 m!1440427))

(declare-fun m!1440429 () Bool)

(assert (=> b!1566019 m!1440429))

(assert (=> b!1566019 m!1440425))

(declare-fun m!1440431 () Bool)

(assert (=> b!1566019 m!1440431))

(assert (=> b!1566020 m!1440425))

(assert (=> b!1566020 m!1440425))

(declare-fun m!1440433 () Bool)

(assert (=> b!1566020 m!1440433))

(assert (=> bm!71853 d!163041))

(declare-fun d!163043 () Bool)

(assert (=> d!163043 (arrayContainsKey!0 _keys!637 lt!672345 #b00000000000000000000000000000000)))

(declare-fun lt!672385 () Unit!51846)

(declare-fun choose!13 (array!104534 (_ BitVec 64) (_ BitVec 32)) Unit!51846)

(assert (=> d!163043 (= lt!672385 (choose!13 _keys!637 lt!672345 #b00000000000000000000000000000000))))

(assert (=> d!163043 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!163043 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672345 #b00000000000000000000000000000000) lt!672385)))

(declare-fun bs!45028 () Bool)

(assert (= bs!45028 d!163043))

(assert (=> bs!45028 m!1440309))

(declare-fun m!1440435 () Bool)

(assert (=> bs!45028 m!1440435))

(assert (=> b!1565935 d!163043))

(declare-fun d!163045 () Bool)

(declare-fun res!1070506 () Bool)

(declare-fun e!872863 () Bool)

(assert (=> d!163045 (=> res!1070506 e!872863)))

(assert (=> d!163045 (= res!1070506 (= (select (arr!50455 _keys!637) #b00000000000000000000000000000000) lt!672345))))

(assert (=> d!163045 (= (arrayContainsKey!0 _keys!637 lt!672345 #b00000000000000000000000000000000) e!872863)))

(declare-fun b!1566026 () Bool)

(declare-fun e!872864 () Bool)

(assert (=> b!1566026 (= e!872863 e!872864)))

(declare-fun res!1070507 () Bool)

(assert (=> b!1566026 (=> (not res!1070507) (not e!872864))))

(assert (=> b!1566026 (= res!1070507 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun b!1566027 () Bool)

(assert (=> b!1566027 (= e!872864 (arrayContainsKey!0 _keys!637 lt!672345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!163045 (not res!1070506)) b!1566026))

(assert (= (and b!1566026 res!1070507) b!1566027))

(assert (=> d!163045 m!1440289))

(declare-fun m!1440437 () Bool)

(assert (=> b!1566027 m!1440437))

(assert (=> b!1565935 d!163045))

(declare-fun b!1566040 () Bool)

(declare-fun e!872871 () SeekEntryResult!13526)

(assert (=> b!1566040 (= e!872871 Undefined!13526)))

(declare-fun b!1566041 () Bool)

(declare-fun e!872873 () SeekEntryResult!13526)

(declare-fun lt!672392 () SeekEntryResult!13526)

(assert (=> b!1566041 (= e!872873 (MissingZero!13526 (index!56504 lt!672392)))))

(declare-fun d!163047 () Bool)

(declare-fun lt!672393 () SeekEntryResult!13526)

(assert (=> d!163047 (and (or ((_ is Undefined!13526) lt!672393) (not ((_ is Found!13526) lt!672393)) (and (bvsge (index!56503 lt!672393) #b00000000000000000000000000000000) (bvslt (index!56503 lt!672393) (size!51007 _keys!637)))) (or ((_ is Undefined!13526) lt!672393) ((_ is Found!13526) lt!672393) (not ((_ is MissingZero!13526) lt!672393)) (and (bvsge (index!56502 lt!672393) #b00000000000000000000000000000000) (bvslt (index!56502 lt!672393) (size!51007 _keys!637)))) (or ((_ is Undefined!13526) lt!672393) ((_ is Found!13526) lt!672393) ((_ is MissingZero!13526) lt!672393) (not ((_ is MissingVacant!13526) lt!672393)) (and (bvsge (index!56505 lt!672393) #b00000000000000000000000000000000) (bvslt (index!56505 lt!672393) (size!51007 _keys!637)))) (or ((_ is Undefined!13526) lt!672393) (ite ((_ is Found!13526) lt!672393) (= (select (arr!50455 _keys!637) (index!56503 lt!672393)) (select (arr!50455 _keys!637) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13526) lt!672393) (= (select (arr!50455 _keys!637) (index!56502 lt!672393)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13526) lt!672393) (= (select (arr!50455 _keys!637) (index!56505 lt!672393)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163047 (= lt!672393 e!872871)))

(declare-fun c!144270 () Bool)

(assert (=> d!163047 (= c!144270 (and ((_ is Intermediate!13526) lt!672392) (undefined!14338 lt!672392)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104534 (_ BitVec 32)) SeekEntryResult!13526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!163047 (= lt!672392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50455 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (=> d!163047 (validMask!0 mask!947)))

(assert (=> d!163047 (= (seekEntryOrOpen!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!672393)))

(declare-fun b!1566042 () Bool)

(declare-fun c!144269 () Bool)

(declare-fun lt!672394 () (_ BitVec 64))

(assert (=> b!1566042 (= c!144269 (= lt!672394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872872 () SeekEntryResult!13526)

(assert (=> b!1566042 (= e!872872 e!872873)))

(declare-fun b!1566043 () Bool)

(assert (=> b!1566043 (= e!872871 e!872872)))

(assert (=> b!1566043 (= lt!672394 (select (arr!50455 _keys!637) (index!56504 lt!672392)))))

(declare-fun c!144271 () Bool)

(assert (=> b!1566043 (= c!144271 (= lt!672394 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566044 () Bool)

(assert (=> b!1566044 (= e!872872 (Found!13526 (index!56504 lt!672392)))))

(declare-fun b!1566045 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104534 (_ BitVec 32)) SeekEntryResult!13526)

(assert (=> b!1566045 (= e!872873 (seekKeyOrZeroReturnVacant!0 (x!140744 lt!672392) (index!56504 lt!672392) (index!56504 lt!672392) (select (arr!50455 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (= (and d!163047 c!144270) b!1566040))

(assert (= (and d!163047 (not c!144270)) b!1566043))

(assert (= (and b!1566043 c!144271) b!1566044))

(assert (= (and b!1566043 (not c!144271)) b!1566042))

(assert (= (and b!1566042 c!144269) b!1566041))

(assert (= (and b!1566042 (not c!144269)) b!1566045))

(declare-fun m!1440439 () Bool)

(assert (=> d!163047 m!1440439))

(declare-fun m!1440441 () Bool)

(assert (=> d!163047 m!1440441))

(declare-fun m!1440443 () Bool)

(assert (=> d!163047 m!1440443))

(assert (=> d!163047 m!1440289))

(declare-fun m!1440445 () Bool)

(assert (=> d!163047 m!1440445))

(assert (=> d!163047 m!1440445))

(assert (=> d!163047 m!1440289))

(declare-fun m!1440447 () Bool)

(assert (=> d!163047 m!1440447))

(assert (=> d!163047 m!1440123))

(declare-fun m!1440449 () Bool)

(assert (=> b!1566043 m!1440449))

(assert (=> b!1566045 m!1440289))

(declare-fun m!1440451 () Bool)

(assert (=> b!1566045 m!1440451))

(assert (=> b!1565935 d!163047))

(declare-fun d!163049 () Bool)

(declare-fun e!872875 () Bool)

(assert (=> d!163049 e!872875))

(declare-fun res!1070508 () Bool)

(assert (=> d!163049 (=> res!1070508 e!872875)))

(declare-fun lt!672397 () Bool)

(assert (=> d!163049 (= res!1070508 (not lt!672397))))

(declare-fun lt!672398 () Bool)

(assert (=> d!163049 (= lt!672397 lt!672398)))

(declare-fun lt!672396 () Unit!51846)

(declare-fun e!872874 () Unit!51846)

(assert (=> d!163049 (= lt!672396 e!872874)))

(declare-fun c!144272 () Bool)

(assert (=> d!163049 (= c!144272 lt!672398)))

(assert (=> d!163049 (= lt!672398 (containsKey!849 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (=> d!163049 (= (contains!10306 lt!672330 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) lt!672397)))

(declare-fun b!1566046 () Bool)

(declare-fun lt!672395 () Unit!51846)

(assert (=> b!1566046 (= e!872874 lt!672395)))

(assert (=> b!1566046 (= lt!672395 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (=> b!1566046 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun b!1566047 () Bool)

(declare-fun Unit!51856 () Unit!51846)

(assert (=> b!1566047 (= e!872874 Unit!51856)))

(declare-fun b!1566048 () Bool)

(assert (=> b!1566048 (= e!872875 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (= (and d!163049 c!144272) b!1566046))

(assert (= (and d!163049 (not c!144272)) b!1566047))

(assert (= (and d!163049 (not res!1070508)) b!1566048))

(declare-fun m!1440453 () Bool)

(assert (=> d!163049 m!1440453))

(declare-fun m!1440455 () Bool)

(assert (=> b!1566046 m!1440455))

(assert (=> b!1566046 m!1440285))

(assert (=> b!1566046 m!1440285))

(declare-fun m!1440457 () Bool)

(assert (=> b!1566046 m!1440457))

(assert (=> b!1566048 m!1440285))

(assert (=> b!1566048 m!1440285))

(assert (=> b!1566048 m!1440457))

(assert (=> d!162971 d!163049))

(declare-fun b!1566050 () Bool)

(declare-fun e!872876 () Option!871)

(declare-fun e!872877 () Option!871)

(assert (=> b!1566050 (= e!872876 e!872877)))

(declare-fun c!144274 () Bool)

(assert (=> b!1566050 (= c!144274 (and ((_ is Cons!36674) lt!672331) (not (= (_1!12671 (h!38121 lt!672331)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))))

(declare-fun b!1566049 () Bool)

(assert (=> b!1566049 (= e!872876 (Some!870 (_2!12671 (h!38121 lt!672331))))))

(declare-fun c!144273 () Bool)

(declare-fun d!163051 () Bool)

(assert (=> d!163051 (= c!144273 (and ((_ is Cons!36674) lt!672331) (= (_1!12671 (h!38121 lt!672331)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163051 (= (getValueByKey!796 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) e!872876)))

(declare-fun b!1566052 () Bool)

(assert (=> b!1566052 (= e!872877 None!869)))

(declare-fun b!1566051 () Bool)

(assert (=> b!1566051 (= e!872877 (getValueByKey!796 (t!51569 lt!672331) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (= (and d!163051 c!144273) b!1566049))

(assert (= (and d!163051 (not c!144273)) b!1566050))

(assert (= (and b!1566050 c!144274) b!1566051))

(assert (= (and b!1566050 (not c!144274)) b!1566052))

(declare-fun m!1440459 () Bool)

(assert (=> b!1566051 m!1440459))

(assert (=> d!162971 d!163051))

(declare-fun d!163053 () Bool)

(assert (=> d!163053 (= (getValueByKey!796 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun lt!672401 () Unit!51846)

(declare-fun choose!2086 (List!36678 (_ BitVec 64) V!60153) Unit!51846)

(assert (=> d!163053 (= lt!672401 (choose!2086 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun e!872880 () Bool)

(assert (=> d!163053 e!872880))

(declare-fun res!1070513 () Bool)

(assert (=> d!163053 (=> (not res!1070513) (not e!872880))))

(assert (=> d!163053 (= res!1070513 (isStrictlySorted!985 lt!672331))))

(assert (=> d!163053 (= (lemmaContainsTupThenGetReturnValue!388 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) lt!672401)))

(declare-fun b!1566057 () Bool)

(declare-fun res!1070514 () Bool)

(assert (=> b!1566057 (=> (not res!1070514) (not e!872880))))

(assert (=> b!1566057 (= res!1070514 (containsKey!849 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun b!1566058 () Bool)

(assert (=> b!1566058 (= e!872880 (contains!10307 lt!672331 (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (= (and d!163053 res!1070513) b!1566057))

(assert (= (and b!1566057 res!1070514) b!1566058))

(assert (=> d!163053 m!1440279))

(declare-fun m!1440461 () Bool)

(assert (=> d!163053 m!1440461))

(declare-fun m!1440463 () Bool)

(assert (=> d!163053 m!1440463))

(declare-fun m!1440465 () Bool)

(assert (=> b!1566057 m!1440465))

(declare-fun m!1440467 () Bool)

(assert (=> b!1566058 m!1440467))

(assert (=> d!162971 d!163053))

(declare-fun b!1566079 () Bool)

(declare-fun e!872893 () List!36678)

(declare-fun call!71866 () List!36678)

(assert (=> b!1566079 (= e!872893 call!71866)))

(declare-fun b!1566080 () Bool)

(declare-fun res!1070520 () Bool)

(declare-fun e!872892 () Bool)

(assert (=> b!1566080 (=> (not res!1070520) (not e!872892))))

(declare-fun lt!672404 () List!36678)

(assert (=> b!1566080 (= res!1070520 (containsKey!849 lt!672404 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun b!1566081 () Bool)

(declare-fun e!872894 () List!36678)

(declare-fun call!71865 () List!36678)

(assert (=> b!1566081 (= e!872894 call!71865)))

(declare-fun e!872895 () List!36678)

(declare-fun b!1566082 () Bool)

(declare-fun c!144286 () Bool)

(declare-fun c!144284 () Bool)

(assert (=> b!1566082 (= e!872895 (ite c!144286 (t!51569 (toList!11393 lt!672253)) (ite c!144284 (Cons!36674 (h!38121 (toList!11393 lt!672253)) (t!51569 (toList!11393 lt!672253))) Nil!36675)))))

(declare-fun b!1566083 () Bool)

(assert (=> b!1566083 (= e!872892 (contains!10307 lt!672404 (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566084 () Bool)

(assert (=> b!1566084 (= e!872894 call!71865)))

(declare-fun bm!71863 () Bool)

(declare-fun c!144285 () Bool)

(declare-fun $colon$colon!989 (List!36678 tuple2!25320) List!36678)

(assert (=> bm!71863 (= call!71866 ($colon$colon!989 e!872895 (ite c!144285 (h!38121 (toList!11393 lt!672253)) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))))

(declare-fun c!144283 () Bool)

(assert (=> bm!71863 (= c!144283 c!144285)))

(declare-fun b!1566085 () Bool)

(assert (=> b!1566085 (= e!872895 (insertStrictlySorted!578 (t!51569 (toList!11393 lt!672253)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun b!1566086 () Bool)

(declare-fun e!872891 () List!36678)

(declare-fun call!71867 () List!36678)

(assert (=> b!1566086 (= e!872891 call!71867)))

(declare-fun b!1566087 () Bool)

(assert (=> b!1566087 (= e!872893 e!872891)))

(assert (=> b!1566087 (= c!144286 (and ((_ is Cons!36674) (toList!11393 lt!672253)) (= (_1!12671 (h!38121 (toList!11393 lt!672253))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566088 () Bool)

(assert (=> b!1566088 (= c!144284 (and ((_ is Cons!36674) (toList!11393 lt!672253)) (bvsgt (_1!12671 (h!38121 (toList!11393 lt!672253))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> b!1566088 (= e!872891 e!872894)))

(declare-fun bm!71864 () Bool)

(assert (=> bm!71864 (= call!71865 call!71867)))

(declare-fun d!163055 () Bool)

(assert (=> d!163055 e!872892))

(declare-fun res!1070519 () Bool)

(assert (=> d!163055 (=> (not res!1070519) (not e!872892))))

(assert (=> d!163055 (= res!1070519 (isStrictlySorted!985 lt!672404))))

(assert (=> d!163055 (= lt!672404 e!872893)))

(assert (=> d!163055 (= c!144285 (and ((_ is Cons!36674) (toList!11393 lt!672253)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672253))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163055 (isStrictlySorted!985 (toList!11393 lt!672253))))

(assert (=> d!163055 (= (insertStrictlySorted!578 (toList!11393 lt!672253) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) lt!672404)))

(declare-fun bm!71862 () Bool)

(assert (=> bm!71862 (= call!71867 call!71866)))

(assert (= (and d!163055 c!144285) b!1566079))

(assert (= (and d!163055 (not c!144285)) b!1566087))

(assert (= (and b!1566087 c!144286) b!1566086))

(assert (= (and b!1566087 (not c!144286)) b!1566088))

(assert (= (and b!1566088 c!144284) b!1566084))

(assert (= (and b!1566088 (not c!144284)) b!1566081))

(assert (= (or b!1566084 b!1566081) bm!71864))

(assert (= (or b!1566086 bm!71864) bm!71862))

(assert (= (or b!1566079 bm!71862) bm!71863))

(assert (= (and bm!71863 c!144283) b!1566085))

(assert (= (and bm!71863 (not c!144283)) b!1566082))

(assert (= (and d!163055 res!1070519) b!1566080))

(assert (= (and b!1566080 res!1070520) b!1566083))

(declare-fun m!1440469 () Bool)

(assert (=> bm!71863 m!1440469))

(declare-fun m!1440471 () Bool)

(assert (=> b!1566085 m!1440471))

(declare-fun m!1440473 () Bool)

(assert (=> d!163055 m!1440473))

(declare-fun m!1440475 () Bool)

(assert (=> d!163055 m!1440475))

(declare-fun m!1440477 () Bool)

(assert (=> b!1566080 m!1440477))

(declare-fun m!1440479 () Bool)

(assert (=> b!1566083 m!1440479))

(assert (=> d!162971 d!163055))

(declare-fun d!163057 () Bool)

(declare-fun res!1070521 () Bool)

(declare-fun e!872896 () Bool)

(assert (=> d!163057 (=> res!1070521 e!872896)))

(assert (=> d!163057 (= res!1070521 (and ((_ is Cons!36674) (toList!11393 lt!672254)) (= (_1!12671 (h!38121 (toList!11393 lt!672254))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163057 (= (containsKey!849 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000) e!872896)))

(declare-fun b!1566089 () Bool)

(declare-fun e!872897 () Bool)

(assert (=> b!1566089 (= e!872896 e!872897)))

(declare-fun res!1070522 () Bool)

(assert (=> b!1566089 (=> (not res!1070522) (not e!872897))))

(assert (=> b!1566089 (= res!1070522 (and (or (not ((_ is Cons!36674) (toList!11393 lt!672254))) (bvsle (_1!12671 (h!38121 (toList!11393 lt!672254))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36674) (toList!11393 lt!672254)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672254))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566090 () Bool)

(assert (=> b!1566090 (= e!872897 (containsKey!849 (t!51569 (toList!11393 lt!672254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163057 (not res!1070521)) b!1566089))

(assert (= (and b!1566089 res!1070522) b!1566090))

(declare-fun m!1440481 () Bool)

(assert (=> b!1566090 m!1440481))

(assert (=> d!162969 d!163057))

(declare-fun b!1566091 () Bool)

(declare-fun e!872900 () Bool)

(declare-fun call!71868 () Bool)

(assert (=> b!1566091 (= e!872900 call!71868)))

(declare-fun b!1566092 () Bool)

(declare-fun e!872899 () Bool)

(assert (=> b!1566092 (= e!872899 (contains!10308 (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!71865 () Bool)

(declare-fun c!144287 () Bool)

(assert (=> bm!71865 (= call!71868 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144287 (Cons!36675 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676))))))

(declare-fun b!1566093 () Bool)

(declare-fun e!872898 () Bool)

(declare-fun e!872901 () Bool)

(assert (=> b!1566093 (= e!872898 e!872901)))

(declare-fun res!1070525 () Bool)

(assert (=> b!1566093 (=> (not res!1070525) (not e!872901))))

(assert (=> b!1566093 (= res!1070525 (not e!872899))))

(declare-fun res!1070524 () Bool)

(assert (=> b!1566093 (=> (not res!1070524) (not e!872899))))

(assert (=> b!1566093 (= res!1070524 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1566094 () Bool)

(assert (=> b!1566094 (= e!872900 call!71868)))

(declare-fun d!163059 () Bool)

(declare-fun res!1070523 () Bool)

(assert (=> d!163059 (=> res!1070523 e!872898)))

(assert (=> d!163059 (= res!1070523 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(assert (=> d!163059 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) e!872898)))

(declare-fun b!1566095 () Bool)

(assert (=> b!1566095 (= e!872901 e!872900)))

(assert (=> b!1566095 (= c!144287 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!163059 (not res!1070523)) b!1566093))

(assert (= (and b!1566093 res!1070524) b!1566092))

(assert (= (and b!1566093 res!1070525) b!1566095))

(assert (= (and b!1566095 c!144287) b!1566091))

(assert (= (and b!1566095 (not c!144287)) b!1566094))

(assert (= (or b!1566091 b!1566094) bm!71865))

(assert (=> b!1566092 m!1440425))

(assert (=> b!1566092 m!1440425))

(declare-fun m!1440483 () Bool)

(assert (=> b!1566092 m!1440483))

(assert (=> bm!71865 m!1440425))

(declare-fun m!1440485 () Bool)

(assert (=> bm!71865 m!1440485))

(assert (=> b!1566093 m!1440425))

(assert (=> b!1566093 m!1440425))

(assert (=> b!1566093 m!1440433))

(assert (=> b!1566095 m!1440425))

(assert (=> b!1566095 m!1440425))

(assert (=> b!1566095 m!1440433))

(assert (=> bm!71850 d!163059))

(declare-fun d!163061 () Bool)

(assert (=> d!163061 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))

(declare-fun lt!672405 () Unit!51846)

(assert (=> d!163061 (= lt!672405 (choose!2085 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))

(declare-fun e!872902 () Bool)

(assert (=> d!163061 e!872902))

(declare-fun res!1070526 () Bool)

(assert (=> d!163061 (=> (not res!1070526) (not e!872902))))

(assert (=> d!163061 (= res!1070526 (isStrictlySorted!985 (toList!11393 lt!672254)))))

(assert (=> d!163061 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)) lt!672405)))

(declare-fun b!1566096 () Bool)

(assert (=> b!1566096 (= e!872902 (containsKey!849 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))

(assert (= (and d!163061 res!1070526) b!1566096))

(assert (=> d!163061 m!1440119))

(assert (=> d!163061 m!1440301))

(assert (=> d!163061 m!1440301))

(assert (=> d!163061 m!1440303))

(assert (=> d!163061 m!1440119))

(declare-fun m!1440487 () Bool)

(assert (=> d!163061 m!1440487))

(assert (=> d!163061 m!1440397))

(assert (=> b!1566096 m!1440119))

(assert (=> b!1566096 m!1440297))

(assert (=> b!1565923 d!163061))

(assert (=> b!1565923 d!163027))

(assert (=> b!1565923 d!162993))

(declare-fun d!163063 () Bool)

(assert (=> d!163063 (= (get!26361 (select (arr!50456 _values!487) from!782) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565849 d!163063))

(declare-fun d!163065 () Bool)

(declare-fun lt!672408 () Bool)

(declare-fun content!799 (List!36679) (InoxSet (_ BitVec 64)))

(assert (=> d!163065 (= lt!672408 (select (content!799 Nil!36676) (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!872907 () Bool)

(assert (=> d!163065 (= lt!672408 e!872907)))

(declare-fun res!1070531 () Bool)

(assert (=> d!163065 (=> (not res!1070531) (not e!872907))))

(assert (=> d!163065 (= res!1070531 ((_ is Cons!36675) Nil!36676))))

(assert (=> d!163065 (= (contains!10308 Nil!36676 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)) lt!672408)))

(declare-fun b!1566101 () Bool)

(declare-fun e!872908 () Bool)

(assert (=> b!1566101 (= e!872907 e!872908)))

(declare-fun res!1070532 () Bool)

(assert (=> b!1566101 (=> res!1070532 e!872908)))

(assert (=> b!1566101 (= res!1070532 (= (h!38122 Nil!36676) (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566102 () Bool)

(assert (=> b!1566102 (= e!872908 (contains!10308 (t!51570 Nil!36676) (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163065 res!1070531) b!1566101))

(assert (= (and b!1566101 (not res!1070532)) b!1566102))

(declare-fun m!1440489 () Bool)

(assert (=> d!163065 m!1440489))

(assert (=> d!163065 m!1440289))

(declare-fun m!1440491 () Bool)

(assert (=> d!163065 m!1440491))

(assert (=> b!1566102 m!1440289))

(declare-fun m!1440493 () Bool)

(assert (=> b!1566102 m!1440493))

(assert (=> b!1565919 d!163065))

(assert (=> b!1565858 d!163035))

(assert (=> b!1565858 d!163037))

(declare-fun d!163067 () Bool)

(declare-fun e!872909 () Bool)

(assert (=> d!163067 e!872909))

(declare-fun res!1070534 () Bool)

(assert (=> d!163067 (=> (not res!1070534) (not e!872909))))

(declare-fun lt!672410 () ListLongMap!22755)

(assert (=> d!163067 (= res!1070534 (contains!10306 lt!672410 (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))

(declare-fun lt!672411 () List!36678)

(assert (=> d!163067 (= lt!672410 (ListLongMap!22756 lt!672411))))

(declare-fun lt!672412 () Unit!51846)

(declare-fun lt!672409 () Unit!51846)

(assert (=> d!163067 (= lt!672412 lt!672409)))

(assert (=> d!163067 (= (getValueByKey!796 lt!672411 (_1!12671 (tuple2!25321 lt!672307 lt!672312))) (Some!870 (_2!12671 (tuple2!25321 lt!672307 lt!672312))))))

(assert (=> d!163067 (= lt!672409 (lemmaContainsTupThenGetReturnValue!388 lt!672411 (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312))))))

(assert (=> d!163067 (= lt!672411 (insertStrictlySorted!578 (toList!11393 lt!672311) (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312))))))

(assert (=> d!163067 (= (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)) lt!672410)))

(declare-fun b!1566103 () Bool)

(declare-fun res!1070533 () Bool)

(assert (=> b!1566103 (=> (not res!1070533) (not e!872909))))

(assert (=> b!1566103 (= res!1070533 (= (getValueByKey!796 (toList!11393 lt!672410) (_1!12671 (tuple2!25321 lt!672307 lt!672312))) (Some!870 (_2!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(declare-fun b!1566104 () Bool)

(assert (=> b!1566104 (= e!872909 (contains!10307 (toList!11393 lt!672410) (tuple2!25321 lt!672307 lt!672312)))))

(assert (= (and d!163067 res!1070534) b!1566103))

(assert (= (and b!1566103 res!1070533) b!1566104))

(declare-fun m!1440495 () Bool)

(assert (=> d!163067 m!1440495))

(declare-fun m!1440497 () Bool)

(assert (=> d!163067 m!1440497))

(declare-fun m!1440499 () Bool)

(assert (=> d!163067 m!1440499))

(declare-fun m!1440501 () Bool)

(assert (=> d!163067 m!1440501))

(declare-fun m!1440503 () Bool)

(assert (=> b!1566103 m!1440503))

(declare-fun m!1440505 () Bool)

(assert (=> b!1566104 m!1440505))

(assert (=> b!1565893 d!163067))

(declare-fun d!163069 () Bool)

(declare-fun e!872911 () Bool)

(assert (=> d!163069 e!872911))

(declare-fun res!1070535 () Bool)

(assert (=> d!163069 (=> res!1070535 e!872911)))

(declare-fun lt!672415 () Bool)

(assert (=> d!163069 (= res!1070535 (not lt!672415))))

(declare-fun lt!672416 () Bool)

(assert (=> d!163069 (= lt!672415 lt!672416)))

(declare-fun lt!672414 () Unit!51846)

(declare-fun e!872910 () Unit!51846)

(assert (=> d!163069 (= lt!672414 e!872910)))

(declare-fun c!144288 () Bool)

(assert (=> d!163069 (= c!144288 lt!672416)))

(assert (=> d!163069 (= lt!672416 (containsKey!849 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310))))

(assert (=> d!163069 (= (contains!10306 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)) lt!672310) lt!672415)))

(declare-fun b!1566105 () Bool)

(declare-fun lt!672413 () Unit!51846)

(assert (=> b!1566105 (= e!872910 lt!672413)))

(assert (=> b!1566105 (= lt!672413 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310))))

(assert (=> b!1566105 (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310))))

(declare-fun b!1566106 () Bool)

(declare-fun Unit!51857 () Unit!51846)

(assert (=> b!1566106 (= e!872910 Unit!51857)))

(declare-fun b!1566107 () Bool)

(assert (=> b!1566107 (= e!872911 (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310)))))

(assert (= (and d!163069 c!144288) b!1566105))

(assert (= (and d!163069 (not c!144288)) b!1566106))

(assert (= (and d!163069 (not res!1070535)) b!1566107))

(declare-fun m!1440507 () Bool)

(assert (=> d!163069 m!1440507))

(declare-fun m!1440509 () Bool)

(assert (=> b!1566105 m!1440509))

(declare-fun m!1440511 () Bool)

(assert (=> b!1566105 m!1440511))

(assert (=> b!1566105 m!1440511))

(declare-fun m!1440513 () Bool)

(assert (=> b!1566105 m!1440513))

(assert (=> b!1566107 m!1440511))

(assert (=> b!1566107 m!1440511))

(assert (=> b!1566107 m!1440513))

(assert (=> b!1565893 d!163069))

(declare-fun d!163071 () Bool)

(declare-fun e!872912 () Bool)

(assert (=> d!163071 e!872912))

(declare-fun res!1070537 () Bool)

(assert (=> d!163071 (=> (not res!1070537) (not e!872912))))

(declare-fun lt!672418 () ListLongMap!22755)

(assert (=> d!163071 (= res!1070537 (contains!10306 lt!672418 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!672419 () List!36678)

(assert (=> d!163071 (= lt!672418 (ListLongMap!22756 lt!672419))))

(declare-fun lt!672420 () Unit!51846)

(declare-fun lt!672417 () Unit!51846)

(assert (=> d!163071 (= lt!672420 lt!672417)))

(assert (=> d!163071 (= (getValueByKey!796 lt!672419 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163071 (= lt!672417 (lemmaContainsTupThenGetReturnValue!388 lt!672419 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163071 (= lt!672419 (insertStrictlySorted!578 (toList!11393 call!71850) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163071 (= (+!5114 call!71850 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!672418)))

(declare-fun b!1566108 () Bool)

(declare-fun res!1070536 () Bool)

(assert (=> b!1566108 (=> (not res!1070536) (not e!872912))))

(assert (=> b!1566108 (= res!1070536 (= (getValueByKey!796 (toList!11393 lt!672418) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1566109 () Bool)

(assert (=> b!1566109 (= e!872912 (contains!10307 (toList!11393 lt!672418) (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!163071 res!1070537) b!1566108))

(assert (= (and b!1566108 res!1070536) b!1566109))

(declare-fun m!1440515 () Bool)

(assert (=> d!163071 m!1440515))

(declare-fun m!1440517 () Bool)

(assert (=> d!163071 m!1440517))

(declare-fun m!1440519 () Bool)

(assert (=> d!163071 m!1440519))

(declare-fun m!1440521 () Bool)

(assert (=> d!163071 m!1440521))

(declare-fun m!1440523 () Bool)

(assert (=> b!1566108 m!1440523))

(declare-fun m!1440525 () Bool)

(assert (=> b!1566109 m!1440525))

(assert (=> b!1565893 d!163071))

(declare-fun d!163073 () Bool)

(assert (=> d!163073 (not (contains!10306 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)) lt!672310))))

(declare-fun lt!672421 () Unit!51846)

(assert (=> d!163073 (= lt!672421 (choose!2084 lt!672311 lt!672307 lt!672312 lt!672310))))

(declare-fun e!872913 () Bool)

(assert (=> d!163073 e!872913))

(declare-fun res!1070538 () Bool)

(assert (=> d!163073 (=> (not res!1070538) (not e!872913))))

(assert (=> d!163073 (= res!1070538 (not (contains!10306 lt!672311 lt!672310)))))

(assert (=> d!163073 (= (addStillNotContains!561 lt!672311 lt!672307 lt!672312 lt!672310) lt!672421)))

(declare-fun b!1566110 () Bool)

(assert (=> b!1566110 (= e!872913 (not (= lt!672307 lt!672310)))))

(assert (= (and d!163073 res!1070538) b!1566110))

(assert (=> d!163073 m!1440247))

(assert (=> d!163073 m!1440247))

(assert (=> d!163073 m!1440251))

(declare-fun m!1440527 () Bool)

(assert (=> d!163073 m!1440527))

(declare-fun m!1440529 () Bool)

(assert (=> d!163073 m!1440529))

(assert (=> b!1565893 d!163073))

(assert (=> b!1565893 d!162997))

(declare-fun mapIsEmpty!59840 () Bool)

(declare-fun mapRes!59840 () Bool)

(assert (=> mapIsEmpty!59840 mapRes!59840))

(declare-fun mapNonEmpty!59840 () Bool)

(declare-fun tp!113874 () Bool)

(declare-fun e!872915 () Bool)

(assert (=> mapNonEmpty!59840 (= mapRes!59840 (and tp!113874 e!872915))))

(declare-fun mapValue!59840 () ValueCell!18449)

(declare-fun mapKey!59840 () (_ BitVec 32))

(declare-fun mapRest!59840 () (Array (_ BitVec 32) ValueCell!18449))

(assert (=> mapNonEmpty!59840 (= mapRest!59839 (store mapRest!59840 mapKey!59840 mapValue!59840))))

(declare-fun condMapEmpty!59840 () Bool)

(declare-fun mapDefault!59840 () ValueCell!18449)

(assert (=> mapNonEmpty!59839 (= condMapEmpty!59840 (= mapRest!59839 ((as const (Array (_ BitVec 32) ValueCell!18449)) mapDefault!59840)))))

(declare-fun e!872914 () Bool)

(assert (=> mapNonEmpty!59839 (= tp!113873 (and e!872914 mapRes!59840))))

(declare-fun b!1566112 () Bool)

(assert (=> b!1566112 (= e!872914 tp_is_empty!38959)))

(declare-fun b!1566111 () Bool)

(assert (=> b!1566111 (= e!872915 tp_is_empty!38959)))

(assert (= (and mapNonEmpty!59839 condMapEmpty!59840) mapIsEmpty!59840))

(assert (= (and mapNonEmpty!59839 (not condMapEmpty!59840)) mapNonEmpty!59840))

(assert (= (and mapNonEmpty!59840 ((_ is ValueCellFull!18449) mapValue!59840)) b!1566111))

(assert (= (and mapNonEmpty!59839 ((_ is ValueCellFull!18449) mapDefault!59840)) b!1566112))

(declare-fun m!1440531 () Bool)

(assert (=> mapNonEmpty!59840 m!1440531))

(declare-fun b_lambda!25009 () Bool)

(assert (= b_lambda!25005 (or (and start!133912 b_free!32185) b_lambda!25009)))

(declare-fun b_lambda!25011 () Bool)

(assert (= b_lambda!25007 (or (and start!133912 b_free!32185) b_lambda!25011)))

(check-sat (not b!1566004) (not d!163021) (not d!163033) (not b!1565997) (not b!1565985) (not d!163001) (not d!162999) (not d!163027) (not d!163071) (not b!1565988) (not b!1566108) (not d!163049) (not b!1566104) (not b!1565987) (not b!1565980) (not b!1566096) (not d!163061) (not d!163009) (not d!163005) (not b!1566083) (not b!1566048) (not b!1566102) (not b_lambda!25009) (not b!1566019) (not b!1566013) (not b!1566027) (not b!1565970) (not b!1566002) (not b!1566051) (not b_lambda!25011) (not b!1566020) (not b!1565964) (not b!1566045) (not b_next!32185) (not b!1566001) (not d!163073) (not b!1565951) b_and!51811 (not bm!71855) (not b_lambda!25003) (not d!162995) (not d!163003) (not mapNonEmpty!59840) (not d!163025) (not b!1565979) (not b!1566057) (not b!1565962) (not b!1566107) (not b!1565978) (not b_lambda!25001) (not b!1565968) (not b!1566095) (not b!1566058) (not b!1565981) (not b!1565966) (not b!1565973) (not b!1566092) (not d!163015) (not b!1566016) (not b!1566109) (not d!163043) (not bm!71863) (not b!1566085) (not d!163035) (not d!163007) (not b!1566010) (not d!163047) (not d!163067) (not b!1566103) (not d!163065) (not b!1565976) (not d!163055) (not d!163023) (not b!1565974) (not b!1566093) (not d!163013) (not bm!71854) (not bm!71865) (not b!1565965) (not b!1566090) (not b!1565983) (not b!1565990) (not b!1566080) tp_is_empty!38959 (not b_lambda!24995) (not b!1565972) (not b!1566046) (not b!1566012) (not d!163053) (not b!1565993) (not d!163069) (not b!1566105))
(check-sat b_and!51811 (not b_next!32185))
(get-model)

(declare-fun b!1566114 () Bool)

(declare-fun e!872916 () Option!871)

(declare-fun e!872917 () Option!871)

(assert (=> b!1566114 (= e!872916 e!872917)))

(declare-fun c!144290 () Bool)

(assert (=> b!1566114 (= c!144290 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (not (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566113 () Bool)

(assert (=> b!1566113 (= e!872916 (Some!870 (_2!12671 (h!38121 (t!51569 (toList!11393 lt!672254))))))))

(declare-fun d!163075 () Bool)

(declare-fun c!144289 () Bool)

(assert (=> d!163075 (= c!144289 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163075 (= (getValueByKey!796 (t!51569 (toList!11393 lt!672254)) #b0000000000000000000000000000000000000000000000000000000000000000) e!872916)))

(declare-fun b!1566116 () Bool)

(assert (=> b!1566116 (= e!872917 None!869)))

(declare-fun b!1566115 () Bool)

(assert (=> b!1566115 (= e!872917 (getValueByKey!796 (t!51569 (t!51569 (toList!11393 lt!672254))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163075 c!144289) b!1566113))

(assert (= (and d!163075 (not c!144289)) b!1566114))

(assert (= (and b!1566114 c!144290) b!1566115))

(assert (= (and b!1566114 (not c!144290)) b!1566116))

(declare-fun m!1440533 () Bool)

(assert (=> b!1566115 m!1440533))

(assert (=> b!1565997 d!163075))

(declare-fun d!163077 () Bool)

(declare-fun e!872919 () Bool)

(assert (=> d!163077 e!872919))

(declare-fun res!1070539 () Bool)

(assert (=> d!163077 (=> res!1070539 e!872919)))

(declare-fun lt!672424 () Bool)

(assert (=> d!163077 (= res!1070539 (not lt!672424))))

(declare-fun lt!672425 () Bool)

(assert (=> d!163077 (= lt!672424 lt!672425)))

(declare-fun lt!672423 () Unit!51846)

(declare-fun e!872918 () Unit!51846)

(assert (=> d!163077 (= lt!672423 e!872918)))

(declare-fun c!144291 () Bool)

(assert (=> d!163077 (= c!144291 lt!672425)))

(assert (=> d!163077 (= lt!672425 (containsKey!849 (toList!11393 lt!672360) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163077 (= (contains!10306 lt!672360 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672424)))

(declare-fun b!1566117 () Bool)

(declare-fun lt!672422 () Unit!51846)

(assert (=> b!1566117 (= e!872918 lt!672422)))

(assert (=> b!1566117 (= lt!672422 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672360) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566117 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672360) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566118 () Bool)

(declare-fun Unit!51858 () Unit!51846)

(assert (=> b!1566118 (= e!872918 Unit!51858)))

(declare-fun b!1566119 () Bool)

(assert (=> b!1566119 (= e!872919 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672360) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163077 c!144291) b!1566117))

(assert (= (and d!163077 (not c!144291)) b!1566118))

(assert (= (and d!163077 (not res!1070539)) b!1566119))

(declare-fun m!1440535 () Bool)

(assert (=> d!163077 m!1440535))

(declare-fun m!1440537 () Bool)

(assert (=> b!1566117 m!1440537))

(declare-fun m!1440539 () Bool)

(assert (=> b!1566117 m!1440539))

(assert (=> b!1566117 m!1440539))

(declare-fun m!1440541 () Bool)

(assert (=> b!1566117 m!1440541))

(assert (=> b!1566119 m!1440539))

(assert (=> b!1566119 m!1440539))

(assert (=> b!1566119 m!1440541))

(assert (=> d!163005 d!163077))

(assert (=> d!163005 d!162973))

(declare-fun d!163079 () Bool)

(assert (=> d!163079 (= (isEmpty!1152 (toList!11393 lt!672313)) ((_ is Nil!36675) (toList!11393 lt!672313)))))

(assert (=> d!163013 d!163079))

(declare-fun d!163081 () Bool)

(declare-fun lt!672426 () Bool)

(assert (=> d!163081 (= lt!672426 (select (content!798 lt!672331) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun e!872920 () Bool)

(assert (=> d!163081 (= lt!672426 e!872920)))

(declare-fun res!1070540 () Bool)

(assert (=> d!163081 (=> (not res!1070540) (not e!872920))))

(assert (=> d!163081 (= res!1070540 ((_ is Cons!36674) lt!672331))))

(assert (=> d!163081 (= (contains!10307 lt!672331 (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) lt!672426)))

(declare-fun b!1566120 () Bool)

(declare-fun e!872921 () Bool)

(assert (=> b!1566120 (= e!872920 e!872921)))

(declare-fun res!1070541 () Bool)

(assert (=> b!1566120 (=> res!1070541 e!872921)))

(assert (=> b!1566120 (= res!1070541 (= (h!38121 lt!672331) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566121 () Bool)

(assert (=> b!1566121 (= e!872921 (contains!10307 (t!51569 lt!672331) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (= (and d!163081 res!1070540) b!1566120))

(assert (= (and b!1566120 (not res!1070541)) b!1566121))

(declare-fun m!1440543 () Bool)

(assert (=> d!163081 m!1440543))

(declare-fun m!1440545 () Bool)

(assert (=> d!163081 m!1440545))

(declare-fun m!1440547 () Bool)

(assert (=> b!1566121 m!1440547))

(assert (=> b!1566058 d!163081))

(declare-fun d!163083 () Bool)

(declare-fun res!1070542 () Bool)

(declare-fun e!872922 () Bool)

(assert (=> d!163083 (=> res!1070542 e!872922)))

(assert (=> d!163083 (= res!1070542 (and ((_ is Cons!36674) (toList!11393 lt!672253)) (= (_1!12671 (h!38121 (toList!11393 lt!672253))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163083 (= (containsKey!849 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000) e!872922)))

(declare-fun b!1566122 () Bool)

(declare-fun e!872923 () Bool)

(assert (=> b!1566122 (= e!872922 e!872923)))

(declare-fun res!1070543 () Bool)

(assert (=> b!1566122 (=> (not res!1070543) (not e!872923))))

(assert (=> b!1566122 (= res!1070543 (and (or (not ((_ is Cons!36674) (toList!11393 lt!672253))) (bvsle (_1!12671 (h!38121 (toList!11393 lt!672253))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36674) (toList!11393 lt!672253)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672253))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566123 () Bool)

(assert (=> b!1566123 (= e!872923 (containsKey!849 (t!51569 (toList!11393 lt!672253)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163083 (not res!1070542)) b!1566122))

(assert (= (and b!1566122 res!1070543) b!1566123))

(declare-fun m!1440549 () Bool)

(assert (=> b!1566123 m!1440549))

(assert (=> d!163003 d!163083))

(assert (=> d!163053 d!163051))

(declare-fun d!163085 () Bool)

(assert (=> d!163085 (= (getValueByKey!796 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (=> d!163085 true))

(declare-fun _$22!592 () Unit!51846)

(assert (=> d!163085 (= (choose!2086 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) _$22!592)))

(declare-fun bs!45029 () Bool)

(assert (= bs!45029 d!163085))

(assert (=> bs!45029 m!1440279))

(assert (=> d!163053 d!163085))

(declare-fun d!163087 () Bool)

(declare-fun res!1070548 () Bool)

(declare-fun e!872928 () Bool)

(assert (=> d!163087 (=> res!1070548 e!872928)))

(assert (=> d!163087 (= res!1070548 (or ((_ is Nil!36675) lt!672331) ((_ is Nil!36675) (t!51569 lt!672331))))))

(assert (=> d!163087 (= (isStrictlySorted!985 lt!672331) e!872928)))

(declare-fun b!1566128 () Bool)

(declare-fun e!872929 () Bool)

(assert (=> b!1566128 (= e!872928 e!872929)))

(declare-fun res!1070549 () Bool)

(assert (=> b!1566128 (=> (not res!1070549) (not e!872929))))

(assert (=> b!1566128 (= res!1070549 (bvslt (_1!12671 (h!38121 lt!672331)) (_1!12671 (h!38121 (t!51569 lt!672331)))))))

(declare-fun b!1566129 () Bool)

(assert (=> b!1566129 (= e!872929 (isStrictlySorted!985 (t!51569 lt!672331)))))

(assert (= (and d!163087 (not res!1070548)) b!1566128))

(assert (= (and b!1566128 res!1070549) b!1566129))

(declare-fun m!1440551 () Bool)

(assert (=> b!1566129 m!1440551))

(assert (=> d!163053 d!163087))

(assert (=> b!1566001 d!163057))

(declare-fun d!163089 () Bool)

(declare-fun e!872931 () Bool)

(assert (=> d!163089 e!872931))

(declare-fun res!1070550 () Bool)

(assert (=> d!163089 (=> res!1070550 e!872931)))

(declare-fun lt!672429 () Bool)

(assert (=> d!163089 (= res!1070550 (not lt!672429))))

(declare-fun lt!672430 () Bool)

(assert (=> d!163089 (= lt!672429 lt!672430)))

(declare-fun lt!672428 () Unit!51846)

(declare-fun e!872930 () Unit!51846)

(assert (=> d!163089 (= lt!672428 e!872930)))

(declare-fun c!144292 () Bool)

(assert (=> d!163089 (= c!144292 lt!672430)))

(assert (=> d!163089 (= lt!672430 (containsKey!849 (toList!11393 lt!672410) (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))

(assert (=> d!163089 (= (contains!10306 lt!672410 (_1!12671 (tuple2!25321 lt!672307 lt!672312))) lt!672429)))

(declare-fun b!1566130 () Bool)

(declare-fun lt!672427 () Unit!51846)

(assert (=> b!1566130 (= e!872930 lt!672427)))

(assert (=> b!1566130 (= lt!672427 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672410) (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))

(assert (=> b!1566130 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672410) (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))

(declare-fun b!1566131 () Bool)

(declare-fun Unit!51859 () Unit!51846)

(assert (=> b!1566131 (= e!872930 Unit!51859)))

(declare-fun b!1566132 () Bool)

(assert (=> b!1566132 (= e!872931 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672410) (_1!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(assert (= (and d!163089 c!144292) b!1566130))

(assert (= (and d!163089 (not c!144292)) b!1566131))

(assert (= (and d!163089 (not res!1070550)) b!1566132))

(declare-fun m!1440553 () Bool)

(assert (=> d!163089 m!1440553))

(declare-fun m!1440555 () Bool)

(assert (=> b!1566130 m!1440555))

(assert (=> b!1566130 m!1440503))

(assert (=> b!1566130 m!1440503))

(declare-fun m!1440557 () Bool)

(assert (=> b!1566130 m!1440557))

(assert (=> b!1566132 m!1440503))

(assert (=> b!1566132 m!1440503))

(assert (=> b!1566132 m!1440557))

(assert (=> d!163067 d!163089))

(declare-fun b!1566134 () Bool)

(declare-fun e!872932 () Option!871)

(declare-fun e!872933 () Option!871)

(assert (=> b!1566134 (= e!872932 e!872933)))

(declare-fun c!144294 () Bool)

(assert (=> b!1566134 (= c!144294 (and ((_ is Cons!36674) lt!672411) (not (= (_1!12671 (h!38121 lt!672411)) (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))))

(declare-fun b!1566133 () Bool)

(assert (=> b!1566133 (= e!872932 (Some!870 (_2!12671 (h!38121 lt!672411))))))

(declare-fun d!163091 () Bool)

(declare-fun c!144293 () Bool)

(assert (=> d!163091 (= c!144293 (and ((_ is Cons!36674) lt!672411) (= (_1!12671 (h!38121 lt!672411)) (_1!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(assert (=> d!163091 (= (getValueByKey!796 lt!672411 (_1!12671 (tuple2!25321 lt!672307 lt!672312))) e!872932)))

(declare-fun b!1566136 () Bool)

(assert (=> b!1566136 (= e!872933 None!869)))

(declare-fun b!1566135 () Bool)

(assert (=> b!1566135 (= e!872933 (getValueByKey!796 (t!51569 lt!672411) (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))

(assert (= (and d!163091 c!144293) b!1566133))

(assert (= (and d!163091 (not c!144293)) b!1566134))

(assert (= (and b!1566134 c!144294) b!1566135))

(assert (= (and b!1566134 (not c!144294)) b!1566136))

(declare-fun m!1440559 () Bool)

(assert (=> b!1566135 m!1440559))

(assert (=> d!163067 d!163091))

(declare-fun d!163093 () Bool)

(assert (=> d!163093 (= (getValueByKey!796 lt!672411 (_1!12671 (tuple2!25321 lt!672307 lt!672312))) (Some!870 (_2!12671 (tuple2!25321 lt!672307 lt!672312))))))

(declare-fun lt!672431 () Unit!51846)

(assert (=> d!163093 (= lt!672431 (choose!2086 lt!672411 (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312))))))

(declare-fun e!872934 () Bool)

(assert (=> d!163093 e!872934))

(declare-fun res!1070551 () Bool)

(assert (=> d!163093 (=> (not res!1070551) (not e!872934))))

(assert (=> d!163093 (= res!1070551 (isStrictlySorted!985 lt!672411))))

(assert (=> d!163093 (= (lemmaContainsTupThenGetReturnValue!388 lt!672411 (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312))) lt!672431)))

(declare-fun b!1566137 () Bool)

(declare-fun res!1070552 () Bool)

(assert (=> b!1566137 (=> (not res!1070552) (not e!872934))))

(assert (=> b!1566137 (= res!1070552 (containsKey!849 lt!672411 (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))

(declare-fun b!1566138 () Bool)

(assert (=> b!1566138 (= e!872934 (contains!10307 lt!672411 (tuple2!25321 (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(assert (= (and d!163093 res!1070551) b!1566137))

(assert (= (and b!1566137 res!1070552) b!1566138))

(assert (=> d!163093 m!1440497))

(declare-fun m!1440561 () Bool)

(assert (=> d!163093 m!1440561))

(declare-fun m!1440563 () Bool)

(assert (=> d!163093 m!1440563))

(declare-fun m!1440565 () Bool)

(assert (=> b!1566137 m!1440565))

(declare-fun m!1440567 () Bool)

(assert (=> b!1566138 m!1440567))

(assert (=> d!163067 d!163093))

(declare-fun b!1566139 () Bool)

(declare-fun e!872937 () List!36678)

(declare-fun call!71870 () List!36678)

(assert (=> b!1566139 (= e!872937 call!71870)))

(declare-fun b!1566140 () Bool)

(declare-fun res!1070554 () Bool)

(declare-fun e!872936 () Bool)

(assert (=> b!1566140 (=> (not res!1070554) (not e!872936))))

(declare-fun lt!672432 () List!36678)

(assert (=> b!1566140 (= res!1070554 (containsKey!849 lt!672432 (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))

(declare-fun b!1566141 () Bool)

(declare-fun e!872938 () List!36678)

(declare-fun call!71869 () List!36678)

(assert (=> b!1566141 (= e!872938 call!71869)))

(declare-fun c!144296 () Bool)

(declare-fun e!872939 () List!36678)

(declare-fun c!144298 () Bool)

(declare-fun b!1566142 () Bool)

(assert (=> b!1566142 (= e!872939 (ite c!144298 (t!51569 (toList!11393 lt!672311)) (ite c!144296 (Cons!36674 (h!38121 (toList!11393 lt!672311)) (t!51569 (toList!11393 lt!672311))) Nil!36675)))))

(declare-fun b!1566143 () Bool)

(assert (=> b!1566143 (= e!872936 (contains!10307 lt!672432 (tuple2!25321 (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(declare-fun b!1566144 () Bool)

(assert (=> b!1566144 (= e!872938 call!71869)))

(declare-fun c!144297 () Bool)

(declare-fun bm!71867 () Bool)

(assert (=> bm!71867 (= call!71870 ($colon$colon!989 e!872939 (ite c!144297 (h!38121 (toList!11393 lt!672311)) (tuple2!25321 (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312))))))))

(declare-fun c!144295 () Bool)

(assert (=> bm!71867 (= c!144295 c!144297)))

(declare-fun b!1566145 () Bool)

(assert (=> b!1566145 (= e!872939 (insertStrictlySorted!578 (t!51569 (toList!11393 lt!672311)) (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312))))))

(declare-fun b!1566146 () Bool)

(declare-fun e!872935 () List!36678)

(declare-fun call!71871 () List!36678)

(assert (=> b!1566146 (= e!872935 call!71871)))

(declare-fun b!1566147 () Bool)

(assert (=> b!1566147 (= e!872937 e!872935)))

(assert (=> b!1566147 (= c!144298 (and ((_ is Cons!36674) (toList!11393 lt!672311)) (= (_1!12671 (h!38121 (toList!11393 lt!672311))) (_1!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(declare-fun b!1566148 () Bool)

(assert (=> b!1566148 (= c!144296 (and ((_ is Cons!36674) (toList!11393 lt!672311)) (bvsgt (_1!12671 (h!38121 (toList!11393 lt!672311))) (_1!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(assert (=> b!1566148 (= e!872935 e!872938)))

(declare-fun bm!71868 () Bool)

(assert (=> bm!71868 (= call!71869 call!71871)))

(declare-fun d!163095 () Bool)

(assert (=> d!163095 e!872936))

(declare-fun res!1070553 () Bool)

(assert (=> d!163095 (=> (not res!1070553) (not e!872936))))

(assert (=> d!163095 (= res!1070553 (isStrictlySorted!985 lt!672432))))

(assert (=> d!163095 (= lt!672432 e!872937)))

(assert (=> d!163095 (= c!144297 (and ((_ is Cons!36674) (toList!11393 lt!672311)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672311))) (_1!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(assert (=> d!163095 (isStrictlySorted!985 (toList!11393 lt!672311))))

(assert (=> d!163095 (= (insertStrictlySorted!578 (toList!11393 lt!672311) (_1!12671 (tuple2!25321 lt!672307 lt!672312)) (_2!12671 (tuple2!25321 lt!672307 lt!672312))) lt!672432)))

(declare-fun bm!71866 () Bool)

(assert (=> bm!71866 (= call!71871 call!71870)))

(assert (= (and d!163095 c!144297) b!1566139))

(assert (= (and d!163095 (not c!144297)) b!1566147))

(assert (= (and b!1566147 c!144298) b!1566146))

(assert (= (and b!1566147 (not c!144298)) b!1566148))

(assert (= (and b!1566148 c!144296) b!1566144))

(assert (= (and b!1566148 (not c!144296)) b!1566141))

(assert (= (or b!1566144 b!1566141) bm!71868))

(assert (= (or b!1566146 bm!71868) bm!71866))

(assert (= (or b!1566139 bm!71866) bm!71867))

(assert (= (and bm!71867 c!144295) b!1566145))

(assert (= (and bm!71867 (not c!144295)) b!1566142))

(assert (= (and d!163095 res!1070553) b!1566140))

(assert (= (and b!1566140 res!1070554) b!1566143))

(declare-fun m!1440569 () Bool)

(assert (=> bm!71867 m!1440569))

(declare-fun m!1440571 () Bool)

(assert (=> b!1566145 m!1440571))

(declare-fun m!1440573 () Bool)

(assert (=> d!163095 m!1440573))

(declare-fun m!1440575 () Bool)

(assert (=> d!163095 m!1440575))

(declare-fun m!1440577 () Bool)

(assert (=> b!1566140 m!1440577))

(declare-fun m!1440579 () Bool)

(assert (=> b!1566143 m!1440579))

(assert (=> d!163067 d!163095))

(declare-fun d!163097 () Bool)

(assert (=> d!163097 (= (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310)) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310))))))

(declare-fun bs!45030 () Bool)

(assert (= bs!45030 d!163097))

(assert (=> bs!45030 m!1440511))

(declare-fun m!1440581 () Bool)

(assert (=> bs!45030 m!1440581))

(assert (=> b!1566107 d!163097))

(declare-fun b!1566150 () Bool)

(declare-fun e!872940 () Option!871)

(declare-fun e!872941 () Option!871)

(assert (=> b!1566150 (= e!872940 e!872941)))

(declare-fun c!144300 () Bool)

(assert (=> b!1566150 (= c!144300 (and ((_ is Cons!36674) (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)))) (not (= (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))))) lt!672310))))))

(declare-fun b!1566149 () Bool)

(assert (=> b!1566149 (= e!872940 (Some!870 (_2!12671 (h!38121 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)))))))))

(declare-fun d!163099 () Bool)

(declare-fun c!144299 () Bool)

(assert (=> d!163099 (= c!144299 (and ((_ is Cons!36674) (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)))) (= (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))))) lt!672310)))))

(assert (=> d!163099 (= (getValueByKey!796 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310) e!872940)))

(declare-fun b!1566152 () Bool)

(assert (=> b!1566152 (= e!872941 None!869)))

(declare-fun b!1566151 () Bool)

(assert (=> b!1566151 (= e!872941 (getValueByKey!796 (t!51569 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)))) lt!672310))))

(assert (= (and d!163099 c!144299) b!1566149))

(assert (= (and d!163099 (not c!144299)) b!1566150))

(assert (= (and b!1566150 c!144300) b!1566151))

(assert (= (and b!1566150 (not c!144300)) b!1566152))

(declare-fun m!1440583 () Bool)

(assert (=> b!1566151 m!1440583))

(assert (=> b!1566107 d!163099))

(declare-fun d!163101 () Bool)

(assert (=> d!163101 (= (get!26362 (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) (v!22318 (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!162995 d!163101))

(declare-fun b!1566154 () Bool)

(declare-fun e!872942 () Option!871)

(declare-fun e!872943 () Option!871)

(assert (=> b!1566154 (= e!872942 e!872943)))

(declare-fun c!144302 () Bool)

(assert (=> b!1566154 (= c!144302 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672313))) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))))

(declare-fun b!1566153 () Bool)

(assert (=> b!1566153 (= e!872942 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672313)))))))

(declare-fun c!144301 () Bool)

(declare-fun d!163103 () Bool)

(assert (=> d!163103 (= c!144301 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (= (_1!12671 (h!38121 (toList!11393 lt!672313))) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!163103 (= (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) e!872942)))

(declare-fun b!1566156 () Bool)

(assert (=> b!1566156 (= e!872943 None!869)))

(declare-fun b!1566155 () Bool)

(assert (=> b!1566155 (= e!872943 (getValueByKey!796 (t!51569 (toList!11393 lt!672313)) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!163103 c!144301) b!1566153))

(assert (= (and d!163103 (not c!144301)) b!1566154))

(assert (= (and b!1566154 c!144302) b!1566155))

(assert (= (and b!1566154 (not c!144302)) b!1566156))

(assert (=> b!1566155 m!1440237))

(declare-fun m!1440585 () Bool)

(assert (=> b!1566155 m!1440585))

(assert (=> d!162995 d!163103))

(declare-fun b!1566157 () Bool)

(declare-fun e!872946 () Bool)

(declare-fun call!71872 () Bool)

(assert (=> b!1566157 (= e!872946 call!71872)))

(declare-fun d!163105 () Bool)

(declare-fun res!1070556 () Bool)

(declare-fun e!872944 () Bool)

(assert (=> d!163105 (=> res!1070556 e!872944)))

(assert (=> d!163105 (= res!1070556 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(assert (=> d!163105 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947) e!872944)))

(declare-fun bm!71869 () Bool)

(assert (=> bm!71869 (= call!71872 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566158 () Bool)

(declare-fun e!872945 () Bool)

(assert (=> b!1566158 (= e!872946 e!872945)))

(declare-fun lt!672435 () (_ BitVec 64))

(assert (=> b!1566158 (= lt!672435 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!672434 () Unit!51846)

(assert (=> b!1566158 (= lt!672434 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672435 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1566158 (arrayContainsKey!0 _keys!637 lt!672435 #b00000000000000000000000000000000)))

(declare-fun lt!672433 () Unit!51846)

(assert (=> b!1566158 (= lt!672433 lt!672434)))

(declare-fun res!1070555 () Bool)

(assert (=> b!1566158 (= res!1070555 (= (seekEntryOrOpen!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13526 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1566158 (=> (not res!1070555) (not e!872945))))

(declare-fun b!1566159 () Bool)

(assert (=> b!1566159 (= e!872944 e!872946)))

(declare-fun c!144303 () Bool)

(assert (=> b!1566159 (= c!144303 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1566160 () Bool)

(assert (=> b!1566160 (= e!872945 call!71872)))

(assert (= (and d!163105 (not res!1070556)) b!1566159))

(assert (= (and b!1566159 c!144303) b!1566158))

(assert (= (and b!1566159 (not c!144303)) b!1566157))

(assert (= (and b!1566158 res!1070555) b!1566160))

(assert (= (or b!1566160 b!1566157) bm!71869))

(declare-fun m!1440587 () Bool)

(assert (=> bm!71869 m!1440587))

(declare-fun m!1440589 () Bool)

(assert (=> b!1566158 m!1440589))

(declare-fun m!1440591 () Bool)

(assert (=> b!1566158 m!1440591))

(declare-fun m!1440593 () Bool)

(assert (=> b!1566158 m!1440593))

(assert (=> b!1566158 m!1440589))

(declare-fun m!1440595 () Bool)

(assert (=> b!1566158 m!1440595))

(assert (=> b!1566159 m!1440589))

(assert (=> b!1566159 m!1440589))

(declare-fun m!1440597 () Bool)

(assert (=> b!1566159 m!1440597))

(assert (=> bm!71855 d!163105))

(declare-fun d!163107 () Bool)

(assert (not d!163107))

(assert (=> b!1566102 d!163107))

(declare-fun d!163109 () Bool)

(assert (=> d!163109 (= (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45031 () Bool)

(assert (= bs!45031 d!163109))

(assert (=> bs!45031 m!1440403))

(declare-fun m!1440599 () Bool)

(assert (=> bs!45031 m!1440599))

(assert (=> b!1566004 d!163109))

(declare-fun b!1566162 () Bool)

(declare-fun e!872947 () Option!871)

(declare-fun e!872948 () Option!871)

(assert (=> b!1566162 (= e!872947 e!872948)))

(declare-fun c!144305 () Bool)

(assert (=> b!1566162 (= c!144305 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672313))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566161 () Bool)

(assert (=> b!1566161 (= e!872947 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672313)))))))

(declare-fun d!163111 () Bool)

(declare-fun c!144304 () Bool)

(assert (=> d!163111 (= c!144304 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (= (_1!12671 (h!38121 (toList!11393 lt!672313))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163111 (= (getValueByKey!796 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000) e!872947)))

(declare-fun b!1566164 () Bool)

(assert (=> b!1566164 (= e!872948 None!869)))

(declare-fun b!1566163 () Bool)

(assert (=> b!1566163 (= e!872948 (getValueByKey!796 (t!51569 (toList!11393 lt!672313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163111 c!144304) b!1566161))

(assert (= (and d!163111 (not c!144304)) b!1566162))

(assert (= (and b!1566162 c!144305) b!1566163))

(assert (= (and b!1566162 (not c!144305)) b!1566164))

(declare-fun m!1440601 () Bool)

(assert (=> b!1566163 m!1440601))

(assert (=> b!1566004 d!163111))

(declare-fun d!163113 () Bool)

(assert (=> d!163113 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672436 () Unit!51846)

(assert (=> d!163113 (= lt!672436 (choose!2085 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872949 () Bool)

(assert (=> d!163113 e!872949))

(declare-fun res!1070557 () Bool)

(assert (=> d!163113 (=> (not res!1070557) (not e!872949))))

(assert (=> d!163113 (= res!1070557 (isStrictlySorted!985 (toList!11393 lt!672313)))))

(assert (=> d!163113 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672436)))

(declare-fun b!1566165 () Bool)

(assert (=> b!1566165 (= e!872949 (containsKey!849 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163113 res!1070557) b!1566165))

(assert (=> d!163113 m!1440403))

(assert (=> d!163113 m!1440403))

(assert (=> d!163113 m!1440405))

(declare-fun m!1440603 () Bool)

(assert (=> d!163113 m!1440603))

(declare-fun m!1440605 () Bool)

(assert (=> d!163113 m!1440605))

(assert (=> b!1566165 m!1440399))

(assert (=> b!1566002 d!163113))

(assert (=> b!1566002 d!163109))

(assert (=> b!1566002 d!163111))

(declare-fun d!163115 () Bool)

(assert (=> d!163115 (= (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566020 d!163115))

(assert (=> d!163001 d!162999))

(assert (=> d!163001 d!162971))

(declare-fun d!163117 () Bool)

(declare-fun res!1070558 () Bool)

(declare-fun e!872950 () Bool)

(assert (=> d!163117 (=> res!1070558 e!872950)))

(assert (=> d!163117 (= res!1070558 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (= (_1!12671 (h!38121 (toList!11393 lt!672313))) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!163117 (= (containsKey!849 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) e!872950)))

(declare-fun b!1566166 () Bool)

(declare-fun e!872951 () Bool)

(assert (=> b!1566166 (= e!872950 e!872951)))

(declare-fun res!1070559 () Bool)

(assert (=> b!1566166 (=> (not res!1070559) (not e!872951))))

(assert (=> b!1566166 (= res!1070559 (and (or (not ((_ is Cons!36674) (toList!11393 lt!672313))) (bvsle (_1!12671 (h!38121 (toList!11393 lt!672313))) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) ((_ is Cons!36674) (toList!11393 lt!672313)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672313))) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(declare-fun b!1566167 () Bool)

(assert (=> b!1566167 (= e!872951 (containsKey!849 (t!51569 (toList!11393 lt!672313)) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!163117 (not res!1070558)) b!1566166))

(assert (= (and b!1566166 res!1070559) b!1566167))

(assert (=> b!1566167 m!1440237))

(declare-fun m!1440607 () Bool)

(assert (=> b!1566167 m!1440607))

(assert (=> d!163009 d!163117))

(declare-fun b!1566168 () Bool)

(declare-fun e!872954 () Bool)

(declare-fun call!71873 () Bool)

(assert (=> b!1566168 (= e!872954 call!71873)))

(declare-fun b!1566169 () Bool)

(declare-fun e!872953 () Bool)

(assert (=> b!1566169 (= e!872953 (contains!10308 (ite c!144287 (Cons!36675 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!71870 () Bool)

(declare-fun c!144306 () Bool)

(assert (=> bm!71870 (= call!71873 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144306 (Cons!36675 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!144287 (Cons!36675 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676))) (ite c!144287 (Cons!36675 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)))))))

(declare-fun b!1566170 () Bool)

(declare-fun e!872952 () Bool)

(declare-fun e!872955 () Bool)

(assert (=> b!1566170 (= e!872952 e!872955)))

(declare-fun res!1070562 () Bool)

(assert (=> b!1566170 (=> (not res!1070562) (not e!872955))))

(assert (=> b!1566170 (= res!1070562 (not e!872953))))

(declare-fun res!1070561 () Bool)

(assert (=> b!1566170 (=> (not res!1070561) (not e!872953))))

(assert (=> b!1566170 (= res!1070561 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1566171 () Bool)

(assert (=> b!1566171 (= e!872954 call!71873)))

(declare-fun d!163119 () Bool)

(declare-fun res!1070560 () Bool)

(assert (=> d!163119 (=> res!1070560 e!872952)))

(assert (=> d!163119 (= res!1070560 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(assert (=> d!163119 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144287 (Cons!36675 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676))) e!872952)))

(declare-fun b!1566172 () Bool)

(assert (=> b!1566172 (= e!872955 e!872954)))

(assert (=> b!1566172 (= c!144306 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!163119 (not res!1070560)) b!1566170))

(assert (= (and b!1566170 res!1070561) b!1566169))

(assert (= (and b!1566170 res!1070562) b!1566172))

(assert (= (and b!1566172 c!144306) b!1566168))

(assert (= (and b!1566172 (not c!144306)) b!1566171))

(assert (= (or b!1566168 b!1566171) bm!71870))

(assert (=> b!1566169 m!1440589))

(assert (=> b!1566169 m!1440589))

(declare-fun m!1440609 () Bool)

(assert (=> b!1566169 m!1440609))

(assert (=> bm!71870 m!1440589))

(declare-fun m!1440611 () Bool)

(assert (=> bm!71870 m!1440611))

(assert (=> b!1566170 m!1440589))

(assert (=> b!1566170 m!1440589))

(assert (=> b!1566170 m!1440597))

(assert (=> b!1566172 m!1440589))

(assert (=> b!1566172 m!1440589))

(assert (=> b!1566172 m!1440597))

(assert (=> bm!71865 d!163119))

(declare-fun d!163121 () Bool)

(declare-fun res!1070563 () Bool)

(declare-fun e!872956 () Bool)

(assert (=> d!163121 (=> res!1070563 e!872956)))

(assert (=> d!163121 (= res!1070563 (and ((_ is Cons!36674) (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) (= (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163121 (= (containsKey!849 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000) e!872956)))

(declare-fun b!1566173 () Bool)

(declare-fun e!872957 () Bool)

(assert (=> b!1566173 (= e!872956 e!872957)))

(declare-fun res!1070564 () Bool)

(assert (=> b!1566173 (=> (not res!1070564) (not e!872957))))

(assert (=> b!1566173 (= res!1070564 (and (or (not ((_ is Cons!36674) (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))) (bvsle (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36674) (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) (bvslt (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566174 () Bool)

(assert (=> b!1566174 (= e!872957 (containsKey!849 (t!51569 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163121 (not res!1070563)) b!1566173))

(assert (= (and b!1566173 res!1070564) b!1566174))

(declare-fun m!1440613 () Bool)

(assert (=> b!1566174 m!1440613))

(assert (=> d!162999 d!163121))

(declare-fun d!163123 () Bool)

(declare-fun res!1070565 () Bool)

(declare-fun e!872958 () Bool)

(assert (=> d!163123 (=> res!1070565 e!872958)))

(assert (=> d!163123 (= res!1070565 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (= (_1!12671 (h!38121 (toList!11393 lt!672313))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163123 (= (containsKey!849 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000) e!872958)))

(declare-fun b!1566175 () Bool)

(declare-fun e!872959 () Bool)

(assert (=> b!1566175 (= e!872958 e!872959)))

(declare-fun res!1070566 () Bool)

(assert (=> b!1566175 (=> (not res!1070566) (not e!872959))))

(assert (=> b!1566175 (= res!1070566 (and (or (not ((_ is Cons!36674) (toList!11393 lt!672313))) (bvsle (_1!12671 (h!38121 (toList!11393 lt!672313))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36674) (toList!11393 lt!672313)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672313))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566176 () Bool)

(assert (=> b!1566176 (= e!872959 (containsKey!849 (t!51569 (toList!11393 lt!672313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163123 (not res!1070565)) b!1566175))

(assert (= (and b!1566175 res!1070566) b!1566176))

(declare-fun m!1440615 () Bool)

(assert (=> b!1566176 m!1440615))

(assert (=> d!163007 d!163123))

(assert (=> d!163043 d!163045))

(declare-fun d!163125 () Bool)

(assert (=> d!163125 (arrayContainsKey!0 _keys!637 lt!672345 #b00000000000000000000000000000000)))

(assert (=> d!163125 true))

(declare-fun _$60!454 () Unit!51846)

(assert (=> d!163125 (= (choose!13 _keys!637 lt!672345 #b00000000000000000000000000000000) _$60!454)))

(declare-fun bs!45032 () Bool)

(assert (= bs!45032 d!163125))

(assert (=> bs!45032 m!1440309))

(assert (=> d!163043 d!163125))

(declare-fun d!163127 () Bool)

(assert (=> d!163127 (= (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (and (not (= (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1565981 d!163127))

(declare-fun lt!672437 () Bool)

(declare-fun d!163129 () Bool)

(assert (=> d!163129 (= lt!672437 (select (content!798 (toList!11393 lt!672410)) (tuple2!25321 lt!672307 lt!672312)))))

(declare-fun e!872960 () Bool)

(assert (=> d!163129 (= lt!672437 e!872960)))

(declare-fun res!1070567 () Bool)

(assert (=> d!163129 (=> (not res!1070567) (not e!872960))))

(assert (=> d!163129 (= res!1070567 ((_ is Cons!36674) (toList!11393 lt!672410)))))

(assert (=> d!163129 (= (contains!10307 (toList!11393 lt!672410) (tuple2!25321 lt!672307 lt!672312)) lt!672437)))

(declare-fun b!1566177 () Bool)

(declare-fun e!872961 () Bool)

(assert (=> b!1566177 (= e!872960 e!872961)))

(declare-fun res!1070568 () Bool)

(assert (=> b!1566177 (=> res!1070568 e!872961)))

(assert (=> b!1566177 (= res!1070568 (= (h!38121 (toList!11393 lt!672410)) (tuple2!25321 lt!672307 lt!672312)))))

(declare-fun b!1566178 () Bool)

(assert (=> b!1566178 (= e!872961 (contains!10307 (t!51569 (toList!11393 lt!672410)) (tuple2!25321 lt!672307 lt!672312)))))

(assert (= (and d!163129 res!1070567) b!1566177))

(assert (= (and b!1566177 (not res!1070568)) b!1566178))

(declare-fun m!1440617 () Bool)

(assert (=> d!163129 m!1440617))

(declare-fun m!1440619 () Bool)

(assert (=> d!163129 m!1440619))

(declare-fun m!1440621 () Bool)

(assert (=> b!1566178 m!1440621))

(assert (=> b!1566104 d!163129))

(declare-fun d!163131 () Bool)

(declare-fun e!872963 () Bool)

(assert (=> d!163131 e!872963))

(declare-fun res!1070569 () Bool)

(assert (=> d!163131 (=> res!1070569 e!872963)))

(declare-fun lt!672440 () Bool)

(assert (=> d!163131 (= res!1070569 (not lt!672440))))

(declare-fun lt!672441 () Bool)

(assert (=> d!163131 (= lt!672440 lt!672441)))

(declare-fun lt!672439 () Unit!51846)

(declare-fun e!872962 () Unit!51846)

(assert (=> d!163131 (= lt!672439 e!872962)))

(declare-fun c!144307 () Bool)

(assert (=> d!163131 (= c!144307 lt!672441)))

(assert (=> d!163131 (= lt!672441 (containsKey!849 (toList!11393 lt!672360) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> d!163131 (= (contains!10306 lt!672360 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) lt!672440)))

(declare-fun b!1566179 () Bool)

(declare-fun lt!672438 () Unit!51846)

(assert (=> b!1566179 (= e!872962 lt!672438)))

(assert (=> b!1566179 (= lt!672438 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672360) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1566179 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672360) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun b!1566180 () Bool)

(declare-fun Unit!51860 () Unit!51846)

(assert (=> b!1566180 (= e!872962 Unit!51860)))

(declare-fun b!1566181 () Bool)

(assert (=> b!1566181 (= e!872963 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672360) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))))

(assert (= (and d!163131 c!144307) b!1566179))

(assert (= (and d!163131 (not c!144307)) b!1566180))

(assert (= (and d!163131 (not res!1070569)) b!1566181))

(assert (=> d!163131 m!1440347))

(declare-fun m!1440623 () Bool)

(assert (=> d!163131 m!1440623))

(assert (=> b!1566179 m!1440347))

(declare-fun m!1440625 () Bool)

(assert (=> b!1566179 m!1440625))

(assert (=> b!1566179 m!1440347))

(declare-fun m!1440627 () Bool)

(assert (=> b!1566179 m!1440627))

(assert (=> b!1566179 m!1440627))

(declare-fun m!1440629 () Bool)

(assert (=> b!1566179 m!1440629))

(assert (=> b!1566181 m!1440347))

(assert (=> b!1566181 m!1440627))

(assert (=> b!1566181 m!1440627))

(assert (=> b!1566181 m!1440629))

(assert (=> b!1565979 d!163131))

(declare-fun d!163133 () Bool)

(assert (=> d!163133 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672442 () Unit!51846)

(assert (=> d!163133 (= lt!672442 (choose!2085 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872964 () Bool)

(assert (=> d!163133 e!872964))

(declare-fun res!1070570 () Bool)

(assert (=> d!163133 (=> (not res!1070570) (not e!872964))))

(assert (=> d!163133 (= res!1070570 (isStrictlySorted!985 (toList!11393 lt!672253)))))

(assert (=> d!163133 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672442)))

(declare-fun b!1566182 () Bool)

(assert (=> b!1566182 (= e!872964 (containsKey!849 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163133 res!1070570) b!1566182))

(assert (=> d!163133 m!1440341))

(assert (=> d!163133 m!1440341))

(assert (=> d!163133 m!1440343))

(declare-fun m!1440631 () Bool)

(assert (=> d!163133 m!1440631))

(assert (=> d!163133 m!1440475))

(assert (=> b!1566182 m!1440337))

(assert (=> b!1565970 d!163133))

(declare-fun d!163135 () Bool)

(assert (=> d!163135 (= (isDefined!584 (getValueByKey!796 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45033 () Bool)

(assert (= bs!45033 d!163135))

(assert (=> bs!45033 m!1440341))

(declare-fun m!1440633 () Bool)

(assert (=> bs!45033 m!1440633))

(assert (=> b!1565970 d!163135))

(declare-fun b!1566184 () Bool)

(declare-fun e!872965 () Option!871)

(declare-fun e!872966 () Option!871)

(assert (=> b!1566184 (= e!872965 e!872966)))

(declare-fun c!144309 () Bool)

(assert (=> b!1566184 (= c!144309 (and ((_ is Cons!36674) (toList!11393 lt!672253)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672253))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566183 () Bool)

(assert (=> b!1566183 (= e!872965 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672253)))))))

(declare-fun d!163137 () Bool)

(declare-fun c!144308 () Bool)

(assert (=> d!163137 (= c!144308 (and ((_ is Cons!36674) (toList!11393 lt!672253)) (= (_1!12671 (h!38121 (toList!11393 lt!672253))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163137 (= (getValueByKey!796 (toList!11393 lt!672253) #b0000000000000000000000000000000000000000000000000000000000000000) e!872965)))

(declare-fun b!1566186 () Bool)

(assert (=> b!1566186 (= e!872966 None!869)))

(declare-fun b!1566185 () Bool)

(assert (=> b!1566185 (= e!872966 (getValueByKey!796 (t!51569 (toList!11393 lt!672253)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163137 c!144308) b!1566183))

(assert (= (and d!163137 (not c!144308)) b!1566184))

(assert (= (and b!1566184 c!144309) b!1566185))

(assert (= (and b!1566184 (not c!144309)) b!1566186))

(declare-fun m!1440635 () Bool)

(assert (=> b!1566185 m!1440635))

(assert (=> b!1565970 d!163137))

(declare-fun b!1566187 () Bool)

(declare-fun e!872969 () List!36678)

(declare-fun call!71875 () List!36678)

(assert (=> b!1566187 (= e!872969 call!71875)))

(declare-fun b!1566188 () Bool)

(declare-fun res!1070572 () Bool)

(declare-fun e!872968 () Bool)

(assert (=> b!1566188 (=> (not res!1070572) (not e!872968))))

(declare-fun lt!672443 () List!36678)

(assert (=> b!1566188 (= res!1070572 (containsKey!849 lt!672443 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun b!1566189 () Bool)

(declare-fun e!872970 () List!36678)

(declare-fun call!71874 () List!36678)

(assert (=> b!1566189 (= e!872970 call!71874)))

(declare-fun e!872971 () List!36678)

(declare-fun b!1566190 () Bool)

(declare-fun c!144313 () Bool)

(declare-fun c!144311 () Bool)

(assert (=> b!1566190 (= e!872971 (ite c!144313 (t!51569 (t!51569 (toList!11393 lt!672253))) (ite c!144311 (Cons!36674 (h!38121 (t!51569 (toList!11393 lt!672253))) (t!51569 (t!51569 (toList!11393 lt!672253)))) Nil!36675)))))

(declare-fun b!1566191 () Bool)

(assert (=> b!1566191 (= e!872968 (contains!10307 lt!672443 (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566192 () Bool)

(assert (=> b!1566192 (= e!872970 call!71874)))

(declare-fun c!144312 () Bool)

(declare-fun bm!71872 () Bool)

(assert (=> bm!71872 (= call!71875 ($colon$colon!989 e!872971 (ite c!144312 (h!38121 (t!51569 (toList!11393 lt!672253))) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))))

(declare-fun c!144310 () Bool)

(assert (=> bm!71872 (= c!144310 c!144312)))

(declare-fun b!1566193 () Bool)

(assert (=> b!1566193 (= e!872971 (insertStrictlySorted!578 (t!51569 (t!51569 (toList!11393 lt!672253))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun b!1566194 () Bool)

(declare-fun e!872967 () List!36678)

(declare-fun call!71876 () List!36678)

(assert (=> b!1566194 (= e!872967 call!71876)))

(declare-fun b!1566195 () Bool)

(assert (=> b!1566195 (= e!872969 e!872967)))

(assert (=> b!1566195 (= c!144313 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672253))) (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672253)))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566196 () Bool)

(assert (=> b!1566196 (= c!144311 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672253))) (bvsgt (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672253)))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> b!1566196 (= e!872967 e!872970)))

(declare-fun bm!71873 () Bool)

(assert (=> bm!71873 (= call!71874 call!71876)))

(declare-fun d!163139 () Bool)

(assert (=> d!163139 e!872968))

(declare-fun res!1070571 () Bool)

(assert (=> d!163139 (=> (not res!1070571) (not e!872968))))

(assert (=> d!163139 (= res!1070571 (isStrictlySorted!985 lt!672443))))

(assert (=> d!163139 (= lt!672443 e!872969)))

(assert (=> d!163139 (= c!144312 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672253))) (bvslt (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672253)))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163139 (isStrictlySorted!985 (t!51569 (toList!11393 lt!672253)))))

(assert (=> d!163139 (= (insertStrictlySorted!578 (t!51569 (toList!11393 lt!672253)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) lt!672443)))

(declare-fun bm!71871 () Bool)

(assert (=> bm!71871 (= call!71876 call!71875)))

(assert (= (and d!163139 c!144312) b!1566187))

(assert (= (and d!163139 (not c!144312)) b!1566195))

(assert (= (and b!1566195 c!144313) b!1566194))

(assert (= (and b!1566195 (not c!144313)) b!1566196))

(assert (= (and b!1566196 c!144311) b!1566192))

(assert (= (and b!1566196 (not c!144311)) b!1566189))

(assert (= (or b!1566192 b!1566189) bm!71873))

(assert (= (or b!1566194 bm!71873) bm!71871))

(assert (= (or b!1566187 bm!71871) bm!71872))

(assert (= (and bm!71872 c!144310) b!1566193))

(assert (= (and bm!71872 (not c!144310)) b!1566190))

(assert (= (and d!163139 res!1070571) b!1566188))

(assert (= (and b!1566188 res!1070572) b!1566191))

(declare-fun m!1440637 () Bool)

(assert (=> bm!71872 m!1440637))

(declare-fun m!1440639 () Bool)

(assert (=> b!1566193 m!1440639))

(declare-fun m!1440641 () Bool)

(assert (=> d!163139 m!1440641))

(declare-fun m!1440643 () Bool)

(assert (=> d!163139 m!1440643))

(declare-fun m!1440645 () Bool)

(assert (=> b!1566188 m!1440645))

(declare-fun m!1440647 () Bool)

(assert (=> b!1566191 m!1440647))

(assert (=> b!1566085 d!163139))

(declare-fun lt!672444 () Bool)

(declare-fun d!163141 () Bool)

(assert (=> d!163141 (= lt!672444 (select (content!798 (toList!11393 lt!672418)) (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!872972 () Bool)

(assert (=> d!163141 (= lt!672444 e!872972)))

(declare-fun res!1070573 () Bool)

(assert (=> d!163141 (=> (not res!1070573) (not e!872972))))

(assert (=> d!163141 (= res!1070573 ((_ is Cons!36674) (toList!11393 lt!672418)))))

(assert (=> d!163141 (= (contains!10307 (toList!11393 lt!672418) (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!672444)))

(declare-fun b!1566197 () Bool)

(declare-fun e!872973 () Bool)

(assert (=> b!1566197 (= e!872972 e!872973)))

(declare-fun res!1070574 () Bool)

(assert (=> b!1566197 (=> res!1070574 e!872973)))

(assert (=> b!1566197 (= res!1070574 (= (h!38121 (toList!11393 lt!672418)) (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1566198 () Bool)

(assert (=> b!1566198 (= e!872973 (contains!10307 (t!51569 (toList!11393 lt!672418)) (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!163141 res!1070573) b!1566197))

(assert (= (and b!1566197 (not res!1070574)) b!1566198))

(declare-fun m!1440649 () Bool)

(assert (=> d!163141 m!1440649))

(declare-fun m!1440651 () Bool)

(assert (=> d!163141 m!1440651))

(declare-fun m!1440653 () Bool)

(assert (=> b!1566198 m!1440653))

(assert (=> b!1566109 d!163141))

(declare-fun d!163143 () Bool)

(declare-fun res!1070575 () Bool)

(declare-fun e!872974 () Bool)

(assert (=> d!163143 (=> res!1070575 e!872974)))

(assert (=> d!163143 (= res!1070575 (and ((_ is Cons!36674) (toList!11393 lt!672330)) (= (_1!12671 (h!38121 (toList!11393 lt!672330))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163143 (= (containsKey!849 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) e!872974)))

(declare-fun b!1566199 () Bool)

(declare-fun e!872975 () Bool)

(assert (=> b!1566199 (= e!872974 e!872975)))

(declare-fun res!1070576 () Bool)

(assert (=> b!1566199 (=> (not res!1070576) (not e!872975))))

(assert (=> b!1566199 (= res!1070576 (and (or (not ((_ is Cons!36674) (toList!11393 lt!672330))) (bvsle (_1!12671 (h!38121 (toList!11393 lt!672330))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) ((_ is Cons!36674) (toList!11393 lt!672330)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672330))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566200 () Bool)

(assert (=> b!1566200 (= e!872975 (containsKey!849 (t!51569 (toList!11393 lt!672330)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (= (and d!163143 (not res!1070575)) b!1566199))

(assert (= (and b!1566199 res!1070576) b!1566200))

(declare-fun m!1440655 () Bool)

(assert (=> b!1566200 m!1440655))

(assert (=> d!163049 d!163143))

(declare-fun b!1566202 () Bool)

(declare-fun e!872976 () Option!871)

(declare-fun e!872977 () Option!871)

(assert (=> b!1566202 (= e!872976 e!872977)))

(declare-fun c!144315 () Bool)

(assert (=> b!1566202 (= c!144315 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (not (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566201 () Bool)

(assert (=> b!1566201 (= e!872976 (Some!870 (_2!12671 (h!38121 (t!51569 (toList!11393 lt!672254))))))))

(declare-fun d!163145 () Bool)

(declare-fun c!144314 () Bool)

(assert (=> d!163145 (= c!144314 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163145 (= (getValueByKey!796 (t!51569 (toList!11393 lt!672254)) #b1000000000000000000000000000000000000000000000000000000000000000) e!872976)))

(declare-fun b!1566204 () Bool)

(assert (=> b!1566204 (= e!872977 None!869)))

(declare-fun b!1566203 () Bool)

(assert (=> b!1566203 (= e!872977 (getValueByKey!796 (t!51569 (t!51569 (toList!11393 lt!672254))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163145 c!144314) b!1566201))

(assert (= (and d!163145 (not c!144314)) b!1566202))

(assert (= (and b!1566202 c!144315) b!1566203))

(assert (= (and b!1566202 (not c!144315)) b!1566204))

(declare-fun m!1440657 () Bool)

(assert (=> b!1566203 m!1440657))

(assert (=> b!1566016 d!163145))

(declare-fun d!163147 () Bool)

(assert (=> d!163147 (= (content!799 Nil!36676) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!163065 d!163147))

(assert (=> b!1565972 d!163135))

(assert (=> b!1565972 d!163137))

(declare-fun d!163149 () Bool)

(assert (=> d!163149 (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310))))

(declare-fun lt!672445 () Unit!51846)

(assert (=> d!163149 (= lt!672445 (choose!2085 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310))))

(declare-fun e!872978 () Bool)

(assert (=> d!163149 e!872978))

(declare-fun res!1070577 () Bool)

(assert (=> d!163149 (=> (not res!1070577) (not e!872978))))

(assert (=> d!163149 (= res!1070577 (isStrictlySorted!985 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)))))))

(assert (=> d!163149 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310) lt!672445)))

(declare-fun b!1566205 () Bool)

(assert (=> b!1566205 (= e!872978 (containsKey!849 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310))))

(assert (= (and d!163149 res!1070577) b!1566205))

(assert (=> d!163149 m!1440511))

(assert (=> d!163149 m!1440511))

(assert (=> d!163149 m!1440513))

(declare-fun m!1440659 () Bool)

(assert (=> d!163149 m!1440659))

(declare-fun m!1440661 () Bool)

(assert (=> d!163149 m!1440661))

(assert (=> b!1566205 m!1440507))

(assert (=> b!1566105 d!163149))

(assert (=> b!1566105 d!163097))

(assert (=> b!1566105 d!163099))

(declare-fun d!163151 () Bool)

(declare-fun res!1070578 () Bool)

(declare-fun e!872979 () Bool)

(assert (=> d!163151 (=> res!1070578 e!872979)))

(assert (=> d!163151 (= res!1070578 (= (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!672345))))

(assert (=> d!163151 (= (arrayContainsKey!0 _keys!637 lt!672345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!872979)))

(declare-fun b!1566206 () Bool)

(declare-fun e!872980 () Bool)

(assert (=> b!1566206 (= e!872979 e!872980)))

(declare-fun res!1070579 () Bool)

(assert (=> b!1566206 (=> (not res!1070579) (not e!872980))))

(assert (=> b!1566206 (= res!1070579 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun b!1566207 () Bool)

(assert (=> b!1566207 (= e!872980 (arrayContainsKey!0 _keys!637 lt!672345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!163151 (not res!1070578)) b!1566206))

(assert (= (and b!1566206 res!1070579) b!1566207))

(assert (=> d!163151 m!1440425))

(declare-fun m!1440663 () Bool)

(assert (=> b!1566207 m!1440663))

(assert (=> b!1566027 d!163151))

(declare-fun d!163153 () Bool)

(assert (=> d!163153 (= (get!26361 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565965 d!163153))

(declare-fun b!1566226 () Bool)

(declare-fun lt!672451 () SeekEntryResult!13526)

(assert (=> b!1566226 (and (bvsge (index!56504 lt!672451) #b00000000000000000000000000000000) (bvslt (index!56504 lt!672451) (size!51007 _keys!637)))))

(declare-fun res!1070586 () Bool)

(assert (=> b!1566226 (= res!1070586 (= (select (arr!50455 _keys!637) (index!56504 lt!672451)) (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!872991 () Bool)

(assert (=> b!1566226 (=> res!1070586 e!872991)))

(declare-fun e!872992 () Bool)

(assert (=> b!1566226 (= e!872992 e!872991)))

(declare-fun b!1566227 () Bool)

(declare-fun e!872995 () SeekEntryResult!13526)

(declare-fun e!872994 () SeekEntryResult!13526)

(assert (=> b!1566227 (= e!872995 e!872994)))

(declare-fun c!144323 () Bool)

(declare-fun lt!672450 () (_ BitVec 64))

(assert (=> b!1566227 (= c!144323 (or (= lt!672450 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)) (= (bvadd lt!672450 lt!672450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566228 () Bool)

(assert (=> b!1566228 (and (bvsge (index!56504 lt!672451) #b00000000000000000000000000000000) (bvslt (index!56504 lt!672451) (size!51007 _keys!637)))))

(declare-fun res!1070587 () Bool)

(assert (=> b!1566228 (= res!1070587 (= (select (arr!50455 _keys!637) (index!56504 lt!672451)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566228 (=> res!1070587 e!872991)))

(declare-fun d!163155 () Bool)

(declare-fun e!872993 () Bool)

(assert (=> d!163155 e!872993))

(declare-fun c!144322 () Bool)

(assert (=> d!163155 (= c!144322 (and ((_ is Intermediate!13526) lt!672451) (undefined!14338 lt!672451)))))

(assert (=> d!163155 (= lt!672451 e!872995)))

(declare-fun c!144324 () Bool)

(assert (=> d!163155 (= c!144324 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!163155 (= lt!672450 (select (arr!50455 _keys!637) (toIndex!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) mask!947)))))

(assert (=> d!163155 (validMask!0 mask!947)))

(assert (=> d!163155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50455 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!672451)))

(declare-fun b!1566229 () Bool)

(assert (=> b!1566229 (= e!872993 e!872992)))

(declare-fun res!1070588 () Bool)

(assert (=> b!1566229 (= res!1070588 (and ((_ is Intermediate!13526) lt!672451) (not (undefined!14338 lt!672451)) (bvslt (x!140744 lt!672451) #b01111111111111111111111111111110) (bvsge (x!140744 lt!672451) #b00000000000000000000000000000000) (bvsge (x!140744 lt!672451) #b00000000000000000000000000000000)))))

(assert (=> b!1566229 (=> (not res!1070588) (not e!872992))))

(declare-fun b!1566230 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1566230 (= e!872994 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) mask!947) #b00000000000000000000000000000000 mask!947) (select (arr!50455 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun b!1566231 () Bool)

(assert (=> b!1566231 (= e!872995 (Intermediate!13526 true (toIndex!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) mask!947) #b00000000000000000000000000000000))))

(declare-fun b!1566232 () Bool)

(assert (=> b!1566232 (= e!872993 (bvsge (x!140744 lt!672451) #b01111111111111111111111111111110))))

(declare-fun b!1566233 () Bool)

(assert (=> b!1566233 (= e!872994 (Intermediate!13526 false (toIndex!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) mask!947) #b00000000000000000000000000000000))))

(declare-fun b!1566234 () Bool)

(assert (=> b!1566234 (and (bvsge (index!56504 lt!672451) #b00000000000000000000000000000000) (bvslt (index!56504 lt!672451) (size!51007 _keys!637)))))

(assert (=> b!1566234 (= e!872991 (= (select (arr!50455 _keys!637) (index!56504 lt!672451)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163155 c!144324) b!1566231))

(assert (= (and d!163155 (not c!144324)) b!1566227))

(assert (= (and b!1566227 c!144323) b!1566233))

(assert (= (and b!1566227 (not c!144323)) b!1566230))

(assert (= (and d!163155 c!144322) b!1566232))

(assert (= (and d!163155 (not c!144322)) b!1566229))

(assert (= (and b!1566229 res!1070588) b!1566226))

(assert (= (and b!1566226 (not res!1070586)) b!1566228))

(assert (= (and b!1566228 (not res!1070587)) b!1566234))

(assert (=> b!1566230 m!1440445))

(declare-fun m!1440665 () Bool)

(assert (=> b!1566230 m!1440665))

(assert (=> b!1566230 m!1440665))

(assert (=> b!1566230 m!1440289))

(declare-fun m!1440667 () Bool)

(assert (=> b!1566230 m!1440667))

(declare-fun m!1440669 () Bool)

(assert (=> b!1566234 m!1440669))

(assert (=> b!1566226 m!1440669))

(assert (=> d!163155 m!1440445))

(declare-fun m!1440671 () Bool)

(assert (=> d!163155 m!1440671))

(assert (=> d!163155 m!1440123))

(assert (=> b!1566228 m!1440669))

(assert (=> d!163047 d!163155))

(declare-fun d!163157 () Bool)

(declare-fun lt!672457 () (_ BitVec 32))

(declare-fun lt!672456 () (_ BitVec 32))

(assert (=> d!163157 (= lt!672457 (bvmul (bvxor lt!672456 (bvlshr lt!672456 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!163157 (= lt!672456 ((_ extract 31 0) (bvand (bvxor (select (arr!50455 _keys!637) #b00000000000000000000000000000000) (bvlshr (select (arr!50455 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!163157 (and (bvsge mask!947 #b00000000000000000000000000000000) (let ((res!1070589 (let ((h!38126 ((_ extract 31 0) (bvand (bvxor (select (arr!50455 _keys!637) #b00000000000000000000000000000000) (bvlshr (select (arr!50455 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!140754 (bvmul (bvxor h!38126 (bvlshr h!38126 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!140754 (bvlshr x!140754 #b00000000000000000000000000001101)) mask!947))))) (and (bvslt res!1070589 (bvadd mask!947 #b00000000000000000000000000000001)) (bvsge res!1070589 #b00000000000000000000000000000000))))))

(assert (=> d!163157 (= (toIndex!0 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) mask!947) (bvand (bvxor lt!672457 (bvlshr lt!672457 #b00000000000000000000000000001101)) mask!947))))

(assert (=> d!163047 d!163157))

(assert (=> d!163047 d!162973))

(assert (=> d!163021 d!163015))

(assert (=> d!163021 d!163017))

(declare-fun d!163159 () Bool)

(assert (=> d!163159 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163159 true))

(declare-fun _$12!489 () Unit!51846)

(assert (=> d!163159 (= (choose!2085 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000) _$12!489)))

(declare-fun bs!45034 () Bool)

(assert (= bs!45034 d!163159))

(assert (=> bs!45034 m!1440273))

(assert (=> bs!45034 m!1440273))

(assert (=> bs!45034 m!1440275))

(assert (=> d!163021 d!163159))

(declare-fun d!163161 () Bool)

(declare-fun res!1070590 () Bool)

(declare-fun e!872996 () Bool)

(assert (=> d!163161 (=> res!1070590 e!872996)))

(assert (=> d!163161 (= res!1070590 (or ((_ is Nil!36675) (toList!11393 lt!672254)) ((_ is Nil!36675) (t!51569 (toList!11393 lt!672254)))))))

(assert (=> d!163161 (= (isStrictlySorted!985 (toList!11393 lt!672254)) e!872996)))

(declare-fun b!1566235 () Bool)

(declare-fun e!872997 () Bool)

(assert (=> b!1566235 (= e!872996 e!872997)))

(declare-fun res!1070591 () Bool)

(assert (=> b!1566235 (=> (not res!1070591) (not e!872997))))

(assert (=> b!1566235 (= res!1070591 (bvslt (_1!12671 (h!38121 (toList!11393 lt!672254))) (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254))))))))

(declare-fun b!1566236 () Bool)

(assert (=> b!1566236 (= e!872997 (isStrictlySorted!985 (t!51569 (toList!11393 lt!672254))))))

(assert (= (and d!163161 (not res!1070590)) b!1566235))

(assert (= (and b!1566235 res!1070591) b!1566236))

(declare-fun m!1440673 () Bool)

(assert (=> b!1566236 m!1440673))

(assert (=> d!163021 d!163161))

(declare-fun d!163163 () Bool)

(assert (=> d!163163 (= (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))))

(declare-fun bs!45035 () Bool)

(assert (= bs!45035 d!163163))

(assert (=> bs!45035 m!1440321))

(declare-fun m!1440675 () Bool)

(assert (=> bs!45035 m!1440675))

(assert (=> b!1565990 d!163163))

(assert (=> b!1565990 d!163103))

(declare-fun d!163165 () Bool)

(assert (=> d!163165 (= (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45036 () Bool)

(assert (= bs!45036 d!163165))

(assert (=> bs!45036 m!1440333))

(declare-fun m!1440677 () Bool)

(assert (=> bs!45036 m!1440677))

(assert (=> b!1565968 d!163165))

(declare-fun b!1566238 () Bool)

(declare-fun e!872998 () Option!871)

(declare-fun e!872999 () Option!871)

(assert (=> b!1566238 (= e!872998 e!872999)))

(declare-fun c!144326 () Bool)

(assert (=> b!1566238 (= c!144326 (and ((_ is Cons!36674) (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) (not (= (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566237 () Bool)

(assert (=> b!1566237 (= e!872998 (Some!870 (_2!12671 (h!38121 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))))

(declare-fun c!144325 () Bool)

(declare-fun d!163167 () Bool)

(assert (=> d!163167 (= c!144325 (and ((_ is Cons!36674) (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) (= (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163167 (= (getValueByKey!796 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000) e!872998)))

(declare-fun b!1566240 () Bool)

(assert (=> b!1566240 (= e!872999 None!869)))

(declare-fun b!1566239 () Bool)

(assert (=> b!1566239 (= e!872999 (getValueByKey!796 (t!51569 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163167 c!144325) b!1566237))

(assert (= (and d!163167 (not c!144325)) b!1566238))

(assert (= (and b!1566238 c!144326) b!1566239))

(assert (= (and b!1566238 (not c!144326)) b!1566240))

(declare-fun m!1440679 () Bool)

(assert (=> b!1566239 m!1440679))

(assert (=> b!1565968 d!163167))

(declare-fun d!163169 () Bool)

(assert (=> d!163169 (= (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45037 () Bool)

(assert (= bs!45037 d!163169))

(assert (=> bs!45037 m!1440377))

(declare-fun m!1440681 () Bool)

(assert (=> bs!45037 m!1440681))

(assert (=> b!1565987 d!163169))

(declare-fun b!1566242 () Bool)

(declare-fun e!873000 () Option!871)

(declare-fun e!873001 () Option!871)

(assert (=> b!1566242 (= e!873000 e!873001)))

(declare-fun c!144328 () Bool)

(assert (=> b!1566242 (= c!144328 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672313))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566241 () Bool)

(assert (=> b!1566241 (= e!873000 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672313)))))))

(declare-fun d!163171 () Bool)

(declare-fun c!144327 () Bool)

(assert (=> d!163171 (= c!144327 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (= (_1!12671 (h!38121 (toList!11393 lt!672313))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163171 (= (getValueByKey!796 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000) e!873000)))

(declare-fun b!1566244 () Bool)

(assert (=> b!1566244 (= e!873001 None!869)))

(declare-fun b!1566243 () Bool)

(assert (=> b!1566243 (= e!873001 (getValueByKey!796 (t!51569 (toList!11393 lt!672313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163171 c!144327) b!1566241))

(assert (= (and d!163171 (not c!144327)) b!1566242))

(assert (= (and b!1566242 c!144328) b!1566243))

(assert (= (and b!1566242 (not c!144328)) b!1566244))

(declare-fun m!1440683 () Bool)

(assert (=> b!1566243 m!1440683))

(assert (=> b!1565987 d!163171))

(declare-fun d!163173 () Bool)

(assert (=> d!163173 (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672458 () Unit!51846)

(assert (=> d!163173 (= lt!672458 (choose!2085 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873002 () Bool)

(assert (=> d!163173 e!873002))

(declare-fun res!1070592 () Bool)

(assert (=> d!163173 (=> (not res!1070592) (not e!873002))))

(assert (=> d!163173 (= res!1070592 (isStrictlySorted!985 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163173 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672458)))

(declare-fun b!1566245 () Bool)

(assert (=> b!1566245 (= e!873002 (containsKey!849 (toList!11393 (+!5114 lt!672253 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163173 res!1070592) b!1566245))

(assert (=> d!163173 m!1440333))

(assert (=> d!163173 m!1440333))

(assert (=> d!163173 m!1440335))

(declare-fun m!1440685 () Bool)

(assert (=> d!163173 m!1440685))

(declare-fun m!1440687 () Bool)

(assert (=> d!163173 m!1440687))

(assert (=> b!1566245 m!1440329))

(assert (=> b!1565966 d!163173))

(assert (=> b!1565966 d!163165))

(assert (=> b!1565966 d!163167))

(declare-fun d!163175 () Bool)

(assert (=> d!163175 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672459 () Unit!51846)

(assert (=> d!163175 (= lt!672459 (choose!2085 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873003 () Bool)

(assert (=> d!163175 e!873003))

(declare-fun res!1070593 () Bool)

(assert (=> d!163175 (=> (not res!1070593) (not e!873003))))

(assert (=> d!163175 (= res!1070593 (isStrictlySorted!985 (toList!11393 lt!672313)))))

(assert (=> d!163175 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000) lt!672459)))

(declare-fun b!1566246 () Bool)

(assert (=> b!1566246 (= e!873003 (containsKey!849 (toList!11393 lt!672313) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163175 res!1070593) b!1566246))

(assert (=> d!163175 m!1440377))

(assert (=> d!163175 m!1440377))

(assert (=> d!163175 m!1440379))

(declare-fun m!1440689 () Bool)

(assert (=> d!163175 m!1440689))

(assert (=> d!163175 m!1440605))

(assert (=> b!1566246 m!1440373))

(assert (=> b!1565985 d!163175))

(assert (=> b!1565985 d!163169))

(assert (=> b!1565985 d!163171))

(declare-fun d!163177 () Bool)

(declare-fun res!1070594 () Bool)

(declare-fun e!873004 () Bool)

(assert (=> d!163177 (=> res!1070594 e!873004)))

(assert (=> d!163177 (= res!1070594 (and ((_ is Cons!36674) lt!672331) (= (_1!12671 (h!38121 lt!672331)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163177 (= (containsKey!849 lt!672331 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) e!873004)))

(declare-fun b!1566247 () Bool)

(declare-fun e!873005 () Bool)

(assert (=> b!1566247 (= e!873004 e!873005)))

(declare-fun res!1070595 () Bool)

(assert (=> b!1566247 (=> (not res!1070595) (not e!873005))))

(assert (=> b!1566247 (= res!1070595 (and (or (not ((_ is Cons!36674) lt!672331)) (bvsle (_1!12671 (h!38121 lt!672331)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) ((_ is Cons!36674) lt!672331) (bvslt (_1!12671 (h!38121 lt!672331)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566248 () Bool)

(assert (=> b!1566248 (= e!873005 (containsKey!849 (t!51569 lt!672331) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (= (and d!163177 (not res!1070594)) b!1566247))

(assert (= (and b!1566247 res!1070595) b!1566248))

(declare-fun m!1440691 () Bool)

(assert (=> b!1566248 m!1440691))

(assert (=> b!1566057 d!163177))

(assert (=> b!1566096 d!162989))

(declare-fun d!163179 () Bool)

(assert (=> d!163179 (= (isDefined!584 (getValueByKey!796 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) (not (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))))

(declare-fun bs!45038 () Bool)

(assert (= bs!45038 d!163179))

(assert (=> bs!45038 m!1440285))

(declare-fun m!1440693 () Bool)

(assert (=> bs!45038 m!1440693))

(assert (=> b!1566048 d!163179))

(assert (=> b!1566048 d!163011))

(assert (=> b!1565973 d!163127))

(declare-fun d!163181 () Bool)

(assert (=> d!163181 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun lt!672460 () Unit!51846)

(assert (=> d!163181 (= lt!672460 (choose!2085 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(declare-fun e!873006 () Bool)

(assert (=> d!163181 e!873006))

(declare-fun res!1070596 () Bool)

(assert (=> d!163181 (=> (not res!1070596) (not e!873006))))

(assert (=> d!163181 (= res!1070596 (isStrictlySorted!985 (toList!11393 lt!672330)))))

(assert (=> d!163181 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) lt!672460)))

(declare-fun b!1566249 () Bool)

(assert (=> b!1566249 (= e!873006 (containsKey!849 (toList!11393 lt!672330) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (= (and d!163181 res!1070596) b!1566249))

(assert (=> d!163181 m!1440285))

(assert (=> d!163181 m!1440285))

(assert (=> d!163181 m!1440457))

(declare-fun m!1440695 () Bool)

(assert (=> d!163181 m!1440695))

(declare-fun m!1440697 () Bool)

(assert (=> d!163181 m!1440697))

(assert (=> b!1566249 m!1440453))

(assert (=> b!1566046 d!163181))

(assert (=> b!1566046 d!163179))

(assert (=> b!1566046 d!163011))

(declare-fun d!163183 () Bool)

(assert (=> d!163183 (= (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!870) (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!163035 d!163183))

(declare-fun d!163185 () Bool)

(declare-fun res!1070597 () Bool)

(declare-fun e!873007 () Bool)

(assert (=> d!163185 (=> res!1070597 e!873007)))

(assert (=> d!163185 (= res!1070597 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163185 (= (containsKey!849 (t!51569 (toList!11393 lt!672254)) #b0000000000000000000000000000000000000000000000000000000000000000) e!873007)))

(declare-fun b!1566250 () Bool)

(declare-fun e!873008 () Bool)

(assert (=> b!1566250 (= e!873007 e!873008)))

(declare-fun res!1070598 () Bool)

(assert (=> b!1566250 (=> (not res!1070598) (not e!873008))))

(assert (=> b!1566250 (= res!1070598 (and (or (not ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254)))) (bvsle (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (bvslt (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566251 () Bool)

(assert (=> b!1566251 (= e!873008 (containsKey!849 (t!51569 (t!51569 (toList!11393 lt!672254))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163185 (not res!1070597)) b!1566250))

(assert (= (and b!1566250 res!1070598) b!1566251))

(declare-fun m!1440699 () Bool)

(assert (=> b!1566251 m!1440699))

(assert (=> b!1566090 d!163185))

(declare-fun d!163187 () Bool)

(assert (=> d!163187 (arrayContainsKey!0 _keys!637 lt!672382 #b00000000000000000000000000000000)))

(declare-fun lt!672461 () Unit!51846)

(assert (=> d!163187 (= lt!672461 (choose!13 _keys!637 lt!672382 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!163187 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!163187 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672382 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!672461)))

(declare-fun bs!45039 () Bool)

(assert (= bs!45039 d!163187))

(assert (=> bs!45039 m!1440429))

(declare-fun m!1440701 () Bool)

(assert (=> bs!45039 m!1440701))

(assert (=> b!1566019 d!163187))

(declare-fun d!163189 () Bool)

(declare-fun res!1070599 () Bool)

(declare-fun e!873009 () Bool)

(assert (=> d!163189 (=> res!1070599 e!873009)))

(assert (=> d!163189 (= res!1070599 (= (select (arr!50455 _keys!637) #b00000000000000000000000000000000) lt!672382))))

(assert (=> d!163189 (= (arrayContainsKey!0 _keys!637 lt!672382 #b00000000000000000000000000000000) e!873009)))

(declare-fun b!1566252 () Bool)

(declare-fun e!873010 () Bool)

(assert (=> b!1566252 (= e!873009 e!873010)))

(declare-fun res!1070600 () Bool)

(assert (=> b!1566252 (=> (not res!1070600) (not e!873010))))

(assert (=> b!1566252 (= res!1070600 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun b!1566253 () Bool)

(assert (=> b!1566253 (= e!873010 (arrayContainsKey!0 _keys!637 lt!672382 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!163189 (not res!1070599)) b!1566252))

(assert (= (and b!1566252 res!1070600) b!1566253))

(assert (=> d!163189 m!1440289))

(declare-fun m!1440703 () Bool)

(assert (=> b!1566253 m!1440703))

(assert (=> b!1566019 d!163189))

(declare-fun b!1566254 () Bool)

(declare-fun e!873011 () SeekEntryResult!13526)

(assert (=> b!1566254 (= e!873011 Undefined!13526)))

(declare-fun b!1566255 () Bool)

(declare-fun e!873013 () SeekEntryResult!13526)

(declare-fun lt!672462 () SeekEntryResult!13526)

(assert (=> b!1566255 (= e!873013 (MissingZero!13526 (index!56504 lt!672462)))))

(declare-fun d!163191 () Bool)

(declare-fun lt!672463 () SeekEntryResult!13526)

(assert (=> d!163191 (and (or ((_ is Undefined!13526) lt!672463) (not ((_ is Found!13526) lt!672463)) (and (bvsge (index!56503 lt!672463) #b00000000000000000000000000000000) (bvslt (index!56503 lt!672463) (size!51007 _keys!637)))) (or ((_ is Undefined!13526) lt!672463) ((_ is Found!13526) lt!672463) (not ((_ is MissingZero!13526) lt!672463)) (and (bvsge (index!56502 lt!672463) #b00000000000000000000000000000000) (bvslt (index!56502 lt!672463) (size!51007 _keys!637)))) (or ((_ is Undefined!13526) lt!672463) ((_ is Found!13526) lt!672463) ((_ is MissingZero!13526) lt!672463) (not ((_ is MissingVacant!13526) lt!672463)) (and (bvsge (index!56505 lt!672463) #b00000000000000000000000000000000) (bvslt (index!56505 lt!672463) (size!51007 _keys!637)))) (or ((_ is Undefined!13526) lt!672463) (ite ((_ is Found!13526) lt!672463) (= (select (arr!50455 _keys!637) (index!56503 lt!672463)) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!13526) lt!672463) (= (select (arr!50455 _keys!637) (index!56502 lt!672463)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13526) lt!672463) (= (select (arr!50455 _keys!637) (index!56505 lt!672463)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163191 (= lt!672463 e!873011)))

(declare-fun c!144330 () Bool)

(assert (=> d!163191 (= c!144330 (and ((_ is Intermediate!13526) lt!672462) (undefined!14338 lt!672462)))))

(assert (=> d!163191 (= lt!672462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!947) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947))))

(assert (=> d!163191 (validMask!0 mask!947)))

(assert (=> d!163191 (= (seekEntryOrOpen!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) lt!672463)))

(declare-fun b!1566256 () Bool)

(declare-fun c!144329 () Bool)

(declare-fun lt!672464 () (_ BitVec 64))

(assert (=> b!1566256 (= c!144329 (= lt!672464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873012 () SeekEntryResult!13526)

(assert (=> b!1566256 (= e!873012 e!873013)))

(declare-fun b!1566257 () Bool)

(assert (=> b!1566257 (= e!873011 e!873012)))

(assert (=> b!1566257 (= lt!672464 (select (arr!50455 _keys!637) (index!56504 lt!672462)))))

(declare-fun c!144331 () Bool)

(assert (=> b!1566257 (= c!144331 (= lt!672464 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1566258 () Bool)

(assert (=> b!1566258 (= e!873012 (Found!13526 (index!56504 lt!672462)))))

(declare-fun b!1566259 () Bool)

(assert (=> b!1566259 (= e!873013 (seekKeyOrZeroReturnVacant!0 (x!140744 lt!672462) (index!56504 lt!672462) (index!56504 lt!672462) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947))))

(assert (= (and d!163191 c!144330) b!1566254))

(assert (= (and d!163191 (not c!144330)) b!1566257))

(assert (= (and b!1566257 c!144331) b!1566258))

(assert (= (and b!1566257 (not c!144331)) b!1566256))

(assert (= (and b!1566256 c!144329) b!1566255))

(assert (= (and b!1566256 (not c!144329)) b!1566259))

(declare-fun m!1440705 () Bool)

(assert (=> d!163191 m!1440705))

(declare-fun m!1440707 () Bool)

(assert (=> d!163191 m!1440707))

(declare-fun m!1440709 () Bool)

(assert (=> d!163191 m!1440709))

(assert (=> d!163191 m!1440425))

(declare-fun m!1440711 () Bool)

(assert (=> d!163191 m!1440711))

(assert (=> d!163191 m!1440711))

(assert (=> d!163191 m!1440425))

(declare-fun m!1440713 () Bool)

(assert (=> d!163191 m!1440713))

(assert (=> d!163191 m!1440123))

(declare-fun m!1440715 () Bool)

(assert (=> b!1566257 m!1440715))

(assert (=> b!1566259 m!1440425))

(declare-fun m!1440717 () Bool)

(assert (=> b!1566259 m!1440717))

(assert (=> b!1566019 d!163191))

(declare-fun d!163193 () Bool)

(declare-fun res!1070601 () Bool)

(declare-fun e!873014 () Bool)

(assert (=> d!163193 (=> res!1070601 e!873014)))

(assert (=> d!163193 (= res!1070601 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) (select (arr!50455 _keys!637) from!782))))))

(assert (=> d!163193 (= (containsKey!849 (t!51569 (toList!11393 lt!672254)) (select (arr!50455 _keys!637) from!782)) e!873014)))

(declare-fun b!1566260 () Bool)

(declare-fun e!873015 () Bool)

(assert (=> b!1566260 (= e!873014 e!873015)))

(declare-fun res!1070602 () Bool)

(assert (=> b!1566260 (=> (not res!1070602) (not e!873015))))

(assert (=> b!1566260 (= res!1070602 (and (or (not ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254)))) (bvsle (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) (select (arr!50455 _keys!637) from!782))) ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (bvslt (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) (select (arr!50455 _keys!637) from!782))))))

(declare-fun b!1566261 () Bool)

(assert (=> b!1566261 (= e!873015 (containsKey!849 (t!51569 (t!51569 (toList!11393 lt!672254))) (select (arr!50455 _keys!637) from!782)))))

(assert (= (and d!163193 (not res!1070601)) b!1566260))

(assert (= (and b!1566260 res!1070602) b!1566261))

(assert (=> b!1566261 m!1440119))

(declare-fun m!1440719 () Bool)

(assert (=> b!1566261 m!1440719))

(assert (=> b!1565951 d!163193))

(declare-fun d!163195 () Bool)

(declare-fun e!873016 () Bool)

(assert (=> d!163195 e!873016))

(declare-fun res!1070604 () Bool)

(assert (=> d!163195 (=> (not res!1070604) (not e!873016))))

(declare-fun lt!672466 () ListLongMap!22755)

(assert (=> d!163195 (= res!1070604 (contains!10306 lt!672466 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!672467 () List!36678)

(assert (=> d!163195 (= lt!672466 (ListLongMap!22756 lt!672467))))

(declare-fun lt!672468 () Unit!51846)

(declare-fun lt!672465 () Unit!51846)

(assert (=> d!163195 (= lt!672468 lt!672465)))

(assert (=> d!163195 (= (getValueByKey!796 lt!672467 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163195 (= lt!672465 (lemmaContainsTupThenGetReturnValue!388 lt!672467 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163195 (= lt!672467 (insertStrictlySorted!578 (toList!11393 call!71857) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163195 (= (+!5114 call!71857 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!672466)))

(declare-fun b!1566262 () Bool)

(declare-fun res!1070603 () Bool)

(assert (=> b!1566262 (=> (not res!1070603) (not e!873016))))

(assert (=> b!1566262 (= res!1070603 (= (getValueByKey!796 (toList!11393 lt!672466) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1566263 () Bool)

(assert (=> b!1566263 (= e!873016 (contains!10307 (toList!11393 lt!672466) (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!163195 res!1070604) b!1566262))

(assert (= (and b!1566262 res!1070603) b!1566263))

(declare-fun m!1440721 () Bool)

(assert (=> d!163195 m!1440721))

(declare-fun m!1440723 () Bool)

(assert (=> d!163195 m!1440723))

(declare-fun m!1440725 () Bool)

(assert (=> d!163195 m!1440725))

(declare-fun m!1440727 () Bool)

(assert (=> d!163195 m!1440727))

(declare-fun m!1440729 () Bool)

(assert (=> b!1566262 m!1440729))

(declare-fun m!1440731 () Bool)

(assert (=> b!1566263 m!1440731))

(assert (=> b!1565983 d!163195))

(declare-fun d!163197 () Bool)

(declare-fun e!873017 () Bool)

(assert (=> d!163197 e!873017))

(declare-fun res!1070606 () Bool)

(assert (=> d!163197 (=> (not res!1070606) (not e!873017))))

(declare-fun lt!672470 () ListLongMap!22755)

(assert (=> d!163197 (= res!1070606 (contains!10306 lt!672470 (_1!12671 (tuple2!25321 lt!672354 lt!672359))))))

(declare-fun lt!672471 () List!36678)

(assert (=> d!163197 (= lt!672470 (ListLongMap!22756 lt!672471))))

(declare-fun lt!672472 () Unit!51846)

(declare-fun lt!672469 () Unit!51846)

(assert (=> d!163197 (= lt!672472 lt!672469)))

(assert (=> d!163197 (= (getValueByKey!796 lt!672471 (_1!12671 (tuple2!25321 lt!672354 lt!672359))) (Some!870 (_2!12671 (tuple2!25321 lt!672354 lt!672359))))))

(assert (=> d!163197 (= lt!672469 (lemmaContainsTupThenGetReturnValue!388 lt!672471 (_1!12671 (tuple2!25321 lt!672354 lt!672359)) (_2!12671 (tuple2!25321 lt!672354 lt!672359))))))

(assert (=> d!163197 (= lt!672471 (insertStrictlySorted!578 (toList!11393 lt!672358) (_1!12671 (tuple2!25321 lt!672354 lt!672359)) (_2!12671 (tuple2!25321 lt!672354 lt!672359))))))

(assert (=> d!163197 (= (+!5114 lt!672358 (tuple2!25321 lt!672354 lt!672359)) lt!672470)))

(declare-fun b!1566264 () Bool)

(declare-fun res!1070605 () Bool)

(assert (=> b!1566264 (=> (not res!1070605) (not e!873017))))

(assert (=> b!1566264 (= res!1070605 (= (getValueByKey!796 (toList!11393 lt!672470) (_1!12671 (tuple2!25321 lt!672354 lt!672359))) (Some!870 (_2!12671 (tuple2!25321 lt!672354 lt!672359)))))))

(declare-fun b!1566265 () Bool)

(assert (=> b!1566265 (= e!873017 (contains!10307 (toList!11393 lt!672470) (tuple2!25321 lt!672354 lt!672359)))))

(assert (= (and d!163197 res!1070606) b!1566264))

(assert (= (and b!1566264 res!1070605) b!1566265))

(declare-fun m!1440733 () Bool)

(assert (=> d!163197 m!1440733))

(declare-fun m!1440735 () Bool)

(assert (=> d!163197 m!1440735))

(declare-fun m!1440737 () Bool)

(assert (=> d!163197 m!1440737))

(declare-fun m!1440739 () Bool)

(assert (=> d!163197 m!1440739))

(declare-fun m!1440741 () Bool)

(assert (=> b!1566264 m!1440741))

(declare-fun m!1440743 () Bool)

(assert (=> b!1566265 m!1440743))

(assert (=> b!1565983 d!163197))

(declare-fun d!163199 () Bool)

(assert (=> d!163199 (not (contains!10306 (+!5114 lt!672358 (tuple2!25321 lt!672354 lt!672359)) lt!672357))))

(declare-fun lt!672473 () Unit!51846)

(assert (=> d!163199 (= lt!672473 (choose!2084 lt!672358 lt!672354 lt!672359 lt!672357))))

(declare-fun e!873018 () Bool)

(assert (=> d!163199 e!873018))

(declare-fun res!1070607 () Bool)

(assert (=> d!163199 (=> (not res!1070607) (not e!873018))))

(assert (=> d!163199 (= res!1070607 (not (contains!10306 lt!672358 lt!672357)))))

(assert (=> d!163199 (= (addStillNotContains!561 lt!672358 lt!672354 lt!672359 lt!672357) lt!672473)))

(declare-fun b!1566266 () Bool)

(assert (=> b!1566266 (= e!873018 (not (= lt!672354 lt!672357)))))

(assert (= (and d!163199 res!1070607) b!1566266))

(assert (=> d!163199 m!1440357))

(assert (=> d!163199 m!1440357))

(assert (=> d!163199 m!1440361))

(declare-fun m!1440745 () Bool)

(assert (=> d!163199 m!1440745))

(declare-fun m!1440747 () Bool)

(assert (=> d!163199 m!1440747))

(assert (=> b!1565983 d!163199))

(declare-fun d!163201 () Bool)

(declare-fun e!873020 () Bool)

(assert (=> d!163201 e!873020))

(declare-fun res!1070608 () Bool)

(assert (=> d!163201 (=> res!1070608 e!873020)))

(declare-fun lt!672476 () Bool)

(assert (=> d!163201 (= res!1070608 (not lt!672476))))

(declare-fun lt!672477 () Bool)

(assert (=> d!163201 (= lt!672476 lt!672477)))

(declare-fun lt!672475 () Unit!51846)

(declare-fun e!873019 () Unit!51846)

(assert (=> d!163201 (= lt!672475 e!873019)))

(declare-fun c!144332 () Bool)

(assert (=> d!163201 (= c!144332 lt!672477)))

(assert (=> d!163201 (= lt!672477 (containsKey!849 (toList!11393 (+!5114 lt!672358 (tuple2!25321 lt!672354 lt!672359))) lt!672357))))

(assert (=> d!163201 (= (contains!10306 (+!5114 lt!672358 (tuple2!25321 lt!672354 lt!672359)) lt!672357) lt!672476)))

(declare-fun b!1566267 () Bool)

(declare-fun lt!672474 () Unit!51846)

(assert (=> b!1566267 (= e!873019 lt!672474)))

(assert (=> b!1566267 (= lt!672474 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 (+!5114 lt!672358 (tuple2!25321 lt!672354 lt!672359))) lt!672357))))

(assert (=> b!1566267 (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672358 (tuple2!25321 lt!672354 lt!672359))) lt!672357))))

(declare-fun b!1566268 () Bool)

(declare-fun Unit!51861 () Unit!51846)

(assert (=> b!1566268 (= e!873019 Unit!51861)))

(declare-fun b!1566269 () Bool)

(assert (=> b!1566269 (= e!873020 (isDefined!584 (getValueByKey!796 (toList!11393 (+!5114 lt!672358 (tuple2!25321 lt!672354 lt!672359))) lt!672357)))))

(assert (= (and d!163201 c!144332) b!1566267))

(assert (= (and d!163201 (not c!144332)) b!1566268))

(assert (= (and d!163201 (not res!1070608)) b!1566269))

(declare-fun m!1440749 () Bool)

(assert (=> d!163201 m!1440749))

(declare-fun m!1440751 () Bool)

(assert (=> b!1566267 m!1440751))

(declare-fun m!1440753 () Bool)

(assert (=> b!1566267 m!1440753))

(assert (=> b!1566267 m!1440753))

(declare-fun m!1440755 () Bool)

(assert (=> b!1566267 m!1440755))

(assert (=> b!1566269 m!1440753))

(assert (=> b!1566269 m!1440753))

(assert (=> b!1566269 m!1440755))

(assert (=> b!1565983 d!163201))

(declare-fun d!163203 () Bool)

(declare-fun c!144333 () Bool)

(assert (=> d!163203 (= c!144333 ((_ is ValueCellFull!18449) (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun e!873021 () V!60153)

(assert (=> d!163203 (= (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!873021)))

(declare-fun b!1566270 () Bool)

(assert (=> b!1566270 (= e!873021 (get!26360 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566271 () Bool)

(assert (=> b!1566271 (= e!873021 (get!26361 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163203 c!144333) b!1566270))

(assert (= (and d!163203 (not c!144333)) b!1566271))

(assert (=> b!1566270 m!1440355))

(assert (=> b!1566270 m!1440135))

(declare-fun m!1440757 () Bool)

(assert (=> b!1566270 m!1440757))

(assert (=> b!1566271 m!1440355))

(assert (=> b!1566271 m!1440135))

(declare-fun m!1440759 () Bool)

(assert (=> b!1566271 m!1440759))

(assert (=> b!1565983 d!163203))

(declare-fun b!1566273 () Bool)

(declare-fun e!873022 () Option!871)

(declare-fun e!873023 () Option!871)

(assert (=> b!1566273 (= e!873022 e!873023)))

(declare-fun c!144335 () Bool)

(assert (=> b!1566273 (= c!144335 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672330))) (not (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672330)))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))))

(declare-fun b!1566272 () Bool)

(assert (=> b!1566272 (= e!873022 (Some!870 (_2!12671 (h!38121 (t!51569 (toList!11393 lt!672330))))))))

(declare-fun c!144334 () Bool)

(declare-fun d!163205 () Bool)

(assert (=> d!163205 (= c!144334 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672330))) (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672330)))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163205 (= (getValueByKey!796 (t!51569 (toList!11393 lt!672330)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) e!873022)))

(declare-fun b!1566275 () Bool)

(assert (=> b!1566275 (= e!873023 None!869)))

(declare-fun b!1566274 () Bool)

(assert (=> b!1566274 (= e!873023 (getValueByKey!796 (t!51569 (t!51569 (toList!11393 lt!672330))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (= (and d!163205 c!144334) b!1566272))

(assert (= (and d!163205 (not c!144334)) b!1566273))

(assert (= (and b!1566273 c!144335) b!1566274))

(assert (= (and b!1566273 (not c!144335)) b!1566275))

(declare-fun m!1440761 () Bool)

(assert (=> b!1566274 m!1440761))

(assert (=> b!1565993 d!163205))

(assert (=> d!163033 d!163035))

(assert (=> d!163033 d!163037))

(declare-fun d!163207 () Bool)

(assert (=> d!163207 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163207 true))

(declare-fun _$12!490 () Unit!51846)

(assert (=> d!163207 (= (choose!2085 (toList!11393 lt!672254) #b1000000000000000000000000000000000000000000000000000000000000000) _$12!490)))

(declare-fun bs!45040 () Bool)

(assert (= bs!45040 d!163207))

(assert (=> bs!45040 m!1440231))

(assert (=> bs!45040 m!1440231))

(assert (=> bs!45040 m!1440233))

(assert (=> d!163033 d!163207))

(assert (=> d!163033 d!163161))

(declare-fun b!1566288 () Bool)

(declare-fun e!873032 () SeekEntryResult!13526)

(assert (=> b!1566288 (= e!873032 (MissingVacant!13526 (index!56504 lt!672392)))))

(declare-fun b!1566289 () Bool)

(declare-fun e!873031 () SeekEntryResult!13526)

(declare-fun e!873030 () SeekEntryResult!13526)

(assert (=> b!1566289 (= e!873031 e!873030)))

(declare-fun c!144342 () Bool)

(declare-fun lt!672482 () (_ BitVec 64))

(assert (=> b!1566289 (= c!144342 (= lt!672482 (select (arr!50455 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566290 () Bool)

(assert (=> b!1566290 (= e!873031 Undefined!13526)))

(declare-fun b!1566291 () Bool)

(assert (=> b!1566291 (= e!873030 (Found!13526 (index!56504 lt!672392)))))

(declare-fun b!1566292 () Bool)

(declare-fun c!144344 () Bool)

(assert (=> b!1566292 (= c!144344 (= lt!672482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566292 (= e!873030 e!873032)))

(declare-fun d!163209 () Bool)

(declare-fun lt!672483 () SeekEntryResult!13526)

(assert (=> d!163209 (and (or ((_ is Undefined!13526) lt!672483) (not ((_ is Found!13526) lt!672483)) (and (bvsge (index!56503 lt!672483) #b00000000000000000000000000000000) (bvslt (index!56503 lt!672483) (size!51007 _keys!637)))) (or ((_ is Undefined!13526) lt!672483) ((_ is Found!13526) lt!672483) (not ((_ is MissingVacant!13526) lt!672483)) (not (= (index!56505 lt!672483) (index!56504 lt!672392))) (and (bvsge (index!56505 lt!672483) #b00000000000000000000000000000000) (bvslt (index!56505 lt!672483) (size!51007 _keys!637)))) (or ((_ is Undefined!13526) lt!672483) (ite ((_ is Found!13526) lt!672483) (= (select (arr!50455 _keys!637) (index!56503 lt!672483)) (select (arr!50455 _keys!637) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!13526) lt!672483) (= (index!56505 lt!672483) (index!56504 lt!672392)) (= (select (arr!50455 _keys!637) (index!56505 lt!672483)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!163209 (= lt!672483 e!873031)))

(declare-fun c!144343 () Bool)

(assert (=> d!163209 (= c!144343 (bvsge (x!140744 lt!672392) #b01111111111111111111111111111110))))

(assert (=> d!163209 (= lt!672482 (select (arr!50455 _keys!637) (index!56504 lt!672392)))))

(assert (=> d!163209 (validMask!0 mask!947)))

(assert (=> d!163209 (= (seekKeyOrZeroReturnVacant!0 (x!140744 lt!672392) (index!56504 lt!672392) (index!56504 lt!672392) (select (arr!50455 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!672483)))

(declare-fun b!1566293 () Bool)

(assert (=> b!1566293 (= e!873032 (seekKeyOrZeroReturnVacant!0 (bvadd (x!140744 lt!672392) #b00000000000000000000000000000001) (nextIndex!0 (index!56504 lt!672392) (x!140744 lt!672392) mask!947) (index!56504 lt!672392) (select (arr!50455 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (= (and d!163209 c!144343) b!1566290))

(assert (= (and d!163209 (not c!144343)) b!1566289))

(assert (= (and b!1566289 c!144342) b!1566291))

(assert (= (and b!1566289 (not c!144342)) b!1566292))

(assert (= (and b!1566292 c!144344) b!1566288))

(assert (= (and b!1566292 (not c!144344)) b!1566293))

(declare-fun m!1440763 () Bool)

(assert (=> d!163209 m!1440763))

(declare-fun m!1440765 () Bool)

(assert (=> d!163209 m!1440765))

(assert (=> d!163209 m!1440449))

(assert (=> d!163209 m!1440123))

(declare-fun m!1440767 () Bool)

(assert (=> b!1566293 m!1440767))

(assert (=> b!1566293 m!1440767))

(assert (=> b!1566293 m!1440289))

(declare-fun m!1440769 () Bool)

(assert (=> b!1566293 m!1440769))

(assert (=> b!1566045 d!163209))

(assert (=> b!1566013 d!163031))

(declare-fun d!163211 () Bool)

(assert (=> d!163211 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun lt!672484 () Unit!51846)

(assert (=> d!163211 (= lt!672484 (choose!2085 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun e!873033 () Bool)

(assert (=> d!163211 e!873033))

(declare-fun res!1070609 () Bool)

(assert (=> d!163211 (=> (not res!1070609) (not e!873033))))

(assert (=> d!163211 (= res!1070609 (isStrictlySorted!985 (toList!11393 lt!672313)))))

(assert (=> d!163211 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) lt!672484)))

(declare-fun b!1566294 () Bool)

(assert (=> b!1566294 (= e!873033 (containsKey!849 (toList!11393 lt!672313) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!163211 res!1070609) b!1566294))

(assert (=> d!163211 m!1440237))

(assert (=> d!163211 m!1440321))

(assert (=> d!163211 m!1440321))

(assert (=> d!163211 m!1440385))

(assert (=> d!163211 m!1440237))

(declare-fun m!1440771 () Bool)

(assert (=> d!163211 m!1440771))

(assert (=> d!163211 m!1440605))

(assert (=> b!1566294 m!1440237))

(assert (=> b!1566294 m!1440381))

(assert (=> b!1565988 d!163211))

(assert (=> b!1565988 d!163163))

(assert (=> b!1565988 d!163103))

(declare-fun d!163213 () Bool)

(assert (=> d!163213 (= (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782))) (not ((_ is Some!870) (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))))

(assert (=> d!163027 d!163213))

(assert (=> d!163061 d!163027))

(assert (=> d!163061 d!162993))

(declare-fun d!163215 () Bool)

(assert (=> d!163215 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)))))

(assert (=> d!163215 true))

(declare-fun _$12!491 () Unit!51846)

(assert (=> d!163215 (= (choose!2085 (toList!11393 lt!672254) (select (arr!50455 _keys!637) from!782)) _$12!491)))

(declare-fun bs!45041 () Bool)

(assert (= bs!45041 d!163215))

(assert (=> bs!45041 m!1440119))

(assert (=> bs!45041 m!1440301))

(assert (=> bs!45041 m!1440301))

(assert (=> bs!45041 m!1440303))

(assert (=> d!163061 d!163215))

(assert (=> d!163061 d!163161))

(declare-fun b!1566296 () Bool)

(declare-fun e!873034 () Option!871)

(declare-fun e!873035 () Option!871)

(assert (=> b!1566296 (= e!873034 e!873035)))

(declare-fun c!144346 () Bool)

(assert (=> b!1566296 (= c!144346 (and ((_ is Cons!36674) (t!51569 lt!672331)) (not (= (_1!12671 (h!38121 (t!51569 lt!672331))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))))

(declare-fun b!1566295 () Bool)

(assert (=> b!1566295 (= e!873034 (Some!870 (_2!12671 (h!38121 (t!51569 lt!672331)))))))

(declare-fun c!144345 () Bool)

(declare-fun d!163217 () Bool)

(assert (=> d!163217 (= c!144345 (and ((_ is Cons!36674) (t!51569 lt!672331)) (= (_1!12671 (h!38121 (t!51569 lt!672331))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163217 (= (getValueByKey!796 (t!51569 lt!672331) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) e!873034)))

(declare-fun b!1566298 () Bool)

(assert (=> b!1566298 (= e!873035 None!869)))

(declare-fun b!1566297 () Bool)

(assert (=> b!1566297 (= e!873035 (getValueByKey!796 (t!51569 (t!51569 lt!672331)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (= (and d!163217 c!144345) b!1566295))

(assert (= (and d!163217 (not c!144345)) b!1566296))

(assert (= (and b!1566296 c!144346) b!1566297))

(assert (= (and b!1566296 (not c!144346)) b!1566298))

(declare-fun m!1440773 () Bool)

(assert (=> b!1566297 m!1440773))

(assert (=> b!1566051 d!163217))

(declare-fun b!1566299 () Bool)

(declare-fun e!873037 () Bool)

(assert (=> b!1566299 (= e!873037 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1566299 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!163219 () Bool)

(declare-fun e!873042 () Bool)

(assert (=> d!163219 e!873042))

(declare-fun res!1070611 () Bool)

(assert (=> d!163219 (=> (not res!1070611) (not e!873042))))

(declare-fun lt!672491 () ListLongMap!22755)

(assert (=> d!163219 (= res!1070611 (not (contains!10306 lt!672491 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!873040 () ListLongMap!22755)

(assert (=> d!163219 (= lt!672491 e!873040)))

(declare-fun c!144350 () Bool)

(assert (=> d!163219 (= c!144350 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(assert (=> d!163219 (validMask!0 mask!947)))

(assert (=> d!163219 (= (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495) lt!672491)))

(declare-fun b!1566300 () Bool)

(declare-fun e!873038 () Bool)

(assert (=> b!1566300 (= e!873038 (isEmpty!1151 lt!672491))))

(declare-fun b!1566301 () Bool)

(declare-fun e!873036 () Bool)

(assert (=> b!1566301 (= e!873036 e!873038)))

(declare-fun c!144349 () Bool)

(assert (=> b!1566301 (= c!144349 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun b!1566302 () Bool)

(assert (=> b!1566302 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(assert (=> b!1566302 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51008 _values!487)))))

(declare-fun e!873039 () Bool)

(assert (=> b!1566302 (= e!873039 (= (apply!1105 lt!672491 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566303 () Bool)

(declare-fun e!873041 () ListLongMap!22755)

(declare-fun call!71877 () ListLongMap!22755)

(assert (=> b!1566303 (= e!873041 call!71877)))

(declare-fun b!1566304 () Bool)

(declare-fun res!1070612 () Bool)

(assert (=> b!1566304 (=> (not res!1070612) (not e!873042))))

(assert (=> b!1566304 (= res!1070612 (not (contains!10306 lt!672491 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566305 () Bool)

(assert (=> b!1566305 (= e!873036 e!873039)))

(assert (=> b!1566305 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun res!1070613 () Bool)

(assert (=> b!1566305 (= res!1070613 (contains!10306 lt!672491 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1566305 (=> (not res!1070613) (not e!873039))))

(declare-fun b!1566306 () Bool)

(assert (=> b!1566306 (= e!873038 (= lt!672491 (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1566307 () Bool)

(assert (=> b!1566307 (= e!873040 e!873041)))

(declare-fun c!144347 () Bool)

(assert (=> b!1566307 (= c!144347 (validKeyInArray!0 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!71874 () Bool)

(assert (=> bm!71874 (= call!71877 (getCurrentListMapNoExtraKeys!6745 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1566308 () Bool)

(assert (=> b!1566308 (= e!873042 e!873036)))

(declare-fun c!144348 () Bool)

(assert (=> b!1566308 (= c!144348 e!873037)))

(declare-fun res!1070610 () Bool)

(assert (=> b!1566308 (=> (not res!1070610) (not e!873037))))

(assert (=> b!1566308 (= res!1070610 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51007 _keys!637)))))

(declare-fun b!1566309 () Bool)

(declare-fun lt!672486 () Unit!51846)

(declare-fun lt!672487 () Unit!51846)

(assert (=> b!1566309 (= lt!672486 lt!672487)))

(declare-fun lt!672488 () (_ BitVec 64))

(declare-fun lt!672490 () V!60153)

(declare-fun lt!672489 () ListLongMap!22755)

(declare-fun lt!672485 () (_ BitVec 64))

(assert (=> b!1566309 (not (contains!10306 (+!5114 lt!672489 (tuple2!25321 lt!672485 lt!672490)) lt!672488))))

(assert (=> b!1566309 (= lt!672487 (addStillNotContains!561 lt!672489 lt!672485 lt!672490 lt!672488))))

(assert (=> b!1566309 (= lt!672488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1566309 (= lt!672490 (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1566309 (= lt!672485 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1566309 (= lt!672489 call!71877)))

(assert (=> b!1566309 (= e!873041 (+!5114 call!71877 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1566310 () Bool)

(assert (=> b!1566310 (= e!873040 (ListLongMap!22756 Nil!36675))))

(assert (= (and d!163219 c!144350) b!1566310))

(assert (= (and d!163219 (not c!144350)) b!1566307))

(assert (= (and b!1566307 c!144347) b!1566309))

(assert (= (and b!1566307 (not c!144347)) b!1566303))

(assert (= (or b!1566309 b!1566303) bm!71874))

(assert (= (and d!163219 res!1070611) b!1566304))

(assert (= (and b!1566304 res!1070612) b!1566308))

(assert (= (and b!1566308 res!1070610) b!1566299))

(assert (= (and b!1566308 c!144348) b!1566305))

(assert (= (and b!1566308 (not c!144348)) b!1566301))

(assert (= (and b!1566305 res!1070613) b!1566302))

(assert (= (and b!1566301 c!144349) b!1566306))

(assert (= (and b!1566301 (not c!144349)) b!1566300))

(declare-fun b_lambda!25013 () Bool)

(assert (=> (not b_lambda!25013) (not b!1566302)))

(assert (=> b!1566302 t!51568))

(declare-fun b_and!51813 () Bool)

(assert (= b_and!51811 (and (=> t!51568 result!26589) b_and!51813)))

(declare-fun b_lambda!25015 () Bool)

(assert (=> (not b_lambda!25015) (not b!1566309)))

(assert (=> b!1566309 t!51568))

(declare-fun b_and!51815 () Bool)

(assert (= b_and!51813 (and (=> t!51568 result!26589) b_and!51815)))

(declare-fun m!1440775 () Bool)

(assert (=> b!1566304 m!1440775))

(declare-fun m!1440777 () Bool)

(assert (=> b!1566299 m!1440777))

(assert (=> b!1566299 m!1440777))

(declare-fun m!1440779 () Bool)

(assert (=> b!1566299 m!1440779))

(declare-fun m!1440781 () Bool)

(assert (=> d!163219 m!1440781))

(assert (=> d!163219 m!1440123))

(assert (=> b!1566309 m!1440777))

(declare-fun m!1440783 () Bool)

(assert (=> b!1566309 m!1440783))

(declare-fun m!1440785 () Bool)

(assert (=> b!1566309 m!1440785))

(declare-fun m!1440787 () Bool)

(assert (=> b!1566309 m!1440787))

(declare-fun m!1440789 () Bool)

(assert (=> b!1566309 m!1440789))

(assert (=> b!1566309 m!1440787))

(declare-fun m!1440791 () Bool)

(assert (=> b!1566309 m!1440791))

(assert (=> b!1566309 m!1440785))

(assert (=> b!1566309 m!1440135))

(declare-fun m!1440793 () Bool)

(assert (=> b!1566309 m!1440793))

(assert (=> b!1566309 m!1440135))

(assert (=> b!1566302 m!1440777))

(declare-fun m!1440795 () Bool)

(assert (=> b!1566302 m!1440795))

(assert (=> b!1566302 m!1440777))

(assert (=> b!1566302 m!1440785))

(assert (=> b!1566302 m!1440785))

(assert (=> b!1566302 m!1440135))

(assert (=> b!1566302 m!1440793))

(assert (=> b!1566302 m!1440135))

(assert (=> b!1566305 m!1440777))

(assert (=> b!1566305 m!1440777))

(declare-fun m!1440797 () Bool)

(assert (=> b!1566305 m!1440797))

(declare-fun m!1440799 () Bool)

(assert (=> b!1566306 m!1440799))

(assert (=> b!1566307 m!1440777))

(assert (=> b!1566307 m!1440777))

(assert (=> b!1566307 m!1440779))

(declare-fun m!1440801 () Bool)

(assert (=> b!1566300 m!1440801))

(assert (=> bm!71874 m!1440799))

(assert (=> b!1565980 d!163219))

(declare-fun d!163221 () Bool)

(declare-fun res!1070614 () Bool)

(declare-fun e!873043 () Bool)

(assert (=> d!163221 (=> res!1070614 e!873043)))

(assert (=> d!163221 (= res!1070614 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163221 (= (containsKey!849 (t!51569 (toList!11393 lt!672254)) #b1000000000000000000000000000000000000000000000000000000000000000) e!873043)))

(declare-fun b!1566311 () Bool)

(declare-fun e!873044 () Bool)

(assert (=> b!1566311 (= e!873043 e!873044)))

(declare-fun res!1070615 () Bool)

(assert (=> b!1566311 (=> (not res!1070615) (not e!873044))))

(assert (=> b!1566311 (= res!1070615 (and (or (not ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254)))) (bvsle (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (bvslt (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566312 () Bool)

(assert (=> b!1566312 (= e!873044 (containsKey!849 (t!51569 (t!51569 (toList!11393 lt!672254))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163221 (not res!1070614)) b!1566311))

(assert (= (and b!1566311 res!1070615) b!1566312))

(declare-fun m!1440803 () Bool)

(assert (=> b!1566312 m!1440803))

(assert (=> b!1566012 d!163221))

(declare-fun d!163223 () Bool)

(declare-fun lt!672492 () Bool)

(assert (=> d!163223 (= lt!672492 (select (content!798 (t!51569 (toList!11393 lt!672330))) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))

(declare-fun e!873045 () Bool)

(assert (=> d!163223 (= lt!672492 e!873045)))

(declare-fun res!1070616 () Bool)

(assert (=> d!163223 (=> (not res!1070616) (not e!873045))))

(assert (=> d!163223 (= res!1070616 ((_ is Cons!36674) (t!51569 (toList!11393 lt!672330))))))

(assert (=> d!163223 (= (contains!10307 (t!51569 (toList!11393 lt!672330)) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) lt!672492)))

(declare-fun b!1566313 () Bool)

(declare-fun e!873046 () Bool)

(assert (=> b!1566313 (= e!873045 e!873046)))

(declare-fun res!1070617 () Bool)

(assert (=> b!1566313 (=> res!1070617 e!873046)))

(assert (=> b!1566313 (= res!1070617 (= (h!38121 (t!51569 (toList!11393 lt!672330))) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))

(declare-fun b!1566314 () Bool)

(assert (=> b!1566314 (= e!873046 (contains!10307 (t!51569 (t!51569 (toList!11393 lt!672330))) (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))

(assert (= (and d!163223 res!1070616) b!1566313))

(assert (= (and b!1566313 (not res!1070617)) b!1566314))

(declare-fun m!1440805 () Bool)

(assert (=> d!163223 m!1440805))

(declare-fun m!1440807 () Bool)

(assert (=> d!163223 m!1440807))

(declare-fun m!1440809 () Bool)

(assert (=> b!1566314 m!1440809))

(assert (=> b!1566010 d!163223))

(assert (=> b!1566093 d!163115))

(declare-fun d!163225 () Bool)

(declare-fun lt!672493 () Bool)

(assert (=> d!163225 (= lt!672493 (select (content!799 (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!873047 () Bool)

(assert (=> d!163225 (= lt!672493 e!873047)))

(declare-fun res!1070618 () Bool)

(assert (=> d!163225 (=> (not res!1070618) (not e!873047))))

(assert (=> d!163225 (= res!1070618 ((_ is Cons!36675) (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)))))

(assert (=> d!163225 (= (contains!10308 (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!672493)))

(declare-fun b!1566315 () Bool)

(declare-fun e!873048 () Bool)

(assert (=> b!1566315 (= e!873047 e!873048)))

(declare-fun res!1070619 () Bool)

(assert (=> b!1566315 (=> res!1070619 e!873048)))

(assert (=> b!1566315 (= res!1070619 (= (h!38122 (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1566316 () Bool)

(assert (=> b!1566316 (= e!873048 (contains!10308 (t!51570 (ite c!144235 (Cons!36675 (select (arr!50455 _keys!637) #b00000000000000000000000000000000) Nil!36676) Nil!36676)) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!163225 res!1070618) b!1566315))

(assert (= (and b!1566315 (not res!1070619)) b!1566316))

(declare-fun m!1440811 () Bool)

(assert (=> d!163225 m!1440811))

(assert (=> d!163225 m!1440425))

(declare-fun m!1440813 () Bool)

(assert (=> d!163225 m!1440813))

(assert (=> b!1566316 m!1440425))

(declare-fun m!1440815 () Bool)

(assert (=> b!1566316 m!1440815))

(assert (=> b!1566092 d!163225))

(declare-fun b!1566318 () Bool)

(declare-fun e!873049 () Option!871)

(declare-fun e!873050 () Option!871)

(assert (=> b!1566318 (= e!873049 e!873050)))

(declare-fun c!144352 () Bool)

(assert (=> b!1566318 (= c!144352 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (not (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) (select (arr!50455 _keys!637) from!782)))))))

(declare-fun b!1566317 () Bool)

(assert (=> b!1566317 (= e!873049 (Some!870 (_2!12671 (h!38121 (t!51569 (toList!11393 lt!672254))))))))

(declare-fun d!163227 () Bool)

(declare-fun c!144351 () Bool)

(assert (=> d!163227 (= c!144351 (and ((_ is Cons!36674) (t!51569 (toList!11393 lt!672254))) (= (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672254)))) (select (arr!50455 _keys!637) from!782))))))

(assert (=> d!163227 (= (getValueByKey!796 (t!51569 (toList!11393 lt!672254)) (select (arr!50455 _keys!637) from!782)) e!873049)))

(declare-fun b!1566320 () Bool)

(assert (=> b!1566320 (= e!873050 None!869)))

(declare-fun b!1566319 () Bool)

(assert (=> b!1566319 (= e!873050 (getValueByKey!796 (t!51569 (t!51569 (toList!11393 lt!672254))) (select (arr!50455 _keys!637) from!782)))))

(assert (= (and d!163227 c!144351) b!1566317))

(assert (= (and d!163227 (not c!144351)) b!1566318))

(assert (= (and b!1566318 c!144352) b!1566319))

(assert (= (and b!1566318 (not c!144352)) b!1566320))

(assert (=> b!1566319 m!1440119))

(declare-fun m!1440817 () Bool)

(assert (=> b!1566319 m!1440817))

(assert (=> b!1565962 d!163227))

(declare-fun d!163229 () Bool)

(declare-fun lt!672494 () Bool)

(assert (=> d!163229 (= lt!672494 (select (content!798 lt!672404) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun e!873051 () Bool)

(assert (=> d!163229 (= lt!672494 e!873051)))

(declare-fun res!1070620 () Bool)

(assert (=> d!163229 (=> (not res!1070620) (not e!873051))))

(assert (=> d!163229 (= res!1070620 ((_ is Cons!36674) lt!672404))))

(assert (=> d!163229 (= (contains!10307 lt!672404 (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) lt!672494)))

(declare-fun b!1566321 () Bool)

(declare-fun e!873052 () Bool)

(assert (=> b!1566321 (= e!873051 e!873052)))

(declare-fun res!1070621 () Bool)

(assert (=> b!1566321 (=> res!1070621 e!873052)))

(assert (=> b!1566321 (= res!1070621 (= (h!38121 lt!672404) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566322 () Bool)

(assert (=> b!1566322 (= e!873052 (contains!10307 (t!51569 lt!672404) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (= (and d!163229 res!1070620) b!1566321))

(assert (= (and b!1566321 (not res!1070621)) b!1566322))

(declare-fun m!1440819 () Bool)

(assert (=> d!163229 m!1440819))

(declare-fun m!1440821 () Bool)

(assert (=> d!163229 m!1440821))

(declare-fun m!1440823 () Bool)

(assert (=> b!1566322 m!1440823))

(assert (=> b!1566083 d!163229))

(declare-fun b!1566324 () Bool)

(declare-fun e!873053 () Option!871)

(declare-fun e!873054 () Option!871)

(assert (=> b!1566324 (= e!873053 e!873054)))

(declare-fun c!144354 () Bool)

(assert (=> b!1566324 (= c!144354 (and ((_ is Cons!36674) (toList!11393 lt!672410)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672410))) (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))))

(declare-fun b!1566323 () Bool)

(assert (=> b!1566323 (= e!873053 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672410)))))))

(declare-fun c!144353 () Bool)

(declare-fun d!163231 () Bool)

(assert (=> d!163231 (= c!144353 (and ((_ is Cons!36674) (toList!11393 lt!672410)) (= (_1!12671 (h!38121 (toList!11393 lt!672410))) (_1!12671 (tuple2!25321 lt!672307 lt!672312)))))))

(assert (=> d!163231 (= (getValueByKey!796 (toList!11393 lt!672410) (_1!12671 (tuple2!25321 lt!672307 lt!672312))) e!873053)))

(declare-fun b!1566326 () Bool)

(assert (=> b!1566326 (= e!873054 None!869)))

(declare-fun b!1566325 () Bool)

(assert (=> b!1566325 (= e!873054 (getValueByKey!796 (t!51569 (toList!11393 lt!672410)) (_1!12671 (tuple2!25321 lt!672307 lt!672312))))))

(assert (= (and d!163231 c!144353) b!1566323))

(assert (= (and d!163231 (not c!144353)) b!1566324))

(assert (= (and b!1566324 c!144354) b!1566325))

(assert (= (and b!1566324 (not c!144354)) b!1566326))

(declare-fun m!1440825 () Bool)

(assert (=> b!1566325 m!1440825))

(assert (=> b!1566103 d!163231))

(declare-fun d!163233 () Bool)

(declare-fun res!1070622 () Bool)

(declare-fun e!873055 () Bool)

(assert (=> d!163233 (=> res!1070622 e!873055)))

(assert (=> d!163233 (= res!1070622 (or ((_ is Nil!36675) lt!672404) ((_ is Nil!36675) (t!51569 lt!672404))))))

(assert (=> d!163233 (= (isStrictlySorted!985 lt!672404) e!873055)))

(declare-fun b!1566327 () Bool)

(declare-fun e!873056 () Bool)

(assert (=> b!1566327 (= e!873055 e!873056)))

(declare-fun res!1070623 () Bool)

(assert (=> b!1566327 (=> (not res!1070623) (not e!873056))))

(assert (=> b!1566327 (= res!1070623 (bvslt (_1!12671 (h!38121 lt!672404)) (_1!12671 (h!38121 (t!51569 lt!672404)))))))

(declare-fun b!1566328 () Bool)

(assert (=> b!1566328 (= e!873056 (isStrictlySorted!985 (t!51569 lt!672404)))))

(assert (= (and d!163233 (not res!1070622)) b!1566327))

(assert (= (and b!1566327 res!1070623) b!1566328))

(declare-fun m!1440827 () Bool)

(assert (=> b!1566328 m!1440827))

(assert (=> d!163055 d!163233))

(declare-fun d!163235 () Bool)

(declare-fun res!1070624 () Bool)

(declare-fun e!873057 () Bool)

(assert (=> d!163235 (=> res!1070624 e!873057)))

(assert (=> d!163235 (= res!1070624 (or ((_ is Nil!36675) (toList!11393 lt!672253)) ((_ is Nil!36675) (t!51569 (toList!11393 lt!672253)))))))

(assert (=> d!163235 (= (isStrictlySorted!985 (toList!11393 lt!672253)) e!873057)))

(declare-fun b!1566329 () Bool)

(declare-fun e!873058 () Bool)

(assert (=> b!1566329 (= e!873057 e!873058)))

(declare-fun res!1070625 () Bool)

(assert (=> b!1566329 (=> (not res!1070625) (not e!873058))))

(assert (=> b!1566329 (= res!1070625 (bvslt (_1!12671 (h!38121 (toList!11393 lt!672253))) (_1!12671 (h!38121 (t!51569 (toList!11393 lt!672253))))))))

(declare-fun b!1566330 () Bool)

(assert (=> b!1566330 (= e!873058 (isStrictlySorted!985 (t!51569 (toList!11393 lt!672253))))))

(assert (= (and d!163235 (not res!1070624)) b!1566329))

(assert (= (and b!1566329 res!1070625) b!1566330))

(assert (=> b!1566330 m!1440643))

(assert (=> d!163055 d!163235))

(declare-fun b!1566332 () Bool)

(declare-fun e!873059 () Option!871)

(declare-fun e!873060 () Option!871)

(assert (=> b!1566332 (= e!873059 e!873060)))

(declare-fun c!144356 () Bool)

(assert (=> b!1566332 (= c!144356 (and ((_ is Cons!36674) (toList!11393 lt!672418)) (not (= (_1!12671 (h!38121 (toList!11393 lt!672418))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1566331 () Bool)

(assert (=> b!1566331 (= e!873059 (Some!870 (_2!12671 (h!38121 (toList!11393 lt!672418)))))))

(declare-fun c!144355 () Bool)

(declare-fun d!163237 () Bool)

(assert (=> d!163237 (= c!144355 (and ((_ is Cons!36674) (toList!11393 lt!672418)) (= (_1!12671 (h!38121 (toList!11393 lt!672418))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!163237 (= (getValueByKey!796 (toList!11393 lt!672418) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!873059)))

(declare-fun b!1566334 () Bool)

(assert (=> b!1566334 (= e!873060 None!869)))

(declare-fun b!1566333 () Bool)

(assert (=> b!1566333 (= e!873060 (getValueByKey!796 (t!51569 (toList!11393 lt!672418)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!163237 c!144355) b!1566331))

(assert (= (and d!163237 (not c!144355)) b!1566332))

(assert (= (and b!1566332 c!144356) b!1566333))

(assert (= (and b!1566332 (not c!144356)) b!1566334))

(declare-fun m!1440829 () Bool)

(assert (=> b!1566333 m!1440829))

(assert (=> b!1566108 d!163237))

(declare-fun d!163239 () Bool)

(assert (=> d!163239 (= ($colon$colon!989 e!872895 (ite c!144285 (h!38121 (toList!11393 lt!672253)) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))) (Cons!36674 (ite c!144285 (h!38121 (toList!11393 lt!672253)) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) e!872895))))

(assert (=> bm!71863 d!163239))

(assert (=> bm!71854 d!163219))

(assert (=> b!1566095 d!163115))

(declare-fun d!163241 () Bool)

(declare-fun res!1070626 () Bool)

(declare-fun e!873061 () Bool)

(assert (=> d!163241 (=> res!1070626 e!873061)))

(assert (=> d!163241 (= res!1070626 (and ((_ is Cons!36674) (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)))) (= (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))))) lt!672310)))))

(assert (=> d!163241 (= (containsKey!849 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))) lt!672310) e!873061)))

(declare-fun b!1566335 () Bool)

(declare-fun e!873062 () Bool)

(assert (=> b!1566335 (= e!873061 e!873062)))

(declare-fun res!1070627 () Bool)

(assert (=> b!1566335 (=> (not res!1070627) (not e!873062))))

(assert (=> b!1566335 (= res!1070627 (and (or (not ((_ is Cons!36674) (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))))) (bvsle (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))))) lt!672310)) ((_ is Cons!36674) (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)))) (bvslt (_1!12671 (h!38121 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312))))) lt!672310)))))

(declare-fun b!1566336 () Bool)

(assert (=> b!1566336 (= e!873062 (containsKey!849 (t!51569 (toList!11393 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)))) lt!672310))))

(assert (= (and d!163241 (not res!1070626)) b!1566335))

(assert (= (and b!1566335 res!1070627) b!1566336))

(declare-fun m!1440831 () Bool)

(assert (=> b!1566336 m!1440831))

(assert (=> d!163069 d!163241))

(declare-fun d!163243 () Bool)

(declare-fun res!1070628 () Bool)

(declare-fun e!873063 () Bool)

(assert (=> d!163243 (=> res!1070628 e!873063)))

(assert (=> d!163243 (= res!1070628 (and ((_ is Cons!36674) lt!672404) (= (_1!12671 (h!38121 lt!672404)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(assert (=> d!163243 (= (containsKey!849 lt!672404 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))) e!873063)))

(declare-fun b!1566337 () Bool)

(declare-fun e!873064 () Bool)

(assert (=> b!1566337 (= e!873063 e!873064)))

(declare-fun res!1070629 () Bool)

(assert (=> b!1566337 (=> (not res!1070629) (not e!873064))))

(assert (=> b!1566337 (= res!1070629 (and (or (not ((_ is Cons!36674) lt!672404)) (bvsle (_1!12671 (h!38121 lt!672404)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))) ((_ is Cons!36674) lt!672404) (bvslt (_1!12671 (h!38121 lt!672404)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256)))))))

(declare-fun b!1566338 () Bool)

(assert (=> b!1566338 (= e!873064 (containsKey!849 (t!51569 lt!672404) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) from!782) lt!672256))))))

(assert (= (and d!163243 (not res!1070628)) b!1566337))

(assert (= (and b!1566337 res!1070629) b!1566338))

(declare-fun m!1440833 () Bool)

(assert (=> b!1566338 m!1440833))

(assert (=> b!1566080 d!163243))

(declare-fun d!163245 () Bool)

(declare-fun e!873066 () Bool)

(assert (=> d!163245 e!873066))

(declare-fun res!1070630 () Bool)

(assert (=> d!163245 (=> res!1070630 e!873066)))

(declare-fun lt!672497 () Bool)

(assert (=> d!163245 (= res!1070630 (not lt!672497))))

(declare-fun lt!672498 () Bool)

(assert (=> d!163245 (= lt!672497 lt!672498)))

(declare-fun lt!672496 () Unit!51846)

(declare-fun e!873065 () Unit!51846)

(assert (=> d!163245 (= lt!672496 e!873065)))

(declare-fun c!144357 () Bool)

(assert (=> d!163245 (= c!144357 lt!672498)))

(assert (=> d!163245 (= lt!672498 (containsKey!849 (toList!11393 lt!672418) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163245 (= (contains!10306 lt!672418 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!672497)))

(declare-fun b!1566339 () Bool)

(declare-fun lt!672495 () Unit!51846)

(assert (=> b!1566339 (= e!873065 lt!672495)))

(assert (=> b!1566339 (= lt!672495 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672418) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1566339 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672418) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566340 () Bool)

(declare-fun Unit!51862 () Unit!51846)

(assert (=> b!1566340 (= e!873065 Unit!51862)))

(declare-fun b!1566341 () Bool)

(assert (=> b!1566341 (= e!873066 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672418) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!163245 c!144357) b!1566339))

(assert (= (and d!163245 (not c!144357)) b!1566340))

(assert (= (and d!163245 (not res!1070630)) b!1566341))

(declare-fun m!1440835 () Bool)

(assert (=> d!163245 m!1440835))

(declare-fun m!1440837 () Bool)

(assert (=> b!1566339 m!1440837))

(assert (=> b!1566339 m!1440523))

(assert (=> b!1566339 m!1440523))

(declare-fun m!1440839 () Bool)

(assert (=> b!1566339 m!1440839))

(assert (=> b!1566341 m!1440523))

(assert (=> b!1566341 m!1440523))

(assert (=> b!1566341 m!1440839))

(assert (=> d!163071 d!163245))

(declare-fun b!1566343 () Bool)

(declare-fun e!873067 () Option!871)

(declare-fun e!873068 () Option!871)

(assert (=> b!1566343 (= e!873067 e!873068)))

(declare-fun c!144359 () Bool)

(assert (=> b!1566343 (= c!144359 (and ((_ is Cons!36674) lt!672419) (not (= (_1!12671 (h!38121 lt!672419)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1566342 () Bool)

(assert (=> b!1566342 (= e!873067 (Some!870 (_2!12671 (h!38121 lt!672419))))))

(declare-fun c!144358 () Bool)

(declare-fun d!163247 () Bool)

(assert (=> d!163247 (= c!144358 (and ((_ is Cons!36674) lt!672419) (= (_1!12671 (h!38121 lt!672419)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!163247 (= (getValueByKey!796 lt!672419 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!873067)))

(declare-fun b!1566345 () Bool)

(assert (=> b!1566345 (= e!873068 None!869)))

(declare-fun b!1566344 () Bool)

(assert (=> b!1566344 (= e!873068 (getValueByKey!796 (t!51569 lt!672419) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!163247 c!144358) b!1566342))

(assert (= (and d!163247 (not c!144358)) b!1566343))

(assert (= (and b!1566343 c!144359) b!1566344))

(assert (= (and b!1566343 (not c!144359)) b!1566345))

(declare-fun m!1440841 () Bool)

(assert (=> b!1566344 m!1440841))

(assert (=> d!163071 d!163247))

(declare-fun d!163249 () Bool)

(assert (=> d!163249 (= (getValueByKey!796 lt!672419 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!870 (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!672499 () Unit!51846)

(assert (=> d!163249 (= lt!672499 (choose!2086 lt!672419 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!873069 () Bool)

(assert (=> d!163249 e!873069))

(declare-fun res!1070631 () Bool)

(assert (=> d!163249 (=> (not res!1070631) (not e!873069))))

(assert (=> d!163249 (= res!1070631 (isStrictlySorted!985 lt!672419))))

(assert (=> d!163249 (= (lemmaContainsTupThenGetReturnValue!388 lt!672419 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!672499)))

(declare-fun b!1566346 () Bool)

(declare-fun res!1070632 () Bool)

(assert (=> b!1566346 (=> (not res!1070632) (not e!873069))))

(assert (=> b!1566346 (= res!1070632 (containsKey!849 lt!672419 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566347 () Bool)

(assert (=> b!1566347 (= e!873069 (contains!10307 lt!672419 (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!163249 res!1070631) b!1566346))

(assert (= (and b!1566346 res!1070632) b!1566347))

(assert (=> d!163249 m!1440517))

(declare-fun m!1440843 () Bool)

(assert (=> d!163249 m!1440843))

(declare-fun m!1440845 () Bool)

(assert (=> d!163249 m!1440845))

(declare-fun m!1440847 () Bool)

(assert (=> b!1566346 m!1440847))

(declare-fun m!1440849 () Bool)

(assert (=> b!1566347 m!1440849))

(assert (=> d!163071 d!163249))

(declare-fun b!1566348 () Bool)

(declare-fun e!873072 () List!36678)

(declare-fun call!71879 () List!36678)

(assert (=> b!1566348 (= e!873072 call!71879)))

(declare-fun b!1566349 () Bool)

(declare-fun res!1070634 () Bool)

(declare-fun e!873071 () Bool)

(assert (=> b!1566349 (=> (not res!1070634) (not e!873071))))

(declare-fun lt!672500 () List!36678)

(assert (=> b!1566349 (= res!1070634 (containsKey!849 lt!672500 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566350 () Bool)

(declare-fun e!873073 () List!36678)

(declare-fun call!71878 () List!36678)

(assert (=> b!1566350 (= e!873073 call!71878)))

(declare-fun b!1566351 () Bool)

(declare-fun e!873074 () List!36678)

(declare-fun c!144363 () Bool)

(declare-fun c!144361 () Bool)

(assert (=> b!1566351 (= e!873074 (ite c!144363 (t!51569 (toList!11393 call!71850)) (ite c!144361 (Cons!36674 (h!38121 (toList!11393 call!71850)) (t!51569 (toList!11393 call!71850))) Nil!36675)))))

(declare-fun b!1566352 () Bool)

(assert (=> b!1566352 (= e!873071 (contains!10307 lt!672500 (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1566353 () Bool)

(assert (=> b!1566353 (= e!873073 call!71878)))

(declare-fun bm!71876 () Bool)

(declare-fun c!144362 () Bool)

(assert (=> bm!71876 (= call!71879 ($colon$colon!989 e!873074 (ite c!144362 (h!38121 (toList!11393 call!71850)) (tuple2!25321 (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!144360 () Bool)

(assert (=> bm!71876 (= c!144360 c!144362)))

(declare-fun b!1566354 () Bool)

(assert (=> b!1566354 (= e!873074 (insertStrictlySorted!578 (t!51569 (toList!11393 call!71850)) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566355 () Bool)

(declare-fun e!873070 () List!36678)

(declare-fun call!71880 () List!36678)

(assert (=> b!1566355 (= e!873070 call!71880)))

(declare-fun b!1566356 () Bool)

(assert (=> b!1566356 (= e!873072 e!873070)))

(assert (=> b!1566356 (= c!144363 (and ((_ is Cons!36674) (toList!11393 call!71850)) (= (_1!12671 (h!38121 (toList!11393 call!71850))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1566357 () Bool)

(assert (=> b!1566357 (= c!144361 (and ((_ is Cons!36674) (toList!11393 call!71850)) (bvsgt (_1!12671 (h!38121 (toList!11393 call!71850))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1566357 (= e!873070 e!873073)))

(declare-fun bm!71877 () Bool)

(assert (=> bm!71877 (= call!71878 call!71880)))

(declare-fun d!163251 () Bool)

(assert (=> d!163251 e!873071))

(declare-fun res!1070633 () Bool)

(assert (=> d!163251 (=> (not res!1070633) (not e!873071))))

(assert (=> d!163251 (= res!1070633 (isStrictlySorted!985 lt!672500))))

(assert (=> d!163251 (= lt!672500 e!873072)))

(assert (=> d!163251 (= c!144362 (and ((_ is Cons!36674) (toList!11393 call!71850)) (bvslt (_1!12671 (h!38121 (toList!11393 call!71850))) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!163251 (isStrictlySorted!985 (toList!11393 call!71850))))

(assert (=> d!163251 (= (insertStrictlySorted!578 (toList!11393 call!71850) (_1!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12671 (tuple2!25321 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26359 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!672500)))

(declare-fun bm!71875 () Bool)

(assert (=> bm!71875 (= call!71880 call!71879)))

(assert (= (and d!163251 c!144362) b!1566348))

(assert (= (and d!163251 (not c!144362)) b!1566356))

(assert (= (and b!1566356 c!144363) b!1566355))

(assert (= (and b!1566356 (not c!144363)) b!1566357))

(assert (= (and b!1566357 c!144361) b!1566353))

(assert (= (and b!1566357 (not c!144361)) b!1566350))

(assert (= (or b!1566353 b!1566350) bm!71877))

(assert (= (or b!1566355 bm!71877) bm!71875))

(assert (= (or b!1566348 bm!71875) bm!71876))

(assert (= (and bm!71876 c!144360) b!1566354))

(assert (= (and bm!71876 (not c!144360)) b!1566351))

(assert (= (and d!163251 res!1070633) b!1566349))

(assert (= (and b!1566349 res!1070634) b!1566352))

(declare-fun m!1440851 () Bool)

(assert (=> bm!71876 m!1440851))

(declare-fun m!1440853 () Bool)

(assert (=> b!1566354 m!1440853))

(declare-fun m!1440855 () Bool)

(assert (=> d!163251 m!1440855))

(declare-fun m!1440857 () Bool)

(assert (=> d!163251 m!1440857))

(declare-fun m!1440859 () Bool)

(assert (=> b!1566349 m!1440859))

(declare-fun m!1440861 () Bool)

(assert (=> b!1566352 m!1440861))

(assert (=> d!163071 d!163251))

(declare-fun d!163253 () Bool)

(assert (=> d!163253 (= (get!26360 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!22315 (select (arr!50456 _values!487) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565964 d!163253))

(declare-fun d!163255 () Bool)

(assert (=> d!163255 (= (isEmpty!1151 lt!672360) (isEmpty!1152 (toList!11393 lt!672360)))))

(declare-fun bs!45042 () Bool)

(assert (= bs!45042 d!163255))

(declare-fun m!1440863 () Bool)

(assert (=> bs!45042 m!1440863))

(assert (=> b!1565974 d!163255))

(assert (=> d!163073 d!163069))

(assert (=> d!163073 d!163067))

(declare-fun d!163257 () Bool)

(assert (=> d!163257 (not (contains!10306 (+!5114 lt!672311 (tuple2!25321 lt!672307 lt!672312)) lt!672310))))

(assert (=> d!163257 true))

(declare-fun _$36!389 () Unit!51846)

(assert (=> d!163257 (= (choose!2084 lt!672311 lt!672307 lt!672312 lt!672310) _$36!389)))

(declare-fun bs!45043 () Bool)

(assert (= bs!45043 d!163257))

(assert (=> bs!45043 m!1440247))

(assert (=> bs!45043 m!1440247))

(assert (=> bs!45043 m!1440251))

(assert (=> d!163073 d!163257))

(declare-fun d!163259 () Bool)

(declare-fun e!873076 () Bool)

(assert (=> d!163259 e!873076))

(declare-fun res!1070635 () Bool)

(assert (=> d!163259 (=> res!1070635 e!873076)))

(declare-fun lt!672503 () Bool)

(assert (=> d!163259 (= res!1070635 (not lt!672503))))

(declare-fun lt!672504 () Bool)

(assert (=> d!163259 (= lt!672503 lt!672504)))

(declare-fun lt!672502 () Unit!51846)

(declare-fun e!873075 () Unit!51846)

(assert (=> d!163259 (= lt!672502 e!873075)))

(declare-fun c!144364 () Bool)

(assert (=> d!163259 (= c!144364 lt!672504)))

(assert (=> d!163259 (= lt!672504 (containsKey!849 (toList!11393 lt!672311) lt!672310))))

(assert (=> d!163259 (= (contains!10306 lt!672311 lt!672310) lt!672503)))

(declare-fun b!1566358 () Bool)

(declare-fun lt!672501 () Unit!51846)

(assert (=> b!1566358 (= e!873075 lt!672501)))

(assert (=> b!1566358 (= lt!672501 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672311) lt!672310))))

(assert (=> b!1566358 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672311) lt!672310))))

(declare-fun b!1566359 () Bool)

(declare-fun Unit!51863 () Unit!51846)

(assert (=> b!1566359 (= e!873075 Unit!51863)))

(declare-fun b!1566360 () Bool)

(assert (=> b!1566360 (= e!873076 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672311) lt!672310)))))

(assert (= (and d!163259 c!144364) b!1566358))

(assert (= (and d!163259 (not c!144364)) b!1566359))

(assert (= (and d!163259 (not res!1070635)) b!1566360))

(declare-fun m!1440865 () Bool)

(assert (=> d!163259 m!1440865))

(declare-fun m!1440867 () Bool)

(assert (=> b!1566358 m!1440867))

(declare-fun m!1440869 () Bool)

(assert (=> b!1566358 m!1440869))

(assert (=> b!1566358 m!1440869))

(declare-fun m!1440871 () Bool)

(assert (=> b!1566358 m!1440871))

(assert (=> b!1566360 m!1440869))

(assert (=> b!1566360 m!1440869))

(assert (=> b!1566360 m!1440871))

(assert (=> d!163073 d!163259))

(declare-fun d!163261 () Bool)

(declare-fun c!144367 () Bool)

(assert (=> d!163261 (= c!144367 ((_ is Nil!36675) (toList!11393 lt!672330)))))

(declare-fun e!873079 () (InoxSet tuple2!25320))

(assert (=> d!163261 (= (content!798 (toList!11393 lt!672330)) e!873079)))

(declare-fun b!1566365 () Bool)

(assert (=> b!1566365 (= e!873079 ((as const (Array tuple2!25320 Bool)) false))))

(declare-fun b!1566366 () Bool)

(assert (=> b!1566366 (= e!873079 ((_ map or) (store ((as const (Array tuple2!25320 Bool)) false) (h!38121 (toList!11393 lt!672330)) true) (content!798 (t!51569 (toList!11393 lt!672330)))))))

(assert (= (and d!163261 c!144367) b!1566365))

(assert (= (and d!163261 (not c!144367)) b!1566366))

(declare-fun m!1440873 () Bool)

(assert (=> b!1566366 m!1440873))

(assert (=> b!1566366 m!1440805))

(assert (=> d!163025 d!163261))

(declare-fun d!163263 () Bool)

(declare-fun res!1070636 () Bool)

(declare-fun e!873080 () Bool)

(assert (=> d!163263 (=> res!1070636 e!873080)))

(assert (=> d!163263 (= res!1070636 (and ((_ is Cons!36674) (toList!11393 lt!672313)) (= (_1!12671 (h!38121 (toList!11393 lt!672313))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163263 (= (containsKey!849 (toList!11393 lt!672313) #b0000000000000000000000000000000000000000000000000000000000000000) e!873080)))

(declare-fun b!1566367 () Bool)

(declare-fun e!873081 () Bool)

(assert (=> b!1566367 (= e!873080 e!873081)))

(declare-fun res!1070637 () Bool)

(assert (=> b!1566367 (=> (not res!1070637) (not e!873081))))

(assert (=> b!1566367 (= res!1070637 (and (or (not ((_ is Cons!36674) (toList!11393 lt!672313))) (bvsle (_1!12671 (h!38121 (toList!11393 lt!672313))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36674) (toList!11393 lt!672313)) (bvslt (_1!12671 (h!38121 (toList!11393 lt!672313))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566368 () Bool)

(assert (=> b!1566368 (= e!873081 (containsKey!849 (t!51569 (toList!11393 lt!672313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163263 (not res!1070636)) b!1566367))

(assert (= (and b!1566367 res!1070637) b!1566368))

(declare-fun m!1440875 () Bool)

(assert (=> b!1566368 m!1440875))

(assert (=> d!163023 d!163263))

(declare-fun d!163265 () Bool)

(declare-fun e!873083 () Bool)

(assert (=> d!163265 e!873083))

(declare-fun res!1070638 () Bool)

(assert (=> d!163265 (=> res!1070638 e!873083)))

(declare-fun lt!672507 () Bool)

(assert (=> d!163265 (= res!1070638 (not lt!672507))))

(declare-fun lt!672508 () Bool)

(assert (=> d!163265 (= lt!672507 lt!672508)))

(declare-fun lt!672506 () Unit!51846)

(declare-fun e!873082 () Unit!51846)

(assert (=> d!163265 (= lt!672506 e!873082)))

(declare-fun c!144368 () Bool)

(assert (=> d!163265 (= c!144368 lt!672508)))

(assert (=> d!163265 (= lt!672508 (containsKey!849 (toList!11393 lt!672360) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163265 (= (contains!10306 lt!672360 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672507)))

(declare-fun b!1566369 () Bool)

(declare-fun lt!672505 () Unit!51846)

(assert (=> b!1566369 (= e!873082 lt!672505)))

(assert (=> b!1566369 (= lt!672505 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11393 lt!672360) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566369 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672360) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566370 () Bool)

(declare-fun Unit!51864 () Unit!51846)

(assert (=> b!1566370 (= e!873082 Unit!51864)))

(declare-fun b!1566371 () Bool)

(assert (=> b!1566371 (= e!873083 (isDefined!584 (getValueByKey!796 (toList!11393 lt!672360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163265 c!144368) b!1566369))

(assert (= (and d!163265 (not c!144368)) b!1566370))

(assert (= (and d!163265 (not res!1070638)) b!1566371))

(declare-fun m!1440877 () Bool)

(assert (=> d!163265 m!1440877))

(declare-fun m!1440879 () Bool)

(assert (=> b!1566369 m!1440879))

(declare-fun m!1440881 () Bool)

(assert (=> b!1566369 m!1440881))

(assert (=> b!1566369 m!1440881))

(declare-fun m!1440883 () Bool)

(assert (=> b!1566369 m!1440883))

(assert (=> b!1566371 m!1440881))

(assert (=> b!1566371 m!1440881))

(assert (=> b!1566371 m!1440883))

(assert (=> b!1565978 d!163265))

(declare-fun d!163267 () Bool)

(assert (=> d!163267 (= (apply!1105 lt!672360 (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (get!26362 (getValueByKey!796 (toList!11393 lt!672360) (select (arr!50455 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))))

(declare-fun bs!45044 () Bool)

(assert (= bs!45044 d!163267))

(assert (=> bs!45044 m!1440347))

(assert (=> bs!45044 m!1440627))

(assert (=> bs!45044 m!1440627))

(declare-fun m!1440885 () Bool)

(assert (=> bs!45044 m!1440885))

(assert (=> b!1565976 d!163267))

(assert (=> b!1565976 d!163203))

(declare-fun d!163269 () Bool)

(assert (=> d!163269 (= (isEmpty!1153 (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!870) (getValueByKey!796 (toList!11393 lt!672254) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!163015 d!163269))

(declare-fun mapIsEmpty!59841 () Bool)

(declare-fun mapRes!59841 () Bool)

(assert (=> mapIsEmpty!59841 mapRes!59841))

(declare-fun mapNonEmpty!59841 () Bool)

(declare-fun tp!113875 () Bool)

(declare-fun e!873085 () Bool)

(assert (=> mapNonEmpty!59841 (= mapRes!59841 (and tp!113875 e!873085))))

(declare-fun mapRest!59841 () (Array (_ BitVec 32) ValueCell!18449))

(declare-fun mapValue!59841 () ValueCell!18449)

(declare-fun mapKey!59841 () (_ BitVec 32))

(assert (=> mapNonEmpty!59841 (= mapRest!59840 (store mapRest!59841 mapKey!59841 mapValue!59841))))

(declare-fun condMapEmpty!59841 () Bool)

(declare-fun mapDefault!59841 () ValueCell!18449)

(assert (=> mapNonEmpty!59840 (= condMapEmpty!59841 (= mapRest!59840 ((as const (Array (_ BitVec 32) ValueCell!18449)) mapDefault!59841)))))

(declare-fun e!873084 () Bool)

(assert (=> mapNonEmpty!59840 (= tp!113874 (and e!873084 mapRes!59841))))

(declare-fun b!1566373 () Bool)

(assert (=> b!1566373 (= e!873084 tp_is_empty!38959)))

(declare-fun b!1566372 () Bool)

(assert (=> b!1566372 (= e!873085 tp_is_empty!38959)))

(assert (= (and mapNonEmpty!59840 condMapEmpty!59841) mapIsEmpty!59841))

(assert (= (and mapNonEmpty!59840 (not condMapEmpty!59841)) mapNonEmpty!59841))

(assert (= (and mapNonEmpty!59841 ((_ is ValueCellFull!18449) mapValue!59841)) b!1566372))

(assert (= (and mapNonEmpty!59840 ((_ is ValueCellFull!18449) mapDefault!59841)) b!1566373))

(declare-fun m!1440887 () Bool)

(assert (=> mapNonEmpty!59841 m!1440887))

(declare-fun b_lambda!25017 () Bool)

(assert (= b_lambda!25013 (or (and start!133912 b_free!32185) b_lambda!25017)))

(declare-fun b_lambda!25019 () Bool)

(assert (= b_lambda!25015 (or (and start!133912 b_free!32185) b_lambda!25019)))

(check-sat (not d!163089) (not d!163181) (not b_lambda!25019) (not d!163133) (not b!1566346) (not d!163251) (not b!1566371) (not b!1566307) (not b!1566253) (not b!1566330) (not d!163187) (not d!163141) (not b!1566135) (not b!1566123) (not b!1566167) (not d!163159) (not b!1566293) (not d!163245) (not bm!71867) (not b!1566302) (not b!1566138) (not d!163267) (not bm!71870) (not b_lambda!25009) (not b!1566158) (not b!1566264) (not d!163179) (not b!1566354) (not b!1566366) (not d!163249) (not b!1566155) (not d!163149) (not b!1566333) (not d!163081) (not b!1566358) (not b!1566121) (not d!163125) (not bm!71869) (not b!1566369) (not b!1566297) (not b!1566267) (not b!1566299) (not d!163195) (not b!1566145) (not d!163097) (not d!163085) (not b_lambda!25011) (not b_lambda!25017) (not b!1566248) (not b!1566349) (not b!1566274) (not b!1566328) (not b!1566306) (not b!1566191) (not b!1566137) (not b!1566270) (not d!163191) (not b!1566182) (not b!1566269) (not b!1566265) (not b!1566129) (not bm!71874) (not b!1566352) (not d!163209) (not b!1566322) (not b!1566314) (not b!1566305) (not b!1566338) (not d!163095) (not b!1566198) (not d!163225) (not b!1566245) (not d!163201) (not b!1566312) (not b!1566368) (not b!1566239) (not b!1566174) (not b_next!32185) (not b!1566143) (not d!163109) (not b!1566200) (not b!1566294) (not b!1566336) (not b!1566181) (not b!1566172) (not d!163163) (not d!163139) (not b!1566159) (not b!1566261) (not b_lambda!25003) (not b!1566130) (not bm!71872) (not b!1566188) (not b!1566203) (not b!1566341) (not b!1566205) (not b!1566179) (not b!1566262) (not d!163199) (not d!163197) (not b!1566170) (not d!163155) (not d!163129) (not d!163077) (not b!1566300) (not b!1566263) (not b!1566176) (not mapNonEmpty!59841) (not b!1566169) (not b!1566236) (not d!163219) (not b!1566163) (not d!163223) (not b!1566178) (not b!1566151) (not b_lambda!25001) (not b!1566319) (not b!1566316) (not b!1566309) (not b!1566230) (not b!1566115) (not b!1566207) (not d!163165) (not d!163211) (not d!163175) (not d!163257) (not d!163259) (not b!1566344) (not b!1566193) (not b!1566347) (not b!1566304) (not b!1566246) (not b!1566271) (not b!1566259) (not d!163215) (not b!1566140) (not bm!71876) (not d!163265) (not d!163113) (not d!163135) (not b!1566339) (not d!163173) (not b!1566325) (not d!163255) (not b!1566243) (not b!1566185) (not b!1566249) (not d!163093) (not b!1566117) (not d!163131) (not b!1566251) tp_is_empty!38959 (not d!163169) (not b_lambda!24995) (not b!1566165) (not b!1566132) (not b!1566119) (not d!163207) (not d!163229) (not b!1566360) b_and!51815)
(check-sat b_and!51815 (not b_next!32185))
