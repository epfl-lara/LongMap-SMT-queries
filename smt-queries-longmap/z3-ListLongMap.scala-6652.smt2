; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84052 () Bool)

(assert start!84052)

(declare-fun b_free!19693 () Bool)

(declare-fun b_next!19693 () Bool)

(assert (=> start!84052 (= b_free!19693 (not b_next!19693))))

(declare-fun tp!68522 () Bool)

(declare-fun b_and!31485 () Bool)

(assert (=> start!84052 (= tp!68522 b_and!31485)))

(declare-fun b!981074 () Bool)

(declare-fun e!553070 () Bool)

(assert (=> b!981074 (= e!553070 true)))

(declare-datatypes ((V!35233 0))(
  ( (V!35234 (val!11394 Int)) )
))
(declare-datatypes ((tuple2!14626 0))(
  ( (tuple2!14627 (_1!7324 (_ BitVec 64)) (_2!7324 V!35233)) )
))
(declare-datatypes ((List!20486 0))(
  ( (Nil!20483) (Cons!20482 (h!21650 tuple2!14626) (t!29127 List!20486)) )
))
(declare-datatypes ((ListLongMap!13325 0))(
  ( (ListLongMap!13326 (toList!6678 List!20486)) )
))
(declare-fun lt!435442 () ListLongMap!13325)

(declare-fun lt!435450 () ListLongMap!13325)

(declare-fun lt!435448 () tuple2!14626)

(declare-fun lt!435445 () tuple2!14626)

(declare-fun +!2993 (ListLongMap!13325 tuple2!14626) ListLongMap!13325)

(assert (=> b!981074 (= lt!435450 (+!2993 (+!2993 lt!435442 lt!435448) lt!435445))))

(declare-fun lt!435444 () V!35233)

(declare-fun zeroValue!1220 () V!35233)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61416 0))(
  ( (array!61417 (arr!29561 (Array (_ BitVec 32) (_ BitVec 64))) (size!30041 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61416)

(declare-datatypes ((Unit!32566 0))(
  ( (Unit!32567) )
))
(declare-fun lt!435443 () Unit!32566)

(declare-fun addCommutativeForDiffKeys!600 (ListLongMap!13325 (_ BitVec 64) V!35233 (_ BitVec 64) V!35233) Unit!32566)

(assert (=> b!981074 (= lt!435443 (addCommutativeForDiffKeys!600 lt!435442 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29561 _keys!1544) from!1932) lt!435444))))

(declare-fun b!981075 () Bool)

(declare-fun res!656310 () Bool)

(declare-fun e!553071 () Bool)

(assert (=> b!981075 (=> (not res!656310) (not e!553071))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10862 0))(
  ( (ValueCellFull!10862 (v!13953 V!35233)) (EmptyCell!10862) )
))
(declare-datatypes ((array!61418 0))(
  ( (array!61419 (arr!29562 (Array (_ BitVec 32) ValueCell!10862)) (size!30042 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61418)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981075 (= res!656310 (and (= (size!30042 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30041 _keys!1544) (size!30042 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36059 () Bool)

(declare-fun mapRes!36059 () Bool)

(assert (=> mapIsEmpty!36059 mapRes!36059))

(declare-fun b!981076 () Bool)

(declare-fun e!553069 () Bool)

(declare-fun tp_is_empty!22687 () Bool)

(assert (=> b!981076 (= e!553069 tp_is_empty!22687)))

(declare-fun b!981077 () Bool)

(declare-fun res!656311 () Bool)

(assert (=> b!981077 (=> (not res!656311) (not e!553071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61416 (_ BitVec 32)) Bool)

(assert (=> b!981077 (= res!656311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656313 () Bool)

(assert (=> start!84052 (=> (not res!656313) (not e!553071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84052 (= res!656313 (validMask!0 mask!1948))))

(assert (=> start!84052 e!553071))

(assert (=> start!84052 true))

(assert (=> start!84052 tp_is_empty!22687))

(declare-fun e!553073 () Bool)

(declare-fun array_inv!22887 (array!61418) Bool)

(assert (=> start!84052 (and (array_inv!22887 _values!1278) e!553073)))

(assert (=> start!84052 tp!68522))

(declare-fun array_inv!22888 (array!61416) Bool)

(assert (=> start!84052 (array_inv!22888 _keys!1544)))

(declare-fun b!981078 () Bool)

(declare-fun res!656315 () Bool)

(assert (=> b!981078 (=> (not res!656315) (not e!553071))))

(assert (=> b!981078 (= res!656315 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36059 () Bool)

(declare-fun tp!68521 () Bool)

(declare-fun e!553072 () Bool)

(assert (=> mapNonEmpty!36059 (= mapRes!36059 (and tp!68521 e!553072))))

(declare-fun mapKey!36059 () (_ BitVec 32))

(declare-fun mapRest!36059 () (Array (_ BitVec 32) ValueCell!10862))

(declare-fun mapValue!36059 () ValueCell!10862)

(assert (=> mapNonEmpty!36059 (= (arr!29562 _values!1278) (store mapRest!36059 mapKey!36059 mapValue!36059))))

(declare-fun b!981079 () Bool)

(assert (=> b!981079 (= e!553073 (and e!553069 mapRes!36059))))

(declare-fun condMapEmpty!36059 () Bool)

(declare-fun mapDefault!36059 () ValueCell!10862)

(assert (=> b!981079 (= condMapEmpty!36059 (= (arr!29562 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10862)) mapDefault!36059)))))

(declare-fun b!981080 () Bool)

(assert (=> b!981080 (= e!553072 tp_is_empty!22687)))

(declare-fun b!981081 () Bool)

(declare-fun res!656317 () Bool)

(assert (=> b!981081 (=> (not res!656317) (not e!553071))))

(declare-datatypes ((List!20487 0))(
  ( (Nil!20484) (Cons!20483 (h!21651 (_ BitVec 64)) (t!29128 List!20487)) )
))
(declare-fun arrayNoDuplicates!0 (array!61416 (_ BitVec 32) List!20487) Bool)

(assert (=> b!981081 (= res!656317 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20484))))

(declare-fun b!981082 () Bool)

(assert (=> b!981082 (= e!553071 (not e!553070))))

(declare-fun res!656314 () Bool)

(assert (=> b!981082 (=> res!656314 e!553070)))

(assert (=> b!981082 (= res!656314 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29561 _keys!1544) from!1932)))))

(declare-fun lt!435441 () tuple2!14626)

(declare-fun lt!435449 () ListLongMap!13325)

(assert (=> b!981082 (= (+!2993 lt!435449 lt!435448) (+!2993 lt!435450 lt!435441))))

(declare-fun lt!435447 () ListLongMap!13325)

(assert (=> b!981082 (= lt!435450 (+!2993 lt!435447 lt!435448))))

(assert (=> b!981082 (= lt!435448 (tuple2!14627 (select (arr!29561 _keys!1544) from!1932) lt!435444))))

(assert (=> b!981082 (= lt!435449 (+!2993 lt!435447 lt!435441))))

(declare-fun minValue!1220 () V!35233)

(assert (=> b!981082 (= lt!435441 (tuple2!14627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435446 () Unit!32566)

(assert (=> b!981082 (= lt!435446 (addCommutativeForDiffKeys!600 lt!435447 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29561 _keys!1544) from!1932) lt!435444))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15349 (ValueCell!10862 V!35233) V!35233)

(declare-fun dynLambda!1788 (Int (_ BitVec 64)) V!35233)

(assert (=> b!981082 (= lt!435444 (get!15349 (select (arr!29562 _values!1278) from!1932) (dynLambda!1788 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!981082 (= lt!435447 (+!2993 lt!435442 lt!435445))))

(assert (=> b!981082 (= lt!435445 (tuple2!14627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3426 (array!61416 array!61418 (_ BitVec 32) (_ BitVec 32) V!35233 V!35233 (_ BitVec 32) Int) ListLongMap!13325)

(assert (=> b!981082 (= lt!435442 (getCurrentListMapNoExtraKeys!3426 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981083 () Bool)

(declare-fun res!656312 () Bool)

(assert (=> b!981083 (=> (not res!656312) (not e!553071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981083 (= res!656312 (validKeyInArray!0 (select (arr!29561 _keys!1544) from!1932)))))

(declare-fun b!981084 () Bool)

(declare-fun res!656316 () Bool)

(assert (=> b!981084 (=> (not res!656316) (not e!553071))))

(assert (=> b!981084 (= res!656316 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30041 _keys!1544))))))

(assert (= (and start!84052 res!656313) b!981075))

(assert (= (and b!981075 res!656310) b!981077))

(assert (= (and b!981077 res!656311) b!981081))

(assert (= (and b!981081 res!656317) b!981084))

(assert (= (and b!981084 res!656316) b!981083))

(assert (= (and b!981083 res!656312) b!981078))

(assert (= (and b!981078 res!656315) b!981082))

(assert (= (and b!981082 (not res!656314)) b!981074))

(assert (= (and b!981079 condMapEmpty!36059) mapIsEmpty!36059))

(assert (= (and b!981079 (not condMapEmpty!36059)) mapNonEmpty!36059))

(get-info :version)

(assert (= (and mapNonEmpty!36059 ((_ is ValueCellFull!10862) mapValue!36059)) b!981080))

(assert (= (and b!981079 ((_ is ValueCellFull!10862) mapDefault!36059)) b!981076))

(assert (= start!84052 b!981079))

(declare-fun b_lambda!14751 () Bool)

(assert (=> (not b_lambda!14751) (not b!981082)))

(declare-fun t!29126 () Bool)

(declare-fun tb!6491 () Bool)

(assert (=> (and start!84052 (= defaultEntry!1281 defaultEntry!1281) t!29126) tb!6491))

(declare-fun result!12979 () Bool)

(assert (=> tb!6491 (= result!12979 tp_is_empty!22687)))

(assert (=> b!981082 t!29126))

(declare-fun b_and!31487 () Bool)

(assert (= b_and!31485 (and (=> t!29126 result!12979) b_and!31487)))

(declare-fun m!908921 () Bool)

(assert (=> mapNonEmpty!36059 m!908921))

(declare-fun m!908923 () Bool)

(assert (=> start!84052 m!908923))

(declare-fun m!908925 () Bool)

(assert (=> start!84052 m!908925))

(declare-fun m!908927 () Bool)

(assert (=> start!84052 m!908927))

(declare-fun m!908929 () Bool)

(assert (=> b!981082 m!908929))

(declare-fun m!908931 () Bool)

(assert (=> b!981082 m!908931))

(declare-fun m!908933 () Bool)

(assert (=> b!981082 m!908933))

(declare-fun m!908935 () Bool)

(assert (=> b!981082 m!908935))

(declare-fun m!908937 () Bool)

(assert (=> b!981082 m!908937))

(assert (=> b!981082 m!908929))

(declare-fun m!908939 () Bool)

(assert (=> b!981082 m!908939))

(declare-fun m!908941 () Bool)

(assert (=> b!981082 m!908941))

(declare-fun m!908943 () Bool)

(assert (=> b!981082 m!908943))

(declare-fun m!908945 () Bool)

(assert (=> b!981082 m!908945))

(declare-fun m!908947 () Bool)

(assert (=> b!981082 m!908947))

(assert (=> b!981082 m!908931))

(assert (=> b!981082 m!908947))

(declare-fun m!908949 () Bool)

(assert (=> b!981082 m!908949))

(assert (=> b!981083 m!908929))

(assert (=> b!981083 m!908929))

(declare-fun m!908951 () Bool)

(assert (=> b!981083 m!908951))

(declare-fun m!908953 () Bool)

(assert (=> b!981074 m!908953))

(assert (=> b!981074 m!908953))

(declare-fun m!908955 () Bool)

(assert (=> b!981074 m!908955))

(assert (=> b!981074 m!908929))

(assert (=> b!981074 m!908929))

(declare-fun m!908957 () Bool)

(assert (=> b!981074 m!908957))

(declare-fun m!908959 () Bool)

(assert (=> b!981081 m!908959))

(declare-fun m!908961 () Bool)

(assert (=> b!981077 m!908961))

(check-sat (not b!981082) (not b!981074) b_and!31487 (not b_lambda!14751) tp_is_empty!22687 (not b!981081) (not b!981083) (not b!981077) (not b_next!19693) (not start!84052) (not mapNonEmpty!36059))
(check-sat b_and!31487 (not b_next!19693))
