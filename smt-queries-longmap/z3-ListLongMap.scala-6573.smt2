; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83304 () Bool)

(assert start!83304)

(declare-fun b_free!19315 () Bool)

(declare-fun b_next!19315 () Bool)

(assert (=> start!83304 (= b_free!19315 (not b_next!19315))))

(declare-fun tp!67224 () Bool)

(declare-fun b_and!30825 () Bool)

(assert (=> start!83304 (= tp!67224 b_and!30825)))

(declare-fun b!972412 () Bool)

(declare-fun e!548091 () Bool)

(declare-fun tp_is_empty!22213 () Bool)

(assert (=> b!972412 (= e!548091 tp_is_empty!22213)))

(declare-fun b!972413 () Bool)

(declare-fun e!548088 () Bool)

(declare-fun e!548087 () Bool)

(assert (=> b!972413 (= e!548088 e!548087)))

(declare-fun res!650946 () Bool)

(assert (=> b!972413 (=> (not res!650946) (not e!548087))))

(declare-fun lt!431855 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972413 (= res!650946 (validKeyInArray!0 lt!431855))))

(declare-datatypes ((array!60402 0))(
  ( (array!60403 (arr!29065 (Array (_ BitVec 32) (_ BitVec 64))) (size!29546 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60402)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972413 (= lt!431855 (select (arr!29065 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34601 0))(
  ( (V!34602 (val!11157 Int)) )
))
(declare-datatypes ((tuple2!14390 0))(
  ( (tuple2!14391 (_1!7206 (_ BitVec 64)) (_2!7206 V!34601)) )
))
(declare-datatypes ((List!20202 0))(
  ( (Nil!20199) (Cons!20198 (h!21360 tuple2!14390) (t!28606 List!20202)) )
))
(declare-datatypes ((ListLongMap!13077 0))(
  ( (ListLongMap!13078 (toList!6554 List!20202)) )
))
(declare-fun lt!431854 () ListLongMap!13077)

(declare-datatypes ((ValueCell!10625 0))(
  ( (ValueCellFull!10625 (v!13715 V!34601)) (EmptyCell!10625) )
))
(declare-datatypes ((array!60404 0))(
  ( (array!60405 (arr!29066 (Array (_ BitVec 32) ValueCell!10625)) (size!29547 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60404)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34601)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34601)

(declare-fun getCurrentListMap!3716 (array!60402 array!60404 (_ BitVec 32) (_ BitVec 32) V!34601 V!34601 (_ BitVec 32) Int) ListLongMap!13077)

(assert (=> b!972413 (= lt!431854 (getCurrentListMap!3716 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972414 () Bool)

(assert (=> b!972414 (= e!548087 (not (and (bvsge from!2118 #b00000000000000000000000000000000) (bvsle from!2118 (size!29546 _keys!1717)))))))

(declare-fun +!2908 (ListLongMap!13077 tuple2!14390) ListLongMap!13077)

(declare-fun get!15065 (ValueCell!10625 V!34601) V!34601)

(declare-fun dynLambda!1664 (Int (_ BitVec 64)) V!34601)

(assert (=> b!972414 (= lt!431854 (+!2908 (getCurrentListMap!3716 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14391 lt!431855 (get!15065 (select (arr!29066 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1664 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32268 0))(
  ( (Unit!32269) )
))
(declare-fun lt!431856 () Unit!32268)

(declare-fun lemmaListMapRecursiveValidKeyArray!248 (array!60402 array!60404 (_ BitVec 32) (_ BitVec 32) V!34601 V!34601 (_ BitVec 32) Int) Unit!32268)

(assert (=> b!972414 (= lt!431856 (lemmaListMapRecursiveValidKeyArray!248 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972415 () Bool)

(declare-fun res!650950 () Bool)

(assert (=> b!972415 (=> (not res!650950) (not e!548088))))

(assert (=> b!972415 (= res!650950 (and (= (size!29547 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29546 _keys!1717) (size!29547 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!650949 () Bool)

(assert (=> start!83304 (=> (not res!650949) (not e!548088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83304 (= res!650949 (validMask!0 mask!2147))))

(assert (=> start!83304 e!548088))

(assert (=> start!83304 true))

(declare-fun e!548086 () Bool)

(declare-fun array_inv!22545 (array!60404) Bool)

(assert (=> start!83304 (and (array_inv!22545 _values!1425) e!548086)))

(assert (=> start!83304 tp_is_empty!22213))

(assert (=> start!83304 tp!67224))

(declare-fun array_inv!22546 (array!60402) Bool)

(assert (=> start!83304 (array_inv!22546 _keys!1717)))

(declare-fun b!972416 () Bool)

(declare-fun res!650943 () Bool)

(assert (=> b!972416 (=> (not res!650943) (not e!548088))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5595 (ListLongMap!13077 (_ BitVec 64)) Bool)

(assert (=> b!972416 (= res!650943 (contains!5595 (getCurrentListMap!3716 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29065 _keys!1717) i!822)))))

(declare-fun b!972417 () Bool)

(declare-fun res!650948 () Bool)

(assert (=> b!972417 (=> (not res!650948) (not e!548088))))

(declare-datatypes ((List!20203 0))(
  ( (Nil!20200) (Cons!20199 (h!21361 (_ BitVec 64)) (t!28607 List!20203)) )
))
(declare-fun arrayNoDuplicates!0 (array!60402 (_ BitVec 32) List!20203) Bool)

(assert (=> b!972417 (= res!650948 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20200))))

(declare-fun b!972418 () Bool)

(declare-fun res!650944 () Bool)

(assert (=> b!972418 (=> (not res!650944) (not e!548088))))

(assert (=> b!972418 (= res!650944 (validKeyInArray!0 (select (arr!29065 _keys!1717) i!822)))))

(declare-fun b!972419 () Bool)

(declare-fun e!548089 () Bool)

(assert (=> b!972419 (= e!548089 tp_is_empty!22213)))

(declare-fun b!972420 () Bool)

(declare-fun res!650947 () Bool)

(assert (=> b!972420 (=> (not res!650947) (not e!548088))))

(assert (=> b!972420 (= res!650947 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29546 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29546 _keys!1717))))))

(declare-fun mapIsEmpty!35329 () Bool)

(declare-fun mapRes!35329 () Bool)

(assert (=> mapIsEmpty!35329 mapRes!35329))

(declare-fun b!972421 () Bool)

(assert (=> b!972421 (= e!548086 (and e!548089 mapRes!35329))))

(declare-fun condMapEmpty!35329 () Bool)

(declare-fun mapDefault!35329 () ValueCell!10625)

(assert (=> b!972421 (= condMapEmpty!35329 (= (arr!29066 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10625)) mapDefault!35329)))))

(declare-fun mapNonEmpty!35329 () Bool)

(declare-fun tp!67225 () Bool)

(assert (=> mapNonEmpty!35329 (= mapRes!35329 (and tp!67225 e!548091))))

(declare-fun mapKey!35329 () (_ BitVec 32))

(declare-fun mapRest!35329 () (Array (_ BitVec 32) ValueCell!10625))

(declare-fun mapValue!35329 () ValueCell!10625)

(assert (=> mapNonEmpty!35329 (= (arr!29066 _values!1425) (store mapRest!35329 mapKey!35329 mapValue!35329))))

(declare-fun b!972422 () Bool)

(declare-fun res!650945 () Bool)

(assert (=> b!972422 (=> (not res!650945) (not e!548088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60402 (_ BitVec 32)) Bool)

(assert (=> b!972422 (= res!650945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83304 res!650949) b!972415))

(assert (= (and b!972415 res!650950) b!972422))

(assert (= (and b!972422 res!650945) b!972417))

(assert (= (and b!972417 res!650948) b!972420))

(assert (= (and b!972420 res!650947) b!972418))

(assert (= (and b!972418 res!650944) b!972416))

(assert (= (and b!972416 res!650943) b!972413))

(assert (= (and b!972413 res!650946) b!972414))

(assert (= (and b!972421 condMapEmpty!35329) mapIsEmpty!35329))

(assert (= (and b!972421 (not condMapEmpty!35329)) mapNonEmpty!35329))

(get-info :version)

(assert (= (and mapNonEmpty!35329 ((_ is ValueCellFull!10625) mapValue!35329)) b!972412))

(assert (= (and b!972421 ((_ is ValueCellFull!10625) mapDefault!35329)) b!972419))

(assert (= start!83304 b!972421))

(declare-fun b_lambda!14461 () Bool)

(assert (=> (not b_lambda!14461) (not b!972414)))

(declare-fun t!28605 () Bool)

(declare-fun tb!6255 () Bool)

(assert (=> (and start!83304 (= defaultEntry!1428 defaultEntry!1428) t!28605) tb!6255))

(declare-fun result!12495 () Bool)

(assert (=> tb!6255 (= result!12495 tp_is_empty!22213)))

(assert (=> b!972414 t!28605))

(declare-fun b_and!30827 () Bool)

(assert (= b_and!30825 (and (=> t!28605 result!12495) b_and!30827)))

(declare-fun m!899321 () Bool)

(assert (=> mapNonEmpty!35329 m!899321))

(declare-fun m!899323 () Bool)

(assert (=> b!972422 m!899323))

(declare-fun m!899325 () Bool)

(assert (=> b!972414 m!899325))

(declare-fun m!899327 () Bool)

(assert (=> b!972414 m!899327))

(declare-fun m!899329 () Bool)

(assert (=> b!972414 m!899329))

(assert (=> b!972414 m!899327))

(declare-fun m!899331 () Bool)

(assert (=> b!972414 m!899331))

(assert (=> b!972414 m!899325))

(assert (=> b!972414 m!899329))

(declare-fun m!899333 () Bool)

(assert (=> b!972414 m!899333))

(declare-fun m!899335 () Bool)

(assert (=> b!972414 m!899335))

(declare-fun m!899337 () Bool)

(assert (=> b!972417 m!899337))

(declare-fun m!899339 () Bool)

(assert (=> start!83304 m!899339))

(declare-fun m!899341 () Bool)

(assert (=> start!83304 m!899341))

(declare-fun m!899343 () Bool)

(assert (=> start!83304 m!899343))

(declare-fun m!899345 () Bool)

(assert (=> b!972413 m!899345))

(declare-fun m!899347 () Bool)

(assert (=> b!972413 m!899347))

(declare-fun m!899349 () Bool)

(assert (=> b!972413 m!899349))

(declare-fun m!899351 () Bool)

(assert (=> b!972418 m!899351))

(assert (=> b!972418 m!899351))

(declare-fun m!899353 () Bool)

(assert (=> b!972418 m!899353))

(declare-fun m!899355 () Bool)

(assert (=> b!972416 m!899355))

(assert (=> b!972416 m!899351))

(assert (=> b!972416 m!899355))

(assert (=> b!972416 m!899351))

(declare-fun m!899357 () Bool)

(assert (=> b!972416 m!899357))

(check-sat (not b!972418) (not b!972413) (not b_next!19315) (not b!972414) (not b_lambda!14461) b_and!30827 (not mapNonEmpty!35329) (not b!972417) (not b!972422) tp_is_empty!22213 (not start!83304) (not b!972416))
(check-sat b_and!30827 (not b_next!19315))
