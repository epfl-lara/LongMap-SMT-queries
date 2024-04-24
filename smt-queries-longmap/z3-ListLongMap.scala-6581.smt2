; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83538 () Bool)

(assert start!83538)

(declare-fun b_free!19363 () Bool)

(declare-fun b_next!19363 () Bool)

(assert (=> start!83538 (= b_free!19363 (not b_next!19363))))

(declare-fun tp!67369 () Bool)

(declare-fun b_and!30957 () Bool)

(assert (=> start!83538 (= tp!67369 b_and!30957)))

(declare-fun b!974394 () Bool)

(declare-fun e!549310 () Bool)

(assert (=> b!974394 (= e!549310 (not true))))

(declare-datatypes ((array!60594 0))(
  ( (array!60595 (arr!29156 (Array (_ BitVec 32) (_ BitVec 64))) (size!29636 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60594)

(declare-datatypes ((V!34665 0))(
  ( (V!34666 (val!11181 Int)) )
))
(declare-datatypes ((tuple2!14362 0))(
  ( (tuple2!14363 (_1!7192 (_ BitVec 64)) (_2!7192 V!34665)) )
))
(declare-datatypes ((List!20210 0))(
  ( (Nil!20207) (Cons!20206 (h!21374 tuple2!14362) (t!28663 List!20210)) )
))
(declare-datatypes ((ListLongMap!13061 0))(
  ( (ListLongMap!13062 (toList!6546 List!20210)) )
))
(declare-fun lt!432892 () ListLongMap!13061)

(declare-fun lt!432896 () tuple2!14362)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5652 (ListLongMap!13061 (_ BitVec 64)) Bool)

(declare-fun +!2920 (ListLongMap!13061 tuple2!14362) ListLongMap!13061)

(assert (=> b!974394 (contains!5652 (+!2920 lt!432892 lt!432896) (select (arr!29156 _keys!1717) i!822))))

(declare-fun lt!432893 () (_ BitVec 64))

(declare-fun lt!432894 () V!34665)

(declare-datatypes ((Unit!32404 0))(
  ( (Unit!32405) )
))
(declare-fun lt!432897 () Unit!32404)

(declare-fun addStillContains!602 (ListLongMap!13061 (_ BitVec 64) V!34665 (_ BitVec 64)) Unit!32404)

(assert (=> b!974394 (= lt!432897 (addStillContains!602 lt!432892 lt!432893 lt!432894 (select (arr!29156 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!432891 () ListLongMap!13061)

(declare-fun zeroValue!1367 () V!34665)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34665)

(declare-datatypes ((ValueCell!10649 0))(
  ( (ValueCellFull!10649 (v!13737 V!34665)) (EmptyCell!10649) )
))
(declare-datatypes ((array!60596 0))(
  ( (array!60597 (arr!29157 (Array (_ BitVec 32) ValueCell!10649)) (size!29637 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60596)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3779 (array!60594 array!60596 (_ BitVec 32) (_ BitVec 32) V!34665 V!34665 (_ BitVec 32) Int) ListLongMap!13061)

(assert (=> b!974394 (= lt!432891 (+!2920 (getCurrentListMap!3779 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432896))))

(assert (=> b!974394 (= lt!432896 (tuple2!14363 lt!432893 lt!432894))))

(declare-fun get!15133 (ValueCell!10649 V!34665) V!34665)

(declare-fun dynLambda!1717 (Int (_ BitVec 64)) V!34665)

(assert (=> b!974394 (= lt!432894 (get!15133 (select (arr!29157 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1717 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432895 () Unit!32404)

(declare-fun lemmaListMapRecursiveValidKeyArray!276 (array!60594 array!60596 (_ BitVec 32) (_ BitVec 32) V!34665 V!34665 (_ BitVec 32) Int) Unit!32404)

(assert (=> b!974394 (= lt!432895 (lemmaListMapRecursiveValidKeyArray!276 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974395 () Bool)

(declare-fun res!651976 () Bool)

(declare-fun e!549308 () Bool)

(assert (=> b!974395 (=> (not res!651976) (not e!549308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974395 (= res!651976 (validKeyInArray!0 (select (arr!29156 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35401 () Bool)

(declare-fun mapRes!35401 () Bool)

(assert (=> mapIsEmpty!35401 mapRes!35401))

(declare-fun res!651975 () Bool)

(assert (=> start!83538 (=> (not res!651975) (not e!549308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83538 (= res!651975 (validMask!0 mask!2147))))

(assert (=> start!83538 e!549308))

(assert (=> start!83538 true))

(declare-fun e!549309 () Bool)

(declare-fun array_inv!22605 (array!60596) Bool)

(assert (=> start!83538 (and (array_inv!22605 _values!1425) e!549309)))

(declare-fun tp_is_empty!22261 () Bool)

(assert (=> start!83538 tp_is_empty!22261))

(assert (=> start!83538 tp!67369))

(declare-fun array_inv!22606 (array!60594) Bool)

(assert (=> start!83538 (array_inv!22606 _keys!1717)))

(declare-fun mapNonEmpty!35401 () Bool)

(declare-fun tp!67368 () Bool)

(declare-fun e!549305 () Bool)

(assert (=> mapNonEmpty!35401 (= mapRes!35401 (and tp!67368 e!549305))))

(declare-fun mapRest!35401 () (Array (_ BitVec 32) ValueCell!10649))

(declare-fun mapKey!35401 () (_ BitVec 32))

(declare-fun mapValue!35401 () ValueCell!10649)

(assert (=> mapNonEmpty!35401 (= (arr!29157 _values!1425) (store mapRest!35401 mapKey!35401 mapValue!35401))))

(declare-fun b!974396 () Bool)

(declare-fun e!549306 () Bool)

(assert (=> b!974396 (= e!549306 e!549310)))

(declare-fun res!651980 () Bool)

(assert (=> b!974396 (=> (not res!651980) (not e!549310))))

(assert (=> b!974396 (= res!651980 (validKeyInArray!0 lt!432893))))

(assert (=> b!974396 (= lt!432893 (select (arr!29156 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!974396 (= lt!432891 (getCurrentListMap!3779 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974397 () Bool)

(declare-fun res!651977 () Bool)

(assert (=> b!974397 (=> (not res!651977) (not e!549308))))

(assert (=> b!974397 (= res!651977 (and (= (size!29637 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29636 _keys!1717) (size!29637 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974398 () Bool)

(declare-fun res!651974 () Bool)

(assert (=> b!974398 (=> (not res!651974) (not e!549308))))

(assert (=> b!974398 (= res!651974 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29636 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29636 _keys!1717))))))

(declare-fun b!974399 () Bool)

(declare-fun res!651978 () Bool)

(assert (=> b!974399 (=> (not res!651978) (not e!549308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60594 (_ BitVec 32)) Bool)

(assert (=> b!974399 (= res!651978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974400 () Bool)

(assert (=> b!974400 (= e!549308 e!549306)))

(declare-fun res!651973 () Bool)

(assert (=> b!974400 (=> (not res!651973) (not e!549306))))

(assert (=> b!974400 (= res!651973 (contains!5652 lt!432892 (select (arr!29156 _keys!1717) i!822)))))

(assert (=> b!974400 (= lt!432892 (getCurrentListMap!3779 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!974401 () Bool)

(declare-fun e!549304 () Bool)

(assert (=> b!974401 (= e!549309 (and e!549304 mapRes!35401))))

(declare-fun condMapEmpty!35401 () Bool)

(declare-fun mapDefault!35401 () ValueCell!10649)

(assert (=> b!974401 (= condMapEmpty!35401 (= (arr!29157 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10649)) mapDefault!35401)))))

(declare-fun b!974402 () Bool)

(assert (=> b!974402 (= e!549304 tp_is_empty!22261)))

(declare-fun b!974403 () Bool)

(assert (=> b!974403 (= e!549305 tp_is_empty!22261)))

(declare-fun b!974404 () Bool)

(declare-fun res!651979 () Bool)

(assert (=> b!974404 (=> (not res!651979) (not e!549308))))

(declare-datatypes ((List!20211 0))(
  ( (Nil!20208) (Cons!20207 (h!21375 (_ BitVec 64)) (t!28664 List!20211)) )
))
(declare-fun arrayNoDuplicates!0 (array!60594 (_ BitVec 32) List!20211) Bool)

(assert (=> b!974404 (= res!651979 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20208))))

(assert (= (and start!83538 res!651975) b!974397))

(assert (= (and b!974397 res!651977) b!974399))

(assert (= (and b!974399 res!651978) b!974404))

(assert (= (and b!974404 res!651979) b!974398))

(assert (= (and b!974398 res!651974) b!974395))

(assert (= (and b!974395 res!651976) b!974400))

(assert (= (and b!974400 res!651973) b!974396))

(assert (= (and b!974396 res!651980) b!974394))

(assert (= (and b!974401 condMapEmpty!35401) mapIsEmpty!35401))

(assert (= (and b!974401 (not condMapEmpty!35401)) mapNonEmpty!35401))

(get-info :version)

(assert (= (and mapNonEmpty!35401 ((_ is ValueCellFull!10649) mapValue!35401)) b!974403))

(assert (= (and b!974401 ((_ is ValueCellFull!10649) mapDefault!35401)) b!974402))

(assert (= start!83538 b!974401))

(declare-fun b_lambda!14541 () Bool)

(assert (=> (not b_lambda!14541) (not b!974394)))

(declare-fun t!28662 () Bool)

(declare-fun tb!6303 () Bool)

(assert (=> (and start!83538 (= defaultEntry!1428 defaultEntry!1428) t!28662) tb!6303))

(declare-fun result!12591 () Bool)

(assert (=> tb!6303 (= result!12591 tp_is_empty!22261)))

(assert (=> b!974394 t!28662))

(declare-fun b_and!30959 () Bool)

(assert (= b_and!30957 (and (=> t!28662 result!12591) b_and!30959)))

(declare-fun m!902393 () Bool)

(assert (=> mapNonEmpty!35401 m!902393))

(declare-fun m!902395 () Bool)

(assert (=> b!974396 m!902395))

(declare-fun m!902397 () Bool)

(assert (=> b!974396 m!902397))

(declare-fun m!902399 () Bool)

(assert (=> b!974396 m!902399))

(declare-fun m!902401 () Bool)

(assert (=> start!83538 m!902401))

(declare-fun m!902403 () Bool)

(assert (=> start!83538 m!902403))

(declare-fun m!902405 () Bool)

(assert (=> start!83538 m!902405))

(declare-fun m!902407 () Bool)

(assert (=> b!974404 m!902407))

(declare-fun m!902409 () Bool)

(assert (=> b!974399 m!902409))

(declare-fun m!902411 () Bool)

(assert (=> b!974394 m!902411))

(declare-fun m!902413 () Bool)

(assert (=> b!974394 m!902413))

(declare-fun m!902415 () Bool)

(assert (=> b!974394 m!902415))

(declare-fun m!902417 () Bool)

(assert (=> b!974394 m!902417))

(declare-fun m!902419 () Bool)

(assert (=> b!974394 m!902419))

(declare-fun m!902421 () Bool)

(assert (=> b!974394 m!902421))

(assert (=> b!974394 m!902413))

(assert (=> b!974394 m!902415))

(declare-fun m!902423 () Bool)

(assert (=> b!974394 m!902423))

(assert (=> b!974394 m!902421))

(declare-fun m!902425 () Bool)

(assert (=> b!974394 m!902425))

(declare-fun m!902427 () Bool)

(assert (=> b!974394 m!902427))

(assert (=> b!974394 m!902417))

(assert (=> b!974394 m!902411))

(assert (=> b!974394 m!902421))

(declare-fun m!902429 () Bool)

(assert (=> b!974394 m!902429))

(assert (=> b!974400 m!902421))

(assert (=> b!974400 m!902421))

(declare-fun m!902431 () Bool)

(assert (=> b!974400 m!902431))

(declare-fun m!902433 () Bool)

(assert (=> b!974400 m!902433))

(assert (=> b!974395 m!902421))

(assert (=> b!974395 m!902421))

(declare-fun m!902435 () Bool)

(assert (=> b!974395 m!902435))

(check-sat b_and!30959 (not b!974404) (not b_next!19363) tp_is_empty!22261 (not b!974400) (not b!974399) (not start!83538) (not b!974395) (not b!974396) (not b_lambda!14541) (not mapNonEmpty!35401) (not b!974394))
(check-sat b_and!30959 (not b_next!19363))
