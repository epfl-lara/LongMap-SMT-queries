; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83520 () Bool)

(assert start!83520)

(declare-fun b_free!19345 () Bool)

(declare-fun b_next!19345 () Bool)

(assert (=> start!83520 (= b_free!19345 (not b_next!19345))))

(declare-fun tp!67314 () Bool)

(declare-fun b_and!30921 () Bool)

(assert (=> start!83520 (= tp!67314 b_and!30921)))

(declare-fun b!974079 () Bool)

(declare-fun e!549119 () Bool)

(declare-fun tp_is_empty!22243 () Bool)

(assert (=> b!974079 (= e!549119 tp_is_empty!22243)))

(declare-fun b!974080 () Bool)

(declare-fun e!549117 () Bool)

(assert (=> b!974080 (= e!549117 (not true))))

(declare-datatypes ((V!34641 0))(
  ( (V!34642 (val!11172 Int)) )
))
(declare-datatypes ((tuple2!14344 0))(
  ( (tuple2!14345 (_1!7183 (_ BitVec 64)) (_2!7183 V!34641)) )
))
(declare-datatypes ((List!20194 0))(
  ( (Nil!20191) (Cons!20190 (h!21358 tuple2!14344) (t!28629 List!20194)) )
))
(declare-datatypes ((ListLongMap!13043 0))(
  ( (ListLongMap!13044 (toList!6537 List!20194)) )
))
(declare-fun lt!432704 () ListLongMap!13043)

(declare-fun lt!432706 () tuple2!14344)

(declare-datatypes ((array!60558 0))(
  ( (array!60559 (arr!29138 (Array (_ BitVec 32) (_ BitVec 64))) (size!29618 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60558)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5645 (ListLongMap!13043 (_ BitVec 64)) Bool)

(declare-fun +!2913 (ListLongMap!13043 tuple2!14344) ListLongMap!13043)

(assert (=> b!974080 (contains!5645 (+!2913 lt!432704 lt!432706) (select (arr!29138 _keys!1717) i!822))))

(declare-datatypes ((Unit!32390 0))(
  ( (Unit!32391) )
))
(declare-fun lt!432703 () Unit!32390)

(declare-fun lt!432708 () (_ BitVec 64))

(declare-fun lt!432707 () V!34641)

(declare-fun addStillContains!595 (ListLongMap!13043 (_ BitVec 64) V!34641 (_ BitVec 64)) Unit!32390)

(assert (=> b!974080 (= lt!432703 (addStillContains!595 lt!432704 lt!432708 lt!432707 (select (arr!29138 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10640 0))(
  ( (ValueCellFull!10640 (v!13728 V!34641)) (EmptyCell!10640) )
))
(declare-datatypes ((array!60560 0))(
  ( (array!60561 (arr!29139 (Array (_ BitVec 32) ValueCell!10640)) (size!29619 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60560)

(declare-fun zeroValue!1367 () V!34641)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!432702 () ListLongMap!13043)

(declare-fun minValue!1367 () V!34641)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3770 (array!60558 array!60560 (_ BitVec 32) (_ BitVec 32) V!34641 V!34641 (_ BitVec 32) Int) ListLongMap!13043)

(assert (=> b!974080 (= lt!432702 (+!2913 (getCurrentListMap!3770 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432706))))

(assert (=> b!974080 (= lt!432706 (tuple2!14345 lt!432708 lt!432707))))

(declare-fun get!15120 (ValueCell!10640 V!34641) V!34641)

(declare-fun dynLambda!1710 (Int (_ BitVec 64)) V!34641)

(assert (=> b!974080 (= lt!432707 (get!15120 (select (arr!29139 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1710 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432705 () Unit!32390)

(declare-fun lemmaListMapRecursiveValidKeyArray!269 (array!60558 array!60560 (_ BitVec 32) (_ BitVec 32) V!34641 V!34641 (_ BitVec 32) Int) Unit!32390)

(assert (=> b!974080 (= lt!432705 (lemmaListMapRecursiveValidKeyArray!269 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35374 () Bool)

(declare-fun mapRes!35374 () Bool)

(declare-fun tp!67315 () Bool)

(assert (=> mapNonEmpty!35374 (= mapRes!35374 (and tp!67315 e!549119))))

(declare-fun mapKey!35374 () (_ BitVec 32))

(declare-fun mapRest!35374 () (Array (_ BitVec 32) ValueCell!10640))

(declare-fun mapValue!35374 () ValueCell!10640)

(assert (=> mapNonEmpty!35374 (= (arr!29139 _values!1425) (store mapRest!35374 mapKey!35374 mapValue!35374))))

(declare-fun b!974081 () Bool)

(declare-fun e!549115 () Bool)

(declare-fun e!549118 () Bool)

(assert (=> b!974081 (= e!549115 (and e!549118 mapRes!35374))))

(declare-fun condMapEmpty!35374 () Bool)

(declare-fun mapDefault!35374 () ValueCell!10640)

(assert (=> b!974081 (= condMapEmpty!35374 (= (arr!29139 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10640)) mapDefault!35374)))))

(declare-fun b!974082 () Bool)

(assert (=> b!974082 (= e!549118 tp_is_empty!22243)))

(declare-fun b!974083 () Bool)

(declare-fun res!651758 () Bool)

(declare-fun e!549120 () Bool)

(assert (=> b!974083 (=> (not res!651758) (not e!549120))))

(assert (=> b!974083 (= res!651758 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29618 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29618 _keys!1717))))))

(declare-fun b!974084 () Bool)

(declare-fun res!651763 () Bool)

(assert (=> b!974084 (=> (not res!651763) (not e!549120))))

(declare-datatypes ((List!20195 0))(
  ( (Nil!20192) (Cons!20191 (h!21359 (_ BitVec 64)) (t!28630 List!20195)) )
))
(declare-fun arrayNoDuplicates!0 (array!60558 (_ BitVec 32) List!20195) Bool)

(assert (=> b!974084 (= res!651763 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20192))))

(declare-fun b!974085 () Bool)

(declare-fun res!651764 () Bool)

(assert (=> b!974085 (=> (not res!651764) (not e!549120))))

(assert (=> b!974085 (= res!651764 (and (= (size!29619 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29618 _keys!1717) (size!29619 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974086 () Bool)

(declare-fun res!651761 () Bool)

(assert (=> b!974086 (=> (not res!651761) (not e!549120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974086 (= res!651761 (validKeyInArray!0 (select (arr!29138 _keys!1717) i!822)))))

(declare-fun res!651757 () Bool)

(assert (=> start!83520 (=> (not res!651757) (not e!549120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83520 (= res!651757 (validMask!0 mask!2147))))

(assert (=> start!83520 e!549120))

(assert (=> start!83520 true))

(declare-fun array_inv!22597 (array!60560) Bool)

(assert (=> start!83520 (and (array_inv!22597 _values!1425) e!549115)))

(assert (=> start!83520 tp_is_empty!22243))

(assert (=> start!83520 tp!67314))

(declare-fun array_inv!22598 (array!60558) Bool)

(assert (=> start!83520 (array_inv!22598 _keys!1717)))

(declare-fun mapIsEmpty!35374 () Bool)

(assert (=> mapIsEmpty!35374 mapRes!35374))

(declare-fun b!974087 () Bool)

(declare-fun e!549121 () Bool)

(assert (=> b!974087 (= e!549121 e!549117)))

(declare-fun res!651762 () Bool)

(assert (=> b!974087 (=> (not res!651762) (not e!549117))))

(assert (=> b!974087 (= res!651762 (validKeyInArray!0 lt!432708))))

(assert (=> b!974087 (= lt!432708 (select (arr!29138 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!974087 (= lt!432702 (getCurrentListMap!3770 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974088 () Bool)

(assert (=> b!974088 (= e!549120 e!549121)))

(declare-fun res!651760 () Bool)

(assert (=> b!974088 (=> (not res!651760) (not e!549121))))

(assert (=> b!974088 (= res!651760 (contains!5645 lt!432704 (select (arr!29138 _keys!1717) i!822)))))

(assert (=> b!974088 (= lt!432704 (getCurrentListMap!3770 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!974089 () Bool)

(declare-fun res!651759 () Bool)

(assert (=> b!974089 (=> (not res!651759) (not e!549120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60558 (_ BitVec 32)) Bool)

(assert (=> b!974089 (= res!651759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83520 res!651757) b!974085))

(assert (= (and b!974085 res!651764) b!974089))

(assert (= (and b!974089 res!651759) b!974084))

(assert (= (and b!974084 res!651763) b!974083))

(assert (= (and b!974083 res!651758) b!974086))

(assert (= (and b!974086 res!651761) b!974088))

(assert (= (and b!974088 res!651760) b!974087))

(assert (= (and b!974087 res!651762) b!974080))

(assert (= (and b!974081 condMapEmpty!35374) mapIsEmpty!35374))

(assert (= (and b!974081 (not condMapEmpty!35374)) mapNonEmpty!35374))

(get-info :version)

(assert (= (and mapNonEmpty!35374 ((_ is ValueCellFull!10640) mapValue!35374)) b!974079))

(assert (= (and b!974081 ((_ is ValueCellFull!10640) mapDefault!35374)) b!974082))

(assert (= start!83520 b!974081))

(declare-fun b_lambda!14523 () Bool)

(assert (=> (not b_lambda!14523) (not b!974080)))

(declare-fun t!28628 () Bool)

(declare-fun tb!6285 () Bool)

(assert (=> (and start!83520 (= defaultEntry!1428 defaultEntry!1428) t!28628) tb!6285))

(declare-fun result!12555 () Bool)

(assert (=> tb!6285 (= result!12555 tp_is_empty!22243)))

(assert (=> b!974080 t!28628))

(declare-fun b_and!30923 () Bool)

(assert (= b_and!30921 (and (=> t!28628 result!12555) b_and!30923)))

(declare-fun m!901997 () Bool)

(assert (=> mapNonEmpty!35374 m!901997))

(declare-fun m!901999 () Bool)

(assert (=> b!974087 m!901999))

(declare-fun m!902001 () Bool)

(assert (=> b!974087 m!902001))

(declare-fun m!902003 () Bool)

(assert (=> b!974087 m!902003))

(declare-fun m!902005 () Bool)

(assert (=> b!974088 m!902005))

(assert (=> b!974088 m!902005))

(declare-fun m!902007 () Bool)

(assert (=> b!974088 m!902007))

(declare-fun m!902009 () Bool)

(assert (=> b!974088 m!902009))

(declare-fun m!902011 () Bool)

(assert (=> b!974089 m!902011))

(declare-fun m!902013 () Bool)

(assert (=> b!974080 m!902013))

(declare-fun m!902015 () Bool)

(assert (=> b!974080 m!902015))

(assert (=> b!974080 m!902005))

(declare-fun m!902017 () Bool)

(assert (=> b!974080 m!902017))

(declare-fun m!902019 () Bool)

(assert (=> b!974080 m!902019))

(assert (=> b!974080 m!902015))

(assert (=> b!974080 m!902005))

(declare-fun m!902021 () Bool)

(assert (=> b!974080 m!902021))

(assert (=> b!974080 m!902019))

(declare-fun m!902023 () Bool)

(assert (=> b!974080 m!902023))

(declare-fun m!902025 () Bool)

(assert (=> b!974080 m!902025))

(assert (=> b!974080 m!902005))

(declare-fun m!902027 () Bool)

(assert (=> b!974080 m!902027))

(assert (=> b!974080 m!902013))

(assert (=> b!974080 m!902025))

(declare-fun m!902029 () Bool)

(assert (=> b!974080 m!902029))

(declare-fun m!902031 () Bool)

(assert (=> b!974084 m!902031))

(declare-fun m!902033 () Bool)

(assert (=> start!83520 m!902033))

(declare-fun m!902035 () Bool)

(assert (=> start!83520 m!902035))

(declare-fun m!902037 () Bool)

(assert (=> start!83520 m!902037))

(assert (=> b!974086 m!902005))

(assert (=> b!974086 m!902005))

(declare-fun m!902039 () Bool)

(assert (=> b!974086 m!902039))

(check-sat tp_is_empty!22243 (not b!974084) (not b!974080) (not b_lambda!14523) (not b!974089) (not b!974088) b_and!30923 (not start!83520) (not b!974086) (not b!974087) (not mapNonEmpty!35374) (not b_next!19345))
(check-sat b_and!30923 (not b_next!19345))
