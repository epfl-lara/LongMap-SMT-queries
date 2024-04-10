; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83120 () Bool)

(assert start!83120)

(declare-fun b_free!19113 () Bool)

(declare-fun b_next!19113 () Bool)

(assert (=> start!83120 (= b_free!19113 (not b_next!19113))))

(declare-fun tp!66617 () Bool)

(declare-fun b_and!30601 () Bool)

(assert (=> start!83120 (= tp!66617 b_and!30601)))

(declare-fun b!969620 () Bool)

(declare-fun e!546645 () Bool)

(declare-fun tp_is_empty!22011 () Bool)

(assert (=> b!969620 (= e!546645 tp_is_empty!22011)))

(declare-fun b!969621 () Bool)

(declare-fun res!648983 () Bool)

(declare-fun e!546648 () Bool)

(assert (=> b!969621 (=> (not res!648983) (not e!546648))))

(declare-datatypes ((array!60087 0))(
  ( (array!60088 (arr!28907 (Array (_ BitVec 32) (_ BitVec 64))) (size!29386 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60087)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60087 (_ BitVec 32)) Bool)

(assert (=> b!969621 (= res!648983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969622 () Bool)

(assert (=> b!969622 (= e!546648 false)))

(declare-datatypes ((V!34331 0))(
  ( (V!34332 (val!11056 Int)) )
))
(declare-datatypes ((ValueCell!10524 0))(
  ( (ValueCellFull!10524 (v!13615 V!34331)) (EmptyCell!10524) )
))
(declare-datatypes ((array!60089 0))(
  ( (array!60090 (arr!28908 (Array (_ BitVec 32) ValueCell!10524)) (size!29387 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60089)

(declare-fun zeroValue!1367 () V!34331)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34331)

(declare-fun lt!431657 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14164 0))(
  ( (tuple2!14165 (_1!7093 (_ BitVec 64)) (_2!7093 V!34331)) )
))
(declare-datatypes ((List!20033 0))(
  ( (Nil!20030) (Cons!20029 (h!21191 tuple2!14164) (t!28396 List!20033)) )
))
(declare-datatypes ((ListLongMap!12861 0))(
  ( (ListLongMap!12862 (toList!6446 List!20033)) )
))
(declare-fun contains!5550 (ListLongMap!12861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3679 (array!60087 array!60089 (_ BitVec 32) (_ BitVec 32) V!34331 V!34331 (_ BitVec 32) Int) ListLongMap!12861)

(assert (=> b!969622 (= lt!431657 (contains!5550 (getCurrentListMap!3679 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28907 _keys!1717) i!822)))))

(declare-fun b!969623 () Bool)

(declare-fun res!648979 () Bool)

(assert (=> b!969623 (=> (not res!648979) (not e!546648))))

(declare-datatypes ((List!20034 0))(
  ( (Nil!20031) (Cons!20030 (h!21192 (_ BitVec 64)) (t!28397 List!20034)) )
))
(declare-fun arrayNoDuplicates!0 (array!60087 (_ BitVec 32) List!20034) Bool)

(assert (=> b!969623 (= res!648979 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20031))))

(declare-fun b!969624 () Bool)

(declare-fun res!648980 () Bool)

(assert (=> b!969624 (=> (not res!648980) (not e!546648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969624 (= res!648980 (validKeyInArray!0 (select (arr!28907 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35026 () Bool)

(declare-fun mapRes!35026 () Bool)

(declare-fun tp!66618 () Bool)

(assert (=> mapNonEmpty!35026 (= mapRes!35026 (and tp!66618 e!546645))))

(declare-fun mapKey!35026 () (_ BitVec 32))

(declare-fun mapRest!35026 () (Array (_ BitVec 32) ValueCell!10524))

(declare-fun mapValue!35026 () ValueCell!10524)

(assert (=> mapNonEmpty!35026 (= (arr!28908 _values!1425) (store mapRest!35026 mapKey!35026 mapValue!35026))))

(declare-fun b!969625 () Bool)

(declare-fun res!648981 () Bool)

(assert (=> b!969625 (=> (not res!648981) (not e!546648))))

(assert (=> b!969625 (= res!648981 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29386 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29386 _keys!1717))))))

(declare-fun res!648984 () Bool)

(assert (=> start!83120 (=> (not res!648984) (not e!546648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83120 (= res!648984 (validMask!0 mask!2147))))

(assert (=> start!83120 e!546648))

(assert (=> start!83120 true))

(declare-fun e!546647 () Bool)

(declare-fun array_inv!22375 (array!60089) Bool)

(assert (=> start!83120 (and (array_inv!22375 _values!1425) e!546647)))

(assert (=> start!83120 tp_is_empty!22011))

(assert (=> start!83120 tp!66617))

(declare-fun array_inv!22376 (array!60087) Bool)

(assert (=> start!83120 (array_inv!22376 _keys!1717)))

(declare-fun b!969626 () Bool)

(declare-fun e!546646 () Bool)

(assert (=> b!969626 (= e!546647 (and e!546646 mapRes!35026))))

(declare-fun condMapEmpty!35026 () Bool)

(declare-fun mapDefault!35026 () ValueCell!10524)

(assert (=> b!969626 (= condMapEmpty!35026 (= (arr!28908 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10524)) mapDefault!35026)))))

(declare-fun b!969627 () Bool)

(assert (=> b!969627 (= e!546646 tp_is_empty!22011)))

(declare-fun b!969628 () Bool)

(declare-fun res!648982 () Bool)

(assert (=> b!969628 (=> (not res!648982) (not e!546648))))

(assert (=> b!969628 (= res!648982 (and (= (size!29387 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29386 _keys!1717) (size!29387 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35026 () Bool)

(assert (=> mapIsEmpty!35026 mapRes!35026))

(assert (= (and start!83120 res!648984) b!969628))

(assert (= (and b!969628 res!648982) b!969621))

(assert (= (and b!969621 res!648983) b!969623))

(assert (= (and b!969623 res!648979) b!969625))

(assert (= (and b!969625 res!648981) b!969624))

(assert (= (and b!969624 res!648980) b!969622))

(assert (= (and b!969626 condMapEmpty!35026) mapIsEmpty!35026))

(assert (= (and b!969626 (not condMapEmpty!35026)) mapNonEmpty!35026))

(get-info :version)

(assert (= (and mapNonEmpty!35026 ((_ is ValueCellFull!10524) mapValue!35026)) b!969620))

(assert (= (and b!969626 ((_ is ValueCellFull!10524) mapDefault!35026)) b!969627))

(assert (= start!83120 b!969626))

(declare-fun m!897567 () Bool)

(assert (=> b!969621 m!897567))

(declare-fun m!897569 () Bool)

(assert (=> mapNonEmpty!35026 m!897569))

(declare-fun m!897571 () Bool)

(assert (=> b!969624 m!897571))

(assert (=> b!969624 m!897571))

(declare-fun m!897573 () Bool)

(assert (=> b!969624 m!897573))

(declare-fun m!897575 () Bool)

(assert (=> start!83120 m!897575))

(declare-fun m!897577 () Bool)

(assert (=> start!83120 m!897577))

(declare-fun m!897579 () Bool)

(assert (=> start!83120 m!897579))

(declare-fun m!897581 () Bool)

(assert (=> b!969622 m!897581))

(assert (=> b!969622 m!897571))

(assert (=> b!969622 m!897581))

(assert (=> b!969622 m!897571))

(declare-fun m!897583 () Bool)

(assert (=> b!969622 m!897583))

(declare-fun m!897585 () Bool)

(assert (=> b!969623 m!897585))

(check-sat (not b!969624) b_and!30601 (not b_next!19113) (not b!969623) (not mapNonEmpty!35026) (not b!969621) (not b!969622) (not start!83120) tp_is_empty!22011)
(check-sat b_and!30601 (not b_next!19113))
