; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100606 () Bool)

(assert start!100606)

(declare-fun b_free!25711 () Bool)

(declare-fun b_next!25711 () Bool)

(assert (=> start!100606 (= b_free!25711 (not b_next!25711))))

(declare-fun tp!90120 () Bool)

(declare-fun b_and!42315 () Bool)

(assert (=> start!100606 (= tp!90120 b_and!42315)))

(declare-fun b!1199247 () Bool)

(declare-fun e!681345 () Bool)

(declare-fun tp_is_empty!30415 () Bool)

(assert (=> b!1199247 (= e!681345 tp_is_empty!30415)))

(declare-fun b!1199248 () Bool)

(declare-fun res!797783 () Bool)

(declare-fun e!681348 () Bool)

(assert (=> b!1199248 (=> (not res!797783) (not e!681348))))

(declare-datatypes ((array!77643 0))(
  ( (array!77644 (arr!37461 (Array (_ BitVec 32) (_ BitVec 64))) (size!37998 (_ BitVec 32))) )
))
(declare-fun lt!543861 () array!77643)

(declare-datatypes ((List!26366 0))(
  ( (Nil!26363) (Cons!26362 (h!27580 (_ BitVec 64)) (t!39061 List!26366)) )
))
(declare-fun arrayNoDuplicates!0 (array!77643 (_ BitVec 32) List!26366) Bool)

(assert (=> b!1199248 (= res!797783 (arrayNoDuplicates!0 lt!543861 #b00000000000000000000000000000000 Nil!26363))))

(declare-fun b!1199249 () Bool)

(declare-fun res!797780 () Bool)

(declare-fun e!681343 () Bool)

(assert (=> b!1199249 (=> (not res!797780) (not e!681343))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77643)

(assert (=> b!1199249 (= res!797780 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37998 _keys!1208))))))

(declare-fun res!797775 () Bool)

(assert (=> start!100606 (=> (not res!797775) (not e!681343))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100606 (= res!797775 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37998 _keys!1208))))))

(assert (=> start!100606 e!681343))

(assert (=> start!100606 tp_is_empty!30415))

(declare-fun array_inv!28622 (array!77643) Bool)

(assert (=> start!100606 (array_inv!28622 _keys!1208)))

(assert (=> start!100606 true))

(assert (=> start!100606 tp!90120))

(declare-datatypes ((V!45681 0))(
  ( (V!45682 (val!15264 Int)) )
))
(declare-datatypes ((ValueCell!14498 0))(
  ( (ValueCellFull!14498 (v!17898 V!45681)) (EmptyCell!14498) )
))
(declare-datatypes ((array!77645 0))(
  ( (array!77646 (arr!37462 (Array (_ BitVec 32) ValueCell!14498)) (size!37999 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77645)

(declare-fun e!681342 () Bool)

(declare-fun array_inv!28623 (array!77645) Bool)

(assert (=> start!100606 (and (array_inv!28623 _values!996) e!681342)))

(declare-fun b!1199250 () Bool)

(declare-fun e!681344 () Bool)

(assert (=> b!1199250 (= e!681348 (not e!681344))))

(declare-fun res!797779 () Bool)

(assert (=> b!1199250 (=> res!797779 e!681344)))

(assert (=> b!1199250 (= res!797779 (or (bvsle from!1455 i!673) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37998 _keys!1208))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199250 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39689 0))(
  ( (Unit!39690) )
))
(declare-fun lt!543862 () Unit!39689)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77643 (_ BitVec 64) (_ BitVec 32)) Unit!39689)

(assert (=> b!1199250 (= lt!543862 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199251 () Bool)

(declare-fun res!797776 () Bool)

(assert (=> b!1199251 (=> (not res!797776) (not e!681343))))

(assert (=> b!1199251 (= res!797776 (= (select (arr!37461 _keys!1208) i!673) k0!934))))

(declare-fun b!1199252 () Bool)

(declare-fun e!681346 () Bool)

(assert (=> b!1199252 (= e!681346 tp_is_empty!30415)))

(declare-fun b!1199253 () Bool)

(assert (=> b!1199253 (= e!681343 e!681348)))

(declare-fun res!797784 () Bool)

(assert (=> b!1199253 (=> (not res!797784) (not e!681348))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77643 (_ BitVec 32)) Bool)

(assert (=> b!1199253 (= res!797784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543861 mask!1564))))

(assert (=> b!1199253 (= lt!543861 (array!77644 (store (arr!37461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37998 _keys!1208)))))

(declare-fun b!1199254 () Bool)

(declare-fun mapRes!47462 () Bool)

(assert (=> b!1199254 (= e!681342 (and e!681345 mapRes!47462))))

(declare-fun condMapEmpty!47462 () Bool)

(declare-fun mapDefault!47462 () ValueCell!14498)

(assert (=> b!1199254 (= condMapEmpty!47462 (= (arr!37462 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14498)) mapDefault!47462)))))

(declare-fun mapIsEmpty!47462 () Bool)

(assert (=> mapIsEmpty!47462 mapRes!47462))

(declare-fun b!1199255 () Bool)

(declare-fun res!797785 () Bool)

(assert (=> b!1199255 (=> (not res!797785) (not e!681343))))

(assert (=> b!1199255 (= res!797785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199256 () Bool)

(declare-fun res!797778 () Bool)

(assert (=> b!1199256 (=> (not res!797778) (not e!681343))))

(assert (=> b!1199256 (= res!797778 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26363))))

(declare-fun zeroValue!944 () V!45681)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45681)

(declare-fun b!1199257 () Bool)

(declare-datatypes ((tuple2!19556 0))(
  ( (tuple2!19557 (_1!9789 (_ BitVec 64)) (_2!9789 V!45681)) )
))
(declare-datatypes ((List!26367 0))(
  ( (Nil!26364) (Cons!26363 (h!27581 tuple2!19556) (t!39062 List!26367)) )
))
(declare-datatypes ((ListLongMap!17533 0))(
  ( (ListLongMap!17534 (toList!8782 List!26367)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5249 (array!77643 array!77645 (_ BitVec 32) (_ BitVec 32) V!45681 V!45681 (_ BitVec 32) Int) ListLongMap!17533)

(declare-fun dynLambda!3197 (Int (_ BitVec 64)) V!45681)

(assert (=> b!1199257 (= e!681344 (= (getCurrentListMapNoExtraKeys!5249 lt!543861 (array!77646 (store (arr!37462 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) (getCurrentListMapNoExtraKeys!5249 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004)))))

(declare-fun b!1199258 () Bool)

(declare-fun res!797781 () Bool)

(assert (=> b!1199258 (=> (not res!797781) (not e!681343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199258 (= res!797781 (validKeyInArray!0 k0!934))))

(declare-fun b!1199259 () Bool)

(declare-fun res!797782 () Bool)

(assert (=> b!1199259 (=> (not res!797782) (not e!681343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199259 (= res!797782 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47462 () Bool)

(declare-fun tp!90119 () Bool)

(assert (=> mapNonEmpty!47462 (= mapRes!47462 (and tp!90119 e!681346))))

(declare-fun mapValue!47462 () ValueCell!14498)

(declare-fun mapRest!47462 () (Array (_ BitVec 32) ValueCell!14498))

(declare-fun mapKey!47462 () (_ BitVec 32))

(assert (=> mapNonEmpty!47462 (= (arr!37462 _values!996) (store mapRest!47462 mapKey!47462 mapValue!47462))))

(declare-fun b!1199260 () Bool)

(declare-fun res!797777 () Bool)

(assert (=> b!1199260 (=> (not res!797777) (not e!681343))))

(assert (=> b!1199260 (= res!797777 (and (= (size!37999 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37998 _keys!1208) (size!37999 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100606 res!797775) b!1199259))

(assert (= (and b!1199259 res!797782) b!1199260))

(assert (= (and b!1199260 res!797777) b!1199255))

(assert (= (and b!1199255 res!797785) b!1199256))

(assert (= (and b!1199256 res!797778) b!1199249))

(assert (= (and b!1199249 res!797780) b!1199258))

(assert (= (and b!1199258 res!797781) b!1199251))

(assert (= (and b!1199251 res!797776) b!1199253))

(assert (= (and b!1199253 res!797784) b!1199248))

(assert (= (and b!1199248 res!797783) b!1199250))

(assert (= (and b!1199250 (not res!797779)) b!1199257))

(assert (= (and b!1199254 condMapEmpty!47462) mapIsEmpty!47462))

(assert (= (and b!1199254 (not condMapEmpty!47462)) mapNonEmpty!47462))

(get-info :version)

(assert (= (and mapNonEmpty!47462 ((_ is ValueCellFull!14498) mapValue!47462)) b!1199252))

(assert (= (and b!1199254 ((_ is ValueCellFull!14498) mapDefault!47462)) b!1199247))

(assert (= start!100606 b!1199254))

(declare-fun b_lambda!20895 () Bool)

(assert (=> (not b_lambda!20895) (not b!1199257)))

(declare-fun t!39060 () Bool)

(declare-fun tb!10515 () Bool)

(assert (=> (and start!100606 (= defaultEntry!1004 defaultEntry!1004) t!39060) tb!10515))

(declare-fun result!21613 () Bool)

(assert (=> tb!10515 (= result!21613 tp_is_empty!30415)))

(assert (=> b!1199257 t!39060))

(declare-fun b_and!42317 () Bool)

(assert (= b_and!42315 (and (=> t!39060 result!21613) b_and!42317)))

(declare-fun m!1106413 () Bool)

(assert (=> b!1199258 m!1106413))

(declare-fun m!1106415 () Bool)

(assert (=> b!1199251 m!1106415))

(declare-fun m!1106417 () Bool)

(assert (=> b!1199257 m!1106417))

(declare-fun m!1106419 () Bool)

(assert (=> b!1199257 m!1106419))

(declare-fun m!1106421 () Bool)

(assert (=> b!1199257 m!1106421))

(declare-fun m!1106423 () Bool)

(assert (=> b!1199257 m!1106423))

(declare-fun m!1106425 () Bool)

(assert (=> mapNonEmpty!47462 m!1106425))

(declare-fun m!1106427 () Bool)

(assert (=> start!100606 m!1106427))

(declare-fun m!1106429 () Bool)

(assert (=> start!100606 m!1106429))

(declare-fun m!1106431 () Bool)

(assert (=> b!1199250 m!1106431))

(declare-fun m!1106433 () Bool)

(assert (=> b!1199250 m!1106433))

(declare-fun m!1106435 () Bool)

(assert (=> b!1199253 m!1106435))

(declare-fun m!1106437 () Bool)

(assert (=> b!1199253 m!1106437))

(declare-fun m!1106439 () Bool)

(assert (=> b!1199259 m!1106439))

(declare-fun m!1106441 () Bool)

(assert (=> b!1199256 m!1106441))

(declare-fun m!1106443 () Bool)

(assert (=> b!1199248 m!1106443))

(declare-fun m!1106445 () Bool)

(assert (=> b!1199255 m!1106445))

(check-sat (not b_next!25711) (not b!1199248) (not b!1199256) (not b_lambda!20895) (not b!1199250) (not b!1199258) (not b!1199255) (not start!100606) (not mapNonEmpty!47462) (not b!1199259) (not b!1199257) tp_is_empty!30415 (not b!1199253) b_and!42317)
(check-sat b_and!42317 (not b_next!25711))
(get-model)

(declare-fun b_lambda!20901 () Bool)

(assert (= b_lambda!20895 (or (and start!100606 b_free!25711) b_lambda!20901)))

(check-sat (not b_next!25711) (not b!1199248) (not b!1199256) (not b_lambda!20901) (not b!1199250) (not b!1199258) (not b!1199255) (not start!100606) (not mapNonEmpty!47462) (not b!1199259) (not b!1199257) tp_is_empty!30415 (not b!1199253) b_and!42317)
(check-sat b_and!42317 (not b_next!25711))
(get-model)

(declare-fun d!132839 () Bool)

(assert (=> d!132839 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1199258 d!132839))

(declare-fun b!1199359 () Bool)

(declare-fun e!681397 () Bool)

(declare-fun call!57337 () Bool)

(assert (=> b!1199359 (= e!681397 call!57337)))

(declare-fun bm!57334 () Bool)

(assert (=> bm!57334 (= call!57337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543861 mask!1564))))

(declare-fun b!1199360 () Bool)

(declare-fun e!681399 () Bool)

(declare-fun e!681398 () Bool)

(assert (=> b!1199360 (= e!681399 e!681398)))

(declare-fun c!117814 () Bool)

(assert (=> b!1199360 (= c!117814 (validKeyInArray!0 (select (arr!37461 lt!543861) #b00000000000000000000000000000000)))))

(declare-fun d!132841 () Bool)

(declare-fun res!797857 () Bool)

(assert (=> d!132841 (=> res!797857 e!681399)))

(assert (=> d!132841 (= res!797857 (bvsge #b00000000000000000000000000000000 (size!37998 lt!543861)))))

(assert (=> d!132841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543861 mask!1564) e!681399)))

(declare-fun b!1199361 () Bool)

(assert (=> b!1199361 (= e!681398 call!57337)))

(declare-fun b!1199362 () Bool)

(assert (=> b!1199362 (= e!681398 e!681397)))

(declare-fun lt!543881 () (_ BitVec 64))

(assert (=> b!1199362 (= lt!543881 (select (arr!37461 lt!543861) #b00000000000000000000000000000000))))

(declare-fun lt!543882 () Unit!39689)

(assert (=> b!1199362 (= lt!543882 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543861 lt!543881 #b00000000000000000000000000000000))))

(assert (=> b!1199362 (arrayContainsKey!0 lt!543861 lt!543881 #b00000000000000000000000000000000)))

(declare-fun lt!543883 () Unit!39689)

(assert (=> b!1199362 (= lt!543883 lt!543882)))

(declare-fun res!797856 () Bool)

(declare-datatypes ((SeekEntryResult!9888 0))(
  ( (MissingZero!9888 (index!41923 (_ BitVec 32))) (Found!9888 (index!41924 (_ BitVec 32))) (Intermediate!9888 (undefined!10700 Bool) (index!41925 (_ BitVec 32)) (x!105906 (_ BitVec 32))) (Undefined!9888) (MissingVacant!9888 (index!41926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77643 (_ BitVec 32)) SeekEntryResult!9888)

(assert (=> b!1199362 (= res!797856 (= (seekEntryOrOpen!0 (select (arr!37461 lt!543861) #b00000000000000000000000000000000) lt!543861 mask!1564) (Found!9888 #b00000000000000000000000000000000)))))

(assert (=> b!1199362 (=> (not res!797856) (not e!681397))))

(assert (= (and d!132841 (not res!797857)) b!1199360))

(assert (= (and b!1199360 c!117814) b!1199362))

(assert (= (and b!1199360 (not c!117814)) b!1199361))

(assert (= (and b!1199362 res!797856) b!1199359))

(assert (= (or b!1199359 b!1199361) bm!57334))

(declare-fun m!1106515 () Bool)

(assert (=> bm!57334 m!1106515))

(declare-fun m!1106517 () Bool)

(assert (=> b!1199360 m!1106517))

(assert (=> b!1199360 m!1106517))

(declare-fun m!1106519 () Bool)

(assert (=> b!1199360 m!1106519))

(assert (=> b!1199362 m!1106517))

(declare-fun m!1106521 () Bool)

(assert (=> b!1199362 m!1106521))

(declare-fun m!1106523 () Bool)

(assert (=> b!1199362 m!1106523))

(assert (=> b!1199362 m!1106517))

(declare-fun m!1106525 () Bool)

(assert (=> b!1199362 m!1106525))

(assert (=> b!1199253 d!132841))

(declare-fun b!1199373 () Bool)

(declare-fun e!681411 () Bool)

(declare-fun e!681409 () Bool)

(assert (=> b!1199373 (= e!681411 e!681409)))

(declare-fun c!117817 () Bool)

(assert (=> b!1199373 (= c!117817 (validKeyInArray!0 (select (arr!37461 lt!543861) #b00000000000000000000000000000000)))))

(declare-fun b!1199374 () Bool)

(declare-fun call!57340 () Bool)

(assert (=> b!1199374 (= e!681409 call!57340)))

(declare-fun b!1199376 () Bool)

(declare-fun e!681410 () Bool)

(declare-fun contains!6898 (List!26366 (_ BitVec 64)) Bool)

(assert (=> b!1199376 (= e!681410 (contains!6898 Nil!26363 (select (arr!37461 lt!543861) #b00000000000000000000000000000000)))))

(declare-fun b!1199377 () Bool)

(declare-fun e!681408 () Bool)

(assert (=> b!1199377 (= e!681408 e!681411)))

(declare-fun res!797865 () Bool)

(assert (=> b!1199377 (=> (not res!797865) (not e!681411))))

(assert (=> b!1199377 (= res!797865 (not e!681410))))

(declare-fun res!797864 () Bool)

(assert (=> b!1199377 (=> (not res!797864) (not e!681410))))

(assert (=> b!1199377 (= res!797864 (validKeyInArray!0 (select (arr!37461 lt!543861) #b00000000000000000000000000000000)))))

(declare-fun bm!57337 () Bool)

(assert (=> bm!57337 (= call!57340 (arrayNoDuplicates!0 lt!543861 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117817 (Cons!26362 (select (arr!37461 lt!543861) #b00000000000000000000000000000000) Nil!26363) Nil!26363)))))

(declare-fun d!132843 () Bool)

(declare-fun res!797866 () Bool)

(assert (=> d!132843 (=> res!797866 e!681408)))

(assert (=> d!132843 (= res!797866 (bvsge #b00000000000000000000000000000000 (size!37998 lt!543861)))))

(assert (=> d!132843 (= (arrayNoDuplicates!0 lt!543861 #b00000000000000000000000000000000 Nil!26363) e!681408)))

(declare-fun b!1199375 () Bool)

(assert (=> b!1199375 (= e!681409 call!57340)))

(assert (= (and d!132843 (not res!797866)) b!1199377))

(assert (= (and b!1199377 res!797864) b!1199376))

(assert (= (and b!1199377 res!797865) b!1199373))

(assert (= (and b!1199373 c!117817) b!1199374))

(assert (= (and b!1199373 (not c!117817)) b!1199375))

(assert (= (or b!1199374 b!1199375) bm!57337))

(assert (=> b!1199373 m!1106517))

(assert (=> b!1199373 m!1106517))

(assert (=> b!1199373 m!1106519))

(assert (=> b!1199376 m!1106517))

(assert (=> b!1199376 m!1106517))

(declare-fun m!1106527 () Bool)

(assert (=> b!1199376 m!1106527))

(assert (=> b!1199377 m!1106517))

(assert (=> b!1199377 m!1106517))

(assert (=> b!1199377 m!1106519))

(assert (=> bm!57337 m!1106517))

(declare-fun m!1106529 () Bool)

(assert (=> bm!57337 m!1106529))

(assert (=> b!1199248 d!132843))

(declare-fun b!1199402 () Bool)

(declare-fun e!681427 () ListLongMap!17533)

(declare-fun call!57343 () ListLongMap!17533)

(assert (=> b!1199402 (= e!681427 call!57343)))

(declare-fun b!1199403 () Bool)

(declare-fun e!681426 () ListLongMap!17533)

(assert (=> b!1199403 (= e!681426 (ListLongMap!17534 Nil!26364))))

(declare-fun d!132845 () Bool)

(declare-fun e!681432 () Bool)

(assert (=> d!132845 e!681432))

(declare-fun res!797876 () Bool)

(assert (=> d!132845 (=> (not res!797876) (not e!681432))))

(declare-fun lt!543899 () ListLongMap!17533)

(declare-fun contains!6899 (ListLongMap!17533 (_ BitVec 64)) Bool)

(assert (=> d!132845 (= res!797876 (not (contains!6899 lt!543899 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132845 (= lt!543899 e!681426)))

(declare-fun c!117826 () Bool)

(assert (=> d!132845 (= c!117826 (bvsge from!1455 (size!37998 lt!543861)))))

(assert (=> d!132845 (validMask!0 mask!1564)))

(assert (=> d!132845 (= (getCurrentListMapNoExtraKeys!5249 lt!543861 (array!77646 (store (arr!37462 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543899)))

(declare-fun b!1199404 () Bool)

(declare-fun e!681431 () Bool)

(declare-fun e!681429 () Bool)

(assert (=> b!1199404 (= e!681431 e!681429)))

(declare-fun c!117827 () Bool)

(assert (=> b!1199404 (= c!117827 (bvslt from!1455 (size!37998 lt!543861)))))

(declare-fun b!1199405 () Bool)

(declare-fun res!797877 () Bool)

(assert (=> b!1199405 (=> (not res!797877) (not e!681432))))

(assert (=> b!1199405 (= res!797877 (not (contains!6899 lt!543899 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1199406 () Bool)

(declare-fun isEmpty!983 (ListLongMap!17533) Bool)

(assert (=> b!1199406 (= e!681429 (isEmpty!983 lt!543899))))

(declare-fun b!1199407 () Bool)

(assert (=> b!1199407 (= e!681426 e!681427)))

(declare-fun c!117829 () Bool)

(assert (=> b!1199407 (= c!117829 (validKeyInArray!0 (select (arr!37461 lt!543861) from!1455)))))

(declare-fun b!1199408 () Bool)

(assert (=> b!1199408 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37998 lt!543861)))))

(assert (=> b!1199408 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37999 (array!77646 (store (arr!37462 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996)))))))

(declare-fun e!681428 () Bool)

(declare-fun apply!968 (ListLongMap!17533 (_ BitVec 64)) V!45681)

(declare-fun get!19170 (ValueCell!14498 V!45681) V!45681)

(assert (=> b!1199408 (= e!681428 (= (apply!968 lt!543899 (select (arr!37461 lt!543861) from!1455)) (get!19170 (select (arr!37462 (array!77646 (store (arr!37462 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996))) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!57340 () Bool)

(assert (=> bm!57340 (= call!57343 (getCurrentListMapNoExtraKeys!5249 lt!543861 (array!77646 (store (arr!37462 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1199409 () Bool)

(assert (=> b!1199409 (= e!681431 e!681428)))

(assert (=> b!1199409 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37998 lt!543861)))))

(declare-fun res!797875 () Bool)

(assert (=> b!1199409 (= res!797875 (contains!6899 lt!543899 (select (arr!37461 lt!543861) from!1455)))))

(assert (=> b!1199409 (=> (not res!797875) (not e!681428))))

(declare-fun b!1199410 () Bool)

(assert (=> b!1199410 (= e!681432 e!681431)))

(declare-fun c!117828 () Bool)

(declare-fun e!681430 () Bool)

(assert (=> b!1199410 (= c!117828 e!681430)))

(declare-fun res!797878 () Bool)

(assert (=> b!1199410 (=> (not res!797878) (not e!681430))))

(assert (=> b!1199410 (= res!797878 (bvslt from!1455 (size!37998 lt!543861)))))

(declare-fun b!1199411 () Bool)

(assert (=> b!1199411 (= e!681430 (validKeyInArray!0 (select (arr!37461 lt!543861) from!1455)))))

(assert (=> b!1199411 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1199412 () Bool)

(assert (=> b!1199412 (= e!681429 (= lt!543899 (getCurrentListMapNoExtraKeys!5249 lt!543861 (array!77646 (store (arr!37462 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1199413 () Bool)

(declare-fun lt!543898 () Unit!39689)

(declare-fun lt!543903 () Unit!39689)

(assert (=> b!1199413 (= lt!543898 lt!543903)))

(declare-fun lt!543901 () V!45681)

(declare-fun lt!543900 () (_ BitVec 64))

(declare-fun lt!543904 () ListLongMap!17533)

(declare-fun lt!543902 () (_ BitVec 64))

(declare-fun +!3997 (ListLongMap!17533 tuple2!19556) ListLongMap!17533)

(assert (=> b!1199413 (not (contains!6899 (+!3997 lt!543904 (tuple2!19557 lt!543902 lt!543901)) lt!543900))))

(declare-fun addStillNotContains!289 (ListLongMap!17533 (_ BitVec 64) V!45681 (_ BitVec 64)) Unit!39689)

(assert (=> b!1199413 (= lt!543903 (addStillNotContains!289 lt!543904 lt!543902 lt!543901 lt!543900))))

(assert (=> b!1199413 (= lt!543900 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1199413 (= lt!543901 (get!19170 (select (arr!37462 (array!77646 (store (arr!37462 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996))) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1199413 (= lt!543902 (select (arr!37461 lt!543861) from!1455))))

(assert (=> b!1199413 (= lt!543904 call!57343)))

(assert (=> b!1199413 (= e!681427 (+!3997 call!57343 (tuple2!19557 (select (arr!37461 lt!543861) from!1455) (get!19170 (select (arr!37462 (array!77646 (store (arr!37462 _values!996) i!673 (ValueCellFull!14498 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996))) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132845 c!117826) b!1199403))

(assert (= (and d!132845 (not c!117826)) b!1199407))

(assert (= (and b!1199407 c!117829) b!1199413))

(assert (= (and b!1199407 (not c!117829)) b!1199402))

(assert (= (or b!1199413 b!1199402) bm!57340))

(assert (= (and d!132845 res!797876) b!1199405))

(assert (= (and b!1199405 res!797877) b!1199410))

(assert (= (and b!1199410 res!797878) b!1199411))

(assert (= (and b!1199410 c!117828) b!1199409))

(assert (= (and b!1199410 (not c!117828)) b!1199404))

(assert (= (and b!1199409 res!797875) b!1199408))

(assert (= (and b!1199404 c!117827) b!1199412))

(assert (= (and b!1199404 (not c!117827)) b!1199406))

(declare-fun b_lambda!20903 () Bool)

(assert (=> (not b_lambda!20903) (not b!1199408)))

(assert (=> b!1199408 t!39060))

(declare-fun b_and!42327 () Bool)

(assert (= b_and!42317 (and (=> t!39060 result!21613) b_and!42327)))

(declare-fun b_lambda!20905 () Bool)

(assert (=> (not b_lambda!20905) (not b!1199413)))

(assert (=> b!1199413 t!39060))

(declare-fun b_and!42329 () Bool)

(assert (= b_and!42327 (and (=> t!39060 result!21613) b_and!42329)))

(declare-fun m!1106531 () Bool)

(assert (=> d!132845 m!1106531))

(assert (=> d!132845 m!1106439))

(declare-fun m!1106533 () Bool)

(assert (=> b!1199405 m!1106533))

(declare-fun m!1106535 () Bool)

(assert (=> b!1199413 m!1106535))

(assert (=> b!1199413 m!1106417))

(declare-fun m!1106537 () Bool)

(assert (=> b!1199413 m!1106537))

(declare-fun m!1106539 () Bool)

(assert (=> b!1199413 m!1106539))

(assert (=> b!1199413 m!1106417))

(declare-fun m!1106541 () Bool)

(assert (=> b!1199413 m!1106541))

(assert (=> b!1199413 m!1106535))

(declare-fun m!1106543 () Bool)

(assert (=> b!1199413 m!1106543))

(declare-fun m!1106545 () Bool)

(assert (=> b!1199413 m!1106545))

(assert (=> b!1199413 m!1106543))

(declare-fun m!1106547 () Bool)

(assert (=> b!1199413 m!1106547))

(assert (=> b!1199411 m!1106541))

(assert (=> b!1199411 m!1106541))

(declare-fun m!1106549 () Bool)

(assert (=> b!1199411 m!1106549))

(declare-fun m!1106551 () Bool)

(assert (=> bm!57340 m!1106551))

(assert (=> b!1199409 m!1106541))

(assert (=> b!1199409 m!1106541))

(declare-fun m!1106553 () Bool)

(assert (=> b!1199409 m!1106553))

(assert (=> b!1199407 m!1106541))

(assert (=> b!1199407 m!1106541))

(assert (=> b!1199407 m!1106549))

(declare-fun m!1106555 () Bool)

(assert (=> b!1199406 m!1106555))

(assert (=> b!1199408 m!1106535))

(assert (=> b!1199408 m!1106417))

(assert (=> b!1199408 m!1106537))

(assert (=> b!1199408 m!1106417))

(assert (=> b!1199408 m!1106535))

(assert (=> b!1199408 m!1106541))

(declare-fun m!1106557 () Bool)

(assert (=> b!1199408 m!1106557))

(assert (=> b!1199408 m!1106541))

(assert (=> b!1199412 m!1106551))

(assert (=> b!1199257 d!132845))

(declare-fun b!1199414 () Bool)

(declare-fun e!681434 () ListLongMap!17533)

(declare-fun call!57344 () ListLongMap!17533)

(assert (=> b!1199414 (= e!681434 call!57344)))

(declare-fun b!1199415 () Bool)

(declare-fun e!681433 () ListLongMap!17533)

(assert (=> b!1199415 (= e!681433 (ListLongMap!17534 Nil!26364))))

(declare-fun d!132847 () Bool)

(declare-fun e!681439 () Bool)

(assert (=> d!132847 e!681439))

(declare-fun res!797880 () Bool)

(assert (=> d!132847 (=> (not res!797880) (not e!681439))))

(declare-fun lt!543906 () ListLongMap!17533)

(assert (=> d!132847 (= res!797880 (not (contains!6899 lt!543906 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132847 (= lt!543906 e!681433)))

(declare-fun c!117830 () Bool)

(assert (=> d!132847 (= c!117830 (bvsge from!1455 (size!37998 _keys!1208)))))

(assert (=> d!132847 (validMask!0 mask!1564)))

(assert (=> d!132847 (= (getCurrentListMapNoExtraKeys!5249 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543906)))

(declare-fun b!1199416 () Bool)

(declare-fun e!681438 () Bool)

(declare-fun e!681436 () Bool)

(assert (=> b!1199416 (= e!681438 e!681436)))

(declare-fun c!117831 () Bool)

(assert (=> b!1199416 (= c!117831 (bvslt from!1455 (size!37998 _keys!1208)))))

(declare-fun b!1199417 () Bool)

(declare-fun res!797881 () Bool)

(assert (=> b!1199417 (=> (not res!797881) (not e!681439))))

(assert (=> b!1199417 (= res!797881 (not (contains!6899 lt!543906 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1199418 () Bool)

(assert (=> b!1199418 (= e!681436 (isEmpty!983 lt!543906))))

(declare-fun b!1199419 () Bool)

(assert (=> b!1199419 (= e!681433 e!681434)))

(declare-fun c!117833 () Bool)

(assert (=> b!1199419 (= c!117833 (validKeyInArray!0 (select (arr!37461 _keys!1208) from!1455)))))

(declare-fun b!1199420 () Bool)

(assert (=> b!1199420 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37998 _keys!1208)))))

(assert (=> b!1199420 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37999 _values!996)))))

(declare-fun e!681435 () Bool)

(assert (=> b!1199420 (= e!681435 (= (apply!968 lt!543906 (select (arr!37461 _keys!1208) from!1455)) (get!19170 (select (arr!37462 _values!996) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!57341 () Bool)

(assert (=> bm!57341 (= call!57344 (getCurrentListMapNoExtraKeys!5249 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1199421 () Bool)

(assert (=> b!1199421 (= e!681438 e!681435)))

(assert (=> b!1199421 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37998 _keys!1208)))))

(declare-fun res!797879 () Bool)

(assert (=> b!1199421 (= res!797879 (contains!6899 lt!543906 (select (arr!37461 _keys!1208) from!1455)))))

(assert (=> b!1199421 (=> (not res!797879) (not e!681435))))

(declare-fun b!1199422 () Bool)

(assert (=> b!1199422 (= e!681439 e!681438)))

(declare-fun c!117832 () Bool)

(declare-fun e!681437 () Bool)

(assert (=> b!1199422 (= c!117832 e!681437)))

(declare-fun res!797882 () Bool)

(assert (=> b!1199422 (=> (not res!797882) (not e!681437))))

(assert (=> b!1199422 (= res!797882 (bvslt from!1455 (size!37998 _keys!1208)))))

(declare-fun b!1199423 () Bool)

(assert (=> b!1199423 (= e!681437 (validKeyInArray!0 (select (arr!37461 _keys!1208) from!1455)))))

(assert (=> b!1199423 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1199424 () Bool)

(assert (=> b!1199424 (= e!681436 (= lt!543906 (getCurrentListMapNoExtraKeys!5249 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1199425 () Bool)

(declare-fun lt!543905 () Unit!39689)

(declare-fun lt!543910 () Unit!39689)

(assert (=> b!1199425 (= lt!543905 lt!543910)))

(declare-fun lt!543909 () (_ BitVec 64))

(declare-fun lt!543907 () (_ BitVec 64))

(declare-fun lt!543908 () V!45681)

(declare-fun lt!543911 () ListLongMap!17533)

(assert (=> b!1199425 (not (contains!6899 (+!3997 lt!543911 (tuple2!19557 lt!543909 lt!543908)) lt!543907))))

(assert (=> b!1199425 (= lt!543910 (addStillNotContains!289 lt!543911 lt!543909 lt!543908 lt!543907))))

(assert (=> b!1199425 (= lt!543907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1199425 (= lt!543908 (get!19170 (select (arr!37462 _values!996) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1199425 (= lt!543909 (select (arr!37461 _keys!1208) from!1455))))

(assert (=> b!1199425 (= lt!543911 call!57344)))

(assert (=> b!1199425 (= e!681434 (+!3997 call!57344 (tuple2!19557 (select (arr!37461 _keys!1208) from!1455) (get!19170 (select (arr!37462 _values!996) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132847 c!117830) b!1199415))

(assert (= (and d!132847 (not c!117830)) b!1199419))

(assert (= (and b!1199419 c!117833) b!1199425))

(assert (= (and b!1199419 (not c!117833)) b!1199414))

(assert (= (or b!1199425 b!1199414) bm!57341))

(assert (= (and d!132847 res!797880) b!1199417))

(assert (= (and b!1199417 res!797881) b!1199422))

(assert (= (and b!1199422 res!797882) b!1199423))

(assert (= (and b!1199422 c!117832) b!1199421))

(assert (= (and b!1199422 (not c!117832)) b!1199416))

(assert (= (and b!1199421 res!797879) b!1199420))

(assert (= (and b!1199416 c!117831) b!1199424))

(assert (= (and b!1199416 (not c!117831)) b!1199418))

(declare-fun b_lambda!20907 () Bool)

(assert (=> (not b_lambda!20907) (not b!1199420)))

(assert (=> b!1199420 t!39060))

(declare-fun b_and!42331 () Bool)

(assert (= b_and!42329 (and (=> t!39060 result!21613) b_and!42331)))

(declare-fun b_lambda!20909 () Bool)

(assert (=> (not b_lambda!20909) (not b!1199425)))

(assert (=> b!1199425 t!39060))

(declare-fun b_and!42333 () Bool)

(assert (= b_and!42331 (and (=> t!39060 result!21613) b_and!42333)))

(declare-fun m!1106559 () Bool)

(assert (=> d!132847 m!1106559))

(assert (=> d!132847 m!1106439))

(declare-fun m!1106561 () Bool)

(assert (=> b!1199417 m!1106561))

(declare-fun m!1106563 () Bool)

(assert (=> b!1199425 m!1106563))

(assert (=> b!1199425 m!1106417))

(declare-fun m!1106565 () Bool)

(assert (=> b!1199425 m!1106565))

(declare-fun m!1106567 () Bool)

(assert (=> b!1199425 m!1106567))

(assert (=> b!1199425 m!1106417))

(declare-fun m!1106569 () Bool)

(assert (=> b!1199425 m!1106569))

(assert (=> b!1199425 m!1106563))

(declare-fun m!1106571 () Bool)

(assert (=> b!1199425 m!1106571))

(declare-fun m!1106573 () Bool)

(assert (=> b!1199425 m!1106573))

(assert (=> b!1199425 m!1106571))

(declare-fun m!1106575 () Bool)

(assert (=> b!1199425 m!1106575))

(assert (=> b!1199423 m!1106569))

(assert (=> b!1199423 m!1106569))

(declare-fun m!1106577 () Bool)

(assert (=> b!1199423 m!1106577))

(declare-fun m!1106579 () Bool)

(assert (=> bm!57341 m!1106579))

(assert (=> b!1199421 m!1106569))

(assert (=> b!1199421 m!1106569))

(declare-fun m!1106581 () Bool)

(assert (=> b!1199421 m!1106581))

(assert (=> b!1199419 m!1106569))

(assert (=> b!1199419 m!1106569))

(assert (=> b!1199419 m!1106577))

(declare-fun m!1106583 () Bool)

(assert (=> b!1199418 m!1106583))

(assert (=> b!1199420 m!1106563))

(assert (=> b!1199420 m!1106417))

(assert (=> b!1199420 m!1106565))

(assert (=> b!1199420 m!1106417))

(assert (=> b!1199420 m!1106563))

(assert (=> b!1199420 m!1106569))

(declare-fun m!1106585 () Bool)

(assert (=> b!1199420 m!1106585))

(assert (=> b!1199420 m!1106569))

(assert (=> b!1199424 m!1106579))

(assert (=> b!1199257 d!132847))

(declare-fun b!1199426 () Bool)

(declare-fun e!681443 () Bool)

(declare-fun e!681441 () Bool)

(assert (=> b!1199426 (= e!681443 e!681441)))

(declare-fun c!117834 () Bool)

(assert (=> b!1199426 (= c!117834 (validKeyInArray!0 (select (arr!37461 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1199427 () Bool)

(declare-fun call!57345 () Bool)

(assert (=> b!1199427 (= e!681441 call!57345)))

(declare-fun b!1199429 () Bool)

(declare-fun e!681442 () Bool)

(assert (=> b!1199429 (= e!681442 (contains!6898 Nil!26363 (select (arr!37461 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1199430 () Bool)

(declare-fun e!681440 () Bool)

(assert (=> b!1199430 (= e!681440 e!681443)))

(declare-fun res!797884 () Bool)

(assert (=> b!1199430 (=> (not res!797884) (not e!681443))))

(assert (=> b!1199430 (= res!797884 (not e!681442))))

(declare-fun res!797883 () Bool)

(assert (=> b!1199430 (=> (not res!797883) (not e!681442))))

(assert (=> b!1199430 (= res!797883 (validKeyInArray!0 (select (arr!37461 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57342 () Bool)

(assert (=> bm!57342 (= call!57345 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117834 (Cons!26362 (select (arr!37461 _keys!1208) #b00000000000000000000000000000000) Nil!26363) Nil!26363)))))

(declare-fun d!132849 () Bool)

(declare-fun res!797885 () Bool)

(assert (=> d!132849 (=> res!797885 e!681440)))

(assert (=> d!132849 (= res!797885 (bvsge #b00000000000000000000000000000000 (size!37998 _keys!1208)))))

(assert (=> d!132849 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26363) e!681440)))

(declare-fun b!1199428 () Bool)

(assert (=> b!1199428 (= e!681441 call!57345)))

(assert (= (and d!132849 (not res!797885)) b!1199430))

(assert (= (and b!1199430 res!797883) b!1199429))

(assert (= (and b!1199430 res!797884) b!1199426))

(assert (= (and b!1199426 c!117834) b!1199427))

(assert (= (and b!1199426 (not c!117834)) b!1199428))

(assert (= (or b!1199427 b!1199428) bm!57342))

(declare-fun m!1106587 () Bool)

(assert (=> b!1199426 m!1106587))

(assert (=> b!1199426 m!1106587))

(declare-fun m!1106589 () Bool)

(assert (=> b!1199426 m!1106589))

(assert (=> b!1199429 m!1106587))

(assert (=> b!1199429 m!1106587))

(declare-fun m!1106591 () Bool)

(assert (=> b!1199429 m!1106591))

(assert (=> b!1199430 m!1106587))

(assert (=> b!1199430 m!1106587))

(assert (=> b!1199430 m!1106589))

(assert (=> bm!57342 m!1106587))

(declare-fun m!1106593 () Bool)

(assert (=> bm!57342 m!1106593))

(assert (=> b!1199256 d!132849))

(declare-fun d!132851 () Bool)

(assert (=> d!132851 (= (array_inv!28622 _keys!1208) (bvsge (size!37998 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100606 d!132851))

(declare-fun d!132853 () Bool)

(assert (=> d!132853 (= (array_inv!28623 _values!996) (bvsge (size!37999 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100606 d!132853))

(declare-fun b!1199431 () Bool)

(declare-fun e!681444 () Bool)

(declare-fun call!57346 () Bool)

(assert (=> b!1199431 (= e!681444 call!57346)))

(declare-fun bm!57343 () Bool)

(assert (=> bm!57343 (= call!57346 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1199432 () Bool)

(declare-fun e!681446 () Bool)

(declare-fun e!681445 () Bool)

(assert (=> b!1199432 (= e!681446 e!681445)))

(declare-fun c!117835 () Bool)

(assert (=> b!1199432 (= c!117835 (validKeyInArray!0 (select (arr!37461 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132855 () Bool)

(declare-fun res!797887 () Bool)

(assert (=> d!132855 (=> res!797887 e!681446)))

(assert (=> d!132855 (= res!797887 (bvsge #b00000000000000000000000000000000 (size!37998 _keys!1208)))))

(assert (=> d!132855 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!681446)))

(declare-fun b!1199433 () Bool)

(assert (=> b!1199433 (= e!681445 call!57346)))

(declare-fun b!1199434 () Bool)

(assert (=> b!1199434 (= e!681445 e!681444)))

(declare-fun lt!543912 () (_ BitVec 64))

(assert (=> b!1199434 (= lt!543912 (select (arr!37461 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!543913 () Unit!39689)

(assert (=> b!1199434 (= lt!543913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543912 #b00000000000000000000000000000000))))

(assert (=> b!1199434 (arrayContainsKey!0 _keys!1208 lt!543912 #b00000000000000000000000000000000)))

(declare-fun lt!543914 () Unit!39689)

(assert (=> b!1199434 (= lt!543914 lt!543913)))

(declare-fun res!797886 () Bool)

(assert (=> b!1199434 (= res!797886 (= (seekEntryOrOpen!0 (select (arr!37461 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9888 #b00000000000000000000000000000000)))))

(assert (=> b!1199434 (=> (not res!797886) (not e!681444))))

(assert (= (and d!132855 (not res!797887)) b!1199432))

(assert (= (and b!1199432 c!117835) b!1199434))

(assert (= (and b!1199432 (not c!117835)) b!1199433))

(assert (= (and b!1199434 res!797886) b!1199431))

(assert (= (or b!1199431 b!1199433) bm!57343))

(declare-fun m!1106595 () Bool)

(assert (=> bm!57343 m!1106595))

(assert (=> b!1199432 m!1106587))

(assert (=> b!1199432 m!1106587))

(assert (=> b!1199432 m!1106589))

(assert (=> b!1199434 m!1106587))

(declare-fun m!1106597 () Bool)

(assert (=> b!1199434 m!1106597))

(declare-fun m!1106599 () Bool)

(assert (=> b!1199434 m!1106599))

(assert (=> b!1199434 m!1106587))

(declare-fun m!1106601 () Bool)

(assert (=> b!1199434 m!1106601))

(assert (=> b!1199255 d!132855))

(declare-fun d!132857 () Bool)

(declare-fun res!797892 () Bool)

(declare-fun e!681451 () Bool)

(assert (=> d!132857 (=> res!797892 e!681451)))

(assert (=> d!132857 (= res!797892 (= (select (arr!37461 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132857 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!681451)))

(declare-fun b!1199439 () Bool)

(declare-fun e!681452 () Bool)

(assert (=> b!1199439 (= e!681451 e!681452)))

(declare-fun res!797893 () Bool)

(assert (=> b!1199439 (=> (not res!797893) (not e!681452))))

(assert (=> b!1199439 (= res!797893 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37998 _keys!1208)))))

(declare-fun b!1199440 () Bool)

(assert (=> b!1199440 (= e!681452 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132857 (not res!797892)) b!1199439))

(assert (= (and b!1199439 res!797893) b!1199440))

(assert (=> d!132857 m!1106587))

(declare-fun m!1106603 () Bool)

(assert (=> b!1199440 m!1106603))

(assert (=> b!1199250 d!132857))

(declare-fun d!132859 () Bool)

(assert (=> d!132859 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543917 () Unit!39689)

(declare-fun choose!13 (array!77643 (_ BitVec 64) (_ BitVec 32)) Unit!39689)

(assert (=> d!132859 (= lt!543917 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132859 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132859 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!543917)))

(declare-fun bs!33982 () Bool)

(assert (= bs!33982 d!132859))

(assert (=> bs!33982 m!1106431))

(declare-fun m!1106605 () Bool)

(assert (=> bs!33982 m!1106605))

(assert (=> b!1199250 d!132859))

(declare-fun d!132861 () Bool)

(assert (=> d!132861 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1199259 d!132861))

(declare-fun mapIsEmpty!47471 () Bool)

(declare-fun mapRes!47471 () Bool)

(assert (=> mapIsEmpty!47471 mapRes!47471))

(declare-fun b!1199448 () Bool)

(declare-fun e!681458 () Bool)

(assert (=> b!1199448 (= e!681458 tp_is_empty!30415)))

(declare-fun mapNonEmpty!47471 () Bool)

(declare-fun tp!90135 () Bool)

(declare-fun e!681457 () Bool)

(assert (=> mapNonEmpty!47471 (= mapRes!47471 (and tp!90135 e!681457))))

(declare-fun mapValue!47471 () ValueCell!14498)

(declare-fun mapKey!47471 () (_ BitVec 32))

(declare-fun mapRest!47471 () (Array (_ BitVec 32) ValueCell!14498))

(assert (=> mapNonEmpty!47471 (= mapRest!47462 (store mapRest!47471 mapKey!47471 mapValue!47471))))

(declare-fun condMapEmpty!47471 () Bool)

(declare-fun mapDefault!47471 () ValueCell!14498)

(assert (=> mapNonEmpty!47462 (= condMapEmpty!47471 (= mapRest!47462 ((as const (Array (_ BitVec 32) ValueCell!14498)) mapDefault!47471)))))

(assert (=> mapNonEmpty!47462 (= tp!90119 (and e!681458 mapRes!47471))))

(declare-fun b!1199447 () Bool)

(assert (=> b!1199447 (= e!681457 tp_is_empty!30415)))

(assert (= (and mapNonEmpty!47462 condMapEmpty!47471) mapIsEmpty!47471))

(assert (= (and mapNonEmpty!47462 (not condMapEmpty!47471)) mapNonEmpty!47471))

(assert (= (and mapNonEmpty!47471 ((_ is ValueCellFull!14498) mapValue!47471)) b!1199447))

(assert (= (and mapNonEmpty!47462 ((_ is ValueCellFull!14498) mapDefault!47471)) b!1199448))

(declare-fun m!1106607 () Bool)

(assert (=> mapNonEmpty!47471 m!1106607))

(declare-fun b_lambda!20911 () Bool)

(assert (= b_lambda!20907 (or (and start!100606 b_free!25711) b_lambda!20911)))

(declare-fun b_lambda!20913 () Bool)

(assert (= b_lambda!20903 (or (and start!100606 b_free!25711) b_lambda!20913)))

(declare-fun b_lambda!20915 () Bool)

(assert (= b_lambda!20909 (or (and start!100606 b_free!25711) b_lambda!20915)))

(declare-fun b_lambda!20917 () Bool)

(assert (= b_lambda!20905 (or (and start!100606 b_free!25711) b_lambda!20917)))

(check-sat (not d!132847) (not b!1199405) (not b!1199406) (not b!1199418) (not b_lambda!20915) (not bm!57340) (not b!1199440) (not b!1199376) b_and!42333 (not b_next!25711) (not b!1199420) (not bm!57337) (not b!1199425) (not b_lambda!20901) (not b!1199423) (not b!1199377) (not b!1199424) (not b!1199412) (not b!1199419) (not bm!57341) tp_is_empty!30415 (not b!1199362) (not b!1199417) (not mapNonEmpty!47471) (not b!1199426) (not b!1199409) (not b!1199408) (not b!1199432) (not b!1199429) (not b!1199407) (not bm!57343) (not b!1199413) (not d!132845) (not bm!57334) (not b!1199434) (not b_lambda!20911) (not b!1199430) (not d!132859) (not b!1199411) (not b!1199360) (not b!1199373) (not b!1199421) (not b_lambda!20917) (not b_lambda!20913) (not bm!57342))
(check-sat b_and!42333 (not b_next!25711))
