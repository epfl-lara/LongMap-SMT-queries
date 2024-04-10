; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83342 () Bool)

(assert start!83342)

(declare-fun b_free!19335 () Bool)

(declare-fun b_next!19335 () Bool)

(assert (=> start!83342 (= b_free!19335 (not b_next!19335))))

(declare-fun tp!67284 () Bool)

(declare-fun b_and!30891 () Bool)

(assert (=> start!83342 (= tp!67284 b_and!30891)))

(declare-fun b!973001 () Bool)

(declare-fun res!651294 () Bool)

(declare-fun e!548431 () Bool)

(assert (=> b!973001 (=> (not res!651294) (not e!548431))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34627 0))(
  ( (V!34628 (val!11167 Int)) )
))
(declare-datatypes ((ValueCell!10635 0))(
  ( (ValueCellFull!10635 (v!13726 V!34627)) (EmptyCell!10635) )
))
(declare-datatypes ((array!60507 0))(
  ( (array!60508 (arr!29117 (Array (_ BitVec 32) ValueCell!10635)) (size!29596 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60507)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60509 0))(
  ( (array!60510 (arr!29118 (Array (_ BitVec 32) (_ BitVec 64))) (size!29597 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60509)

(assert (=> b!973001 (= res!651294 (and (= (size!29596 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29597 _keys!1717) (size!29596 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973002 () Bool)

(declare-fun e!548432 () Bool)

(declare-fun tp_is_empty!22233 () Bool)

(assert (=> b!973002 (= e!548432 tp_is_empty!22233)))

(declare-fun b!973003 () Bool)

(declare-fun e!548433 () Bool)

(assert (=> b!973003 (= e!548433 tp_is_empty!22233)))

(declare-fun b!973004 () Bool)

(declare-fun res!651293 () Bool)

(assert (=> b!973004 (=> (not res!651293) (not e!548431))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973004 (= res!651293 (validKeyInArray!0 (select (arr!29118 _keys!1717) i!822)))))

(declare-fun res!651296 () Bool)

(assert (=> start!83342 (=> (not res!651296) (not e!548431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83342 (= res!651296 (validMask!0 mask!2147))))

(assert (=> start!83342 e!548431))

(assert (=> start!83342 true))

(declare-fun e!548428 () Bool)

(declare-fun array_inv!22525 (array!60507) Bool)

(assert (=> start!83342 (and (array_inv!22525 _values!1425) e!548428)))

(assert (=> start!83342 tp_is_empty!22233))

(assert (=> start!83342 tp!67284))

(declare-fun array_inv!22526 (array!60509) Bool)

(assert (=> start!83342 (array_inv!22526 _keys!1717)))

(declare-fun mapIsEmpty!35359 () Bool)

(declare-fun mapRes!35359 () Bool)

(assert (=> mapIsEmpty!35359 mapRes!35359))

(declare-fun b!973005 () Bool)

(declare-fun e!548429 () Bool)

(assert (=> b!973005 (= e!548429 (not true))))

(declare-datatypes ((tuple2!14328 0))(
  ( (tuple2!14329 (_1!7175 (_ BitVec 64)) (_2!7175 V!34627)) )
))
(declare-fun lt!432240 () tuple2!14328)

(declare-datatypes ((List!20190 0))(
  ( (Nil!20187) (Cons!20186 (h!21348 tuple2!14328) (t!28623 List!20190)) )
))
(declare-datatypes ((ListLongMap!13025 0))(
  ( (ListLongMap!13026 (toList!6528 List!20190)) )
))
(declare-fun lt!432239 () ListLongMap!13025)

(declare-fun contains!5621 (ListLongMap!13025 (_ BitVec 64)) Bool)

(declare-fun +!2899 (ListLongMap!13025 tuple2!14328) ListLongMap!13025)

(assert (=> b!973005 (contains!5621 (+!2899 lt!432239 lt!432240) (select (arr!29118 _keys!1717) i!822))))

(declare-fun lt!432238 () V!34627)

(declare-fun lt!432236 () (_ BitVec 64))

(declare-datatypes ((Unit!32419 0))(
  ( (Unit!32420) )
))
(declare-fun lt!432237 () Unit!32419)

(declare-fun addStillContains!595 (ListLongMap!13025 (_ BitVec 64) V!34627 (_ BitVec 64)) Unit!32419)

(assert (=> b!973005 (= lt!432237 (addStillContains!595 lt!432239 lt!432236 lt!432238 (select (arr!29118 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34627)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34627)

(declare-fun lt!432241 () ListLongMap!13025)

(declare-fun getCurrentListMap!3761 (array!60509 array!60507 (_ BitVec 32) (_ BitVec 32) V!34627 V!34627 (_ BitVec 32) Int) ListLongMap!13025)

(assert (=> b!973005 (= lt!432241 (+!2899 (getCurrentListMap!3761 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432240))))

(assert (=> b!973005 (= lt!432240 (tuple2!14329 lt!432236 lt!432238))))

(declare-fun get!15090 (ValueCell!10635 V!34627) V!34627)

(declare-fun dynLambda!1688 (Int (_ BitVec 64)) V!34627)

(assert (=> b!973005 (= lt!432238 (get!15090 (select (arr!29117 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1688 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432242 () Unit!32419)

(declare-fun lemmaListMapRecursiveValidKeyArray!265 (array!60509 array!60507 (_ BitVec 32) (_ BitVec 32) V!34627 V!34627 (_ BitVec 32) Int) Unit!32419)

(assert (=> b!973005 (= lt!432242 (lemmaListMapRecursiveValidKeyArray!265 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35359 () Bool)

(declare-fun tp!67283 () Bool)

(assert (=> mapNonEmpty!35359 (= mapRes!35359 (and tp!67283 e!548432))))

(declare-fun mapValue!35359 () ValueCell!10635)

(declare-fun mapKey!35359 () (_ BitVec 32))

(declare-fun mapRest!35359 () (Array (_ BitVec 32) ValueCell!10635))

(assert (=> mapNonEmpty!35359 (= (arr!29117 _values!1425) (store mapRest!35359 mapKey!35359 mapValue!35359))))

(declare-fun b!973006 () Bool)

(declare-fun e!548434 () Bool)

(assert (=> b!973006 (= e!548431 e!548434)))

(declare-fun res!651300 () Bool)

(assert (=> b!973006 (=> (not res!651300) (not e!548434))))

(assert (=> b!973006 (= res!651300 (contains!5621 lt!432239 (select (arr!29118 _keys!1717) i!822)))))

(assert (=> b!973006 (= lt!432239 (getCurrentListMap!3761 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973007 () Bool)

(assert (=> b!973007 (= e!548434 e!548429)))

(declare-fun res!651295 () Bool)

(assert (=> b!973007 (=> (not res!651295) (not e!548429))))

(assert (=> b!973007 (= res!651295 (validKeyInArray!0 lt!432236))))

(assert (=> b!973007 (= lt!432236 (select (arr!29118 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973007 (= lt!432241 (getCurrentListMap!3761 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973008 () Bool)

(declare-fun res!651298 () Bool)

(assert (=> b!973008 (=> (not res!651298) (not e!548431))))

(assert (=> b!973008 (= res!651298 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29597 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29597 _keys!1717))))))

(declare-fun b!973009 () Bool)

(declare-fun res!651299 () Bool)

(assert (=> b!973009 (=> (not res!651299) (not e!548431))))

(declare-datatypes ((List!20191 0))(
  ( (Nil!20188) (Cons!20187 (h!21349 (_ BitVec 64)) (t!28624 List!20191)) )
))
(declare-fun arrayNoDuplicates!0 (array!60509 (_ BitVec 32) List!20191) Bool)

(assert (=> b!973009 (= res!651299 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20188))))

(declare-fun b!973010 () Bool)

(declare-fun res!651297 () Bool)

(assert (=> b!973010 (=> (not res!651297) (not e!548431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60509 (_ BitVec 32)) Bool)

(assert (=> b!973010 (= res!651297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973011 () Bool)

(assert (=> b!973011 (= e!548428 (and e!548433 mapRes!35359))))

(declare-fun condMapEmpty!35359 () Bool)

(declare-fun mapDefault!35359 () ValueCell!10635)

(assert (=> b!973011 (= condMapEmpty!35359 (= (arr!29117 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10635)) mapDefault!35359)))))

(assert (= (and start!83342 res!651296) b!973001))

(assert (= (and b!973001 res!651294) b!973010))

(assert (= (and b!973010 res!651297) b!973009))

(assert (= (and b!973009 res!651299) b!973008))

(assert (= (and b!973008 res!651298) b!973004))

(assert (= (and b!973004 res!651293) b!973006))

(assert (= (and b!973006 res!651300) b!973007))

(assert (= (and b!973007 res!651295) b!973005))

(assert (= (and b!973011 condMapEmpty!35359) mapIsEmpty!35359))

(assert (= (and b!973011 (not condMapEmpty!35359)) mapNonEmpty!35359))

(get-info :version)

(assert (= (and mapNonEmpty!35359 ((_ is ValueCellFull!10635) mapValue!35359)) b!973002))

(assert (= (and b!973011 ((_ is ValueCellFull!10635) mapDefault!35359)) b!973003))

(assert (= start!83342 b!973011))

(declare-fun b_lambda!14499 () Bool)

(assert (=> (not b_lambda!14499) (not b!973005)))

(declare-fun t!28622 () Bool)

(declare-fun tb!6283 () Bool)

(assert (=> (and start!83342 (= defaultEntry!1428 defaultEntry!1428) t!28622) tb!6283))

(declare-fun result!12543 () Bool)

(assert (=> tb!6283 (= result!12543 tp_is_empty!22233)))

(assert (=> b!973005 t!28622))

(declare-fun b_and!30893 () Bool)

(assert (= b_and!30891 (and (=> t!28622 result!12543) b_and!30893)))

(declare-fun m!900483 () Bool)

(assert (=> b!973006 m!900483))

(assert (=> b!973006 m!900483))

(declare-fun m!900485 () Bool)

(assert (=> b!973006 m!900485))

(declare-fun m!900487 () Bool)

(assert (=> b!973006 m!900487))

(declare-fun m!900489 () Bool)

(assert (=> mapNonEmpty!35359 m!900489))

(declare-fun m!900491 () Bool)

(assert (=> b!973009 m!900491))

(assert (=> b!973004 m!900483))

(assert (=> b!973004 m!900483))

(declare-fun m!900493 () Bool)

(assert (=> b!973004 m!900493))

(declare-fun m!900495 () Bool)

(assert (=> start!83342 m!900495))

(declare-fun m!900497 () Bool)

(assert (=> start!83342 m!900497))

(declare-fun m!900499 () Bool)

(assert (=> start!83342 m!900499))

(declare-fun m!900501 () Bool)

(assert (=> b!973005 m!900501))

(declare-fun m!900503 () Bool)

(assert (=> b!973005 m!900503))

(declare-fun m!900505 () Bool)

(assert (=> b!973005 m!900505))

(declare-fun m!900507 () Bool)

(assert (=> b!973005 m!900507))

(assert (=> b!973005 m!900507))

(assert (=> b!973005 m!900483))

(declare-fun m!900509 () Bool)

(assert (=> b!973005 m!900509))

(assert (=> b!973005 m!900483))

(assert (=> b!973005 m!900483))

(declare-fun m!900511 () Bool)

(assert (=> b!973005 m!900511))

(assert (=> b!973005 m!900501))

(assert (=> b!973005 m!900505))

(declare-fun m!900513 () Bool)

(assert (=> b!973005 m!900513))

(assert (=> b!973005 m!900503))

(declare-fun m!900515 () Bool)

(assert (=> b!973005 m!900515))

(declare-fun m!900517 () Bool)

(assert (=> b!973005 m!900517))

(declare-fun m!900519 () Bool)

(assert (=> b!973010 m!900519))

(declare-fun m!900521 () Bool)

(assert (=> b!973007 m!900521))

(declare-fun m!900523 () Bool)

(assert (=> b!973007 m!900523))

(declare-fun m!900525 () Bool)

(assert (=> b!973007 m!900525))

(check-sat tp_is_empty!22233 (not b!973005) (not b!973006) (not start!83342) b_and!30893 (not b!973004) (not mapNonEmpty!35359) (not b_next!19335) (not b!973009) (not b_lambda!14499) (not b!973007) (not b!973010))
(check-sat b_and!30893 (not b_next!19335))
