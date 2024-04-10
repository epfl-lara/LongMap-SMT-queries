; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83904 () Bool)

(assert start!83904)

(declare-fun b_free!19713 () Bool)

(declare-fun b_next!19713 () Bool)

(assert (=> start!83904 (= b_free!19713 (not b_next!19713))))

(declare-fun tp!68581 () Bool)

(declare-fun b_and!31515 () Bool)

(assert (=> start!83904 (= tp!68581 b_and!31515)))

(declare-fun b!980521 () Bool)

(declare-fun res!656209 () Bool)

(declare-fun e!552671 () Bool)

(assert (=> b!980521 (=> (not res!656209) (not e!552671))))

(declare-datatypes ((array!61421 0))(
  ( (array!61422 (arr!29568 (Array (_ BitVec 32) (_ BitVec 64))) (size!30047 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61421)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980521 (= res!656209 (validKeyInArray!0 (select (arr!29568 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36089 () Bool)

(declare-fun mapRes!36089 () Bool)

(assert (=> mapIsEmpty!36089 mapRes!36089))

(declare-fun b!980522 () Bool)

(declare-fun e!552672 () Bool)

(declare-fun tp_is_empty!22707 () Bool)

(assert (=> b!980522 (= e!552672 tp_is_empty!22707)))

(declare-fun b!980523 () Bool)

(declare-fun res!656206 () Bool)

(assert (=> b!980523 (=> (not res!656206) (not e!552671))))

(assert (=> b!980523 (= res!656206 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30047 _keys!1544))))))

(declare-fun b!980525 () Bool)

(declare-fun e!552667 () Bool)

(declare-fun e!552668 () Bool)

(assert (=> b!980525 (= e!552667 (and e!552668 mapRes!36089))))

(declare-fun condMapEmpty!36089 () Bool)

(declare-datatypes ((V!35259 0))(
  ( (V!35260 (val!11404 Int)) )
))
(declare-datatypes ((ValueCell!10872 0))(
  ( (ValueCellFull!10872 (v!13966 V!35259)) (EmptyCell!10872) )
))
(declare-datatypes ((array!61423 0))(
  ( (array!61424 (arr!29569 (Array (_ BitVec 32) ValueCell!10872)) (size!30048 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61423)

(declare-fun mapDefault!36089 () ValueCell!10872)

(assert (=> b!980525 (= condMapEmpty!36089 (= (arr!29569 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10872)) mapDefault!36089)))))

(declare-fun b!980526 () Bool)

(declare-fun res!656207 () Bool)

(assert (=> b!980526 (=> (not res!656207) (not e!552671))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980526 (= res!656207 (and (= (size!30048 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30047 _keys!1544) (size!30048 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980527 () Bool)

(declare-fun e!552670 () Bool)

(assert (=> b!980527 (= e!552670 true)))

(declare-datatypes ((tuple2!14626 0))(
  ( (tuple2!14627 (_1!7324 (_ BitVec 64)) (_2!7324 V!35259)) )
))
(declare-fun lt!435388 () tuple2!14626)

(declare-fun lt!435384 () tuple2!14626)

(declare-datatypes ((List!20492 0))(
  ( (Nil!20489) (Cons!20488 (h!21650 tuple2!14626) (t!29161 List!20492)) )
))
(declare-datatypes ((ListLongMap!13323 0))(
  ( (ListLongMap!13324 (toList!6677 List!20492)) )
))
(declare-fun lt!435387 () ListLongMap!13323)

(declare-fun lt!435383 () ListLongMap!13323)

(declare-fun +!2982 (ListLongMap!13323 tuple2!14626) ListLongMap!13323)

(assert (=> b!980527 (= lt!435387 (+!2982 (+!2982 lt!435383 lt!435388) lt!435384))))

(declare-fun lt!435385 () V!35259)

(declare-fun zeroValue!1220 () V!35259)

(declare-datatypes ((Unit!32603 0))(
  ( (Unit!32604) )
))
(declare-fun lt!435386 () Unit!32603)

(declare-fun addCommutativeForDiffKeys!610 (ListLongMap!13323 (_ BitVec 64) V!35259 (_ BitVec 64) V!35259) Unit!32603)

(assert (=> b!980527 (= lt!435386 (addCommutativeForDiffKeys!610 lt!435383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29568 _keys!1544) from!1932) lt!435385))))

(declare-fun b!980528 () Bool)

(declare-fun res!656213 () Bool)

(assert (=> b!980528 (=> (not res!656213) (not e!552671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61421 (_ BitVec 32)) Bool)

(assert (=> b!980528 (= res!656213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980529 () Bool)

(declare-fun res!656210 () Bool)

(assert (=> b!980529 (=> (not res!656210) (not e!552671))))

(assert (=> b!980529 (= res!656210 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980530 () Bool)

(declare-fun res!656208 () Bool)

(assert (=> b!980530 (=> (not res!656208) (not e!552671))))

(declare-datatypes ((List!20493 0))(
  ( (Nil!20490) (Cons!20489 (h!21651 (_ BitVec 64)) (t!29162 List!20493)) )
))
(declare-fun arrayNoDuplicates!0 (array!61421 (_ BitVec 32) List!20493) Bool)

(assert (=> b!980530 (= res!656208 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20490))))

(declare-fun b!980531 () Bool)

(assert (=> b!980531 (= e!552668 tp_is_empty!22707)))

(declare-fun mapNonEmpty!36089 () Bool)

(declare-fun tp!68580 () Bool)

(assert (=> mapNonEmpty!36089 (= mapRes!36089 (and tp!68580 e!552672))))

(declare-fun mapKey!36089 () (_ BitVec 32))

(declare-fun mapValue!36089 () ValueCell!10872)

(declare-fun mapRest!36089 () (Array (_ BitVec 32) ValueCell!10872))

(assert (=> mapNonEmpty!36089 (= (arr!29569 _values!1278) (store mapRest!36089 mapKey!36089 mapValue!36089))))

(declare-fun res!656211 () Bool)

(assert (=> start!83904 (=> (not res!656211) (not e!552671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83904 (= res!656211 (validMask!0 mask!1948))))

(assert (=> start!83904 e!552671))

(assert (=> start!83904 true))

(assert (=> start!83904 tp_is_empty!22707))

(declare-fun array_inv!22859 (array!61423) Bool)

(assert (=> start!83904 (and (array_inv!22859 _values!1278) e!552667)))

(assert (=> start!83904 tp!68581))

(declare-fun array_inv!22860 (array!61421) Bool)

(assert (=> start!83904 (array_inv!22860 _keys!1544)))

(declare-fun b!980524 () Bool)

(assert (=> b!980524 (= e!552671 (not e!552670))))

(declare-fun res!656212 () Bool)

(assert (=> b!980524 (=> res!656212 e!552670)))

(assert (=> b!980524 (= res!656212 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29568 _keys!1544) from!1932)))))

(declare-fun lt!435381 () tuple2!14626)

(declare-fun lt!435382 () ListLongMap!13323)

(assert (=> b!980524 (= (+!2982 lt!435382 lt!435388) (+!2982 lt!435387 lt!435381))))

(declare-fun lt!435389 () ListLongMap!13323)

(assert (=> b!980524 (= lt!435387 (+!2982 lt!435389 lt!435388))))

(assert (=> b!980524 (= lt!435388 (tuple2!14627 (select (arr!29568 _keys!1544) from!1932) lt!435385))))

(assert (=> b!980524 (= lt!435382 (+!2982 lt!435389 lt!435381))))

(declare-fun minValue!1220 () V!35259)

(assert (=> b!980524 (= lt!435381 (tuple2!14627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435380 () Unit!32603)

(assert (=> b!980524 (= lt!435380 (addCommutativeForDiffKeys!610 lt!435389 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29568 _keys!1544) from!1932) lt!435385))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15331 (ValueCell!10872 V!35259) V!35259)

(declare-fun dynLambda!1768 (Int (_ BitVec 64)) V!35259)

(assert (=> b!980524 (= lt!435385 (get!15331 (select (arr!29569 _values!1278) from!1932) (dynLambda!1768 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980524 (= lt!435389 (+!2982 lt!435383 lt!435384))))

(assert (=> b!980524 (= lt!435384 (tuple2!14627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3382 (array!61421 array!61423 (_ BitVec 32) (_ BitVec 32) V!35259 V!35259 (_ BitVec 32) Int) ListLongMap!13323)

(assert (=> b!980524 (= lt!435383 (getCurrentListMapNoExtraKeys!3382 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!83904 res!656211) b!980526))

(assert (= (and b!980526 res!656207) b!980528))

(assert (= (and b!980528 res!656213) b!980530))

(assert (= (and b!980530 res!656208) b!980523))

(assert (= (and b!980523 res!656206) b!980521))

(assert (= (and b!980521 res!656209) b!980529))

(assert (= (and b!980529 res!656210) b!980524))

(assert (= (and b!980524 (not res!656212)) b!980527))

(assert (= (and b!980525 condMapEmpty!36089) mapIsEmpty!36089))

(assert (= (and b!980525 (not condMapEmpty!36089)) mapNonEmpty!36089))

(get-info :version)

(assert (= (and mapNonEmpty!36089 ((_ is ValueCellFull!10872) mapValue!36089)) b!980522))

(assert (= (and b!980525 ((_ is ValueCellFull!10872) mapDefault!36089)) b!980531))

(assert (= start!83904 b!980525))

(declare-fun b_lambda!14757 () Bool)

(assert (=> (not b_lambda!14757) (not b!980524)))

(declare-fun t!29160 () Bool)

(declare-fun tb!6519 () Bool)

(assert (=> (and start!83904 (= defaultEntry!1281 defaultEntry!1281) t!29160) tb!6519))

(declare-fun result!13027 () Bool)

(assert (=> tb!6519 (= result!13027 tp_is_empty!22707)))

(assert (=> b!980524 t!29160))

(declare-fun b_and!31517 () Bool)

(assert (= b_and!31515 (and (=> t!29160 result!13027) b_and!31517)))

(declare-fun m!908047 () Bool)

(assert (=> b!980530 m!908047))

(declare-fun m!908049 () Bool)

(assert (=> start!83904 m!908049))

(declare-fun m!908051 () Bool)

(assert (=> start!83904 m!908051))

(declare-fun m!908053 () Bool)

(assert (=> start!83904 m!908053))

(declare-fun m!908055 () Bool)

(assert (=> mapNonEmpty!36089 m!908055))

(declare-fun m!908057 () Bool)

(assert (=> b!980527 m!908057))

(assert (=> b!980527 m!908057))

(declare-fun m!908059 () Bool)

(assert (=> b!980527 m!908059))

(declare-fun m!908061 () Bool)

(assert (=> b!980527 m!908061))

(assert (=> b!980527 m!908061))

(declare-fun m!908063 () Bool)

(assert (=> b!980527 m!908063))

(declare-fun m!908065 () Bool)

(assert (=> b!980524 m!908065))

(assert (=> b!980524 m!908061))

(declare-fun m!908067 () Bool)

(assert (=> b!980524 m!908067))

(declare-fun m!908069 () Bool)

(assert (=> b!980524 m!908069))

(declare-fun m!908071 () Bool)

(assert (=> b!980524 m!908071))

(assert (=> b!980524 m!908061))

(declare-fun m!908073 () Bool)

(assert (=> b!980524 m!908073))

(declare-fun m!908075 () Bool)

(assert (=> b!980524 m!908075))

(declare-fun m!908077 () Bool)

(assert (=> b!980524 m!908077))

(declare-fun m!908079 () Bool)

(assert (=> b!980524 m!908079))

(declare-fun m!908081 () Bool)

(assert (=> b!980524 m!908081))

(assert (=> b!980524 m!908067))

(assert (=> b!980524 m!908081))

(declare-fun m!908083 () Bool)

(assert (=> b!980524 m!908083))

(declare-fun m!908085 () Bool)

(assert (=> b!980528 m!908085))

(assert (=> b!980521 m!908061))

(assert (=> b!980521 m!908061))

(declare-fun m!908087 () Bool)

(assert (=> b!980521 m!908087))

(check-sat (not mapNonEmpty!36089) (not b!980530) (not b_next!19713) (not b!980524) (not b!980528) (not b!980521) tp_is_empty!22707 (not start!83904) (not b_lambda!14757) b_and!31517 (not b!980527))
(check-sat b_and!31517 (not b_next!19713))
