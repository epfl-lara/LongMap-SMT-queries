; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83528 () Bool)

(assert start!83528)

(declare-fun b_free!19515 () Bool)

(declare-fun b_next!19515 () Bool)

(assert (=> start!83528 (= b_free!19515 (not b_next!19515))))

(declare-fun tp!67832 () Bool)

(declare-fun b_and!31125 () Bool)

(assert (=> start!83528 (= tp!67832 b_and!31125)))

(declare-fun mapIsEmpty!35638 () Bool)

(declare-fun mapRes!35638 () Bool)

(assert (=> mapIsEmpty!35638 mapRes!35638))

(declare-fun b!975908 () Bool)

(declare-fun res!653315 () Bool)

(declare-fun e!549991 () Bool)

(assert (=> b!975908 (=> (not res!653315) (not e!549991))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34875 0))(
  ( (V!34876 (val!11260 Int)) )
))
(declare-datatypes ((ValueCell!10728 0))(
  ( (ValueCellFull!10728 (v!13819 V!34875)) (EmptyCell!10728) )
))
(declare-datatypes ((array!60867 0))(
  ( (array!60868 (arr!29297 (Array (_ BitVec 32) ValueCell!10728)) (size!29776 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60867)

(declare-fun zeroValue!1367 () V!34875)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60869 0))(
  ( (array!60870 (arr!29298 (Array (_ BitVec 32) (_ BitVec 64))) (size!29777 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60869)

(declare-fun minValue!1367 () V!34875)

(declare-datatypes ((tuple2!14482 0))(
  ( (tuple2!14483 (_1!7252 (_ BitVec 64)) (_2!7252 V!34875)) )
))
(declare-datatypes ((List!20335 0))(
  ( (Nil!20332) (Cons!20331 (h!21493 tuple2!14482) (t!28822 List!20335)) )
))
(declare-datatypes ((ListLongMap!13179 0))(
  ( (ListLongMap!13180 (toList!6605 List!20335)) )
))
(declare-fun contains!5686 (ListLongMap!13179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3838 (array!60869 array!60867 (_ BitVec 32) (_ BitVec 32) V!34875 V!34875 (_ BitVec 32) Int) ListLongMap!13179)

(assert (=> b!975908 (= res!653315 (contains!5686 (getCurrentListMap!3838 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29298 _keys!1717) i!822)))))

(declare-fun b!975909 () Bool)

(declare-fun res!653310 () Bool)

(assert (=> b!975909 (=> (not res!653310) (not e!549991))))

(declare-datatypes ((List!20336 0))(
  ( (Nil!20333) (Cons!20332 (h!21494 (_ BitVec 64)) (t!28823 List!20336)) )
))
(declare-fun arrayNoDuplicates!0 (array!60869 (_ BitVec 32) List!20336) Bool)

(assert (=> b!975909 (= res!653310 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20333))))

(declare-fun b!975910 () Bool)

(declare-fun res!653313 () Bool)

(assert (=> b!975910 (=> (not res!653313) (not e!549991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975910 (= res!653313 (validKeyInArray!0 (select (arr!29298 _keys!1717) i!822)))))

(declare-fun b!975911 () Bool)

(declare-fun e!549993 () Bool)

(assert (=> b!975911 (= e!549991 e!549993)))

(declare-fun res!653312 () Bool)

(assert (=> b!975911 (=> (not res!653312) (not e!549993))))

(declare-fun lt!432937 () (_ BitVec 64))

(assert (=> b!975911 (= res!653312 (validKeyInArray!0 lt!432937))))

(assert (=> b!975911 (= lt!432937 (select (arr!29298 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432936 () ListLongMap!13179)

(assert (=> b!975911 (= lt!432936 (getCurrentListMap!3838 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975912 () Bool)

(declare-fun e!549990 () Bool)

(declare-fun tp_is_empty!22419 () Bool)

(assert (=> b!975912 (= e!549990 tp_is_empty!22419)))

(declare-fun mapNonEmpty!35638 () Bool)

(declare-fun tp!67833 () Bool)

(assert (=> mapNonEmpty!35638 (= mapRes!35638 (and tp!67833 e!549990))))

(declare-fun mapRest!35638 () (Array (_ BitVec 32) ValueCell!10728))

(declare-fun mapValue!35638 () ValueCell!10728)

(declare-fun mapKey!35638 () (_ BitVec 32))

(assert (=> mapNonEmpty!35638 (= (arr!29297 _values!1425) (store mapRest!35638 mapKey!35638 mapValue!35638))))

(declare-fun b!975914 () Bool)

(declare-fun res!653311 () Bool)

(assert (=> b!975914 (=> (not res!653311) (not e!549991))))

(assert (=> b!975914 (= res!653311 (and (= (size!29776 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29777 _keys!1717) (size!29776 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975915 () Bool)

(declare-fun e!549992 () Bool)

(assert (=> b!975915 (= e!549992 tp_is_empty!22419)))

(declare-fun b!975916 () Bool)

(declare-fun res!653309 () Bool)

(assert (=> b!975916 (=> (not res!653309) (not e!549991))))

(assert (=> b!975916 (= res!653309 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29777 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29777 _keys!1717))))))

(declare-fun b!975917 () Bool)

(declare-fun e!549989 () Bool)

(assert (=> b!975917 (= e!549989 (and e!549992 mapRes!35638))))

(declare-fun condMapEmpty!35638 () Bool)

(declare-fun mapDefault!35638 () ValueCell!10728)

(assert (=> b!975917 (= condMapEmpty!35638 (= (arr!29297 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10728)) mapDefault!35638)))))

(declare-fun b!975918 () Bool)

(declare-fun res!653316 () Bool)

(assert (=> b!975918 (=> (not res!653316) (not e!549991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60869 (_ BitVec 32)) Bool)

(assert (=> b!975918 (= res!653316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!653314 () Bool)

(assert (=> start!83528 (=> (not res!653314) (not e!549991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83528 (= res!653314 (validMask!0 mask!2147))))

(assert (=> start!83528 e!549991))

(assert (=> start!83528 true))

(declare-fun array_inv!22655 (array!60867) Bool)

(assert (=> start!83528 (and (array_inv!22655 _values!1425) e!549989)))

(assert (=> start!83528 tp_is_empty!22419))

(assert (=> start!83528 tp!67832))

(declare-fun array_inv!22656 (array!60869) Bool)

(assert (=> start!83528 (array_inv!22656 _keys!1717)))

(declare-fun b!975913 () Bool)

(assert (=> b!975913 (= e!549993 (not (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29776 _values!1425))))))

(declare-fun +!2916 (ListLongMap!13179 tuple2!14482) ListLongMap!13179)

(declare-fun get!15169 (ValueCell!10728 V!34875) V!34875)

(declare-fun dynLambda!1705 (Int (_ BitVec 64)) V!34875)

(assert (=> b!975913 (= lt!432936 (+!2916 (getCurrentListMap!3838 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14483 lt!432937 (get!15169 (select (arr!29297 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1705 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32453 0))(
  ( (Unit!32454) )
))
(declare-fun lt!432938 () Unit!32453)

(declare-fun lemmaListMapRecursiveValidKeyArray!282 (array!60869 array!60867 (_ BitVec 32) (_ BitVec 32) V!34875 V!34875 (_ BitVec 32) Int) Unit!32453)

(assert (=> b!975913 (= lt!432938 (lemmaListMapRecursiveValidKeyArray!282 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83528 res!653314) b!975914))

(assert (= (and b!975914 res!653311) b!975918))

(assert (= (and b!975918 res!653316) b!975909))

(assert (= (and b!975909 res!653310) b!975916))

(assert (= (and b!975916 res!653309) b!975910))

(assert (= (and b!975910 res!653313) b!975908))

(assert (= (and b!975908 res!653315) b!975911))

(assert (= (and b!975911 res!653312) b!975913))

(assert (= (and b!975917 condMapEmpty!35638) mapIsEmpty!35638))

(assert (= (and b!975917 (not condMapEmpty!35638)) mapNonEmpty!35638))

(get-info :version)

(assert (= (and mapNonEmpty!35638 ((_ is ValueCellFull!10728) mapValue!35638)) b!975912))

(assert (= (and b!975917 ((_ is ValueCellFull!10728) mapDefault!35638)) b!975915))

(assert (= start!83528 b!975917))

(declare-fun b_lambda!14553 () Bool)

(assert (=> (not b_lambda!14553) (not b!975913)))

(declare-fun t!28821 () Bool)

(declare-fun tb!6337 () Bool)

(assert (=> (and start!83528 (= defaultEntry!1428 defaultEntry!1428) t!28821) tb!6337))

(declare-fun result!12651 () Bool)

(assert (=> tb!6337 (= result!12651 tp_is_empty!22419)))

(assert (=> b!975913 t!28821))

(declare-fun b_and!31127 () Bool)

(assert (= b_and!31125 (and (=> t!28821 result!12651) b_and!31127)))

(declare-fun m!903081 () Bool)

(assert (=> b!975911 m!903081))

(declare-fun m!903083 () Bool)

(assert (=> b!975911 m!903083))

(declare-fun m!903085 () Bool)

(assert (=> b!975911 m!903085))

(declare-fun m!903087 () Bool)

(assert (=> b!975913 m!903087))

(declare-fun m!903089 () Bool)

(assert (=> b!975913 m!903089))

(declare-fun m!903091 () Bool)

(assert (=> b!975913 m!903091))

(assert (=> b!975913 m!903087))

(declare-fun m!903093 () Bool)

(assert (=> b!975913 m!903093))

(assert (=> b!975913 m!903091))

(assert (=> b!975913 m!903093))

(declare-fun m!903095 () Bool)

(assert (=> b!975913 m!903095))

(declare-fun m!903097 () Bool)

(assert (=> b!975913 m!903097))

(declare-fun m!903099 () Bool)

(assert (=> b!975910 m!903099))

(assert (=> b!975910 m!903099))

(declare-fun m!903101 () Bool)

(assert (=> b!975910 m!903101))

(declare-fun m!903103 () Bool)

(assert (=> b!975918 m!903103))

(declare-fun m!903105 () Bool)

(assert (=> b!975909 m!903105))

(declare-fun m!903107 () Bool)

(assert (=> b!975908 m!903107))

(assert (=> b!975908 m!903099))

(assert (=> b!975908 m!903107))

(assert (=> b!975908 m!903099))

(declare-fun m!903109 () Bool)

(assert (=> b!975908 m!903109))

(declare-fun m!903111 () Bool)

(assert (=> start!83528 m!903111))

(declare-fun m!903113 () Bool)

(assert (=> start!83528 m!903113))

(declare-fun m!903115 () Bool)

(assert (=> start!83528 m!903115))

(declare-fun m!903117 () Bool)

(assert (=> mapNonEmpty!35638 m!903117))

(check-sat (not mapNonEmpty!35638) (not start!83528) (not b!975918) (not b!975910) (not b!975909) (not b_next!19515) b_and!31127 tp_is_empty!22419 (not b!975911) (not b!975913) (not b_lambda!14553) (not b!975908))
(check-sat b_and!31127 (not b_next!19515))
