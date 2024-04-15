; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83100 () Bool)

(assert start!83100)

(declare-fun b_free!19111 () Bool)

(declare-fun b_next!19111 () Bool)

(assert (=> start!83100 (= b_free!19111 (not b_next!19111))))

(declare-fun tp!66613 () Bool)

(declare-fun b_and!30573 () Bool)

(assert (=> start!83100 (= tp!66613 b_and!30573)))

(declare-fun b!969354 () Bool)

(declare-fun res!648856 () Bool)

(declare-fun e!546484 () Bool)

(assert (=> b!969354 (=> (not res!648856) (not e!546484))))

(declare-datatypes ((array!60014 0))(
  ( (array!60015 (arr!28871 (Array (_ BitVec 32) (_ BitVec 64))) (size!29352 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60014)

(declare-datatypes ((List!20065 0))(
  ( (Nil!20062) (Cons!20061 (h!21223 (_ BitVec 64)) (t!28419 List!20065)) )
))
(declare-fun arrayNoDuplicates!0 (array!60014 (_ BitVec 32) List!20065) Bool)

(assert (=> b!969354 (= res!648856 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20062))))

(declare-fun b!969355 () Bool)

(declare-fun res!648852 () Bool)

(assert (=> b!969355 (=> (not res!648852) (not e!546484))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60014 (_ BitVec 32)) Bool)

(assert (=> b!969355 (= res!648852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969356 () Bool)

(declare-fun e!546483 () Bool)

(declare-fun tp_is_empty!22009 () Bool)

(assert (=> b!969356 (= e!546483 tp_is_empty!22009)))

(declare-fun b!969357 () Bool)

(declare-fun e!546485 () Bool)

(declare-fun e!546482 () Bool)

(declare-fun mapRes!35023 () Bool)

(assert (=> b!969357 (= e!546485 (and e!546482 mapRes!35023))))

(declare-fun condMapEmpty!35023 () Bool)

(declare-datatypes ((V!34329 0))(
  ( (V!34330 (val!11055 Int)) )
))
(declare-datatypes ((ValueCell!10523 0))(
  ( (ValueCellFull!10523 (v!13613 V!34329)) (EmptyCell!10523) )
))
(declare-datatypes ((array!60016 0))(
  ( (array!60017 (arr!28872 (Array (_ BitVec 32) ValueCell!10523)) (size!29353 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60016)

(declare-fun mapDefault!35023 () ValueCell!10523)

(assert (=> b!969357 (= condMapEmpty!35023 (= (arr!28872 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10523)) mapDefault!35023)))))

(declare-fun b!969358 () Bool)

(assert (=> b!969358 (= e!546482 tp_is_empty!22009)))

(declare-fun b!969359 () Bool)

(assert (=> b!969359 (= e!546484 false)))

(declare-fun zeroValue!1367 () V!34329)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34329)

(declare-fun lt!431418 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14246 0))(
  ( (tuple2!14247 (_1!7134 (_ BitVec 64)) (_2!7134 V!34329)) )
))
(declare-datatypes ((List!20066 0))(
  ( (Nil!20063) (Cons!20062 (h!21224 tuple2!14246) (t!28420 List!20066)) )
))
(declare-datatypes ((ListLongMap!12933 0))(
  ( (ListLongMap!12934 (toList!6482 List!20066)) )
))
(declare-fun contains!5530 (ListLongMap!12933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3644 (array!60014 array!60016 (_ BitVec 32) (_ BitVec 32) V!34329 V!34329 (_ BitVec 32) Int) ListLongMap!12933)

(assert (=> b!969359 (= lt!431418 (contains!5530 (getCurrentListMap!3644 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28871 _keys!1717) i!822)))))

(declare-fun res!648855 () Bool)

(assert (=> start!83100 (=> (not res!648855) (not e!546484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83100 (= res!648855 (validMask!0 mask!2147))))

(assert (=> start!83100 e!546484))

(assert (=> start!83100 true))

(declare-fun array_inv!22411 (array!60016) Bool)

(assert (=> start!83100 (and (array_inv!22411 _values!1425) e!546485)))

(assert (=> start!83100 tp_is_empty!22009))

(assert (=> start!83100 tp!66613))

(declare-fun array_inv!22412 (array!60014) Bool)

(assert (=> start!83100 (array_inv!22412 _keys!1717)))

(declare-fun b!969360 () Bool)

(declare-fun res!648851 () Bool)

(assert (=> b!969360 (=> (not res!648851) (not e!546484))))

(assert (=> b!969360 (= res!648851 (and (= (size!29353 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29352 _keys!1717) (size!29353 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35023 () Bool)

(declare-fun tp!66612 () Bool)

(assert (=> mapNonEmpty!35023 (= mapRes!35023 (and tp!66612 e!546483))))

(declare-fun mapValue!35023 () ValueCell!10523)

(declare-fun mapKey!35023 () (_ BitVec 32))

(declare-fun mapRest!35023 () (Array (_ BitVec 32) ValueCell!10523))

(assert (=> mapNonEmpty!35023 (= (arr!28872 _values!1425) (store mapRest!35023 mapKey!35023 mapValue!35023))))

(declare-fun mapIsEmpty!35023 () Bool)

(assert (=> mapIsEmpty!35023 mapRes!35023))

(declare-fun b!969361 () Bool)

(declare-fun res!648854 () Bool)

(assert (=> b!969361 (=> (not res!648854) (not e!546484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969361 (= res!648854 (validKeyInArray!0 (select (arr!28871 _keys!1717) i!822)))))

(declare-fun b!969362 () Bool)

(declare-fun res!648853 () Bool)

(assert (=> b!969362 (=> (not res!648853) (not e!546484))))

(assert (=> b!969362 (= res!648853 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29352 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29352 _keys!1717))))))

(assert (= (and start!83100 res!648855) b!969360))

(assert (= (and b!969360 res!648851) b!969355))

(assert (= (and b!969355 res!648852) b!969354))

(assert (= (and b!969354 res!648856) b!969362))

(assert (= (and b!969362 res!648853) b!969361))

(assert (= (and b!969361 res!648854) b!969359))

(assert (= (and b!969357 condMapEmpty!35023) mapIsEmpty!35023))

(assert (= (and b!969357 (not condMapEmpty!35023)) mapNonEmpty!35023))

(get-info :version)

(assert (= (and mapNonEmpty!35023 ((_ is ValueCellFull!10523) mapValue!35023)) b!969356))

(assert (= (and b!969357 ((_ is ValueCellFull!10523) mapDefault!35023)) b!969358))

(assert (= start!83100 b!969357))

(declare-fun m!896789 () Bool)

(assert (=> start!83100 m!896789))

(declare-fun m!896791 () Bool)

(assert (=> start!83100 m!896791))

(declare-fun m!896793 () Bool)

(assert (=> start!83100 m!896793))

(declare-fun m!896795 () Bool)

(assert (=> b!969359 m!896795))

(declare-fun m!896797 () Bool)

(assert (=> b!969359 m!896797))

(assert (=> b!969359 m!896795))

(assert (=> b!969359 m!896797))

(declare-fun m!896799 () Bool)

(assert (=> b!969359 m!896799))

(declare-fun m!896801 () Bool)

(assert (=> b!969355 m!896801))

(declare-fun m!896803 () Bool)

(assert (=> mapNonEmpty!35023 m!896803))

(assert (=> b!969361 m!896797))

(assert (=> b!969361 m!896797))

(declare-fun m!896805 () Bool)

(assert (=> b!969361 m!896805))

(declare-fun m!896807 () Bool)

(assert (=> b!969354 m!896807))

(check-sat (not b_next!19111) (not b!969355) (not b!969354) (not b!969361) tp_is_empty!22009 (not start!83100) (not mapNonEmpty!35023) (not b!969359) b_and!30573)
(check-sat b_and!30573 (not b_next!19111))
