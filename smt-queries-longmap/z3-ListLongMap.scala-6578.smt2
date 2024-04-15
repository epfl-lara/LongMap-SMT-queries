; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83334 () Bool)

(assert start!83334)

(declare-fun b_free!19345 () Bool)

(declare-fun b_next!19345 () Bool)

(assert (=> start!83334 (= b_free!19345 (not b_next!19345))))

(declare-fun tp!67314 () Bool)

(declare-fun b_and!30885 () Bool)

(assert (=> start!83334 (= tp!67314 b_and!30885)))

(declare-fun mapIsEmpty!35374 () Bool)

(declare-fun mapRes!35374 () Bool)

(assert (=> mapIsEmpty!35374 mapRes!35374))

(declare-fun b!972937 () Bool)

(declare-fun res!651309 () Bool)

(declare-fun e!548386 () Bool)

(assert (=> b!972937 (=> (not res!651309) (not e!548386))))

(declare-datatypes ((array!60458 0))(
  ( (array!60459 (arr!29093 (Array (_ BitVec 32) (_ BitVec 64))) (size!29574 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60458)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60458 (_ BitVec 32)) Bool)

(assert (=> b!972937 (= res!651309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!651310 () Bool)

(assert (=> start!83334 (=> (not res!651310) (not e!548386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83334 (= res!651310 (validMask!0 mask!2147))))

(assert (=> start!83334 e!548386))

(assert (=> start!83334 true))

(declare-datatypes ((V!34641 0))(
  ( (V!34642 (val!11172 Int)) )
))
(declare-datatypes ((ValueCell!10640 0))(
  ( (ValueCellFull!10640 (v!13730 V!34641)) (EmptyCell!10640) )
))
(declare-datatypes ((array!60460 0))(
  ( (array!60461 (arr!29094 (Array (_ BitVec 32) ValueCell!10640)) (size!29575 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60460)

(declare-fun e!548385 () Bool)

(declare-fun array_inv!22561 (array!60460) Bool)

(assert (=> start!83334 (and (array_inv!22561 _values!1425) e!548385)))

(declare-fun tp_is_empty!22243 () Bool)

(assert (=> start!83334 tp_is_empty!22243))

(assert (=> start!83334 tp!67314))

(declare-fun array_inv!22562 (array!60458) Bool)

(assert (=> start!83334 (array_inv!22562 _keys!1717)))

(declare-fun b!972938 () Bool)

(declare-fun e!548387 () Bool)

(assert (=> b!972938 (= e!548387 tp_is_empty!22243)))

(declare-fun b!972939 () Bool)

(declare-fun res!651305 () Bool)

(assert (=> b!972939 (=> (not res!651305) (not e!548386))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972939 (= res!651305 (validKeyInArray!0 (select (arr!29093 _keys!1717) i!822)))))

(declare-fun b!972940 () Bool)

(declare-fun e!548389 () Bool)

(assert (=> b!972940 (= e!548389 tp_is_empty!22243)))

(declare-fun b!972941 () Bool)

(declare-fun res!651308 () Bool)

(assert (=> b!972941 (=> (not res!651308) (not e!548386))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972941 (= res!651308 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29574 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29574 _keys!1717))))))

(declare-fun b!972942 () Bool)

(declare-fun e!548391 () Bool)

(declare-fun e!548388 () Bool)

(assert (=> b!972942 (= e!548391 e!548388)))

(declare-fun res!651303 () Bool)

(assert (=> b!972942 (=> (not res!651303) (not e!548388))))

(declare-fun lt!432110 () (_ BitVec 64))

(assert (=> b!972942 (= res!651303 (validKeyInArray!0 lt!432110))))

(assert (=> b!972942 (= lt!432110 (select (arr!29093 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14412 0))(
  ( (tuple2!14413 (_1!7217 (_ BitVec 64)) (_2!7217 V!34641)) )
))
(declare-datatypes ((List!20222 0))(
  ( (Nil!20219) (Cons!20218 (h!21380 tuple2!14412) (t!28656 List!20222)) )
))
(declare-datatypes ((ListLongMap!13099 0))(
  ( (ListLongMap!13100 (toList!6565 List!20222)) )
))
(declare-fun lt!432107 () ListLongMap!13099)

(declare-fun zeroValue!1367 () V!34641)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34641)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3727 (array!60458 array!60460 (_ BitVec 32) (_ BitVec 32) V!34641 V!34641 (_ BitVec 32) Int) ListLongMap!13099)

(assert (=> b!972942 (= lt!432107 (getCurrentListMap!3727 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972943 () Bool)

(assert (=> b!972943 (= e!548388 (not true))))

(declare-fun lt!432111 () ListLongMap!13099)

(declare-fun lt!432109 () tuple2!14412)

(declare-fun contains!5606 (ListLongMap!13099 (_ BitVec 64)) Bool)

(declare-fun +!2918 (ListLongMap!13099 tuple2!14412) ListLongMap!13099)

(assert (=> b!972943 (contains!5606 (+!2918 lt!432111 lt!432109) (select (arr!29093 _keys!1717) i!822))))

(declare-datatypes ((Unit!32288 0))(
  ( (Unit!32289) )
))
(declare-fun lt!432105 () Unit!32288)

(declare-fun lt!432108 () V!34641)

(declare-fun addStillContains!588 (ListLongMap!13099 (_ BitVec 64) V!34641 (_ BitVec 64)) Unit!32288)

(assert (=> b!972943 (= lt!432105 (addStillContains!588 lt!432111 lt!432110 lt!432108 (select (arr!29093 _keys!1717) i!822)))))

(assert (=> b!972943 (= lt!432107 (+!2918 (getCurrentListMap!3727 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432109))))

(assert (=> b!972943 (= lt!432109 (tuple2!14413 lt!432110 lt!432108))))

(declare-fun get!15085 (ValueCell!10640 V!34641) V!34641)

(declare-fun dynLambda!1674 (Int (_ BitVec 64)) V!34641)

(assert (=> b!972943 (= lt!432108 (get!15085 (select (arr!29094 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1674 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432106 () Unit!32288)

(declare-fun lemmaListMapRecursiveValidKeyArray!258 (array!60458 array!60460 (_ BitVec 32) (_ BitVec 32) V!34641 V!34641 (_ BitVec 32) Int) Unit!32288)

(assert (=> b!972943 (= lt!432106 (lemmaListMapRecursiveValidKeyArray!258 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972944 () Bool)

(declare-fun res!651304 () Bool)

(assert (=> b!972944 (=> (not res!651304) (not e!548386))))

(assert (=> b!972944 (= res!651304 (and (= (size!29575 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29574 _keys!1717) (size!29575 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972945 () Bool)

(declare-fun res!651306 () Bool)

(assert (=> b!972945 (=> (not res!651306) (not e!548386))))

(declare-datatypes ((List!20223 0))(
  ( (Nil!20220) (Cons!20219 (h!21381 (_ BitVec 64)) (t!28657 List!20223)) )
))
(declare-fun arrayNoDuplicates!0 (array!60458 (_ BitVec 32) List!20223) Bool)

(assert (=> b!972945 (= res!651306 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20220))))

(declare-fun b!972946 () Bool)

(assert (=> b!972946 (= e!548385 (and e!548389 mapRes!35374))))

(declare-fun condMapEmpty!35374 () Bool)

(declare-fun mapDefault!35374 () ValueCell!10640)

(assert (=> b!972946 (= condMapEmpty!35374 (= (arr!29094 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10640)) mapDefault!35374)))))

(declare-fun b!972947 () Bool)

(assert (=> b!972947 (= e!548386 e!548391)))

(declare-fun res!651307 () Bool)

(assert (=> b!972947 (=> (not res!651307) (not e!548391))))

(assert (=> b!972947 (= res!651307 (contains!5606 lt!432111 (select (arr!29093 _keys!1717) i!822)))))

(assert (=> b!972947 (= lt!432111 (getCurrentListMap!3727 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun mapNonEmpty!35374 () Bool)

(declare-fun tp!67315 () Bool)

(assert (=> mapNonEmpty!35374 (= mapRes!35374 (and tp!67315 e!548387))))

(declare-fun mapRest!35374 () (Array (_ BitVec 32) ValueCell!10640))

(declare-fun mapKey!35374 () (_ BitVec 32))

(declare-fun mapValue!35374 () ValueCell!10640)

(assert (=> mapNonEmpty!35374 (= (arr!29094 _values!1425) (store mapRest!35374 mapKey!35374 mapValue!35374))))

(assert (= (and start!83334 res!651310) b!972944))

(assert (= (and b!972944 res!651304) b!972937))

(assert (= (and b!972937 res!651309) b!972945))

(assert (= (and b!972945 res!651306) b!972941))

(assert (= (and b!972941 res!651308) b!972939))

(assert (= (and b!972939 res!651305) b!972947))

(assert (= (and b!972947 res!651307) b!972942))

(assert (= (and b!972942 res!651303) b!972943))

(assert (= (and b!972946 condMapEmpty!35374) mapIsEmpty!35374))

(assert (= (and b!972946 (not condMapEmpty!35374)) mapNonEmpty!35374))

(get-info :version)

(assert (= (and mapNonEmpty!35374 ((_ is ValueCellFull!10640) mapValue!35374)) b!972938))

(assert (= (and b!972946 ((_ is ValueCellFull!10640) mapDefault!35374)) b!972940))

(assert (= start!83334 b!972946))

(declare-fun b_lambda!14491 () Bool)

(assert (=> (not b_lambda!14491) (not b!972943)))

(declare-fun t!28655 () Bool)

(declare-fun tb!6285 () Bool)

(assert (=> (and start!83334 (= defaultEntry!1428 defaultEntry!1428) t!28655) tb!6285))

(declare-fun result!12555 () Bool)

(assert (=> tb!6285 (= result!12555 tp_is_empty!22243)))

(assert (=> b!972943 t!28655))

(declare-fun b_and!30887 () Bool)

(assert (= b_and!30885 (and (=> t!28655 result!12555) b_and!30887)))

(declare-fun m!899945 () Bool)

(assert (=> b!972943 m!899945))

(declare-fun m!899947 () Bool)

(assert (=> b!972943 m!899947))

(declare-fun m!899949 () Bool)

(assert (=> b!972943 m!899949))

(assert (=> b!972943 m!899949))

(declare-fun m!899951 () Bool)

(assert (=> b!972943 m!899951))

(declare-fun m!899953 () Bool)

(assert (=> b!972943 m!899953))

(assert (=> b!972943 m!899949))

(declare-fun m!899955 () Bool)

(assert (=> b!972943 m!899955))

(assert (=> b!972943 m!899945))

(declare-fun m!899957 () Bool)

(assert (=> b!972943 m!899957))

(declare-fun m!899959 () Bool)

(assert (=> b!972943 m!899959))

(assert (=> b!972943 m!899953))

(declare-fun m!899961 () Bool)

(assert (=> b!972943 m!899961))

(assert (=> b!972943 m!899947))

(declare-fun m!899963 () Bool)

(assert (=> b!972943 m!899963))

(assert (=> b!972943 m!899957))

(assert (=> b!972947 m!899949))

(assert (=> b!972947 m!899949))

(declare-fun m!899965 () Bool)

(assert (=> b!972947 m!899965))

(declare-fun m!899967 () Bool)

(assert (=> b!972947 m!899967))

(declare-fun m!899969 () Bool)

(assert (=> b!972937 m!899969))

(assert (=> b!972939 m!899949))

(assert (=> b!972939 m!899949))

(declare-fun m!899971 () Bool)

(assert (=> b!972939 m!899971))

(declare-fun m!899973 () Bool)

(assert (=> b!972942 m!899973))

(declare-fun m!899975 () Bool)

(assert (=> b!972942 m!899975))

(declare-fun m!899977 () Bool)

(assert (=> b!972942 m!899977))

(declare-fun m!899979 () Bool)

(assert (=> start!83334 m!899979))

(declare-fun m!899981 () Bool)

(assert (=> start!83334 m!899981))

(declare-fun m!899983 () Bool)

(assert (=> start!83334 m!899983))

(declare-fun m!899985 () Bool)

(assert (=> mapNonEmpty!35374 m!899985))

(declare-fun m!899987 () Bool)

(assert (=> b!972945 m!899987))

(check-sat (not b!972939) b_and!30887 (not b_lambda!14491) (not b!972945) (not b!972937) (not b_next!19345) (not b!972942) (not start!83334) tp_is_empty!22243 (not b!972943) (not b!972947) (not mapNonEmpty!35374))
(check-sat b_and!30887 (not b_next!19345))
