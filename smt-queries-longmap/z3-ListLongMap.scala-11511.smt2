; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134362 () Bool)

(assert start!134362)

(declare-fun b_free!32173 () Bool)

(declare-fun b_next!32173 () Bool)

(assert (=> start!134362 (= b_free!32173 (not b_next!32173))))

(declare-fun tp!113820 () Bool)

(declare-fun b_and!51789 () Bool)

(assert (=> start!134362 (= tp!113820 b_and!51789)))

(declare-fun b!1568318 () Bool)

(declare-fun res!1071245 () Bool)

(declare-fun e!874310 () Bool)

(assert (=> b!1568318 (=> (not res!1071245) (not e!874310))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104702 0))(
  ( (array!104703 (arr!50531 (Array (_ BitVec 32) (_ BitVec 64))) (size!51082 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104702)

(declare-datatypes ((V!60137 0))(
  ( (V!60138 (val!19557 Int)) )
))
(declare-datatypes ((ValueCell!18443 0))(
  ( (ValueCellFull!18443 (v!22305 V!60137)) (EmptyCell!18443) )
))
(declare-datatypes ((array!104704 0))(
  ( (array!104705 (arr!50532 (Array (_ BitVec 32) ValueCell!18443)) (size!51083 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104704)

(assert (=> b!1568318 (= res!1071245 (and (= (size!51083 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51082 _keys!637) (size!51083 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1568319 () Bool)

(declare-fun res!1071241 () Bool)

(assert (=> b!1568319 (=> (not res!1071241) (not e!874310))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568319 (= res!1071241 (validKeyInArray!0 (select (arr!50531 _keys!637) from!782)))))

(declare-fun b!1568320 () Bool)

(declare-fun e!874312 () Bool)

(declare-fun tp_is_empty!38947 () Bool)

(assert (=> b!1568320 (= e!874312 tp_is_empty!38947)))

(declare-fun mapIsEmpty!59812 () Bool)

(declare-fun mapRes!59812 () Bool)

(assert (=> mapIsEmpty!59812 mapRes!59812))

(declare-fun b!1568321 () Bool)

(declare-fun e!874309 () Bool)

(assert (=> b!1568321 (= e!874310 (not e!874309))))

(declare-fun res!1071240 () Bool)

(assert (=> b!1568321 (=> res!1071240 e!874309)))

(declare-datatypes ((tuple2!25288 0))(
  ( (tuple2!25289 (_1!12655 (_ BitVec 64)) (_2!12655 V!60137)) )
))
(declare-datatypes ((List!36651 0))(
  ( (Nil!36648) (Cons!36647 (h!38111 tuple2!25288) (t!51530 List!36651)) )
))
(declare-datatypes ((ListLongMap!22731 0))(
  ( (ListLongMap!22732 (toList!11381 List!36651)) )
))
(declare-fun lt!673369 () ListLongMap!22731)

(declare-fun contains!10384 (ListLongMap!22731 (_ BitVec 64)) Bool)

(assert (=> b!1568321 (= res!1071240 (contains!10384 lt!673369 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568321 (not (contains!10384 lt!673369 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673367 () ListLongMap!22731)

(declare-fun lt!673368 () V!60137)

(declare-fun +!5119 (ListLongMap!22731 tuple2!25288) ListLongMap!22731)

(assert (=> b!1568321 (= lt!673369 (+!5119 lt!673367 (tuple2!25289 (select (arr!50531 _keys!637) from!782) lt!673368)))))

(declare-datatypes ((Unit!51933 0))(
  ( (Unit!51934) )
))
(declare-fun lt!673366 () Unit!51933)

(declare-fun addStillNotContains!570 (ListLongMap!22731 (_ BitVec 64) V!60137 (_ BitVec 64)) Unit!51933)

(assert (=> b!1568321 (= lt!673366 (addStillNotContains!570 lt!673367 (select (arr!50531 _keys!637) from!782) lt!673368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26393 (ValueCell!18443 V!60137) V!60137)

(declare-fun dynLambda!3917 (Int (_ BitVec 64)) V!60137)

(assert (=> b!1568321 (= lt!673368 (get!26393 (select (arr!50532 _values!487) from!782) (dynLambda!3917 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60137)

(declare-fun minValue!453 () V!60137)

(declare-fun getCurrentListMapNoExtraKeys!6764 (array!104702 array!104704 (_ BitVec 32) (_ BitVec 32) V!60137 V!60137 (_ BitVec 32) Int) ListLongMap!22731)

(assert (=> b!1568321 (= lt!673367 (getCurrentListMapNoExtraKeys!6764 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1568322 () Bool)

(declare-fun res!1071239 () Bool)

(assert (=> b!1568322 (=> res!1071239 e!874309)))

(assert (=> b!1568322 (= res!1071239 (not (contains!10384 lt!673369 (select (arr!50531 _keys!637) from!782))))))

(declare-fun res!1071244 () Bool)

(assert (=> start!134362 (=> (not res!1071244) (not e!874310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134362 (= res!1071244 (validMask!0 mask!947))))

(assert (=> start!134362 e!874310))

(assert (=> start!134362 tp!113820))

(assert (=> start!134362 tp_is_empty!38947))

(assert (=> start!134362 true))

(declare-fun array_inv!39503 (array!104702) Bool)

(assert (=> start!134362 (array_inv!39503 _keys!637)))

(declare-fun e!874308 () Bool)

(declare-fun array_inv!39504 (array!104704) Bool)

(assert (=> start!134362 (and (array_inv!39504 _values!487) e!874308)))

(declare-fun b!1568323 () Bool)

(declare-fun e!874311 () Bool)

(assert (=> b!1568323 (= e!874311 tp_is_empty!38947)))

(declare-fun b!1568324 () Bool)

(assert (=> b!1568324 (= e!874308 (and e!874312 mapRes!59812))))

(declare-fun condMapEmpty!59812 () Bool)

(declare-fun mapDefault!59812 () ValueCell!18443)

(assert (=> b!1568324 (= condMapEmpty!59812 (= (arr!50532 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18443)) mapDefault!59812)))))

(declare-fun b!1568325 () Bool)

(declare-fun res!1071243 () Bool)

(assert (=> b!1568325 (=> (not res!1071243) (not e!874310))))

(assert (=> b!1568325 (= res!1071243 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51082 _keys!637)) (bvslt from!782 (size!51082 _keys!637))))))

(declare-fun b!1568326 () Bool)

(declare-fun res!1071246 () Bool)

(assert (=> b!1568326 (=> (not res!1071246) (not e!874310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104702 (_ BitVec 32)) Bool)

(assert (=> b!1568326 (= res!1071246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1568327 () Bool)

(assert (=> b!1568327 (= e!874309 (bvslt from!782 (size!51083 _values!487)))))

(declare-fun mapNonEmpty!59812 () Bool)

(declare-fun tp!113821 () Bool)

(assert (=> mapNonEmpty!59812 (= mapRes!59812 (and tp!113821 e!874311))))

(declare-fun mapValue!59812 () ValueCell!18443)

(declare-fun mapKey!59812 () (_ BitVec 32))

(declare-fun mapRest!59812 () (Array (_ BitVec 32) ValueCell!18443))

(assert (=> mapNonEmpty!59812 (= (arr!50532 _values!487) (store mapRest!59812 mapKey!59812 mapValue!59812))))

(declare-fun b!1568328 () Bool)

(declare-fun res!1071242 () Bool)

(assert (=> b!1568328 (=> (not res!1071242) (not e!874310))))

(declare-datatypes ((List!36652 0))(
  ( (Nil!36649) (Cons!36648 (h!38112 (_ BitVec 64)) (t!51531 List!36652)) )
))
(declare-fun arrayNoDuplicates!0 (array!104702 (_ BitVec 32) List!36652) Bool)

(assert (=> b!1568328 (= res!1071242 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36649))))

(assert (= (and start!134362 res!1071244) b!1568318))

(assert (= (and b!1568318 res!1071245) b!1568326))

(assert (= (and b!1568326 res!1071246) b!1568328))

(assert (= (and b!1568328 res!1071242) b!1568325))

(assert (= (and b!1568325 res!1071243) b!1568319))

(assert (= (and b!1568319 res!1071241) b!1568321))

(assert (= (and b!1568321 (not res!1071240)) b!1568322))

(assert (= (and b!1568322 (not res!1071239)) b!1568327))

(assert (= (and b!1568324 condMapEmpty!59812) mapIsEmpty!59812))

(assert (= (and b!1568324 (not condMapEmpty!59812)) mapNonEmpty!59812))

(get-info :version)

(assert (= (and mapNonEmpty!59812 ((_ is ValueCellFull!18443) mapValue!59812)) b!1568323))

(assert (= (and b!1568324 ((_ is ValueCellFull!18443) mapDefault!59812)) b!1568320))

(assert (= start!134362 b!1568324))

(declare-fun b_lambda!24981 () Bool)

(assert (=> (not b_lambda!24981) (not b!1568321)))

(declare-fun t!51529 () Bool)

(declare-fun tb!12633 () Bool)

(assert (=> (and start!134362 (= defaultEntry!495 defaultEntry!495) t!51529) tb!12633))

(declare-fun result!26565 () Bool)

(assert (=> tb!12633 (= result!26565 tp_is_empty!38947)))

(assert (=> b!1568321 t!51529))

(declare-fun b_and!51791 () Bool)

(assert (= b_and!51789 (and (=> t!51529 result!26565) b_and!51791)))

(declare-fun m!1443067 () Bool)

(assert (=> b!1568321 m!1443067))

(declare-fun m!1443069 () Bool)

(assert (=> b!1568321 m!1443069))

(declare-fun m!1443071 () Bool)

(assert (=> b!1568321 m!1443071))

(declare-fun m!1443073 () Bool)

(assert (=> b!1568321 m!1443073))

(assert (=> b!1568321 m!1443067))

(declare-fun m!1443075 () Bool)

(assert (=> b!1568321 m!1443075))

(declare-fun m!1443077 () Bool)

(assert (=> b!1568321 m!1443077))

(assert (=> b!1568321 m!1443075))

(declare-fun m!1443079 () Bool)

(assert (=> b!1568321 m!1443079))

(declare-fun m!1443081 () Bool)

(assert (=> b!1568321 m!1443081))

(assert (=> b!1568321 m!1443069))

(declare-fun m!1443083 () Bool)

(assert (=> b!1568321 m!1443083))

(declare-fun m!1443085 () Bool)

(assert (=> start!134362 m!1443085))

(declare-fun m!1443087 () Bool)

(assert (=> start!134362 m!1443087))

(declare-fun m!1443089 () Bool)

(assert (=> start!134362 m!1443089))

(declare-fun m!1443091 () Bool)

(assert (=> mapNonEmpty!59812 m!1443091))

(assert (=> b!1568319 m!1443075))

(assert (=> b!1568319 m!1443075))

(declare-fun m!1443093 () Bool)

(assert (=> b!1568319 m!1443093))

(declare-fun m!1443095 () Bool)

(assert (=> b!1568326 m!1443095))

(assert (=> b!1568322 m!1443075))

(assert (=> b!1568322 m!1443075))

(declare-fun m!1443097 () Bool)

(assert (=> b!1568322 m!1443097))

(declare-fun m!1443099 () Bool)

(assert (=> b!1568328 m!1443099))

(check-sat (not b!1568321) (not mapNonEmpty!59812) tp_is_empty!38947 b_and!51791 (not b_lambda!24981) (not b!1568322) (not start!134362) (not b_next!32173) (not b!1568319) (not b!1568326) (not b!1568328))
(check-sat b_and!51791 (not b_next!32173))
