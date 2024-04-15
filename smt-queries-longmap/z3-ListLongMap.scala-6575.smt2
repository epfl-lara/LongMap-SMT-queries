; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83316 () Bool)

(assert start!83316)

(declare-fun b_free!19327 () Bool)

(declare-fun b_next!19327 () Bool)

(assert (=> start!83316 (= b_free!19327 (not b_next!19327))))

(declare-fun tp!67260 () Bool)

(declare-fun b_and!30849 () Bool)

(assert (=> start!83316 (= tp!67260 b_and!30849)))

(declare-fun mapNonEmpty!35347 () Bool)

(declare-fun mapRes!35347 () Bool)

(declare-fun tp!67261 () Bool)

(declare-fun e!548201 () Bool)

(assert (=> mapNonEmpty!35347 (= mapRes!35347 (and tp!67261 e!548201))))

(declare-fun mapKey!35347 () (_ BitVec 32))

(declare-datatypes ((V!34617 0))(
  ( (V!34618 (val!11163 Int)) )
))
(declare-datatypes ((ValueCell!10631 0))(
  ( (ValueCellFull!10631 (v!13721 V!34617)) (EmptyCell!10631) )
))
(declare-datatypes ((array!60426 0))(
  ( (array!60427 (arr!29077 (Array (_ BitVec 32) ValueCell!10631)) (size!29558 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60426)

(declare-fun mapRest!35347 () (Array (_ BitVec 32) ValueCell!10631))

(declare-fun mapValue!35347 () ValueCell!10631)

(assert (=> mapNonEmpty!35347 (= (arr!29077 _values!1425) (store mapRest!35347 mapKey!35347 mapValue!35347))))

(declare-fun b!972622 () Bool)

(declare-fun e!548199 () Bool)

(declare-fun e!548202 () Bool)

(assert (=> b!972622 (= e!548199 (and e!548202 mapRes!35347))))

(declare-fun condMapEmpty!35347 () Bool)

(declare-fun mapDefault!35347 () ValueCell!10631)

(assert (=> b!972622 (= condMapEmpty!35347 (= (arr!29077 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10631)) mapDefault!35347)))))

(declare-fun res!651092 () Bool)

(declare-fun e!548200 () Bool)

(assert (=> start!83316 (=> (not res!651092) (not e!548200))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83316 (= res!651092 (validMask!0 mask!2147))))

(assert (=> start!83316 e!548200))

(assert (=> start!83316 true))

(declare-fun array_inv!22551 (array!60426) Bool)

(assert (=> start!83316 (and (array_inv!22551 _values!1425) e!548199)))

(declare-fun tp_is_empty!22225 () Bool)

(assert (=> start!83316 tp_is_empty!22225))

(assert (=> start!83316 tp!67260))

(declare-datatypes ((array!60428 0))(
  ( (array!60429 (arr!29078 (Array (_ BitVec 32) (_ BitVec 64))) (size!29559 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60428)

(declare-fun array_inv!22552 (array!60428) Bool)

(assert (=> start!83316 (array_inv!22552 _keys!1717)))

(declare-fun b!972623 () Bool)

(declare-fun e!548197 () Bool)

(assert (=> b!972623 (= e!548197 (not true))))

(declare-datatypes ((tuple2!14400 0))(
  ( (tuple2!14401 (_1!7211 (_ BitVec 64)) (_2!7211 V!34617)) )
))
(declare-fun lt!431916 () tuple2!14400)

(declare-datatypes ((List!20211 0))(
  ( (Nil!20208) (Cons!20207 (h!21369 tuple2!14400) (t!28627 List!20211)) )
))
(declare-datatypes ((ListLongMap!13087 0))(
  ( (ListLongMap!13088 (toList!6559 List!20211)) )
))
(declare-fun lt!431918 () ListLongMap!13087)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5600 (ListLongMap!13087 (_ BitVec 64)) Bool)

(declare-fun +!2912 (ListLongMap!13087 tuple2!14400) ListLongMap!13087)

(assert (=> b!972623 (contains!5600 (+!2912 lt!431918 lt!431916) (select (arr!29078 _keys!1717) i!822))))

(declare-fun lt!431920 () V!34617)

(declare-datatypes ((Unit!32276 0))(
  ( (Unit!32277) )
))
(declare-fun lt!431917 () Unit!32276)

(declare-fun lt!431919 () (_ BitVec 64))

(declare-fun addStillContains!582 (ListLongMap!13087 (_ BitVec 64) V!34617 (_ BitVec 64)) Unit!32276)

(assert (=> b!972623 (= lt!431917 (addStillContains!582 lt!431918 lt!431919 lt!431920 (select (arr!29078 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34617)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34617)

(declare-fun lt!431921 () ListLongMap!13087)

(declare-fun getCurrentListMap!3721 (array!60428 array!60426 (_ BitVec 32) (_ BitVec 32) V!34617 V!34617 (_ BitVec 32) Int) ListLongMap!13087)

(assert (=> b!972623 (= lt!431921 (+!2912 (getCurrentListMap!3721 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!431916))))

(assert (=> b!972623 (= lt!431916 (tuple2!14401 lt!431919 lt!431920))))

(declare-fun get!15073 (ValueCell!10631 V!34617) V!34617)

(declare-fun dynLambda!1668 (Int (_ BitVec 64)) V!34617)

(assert (=> b!972623 (= lt!431920 (get!15073 (select (arr!29077 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1668 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!431922 () Unit!32276)

(declare-fun lemmaListMapRecursiveValidKeyArray!252 (array!60428 array!60426 (_ BitVec 32) (_ BitVec 32) V!34617 V!34617 (_ BitVec 32) Int) Unit!32276)

(assert (=> b!972623 (= lt!431922 (lemmaListMapRecursiveValidKeyArray!252 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972624 () Bool)

(declare-fun res!651091 () Bool)

(assert (=> b!972624 (=> (not res!651091) (not e!548200))))

(assert (=> b!972624 (= res!651091 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29559 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29559 _keys!1717))))))

(declare-fun b!972625 () Bool)

(declare-fun e!548198 () Bool)

(assert (=> b!972625 (= e!548200 e!548198)))

(declare-fun res!651087 () Bool)

(assert (=> b!972625 (=> (not res!651087) (not e!548198))))

(assert (=> b!972625 (= res!651087 (contains!5600 lt!431918 (select (arr!29078 _keys!1717) i!822)))))

(assert (=> b!972625 (= lt!431918 (getCurrentListMap!3721 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!972626 () Bool)

(declare-fun res!651088 () Bool)

(assert (=> b!972626 (=> (not res!651088) (not e!548200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60428 (_ BitVec 32)) Bool)

(assert (=> b!972626 (= res!651088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972627 () Bool)

(declare-fun res!651093 () Bool)

(assert (=> b!972627 (=> (not res!651093) (not e!548200))))

(declare-datatypes ((List!20212 0))(
  ( (Nil!20209) (Cons!20208 (h!21370 (_ BitVec 64)) (t!28628 List!20212)) )
))
(declare-fun arrayNoDuplicates!0 (array!60428 (_ BitVec 32) List!20212) Bool)

(assert (=> b!972627 (= res!651093 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20209))))

(declare-fun b!972628 () Bool)

(assert (=> b!972628 (= e!548202 tp_is_empty!22225)))

(declare-fun b!972629 () Bool)

(declare-fun res!651089 () Bool)

(assert (=> b!972629 (=> (not res!651089) (not e!548200))))

(assert (=> b!972629 (= res!651089 (and (= (size!29558 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29559 _keys!1717) (size!29558 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972630 () Bool)

(assert (=> b!972630 (= e!548198 e!548197)))

(declare-fun res!651094 () Bool)

(assert (=> b!972630 (=> (not res!651094) (not e!548197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972630 (= res!651094 (validKeyInArray!0 lt!431919))))

(assert (=> b!972630 (= lt!431919 (select (arr!29078 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972630 (= lt!431921 (getCurrentListMap!3721 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972631 () Bool)

(assert (=> b!972631 (= e!548201 tp_is_empty!22225)))

(declare-fun mapIsEmpty!35347 () Bool)

(assert (=> mapIsEmpty!35347 mapRes!35347))

(declare-fun b!972632 () Bool)

(declare-fun res!651090 () Bool)

(assert (=> b!972632 (=> (not res!651090) (not e!548200))))

(assert (=> b!972632 (= res!651090 (validKeyInArray!0 (select (arr!29078 _keys!1717) i!822)))))

(assert (= (and start!83316 res!651092) b!972629))

(assert (= (and b!972629 res!651089) b!972626))

(assert (= (and b!972626 res!651088) b!972627))

(assert (= (and b!972627 res!651093) b!972624))

(assert (= (and b!972624 res!651091) b!972632))

(assert (= (and b!972632 res!651090) b!972625))

(assert (= (and b!972625 res!651087) b!972630))

(assert (= (and b!972630 res!651094) b!972623))

(assert (= (and b!972622 condMapEmpty!35347) mapIsEmpty!35347))

(assert (= (and b!972622 (not condMapEmpty!35347)) mapNonEmpty!35347))

(get-info :version)

(assert (= (and mapNonEmpty!35347 ((_ is ValueCellFull!10631) mapValue!35347)) b!972631))

(assert (= (and b!972622 ((_ is ValueCellFull!10631) mapDefault!35347)) b!972628))

(assert (= start!83316 b!972622))

(declare-fun b_lambda!14473 () Bool)

(assert (=> (not b_lambda!14473) (not b!972623)))

(declare-fun t!28626 () Bool)

(declare-fun tb!6267 () Bool)

(assert (=> (and start!83316 (= defaultEntry!1428 defaultEntry!1428) t!28626) tb!6267))

(declare-fun result!12519 () Bool)

(assert (=> tb!6267 (= result!12519 tp_is_empty!22225)))

(assert (=> b!972623 t!28626))

(declare-fun b_and!30851 () Bool)

(assert (= b_and!30849 (and (=> t!28626 result!12519) b_and!30851)))

(declare-fun m!899549 () Bool)

(assert (=> b!972627 m!899549))

(declare-fun m!899551 () Bool)

(assert (=> b!972625 m!899551))

(assert (=> b!972625 m!899551))

(declare-fun m!899553 () Bool)

(assert (=> b!972625 m!899553))

(declare-fun m!899555 () Bool)

(assert (=> b!972625 m!899555))

(declare-fun m!899557 () Bool)

(assert (=> b!972626 m!899557))

(declare-fun m!899559 () Bool)

(assert (=> b!972630 m!899559))

(declare-fun m!899561 () Bool)

(assert (=> b!972630 m!899561))

(declare-fun m!899563 () Bool)

(assert (=> b!972630 m!899563))

(declare-fun m!899565 () Bool)

(assert (=> mapNonEmpty!35347 m!899565))

(declare-fun m!899567 () Bool)

(assert (=> b!972623 m!899567))

(declare-fun m!899569 () Bool)

(assert (=> b!972623 m!899569))

(declare-fun m!899571 () Bool)

(assert (=> b!972623 m!899571))

(assert (=> b!972623 m!899567))

(declare-fun m!899573 () Bool)

(assert (=> b!972623 m!899573))

(assert (=> b!972623 m!899551))

(assert (=> b!972623 m!899571))

(assert (=> b!972623 m!899573))

(declare-fun m!899575 () Bool)

(assert (=> b!972623 m!899575))

(declare-fun m!899577 () Bool)

(assert (=> b!972623 m!899577))

(assert (=> b!972623 m!899551))

(declare-fun m!899579 () Bool)

(assert (=> b!972623 m!899579))

(assert (=> b!972623 m!899577))

(assert (=> b!972623 m!899551))

(declare-fun m!899581 () Bool)

(assert (=> b!972623 m!899581))

(declare-fun m!899583 () Bool)

(assert (=> b!972623 m!899583))

(declare-fun m!899585 () Bool)

(assert (=> start!83316 m!899585))

(declare-fun m!899587 () Bool)

(assert (=> start!83316 m!899587))

(declare-fun m!899589 () Bool)

(assert (=> start!83316 m!899589))

(assert (=> b!972632 m!899551))

(assert (=> b!972632 m!899551))

(declare-fun m!899591 () Bool)

(assert (=> b!972632 m!899591))

(check-sat (not start!83316) (not b!972630) (not mapNonEmpty!35347) (not b!972632) (not b!972623) (not b!972625) (not b_next!19327) (not b!972627) (not b!972626) tp_is_empty!22225 (not b_lambda!14473) b_and!30851)
(check-sat b_and!30851 (not b_next!19327))
