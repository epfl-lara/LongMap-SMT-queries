; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83730 () Bool)

(assert start!83730)

(declare-fun b_free!19549 () Bool)

(declare-fun b_next!19549 () Bool)

(assert (=> start!83730 (= b_free!19549 (not b_next!19549))))

(declare-fun tp!67936 () Bool)

(declare-fun b_and!31197 () Bool)

(assert (=> start!83730 (= tp!67936 b_and!31197)))

(declare-fun res!654063 () Bool)

(declare-fun e!550899 () Bool)

(assert (=> start!83730 (=> (not res!654063) (not e!550899))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83730 (= res!654063 (validMask!0 mask!2147))))

(assert (=> start!83730 e!550899))

(assert (=> start!83730 true))

(declare-datatypes ((V!34921 0))(
  ( (V!34922 (val!11277 Int)) )
))
(declare-datatypes ((ValueCell!10745 0))(
  ( (ValueCellFull!10745 (v!13833 V!34921)) (EmptyCell!10745) )
))
(declare-datatypes ((array!60972 0))(
  ( (array!60973 (arr!29345 (Array (_ BitVec 32) ValueCell!10745)) (size!29825 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60972)

(declare-fun e!550900 () Bool)

(declare-fun array_inv!22745 (array!60972) Bool)

(assert (=> start!83730 (and (array_inv!22745 _values!1425) e!550900)))

(declare-fun tp_is_empty!22453 () Bool)

(assert (=> start!83730 tp_is_empty!22453))

(assert (=> start!83730 tp!67936))

(declare-datatypes ((array!60974 0))(
  ( (array!60975 (arr!29346 (Array (_ BitVec 32) (_ BitVec 64))) (size!29826 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60974)

(declare-fun array_inv!22746 (array!60974) Bool)

(assert (=> start!83730 (array_inv!22746 _keys!1717)))

(declare-fun b!977400 () Bool)

(declare-fun e!550896 () Bool)

(declare-fun mapRes!35689 () Bool)

(assert (=> b!977400 (= e!550900 (and e!550896 mapRes!35689))))

(declare-fun condMapEmpty!35689 () Bool)

(declare-fun mapDefault!35689 () ValueCell!10745)

(assert (=> b!977400 (= condMapEmpty!35689 (= (arr!29345 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10745)) mapDefault!35689)))))

(declare-fun b!977401 () Bool)

(declare-fun e!550897 () Bool)

(assert (=> b!977401 (= e!550899 e!550897)))

(declare-fun res!654067 () Bool)

(assert (=> b!977401 (=> (not res!654067) (not e!550897))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977401 (= res!654067 (not (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun zeroValue!1367 () V!34921)

(declare-datatypes ((tuple2!14518 0))(
  ( (tuple2!14519 (_1!7270 (_ BitVec 64)) (_2!7270 V!34921)) )
))
(declare-datatypes ((List!20360 0))(
  ( (Nil!20357) (Cons!20356 (h!21524 tuple2!14518) (t!28865 List!20360)) )
))
(declare-datatypes ((ListLongMap!13217 0))(
  ( (ListLongMap!13218 (toList!6624 List!20360)) )
))
(declare-fun lt!433500 () ListLongMap!13217)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34921)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3857 (array!60974 array!60972 (_ BitVec 32) (_ BitVec 32) V!34921 V!34921 (_ BitVec 32) Int) ListLongMap!13217)

(assert (=> b!977401 (= lt!433500 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!977402 () Bool)

(declare-fun res!654064 () Bool)

(assert (=> b!977402 (=> (not res!654064) (not e!550899))))

(declare-datatypes ((List!20361 0))(
  ( (Nil!20358) (Cons!20357 (h!21525 (_ BitVec 64)) (t!28866 List!20361)) )
))
(declare-fun arrayNoDuplicates!0 (array!60974 (_ BitVec 32) List!20361) Bool)

(assert (=> b!977402 (= res!654064 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20358))))

(declare-fun b!977403 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5722 (ListLongMap!13217 (_ BitVec 64)) Bool)

(assert (=> b!977403 (= e!550897 (not (contains!5722 lt!433500 (select (arr!29346 _keys!1717) i!822))))))

(declare-fun b!977404 () Bool)

(assert (=> b!977404 (= e!550896 tp_is_empty!22453)))

(declare-fun b!977405 () Bool)

(declare-fun res!654062 () Bool)

(assert (=> b!977405 (=> (not res!654062) (not e!550899))))

(assert (=> b!977405 (= res!654062 (validKeyInArray!0 (select (arr!29346 _keys!1717) i!822)))))

(declare-fun b!977406 () Bool)

(declare-fun e!550895 () Bool)

(assert (=> b!977406 (= e!550895 tp_is_empty!22453)))

(declare-fun b!977407 () Bool)

(declare-fun res!654068 () Bool)

(assert (=> b!977407 (=> (not res!654068) (not e!550899))))

(assert (=> b!977407 (= res!654068 (and (= (size!29825 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29826 _keys!1717) (size!29825 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35689 () Bool)

(declare-fun tp!67935 () Bool)

(assert (=> mapNonEmpty!35689 (= mapRes!35689 (and tp!67935 e!550895))))

(declare-fun mapValue!35689 () ValueCell!10745)

(declare-fun mapRest!35689 () (Array (_ BitVec 32) ValueCell!10745))

(declare-fun mapKey!35689 () (_ BitVec 32))

(assert (=> mapNonEmpty!35689 (= (arr!29345 _values!1425) (store mapRest!35689 mapKey!35689 mapValue!35689))))

(declare-fun b!977408 () Bool)

(declare-fun res!654066 () Bool)

(assert (=> b!977408 (=> (not res!654066) (not e!550899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60974 (_ BitVec 32)) Bool)

(assert (=> b!977408 (= res!654066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!977409 () Bool)

(declare-fun res!654061 () Bool)

(assert (=> b!977409 (=> (not res!654061) (not e!550899))))

(assert (=> b!977409 (= res!654061 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29826 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29826 _keys!1717))))))

(declare-fun b!977410 () Bool)

(declare-fun res!654065 () Bool)

(assert (=> b!977410 (=> (not res!654065) (not e!550899))))

(assert (=> b!977410 (= res!654065 (contains!5722 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35689 () Bool)

(assert (=> mapIsEmpty!35689 mapRes!35689))

(assert (= (and start!83730 res!654063) b!977407))

(assert (= (and b!977407 res!654068) b!977408))

(assert (= (and b!977408 res!654066) b!977402))

(assert (= (and b!977402 res!654064) b!977409))

(assert (= (and b!977409 res!654061) b!977405))

(assert (= (and b!977405 res!654062) b!977410))

(assert (= (and b!977410 res!654065) b!977401))

(assert (= (and b!977401 res!654067) b!977403))

(assert (= (and b!977400 condMapEmpty!35689) mapIsEmpty!35689))

(assert (= (and b!977400 (not condMapEmpty!35689)) mapNonEmpty!35689))

(get-info :version)

(assert (= (and mapNonEmpty!35689 ((_ is ValueCellFull!10745) mapValue!35689)) b!977406))

(assert (= (and b!977400 ((_ is ValueCellFull!10745) mapDefault!35689)) b!977404))

(assert (= start!83730 b!977400))

(declare-fun m!905027 () Bool)

(assert (=> b!977403 m!905027))

(assert (=> b!977403 m!905027))

(declare-fun m!905029 () Bool)

(assert (=> b!977403 m!905029))

(declare-fun m!905031 () Bool)

(assert (=> b!977401 m!905031))

(assert (=> b!977401 m!905031))

(declare-fun m!905033 () Bool)

(assert (=> b!977401 m!905033))

(declare-fun m!905035 () Bool)

(assert (=> b!977401 m!905035))

(declare-fun m!905037 () Bool)

(assert (=> mapNonEmpty!35689 m!905037))

(declare-fun m!905039 () Bool)

(assert (=> b!977410 m!905039))

(assert (=> b!977410 m!905027))

(assert (=> b!977410 m!905039))

(assert (=> b!977410 m!905027))

(declare-fun m!905041 () Bool)

(assert (=> b!977410 m!905041))

(assert (=> b!977405 m!905027))

(assert (=> b!977405 m!905027))

(declare-fun m!905043 () Bool)

(assert (=> b!977405 m!905043))

(declare-fun m!905045 () Bool)

(assert (=> b!977408 m!905045))

(declare-fun m!905047 () Bool)

(assert (=> start!83730 m!905047))

(declare-fun m!905049 () Bool)

(assert (=> start!83730 m!905049))

(declare-fun m!905051 () Bool)

(assert (=> start!83730 m!905051))

(declare-fun m!905053 () Bool)

(assert (=> b!977402 m!905053))

(check-sat (not b!977410) (not b!977401) (not start!83730) (not b!977403) (not b!977402) b_and!31197 (not b!977408) (not b_next!19549) (not b!977405) tp_is_empty!22453 (not mapNonEmpty!35689))
(check-sat b_and!31197 (not b_next!19549))
(get-model)

(declare-fun d!116781 () Bool)

(assert (=> d!116781 (= (validKeyInArray!0 (select (arr!29346 _keys!1717) i!822)) (and (not (= (select (arr!29346 _keys!1717) i!822) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29346 _keys!1717) i!822) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!977405 d!116781))

(declare-fun b!977485 () Bool)

(declare-fun e!550945 () Bool)

(declare-fun e!550944 () Bool)

(assert (=> b!977485 (= e!550945 e!550944)))

(declare-fun lt!433515 () (_ BitVec 64))

(assert (=> b!977485 (= lt!433515 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32444 0))(
  ( (Unit!32445) )
))
(declare-fun lt!433514 () Unit!32444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60974 (_ BitVec 64) (_ BitVec 32)) Unit!32444)

(assert (=> b!977485 (= lt!433514 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!433515 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!977485 (arrayContainsKey!0 _keys!1717 lt!433515 #b00000000000000000000000000000000)))

(declare-fun lt!433513 () Unit!32444)

(assert (=> b!977485 (= lt!433513 lt!433514)))

(declare-fun res!654121 () Bool)

(declare-datatypes ((SeekEntryResult!9156 0))(
  ( (MissingZero!9156 (index!38995 (_ BitVec 32))) (Found!9156 (index!38996 (_ BitVec 32))) (Intermediate!9156 (undefined!9968 Bool) (index!38997 (_ BitVec 32)) (x!84468 (_ BitVec 32))) (Undefined!9156) (MissingVacant!9156 (index!38998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60974 (_ BitVec 32)) SeekEntryResult!9156)

(assert (=> b!977485 (= res!654121 (= (seekEntryOrOpen!0 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9156 #b00000000000000000000000000000000)))))

(assert (=> b!977485 (=> (not res!654121) (not e!550944))))

(declare-fun b!977486 () Bool)

(declare-fun call!41789 () Bool)

(assert (=> b!977486 (= e!550944 call!41789)))

(declare-fun b!977487 () Bool)

(declare-fun e!550943 () Bool)

(assert (=> b!977487 (= e!550943 e!550945)))

(declare-fun c!100214 () Bool)

(assert (=> b!977487 (= c!100214 (validKeyInArray!0 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!977488 () Bool)

(assert (=> b!977488 (= e!550945 call!41789)))

(declare-fun bm!41786 () Bool)

(assert (=> bm!41786 (= call!41789 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116783 () Bool)

(declare-fun res!654122 () Bool)

(assert (=> d!116783 (=> res!654122 e!550943)))

(assert (=> d!116783 (= res!654122 (bvsge #b00000000000000000000000000000000 (size!29826 _keys!1717)))))

(assert (=> d!116783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!550943)))

(assert (= (and d!116783 (not res!654122)) b!977487))

(assert (= (and b!977487 c!100214) b!977485))

(assert (= (and b!977487 (not c!100214)) b!977488))

(assert (= (and b!977485 res!654121) b!977486))

(assert (= (or b!977486 b!977488) bm!41786))

(declare-fun m!905111 () Bool)

(assert (=> b!977485 m!905111))

(declare-fun m!905113 () Bool)

(assert (=> b!977485 m!905113))

(declare-fun m!905115 () Bool)

(assert (=> b!977485 m!905115))

(assert (=> b!977485 m!905111))

(declare-fun m!905117 () Bool)

(assert (=> b!977485 m!905117))

(assert (=> b!977487 m!905111))

(assert (=> b!977487 m!905111))

(declare-fun m!905119 () Bool)

(assert (=> b!977487 m!905119))

(declare-fun m!905121 () Bool)

(assert (=> bm!41786 m!905121))

(assert (=> b!977408 d!116783))

(declare-fun d!116785 () Bool)

(assert (=> d!116785 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83730 d!116785))

(declare-fun d!116787 () Bool)

(assert (=> d!116787 (= (array_inv!22745 _values!1425) (bvsge (size!29825 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83730 d!116787))

(declare-fun d!116789 () Bool)

(assert (=> d!116789 (= (array_inv!22746 _keys!1717) (bvsge (size!29826 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83730 d!116789))

(declare-fun d!116791 () Bool)

(declare-fun e!550951 () Bool)

(assert (=> d!116791 e!550951))

(declare-fun res!654125 () Bool)

(assert (=> d!116791 (=> res!654125 e!550951)))

(declare-fun lt!433527 () Bool)

(assert (=> d!116791 (= res!654125 (not lt!433527))))

(declare-fun lt!433525 () Bool)

(assert (=> d!116791 (= lt!433527 lt!433525)))

(declare-fun lt!433524 () Unit!32444)

(declare-fun e!550950 () Unit!32444)

(assert (=> d!116791 (= lt!433524 e!550950)))

(declare-fun c!100217 () Bool)

(assert (=> d!116791 (= c!100217 lt!433525)))

(declare-fun containsKey!478 (List!20360 (_ BitVec 64)) Bool)

(assert (=> d!116791 (= lt!433525 (containsKey!478 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)))))

(assert (=> d!116791 (= (contains!5722 lt!433500 (select (arr!29346 _keys!1717) i!822)) lt!433527)))

(declare-fun b!977495 () Bool)

(declare-fun lt!433526 () Unit!32444)

(assert (=> b!977495 (= e!550950 lt!433526)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!372 (List!20360 (_ BitVec 64)) Unit!32444)

(assert (=> b!977495 (= lt!433526 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)))))

(declare-datatypes ((Option!513 0))(
  ( (Some!512 (v!13836 V!34921)) (None!511) )
))
(declare-fun isDefined!380 (Option!513) Bool)

(declare-fun getValueByKey!507 (List!20360 (_ BitVec 64)) Option!513)

(assert (=> b!977495 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun b!977496 () Bool)

(declare-fun Unit!32446 () Unit!32444)

(assert (=> b!977496 (= e!550950 Unit!32446)))

(declare-fun b!977497 () Bool)

(assert (=> b!977497 (= e!550951 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822))))))

(assert (= (and d!116791 c!100217) b!977495))

(assert (= (and d!116791 (not c!100217)) b!977496))

(assert (= (and d!116791 (not res!654125)) b!977497))

(assert (=> d!116791 m!905027))

(declare-fun m!905123 () Bool)

(assert (=> d!116791 m!905123))

(assert (=> b!977495 m!905027))

(declare-fun m!905125 () Bool)

(assert (=> b!977495 m!905125))

(assert (=> b!977495 m!905027))

(declare-fun m!905127 () Bool)

(assert (=> b!977495 m!905127))

(assert (=> b!977495 m!905127))

(declare-fun m!905129 () Bool)

(assert (=> b!977495 m!905129))

(assert (=> b!977497 m!905027))

(assert (=> b!977497 m!905127))

(assert (=> b!977497 m!905127))

(assert (=> b!977497 m!905129))

(assert (=> b!977403 d!116791))

(declare-fun b!977508 () Bool)

(declare-fun e!550963 () Bool)

(declare-fun call!41792 () Bool)

(assert (=> b!977508 (= e!550963 call!41792)))

(declare-fun d!116793 () Bool)

(declare-fun res!654134 () Bool)

(declare-fun e!550960 () Bool)

(assert (=> d!116793 (=> res!654134 e!550960)))

(assert (=> d!116793 (= res!654134 (bvsge #b00000000000000000000000000000000 (size!29826 _keys!1717)))))

(assert (=> d!116793 (= (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20358) e!550960)))

(declare-fun b!977509 () Bool)

(assert (=> b!977509 (= e!550963 call!41792)))

(declare-fun b!977510 () Bool)

(declare-fun e!550961 () Bool)

(assert (=> b!977510 (= e!550960 e!550961)))

(declare-fun res!654133 () Bool)

(assert (=> b!977510 (=> (not res!654133) (not e!550961))))

(declare-fun e!550962 () Bool)

(assert (=> b!977510 (= res!654133 (not e!550962))))

(declare-fun res!654132 () Bool)

(assert (=> b!977510 (=> (not res!654132) (not e!550962))))

(assert (=> b!977510 (= res!654132 (validKeyInArray!0 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!977511 () Bool)

(assert (=> b!977511 (= e!550961 e!550963)))

(declare-fun c!100220 () Bool)

(assert (=> b!977511 (= c!100220 (validKeyInArray!0 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!977512 () Bool)

(declare-fun contains!5724 (List!20361 (_ BitVec 64)) Bool)

(assert (=> b!977512 (= e!550962 (contains!5724 Nil!20358 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun bm!41789 () Bool)

(assert (=> bm!41789 (= call!41792 (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100220 (Cons!20357 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) Nil!20358) Nil!20358)))))

(assert (= (and d!116793 (not res!654134)) b!977510))

(assert (= (and b!977510 res!654132) b!977512))

(assert (= (and b!977510 res!654133) b!977511))

(assert (= (and b!977511 c!100220) b!977509))

(assert (= (and b!977511 (not c!100220)) b!977508))

(assert (= (or b!977509 b!977508) bm!41789))

(assert (=> b!977510 m!905111))

(assert (=> b!977510 m!905111))

(assert (=> b!977510 m!905119))

(assert (=> b!977511 m!905111))

(assert (=> b!977511 m!905111))

(assert (=> b!977511 m!905119))

(assert (=> b!977512 m!905111))

(assert (=> b!977512 m!905111))

(declare-fun m!905131 () Bool)

(assert (=> b!977512 m!905131))

(assert (=> bm!41789 m!905111))

(declare-fun m!905133 () Bool)

(assert (=> bm!41789 m!905133))

(assert (=> b!977402 d!116793))

(declare-fun d!116795 () Bool)

(assert (=> d!116795 (= (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (and (not (= (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!977401 d!116795))

(declare-fun b!977555 () Bool)

(declare-fun e!550995 () ListLongMap!13217)

(declare-fun call!41810 () ListLongMap!13217)

(assert (=> b!977555 (= e!550995 call!41810)))

(declare-fun bm!41804 () Bool)

(declare-fun call!41807 () ListLongMap!13217)

(declare-fun call!41811 () ListLongMap!13217)

(assert (=> bm!41804 (= call!41807 call!41811)))

(declare-fun b!977556 () Bool)

(declare-fun e!550993 () ListLongMap!13217)

(declare-fun e!550998 () ListLongMap!13217)

(assert (=> b!977556 (= e!550993 e!550998)))

(declare-fun c!100234 () Bool)

(assert (=> b!977556 (= c!100234 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!116797 () Bool)

(declare-fun e!550990 () Bool)

(assert (=> d!116797 e!550990))

(declare-fun res!654158 () Bool)

(assert (=> d!116797 (=> (not res!654158) (not e!550990))))

(assert (=> d!116797 (= res!654158 (or (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)) (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))))

(declare-fun lt!433585 () ListLongMap!13217)

(declare-fun lt!433581 () ListLongMap!13217)

(assert (=> d!116797 (= lt!433585 lt!433581)))

(declare-fun lt!433591 () Unit!32444)

(declare-fun e!550992 () Unit!32444)

(assert (=> d!116797 (= lt!433591 e!550992)))

(declare-fun c!100237 () Bool)

(declare-fun e!551002 () Bool)

(assert (=> d!116797 (= c!100237 e!551002)))

(declare-fun res!654160 () Bool)

(assert (=> d!116797 (=> (not res!654160) (not e!551002))))

(assert (=> d!116797 (= res!654160 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(assert (=> d!116797 (= lt!433581 e!550993)))

(declare-fun c!100236 () Bool)

(assert (=> d!116797 (= c!100236 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116797 (validMask!0 mask!2147)))

(assert (=> d!116797 (= (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428) lt!433585)))

(declare-fun b!977557 () Bool)

(declare-fun e!550994 () Bool)

(declare-fun apply!899 (ListLongMap!13217 (_ BitVec 64)) V!34921)

(assert (=> b!977557 (= e!550994 (= (apply!899 lt!433585 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1367))))

(declare-fun b!977558 () Bool)

(declare-fun lt!433578 () Unit!32444)

(assert (=> b!977558 (= e!550992 lt!433578)))

(declare-fun lt!433572 () ListLongMap!13217)

(declare-fun getCurrentListMapNoExtraKeys!3373 (array!60974 array!60972 (_ BitVec 32) (_ BitVec 32) V!34921 V!34921 (_ BitVec 32) Int) ListLongMap!13217)

(assert (=> b!977558 (= lt!433572 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433583 () (_ BitVec 64))

(assert (=> b!977558 (= lt!433583 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433586 () (_ BitVec 64))

(assert (=> b!977558 (= lt!433586 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433587 () Unit!32444)

(declare-fun addStillContains!613 (ListLongMap!13217 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32444)

(assert (=> b!977558 (= lt!433587 (addStillContains!613 lt!433572 lt!433583 zeroValue!1367 lt!433586))))

(declare-fun +!2940 (ListLongMap!13217 tuple2!14518) ListLongMap!13217)

(assert (=> b!977558 (contains!5722 (+!2940 lt!433572 (tuple2!14519 lt!433583 zeroValue!1367)) lt!433586)))

(declare-fun lt!433582 () Unit!32444)

(assert (=> b!977558 (= lt!433582 lt!433587)))

(declare-fun lt!433574 () ListLongMap!13217)

(assert (=> b!977558 (= lt!433574 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433579 () (_ BitVec 64))

(assert (=> b!977558 (= lt!433579 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433592 () (_ BitVec 64))

(assert (=> b!977558 (= lt!433592 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433588 () Unit!32444)

(declare-fun addApplyDifferent!469 (ListLongMap!13217 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32444)

(assert (=> b!977558 (= lt!433588 (addApplyDifferent!469 lt!433574 lt!433579 minValue!1367 lt!433592))))

(assert (=> b!977558 (= (apply!899 (+!2940 lt!433574 (tuple2!14519 lt!433579 minValue!1367)) lt!433592) (apply!899 lt!433574 lt!433592))))

(declare-fun lt!433593 () Unit!32444)

(assert (=> b!977558 (= lt!433593 lt!433588)))

(declare-fun lt!433577 () ListLongMap!13217)

(assert (=> b!977558 (= lt!433577 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433576 () (_ BitVec 64))

(assert (=> b!977558 (= lt!433576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433589 () (_ BitVec 64))

(assert (=> b!977558 (= lt!433589 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433575 () Unit!32444)

(assert (=> b!977558 (= lt!433575 (addApplyDifferent!469 lt!433577 lt!433576 zeroValue!1367 lt!433589))))

(assert (=> b!977558 (= (apply!899 (+!2940 lt!433577 (tuple2!14519 lt!433576 zeroValue!1367)) lt!433589) (apply!899 lt!433577 lt!433589))))

(declare-fun lt!433573 () Unit!32444)

(assert (=> b!977558 (= lt!433573 lt!433575)))

(declare-fun lt!433584 () ListLongMap!13217)

(assert (=> b!977558 (= lt!433584 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433580 () (_ BitVec 64))

(assert (=> b!977558 (= lt!433580 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433590 () (_ BitVec 64))

(assert (=> b!977558 (= lt!433590 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!977558 (= lt!433578 (addApplyDifferent!469 lt!433584 lt!433580 minValue!1367 lt!433590))))

(assert (=> b!977558 (= (apply!899 (+!2940 lt!433584 (tuple2!14519 lt!433580 minValue!1367)) lt!433590) (apply!899 lt!433584 lt!433590))))

(declare-fun b!977559 () Bool)

(declare-fun e!550996 () Bool)

(declare-fun get!15217 (ValueCell!10745 V!34921) V!34921)

(declare-fun dynLambda!1737 (Int (_ BitVec 64)) V!34921)

(assert (=> b!977559 (= e!550996 (= (apply!899 lt!433585 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15217 (select (arr!29345 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!977559 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29825 _values!1425)))))

(assert (=> b!977559 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(declare-fun b!977560 () Bool)

(declare-fun c!100233 () Bool)

(assert (=> b!977560 (= c!100233 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!977560 (= e!550998 e!550995)))

(declare-fun b!977561 () Bool)

(declare-fun e!551000 () Bool)

(assert (=> b!977561 (= e!551000 (= (apply!899 lt!433585 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1367))))

(declare-fun b!977562 () Bool)

(declare-fun res!654157 () Bool)

(assert (=> b!977562 (=> (not res!654157) (not e!550990))))

(declare-fun e!550997 () Bool)

(assert (=> b!977562 (= res!654157 e!550997)))

(declare-fun res!654154 () Bool)

(assert (=> b!977562 (=> res!654154 e!550997)))

(declare-fun e!551001 () Bool)

(assert (=> b!977562 (= res!654154 (not e!551001))))

(declare-fun res!654153 () Bool)

(assert (=> b!977562 (=> (not res!654153) (not e!551001))))

(assert (=> b!977562 (= res!654153 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(declare-fun b!977563 () Bool)

(declare-fun e!550999 () Bool)

(assert (=> b!977563 (= e!550999 e!551000)))

(declare-fun res!654156 () Bool)

(declare-fun call!41809 () Bool)

(assert (=> b!977563 (= res!654156 call!41809)))

(assert (=> b!977563 (=> (not res!654156) (not e!551000))))

(declare-fun b!977564 () Bool)

(declare-fun Unit!32447 () Unit!32444)

(assert (=> b!977564 (= e!550992 Unit!32447)))

(declare-fun b!977565 () Bool)

(assert (=> b!977565 (= e!550999 (not call!41809))))

(declare-fun b!977566 () Bool)

(assert (=> b!977566 (= e!550995 call!41807)))

(declare-fun bm!41805 () Bool)

(declare-fun call!41813 () Bool)

(assert (=> bm!41805 (= call!41813 (contains!5722 lt!433585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977567 () Bool)

(assert (=> b!977567 (= e!551002 (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun bm!41806 () Bool)

(declare-fun call!41812 () ListLongMap!13217)

(assert (=> bm!41806 (= call!41810 call!41812)))

(declare-fun b!977568 () Bool)

(assert (=> b!977568 (= e!551001 (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!977569 () Bool)

(assert (=> b!977569 (= e!550993 (+!2940 call!41812 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(declare-fun b!977570 () Bool)

(declare-fun e!550991 () Bool)

(assert (=> b!977570 (= e!550991 (not call!41813))))

(declare-fun b!977571 () Bool)

(assert (=> b!977571 (= e!550997 e!550996)))

(declare-fun res!654155 () Bool)

(assert (=> b!977571 (=> (not res!654155) (not e!550996))))

(assert (=> b!977571 (= res!654155 (contains!5722 lt!433585 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!977571 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(declare-fun bm!41807 () Bool)

(declare-fun call!41808 () ListLongMap!13217)

(assert (=> bm!41807 (= call!41812 (+!2940 (ite c!100236 call!41808 (ite c!100234 call!41811 call!41807)) (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun bm!41808 () Bool)

(assert (=> bm!41808 (= call!41809 (contains!5722 lt!433585 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977572 () Bool)

(assert (=> b!977572 (= e!550998 call!41810)))

(declare-fun bm!41809 () Bool)

(assert (=> bm!41809 (= call!41808 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!977573 () Bool)

(declare-fun res!654161 () Bool)

(assert (=> b!977573 (=> (not res!654161) (not e!550990))))

(assert (=> b!977573 (= res!654161 e!550991)))

(declare-fun c!100235 () Bool)

(assert (=> b!977573 (= c!100235 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41810 () Bool)

(assert (=> bm!41810 (= call!41811 call!41808)))

(declare-fun b!977574 () Bool)

(assert (=> b!977574 (= e!550991 e!550994)))

(declare-fun res!654159 () Bool)

(assert (=> b!977574 (= res!654159 call!41813)))

(assert (=> b!977574 (=> (not res!654159) (not e!550994))))

(declare-fun b!977575 () Bool)

(assert (=> b!977575 (= e!550990 e!550999)))

(declare-fun c!100238 () Bool)

(assert (=> b!977575 (= c!100238 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!116797 c!100236) b!977569))

(assert (= (and d!116797 (not c!100236)) b!977556))

(assert (= (and b!977556 c!100234) b!977572))

(assert (= (and b!977556 (not c!100234)) b!977560))

(assert (= (and b!977560 c!100233) b!977555))

(assert (= (and b!977560 (not c!100233)) b!977566))

(assert (= (or b!977555 b!977566) bm!41804))

(assert (= (or b!977572 bm!41804) bm!41810))

(assert (= (or b!977572 b!977555) bm!41806))

(assert (= (or b!977569 bm!41810) bm!41809))

(assert (= (or b!977569 bm!41806) bm!41807))

(assert (= (and d!116797 res!654160) b!977567))

(assert (= (and d!116797 c!100237) b!977558))

(assert (= (and d!116797 (not c!100237)) b!977564))

(assert (= (and d!116797 res!654158) b!977562))

(assert (= (and b!977562 res!654153) b!977568))

(assert (= (and b!977562 (not res!654154)) b!977571))

(assert (= (and b!977571 res!654155) b!977559))

(assert (= (and b!977562 res!654157) b!977573))

(assert (= (and b!977573 c!100235) b!977574))

(assert (= (and b!977573 (not c!100235)) b!977570))

(assert (= (and b!977574 res!654159) b!977557))

(assert (= (or b!977574 b!977570) bm!41805))

(assert (= (and b!977573 res!654161) b!977575))

(assert (= (and b!977575 c!100238) b!977563))

(assert (= (and b!977575 (not c!100238)) b!977565))

(assert (= (and b!977563 res!654156) b!977561))

(assert (= (or b!977563 b!977565) bm!41808))

(declare-fun b_lambda!14595 () Bool)

(assert (=> (not b_lambda!14595) (not b!977559)))

(declare-fun t!28870 () Bool)

(declare-fun tb!6357 () Bool)

(assert (=> (and start!83730 (= defaultEntry!1428 defaultEntry!1428) t!28870) tb!6357))

(declare-fun result!12699 () Bool)

(assert (=> tb!6357 (= result!12699 tp_is_empty!22453)))

(assert (=> b!977559 t!28870))

(declare-fun b_and!31203 () Bool)

(assert (= b_and!31197 (and (=> t!28870 result!12699) b_and!31203)))

(declare-fun m!905135 () Bool)

(assert (=> b!977557 m!905135))

(assert (=> b!977568 m!905031))

(assert (=> b!977568 m!905031))

(assert (=> b!977568 m!905033))

(declare-fun m!905137 () Bool)

(assert (=> bm!41805 m!905137))

(assert (=> d!116797 m!905047))

(assert (=> b!977558 m!905031))

(declare-fun m!905139 () Bool)

(assert (=> b!977558 m!905139))

(declare-fun m!905141 () Bool)

(assert (=> b!977558 m!905141))

(declare-fun m!905143 () Bool)

(assert (=> b!977558 m!905143))

(declare-fun m!905145 () Bool)

(assert (=> b!977558 m!905145))

(declare-fun m!905147 () Bool)

(assert (=> b!977558 m!905147))

(declare-fun m!905149 () Bool)

(assert (=> b!977558 m!905149))

(declare-fun m!905151 () Bool)

(assert (=> b!977558 m!905151))

(declare-fun m!905153 () Bool)

(assert (=> b!977558 m!905153))

(declare-fun m!905155 () Bool)

(assert (=> b!977558 m!905155))

(declare-fun m!905157 () Bool)

(assert (=> b!977558 m!905157))

(assert (=> b!977558 m!905149))

(declare-fun m!905159 () Bool)

(assert (=> b!977558 m!905159))

(assert (=> b!977558 m!905155))

(declare-fun m!905161 () Bool)

(assert (=> b!977558 m!905161))

(declare-fun m!905163 () Bool)

(assert (=> b!977558 m!905163))

(declare-fun m!905165 () Bool)

(assert (=> b!977558 m!905165))

(declare-fun m!905167 () Bool)

(assert (=> b!977558 m!905167))

(assert (=> b!977558 m!905153))

(declare-fun m!905169 () Bool)

(assert (=> b!977558 m!905169))

(assert (=> b!977558 m!905145))

(declare-fun m!905171 () Bool)

(assert (=> b!977569 m!905171))

(assert (=> b!977571 m!905031))

(assert (=> b!977571 m!905031))

(declare-fun m!905173 () Bool)

(assert (=> b!977571 m!905173))

(declare-fun m!905175 () Bool)

(assert (=> bm!41807 m!905175))

(assert (=> bm!41809 m!905165))

(declare-fun m!905177 () Bool)

(assert (=> bm!41808 m!905177))

(assert (=> b!977567 m!905031))

(assert (=> b!977567 m!905031))

(assert (=> b!977567 m!905033))

(assert (=> b!977559 m!905031))

(declare-fun m!905179 () Bool)

(assert (=> b!977559 m!905179))

(declare-fun m!905181 () Bool)

(assert (=> b!977559 m!905181))

(declare-fun m!905183 () Bool)

(assert (=> b!977559 m!905183))

(assert (=> b!977559 m!905181))

(assert (=> b!977559 m!905179))

(assert (=> b!977559 m!905031))

(declare-fun m!905185 () Bool)

(assert (=> b!977559 m!905185))

(declare-fun m!905187 () Bool)

(assert (=> b!977561 m!905187))

(assert (=> b!977401 d!116797))

(declare-fun d!116799 () Bool)

(declare-fun e!551004 () Bool)

(assert (=> d!116799 e!551004))

(declare-fun res!654162 () Bool)

(assert (=> d!116799 (=> res!654162 e!551004)))

(declare-fun lt!433597 () Bool)

(assert (=> d!116799 (= res!654162 (not lt!433597))))

(declare-fun lt!433595 () Bool)

(assert (=> d!116799 (= lt!433597 lt!433595)))

(declare-fun lt!433594 () Unit!32444)

(declare-fun e!551003 () Unit!32444)

(assert (=> d!116799 (= lt!433594 e!551003)))

(declare-fun c!100239 () Bool)

(assert (=> d!116799 (= c!100239 lt!433595)))

(assert (=> d!116799 (= lt!433595 (containsKey!478 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)))))

(assert (=> d!116799 (= (contains!5722 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29346 _keys!1717) i!822)) lt!433597)))

(declare-fun b!977578 () Bool)

(declare-fun lt!433596 () Unit!32444)

(assert (=> b!977578 (= e!551003 lt!433596)))

(assert (=> b!977578 (= lt!433596 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)))))

(assert (=> b!977578 (isDefined!380 (getValueByKey!507 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun b!977579 () Bool)

(declare-fun Unit!32448 () Unit!32444)

(assert (=> b!977579 (= e!551003 Unit!32448)))

(declare-fun b!977580 () Bool)

(assert (=> b!977580 (= e!551004 (isDefined!380 (getValueByKey!507 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822))))))

(assert (= (and d!116799 c!100239) b!977578))

(assert (= (and d!116799 (not c!100239)) b!977579))

(assert (= (and d!116799 (not res!654162)) b!977580))

(assert (=> d!116799 m!905027))

(declare-fun m!905189 () Bool)

(assert (=> d!116799 m!905189))

(assert (=> b!977578 m!905027))

(declare-fun m!905191 () Bool)

(assert (=> b!977578 m!905191))

(assert (=> b!977578 m!905027))

(declare-fun m!905193 () Bool)

(assert (=> b!977578 m!905193))

(assert (=> b!977578 m!905193))

(declare-fun m!905195 () Bool)

(assert (=> b!977578 m!905195))

(assert (=> b!977580 m!905027))

(assert (=> b!977580 m!905193))

(assert (=> b!977580 m!905193))

(assert (=> b!977580 m!905195))

(assert (=> b!977410 d!116799))

(declare-fun b!977581 () Bool)

(declare-fun e!551010 () ListLongMap!13217)

(declare-fun call!41817 () ListLongMap!13217)

(assert (=> b!977581 (= e!551010 call!41817)))

(declare-fun bm!41811 () Bool)

(declare-fun call!41814 () ListLongMap!13217)

(declare-fun call!41818 () ListLongMap!13217)

(assert (=> bm!41811 (= call!41814 call!41818)))

(declare-fun b!977582 () Bool)

(declare-fun e!551008 () ListLongMap!13217)

(declare-fun e!551013 () ListLongMap!13217)

(assert (=> b!977582 (= e!551008 e!551013)))

(declare-fun c!100241 () Bool)

(assert (=> b!977582 (= c!100241 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!116801 () Bool)

(declare-fun e!551005 () Bool)

(assert (=> d!116801 e!551005))

(declare-fun res!654168 () Bool)

(assert (=> d!116801 (=> (not res!654168) (not e!551005))))

(assert (=> d!116801 (= res!654168 (or (bvsge from!2118 (size!29826 _keys!1717)) (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29826 _keys!1717)))))))

(declare-fun lt!433611 () ListLongMap!13217)

(declare-fun lt!433607 () ListLongMap!13217)

(assert (=> d!116801 (= lt!433611 lt!433607)))

(declare-fun lt!433617 () Unit!32444)

(declare-fun e!551007 () Unit!32444)

(assert (=> d!116801 (= lt!433617 e!551007)))

(declare-fun c!100244 () Bool)

(declare-fun e!551017 () Bool)

(assert (=> d!116801 (= c!100244 e!551017)))

(declare-fun res!654170 () Bool)

(assert (=> d!116801 (=> (not res!654170) (not e!551017))))

(assert (=> d!116801 (= res!654170 (bvslt from!2118 (size!29826 _keys!1717)))))

(assert (=> d!116801 (= lt!433607 e!551008)))

(declare-fun c!100243 () Bool)

(assert (=> d!116801 (= c!100243 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116801 (validMask!0 mask!2147)))

(assert (=> d!116801 (= (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) lt!433611)))

(declare-fun b!977583 () Bool)

(declare-fun e!551009 () Bool)

(assert (=> b!977583 (= e!551009 (= (apply!899 lt!433611 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1367))))

(declare-fun b!977584 () Bool)

(declare-fun lt!433604 () Unit!32444)

(assert (=> b!977584 (= e!551007 lt!433604)))

(declare-fun lt!433598 () ListLongMap!13217)

(assert (=> b!977584 (= lt!433598 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!433609 () (_ BitVec 64))

(assert (=> b!977584 (= lt!433609 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433612 () (_ BitVec 64))

(assert (=> b!977584 (= lt!433612 (select (arr!29346 _keys!1717) from!2118))))

(declare-fun lt!433613 () Unit!32444)

(assert (=> b!977584 (= lt!433613 (addStillContains!613 lt!433598 lt!433609 zeroValue!1367 lt!433612))))

(assert (=> b!977584 (contains!5722 (+!2940 lt!433598 (tuple2!14519 lt!433609 zeroValue!1367)) lt!433612)))

(declare-fun lt!433608 () Unit!32444)

(assert (=> b!977584 (= lt!433608 lt!433613)))

(declare-fun lt!433600 () ListLongMap!13217)

(assert (=> b!977584 (= lt!433600 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!433605 () (_ BitVec 64))

(assert (=> b!977584 (= lt!433605 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433618 () (_ BitVec 64))

(assert (=> b!977584 (= lt!433618 (select (arr!29346 _keys!1717) from!2118))))

(declare-fun lt!433614 () Unit!32444)

(assert (=> b!977584 (= lt!433614 (addApplyDifferent!469 lt!433600 lt!433605 minValue!1367 lt!433618))))

(assert (=> b!977584 (= (apply!899 (+!2940 lt!433600 (tuple2!14519 lt!433605 minValue!1367)) lt!433618) (apply!899 lt!433600 lt!433618))))

(declare-fun lt!433619 () Unit!32444)

(assert (=> b!977584 (= lt!433619 lt!433614)))

(declare-fun lt!433603 () ListLongMap!13217)

(assert (=> b!977584 (= lt!433603 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!433602 () (_ BitVec 64))

(assert (=> b!977584 (= lt!433602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433615 () (_ BitVec 64))

(assert (=> b!977584 (= lt!433615 (select (arr!29346 _keys!1717) from!2118))))

(declare-fun lt!433601 () Unit!32444)

(assert (=> b!977584 (= lt!433601 (addApplyDifferent!469 lt!433603 lt!433602 zeroValue!1367 lt!433615))))

(assert (=> b!977584 (= (apply!899 (+!2940 lt!433603 (tuple2!14519 lt!433602 zeroValue!1367)) lt!433615) (apply!899 lt!433603 lt!433615))))

(declare-fun lt!433599 () Unit!32444)

(assert (=> b!977584 (= lt!433599 lt!433601)))

(declare-fun lt!433610 () ListLongMap!13217)

(assert (=> b!977584 (= lt!433610 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!433606 () (_ BitVec 64))

(assert (=> b!977584 (= lt!433606 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433616 () (_ BitVec 64))

(assert (=> b!977584 (= lt!433616 (select (arr!29346 _keys!1717) from!2118))))

(assert (=> b!977584 (= lt!433604 (addApplyDifferent!469 lt!433610 lt!433606 minValue!1367 lt!433616))))

(assert (=> b!977584 (= (apply!899 (+!2940 lt!433610 (tuple2!14519 lt!433606 minValue!1367)) lt!433616) (apply!899 lt!433610 lt!433616))))

(declare-fun b!977585 () Bool)

(declare-fun e!551011 () Bool)

(assert (=> b!977585 (= e!551011 (= (apply!899 lt!433611 (select (arr!29346 _keys!1717) from!2118)) (get!15217 (select (arr!29345 _values!1425) from!2118) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!977585 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29825 _values!1425)))))

(assert (=> b!977585 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29826 _keys!1717)))))

(declare-fun b!977586 () Bool)

(declare-fun c!100240 () Bool)

(assert (=> b!977586 (= c!100240 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!977586 (= e!551013 e!551010)))

(declare-fun b!977587 () Bool)

(declare-fun e!551015 () Bool)

(assert (=> b!977587 (= e!551015 (= (apply!899 lt!433611 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1367))))

(declare-fun b!977588 () Bool)

(declare-fun res!654167 () Bool)

(assert (=> b!977588 (=> (not res!654167) (not e!551005))))

(declare-fun e!551012 () Bool)

(assert (=> b!977588 (= res!654167 e!551012)))

(declare-fun res!654164 () Bool)

(assert (=> b!977588 (=> res!654164 e!551012)))

(declare-fun e!551016 () Bool)

(assert (=> b!977588 (= res!654164 (not e!551016))))

(declare-fun res!654163 () Bool)

(assert (=> b!977588 (=> (not res!654163) (not e!551016))))

(assert (=> b!977588 (= res!654163 (bvslt from!2118 (size!29826 _keys!1717)))))

(declare-fun b!977589 () Bool)

(declare-fun e!551014 () Bool)

(assert (=> b!977589 (= e!551014 e!551015)))

(declare-fun res!654166 () Bool)

(declare-fun call!41816 () Bool)

(assert (=> b!977589 (= res!654166 call!41816)))

(assert (=> b!977589 (=> (not res!654166) (not e!551015))))

(declare-fun b!977590 () Bool)

(declare-fun Unit!32449 () Unit!32444)

(assert (=> b!977590 (= e!551007 Unit!32449)))

(declare-fun b!977591 () Bool)

(assert (=> b!977591 (= e!551014 (not call!41816))))

(declare-fun b!977592 () Bool)

(assert (=> b!977592 (= e!551010 call!41814)))

(declare-fun bm!41812 () Bool)

(declare-fun call!41820 () Bool)

(assert (=> bm!41812 (= call!41820 (contains!5722 lt!433611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977593 () Bool)

(assert (=> b!977593 (= e!551017 (validKeyInArray!0 (select (arr!29346 _keys!1717) from!2118)))))

(declare-fun bm!41813 () Bool)

(declare-fun call!41819 () ListLongMap!13217)

(assert (=> bm!41813 (= call!41817 call!41819)))

(declare-fun b!977594 () Bool)

(assert (=> b!977594 (= e!551016 (validKeyInArray!0 (select (arr!29346 _keys!1717) from!2118)))))

(declare-fun b!977595 () Bool)

(assert (=> b!977595 (= e!551008 (+!2940 call!41819 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(declare-fun b!977596 () Bool)

(declare-fun e!551006 () Bool)

(assert (=> b!977596 (= e!551006 (not call!41820))))

(declare-fun b!977597 () Bool)

(assert (=> b!977597 (= e!551012 e!551011)))

(declare-fun res!654165 () Bool)

(assert (=> b!977597 (=> (not res!654165) (not e!551011))))

(assert (=> b!977597 (= res!654165 (contains!5722 lt!433611 (select (arr!29346 _keys!1717) from!2118)))))

(assert (=> b!977597 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29826 _keys!1717)))))

(declare-fun bm!41814 () Bool)

(declare-fun call!41815 () ListLongMap!13217)

(assert (=> bm!41814 (= call!41819 (+!2940 (ite c!100243 call!41815 (ite c!100241 call!41818 call!41814)) (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun bm!41815 () Bool)

(assert (=> bm!41815 (= call!41816 (contains!5722 lt!433611 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977598 () Bool)

(assert (=> b!977598 (= e!551013 call!41817)))

(declare-fun bm!41816 () Bool)

(assert (=> bm!41816 (= call!41815 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!977599 () Bool)

(declare-fun res!654171 () Bool)

(assert (=> b!977599 (=> (not res!654171) (not e!551005))))

(assert (=> b!977599 (= res!654171 e!551006)))

(declare-fun c!100242 () Bool)

(assert (=> b!977599 (= c!100242 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41817 () Bool)

(assert (=> bm!41817 (= call!41818 call!41815)))

(declare-fun b!977600 () Bool)

(assert (=> b!977600 (= e!551006 e!551009)))

(declare-fun res!654169 () Bool)

(assert (=> b!977600 (= res!654169 call!41820)))

(assert (=> b!977600 (=> (not res!654169) (not e!551009))))

(declare-fun b!977601 () Bool)

(assert (=> b!977601 (= e!551005 e!551014)))

(declare-fun c!100245 () Bool)

(assert (=> b!977601 (= c!100245 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!116801 c!100243) b!977595))

(assert (= (and d!116801 (not c!100243)) b!977582))

(assert (= (and b!977582 c!100241) b!977598))

(assert (= (and b!977582 (not c!100241)) b!977586))

(assert (= (and b!977586 c!100240) b!977581))

(assert (= (and b!977586 (not c!100240)) b!977592))

(assert (= (or b!977581 b!977592) bm!41811))

(assert (= (or b!977598 bm!41811) bm!41817))

(assert (= (or b!977598 b!977581) bm!41813))

(assert (= (or b!977595 bm!41817) bm!41816))

(assert (= (or b!977595 bm!41813) bm!41814))

(assert (= (and d!116801 res!654170) b!977593))

(assert (= (and d!116801 c!100244) b!977584))

(assert (= (and d!116801 (not c!100244)) b!977590))

(assert (= (and d!116801 res!654168) b!977588))

(assert (= (and b!977588 res!654163) b!977594))

(assert (= (and b!977588 (not res!654164)) b!977597))

(assert (= (and b!977597 res!654165) b!977585))

(assert (= (and b!977588 res!654167) b!977599))

(assert (= (and b!977599 c!100242) b!977600))

(assert (= (and b!977599 (not c!100242)) b!977596))

(assert (= (and b!977600 res!654169) b!977583))

(assert (= (or b!977600 b!977596) bm!41812))

(assert (= (and b!977599 res!654171) b!977601))

(assert (= (and b!977601 c!100245) b!977589))

(assert (= (and b!977601 (not c!100245)) b!977591))

(assert (= (and b!977589 res!654166) b!977587))

(assert (= (or b!977589 b!977591) bm!41815))

(declare-fun b_lambda!14597 () Bool)

(assert (=> (not b_lambda!14597) (not b!977585)))

(assert (=> b!977585 t!28870))

(declare-fun b_and!31205 () Bool)

(assert (= b_and!31203 (and (=> t!28870 result!12699) b_and!31205)))

(declare-fun m!905197 () Bool)

(assert (=> b!977583 m!905197))

(declare-fun m!905199 () Bool)

(assert (=> b!977594 m!905199))

(assert (=> b!977594 m!905199))

(declare-fun m!905201 () Bool)

(assert (=> b!977594 m!905201))

(declare-fun m!905203 () Bool)

(assert (=> bm!41812 m!905203))

(assert (=> d!116801 m!905047))

(assert (=> b!977584 m!905199))

(declare-fun m!905205 () Bool)

(assert (=> b!977584 m!905205))

(declare-fun m!905207 () Bool)

(assert (=> b!977584 m!905207))

(declare-fun m!905209 () Bool)

(assert (=> b!977584 m!905209))

(declare-fun m!905211 () Bool)

(assert (=> b!977584 m!905211))

(declare-fun m!905213 () Bool)

(assert (=> b!977584 m!905213))

(declare-fun m!905215 () Bool)

(assert (=> b!977584 m!905215))

(declare-fun m!905217 () Bool)

(assert (=> b!977584 m!905217))

(declare-fun m!905219 () Bool)

(assert (=> b!977584 m!905219))

(declare-fun m!905221 () Bool)

(assert (=> b!977584 m!905221))

(declare-fun m!905223 () Bool)

(assert (=> b!977584 m!905223))

(assert (=> b!977584 m!905215))

(declare-fun m!905225 () Bool)

(assert (=> b!977584 m!905225))

(assert (=> b!977584 m!905221))

(declare-fun m!905227 () Bool)

(assert (=> b!977584 m!905227))

(declare-fun m!905229 () Bool)

(assert (=> b!977584 m!905229))

(declare-fun m!905231 () Bool)

(assert (=> b!977584 m!905231))

(declare-fun m!905233 () Bool)

(assert (=> b!977584 m!905233))

(assert (=> b!977584 m!905219))

(declare-fun m!905235 () Bool)

(assert (=> b!977584 m!905235))

(assert (=> b!977584 m!905211))

(declare-fun m!905237 () Bool)

(assert (=> b!977595 m!905237))

(assert (=> b!977597 m!905199))

(assert (=> b!977597 m!905199))

(declare-fun m!905239 () Bool)

(assert (=> b!977597 m!905239))

(declare-fun m!905241 () Bool)

(assert (=> bm!41814 m!905241))

(assert (=> bm!41816 m!905231))

(declare-fun m!905243 () Bool)

(assert (=> bm!41815 m!905243))

(assert (=> b!977593 m!905199))

(assert (=> b!977593 m!905199))

(assert (=> b!977593 m!905201))

(assert (=> b!977585 m!905199))

(declare-fun m!905245 () Bool)

(assert (=> b!977585 m!905245))

(assert (=> b!977585 m!905181))

(declare-fun m!905247 () Bool)

(assert (=> b!977585 m!905247))

(assert (=> b!977585 m!905181))

(assert (=> b!977585 m!905245))

(assert (=> b!977585 m!905199))

(declare-fun m!905249 () Bool)

(assert (=> b!977585 m!905249))

(declare-fun m!905251 () Bool)

(assert (=> b!977587 m!905251))

(assert (=> b!977410 d!116801))

(declare-fun b!977609 () Bool)

(declare-fun e!551023 () Bool)

(assert (=> b!977609 (= e!551023 tp_is_empty!22453)))

(declare-fun b!977608 () Bool)

(declare-fun e!551022 () Bool)

(assert (=> b!977608 (= e!551022 tp_is_empty!22453)))

(declare-fun condMapEmpty!35698 () Bool)

(declare-fun mapDefault!35698 () ValueCell!10745)

(assert (=> mapNonEmpty!35689 (= condMapEmpty!35698 (= mapRest!35689 ((as const (Array (_ BitVec 32) ValueCell!10745)) mapDefault!35698)))))

(declare-fun mapRes!35698 () Bool)

(assert (=> mapNonEmpty!35689 (= tp!67935 (and e!551023 mapRes!35698))))

(declare-fun mapIsEmpty!35698 () Bool)

(assert (=> mapIsEmpty!35698 mapRes!35698))

(declare-fun mapNonEmpty!35698 () Bool)

(declare-fun tp!67951 () Bool)

(assert (=> mapNonEmpty!35698 (= mapRes!35698 (and tp!67951 e!551022))))

(declare-fun mapKey!35698 () (_ BitVec 32))

(declare-fun mapRest!35698 () (Array (_ BitVec 32) ValueCell!10745))

(declare-fun mapValue!35698 () ValueCell!10745)

(assert (=> mapNonEmpty!35698 (= mapRest!35689 (store mapRest!35698 mapKey!35698 mapValue!35698))))

(assert (= (and mapNonEmpty!35689 condMapEmpty!35698) mapIsEmpty!35698))

(assert (= (and mapNonEmpty!35689 (not condMapEmpty!35698)) mapNonEmpty!35698))

(assert (= (and mapNonEmpty!35698 ((_ is ValueCellFull!10745) mapValue!35698)) b!977608))

(assert (= (and mapNonEmpty!35689 ((_ is ValueCellFull!10745) mapDefault!35698)) b!977609))

(declare-fun m!905253 () Bool)

(assert (=> mapNonEmpty!35698 m!905253))

(declare-fun b_lambda!14599 () Bool)

(assert (= b_lambda!14595 (or (and start!83730 b_free!19549) b_lambda!14599)))

(declare-fun b_lambda!14601 () Bool)

(assert (= b_lambda!14597 (or (and start!83730 b_free!19549) b_lambda!14601)))

(check-sat (not b_lambda!14601) (not bm!41786) (not b!977597) (not b!977571) (not b!977585) (not b!977511) (not d!116799) (not b!977510) (not b!977584) (not b!977593) (not b!977595) (not b!977583) (not b!977557) (not bm!41814) (not b!977558) (not b!977561) (not b!977568) (not b!977497) (not b!977485) (not d!116797) (not bm!41816) (not d!116801) (not b!977495) (not b!977512) (not bm!41789) (not b!977578) (not bm!41805) (not bm!41807) b_and!31205 (not b!977487) (not b!977559) (not d!116791) (not b!977569) (not b!977580) (not bm!41812) (not mapNonEmpty!35698) (not b_next!19549) (not b!977587) (not bm!41815) (not b!977567) (not b_lambda!14599) (not bm!41809) (not bm!41808) tp_is_empty!22453 (not b!977594))
(check-sat b_and!31205 (not b_next!19549))
(get-model)

(declare-fun d!116803 () Bool)

(assert (=> d!116803 (isDefined!380 (getValueByKey!507 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun lt!433622 () Unit!32444)

(declare-fun choose!1607 (List!20360 (_ BitVec 64)) Unit!32444)

(assert (=> d!116803 (= lt!433622 (choose!1607 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun e!551026 () Bool)

(assert (=> d!116803 e!551026))

(declare-fun res!654174 () Bool)

(assert (=> d!116803 (=> (not res!654174) (not e!551026))))

(declare-fun isStrictlySorted!502 (List!20360) Bool)

(assert (=> d!116803 (= res!654174 (isStrictlySorted!502 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))))

(assert (=> d!116803 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)) lt!433622)))

(declare-fun b!977612 () Bool)

(assert (=> b!977612 (= e!551026 (containsKey!478 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)))))

(assert (= (and d!116803 res!654174) b!977612))

(assert (=> d!116803 m!905027))

(assert (=> d!116803 m!905193))

(assert (=> d!116803 m!905193))

(assert (=> d!116803 m!905195))

(assert (=> d!116803 m!905027))

(declare-fun m!905255 () Bool)

(assert (=> d!116803 m!905255))

(declare-fun m!905257 () Bool)

(assert (=> d!116803 m!905257))

(assert (=> b!977612 m!905027))

(assert (=> b!977612 m!905189))

(assert (=> b!977578 d!116803))

(declare-fun d!116805 () Bool)

(declare-fun isEmpty!722 (Option!513) Bool)

(assert (=> d!116805 (= (isDefined!380 (getValueByKey!507 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822))) (not (isEmpty!722 (getValueByKey!507 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)))))))

(declare-fun bs!27636 () Bool)

(assert (= bs!27636 d!116805))

(assert (=> bs!27636 m!905193))

(declare-fun m!905259 () Bool)

(assert (=> bs!27636 m!905259))

(assert (=> b!977578 d!116805))

(declare-fun b!977622 () Bool)

(declare-fun e!551031 () Option!513)

(declare-fun e!551032 () Option!513)

(assert (=> b!977622 (= e!551031 e!551032)))

(declare-fun c!100251 () Bool)

(assert (=> b!977622 (= c!100251 (and ((_ is Cons!20356) (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (not (= (_1!7270 (h!21524 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29346 _keys!1717) i!822)))))))

(declare-fun b!977621 () Bool)

(assert (=> b!977621 (= e!551031 (Some!512 (_2!7270 (h!21524 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))))))

(declare-fun b!977624 () Bool)

(assert (=> b!977624 (= e!551032 None!511)))

(declare-fun b!977623 () Bool)

(assert (=> b!977623 (= e!551032 (getValueByKey!507 (t!28865 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun c!100250 () Bool)

(declare-fun d!116807 () Bool)

(assert (=> d!116807 (= c!100250 (and ((_ is Cons!20356) (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (= (_1!7270 (h!21524 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29346 _keys!1717) i!822))))))

(assert (=> d!116807 (= (getValueByKey!507 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)) e!551031)))

(assert (= (and d!116807 c!100250) b!977621))

(assert (= (and d!116807 (not c!100250)) b!977622))

(assert (= (and b!977622 c!100251) b!977623))

(assert (= (and b!977622 (not c!100251)) b!977624))

(assert (=> b!977623 m!905027))

(declare-fun m!905261 () Bool)

(assert (=> b!977623 m!905261))

(assert (=> b!977578 d!116807))

(declare-fun b!977649 () Bool)

(declare-fun e!551048 () Bool)

(declare-fun e!551050 () Bool)

(assert (=> b!977649 (= e!551048 e!551050)))

(assert (=> b!977649 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(declare-fun lt!433638 () ListLongMap!13217)

(declare-fun res!654184 () Bool)

(assert (=> b!977649 (= res!654184 (contains!5722 lt!433638 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!977649 (=> (not res!654184) (not e!551050))))

(declare-fun b!977650 () Bool)

(declare-fun e!551047 () Bool)

(declare-fun isEmpty!723 (ListLongMap!13217) Bool)

(assert (=> b!977650 (= e!551047 (isEmpty!723 lt!433638))))

(declare-fun d!116809 () Bool)

(declare-fun e!551052 () Bool)

(assert (=> d!116809 e!551052))

(declare-fun res!654183 () Bool)

(assert (=> d!116809 (=> (not res!654183) (not e!551052))))

(assert (=> d!116809 (= res!654183 (not (contains!5722 lt!433638 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!551053 () ListLongMap!13217)

(assert (=> d!116809 (= lt!433638 e!551053)))

(declare-fun c!100260 () Bool)

(assert (=> d!116809 (= c!100260 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(assert (=> d!116809 (validMask!0 mask!2147)))

(assert (=> d!116809 (= (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428) lt!433638)))

(declare-fun b!977651 () Bool)

(assert (=> b!977651 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(assert (=> b!977651 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29825 _values!1425)))))

(assert (=> b!977651 (= e!551050 (= (apply!899 lt!433638 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15217 (select (arr!29345 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!977652 () Bool)

(declare-fun lt!433640 () Unit!32444)

(declare-fun lt!433639 () Unit!32444)

(assert (=> b!977652 (= lt!433640 lt!433639)))

(declare-fun lt!433641 () V!34921)

(declare-fun lt!433643 () (_ BitVec 64))

(declare-fun lt!433642 () ListLongMap!13217)

(declare-fun lt!433637 () (_ BitVec 64))

(assert (=> b!977652 (not (contains!5722 (+!2940 lt!433642 (tuple2!14519 lt!433637 lt!433641)) lt!433643))))

(declare-fun addStillNotContains!231 (ListLongMap!13217 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32444)

(assert (=> b!977652 (= lt!433639 (addStillNotContains!231 lt!433642 lt!433637 lt!433641 lt!433643))))

(assert (=> b!977652 (= lt!433643 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!977652 (= lt!433641 (get!15217 (select (arr!29345 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!977652 (= lt!433637 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun call!41823 () ListLongMap!13217)

(assert (=> b!977652 (= lt!433642 call!41823)))

(declare-fun e!551051 () ListLongMap!13217)

(assert (=> b!977652 (= e!551051 (+!2940 call!41823 (tuple2!14519 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) (get!15217 (select (arr!29345 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!977653 () Bool)

(assert (=> b!977653 (= e!551048 e!551047)))

(declare-fun c!100263 () Bool)

(assert (=> b!977653 (= c!100263 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(declare-fun bm!41820 () Bool)

(assert (=> bm!41820 (= call!41823 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!977654 () Bool)

(assert (=> b!977654 (= e!551051 call!41823)))

(declare-fun b!977655 () Bool)

(declare-fun e!551049 () Bool)

(assert (=> b!977655 (= e!551049 (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!977655 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!977656 () Bool)

(assert (=> b!977656 (= e!551053 e!551051)))

(declare-fun c!100261 () Bool)

(assert (=> b!977656 (= c!100261 (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!977657 () Bool)

(declare-fun res!654185 () Bool)

(assert (=> b!977657 (=> (not res!654185) (not e!551052))))

(assert (=> b!977657 (= res!654185 (not (contains!5722 lt!433638 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!977658 () Bool)

(assert (=> b!977658 (= e!551053 (ListLongMap!13218 Nil!20357))))

(declare-fun b!977659 () Bool)

(assert (=> b!977659 (= e!551052 e!551048)))

(declare-fun c!100262 () Bool)

(assert (=> b!977659 (= c!100262 e!551049)))

(declare-fun res!654186 () Bool)

(assert (=> b!977659 (=> (not res!654186) (not e!551049))))

(assert (=> b!977659 (= res!654186 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(declare-fun b!977660 () Bool)

(assert (=> b!977660 (= e!551047 (= lt!433638 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1428)))))

(assert (= (and d!116809 c!100260) b!977658))

(assert (= (and d!116809 (not c!100260)) b!977656))

(assert (= (and b!977656 c!100261) b!977652))

(assert (= (and b!977656 (not c!100261)) b!977654))

(assert (= (or b!977652 b!977654) bm!41820))

(assert (= (and d!116809 res!654183) b!977657))

(assert (= (and b!977657 res!654185) b!977659))

(assert (= (and b!977659 res!654186) b!977655))

(assert (= (and b!977659 c!100262) b!977649))

(assert (= (and b!977659 (not c!100262)) b!977653))

(assert (= (and b!977649 res!654184) b!977651))

(assert (= (and b!977653 c!100263) b!977660))

(assert (= (and b!977653 (not c!100263)) b!977650))

(declare-fun b_lambda!14603 () Bool)

(assert (=> (not b_lambda!14603) (not b!977651)))

(assert (=> b!977651 t!28870))

(declare-fun b_and!31207 () Bool)

(assert (= b_and!31205 (and (=> t!28870 result!12699) b_and!31207)))

(declare-fun b_lambda!14605 () Bool)

(assert (=> (not b_lambda!14605) (not b!977652)))

(assert (=> b!977652 t!28870))

(declare-fun b_and!31209 () Bool)

(assert (= b_and!31207 (and (=> t!28870 result!12699) b_and!31209)))

(assert (=> b!977656 m!905031))

(assert (=> b!977656 m!905031))

(assert (=> b!977656 m!905033))

(declare-fun m!905263 () Bool)

(assert (=> bm!41820 m!905263))

(assert (=> b!977660 m!905263))

(assert (=> b!977649 m!905031))

(assert (=> b!977649 m!905031))

(declare-fun m!905265 () Bool)

(assert (=> b!977649 m!905265))

(declare-fun m!905267 () Bool)

(assert (=> b!977650 m!905267))

(declare-fun m!905269 () Bool)

(assert (=> b!977657 m!905269))

(assert (=> b!977651 m!905031))

(declare-fun m!905271 () Bool)

(assert (=> b!977651 m!905271))

(assert (=> b!977651 m!905031))

(assert (=> b!977651 m!905181))

(assert (=> b!977651 m!905179))

(assert (=> b!977651 m!905179))

(assert (=> b!977651 m!905181))

(assert (=> b!977651 m!905183))

(declare-fun m!905273 () Bool)

(assert (=> d!116809 m!905273))

(assert (=> d!116809 m!905047))

(assert (=> b!977655 m!905031))

(assert (=> b!977655 m!905031))

(assert (=> b!977655 m!905033))

(declare-fun m!905275 () Bool)

(assert (=> b!977652 m!905275))

(assert (=> b!977652 m!905031))

(assert (=> b!977652 m!905181))

(declare-fun m!905277 () Bool)

(assert (=> b!977652 m!905277))

(declare-fun m!905279 () Bool)

(assert (=> b!977652 m!905279))

(declare-fun m!905281 () Bool)

(assert (=> b!977652 m!905281))

(assert (=> b!977652 m!905179))

(assert (=> b!977652 m!905279))

(assert (=> b!977652 m!905179))

(assert (=> b!977652 m!905181))

(assert (=> b!977652 m!905183))

(assert (=> bm!41809 d!116809))

(declare-fun d!116811 () Bool)

(assert (=> d!116811 (= (validKeyInArray!0 (select (arr!29346 _keys!1717) from!2118)) (and (not (= (select (arr!29346 _keys!1717) from!2118) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29346 _keys!1717) from!2118) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!977593 d!116811))

(declare-fun d!116813 () Bool)

(declare-fun e!551055 () Bool)

(assert (=> d!116813 e!551055))

(declare-fun res!654187 () Bool)

(assert (=> d!116813 (=> res!654187 e!551055)))

(declare-fun lt!433647 () Bool)

(assert (=> d!116813 (= res!654187 (not lt!433647))))

(declare-fun lt!433645 () Bool)

(assert (=> d!116813 (= lt!433647 lt!433645)))

(declare-fun lt!433644 () Unit!32444)

(declare-fun e!551054 () Unit!32444)

(assert (=> d!116813 (= lt!433644 e!551054)))

(declare-fun c!100264 () Bool)

(assert (=> d!116813 (= c!100264 lt!433645)))

(assert (=> d!116813 (= lt!433645 (containsKey!478 (toList!6624 lt!433585) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116813 (= (contains!5722 lt!433585 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433647)))

(declare-fun b!977661 () Bool)

(declare-fun lt!433646 () Unit!32444)

(assert (=> b!977661 (= e!551054 lt!433646)))

(assert (=> b!977661 (= lt!433646 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 lt!433585) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!977661 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433585) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977662 () Bool)

(declare-fun Unit!32450 () Unit!32444)

(assert (=> b!977662 (= e!551054 Unit!32450)))

(declare-fun b!977663 () Bool)

(assert (=> b!977663 (= e!551055 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116813 c!100264) b!977661))

(assert (= (and d!116813 (not c!100264)) b!977662))

(assert (= (and d!116813 (not res!654187)) b!977663))

(declare-fun m!905283 () Bool)

(assert (=> d!116813 m!905283))

(declare-fun m!905285 () Bool)

(assert (=> b!977661 m!905285))

(declare-fun m!905287 () Bool)

(assert (=> b!977661 m!905287))

(assert (=> b!977661 m!905287))

(declare-fun m!905289 () Bool)

(assert (=> b!977661 m!905289))

(assert (=> b!977663 m!905287))

(assert (=> b!977663 m!905287))

(assert (=> b!977663 m!905289))

(assert (=> bm!41808 d!116813))

(declare-fun d!116815 () Bool)

(declare-fun e!551058 () Bool)

(assert (=> d!116815 e!551058))

(declare-fun res!654193 () Bool)

(assert (=> d!116815 (=> (not res!654193) (not e!551058))))

(declare-fun lt!433658 () ListLongMap!13217)

(assert (=> d!116815 (= res!654193 (contains!5722 lt!433658 (_1!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun lt!433657 () List!20360)

(assert (=> d!116815 (= lt!433658 (ListLongMap!13218 lt!433657))))

(declare-fun lt!433659 () Unit!32444)

(declare-fun lt!433656 () Unit!32444)

(assert (=> d!116815 (= lt!433659 lt!433656)))

(assert (=> d!116815 (= (getValueByKey!507 lt!433657 (_1!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!512 (_2!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!269 (List!20360 (_ BitVec 64) V!34921) Unit!32444)

(assert (=> d!116815 (= lt!433656 (lemmaContainsTupThenGetReturnValue!269 lt!433657 (_1!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun insertStrictlySorted!326 (List!20360 (_ BitVec 64) V!34921) List!20360)

(assert (=> d!116815 (= lt!433657 (insertStrictlySorted!326 (toList!6624 (ite c!100236 call!41808 (ite c!100234 call!41811 call!41807))) (_1!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116815 (= (+!2940 (ite c!100236 call!41808 (ite c!100234 call!41811 call!41807)) (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) lt!433658)))

(declare-fun b!977668 () Bool)

(declare-fun res!654192 () Bool)

(assert (=> b!977668 (=> (not res!654192) (not e!551058))))

(assert (=> b!977668 (= res!654192 (= (getValueByKey!507 (toList!6624 lt!433658) (_1!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!512 (_2!7270 (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))))

(declare-fun b!977669 () Bool)

(declare-fun contains!5725 (List!20360 tuple2!14518) Bool)

(assert (=> b!977669 (= e!551058 (contains!5725 (toList!6624 lt!433658) (ite (or c!100236 c!100234) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (= (and d!116815 res!654193) b!977668))

(assert (= (and b!977668 res!654192) b!977669))

(declare-fun m!905291 () Bool)

(assert (=> d!116815 m!905291))

(declare-fun m!905293 () Bool)

(assert (=> d!116815 m!905293))

(declare-fun m!905295 () Bool)

(assert (=> d!116815 m!905295))

(declare-fun m!905297 () Bool)

(assert (=> d!116815 m!905297))

(declare-fun m!905299 () Bool)

(assert (=> b!977668 m!905299))

(declare-fun m!905301 () Bool)

(assert (=> b!977669 m!905301))

(assert (=> bm!41807 d!116815))

(declare-fun d!116817 () Bool)

(declare-fun e!551060 () Bool)

(assert (=> d!116817 e!551060))

(declare-fun res!654194 () Bool)

(assert (=> d!116817 (=> res!654194 e!551060)))

(declare-fun lt!433663 () Bool)

(assert (=> d!116817 (= res!654194 (not lt!433663))))

(declare-fun lt!433661 () Bool)

(assert (=> d!116817 (= lt!433663 lt!433661)))

(declare-fun lt!433660 () Unit!32444)

(declare-fun e!551059 () Unit!32444)

(assert (=> d!116817 (= lt!433660 e!551059)))

(declare-fun c!100265 () Bool)

(assert (=> d!116817 (= c!100265 lt!433661)))

(assert (=> d!116817 (= lt!433661 (containsKey!478 (toList!6624 lt!433611) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116817 (= (contains!5722 lt!433611 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433663)))

(declare-fun b!977670 () Bool)

(declare-fun lt!433662 () Unit!32444)

(assert (=> b!977670 (= e!551059 lt!433662)))

(assert (=> b!977670 (= lt!433662 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 lt!433611) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!977670 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433611) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977671 () Bool)

(declare-fun Unit!32451 () Unit!32444)

(assert (=> b!977671 (= e!551059 Unit!32451)))

(declare-fun b!977672 () Bool)

(assert (=> b!977672 (= e!551060 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433611) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116817 c!100265) b!977670))

(assert (= (and d!116817 (not c!100265)) b!977671))

(assert (= (and d!116817 (not res!654194)) b!977672))

(declare-fun m!905303 () Bool)

(assert (=> d!116817 m!905303))

(declare-fun m!905305 () Bool)

(assert (=> b!977670 m!905305))

(declare-fun m!905307 () Bool)

(assert (=> b!977670 m!905307))

(assert (=> b!977670 m!905307))

(declare-fun m!905309 () Bool)

(assert (=> b!977670 m!905309))

(assert (=> b!977672 m!905307))

(assert (=> b!977672 m!905307))

(assert (=> b!977672 m!905309))

(assert (=> bm!41812 d!116817))

(declare-fun d!116819 () Bool)

(declare-fun res!654199 () Bool)

(declare-fun e!551065 () Bool)

(assert (=> d!116819 (=> res!654199 e!551065)))

(assert (=> d!116819 (= res!654199 (and ((_ is Cons!20356) (toList!6624 lt!433500)) (= (_1!7270 (h!21524 (toList!6624 lt!433500))) (select (arr!29346 _keys!1717) i!822))))))

(assert (=> d!116819 (= (containsKey!478 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)) e!551065)))

(declare-fun b!977677 () Bool)

(declare-fun e!551066 () Bool)

(assert (=> b!977677 (= e!551065 e!551066)))

(declare-fun res!654200 () Bool)

(assert (=> b!977677 (=> (not res!654200) (not e!551066))))

(assert (=> b!977677 (= res!654200 (and (or (not ((_ is Cons!20356) (toList!6624 lt!433500))) (bvsle (_1!7270 (h!21524 (toList!6624 lt!433500))) (select (arr!29346 _keys!1717) i!822))) ((_ is Cons!20356) (toList!6624 lt!433500)) (bvslt (_1!7270 (h!21524 (toList!6624 lt!433500))) (select (arr!29346 _keys!1717) i!822))))))

(declare-fun b!977678 () Bool)

(assert (=> b!977678 (= e!551066 (containsKey!478 (t!28865 (toList!6624 lt!433500)) (select (arr!29346 _keys!1717) i!822)))))

(assert (= (and d!116819 (not res!654199)) b!977677))

(assert (= (and b!977677 res!654200) b!977678))

(assert (=> b!977678 m!905027))

(declare-fun m!905311 () Bool)

(assert (=> b!977678 m!905311))

(assert (=> d!116791 d!116819))

(declare-fun d!116821 () Bool)

(declare-fun e!551068 () Bool)

(assert (=> d!116821 e!551068))

(declare-fun res!654201 () Bool)

(assert (=> d!116821 (=> res!654201 e!551068)))

(declare-fun lt!433667 () Bool)

(assert (=> d!116821 (= res!654201 (not lt!433667))))

(declare-fun lt!433665 () Bool)

(assert (=> d!116821 (= lt!433667 lt!433665)))

(declare-fun lt!433664 () Unit!32444)

(declare-fun e!551067 () Unit!32444)

(assert (=> d!116821 (= lt!433664 e!551067)))

(declare-fun c!100266 () Bool)

(assert (=> d!116821 (= c!100266 lt!433665)))

(assert (=> d!116821 (= lt!433665 (containsKey!478 (toList!6624 lt!433585) (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> d!116821 (= (contains!5722 lt!433585 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) lt!433667)))

(declare-fun b!977679 () Bool)

(declare-fun lt!433666 () Unit!32444)

(assert (=> b!977679 (= e!551067 lt!433666)))

(assert (=> b!977679 (= lt!433666 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 lt!433585) (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!977679 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433585) (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!977680 () Bool)

(declare-fun Unit!32452 () Unit!32444)

(assert (=> b!977680 (= e!551067 Unit!32452)))

(declare-fun b!977681 () Bool)

(assert (=> b!977681 (= e!551068 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433585) (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(assert (= (and d!116821 c!100266) b!977679))

(assert (= (and d!116821 (not c!100266)) b!977680))

(assert (= (and d!116821 (not res!654201)) b!977681))

(assert (=> d!116821 m!905031))

(declare-fun m!905313 () Bool)

(assert (=> d!116821 m!905313))

(assert (=> b!977679 m!905031))

(declare-fun m!905315 () Bool)

(assert (=> b!977679 m!905315))

(assert (=> b!977679 m!905031))

(declare-fun m!905317 () Bool)

(assert (=> b!977679 m!905317))

(assert (=> b!977679 m!905317))

(declare-fun m!905319 () Bool)

(assert (=> b!977679 m!905319))

(assert (=> b!977681 m!905031))

(assert (=> b!977681 m!905317))

(assert (=> b!977681 m!905317))

(assert (=> b!977681 m!905319))

(assert (=> b!977571 d!116821))

(assert (=> d!116797 d!116785))

(declare-fun d!116823 () Bool)

(declare-fun e!551069 () Bool)

(assert (=> d!116823 e!551069))

(declare-fun res!654203 () Bool)

(assert (=> d!116823 (=> (not res!654203) (not e!551069))))

(declare-fun lt!433670 () ListLongMap!13217)

(assert (=> d!116823 (= res!654203 (contains!5722 lt!433670 (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun lt!433669 () List!20360)

(assert (=> d!116823 (= lt!433670 (ListLongMap!13218 lt!433669))))

(declare-fun lt!433671 () Unit!32444)

(declare-fun lt!433668 () Unit!32444)

(assert (=> d!116823 (= lt!433671 lt!433668)))

(assert (=> d!116823 (= (getValueByKey!507 lt!433669 (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116823 (= lt!433668 (lemmaContainsTupThenGetReturnValue!269 lt!433669 (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116823 (= lt!433669 (insertStrictlySorted!326 (toList!6624 call!41812) (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116823 (= (+!2940 call!41812 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) lt!433670)))

(declare-fun b!977682 () Bool)

(declare-fun res!654202 () Bool)

(assert (=> b!977682 (=> (not res!654202) (not e!551069))))

(assert (=> b!977682 (= res!654202 (= (getValueByKey!507 (toList!6624 lt!433670) (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun b!977683 () Bool)

(assert (=> b!977683 (= e!551069 (contains!5725 (toList!6624 lt!433670) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(assert (= (and d!116823 res!654203) b!977682))

(assert (= (and b!977682 res!654202) b!977683))

(declare-fun m!905321 () Bool)

(assert (=> d!116823 m!905321))

(declare-fun m!905323 () Bool)

(assert (=> d!116823 m!905323))

(declare-fun m!905325 () Bool)

(assert (=> d!116823 m!905325))

(declare-fun m!905327 () Bool)

(assert (=> d!116823 m!905327))

(declare-fun m!905329 () Bool)

(assert (=> b!977682 m!905329))

(declare-fun m!905331 () Bool)

(assert (=> b!977683 m!905331))

(assert (=> b!977569 d!116823))

(assert (=> b!977568 d!116795))

(assert (=> b!977567 d!116795))

(declare-fun d!116825 () Bool)

(assert (=> d!116825 (= (isDefined!380 (getValueByKey!507 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822))) (not (isEmpty!722 (getValueByKey!507 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)))))))

(declare-fun bs!27637 () Bool)

(assert (= bs!27637 d!116825))

(assert (=> bs!27637 m!905127))

(declare-fun m!905333 () Bool)

(assert (=> bs!27637 m!905333))

(assert (=> b!977497 d!116825))

(declare-fun b!977685 () Bool)

(declare-fun e!551070 () Option!513)

(declare-fun e!551071 () Option!513)

(assert (=> b!977685 (= e!551070 e!551071)))

(declare-fun c!100268 () Bool)

(assert (=> b!977685 (= c!100268 (and ((_ is Cons!20356) (toList!6624 lt!433500)) (not (= (_1!7270 (h!21524 (toList!6624 lt!433500))) (select (arr!29346 _keys!1717) i!822)))))))

(declare-fun b!977684 () Bool)

(assert (=> b!977684 (= e!551070 (Some!512 (_2!7270 (h!21524 (toList!6624 lt!433500)))))))

(declare-fun b!977687 () Bool)

(assert (=> b!977687 (= e!551071 None!511)))

(declare-fun b!977686 () Bool)

(assert (=> b!977686 (= e!551071 (getValueByKey!507 (t!28865 (toList!6624 lt!433500)) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun c!100267 () Bool)

(declare-fun d!116827 () Bool)

(assert (=> d!116827 (= c!100267 (and ((_ is Cons!20356) (toList!6624 lt!433500)) (= (_1!7270 (h!21524 (toList!6624 lt!433500))) (select (arr!29346 _keys!1717) i!822))))))

(assert (=> d!116827 (= (getValueByKey!507 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)) e!551070)))

(assert (= (and d!116827 c!100267) b!977684))

(assert (= (and d!116827 (not c!100267)) b!977685))

(assert (= (and b!977685 c!100268) b!977686))

(assert (= (and b!977685 (not c!100268)) b!977687))

(assert (=> b!977686 m!905027))

(declare-fun m!905335 () Bool)

(assert (=> b!977686 m!905335))

(assert (=> b!977497 d!116827))

(declare-fun d!116829 () Bool)

(declare-fun get!15218 (Option!513) V!34921)

(assert (=> d!116829 (= (apply!899 lt!433611 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15218 (getValueByKey!507 (toList!6624 lt!433611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27638 () Bool)

(assert (= bs!27638 d!116829))

(declare-fun m!905337 () Bool)

(assert (=> bs!27638 m!905337))

(assert (=> bs!27638 m!905337))

(declare-fun m!905339 () Bool)

(assert (=> bs!27638 m!905339))

(assert (=> b!977587 d!116829))

(assert (=> d!116801 d!116785))

(declare-fun d!116831 () Bool)

(declare-fun res!654204 () Bool)

(declare-fun e!551072 () Bool)

(assert (=> d!116831 (=> res!654204 e!551072)))

(assert (=> d!116831 (= res!654204 (and ((_ is Cons!20356) (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (= (_1!7270 (h!21524 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29346 _keys!1717) i!822))))))

(assert (=> d!116831 (= (containsKey!478 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29346 _keys!1717) i!822)) e!551072)))

(declare-fun b!977688 () Bool)

(declare-fun e!551073 () Bool)

(assert (=> b!977688 (= e!551072 e!551073)))

(declare-fun res!654205 () Bool)

(assert (=> b!977688 (=> (not res!654205) (not e!551073))))

(assert (=> b!977688 (= res!654205 (and (or (not ((_ is Cons!20356) (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (bvsle (_1!7270 (h!21524 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29346 _keys!1717) i!822))) ((_ is Cons!20356) (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (bvslt (_1!7270 (h!21524 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29346 _keys!1717) i!822))))))

(declare-fun b!977689 () Bool)

(assert (=> b!977689 (= e!551073 (containsKey!478 (t!28865 (toList!6624 (getCurrentListMap!3857 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (select (arr!29346 _keys!1717) i!822)))))

(assert (= (and d!116831 (not res!654204)) b!977688))

(assert (= (and b!977688 res!654205) b!977689))

(assert (=> b!977689 m!905027))

(declare-fun m!905341 () Bool)

(assert (=> b!977689 m!905341))

(assert (=> d!116799 d!116831))

(declare-fun d!116833 () Bool)

(declare-fun e!551075 () Bool)

(assert (=> d!116833 e!551075))

(declare-fun res!654206 () Bool)

(assert (=> d!116833 (=> res!654206 e!551075)))

(declare-fun lt!433675 () Bool)

(assert (=> d!116833 (= res!654206 (not lt!433675))))

(declare-fun lt!433673 () Bool)

(assert (=> d!116833 (= lt!433675 lt!433673)))

(declare-fun lt!433672 () Unit!32444)

(declare-fun e!551074 () Unit!32444)

(assert (=> d!116833 (= lt!433672 e!551074)))

(declare-fun c!100269 () Bool)

(assert (=> d!116833 (= c!100269 lt!433673)))

(assert (=> d!116833 (= lt!433673 (containsKey!478 (toList!6624 lt!433585) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116833 (= (contains!5722 lt!433585 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433675)))

(declare-fun b!977690 () Bool)

(declare-fun lt!433674 () Unit!32444)

(assert (=> b!977690 (= e!551074 lt!433674)))

(assert (=> b!977690 (= lt!433674 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 lt!433585) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!977690 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433585) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977691 () Bool)

(declare-fun Unit!32453 () Unit!32444)

(assert (=> b!977691 (= e!551074 Unit!32453)))

(declare-fun b!977692 () Bool)

(assert (=> b!977692 (= e!551075 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116833 c!100269) b!977690))

(assert (= (and d!116833 (not c!100269)) b!977691))

(assert (= (and d!116833 (not res!654206)) b!977692))

(declare-fun m!905343 () Bool)

(assert (=> d!116833 m!905343))

(declare-fun m!905345 () Bool)

(assert (=> b!977690 m!905345))

(declare-fun m!905347 () Bool)

(assert (=> b!977690 m!905347))

(assert (=> b!977690 m!905347))

(declare-fun m!905349 () Bool)

(assert (=> b!977690 m!905349))

(assert (=> b!977692 m!905347))

(assert (=> b!977692 m!905347))

(assert (=> b!977692 m!905349))

(assert (=> bm!41805 d!116833))

(declare-fun d!116835 () Bool)

(assert (=> d!116835 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun lt!433676 () Unit!32444)

(assert (=> d!116835 (= lt!433676 (choose!1607 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)))))

(declare-fun e!551076 () Bool)

(assert (=> d!116835 e!551076))

(declare-fun res!654207 () Bool)

(assert (=> d!116835 (=> (not res!654207) (not e!551076))))

(assert (=> d!116835 (= res!654207 (isStrictlySorted!502 (toList!6624 lt!433500)))))

(assert (=> d!116835 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)) lt!433676)))

(declare-fun b!977693 () Bool)

(assert (=> b!977693 (= e!551076 (containsKey!478 (toList!6624 lt!433500) (select (arr!29346 _keys!1717) i!822)))))

(assert (= (and d!116835 res!654207) b!977693))

(assert (=> d!116835 m!905027))

(assert (=> d!116835 m!905127))

(assert (=> d!116835 m!905127))

(assert (=> d!116835 m!905129))

(assert (=> d!116835 m!905027))

(declare-fun m!905351 () Bool)

(assert (=> d!116835 m!905351))

(declare-fun m!905353 () Bool)

(assert (=> d!116835 m!905353))

(assert (=> b!977693 m!905027))

(assert (=> b!977693 m!905123))

(assert (=> b!977495 d!116835))

(assert (=> b!977495 d!116825))

(assert (=> b!977495 d!116827))

(declare-fun b!977694 () Bool)

(declare-fun e!551079 () Bool)

(declare-fun e!551078 () Bool)

(assert (=> b!977694 (= e!551079 e!551078)))

(declare-fun lt!433679 () (_ BitVec 64))

(assert (=> b!977694 (= lt!433679 (select (arr!29346 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!433678 () Unit!32444)

(assert (=> b!977694 (= lt!433678 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!433679 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!977694 (arrayContainsKey!0 _keys!1717 lt!433679 #b00000000000000000000000000000000)))

(declare-fun lt!433677 () Unit!32444)

(assert (=> b!977694 (= lt!433677 lt!433678)))

(declare-fun res!654208 () Bool)

(assert (=> b!977694 (= res!654208 (= (seekEntryOrOpen!0 (select (arr!29346 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1717 mask!2147) (Found!9156 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!977694 (=> (not res!654208) (not e!551078))))

(declare-fun b!977695 () Bool)

(declare-fun call!41824 () Bool)

(assert (=> b!977695 (= e!551078 call!41824)))

(declare-fun b!977696 () Bool)

(declare-fun e!551077 () Bool)

(assert (=> b!977696 (= e!551077 e!551079)))

(declare-fun c!100270 () Bool)

(assert (=> b!977696 (= c!100270 (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!977697 () Bool)

(assert (=> b!977697 (= e!551079 call!41824)))

(declare-fun bm!41821 () Bool)

(assert (=> bm!41821 (= call!41824 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116837 () Bool)

(declare-fun res!654209 () Bool)

(assert (=> d!116837 (=> res!654209 e!551077)))

(assert (=> d!116837 (= res!654209 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(assert (=> d!116837 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147) e!551077)))

(assert (= (and d!116837 (not res!654209)) b!977696))

(assert (= (and b!977696 c!100270) b!977694))

(assert (= (and b!977696 (not c!100270)) b!977697))

(assert (= (and b!977694 res!654208) b!977695))

(assert (= (or b!977695 b!977697) bm!41821))

(declare-fun m!905355 () Bool)

(assert (=> b!977694 m!905355))

(declare-fun m!905357 () Bool)

(assert (=> b!977694 m!905357))

(declare-fun m!905359 () Bool)

(assert (=> b!977694 m!905359))

(assert (=> b!977694 m!905355))

(declare-fun m!905361 () Bool)

(assert (=> b!977694 m!905361))

(assert (=> b!977696 m!905355))

(assert (=> b!977696 m!905355))

(declare-fun m!905363 () Bool)

(assert (=> b!977696 m!905363))

(declare-fun m!905365 () Bool)

(assert (=> bm!41821 m!905365))

(assert (=> bm!41786 d!116837))

(declare-fun d!116839 () Bool)

(assert (=> d!116839 (= (apply!899 lt!433611 (select (arr!29346 _keys!1717) from!2118)) (get!15218 (getValueByKey!507 (toList!6624 lt!433611) (select (arr!29346 _keys!1717) from!2118))))))

(declare-fun bs!27639 () Bool)

(assert (= bs!27639 d!116839))

(assert (=> bs!27639 m!905199))

(declare-fun m!905367 () Bool)

(assert (=> bs!27639 m!905367))

(assert (=> bs!27639 m!905367))

(declare-fun m!905369 () Bool)

(assert (=> bs!27639 m!905369))

(assert (=> b!977585 d!116839))

(declare-fun d!116841 () Bool)

(declare-fun c!100273 () Bool)

(assert (=> d!116841 (= c!100273 ((_ is ValueCellFull!10745) (select (arr!29345 _values!1425) from!2118)))))

(declare-fun e!551082 () V!34921)

(assert (=> d!116841 (= (get!15217 (select (arr!29345 _values!1425) from!2118) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)) e!551082)))

(declare-fun b!977702 () Bool)

(declare-fun get!15219 (ValueCell!10745 V!34921) V!34921)

(assert (=> b!977702 (= e!551082 (get!15219 (select (arr!29345 _values!1425) from!2118) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!977703 () Bool)

(declare-fun get!15220 (ValueCell!10745 V!34921) V!34921)

(assert (=> b!977703 (= e!551082 (get!15220 (select (arr!29345 _values!1425) from!2118) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116841 c!100273) b!977702))

(assert (= (and d!116841 (not c!100273)) b!977703))

(assert (=> b!977702 m!905245))

(assert (=> b!977702 m!905181))

(declare-fun m!905371 () Bool)

(assert (=> b!977702 m!905371))

(assert (=> b!977703 m!905245))

(assert (=> b!977703 m!905181))

(declare-fun m!905373 () Bool)

(assert (=> b!977703 m!905373))

(assert (=> b!977585 d!116841))

(declare-fun d!116843 () Bool)

(declare-fun e!551083 () Bool)

(assert (=> d!116843 e!551083))

(declare-fun res!654211 () Bool)

(assert (=> d!116843 (=> (not res!654211) (not e!551083))))

(declare-fun lt!433682 () ListLongMap!13217)

(assert (=> d!116843 (= res!654211 (contains!5722 lt!433682 (_1!7270 (tuple2!14519 lt!433609 zeroValue!1367))))))

(declare-fun lt!433681 () List!20360)

(assert (=> d!116843 (= lt!433682 (ListLongMap!13218 lt!433681))))

(declare-fun lt!433683 () Unit!32444)

(declare-fun lt!433680 () Unit!32444)

(assert (=> d!116843 (= lt!433683 lt!433680)))

(assert (=> d!116843 (= (getValueByKey!507 lt!433681 (_1!7270 (tuple2!14519 lt!433609 zeroValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433609 zeroValue!1367))))))

(assert (=> d!116843 (= lt!433680 (lemmaContainsTupThenGetReturnValue!269 lt!433681 (_1!7270 (tuple2!14519 lt!433609 zeroValue!1367)) (_2!7270 (tuple2!14519 lt!433609 zeroValue!1367))))))

(assert (=> d!116843 (= lt!433681 (insertStrictlySorted!326 (toList!6624 lt!433598) (_1!7270 (tuple2!14519 lt!433609 zeroValue!1367)) (_2!7270 (tuple2!14519 lt!433609 zeroValue!1367))))))

(assert (=> d!116843 (= (+!2940 lt!433598 (tuple2!14519 lt!433609 zeroValue!1367)) lt!433682)))

(declare-fun b!977704 () Bool)

(declare-fun res!654210 () Bool)

(assert (=> b!977704 (=> (not res!654210) (not e!551083))))

(assert (=> b!977704 (= res!654210 (= (getValueByKey!507 (toList!6624 lt!433682) (_1!7270 (tuple2!14519 lt!433609 zeroValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433609 zeroValue!1367)))))))

(declare-fun b!977705 () Bool)

(assert (=> b!977705 (= e!551083 (contains!5725 (toList!6624 lt!433682) (tuple2!14519 lt!433609 zeroValue!1367)))))

(assert (= (and d!116843 res!654211) b!977704))

(assert (= (and b!977704 res!654210) b!977705))

(declare-fun m!905375 () Bool)

(assert (=> d!116843 m!905375))

(declare-fun m!905377 () Bool)

(assert (=> d!116843 m!905377))

(declare-fun m!905379 () Bool)

(assert (=> d!116843 m!905379))

(declare-fun m!905381 () Bool)

(assert (=> d!116843 m!905381))

(declare-fun m!905383 () Bool)

(assert (=> b!977704 m!905383))

(declare-fun m!905385 () Bool)

(assert (=> b!977705 m!905385))

(assert (=> b!977584 d!116843))

(declare-fun d!116845 () Bool)

(assert (=> d!116845 (= (apply!899 (+!2940 lt!433610 (tuple2!14519 lt!433606 minValue!1367)) lt!433616) (apply!899 lt!433610 lt!433616))))

(declare-fun lt!433686 () Unit!32444)

(declare-fun choose!1608 (ListLongMap!13217 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32444)

(assert (=> d!116845 (= lt!433686 (choose!1608 lt!433610 lt!433606 minValue!1367 lt!433616))))

(declare-fun e!551086 () Bool)

(assert (=> d!116845 e!551086))

(declare-fun res!654214 () Bool)

(assert (=> d!116845 (=> (not res!654214) (not e!551086))))

(assert (=> d!116845 (= res!654214 (contains!5722 lt!433610 lt!433616))))

(assert (=> d!116845 (= (addApplyDifferent!469 lt!433610 lt!433606 minValue!1367 lt!433616) lt!433686)))

(declare-fun b!977709 () Bool)

(assert (=> b!977709 (= e!551086 (not (= lt!433616 lt!433606)))))

(assert (= (and d!116845 res!654214) b!977709))

(assert (=> d!116845 m!905219))

(assert (=> d!116845 m!905235))

(assert (=> d!116845 m!905219))

(declare-fun m!905387 () Bool)

(assert (=> d!116845 m!905387))

(assert (=> d!116845 m!905229))

(declare-fun m!905389 () Bool)

(assert (=> d!116845 m!905389))

(assert (=> b!977584 d!116845))

(declare-fun d!116847 () Bool)

(assert (=> d!116847 (contains!5722 (+!2940 lt!433598 (tuple2!14519 lt!433609 zeroValue!1367)) lt!433612)))

(declare-fun lt!433689 () Unit!32444)

(declare-fun choose!1609 (ListLongMap!13217 (_ BitVec 64) V!34921 (_ BitVec 64)) Unit!32444)

(assert (=> d!116847 (= lt!433689 (choose!1609 lt!433598 lt!433609 zeroValue!1367 lt!433612))))

(assert (=> d!116847 (contains!5722 lt!433598 lt!433612)))

(assert (=> d!116847 (= (addStillContains!613 lt!433598 lt!433609 zeroValue!1367 lt!433612) lt!433689)))

(declare-fun bs!27640 () Bool)

(assert (= bs!27640 d!116847))

(assert (=> bs!27640 m!905211))

(assert (=> bs!27640 m!905211))

(assert (=> bs!27640 m!905213))

(declare-fun m!905391 () Bool)

(assert (=> bs!27640 m!905391))

(declare-fun m!905393 () Bool)

(assert (=> bs!27640 m!905393))

(assert (=> b!977584 d!116847))

(declare-fun d!116849 () Bool)

(assert (=> d!116849 (= (apply!899 (+!2940 lt!433603 (tuple2!14519 lt!433602 zeroValue!1367)) lt!433615) (get!15218 (getValueByKey!507 (toList!6624 (+!2940 lt!433603 (tuple2!14519 lt!433602 zeroValue!1367))) lt!433615)))))

(declare-fun bs!27641 () Bool)

(assert (= bs!27641 d!116849))

(declare-fun m!905395 () Bool)

(assert (=> bs!27641 m!905395))

(assert (=> bs!27641 m!905395))

(declare-fun m!905397 () Bool)

(assert (=> bs!27641 m!905397))

(assert (=> b!977584 d!116849))

(declare-fun d!116851 () Bool)

(declare-fun e!551087 () Bool)

(assert (=> d!116851 e!551087))

(declare-fun res!654216 () Bool)

(assert (=> d!116851 (=> (not res!654216) (not e!551087))))

(declare-fun lt!433692 () ListLongMap!13217)

(assert (=> d!116851 (= res!654216 (contains!5722 lt!433692 (_1!7270 (tuple2!14519 lt!433606 minValue!1367))))))

(declare-fun lt!433691 () List!20360)

(assert (=> d!116851 (= lt!433692 (ListLongMap!13218 lt!433691))))

(declare-fun lt!433693 () Unit!32444)

(declare-fun lt!433690 () Unit!32444)

(assert (=> d!116851 (= lt!433693 lt!433690)))

(assert (=> d!116851 (= (getValueByKey!507 lt!433691 (_1!7270 (tuple2!14519 lt!433606 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433606 minValue!1367))))))

(assert (=> d!116851 (= lt!433690 (lemmaContainsTupThenGetReturnValue!269 lt!433691 (_1!7270 (tuple2!14519 lt!433606 minValue!1367)) (_2!7270 (tuple2!14519 lt!433606 minValue!1367))))))

(assert (=> d!116851 (= lt!433691 (insertStrictlySorted!326 (toList!6624 lt!433610) (_1!7270 (tuple2!14519 lt!433606 minValue!1367)) (_2!7270 (tuple2!14519 lt!433606 minValue!1367))))))

(assert (=> d!116851 (= (+!2940 lt!433610 (tuple2!14519 lt!433606 minValue!1367)) lt!433692)))

(declare-fun b!977711 () Bool)

(declare-fun res!654215 () Bool)

(assert (=> b!977711 (=> (not res!654215) (not e!551087))))

(assert (=> b!977711 (= res!654215 (= (getValueByKey!507 (toList!6624 lt!433692) (_1!7270 (tuple2!14519 lt!433606 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433606 minValue!1367)))))))

(declare-fun b!977712 () Bool)

(assert (=> b!977712 (= e!551087 (contains!5725 (toList!6624 lt!433692) (tuple2!14519 lt!433606 minValue!1367)))))

(assert (= (and d!116851 res!654216) b!977711))

(assert (= (and b!977711 res!654215) b!977712))

(declare-fun m!905399 () Bool)

(assert (=> d!116851 m!905399))

(declare-fun m!905401 () Bool)

(assert (=> d!116851 m!905401))

(declare-fun m!905403 () Bool)

(assert (=> d!116851 m!905403))

(declare-fun m!905405 () Bool)

(assert (=> d!116851 m!905405))

(declare-fun m!905407 () Bool)

(assert (=> b!977711 m!905407))

(declare-fun m!905409 () Bool)

(assert (=> b!977712 m!905409))

(assert (=> b!977584 d!116851))

(declare-fun d!116853 () Bool)

(assert (=> d!116853 (= (apply!899 lt!433603 lt!433615) (get!15218 (getValueByKey!507 (toList!6624 lt!433603) lt!433615)))))

(declare-fun bs!27642 () Bool)

(assert (= bs!27642 d!116853))

(declare-fun m!905411 () Bool)

(assert (=> bs!27642 m!905411))

(assert (=> bs!27642 m!905411))

(declare-fun m!905413 () Bool)

(assert (=> bs!27642 m!905413))

(assert (=> b!977584 d!116853))

(declare-fun d!116855 () Bool)

(assert (=> d!116855 (= (apply!899 (+!2940 lt!433600 (tuple2!14519 lt!433605 minValue!1367)) lt!433618) (apply!899 lt!433600 lt!433618))))

(declare-fun lt!433694 () Unit!32444)

(assert (=> d!116855 (= lt!433694 (choose!1608 lt!433600 lt!433605 minValue!1367 lt!433618))))

(declare-fun e!551088 () Bool)

(assert (=> d!116855 e!551088))

(declare-fun res!654217 () Bool)

(assert (=> d!116855 (=> (not res!654217) (not e!551088))))

(assert (=> d!116855 (= res!654217 (contains!5722 lt!433600 lt!433618))))

(assert (=> d!116855 (= (addApplyDifferent!469 lt!433600 lt!433605 minValue!1367 lt!433618) lt!433694)))

(declare-fun b!977713 () Bool)

(assert (=> b!977713 (= e!551088 (not (= lt!433618 lt!433605)))))

(assert (= (and d!116855 res!654217) b!977713))

(assert (=> d!116855 m!905215))

(assert (=> d!116855 m!905217))

(assert (=> d!116855 m!905215))

(declare-fun m!905415 () Bool)

(assert (=> d!116855 m!905415))

(assert (=> d!116855 m!905207))

(declare-fun m!905417 () Bool)

(assert (=> d!116855 m!905417))

(assert (=> b!977584 d!116855))

(declare-fun d!116857 () Bool)

(declare-fun e!551089 () Bool)

(assert (=> d!116857 e!551089))

(declare-fun res!654219 () Bool)

(assert (=> d!116857 (=> (not res!654219) (not e!551089))))

(declare-fun lt!433697 () ListLongMap!13217)

(assert (=> d!116857 (= res!654219 (contains!5722 lt!433697 (_1!7270 (tuple2!14519 lt!433602 zeroValue!1367))))))

(declare-fun lt!433696 () List!20360)

(assert (=> d!116857 (= lt!433697 (ListLongMap!13218 lt!433696))))

(declare-fun lt!433698 () Unit!32444)

(declare-fun lt!433695 () Unit!32444)

(assert (=> d!116857 (= lt!433698 lt!433695)))

(assert (=> d!116857 (= (getValueByKey!507 lt!433696 (_1!7270 (tuple2!14519 lt!433602 zeroValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433602 zeroValue!1367))))))

(assert (=> d!116857 (= lt!433695 (lemmaContainsTupThenGetReturnValue!269 lt!433696 (_1!7270 (tuple2!14519 lt!433602 zeroValue!1367)) (_2!7270 (tuple2!14519 lt!433602 zeroValue!1367))))))

(assert (=> d!116857 (= lt!433696 (insertStrictlySorted!326 (toList!6624 lt!433603) (_1!7270 (tuple2!14519 lt!433602 zeroValue!1367)) (_2!7270 (tuple2!14519 lt!433602 zeroValue!1367))))))

(assert (=> d!116857 (= (+!2940 lt!433603 (tuple2!14519 lt!433602 zeroValue!1367)) lt!433697)))

(declare-fun b!977714 () Bool)

(declare-fun res!654218 () Bool)

(assert (=> b!977714 (=> (not res!654218) (not e!551089))))

(assert (=> b!977714 (= res!654218 (= (getValueByKey!507 (toList!6624 lt!433697) (_1!7270 (tuple2!14519 lt!433602 zeroValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433602 zeroValue!1367)))))))

(declare-fun b!977715 () Bool)

(assert (=> b!977715 (= e!551089 (contains!5725 (toList!6624 lt!433697) (tuple2!14519 lt!433602 zeroValue!1367)))))

(assert (= (and d!116857 res!654219) b!977714))

(assert (= (and b!977714 res!654218) b!977715))

(declare-fun m!905419 () Bool)

(assert (=> d!116857 m!905419))

(declare-fun m!905421 () Bool)

(assert (=> d!116857 m!905421))

(declare-fun m!905423 () Bool)

(assert (=> d!116857 m!905423))

(declare-fun m!905425 () Bool)

(assert (=> d!116857 m!905425))

(declare-fun m!905427 () Bool)

(assert (=> b!977714 m!905427))

(declare-fun m!905429 () Bool)

(assert (=> b!977715 m!905429))

(assert (=> b!977584 d!116857))

(declare-fun d!116859 () Bool)

(assert (=> d!116859 (= (apply!899 lt!433610 lt!433616) (get!15218 (getValueByKey!507 (toList!6624 lt!433610) lt!433616)))))

(declare-fun bs!27643 () Bool)

(assert (= bs!27643 d!116859))

(declare-fun m!905431 () Bool)

(assert (=> bs!27643 m!905431))

(assert (=> bs!27643 m!905431))

(declare-fun m!905433 () Bool)

(assert (=> bs!27643 m!905433))

(assert (=> b!977584 d!116859))

(declare-fun d!116861 () Bool)

(assert (=> d!116861 (= (apply!899 lt!433600 lt!433618) (get!15218 (getValueByKey!507 (toList!6624 lt!433600) lt!433618)))))

(declare-fun bs!27644 () Bool)

(assert (= bs!27644 d!116861))

(declare-fun m!905435 () Bool)

(assert (=> bs!27644 m!905435))

(assert (=> bs!27644 m!905435))

(declare-fun m!905437 () Bool)

(assert (=> bs!27644 m!905437))

(assert (=> b!977584 d!116861))

(declare-fun d!116863 () Bool)

(assert (=> d!116863 (= (apply!899 (+!2940 lt!433600 (tuple2!14519 lt!433605 minValue!1367)) lt!433618) (get!15218 (getValueByKey!507 (toList!6624 (+!2940 lt!433600 (tuple2!14519 lt!433605 minValue!1367))) lt!433618)))))

(declare-fun bs!27645 () Bool)

(assert (= bs!27645 d!116863))

(declare-fun m!905439 () Bool)

(assert (=> bs!27645 m!905439))

(assert (=> bs!27645 m!905439))

(declare-fun m!905441 () Bool)

(assert (=> bs!27645 m!905441))

(assert (=> b!977584 d!116863))

(declare-fun d!116865 () Bool)

(declare-fun e!551090 () Bool)

(assert (=> d!116865 e!551090))

(declare-fun res!654221 () Bool)

(assert (=> d!116865 (=> (not res!654221) (not e!551090))))

(declare-fun lt!433701 () ListLongMap!13217)

(assert (=> d!116865 (= res!654221 (contains!5722 lt!433701 (_1!7270 (tuple2!14519 lt!433605 minValue!1367))))))

(declare-fun lt!433700 () List!20360)

(assert (=> d!116865 (= lt!433701 (ListLongMap!13218 lt!433700))))

(declare-fun lt!433702 () Unit!32444)

(declare-fun lt!433699 () Unit!32444)

(assert (=> d!116865 (= lt!433702 lt!433699)))

(assert (=> d!116865 (= (getValueByKey!507 lt!433700 (_1!7270 (tuple2!14519 lt!433605 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433605 minValue!1367))))))

(assert (=> d!116865 (= lt!433699 (lemmaContainsTupThenGetReturnValue!269 lt!433700 (_1!7270 (tuple2!14519 lt!433605 minValue!1367)) (_2!7270 (tuple2!14519 lt!433605 minValue!1367))))))

(assert (=> d!116865 (= lt!433700 (insertStrictlySorted!326 (toList!6624 lt!433600) (_1!7270 (tuple2!14519 lt!433605 minValue!1367)) (_2!7270 (tuple2!14519 lt!433605 minValue!1367))))))

(assert (=> d!116865 (= (+!2940 lt!433600 (tuple2!14519 lt!433605 minValue!1367)) lt!433701)))

(declare-fun b!977716 () Bool)

(declare-fun res!654220 () Bool)

(assert (=> b!977716 (=> (not res!654220) (not e!551090))))

(assert (=> b!977716 (= res!654220 (= (getValueByKey!507 (toList!6624 lt!433701) (_1!7270 (tuple2!14519 lt!433605 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433605 minValue!1367)))))))

(declare-fun b!977717 () Bool)

(assert (=> b!977717 (= e!551090 (contains!5725 (toList!6624 lt!433701) (tuple2!14519 lt!433605 minValue!1367)))))

(assert (= (and d!116865 res!654221) b!977716))

(assert (= (and b!977716 res!654220) b!977717))

(declare-fun m!905443 () Bool)

(assert (=> d!116865 m!905443))

(declare-fun m!905445 () Bool)

(assert (=> d!116865 m!905445))

(declare-fun m!905447 () Bool)

(assert (=> d!116865 m!905447))

(declare-fun m!905449 () Bool)

(assert (=> d!116865 m!905449))

(declare-fun m!905451 () Bool)

(assert (=> b!977716 m!905451))

(declare-fun m!905453 () Bool)

(assert (=> b!977717 m!905453))

(assert (=> b!977584 d!116865))

(declare-fun d!116867 () Bool)

(assert (=> d!116867 (= (apply!899 (+!2940 lt!433610 (tuple2!14519 lt!433606 minValue!1367)) lt!433616) (get!15218 (getValueByKey!507 (toList!6624 (+!2940 lt!433610 (tuple2!14519 lt!433606 minValue!1367))) lt!433616)))))

(declare-fun bs!27646 () Bool)

(assert (= bs!27646 d!116867))

(declare-fun m!905455 () Bool)

(assert (=> bs!27646 m!905455))

(assert (=> bs!27646 m!905455))

(declare-fun m!905457 () Bool)

(assert (=> bs!27646 m!905457))

(assert (=> b!977584 d!116867))

(declare-fun d!116869 () Bool)

(declare-fun e!551092 () Bool)

(assert (=> d!116869 e!551092))

(declare-fun res!654222 () Bool)

(assert (=> d!116869 (=> res!654222 e!551092)))

(declare-fun lt!433706 () Bool)

(assert (=> d!116869 (= res!654222 (not lt!433706))))

(declare-fun lt!433704 () Bool)

(assert (=> d!116869 (= lt!433706 lt!433704)))

(declare-fun lt!433703 () Unit!32444)

(declare-fun e!551091 () Unit!32444)

(assert (=> d!116869 (= lt!433703 e!551091)))

(declare-fun c!100274 () Bool)

(assert (=> d!116869 (= c!100274 lt!433704)))

(assert (=> d!116869 (= lt!433704 (containsKey!478 (toList!6624 (+!2940 lt!433598 (tuple2!14519 lt!433609 zeroValue!1367))) lt!433612))))

(assert (=> d!116869 (= (contains!5722 (+!2940 lt!433598 (tuple2!14519 lt!433609 zeroValue!1367)) lt!433612) lt!433706)))

(declare-fun b!977718 () Bool)

(declare-fun lt!433705 () Unit!32444)

(assert (=> b!977718 (= e!551091 lt!433705)))

(assert (=> b!977718 (= lt!433705 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 (+!2940 lt!433598 (tuple2!14519 lt!433609 zeroValue!1367))) lt!433612))))

(assert (=> b!977718 (isDefined!380 (getValueByKey!507 (toList!6624 (+!2940 lt!433598 (tuple2!14519 lt!433609 zeroValue!1367))) lt!433612))))

(declare-fun b!977719 () Bool)

(declare-fun Unit!32454 () Unit!32444)

(assert (=> b!977719 (= e!551091 Unit!32454)))

(declare-fun b!977720 () Bool)

(assert (=> b!977720 (= e!551092 (isDefined!380 (getValueByKey!507 (toList!6624 (+!2940 lt!433598 (tuple2!14519 lt!433609 zeroValue!1367))) lt!433612)))))

(assert (= (and d!116869 c!100274) b!977718))

(assert (= (and d!116869 (not c!100274)) b!977719))

(assert (= (and d!116869 (not res!654222)) b!977720))

(declare-fun m!905459 () Bool)

(assert (=> d!116869 m!905459))

(declare-fun m!905461 () Bool)

(assert (=> b!977718 m!905461))

(declare-fun m!905463 () Bool)

(assert (=> b!977718 m!905463))

(assert (=> b!977718 m!905463))

(declare-fun m!905465 () Bool)

(assert (=> b!977718 m!905465))

(assert (=> b!977720 m!905463))

(assert (=> b!977720 m!905463))

(assert (=> b!977720 m!905465))

(assert (=> b!977584 d!116869))

(declare-fun d!116871 () Bool)

(assert (=> d!116871 (= (apply!899 (+!2940 lt!433603 (tuple2!14519 lt!433602 zeroValue!1367)) lt!433615) (apply!899 lt!433603 lt!433615))))

(declare-fun lt!433707 () Unit!32444)

(assert (=> d!116871 (= lt!433707 (choose!1608 lt!433603 lt!433602 zeroValue!1367 lt!433615))))

(declare-fun e!551093 () Bool)

(assert (=> d!116871 e!551093))

(declare-fun res!654223 () Bool)

(assert (=> d!116871 (=> (not res!654223) (not e!551093))))

(assert (=> d!116871 (= res!654223 (contains!5722 lt!433603 lt!433615))))

(assert (=> d!116871 (= (addApplyDifferent!469 lt!433603 lt!433602 zeroValue!1367 lt!433615) lt!433707)))

(declare-fun b!977721 () Bool)

(assert (=> b!977721 (= e!551093 (not (= lt!433615 lt!433602)))))

(assert (= (and d!116871 res!654223) b!977721))

(assert (=> d!116871 m!905221))

(assert (=> d!116871 m!905223))

(assert (=> d!116871 m!905221))

(declare-fun m!905467 () Bool)

(assert (=> d!116871 m!905467))

(assert (=> d!116871 m!905209))

(declare-fun m!905469 () Bool)

(assert (=> d!116871 m!905469))

(assert (=> b!977584 d!116871))

(declare-fun b!977722 () Bool)

(declare-fun e!551095 () Bool)

(declare-fun e!551097 () Bool)

(assert (=> b!977722 (= e!551095 e!551097)))

(assert (=> b!977722 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29826 _keys!1717)))))

(declare-fun lt!433709 () ListLongMap!13217)

(declare-fun res!654225 () Bool)

(assert (=> b!977722 (= res!654225 (contains!5722 lt!433709 (select (arr!29346 _keys!1717) from!2118)))))

(assert (=> b!977722 (=> (not res!654225) (not e!551097))))

(declare-fun b!977723 () Bool)

(declare-fun e!551094 () Bool)

(assert (=> b!977723 (= e!551094 (isEmpty!723 lt!433709))))

(declare-fun d!116873 () Bool)

(declare-fun e!551099 () Bool)

(assert (=> d!116873 e!551099))

(declare-fun res!654224 () Bool)

(assert (=> d!116873 (=> (not res!654224) (not e!551099))))

(assert (=> d!116873 (= res!654224 (not (contains!5722 lt!433709 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!551100 () ListLongMap!13217)

(assert (=> d!116873 (= lt!433709 e!551100)))

(declare-fun c!100275 () Bool)

(assert (=> d!116873 (= c!100275 (bvsge from!2118 (size!29826 _keys!1717)))))

(assert (=> d!116873 (validMask!0 mask!2147)))

(assert (=> d!116873 (= (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) lt!433709)))

(declare-fun b!977724 () Bool)

(assert (=> b!977724 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29826 _keys!1717)))))

(assert (=> b!977724 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29825 _values!1425)))))

(assert (=> b!977724 (= e!551097 (= (apply!899 lt!433709 (select (arr!29346 _keys!1717) from!2118)) (get!15217 (select (arr!29345 _values!1425) from!2118) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!977725 () Bool)

(declare-fun lt!433711 () Unit!32444)

(declare-fun lt!433710 () Unit!32444)

(assert (=> b!977725 (= lt!433711 lt!433710)))

(declare-fun lt!433712 () V!34921)

(declare-fun lt!433708 () (_ BitVec 64))

(declare-fun lt!433713 () ListLongMap!13217)

(declare-fun lt!433714 () (_ BitVec 64))

(assert (=> b!977725 (not (contains!5722 (+!2940 lt!433713 (tuple2!14519 lt!433708 lt!433712)) lt!433714))))

(assert (=> b!977725 (= lt!433710 (addStillNotContains!231 lt!433713 lt!433708 lt!433712 lt!433714))))

(assert (=> b!977725 (= lt!433714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!977725 (= lt!433712 (get!15217 (select (arr!29345 _values!1425) from!2118) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!977725 (= lt!433708 (select (arr!29346 _keys!1717) from!2118))))

(declare-fun call!41825 () ListLongMap!13217)

(assert (=> b!977725 (= lt!433713 call!41825)))

(declare-fun e!551098 () ListLongMap!13217)

(assert (=> b!977725 (= e!551098 (+!2940 call!41825 (tuple2!14519 (select (arr!29346 _keys!1717) from!2118) (get!15217 (select (arr!29345 _values!1425) from!2118) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!977726 () Bool)

(assert (=> b!977726 (= e!551095 e!551094)))

(declare-fun c!100278 () Bool)

(assert (=> b!977726 (= c!100278 (bvslt from!2118 (size!29826 _keys!1717)))))

(declare-fun bm!41822 () Bool)

(assert (=> bm!41822 (= call!41825 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!977727 () Bool)

(assert (=> b!977727 (= e!551098 call!41825)))

(declare-fun b!977728 () Bool)

(declare-fun e!551096 () Bool)

(assert (=> b!977728 (= e!551096 (validKeyInArray!0 (select (arr!29346 _keys!1717) from!2118)))))

(assert (=> b!977728 (bvsge from!2118 #b00000000000000000000000000000000)))

(declare-fun b!977729 () Bool)

(assert (=> b!977729 (= e!551100 e!551098)))

(declare-fun c!100276 () Bool)

(assert (=> b!977729 (= c!100276 (validKeyInArray!0 (select (arr!29346 _keys!1717) from!2118)))))

(declare-fun b!977730 () Bool)

(declare-fun res!654226 () Bool)

(assert (=> b!977730 (=> (not res!654226) (not e!551099))))

(assert (=> b!977730 (= res!654226 (not (contains!5722 lt!433709 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!977731 () Bool)

(assert (=> b!977731 (= e!551100 (ListLongMap!13218 Nil!20357))))

(declare-fun b!977732 () Bool)

(assert (=> b!977732 (= e!551099 e!551095)))

(declare-fun c!100277 () Bool)

(assert (=> b!977732 (= c!100277 e!551096)))

(declare-fun res!654227 () Bool)

(assert (=> b!977732 (=> (not res!654227) (not e!551096))))

(assert (=> b!977732 (= res!654227 (bvslt from!2118 (size!29826 _keys!1717)))))

(declare-fun b!977733 () Bool)

(assert (=> b!977733 (= e!551094 (= lt!433709 (getCurrentListMapNoExtraKeys!3373 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd from!2118 #b00000000000000000000000000000001) defaultEntry!1428)))))

(assert (= (and d!116873 c!100275) b!977731))

(assert (= (and d!116873 (not c!100275)) b!977729))

(assert (= (and b!977729 c!100276) b!977725))

(assert (= (and b!977729 (not c!100276)) b!977727))

(assert (= (or b!977725 b!977727) bm!41822))

(assert (= (and d!116873 res!654224) b!977730))

(assert (= (and b!977730 res!654226) b!977732))

(assert (= (and b!977732 res!654227) b!977728))

(assert (= (and b!977732 c!100277) b!977722))

(assert (= (and b!977732 (not c!100277)) b!977726))

(assert (= (and b!977722 res!654225) b!977724))

(assert (= (and b!977726 c!100278) b!977733))

(assert (= (and b!977726 (not c!100278)) b!977723))

(declare-fun b_lambda!14607 () Bool)

(assert (=> (not b_lambda!14607) (not b!977724)))

(assert (=> b!977724 t!28870))

(declare-fun b_and!31211 () Bool)

(assert (= b_and!31209 (and (=> t!28870 result!12699) b_and!31211)))

(declare-fun b_lambda!14609 () Bool)

(assert (=> (not b_lambda!14609) (not b!977725)))

(assert (=> b!977725 t!28870))

(declare-fun b_and!31213 () Bool)

(assert (= b_and!31211 (and (=> t!28870 result!12699) b_and!31213)))

(assert (=> b!977729 m!905199))

(assert (=> b!977729 m!905199))

(assert (=> b!977729 m!905201))

(declare-fun m!905471 () Bool)

(assert (=> bm!41822 m!905471))

(assert (=> b!977733 m!905471))

(assert (=> b!977722 m!905199))

(assert (=> b!977722 m!905199))

(declare-fun m!905473 () Bool)

(assert (=> b!977722 m!905473))

(declare-fun m!905475 () Bool)

(assert (=> b!977723 m!905475))

(declare-fun m!905477 () Bool)

(assert (=> b!977730 m!905477))

(assert (=> b!977724 m!905199))

(declare-fun m!905479 () Bool)

(assert (=> b!977724 m!905479))

(assert (=> b!977724 m!905199))

(assert (=> b!977724 m!905181))

(assert (=> b!977724 m!905245))

(assert (=> b!977724 m!905245))

(assert (=> b!977724 m!905181))

(assert (=> b!977724 m!905247))

(declare-fun m!905481 () Bool)

(assert (=> d!116873 m!905481))

(assert (=> d!116873 m!905047))

(assert (=> b!977728 m!905199))

(assert (=> b!977728 m!905199))

(assert (=> b!977728 m!905201))

(declare-fun m!905483 () Bool)

(assert (=> b!977725 m!905483))

(assert (=> b!977725 m!905199))

(assert (=> b!977725 m!905181))

(declare-fun m!905485 () Bool)

(assert (=> b!977725 m!905485))

(declare-fun m!905487 () Bool)

(assert (=> b!977725 m!905487))

(declare-fun m!905489 () Bool)

(assert (=> b!977725 m!905489))

(assert (=> b!977725 m!905245))

(assert (=> b!977725 m!905487))

(assert (=> b!977725 m!905245))

(assert (=> b!977725 m!905181))

(assert (=> b!977725 m!905247))

(assert (=> b!977584 d!116873))

(declare-fun b!977734 () Bool)

(declare-fun e!551104 () Bool)

(declare-fun call!41826 () Bool)

(assert (=> b!977734 (= e!551104 call!41826)))

(declare-fun d!116875 () Bool)

(declare-fun res!654230 () Bool)

(declare-fun e!551101 () Bool)

(assert (=> d!116875 (=> res!654230 e!551101)))

(assert (=> d!116875 (= res!654230 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(assert (=> d!116875 (= (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100220 (Cons!20357 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) Nil!20358) Nil!20358)) e!551101)))

(declare-fun b!977735 () Bool)

(assert (=> b!977735 (= e!551104 call!41826)))

(declare-fun b!977736 () Bool)

(declare-fun e!551102 () Bool)

(assert (=> b!977736 (= e!551101 e!551102)))

(declare-fun res!654229 () Bool)

(assert (=> b!977736 (=> (not res!654229) (not e!551102))))

(declare-fun e!551103 () Bool)

(assert (=> b!977736 (= res!654229 (not e!551103))))

(declare-fun res!654228 () Bool)

(assert (=> b!977736 (=> (not res!654228) (not e!551103))))

(assert (=> b!977736 (= res!654228 (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!977737 () Bool)

(assert (=> b!977737 (= e!551102 e!551104)))

(declare-fun c!100279 () Bool)

(assert (=> b!977737 (= c!100279 (validKeyInArray!0 (select (arr!29346 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!977738 () Bool)

(assert (=> b!977738 (= e!551103 (contains!5724 (ite c!100220 (Cons!20357 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) Nil!20358) Nil!20358) (select (arr!29346 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!41823 () Bool)

(assert (=> bm!41823 (= call!41826 (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100279 (Cons!20357 (select (arr!29346 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100220 (Cons!20357 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) Nil!20358) Nil!20358)) (ite c!100220 (Cons!20357 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) Nil!20358) Nil!20358))))))

(assert (= (and d!116875 (not res!654230)) b!977736))

(assert (= (and b!977736 res!654228) b!977738))

(assert (= (and b!977736 res!654229) b!977737))

(assert (= (and b!977737 c!100279) b!977735))

(assert (= (and b!977737 (not c!100279)) b!977734))

(assert (= (or b!977735 b!977734) bm!41823))

(assert (=> b!977736 m!905355))

(assert (=> b!977736 m!905355))

(assert (=> b!977736 m!905363))

(assert (=> b!977737 m!905355))

(assert (=> b!977737 m!905355))

(assert (=> b!977737 m!905363))

(assert (=> b!977738 m!905355))

(assert (=> b!977738 m!905355))

(declare-fun m!905491 () Bool)

(assert (=> b!977738 m!905491))

(assert (=> bm!41823 m!905355))

(declare-fun m!905493 () Bool)

(assert (=> bm!41823 m!905493))

(assert (=> bm!41789 d!116875))

(declare-fun d!116877 () Bool)

(assert (=> d!116877 (= (validKeyInArray!0 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)) (and (not (= (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!977487 d!116877))

(declare-fun d!116879 () Bool)

(assert (=> d!116879 (= (apply!899 lt!433611 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15218 (getValueByKey!507 (toList!6624 lt!433611) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27647 () Bool)

(assert (= bs!27647 d!116879))

(assert (=> bs!27647 m!905307))

(assert (=> bs!27647 m!905307))

(declare-fun m!905495 () Bool)

(assert (=> bs!27647 m!905495))

(assert (=> b!977583 d!116879))

(assert (=> bm!41816 d!116873))

(declare-fun d!116881 () Bool)

(declare-fun lt!433717 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!416 (List!20361) (InoxSet (_ BitVec 64)))

(assert (=> d!116881 (= lt!433717 (select (content!416 Nil!20358) (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun e!551110 () Bool)

(assert (=> d!116881 (= lt!433717 e!551110)))

(declare-fun res!654235 () Bool)

(assert (=> d!116881 (=> (not res!654235) (not e!551110))))

(assert (=> d!116881 (= res!654235 ((_ is Cons!20357) Nil!20358))))

(assert (=> d!116881 (= (contains!5724 Nil!20358 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)) lt!433717)))

(declare-fun b!977743 () Bool)

(declare-fun e!551109 () Bool)

(assert (=> b!977743 (= e!551110 e!551109)))

(declare-fun res!654236 () Bool)

(assert (=> b!977743 (=> res!654236 e!551109)))

(assert (=> b!977743 (= res!654236 (= (h!21525 Nil!20358) (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!977744 () Bool)

(assert (=> b!977744 (= e!551109 (contains!5724 (t!28866 Nil!20358) (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)))))

(assert (= (and d!116881 res!654235) b!977743))

(assert (= (and b!977743 (not res!654236)) b!977744))

(declare-fun m!905497 () Bool)

(assert (=> d!116881 m!905497))

(assert (=> d!116881 m!905111))

(declare-fun m!905499 () Bool)

(assert (=> d!116881 m!905499))

(assert (=> b!977744 m!905111))

(declare-fun m!905501 () Bool)

(assert (=> b!977744 m!905501))

(assert (=> b!977512 d!116881))

(assert (=> b!977511 d!116877))

(declare-fun d!116883 () Bool)

(assert (=> d!116883 (arrayContainsKey!0 _keys!1717 lt!433515 #b00000000000000000000000000000000)))

(declare-fun lt!433720 () Unit!32444)

(declare-fun choose!13 (array!60974 (_ BitVec 64) (_ BitVec 32)) Unit!32444)

(assert (=> d!116883 (= lt!433720 (choose!13 _keys!1717 lt!433515 #b00000000000000000000000000000000))))

(assert (=> d!116883 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!116883 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!433515 #b00000000000000000000000000000000) lt!433720)))

(declare-fun bs!27648 () Bool)

(assert (= bs!27648 d!116883))

(assert (=> bs!27648 m!905115))

(declare-fun m!905503 () Bool)

(assert (=> bs!27648 m!905503))

(assert (=> b!977485 d!116883))

(declare-fun d!116885 () Bool)

(declare-fun res!654241 () Bool)

(declare-fun e!551115 () Bool)

(assert (=> d!116885 (=> res!654241 e!551115)))

(assert (=> d!116885 (= res!654241 (= (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) lt!433515))))

(assert (=> d!116885 (= (arrayContainsKey!0 _keys!1717 lt!433515 #b00000000000000000000000000000000) e!551115)))

(declare-fun b!977749 () Bool)

(declare-fun e!551116 () Bool)

(assert (=> b!977749 (= e!551115 e!551116)))

(declare-fun res!654242 () Bool)

(assert (=> b!977749 (=> (not res!654242) (not e!551116))))

(assert (=> b!977749 (= res!654242 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29826 _keys!1717)))))

(declare-fun b!977750 () Bool)

(assert (=> b!977750 (= e!551116 (arrayContainsKey!0 _keys!1717 lt!433515 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!116885 (not res!654241)) b!977749))

(assert (= (and b!977749 res!654242) b!977750))

(assert (=> d!116885 m!905111))

(declare-fun m!905505 () Bool)

(assert (=> b!977750 m!905505))

(assert (=> b!977485 d!116885))

(declare-fun d!116887 () Bool)

(declare-fun lt!433727 () SeekEntryResult!9156)

(assert (=> d!116887 (and (or ((_ is Undefined!9156) lt!433727) (not ((_ is Found!9156) lt!433727)) (and (bvsge (index!38996 lt!433727) #b00000000000000000000000000000000) (bvslt (index!38996 lt!433727) (size!29826 _keys!1717)))) (or ((_ is Undefined!9156) lt!433727) ((_ is Found!9156) lt!433727) (not ((_ is MissingZero!9156) lt!433727)) (and (bvsge (index!38995 lt!433727) #b00000000000000000000000000000000) (bvslt (index!38995 lt!433727) (size!29826 _keys!1717)))) (or ((_ is Undefined!9156) lt!433727) ((_ is Found!9156) lt!433727) ((_ is MissingZero!9156) lt!433727) (not ((_ is MissingVacant!9156) lt!433727)) (and (bvsge (index!38998 lt!433727) #b00000000000000000000000000000000) (bvslt (index!38998 lt!433727) (size!29826 _keys!1717)))) (or ((_ is Undefined!9156) lt!433727) (ite ((_ is Found!9156) lt!433727) (= (select (arr!29346 _keys!1717) (index!38996 lt!433727)) (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9156) lt!433727) (= (select (arr!29346 _keys!1717) (index!38995 lt!433727)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9156) lt!433727) (= (select (arr!29346 _keys!1717) (index!38998 lt!433727)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!551125 () SeekEntryResult!9156)

(assert (=> d!116887 (= lt!433727 e!551125)))

(declare-fun c!100286 () Bool)

(declare-fun lt!433728 () SeekEntryResult!9156)

(assert (=> d!116887 (= c!100286 (and ((_ is Intermediate!9156) lt!433728) (undefined!9968 lt!433728)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!60974 (_ BitVec 32)) SeekEntryResult!9156)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!116887 (= lt!433728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) mask!2147) (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147))))

(assert (=> d!116887 (validMask!0 mask!2147)))

(assert (=> d!116887 (= (seekEntryOrOpen!0 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) lt!433727)))

(declare-fun b!977763 () Bool)

(declare-fun e!551123 () SeekEntryResult!9156)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!60974 (_ BitVec 32)) SeekEntryResult!9156)

(assert (=> b!977763 (= e!551123 (seekKeyOrZeroReturnVacant!0 (x!84468 lt!433728) (index!38997 lt!433728) (index!38997 lt!433728) (select (arr!29346 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147))))

(declare-fun b!977764 () Bool)

(assert (=> b!977764 (= e!551125 Undefined!9156)))

(declare-fun b!977765 () Bool)

(declare-fun e!551124 () SeekEntryResult!9156)

(assert (=> b!977765 (= e!551125 e!551124)))

(declare-fun lt!433729 () (_ BitVec 64))

(assert (=> b!977765 (= lt!433729 (select (arr!29346 _keys!1717) (index!38997 lt!433728)))))

(declare-fun c!100288 () Bool)

(assert (=> b!977765 (= c!100288 (= lt!433729 (select (arr!29346 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!977766 () Bool)

(assert (=> b!977766 (= e!551123 (MissingZero!9156 (index!38997 lt!433728)))))

(declare-fun b!977767 () Bool)

(declare-fun c!100287 () Bool)

(assert (=> b!977767 (= c!100287 (= lt!433729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!977767 (= e!551124 e!551123)))

(declare-fun b!977768 () Bool)

(assert (=> b!977768 (= e!551124 (Found!9156 (index!38997 lt!433728)))))

(assert (= (and d!116887 c!100286) b!977764))

(assert (= (and d!116887 (not c!100286)) b!977765))

(assert (= (and b!977765 c!100288) b!977768))

(assert (= (and b!977765 (not c!100288)) b!977767))

(assert (= (and b!977767 c!100287) b!977766))

(assert (= (and b!977767 (not c!100287)) b!977763))

(declare-fun m!905507 () Bool)

(assert (=> d!116887 m!905507))

(assert (=> d!116887 m!905111))

(declare-fun m!905509 () Bool)

(assert (=> d!116887 m!905509))

(declare-fun m!905511 () Bool)

(assert (=> d!116887 m!905511))

(declare-fun m!905513 () Bool)

(assert (=> d!116887 m!905513))

(assert (=> d!116887 m!905111))

(assert (=> d!116887 m!905507))

(declare-fun m!905515 () Bool)

(assert (=> d!116887 m!905515))

(assert (=> d!116887 m!905047))

(assert (=> b!977763 m!905111))

(declare-fun m!905517 () Bool)

(assert (=> b!977763 m!905517))

(declare-fun m!905519 () Bool)

(assert (=> b!977765 m!905519))

(assert (=> b!977485 d!116887))

(declare-fun d!116889 () Bool)

(declare-fun e!551127 () Bool)

(assert (=> d!116889 e!551127))

(declare-fun res!654243 () Bool)

(assert (=> d!116889 (=> res!654243 e!551127)))

(declare-fun lt!433733 () Bool)

(assert (=> d!116889 (= res!654243 (not lt!433733))))

(declare-fun lt!433731 () Bool)

(assert (=> d!116889 (= lt!433733 lt!433731)))

(declare-fun lt!433730 () Unit!32444)

(declare-fun e!551126 () Unit!32444)

(assert (=> d!116889 (= lt!433730 e!551126)))

(declare-fun c!100289 () Bool)

(assert (=> d!116889 (= c!100289 lt!433731)))

(assert (=> d!116889 (= lt!433731 (containsKey!478 (toList!6624 lt!433611) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116889 (= (contains!5722 lt!433611 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433733)))

(declare-fun b!977769 () Bool)

(declare-fun lt!433732 () Unit!32444)

(assert (=> b!977769 (= e!551126 lt!433732)))

(assert (=> b!977769 (= lt!433732 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 lt!433611) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!977769 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433611) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977770 () Bool)

(declare-fun Unit!32455 () Unit!32444)

(assert (=> b!977770 (= e!551126 Unit!32455)))

(declare-fun b!977771 () Bool)

(assert (=> b!977771 (= e!551127 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116889 c!100289) b!977769))

(assert (= (and d!116889 (not c!100289)) b!977770))

(assert (= (and d!116889 (not res!654243)) b!977771))

(declare-fun m!905521 () Bool)

(assert (=> d!116889 m!905521))

(declare-fun m!905523 () Bool)

(assert (=> b!977769 m!905523))

(assert (=> b!977769 m!905337))

(assert (=> b!977769 m!905337))

(declare-fun m!905525 () Bool)

(assert (=> b!977769 m!905525))

(assert (=> b!977771 m!905337))

(assert (=> b!977771 m!905337))

(assert (=> b!977771 m!905525))

(assert (=> bm!41815 d!116889))

(declare-fun d!116891 () Bool)

(assert (=> d!116891 (= (apply!899 lt!433585 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15218 (getValueByKey!507 (toList!6624 lt!433585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27649 () Bool)

(assert (= bs!27649 d!116891))

(assert (=> bs!27649 m!905287))

(assert (=> bs!27649 m!905287))

(declare-fun m!905527 () Bool)

(assert (=> bs!27649 m!905527))

(assert (=> b!977561 d!116891))

(assert (=> b!977510 d!116877))

(declare-fun d!116893 () Bool)

(declare-fun e!551128 () Bool)

(assert (=> d!116893 e!551128))

(declare-fun res!654245 () Bool)

(assert (=> d!116893 (=> (not res!654245) (not e!551128))))

(declare-fun lt!433736 () ListLongMap!13217)

(assert (=> d!116893 (= res!654245 (contains!5722 lt!433736 (_1!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun lt!433735 () List!20360)

(assert (=> d!116893 (= lt!433736 (ListLongMap!13218 lt!433735))))

(declare-fun lt!433737 () Unit!32444)

(declare-fun lt!433734 () Unit!32444)

(assert (=> d!116893 (= lt!433737 lt!433734)))

(assert (=> d!116893 (= (getValueByKey!507 lt!433735 (_1!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!512 (_2!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116893 (= lt!433734 (lemmaContainsTupThenGetReturnValue!269 lt!433735 (_1!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116893 (= lt!433735 (insertStrictlySorted!326 (toList!6624 (ite c!100243 call!41815 (ite c!100241 call!41818 call!41814))) (_1!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116893 (= (+!2940 (ite c!100243 call!41815 (ite c!100241 call!41818 call!41814)) (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) lt!433736)))

(declare-fun b!977772 () Bool)

(declare-fun res!654244 () Bool)

(assert (=> b!977772 (=> (not res!654244) (not e!551128))))

(assert (=> b!977772 (= res!654244 (= (getValueByKey!507 (toList!6624 lt!433736) (_1!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!512 (_2!7270 (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))))

(declare-fun b!977773 () Bool)

(assert (=> b!977773 (= e!551128 (contains!5725 (toList!6624 lt!433736) (ite (or c!100243 c!100241) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (= (and d!116893 res!654245) b!977772))

(assert (= (and b!977772 res!654244) b!977773))

(declare-fun m!905529 () Bool)

(assert (=> d!116893 m!905529))

(declare-fun m!905531 () Bool)

(assert (=> d!116893 m!905531))

(declare-fun m!905533 () Bool)

(assert (=> d!116893 m!905533))

(declare-fun m!905535 () Bool)

(assert (=> d!116893 m!905535))

(declare-fun m!905537 () Bool)

(assert (=> b!977772 m!905537))

(declare-fun m!905539 () Bool)

(assert (=> b!977773 m!905539))

(assert (=> bm!41814 d!116893))

(declare-fun d!116895 () Bool)

(declare-fun e!551130 () Bool)

(assert (=> d!116895 e!551130))

(declare-fun res!654246 () Bool)

(assert (=> d!116895 (=> res!654246 e!551130)))

(declare-fun lt!433741 () Bool)

(assert (=> d!116895 (= res!654246 (not lt!433741))))

(declare-fun lt!433739 () Bool)

(assert (=> d!116895 (= lt!433741 lt!433739)))

(declare-fun lt!433738 () Unit!32444)

(declare-fun e!551129 () Unit!32444)

(assert (=> d!116895 (= lt!433738 e!551129)))

(declare-fun c!100290 () Bool)

(assert (=> d!116895 (= c!100290 lt!433739)))

(assert (=> d!116895 (= lt!433739 (containsKey!478 (toList!6624 lt!433611) (select (arr!29346 _keys!1717) from!2118)))))

(assert (=> d!116895 (= (contains!5722 lt!433611 (select (arr!29346 _keys!1717) from!2118)) lt!433741)))

(declare-fun b!977774 () Bool)

(declare-fun lt!433740 () Unit!32444)

(assert (=> b!977774 (= e!551129 lt!433740)))

(assert (=> b!977774 (= lt!433740 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 lt!433611) (select (arr!29346 _keys!1717) from!2118)))))

(assert (=> b!977774 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433611) (select (arr!29346 _keys!1717) from!2118)))))

(declare-fun b!977775 () Bool)

(declare-fun Unit!32456 () Unit!32444)

(assert (=> b!977775 (= e!551129 Unit!32456)))

(declare-fun b!977776 () Bool)

(assert (=> b!977776 (= e!551130 (isDefined!380 (getValueByKey!507 (toList!6624 lt!433611) (select (arr!29346 _keys!1717) from!2118))))))

(assert (= (and d!116895 c!100290) b!977774))

(assert (= (and d!116895 (not c!100290)) b!977775))

(assert (= (and d!116895 (not res!654246)) b!977776))

(assert (=> d!116895 m!905199))

(declare-fun m!905541 () Bool)

(assert (=> d!116895 m!905541))

(assert (=> b!977774 m!905199))

(declare-fun m!905543 () Bool)

(assert (=> b!977774 m!905543))

(assert (=> b!977774 m!905199))

(assert (=> b!977774 m!905367))

(assert (=> b!977774 m!905367))

(declare-fun m!905545 () Bool)

(assert (=> b!977774 m!905545))

(assert (=> b!977776 m!905199))

(assert (=> b!977776 m!905367))

(assert (=> b!977776 m!905367))

(assert (=> b!977776 m!905545))

(assert (=> b!977597 d!116895))

(declare-fun d!116897 () Bool)

(assert (=> d!116897 (= (apply!899 lt!433585 (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15218 (getValueByKey!507 (toList!6624 lt!433585) (select (arr!29346 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun bs!27650 () Bool)

(assert (= bs!27650 d!116897))

(assert (=> bs!27650 m!905031))

(assert (=> bs!27650 m!905317))

(assert (=> bs!27650 m!905317))

(declare-fun m!905547 () Bool)

(assert (=> bs!27650 m!905547))

(assert (=> b!977559 d!116897))

(declare-fun d!116899 () Bool)

(declare-fun c!100291 () Bool)

(assert (=> d!116899 (= c!100291 ((_ is ValueCellFull!10745) (select (arr!29345 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun e!551131 () V!34921)

(assert (=> d!116899 (= (get!15217 (select (arr!29345 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)) e!551131)))

(declare-fun b!977777 () Bool)

(assert (=> b!977777 (= e!551131 (get!15219 (select (arr!29345 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!977778 () Bool)

(assert (=> b!977778 (= e!551131 (get!15220 (select (arr!29345 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1737 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116899 c!100291) b!977777))

(assert (= (and d!116899 (not c!100291)) b!977778))

(assert (=> b!977777 m!905179))

(assert (=> b!977777 m!905181))

(declare-fun m!905549 () Bool)

(assert (=> b!977777 m!905549))

(assert (=> b!977778 m!905179))

(assert (=> b!977778 m!905181))

(declare-fun m!905551 () Bool)

(assert (=> b!977778 m!905551))

(assert (=> b!977559 d!116899))

(declare-fun d!116901 () Bool)

(assert (=> d!116901 (= (apply!899 lt!433574 lt!433592) (get!15218 (getValueByKey!507 (toList!6624 lt!433574) lt!433592)))))

(declare-fun bs!27651 () Bool)

(assert (= bs!27651 d!116901))

(declare-fun m!905553 () Bool)

(assert (=> bs!27651 m!905553))

(assert (=> bs!27651 m!905553))

(declare-fun m!905555 () Bool)

(assert (=> bs!27651 m!905555))

(assert (=> b!977558 d!116901))

(declare-fun d!116903 () Bool)

(assert (=> d!116903 (= (apply!899 lt!433584 lt!433590) (get!15218 (getValueByKey!507 (toList!6624 lt!433584) lt!433590)))))

(declare-fun bs!27652 () Bool)

(assert (= bs!27652 d!116903))

(declare-fun m!905557 () Bool)

(assert (=> bs!27652 m!905557))

(assert (=> bs!27652 m!905557))

(declare-fun m!905559 () Bool)

(assert (=> bs!27652 m!905559))

(assert (=> b!977558 d!116903))

(declare-fun d!116905 () Bool)

(assert (=> d!116905 (= (apply!899 lt!433577 lt!433589) (get!15218 (getValueByKey!507 (toList!6624 lt!433577) lt!433589)))))

(declare-fun bs!27653 () Bool)

(assert (= bs!27653 d!116905))

(declare-fun m!905561 () Bool)

(assert (=> bs!27653 m!905561))

(assert (=> bs!27653 m!905561))

(declare-fun m!905563 () Bool)

(assert (=> bs!27653 m!905563))

(assert (=> b!977558 d!116905))

(declare-fun d!116907 () Bool)

(assert (=> d!116907 (= (apply!899 (+!2940 lt!433577 (tuple2!14519 lt!433576 zeroValue!1367)) lt!433589) (get!15218 (getValueByKey!507 (toList!6624 (+!2940 lt!433577 (tuple2!14519 lt!433576 zeroValue!1367))) lt!433589)))))

(declare-fun bs!27654 () Bool)

(assert (= bs!27654 d!116907))

(declare-fun m!905565 () Bool)

(assert (=> bs!27654 m!905565))

(assert (=> bs!27654 m!905565))

(declare-fun m!905567 () Bool)

(assert (=> bs!27654 m!905567))

(assert (=> b!977558 d!116907))

(declare-fun d!116909 () Bool)

(declare-fun e!551133 () Bool)

(assert (=> d!116909 e!551133))

(declare-fun res!654247 () Bool)

(assert (=> d!116909 (=> res!654247 e!551133)))

(declare-fun lt!433745 () Bool)

(assert (=> d!116909 (= res!654247 (not lt!433745))))

(declare-fun lt!433743 () Bool)

(assert (=> d!116909 (= lt!433745 lt!433743)))

(declare-fun lt!433742 () Unit!32444)

(declare-fun e!551132 () Unit!32444)

(assert (=> d!116909 (= lt!433742 e!551132)))

(declare-fun c!100292 () Bool)

(assert (=> d!116909 (= c!100292 lt!433743)))

(assert (=> d!116909 (= lt!433743 (containsKey!478 (toList!6624 (+!2940 lt!433572 (tuple2!14519 lt!433583 zeroValue!1367))) lt!433586))))

(assert (=> d!116909 (= (contains!5722 (+!2940 lt!433572 (tuple2!14519 lt!433583 zeroValue!1367)) lt!433586) lt!433745)))

(declare-fun b!977779 () Bool)

(declare-fun lt!433744 () Unit!32444)

(assert (=> b!977779 (= e!551132 lt!433744)))

(assert (=> b!977779 (= lt!433744 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6624 (+!2940 lt!433572 (tuple2!14519 lt!433583 zeroValue!1367))) lt!433586))))

(assert (=> b!977779 (isDefined!380 (getValueByKey!507 (toList!6624 (+!2940 lt!433572 (tuple2!14519 lt!433583 zeroValue!1367))) lt!433586))))

(declare-fun b!977780 () Bool)

(declare-fun Unit!32457 () Unit!32444)

(assert (=> b!977780 (= e!551132 Unit!32457)))

(declare-fun b!977781 () Bool)

(assert (=> b!977781 (= e!551133 (isDefined!380 (getValueByKey!507 (toList!6624 (+!2940 lt!433572 (tuple2!14519 lt!433583 zeroValue!1367))) lt!433586)))))

(assert (= (and d!116909 c!100292) b!977779))

(assert (= (and d!116909 (not c!100292)) b!977780))

(assert (= (and d!116909 (not res!654247)) b!977781))

(declare-fun m!905569 () Bool)

(assert (=> d!116909 m!905569))

(declare-fun m!905571 () Bool)

(assert (=> b!977779 m!905571))

(declare-fun m!905573 () Bool)

(assert (=> b!977779 m!905573))

(assert (=> b!977779 m!905573))

(declare-fun m!905575 () Bool)

(assert (=> b!977779 m!905575))

(assert (=> b!977781 m!905573))

(assert (=> b!977781 m!905573))

(assert (=> b!977781 m!905575))

(assert (=> b!977558 d!116909))

(declare-fun d!116911 () Bool)

(declare-fun e!551134 () Bool)

(assert (=> d!116911 e!551134))

(declare-fun res!654249 () Bool)

(assert (=> d!116911 (=> (not res!654249) (not e!551134))))

(declare-fun lt!433748 () ListLongMap!13217)

(assert (=> d!116911 (= res!654249 (contains!5722 lt!433748 (_1!7270 (tuple2!14519 lt!433580 minValue!1367))))))

(declare-fun lt!433747 () List!20360)

(assert (=> d!116911 (= lt!433748 (ListLongMap!13218 lt!433747))))

(declare-fun lt!433749 () Unit!32444)

(declare-fun lt!433746 () Unit!32444)

(assert (=> d!116911 (= lt!433749 lt!433746)))

(assert (=> d!116911 (= (getValueByKey!507 lt!433747 (_1!7270 (tuple2!14519 lt!433580 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433580 minValue!1367))))))

(assert (=> d!116911 (= lt!433746 (lemmaContainsTupThenGetReturnValue!269 lt!433747 (_1!7270 (tuple2!14519 lt!433580 minValue!1367)) (_2!7270 (tuple2!14519 lt!433580 minValue!1367))))))

(assert (=> d!116911 (= lt!433747 (insertStrictlySorted!326 (toList!6624 lt!433584) (_1!7270 (tuple2!14519 lt!433580 minValue!1367)) (_2!7270 (tuple2!14519 lt!433580 minValue!1367))))))

(assert (=> d!116911 (= (+!2940 lt!433584 (tuple2!14519 lt!433580 minValue!1367)) lt!433748)))

(declare-fun b!977782 () Bool)

(declare-fun res!654248 () Bool)

(assert (=> b!977782 (=> (not res!654248) (not e!551134))))

(assert (=> b!977782 (= res!654248 (= (getValueByKey!507 (toList!6624 lt!433748) (_1!7270 (tuple2!14519 lt!433580 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433580 minValue!1367)))))))

(declare-fun b!977783 () Bool)

(assert (=> b!977783 (= e!551134 (contains!5725 (toList!6624 lt!433748) (tuple2!14519 lt!433580 minValue!1367)))))

(assert (= (and d!116911 res!654249) b!977782))

(assert (= (and b!977782 res!654248) b!977783))

(declare-fun m!905577 () Bool)

(assert (=> d!116911 m!905577))

(declare-fun m!905579 () Bool)

(assert (=> d!116911 m!905579))

(declare-fun m!905581 () Bool)

(assert (=> d!116911 m!905581))

(declare-fun m!905583 () Bool)

(assert (=> d!116911 m!905583))

(declare-fun m!905585 () Bool)

(assert (=> b!977782 m!905585))

(declare-fun m!905587 () Bool)

(assert (=> b!977783 m!905587))

(assert (=> b!977558 d!116911))

(declare-fun d!116913 () Bool)

(assert (=> d!116913 (= (apply!899 (+!2940 lt!433574 (tuple2!14519 lt!433579 minValue!1367)) lt!433592) (apply!899 lt!433574 lt!433592))))

(declare-fun lt!433750 () Unit!32444)

(assert (=> d!116913 (= lt!433750 (choose!1608 lt!433574 lt!433579 minValue!1367 lt!433592))))

(declare-fun e!551135 () Bool)

(assert (=> d!116913 e!551135))

(declare-fun res!654250 () Bool)

(assert (=> d!116913 (=> (not res!654250) (not e!551135))))

(assert (=> d!116913 (= res!654250 (contains!5722 lt!433574 lt!433592))))

(assert (=> d!116913 (= (addApplyDifferent!469 lt!433574 lt!433579 minValue!1367 lt!433592) lt!433750)))

(declare-fun b!977784 () Bool)

(assert (=> b!977784 (= e!551135 (not (= lt!433592 lt!433579)))))

(assert (= (and d!116913 res!654250) b!977784))

(assert (=> d!116913 m!905149))

(assert (=> d!116913 m!905151))

(assert (=> d!116913 m!905149))

(declare-fun m!905589 () Bool)

(assert (=> d!116913 m!905589))

(assert (=> d!116913 m!905141))

(declare-fun m!905591 () Bool)

(assert (=> d!116913 m!905591))

(assert (=> b!977558 d!116913))

(declare-fun d!116915 () Bool)

(assert (=> d!116915 (contains!5722 (+!2940 lt!433572 (tuple2!14519 lt!433583 zeroValue!1367)) lt!433586)))

(declare-fun lt!433751 () Unit!32444)

(assert (=> d!116915 (= lt!433751 (choose!1609 lt!433572 lt!433583 zeroValue!1367 lt!433586))))

(assert (=> d!116915 (contains!5722 lt!433572 lt!433586)))

(assert (=> d!116915 (= (addStillContains!613 lt!433572 lt!433583 zeroValue!1367 lt!433586) lt!433751)))

(declare-fun bs!27655 () Bool)

(assert (= bs!27655 d!116915))

(assert (=> bs!27655 m!905145))

(assert (=> bs!27655 m!905145))

(assert (=> bs!27655 m!905147))

(declare-fun m!905593 () Bool)

(assert (=> bs!27655 m!905593))

(declare-fun m!905595 () Bool)

(assert (=> bs!27655 m!905595))

(assert (=> b!977558 d!116915))

(declare-fun d!116917 () Bool)

(declare-fun e!551136 () Bool)

(assert (=> d!116917 e!551136))

(declare-fun res!654252 () Bool)

(assert (=> d!116917 (=> (not res!654252) (not e!551136))))

(declare-fun lt!433754 () ListLongMap!13217)

(assert (=> d!116917 (= res!654252 (contains!5722 lt!433754 (_1!7270 (tuple2!14519 lt!433576 zeroValue!1367))))))

(declare-fun lt!433753 () List!20360)

(assert (=> d!116917 (= lt!433754 (ListLongMap!13218 lt!433753))))

(declare-fun lt!433755 () Unit!32444)

(declare-fun lt!433752 () Unit!32444)

(assert (=> d!116917 (= lt!433755 lt!433752)))

(assert (=> d!116917 (= (getValueByKey!507 lt!433753 (_1!7270 (tuple2!14519 lt!433576 zeroValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433576 zeroValue!1367))))))

(assert (=> d!116917 (= lt!433752 (lemmaContainsTupThenGetReturnValue!269 lt!433753 (_1!7270 (tuple2!14519 lt!433576 zeroValue!1367)) (_2!7270 (tuple2!14519 lt!433576 zeroValue!1367))))))

(assert (=> d!116917 (= lt!433753 (insertStrictlySorted!326 (toList!6624 lt!433577) (_1!7270 (tuple2!14519 lt!433576 zeroValue!1367)) (_2!7270 (tuple2!14519 lt!433576 zeroValue!1367))))))

(assert (=> d!116917 (= (+!2940 lt!433577 (tuple2!14519 lt!433576 zeroValue!1367)) lt!433754)))

(declare-fun b!977785 () Bool)

(declare-fun res!654251 () Bool)

(assert (=> b!977785 (=> (not res!654251) (not e!551136))))

(assert (=> b!977785 (= res!654251 (= (getValueByKey!507 (toList!6624 lt!433754) (_1!7270 (tuple2!14519 lt!433576 zeroValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433576 zeroValue!1367)))))))

(declare-fun b!977786 () Bool)

(assert (=> b!977786 (= e!551136 (contains!5725 (toList!6624 lt!433754) (tuple2!14519 lt!433576 zeroValue!1367)))))

(assert (= (and d!116917 res!654252) b!977785))

(assert (= (and b!977785 res!654251) b!977786))

(declare-fun m!905597 () Bool)

(assert (=> d!116917 m!905597))

(declare-fun m!905599 () Bool)

(assert (=> d!116917 m!905599))

(declare-fun m!905601 () Bool)

(assert (=> d!116917 m!905601))

(declare-fun m!905603 () Bool)

(assert (=> d!116917 m!905603))

(declare-fun m!905605 () Bool)

(assert (=> b!977785 m!905605))

(declare-fun m!905607 () Bool)

(assert (=> b!977786 m!905607))

(assert (=> b!977558 d!116917))

(declare-fun d!116919 () Bool)

(declare-fun e!551137 () Bool)

(assert (=> d!116919 e!551137))

(declare-fun res!654254 () Bool)

(assert (=> d!116919 (=> (not res!654254) (not e!551137))))

(declare-fun lt!433758 () ListLongMap!13217)

(assert (=> d!116919 (= res!654254 (contains!5722 lt!433758 (_1!7270 (tuple2!14519 lt!433583 zeroValue!1367))))))

(declare-fun lt!433757 () List!20360)

(assert (=> d!116919 (= lt!433758 (ListLongMap!13218 lt!433757))))

(declare-fun lt!433759 () Unit!32444)

(declare-fun lt!433756 () Unit!32444)

(assert (=> d!116919 (= lt!433759 lt!433756)))

(assert (=> d!116919 (= (getValueByKey!507 lt!433757 (_1!7270 (tuple2!14519 lt!433583 zeroValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433583 zeroValue!1367))))))

(assert (=> d!116919 (= lt!433756 (lemmaContainsTupThenGetReturnValue!269 lt!433757 (_1!7270 (tuple2!14519 lt!433583 zeroValue!1367)) (_2!7270 (tuple2!14519 lt!433583 zeroValue!1367))))))

(assert (=> d!116919 (= lt!433757 (insertStrictlySorted!326 (toList!6624 lt!433572) (_1!7270 (tuple2!14519 lt!433583 zeroValue!1367)) (_2!7270 (tuple2!14519 lt!433583 zeroValue!1367))))))

(assert (=> d!116919 (= (+!2940 lt!433572 (tuple2!14519 lt!433583 zeroValue!1367)) lt!433758)))

(declare-fun b!977787 () Bool)

(declare-fun res!654253 () Bool)

(assert (=> b!977787 (=> (not res!654253) (not e!551137))))

(assert (=> b!977787 (= res!654253 (= (getValueByKey!507 (toList!6624 lt!433758) (_1!7270 (tuple2!14519 lt!433583 zeroValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433583 zeroValue!1367)))))))

(declare-fun b!977788 () Bool)

(assert (=> b!977788 (= e!551137 (contains!5725 (toList!6624 lt!433758) (tuple2!14519 lt!433583 zeroValue!1367)))))

(assert (= (and d!116919 res!654254) b!977787))

(assert (= (and b!977787 res!654253) b!977788))

(declare-fun m!905609 () Bool)

(assert (=> d!116919 m!905609))

(declare-fun m!905611 () Bool)

(assert (=> d!116919 m!905611))

(declare-fun m!905613 () Bool)

(assert (=> d!116919 m!905613))

(declare-fun m!905615 () Bool)

(assert (=> d!116919 m!905615))

(declare-fun m!905617 () Bool)

(assert (=> b!977787 m!905617))

(declare-fun m!905619 () Bool)

(assert (=> b!977788 m!905619))

(assert (=> b!977558 d!116919))

(declare-fun d!116921 () Bool)

(assert (=> d!116921 (= (apply!899 (+!2940 lt!433584 (tuple2!14519 lt!433580 minValue!1367)) lt!433590) (apply!899 lt!433584 lt!433590))))

(declare-fun lt!433760 () Unit!32444)

(assert (=> d!116921 (= lt!433760 (choose!1608 lt!433584 lt!433580 minValue!1367 lt!433590))))

(declare-fun e!551138 () Bool)

(assert (=> d!116921 e!551138))

(declare-fun res!654255 () Bool)

(assert (=> d!116921 (=> (not res!654255) (not e!551138))))

(assert (=> d!116921 (= res!654255 (contains!5722 lt!433584 lt!433590))))

(assert (=> d!116921 (= (addApplyDifferent!469 lt!433584 lt!433580 minValue!1367 lt!433590) lt!433760)))

(declare-fun b!977789 () Bool)

(assert (=> b!977789 (= e!551138 (not (= lt!433590 lt!433580)))))

(assert (= (and d!116921 res!654255) b!977789))

(assert (=> d!116921 m!905153))

(assert (=> d!116921 m!905169))

(assert (=> d!116921 m!905153))

(declare-fun m!905621 () Bool)

(assert (=> d!116921 m!905621))

(assert (=> d!116921 m!905163))

(declare-fun m!905623 () Bool)

(assert (=> d!116921 m!905623))

(assert (=> b!977558 d!116921))

(declare-fun d!116923 () Bool)

(assert (=> d!116923 (= (apply!899 (+!2940 lt!433584 (tuple2!14519 lt!433580 minValue!1367)) lt!433590) (get!15218 (getValueByKey!507 (toList!6624 (+!2940 lt!433584 (tuple2!14519 lt!433580 minValue!1367))) lt!433590)))))

(declare-fun bs!27656 () Bool)

(assert (= bs!27656 d!116923))

(declare-fun m!905625 () Bool)

(assert (=> bs!27656 m!905625))

(assert (=> bs!27656 m!905625))

(declare-fun m!905627 () Bool)

(assert (=> bs!27656 m!905627))

(assert (=> b!977558 d!116923))

(declare-fun d!116925 () Bool)

(assert (=> d!116925 (= (apply!899 (+!2940 lt!433577 (tuple2!14519 lt!433576 zeroValue!1367)) lt!433589) (apply!899 lt!433577 lt!433589))))

(declare-fun lt!433761 () Unit!32444)

(assert (=> d!116925 (= lt!433761 (choose!1608 lt!433577 lt!433576 zeroValue!1367 lt!433589))))

(declare-fun e!551139 () Bool)

(assert (=> d!116925 e!551139))

(declare-fun res!654256 () Bool)

(assert (=> d!116925 (=> (not res!654256) (not e!551139))))

(assert (=> d!116925 (= res!654256 (contains!5722 lt!433577 lt!433589))))

(assert (=> d!116925 (= (addApplyDifferent!469 lt!433577 lt!433576 zeroValue!1367 lt!433589) lt!433761)))

(declare-fun b!977790 () Bool)

(assert (=> b!977790 (= e!551139 (not (= lt!433589 lt!433576)))))

(assert (= (and d!116925 res!654256) b!977790))

(assert (=> d!116925 m!905155))

(assert (=> d!116925 m!905157))

(assert (=> d!116925 m!905155))

(declare-fun m!905629 () Bool)

(assert (=> d!116925 m!905629))

(assert (=> d!116925 m!905143))

(declare-fun m!905631 () Bool)

(assert (=> d!116925 m!905631))

(assert (=> b!977558 d!116925))

(assert (=> b!977558 d!116809))

(declare-fun d!116927 () Bool)

(assert (=> d!116927 (= (apply!899 (+!2940 lt!433574 (tuple2!14519 lt!433579 minValue!1367)) lt!433592) (get!15218 (getValueByKey!507 (toList!6624 (+!2940 lt!433574 (tuple2!14519 lt!433579 minValue!1367))) lt!433592)))))

(declare-fun bs!27657 () Bool)

(assert (= bs!27657 d!116927))

(declare-fun m!905633 () Bool)

(assert (=> bs!27657 m!905633))

(assert (=> bs!27657 m!905633))

(declare-fun m!905635 () Bool)

(assert (=> bs!27657 m!905635))

(assert (=> b!977558 d!116927))

(declare-fun d!116929 () Bool)

(declare-fun e!551140 () Bool)

(assert (=> d!116929 e!551140))

(declare-fun res!654258 () Bool)

(assert (=> d!116929 (=> (not res!654258) (not e!551140))))

(declare-fun lt!433764 () ListLongMap!13217)

(assert (=> d!116929 (= res!654258 (contains!5722 lt!433764 (_1!7270 (tuple2!14519 lt!433579 minValue!1367))))))

(declare-fun lt!433763 () List!20360)

(assert (=> d!116929 (= lt!433764 (ListLongMap!13218 lt!433763))))

(declare-fun lt!433765 () Unit!32444)

(declare-fun lt!433762 () Unit!32444)

(assert (=> d!116929 (= lt!433765 lt!433762)))

(assert (=> d!116929 (= (getValueByKey!507 lt!433763 (_1!7270 (tuple2!14519 lt!433579 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433579 minValue!1367))))))

(assert (=> d!116929 (= lt!433762 (lemmaContainsTupThenGetReturnValue!269 lt!433763 (_1!7270 (tuple2!14519 lt!433579 minValue!1367)) (_2!7270 (tuple2!14519 lt!433579 minValue!1367))))))

(assert (=> d!116929 (= lt!433763 (insertStrictlySorted!326 (toList!6624 lt!433574) (_1!7270 (tuple2!14519 lt!433579 minValue!1367)) (_2!7270 (tuple2!14519 lt!433579 minValue!1367))))))

(assert (=> d!116929 (= (+!2940 lt!433574 (tuple2!14519 lt!433579 minValue!1367)) lt!433764)))

(declare-fun b!977791 () Bool)

(declare-fun res!654257 () Bool)

(assert (=> b!977791 (=> (not res!654257) (not e!551140))))

(assert (=> b!977791 (= res!654257 (= (getValueByKey!507 (toList!6624 lt!433764) (_1!7270 (tuple2!14519 lt!433579 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 lt!433579 minValue!1367)))))))

(declare-fun b!977792 () Bool)

(assert (=> b!977792 (= e!551140 (contains!5725 (toList!6624 lt!433764) (tuple2!14519 lt!433579 minValue!1367)))))

(assert (= (and d!116929 res!654258) b!977791))

(assert (= (and b!977791 res!654257) b!977792))

(declare-fun m!905637 () Bool)

(assert (=> d!116929 m!905637))

(declare-fun m!905639 () Bool)

(assert (=> d!116929 m!905639))

(declare-fun m!905641 () Bool)

(assert (=> d!116929 m!905641))

(declare-fun m!905643 () Bool)

(assert (=> d!116929 m!905643))

(declare-fun m!905645 () Bool)

(assert (=> b!977791 m!905645))

(declare-fun m!905647 () Bool)

(assert (=> b!977792 m!905647))

(assert (=> b!977558 d!116929))

(assert (=> b!977580 d!116805))

(assert (=> b!977580 d!116807))

(declare-fun d!116931 () Bool)

(declare-fun e!551141 () Bool)

(assert (=> d!116931 e!551141))

(declare-fun res!654260 () Bool)

(assert (=> d!116931 (=> (not res!654260) (not e!551141))))

(declare-fun lt!433768 () ListLongMap!13217)

(assert (=> d!116931 (= res!654260 (contains!5722 lt!433768 (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun lt!433767 () List!20360)

(assert (=> d!116931 (= lt!433768 (ListLongMap!13218 lt!433767))))

(declare-fun lt!433769 () Unit!32444)

(declare-fun lt!433766 () Unit!32444)

(assert (=> d!116931 (= lt!433769 lt!433766)))

(assert (=> d!116931 (= (getValueByKey!507 lt!433767 (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116931 (= lt!433766 (lemmaContainsTupThenGetReturnValue!269 lt!433767 (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116931 (= lt!433767 (insertStrictlySorted!326 (toList!6624 call!41819) (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116931 (= (+!2940 call!41819 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) lt!433768)))

(declare-fun b!977793 () Bool)

(declare-fun res!654259 () Bool)

(assert (=> b!977793 (=> (not res!654259) (not e!551141))))

(assert (=> b!977793 (= res!654259 (= (getValueByKey!507 (toList!6624 lt!433768) (_1!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!512 (_2!7270 (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun b!977794 () Bool)

(assert (=> b!977794 (= e!551141 (contains!5725 (toList!6624 lt!433768) (tuple2!14519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(assert (= (and d!116931 res!654260) b!977793))

(assert (= (and b!977793 res!654259) b!977794))

(declare-fun m!905649 () Bool)

(assert (=> d!116931 m!905649))

(declare-fun m!905651 () Bool)

(assert (=> d!116931 m!905651))

(declare-fun m!905653 () Bool)

(assert (=> d!116931 m!905653))

(declare-fun m!905655 () Bool)

(assert (=> d!116931 m!905655))

(declare-fun m!905657 () Bool)

(assert (=> b!977793 m!905657))

(declare-fun m!905659 () Bool)

(assert (=> b!977794 m!905659))

(assert (=> b!977595 d!116931))

(declare-fun d!116933 () Bool)

(assert (=> d!116933 (= (apply!899 lt!433585 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15218 (getValueByKey!507 (toList!6624 lt!433585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27658 () Bool)

(assert (= bs!27658 d!116933))

(assert (=> bs!27658 m!905347))

(assert (=> bs!27658 m!905347))

(declare-fun m!905661 () Bool)

(assert (=> bs!27658 m!905661))

(assert (=> b!977557 d!116933))

(assert (=> b!977594 d!116811))

(declare-fun b!977796 () Bool)

(declare-fun e!551143 () Bool)

(assert (=> b!977796 (= e!551143 tp_is_empty!22453)))

(declare-fun b!977795 () Bool)

(declare-fun e!551142 () Bool)

(assert (=> b!977795 (= e!551142 tp_is_empty!22453)))

(declare-fun condMapEmpty!35699 () Bool)

(declare-fun mapDefault!35699 () ValueCell!10745)

(assert (=> mapNonEmpty!35698 (= condMapEmpty!35699 (= mapRest!35698 ((as const (Array (_ BitVec 32) ValueCell!10745)) mapDefault!35699)))))

(declare-fun mapRes!35699 () Bool)

(assert (=> mapNonEmpty!35698 (= tp!67951 (and e!551143 mapRes!35699))))

(declare-fun mapIsEmpty!35699 () Bool)

(assert (=> mapIsEmpty!35699 mapRes!35699))

(declare-fun mapNonEmpty!35699 () Bool)

(declare-fun tp!67952 () Bool)

(assert (=> mapNonEmpty!35699 (= mapRes!35699 (and tp!67952 e!551142))))

(declare-fun mapRest!35699 () (Array (_ BitVec 32) ValueCell!10745))

(declare-fun mapKey!35699 () (_ BitVec 32))

(declare-fun mapValue!35699 () ValueCell!10745)

(assert (=> mapNonEmpty!35699 (= mapRest!35698 (store mapRest!35699 mapKey!35699 mapValue!35699))))

(assert (= (and mapNonEmpty!35698 condMapEmpty!35699) mapIsEmpty!35699))

(assert (= (and mapNonEmpty!35698 (not condMapEmpty!35699)) mapNonEmpty!35699))

(assert (= (and mapNonEmpty!35699 ((_ is ValueCellFull!10745) mapValue!35699)) b!977795))

(assert (= (and mapNonEmpty!35698 ((_ is ValueCellFull!10745) mapDefault!35699)) b!977796))

(declare-fun m!905663 () Bool)

(assert (=> mapNonEmpty!35699 m!905663))

(declare-fun b_lambda!14611 () Bool)

(assert (= b_lambda!14605 (or (and start!83730 b_free!19549) b_lambda!14611)))

(declare-fun b_lambda!14613 () Bool)

(assert (= b_lambda!14607 (or (and start!83730 b_free!19549) b_lambda!14613)))

(declare-fun b_lambda!14615 () Bool)

(assert (= b_lambda!14603 (or (and start!83730 b_free!19549) b_lambda!14615)))

(declare-fun b_lambda!14617 () Bool)

(assert (= b_lambda!14609 (or (and start!83730 b_free!19549) b_lambda!14617)))

(check-sat (not d!116829) (not d!116849) (not d!116861) (not d!116839) (not b!977779) (not b!977786) (not b!977782) (not b!977670) (not b!977722) (not mapNonEmpty!35699) (not d!116855) (not d!116857) (not b!977788) (not b!977656) (not b!977771) (not d!116867) (not bm!41823) (not b!977724) (not d!116893) (not d!116865) (not b_lambda!14617) (not b!977679) (not b!977651) (not b!977730) (not d!116803) (not d!116817) (not b_lambda!14601) b_and!31213 (not b!977657) (not b!977692) (not b!977716) (not bm!41820) (not d!116873) (not b!977652) (not d!116927) (not b_lambda!14613) (not b!977776) (not b!977678) (not d!116859) (not b!977696) (not b!977794) (not d!116889) (not b!977703) (not bm!41822) (not b!977672) (not b!977668) (not b!977787) (not d!116815) (not b!977736) (not b!977774) (not b_lambda!14611) (not b!977686) (not b!977773) (not d!116869) (not d!116897) (not d!116871) (not d!116847) (not b!977725) (not d!116825) (not b!977682) (not d!116929) (not d!116903) (not d!116851) (not b!977702) (not b!977655) (not d!116809) (not bm!41821) (not b!977681) (not b!977738) (not b!977683) (not d!116915) (not b!977733) (not b!977720) (not d!116917) (not b!977785) (not d!116919) (not b!977705) (not d!116845) (not b!977777) (not b!977623) (not d!116895) (not d!116863) (not b!977769) (not d!116909) (not b!977750) (not d!116833) (not b!977689) (not d!116879) (not d!116907) (not b!977783) (not b!977694) (not b!977728) (not b!977649) (not d!116913) (not b!977792) (not b!977669) (not d!116805) (not d!116911) (not b!977737) (not b!977718) (not b!977791) (not b!977693) (not d!116931) (not b!977763) (not b!977778) (not d!116887) (not b!977744) (not b!977661) (not b!977690) (not b!977714) (not d!116823) (not b_lambda!14615) (not d!116843) (not d!116905) (not b!977711) (not d!116901) (not d!116881) (not b!977712) (not b!977612) (not b!977650) (not d!116925) (not b!977715) (not d!116923) (not b!977663) (not b!977717) (not d!116821) (not d!116883) (not b_next!19549) (not b_lambda!14599) (not d!116813) (not b!977772) (not b!977729) (not b!977781) (not d!116933) (not b!977660) tp_is_empty!22453 (not b!977793) (not d!116891) (not d!116835) (not d!116853) (not d!116921) (not b!977704) (not b!977723))
(check-sat b_and!31213 (not b_next!19549))
