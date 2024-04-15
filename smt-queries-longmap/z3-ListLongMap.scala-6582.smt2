; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83358 () Bool)

(assert start!83358)

(declare-fun b_free!19369 () Bool)

(declare-fun b_next!19369 () Bool)

(assert (=> start!83358 (= b_free!19369 (not b_next!19369))))

(declare-fun tp!67387 () Bool)

(declare-fun b_and!30933 () Bool)

(assert (=> start!83358 (= tp!67387 b_and!30933)))

(declare-fun b!973357 () Bool)

(declare-fun res!651593 () Bool)

(declare-fun e!548640 () Bool)

(assert (=> b!973357 (=> (not res!651593) (not e!548640))))

(declare-datatypes ((array!60502 0))(
  ( (array!60503 (arr!29115 (Array (_ BitVec 32) (_ BitVec 64))) (size!29596 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60502)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973357 (= res!651593 (validKeyInArray!0 (select (arr!29115 _keys!1717) i!822)))))

(declare-fun b!973358 () Bool)

(declare-fun e!548637 () Bool)

(declare-fun e!548641 () Bool)

(assert (=> b!973358 (= e!548637 e!548641)))

(declare-fun res!651594 () Bool)

(assert (=> b!973358 (=> (not res!651594) (not e!548641))))

(declare-fun lt!432359 () (_ BitVec 64))

(assert (=> b!973358 (= res!651594 (validKeyInArray!0 lt!432359))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973358 (= lt!432359 (select (arr!29115 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34673 0))(
  ( (V!34674 (val!11184 Int)) )
))
(declare-datatypes ((ValueCell!10652 0))(
  ( (ValueCellFull!10652 (v!13742 V!34673)) (EmptyCell!10652) )
))
(declare-datatypes ((array!60504 0))(
  ( (array!60505 (arr!29116 (Array (_ BitVec 32) ValueCell!10652)) (size!29597 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60504)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34673)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14432 0))(
  ( (tuple2!14433 (_1!7227 (_ BitVec 64)) (_2!7227 V!34673)) )
))
(declare-datatypes ((List!20241 0))(
  ( (Nil!20238) (Cons!20237 (h!21399 tuple2!14432) (t!28699 List!20241)) )
))
(declare-datatypes ((ListLongMap!13119 0))(
  ( (ListLongMap!13120 (toList!6575 List!20241)) )
))
(declare-fun lt!432360 () ListLongMap!13119)

(declare-fun zeroValue!1367 () V!34673)

(declare-fun getCurrentListMap!3737 (array!60502 array!60504 (_ BitVec 32) (_ BitVec 32) V!34673 V!34673 (_ BitVec 32) Int) ListLongMap!13119)

(assert (=> b!973358 (= lt!432360 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973359 () Bool)

(declare-fun res!651596 () Bool)

(assert (=> b!973359 (=> (not res!651596) (not e!548640))))

(assert (=> b!973359 (= res!651596 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29596 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29596 _keys!1717))))))

(declare-fun b!973360 () Bool)

(declare-fun res!651592 () Bool)

(assert (=> b!973360 (=> (not res!651592) (not e!548640))))

(declare-datatypes ((List!20242 0))(
  ( (Nil!20239) (Cons!20238 (h!21400 (_ BitVec 64)) (t!28700 List!20242)) )
))
(declare-fun arrayNoDuplicates!0 (array!60502 (_ BitVec 32) List!20242) Bool)

(assert (=> b!973360 (= res!651592 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20239))))

(declare-fun b!973361 () Bool)

(declare-fun e!548638 () Bool)

(declare-fun tp_is_empty!22267 () Bool)

(assert (=> b!973361 (= e!548638 tp_is_empty!22267)))

(declare-fun b!973362 () Bool)

(assert (=> b!973362 (= e!548640 e!548637)))

(declare-fun res!651597 () Bool)

(assert (=> b!973362 (=> (not res!651597) (not e!548637))))

(declare-fun lt!432363 () ListLongMap!13119)

(declare-fun contains!5616 (ListLongMap!13119 (_ BitVec 64)) Bool)

(assert (=> b!973362 (= res!651597 (contains!5616 lt!432363 (select (arr!29115 _keys!1717) i!822)))))

(assert (=> b!973362 (= lt!432363 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973364 () Bool)

(declare-fun res!651591 () Bool)

(assert (=> b!973364 (=> (not res!651591) (not e!548640))))

(assert (=> b!973364 (= res!651591 (and (= (size!29597 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29596 _keys!1717) (size!29597 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35410 () Bool)

(declare-fun mapRes!35410 () Bool)

(declare-fun tp!67386 () Bool)

(assert (=> mapNonEmpty!35410 (= mapRes!35410 (and tp!67386 e!548638))))

(declare-fun mapKey!35410 () (_ BitVec 32))

(declare-fun mapRest!35410 () (Array (_ BitVec 32) ValueCell!10652))

(declare-fun mapValue!35410 () ValueCell!10652)

(assert (=> mapNonEmpty!35410 (= (arr!29116 _values!1425) (store mapRest!35410 mapKey!35410 mapValue!35410))))

(declare-fun b!973365 () Bool)

(declare-fun e!548642 () Bool)

(declare-fun e!548643 () Bool)

(assert (=> b!973365 (= e!548642 (and e!548643 mapRes!35410))))

(declare-fun condMapEmpty!35410 () Bool)

(declare-fun mapDefault!35410 () ValueCell!10652)

(assert (=> b!973365 (= condMapEmpty!35410 (= (arr!29116 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10652)) mapDefault!35410)))))

(declare-fun mapIsEmpty!35410 () Bool)

(assert (=> mapIsEmpty!35410 mapRes!35410))

(declare-fun res!651598 () Bool)

(assert (=> start!83358 (=> (not res!651598) (not e!548640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83358 (= res!651598 (validMask!0 mask!2147))))

(assert (=> start!83358 e!548640))

(assert (=> start!83358 true))

(declare-fun array_inv!22579 (array!60504) Bool)

(assert (=> start!83358 (and (array_inv!22579 _values!1425) e!548642)))

(assert (=> start!83358 tp_is_empty!22267))

(assert (=> start!83358 tp!67387))

(declare-fun array_inv!22580 (array!60502) Bool)

(assert (=> start!83358 (array_inv!22580 _keys!1717)))

(declare-fun b!973363 () Bool)

(declare-fun res!651595 () Bool)

(assert (=> b!973363 (=> (not res!651595) (not e!548640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60502 (_ BitVec 32)) Bool)

(assert (=> b!973363 (= res!651595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973366 () Bool)

(assert (=> b!973366 (= e!548641 (not true))))

(declare-fun lt!432362 () tuple2!14432)

(declare-fun +!2928 (ListLongMap!13119 tuple2!14432) ListLongMap!13119)

(assert (=> b!973366 (contains!5616 (+!2928 lt!432363 lt!432362) (select (arr!29115 _keys!1717) i!822))))

(declare-datatypes ((Unit!32308 0))(
  ( (Unit!32309) )
))
(declare-fun lt!432361 () Unit!32308)

(declare-fun lt!432357 () V!34673)

(declare-fun addStillContains!598 (ListLongMap!13119 (_ BitVec 64) V!34673 (_ BitVec 64)) Unit!32308)

(assert (=> b!973366 (= lt!432361 (addStillContains!598 lt!432363 lt!432359 lt!432357 (select (arr!29115 _keys!1717) i!822)))))

(assert (=> b!973366 (= lt!432360 (+!2928 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432362))))

(assert (=> b!973366 (= lt!432362 (tuple2!14433 lt!432359 lt!432357))))

(declare-fun get!15103 (ValueCell!10652 V!34673) V!34673)

(declare-fun dynLambda!1684 (Int (_ BitVec 64)) V!34673)

(assert (=> b!973366 (= lt!432357 (get!15103 (select (arr!29116 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1684 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432358 () Unit!32308)

(declare-fun lemmaListMapRecursiveValidKeyArray!268 (array!60502 array!60504 (_ BitVec 32) (_ BitVec 32) V!34673 V!34673 (_ BitVec 32) Int) Unit!32308)

(assert (=> b!973366 (= lt!432358 (lemmaListMapRecursiveValidKeyArray!268 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973367 () Bool)

(assert (=> b!973367 (= e!548643 tp_is_empty!22267)))

(assert (= (and start!83358 res!651598) b!973364))

(assert (= (and b!973364 res!651591) b!973363))

(assert (= (and b!973363 res!651595) b!973360))

(assert (= (and b!973360 res!651592) b!973359))

(assert (= (and b!973359 res!651596) b!973357))

(assert (= (and b!973357 res!651593) b!973362))

(assert (= (and b!973362 res!651597) b!973358))

(assert (= (and b!973358 res!651594) b!973366))

(assert (= (and b!973365 condMapEmpty!35410) mapIsEmpty!35410))

(assert (= (and b!973365 (not condMapEmpty!35410)) mapNonEmpty!35410))

(get-info :version)

(assert (= (and mapNonEmpty!35410 ((_ is ValueCellFull!10652) mapValue!35410)) b!973361))

(assert (= (and b!973365 ((_ is ValueCellFull!10652) mapDefault!35410)) b!973367))

(assert (= start!83358 b!973365))

(declare-fun b_lambda!14515 () Bool)

(assert (=> (not b_lambda!14515) (not b!973366)))

(declare-fun t!28698 () Bool)

(declare-fun tb!6309 () Bool)

(assert (=> (and start!83358 (= defaultEntry!1428 defaultEntry!1428) t!28698) tb!6309))

(declare-fun result!12603 () Bool)

(assert (=> tb!6309 (= result!12603 tp_is_empty!22267)))

(assert (=> b!973366 t!28698))

(declare-fun b_and!30935 () Bool)

(assert (= b_and!30933 (and (=> t!28698 result!12603) b_and!30935)))

(declare-fun m!900473 () Bool)

(assert (=> b!973358 m!900473))

(declare-fun m!900475 () Bool)

(assert (=> b!973358 m!900475))

(declare-fun m!900477 () Bool)

(assert (=> b!973358 m!900477))

(declare-fun m!900479 () Bool)

(assert (=> b!973357 m!900479))

(assert (=> b!973357 m!900479))

(declare-fun m!900481 () Bool)

(assert (=> b!973357 m!900481))

(declare-fun m!900483 () Bool)

(assert (=> start!83358 m!900483))

(declare-fun m!900485 () Bool)

(assert (=> start!83358 m!900485))

(declare-fun m!900487 () Bool)

(assert (=> start!83358 m!900487))

(declare-fun m!900489 () Bool)

(assert (=> b!973360 m!900489))

(declare-fun m!900491 () Bool)

(assert (=> b!973363 m!900491))

(declare-fun m!900493 () Bool)

(assert (=> b!973366 m!900493))

(declare-fun m!900495 () Bool)

(assert (=> b!973366 m!900495))

(assert (=> b!973366 m!900479))

(declare-fun m!900497 () Bool)

(assert (=> b!973366 m!900497))

(declare-fun m!900499 () Bool)

(assert (=> b!973366 m!900499))

(assert (=> b!973366 m!900479))

(declare-fun m!900501 () Bool)

(assert (=> b!973366 m!900501))

(assert (=> b!973366 m!900495))

(declare-fun m!900503 () Bool)

(assert (=> b!973366 m!900503))

(declare-fun m!900505 () Bool)

(assert (=> b!973366 m!900505))

(assert (=> b!973366 m!900499))

(assert (=> b!973366 m!900479))

(declare-fun m!900507 () Bool)

(assert (=> b!973366 m!900507))

(assert (=> b!973366 m!900493))

(declare-fun m!900509 () Bool)

(assert (=> b!973366 m!900509))

(assert (=> b!973366 m!900501))

(declare-fun m!900511 () Bool)

(assert (=> mapNonEmpty!35410 m!900511))

(assert (=> b!973362 m!900479))

(assert (=> b!973362 m!900479))

(declare-fun m!900513 () Bool)

(assert (=> b!973362 m!900513))

(declare-fun m!900515 () Bool)

(assert (=> b!973362 m!900515))

(check-sat (not b!973358) (not b_next!19369) (not start!83358) (not b!973362) tp_is_empty!22267 (not b!973357) (not b!973366) (not b!973360) (not b_lambda!14515) (not mapNonEmpty!35410) b_and!30935 (not b!973363))
(check-sat b_and!30935 (not b_next!19369))
