; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83574 () Bool)

(assert start!83574)

(declare-fun b_free!19399 () Bool)

(declare-fun b_next!19399 () Bool)

(assert (=> start!83574 (= b_free!19399 (not b_next!19399))))

(declare-fun tp!67477 () Bool)

(declare-fun b_and!31011 () Bool)

(assert (=> start!83574 (= tp!67477 b_and!31011)))

(declare-fun b!974977 () Bool)

(declare-fun res!652376 () Bool)

(declare-fun e!549626 () Bool)

(assert (=> b!974977 (=> (not res!652376) (not e!549626))))

(declare-datatypes ((array!60666 0))(
  ( (array!60667 (arr!29192 (Array (_ BitVec 32) (_ BitVec 64))) (size!29672 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60666)

(declare-datatypes ((List!20242 0))(
  ( (Nil!20239) (Cons!20238 (h!21406 (_ BitVec 64)) (t!28711 List!20242)) )
))
(declare-fun arrayNoDuplicates!0 (array!60666 (_ BitVec 32) List!20242) Bool)

(assert (=> b!974977 (= res!652376 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20239))))

(declare-fun b!974978 () Bool)

(declare-fun res!652379 () Bool)

(assert (=> b!974978 (=> (not res!652379) (not e!549626))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60666 (_ BitVec 32)) Bool)

(assert (=> b!974978 (= res!652379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974979 () Bool)

(declare-fun res!652381 () Bool)

(assert (=> b!974979 (=> (not res!652381) (not e!549626))))

(declare-datatypes ((V!34713 0))(
  ( (V!34714 (val!11199 Int)) )
))
(declare-fun zeroValue!1367 () V!34713)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34713)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10667 0))(
  ( (ValueCellFull!10667 (v!13755 V!34713)) (EmptyCell!10667) )
))
(declare-datatypes ((array!60668 0))(
  ( (array!60669 (arr!29193 (Array (_ BitVec 32) ValueCell!10667)) (size!29673 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60668)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14396 0))(
  ( (tuple2!14397 (_1!7209 (_ BitVec 64)) (_2!7209 V!34713)) )
))
(declare-datatypes ((List!20243 0))(
  ( (Nil!20240) (Cons!20239 (h!21407 tuple2!14396) (t!28712 List!20243)) )
))
(declare-datatypes ((ListLongMap!13095 0))(
  ( (ListLongMap!13096 (toList!6563 List!20243)) )
))
(declare-fun contains!5668 (ListLongMap!13095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3796 (array!60666 array!60668 (_ BitVec 32) (_ BitVec 32) V!34713 V!34713 (_ BitVec 32) Int) ListLongMap!13095)

(assert (=> b!974979 (= res!652381 (contains!5668 (getCurrentListMap!3796 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29192 _keys!1717) i!822)))))

(declare-fun res!652382 () Bool)

(assert (=> start!83574 (=> (not res!652382) (not e!549626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83574 (= res!652382 (validMask!0 mask!2147))))

(assert (=> start!83574 e!549626))

(assert (=> start!83574 true))

(declare-fun e!549624 () Bool)

(declare-fun array_inv!22633 (array!60668) Bool)

(assert (=> start!83574 (and (array_inv!22633 _values!1425) e!549624)))

(declare-fun tp_is_empty!22297 () Bool)

(assert (=> start!83574 tp_is_empty!22297))

(assert (=> start!83574 tp!67477))

(declare-fun array_inv!22634 (array!60666) Bool)

(assert (=> start!83574 (array_inv!22634 _keys!1717)))

(declare-fun b!974980 () Bool)

(declare-fun res!652380 () Bool)

(assert (=> b!974980 (=> (not res!652380) (not e!549626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974980 (= res!652380 (validKeyInArray!0 (select (arr!29192 _keys!1717) i!822)))))

(declare-fun b!974981 () Bool)

(declare-fun e!549625 () Bool)

(declare-fun mapRes!35455 () Bool)

(assert (=> b!974981 (= e!549624 (and e!549625 mapRes!35455))))

(declare-fun condMapEmpty!35455 () Bool)

(declare-fun mapDefault!35455 () ValueCell!10667)

(assert (=> b!974981 (= condMapEmpty!35455 (= (arr!29193 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10667)) mapDefault!35455)))))

(declare-fun b!974982 () Bool)

(declare-fun res!652377 () Bool)

(assert (=> b!974982 (=> (not res!652377) (not e!549626))))

(assert (=> b!974982 (= res!652377 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29672 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29672 _keys!1717))))))

(declare-fun b!974983 () Bool)

(declare-fun res!652378 () Bool)

(assert (=> b!974983 (=> (not res!652378) (not e!549626))))

(assert (=> b!974983 (= res!652378 (and (= (size!29673 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29672 _keys!1717) (size!29673 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974984 () Bool)

(declare-fun e!549628 () Bool)

(assert (=> b!974984 (= e!549628 tp_is_empty!22297)))

(declare-fun mapNonEmpty!35455 () Bool)

(declare-fun tp!67476 () Bool)

(assert (=> mapNonEmpty!35455 (= mapRes!35455 (and tp!67476 e!549628))))

(declare-fun mapKey!35455 () (_ BitVec 32))

(declare-fun mapValue!35455 () ValueCell!10667)

(declare-fun mapRest!35455 () (Array (_ BitVec 32) ValueCell!10667))

(assert (=> mapNonEmpty!35455 (= (arr!29193 _values!1425) (store mapRest!35455 mapKey!35455 mapValue!35455))))

(declare-fun b!974985 () Bool)

(assert (=> b!974985 (= e!549626 false)))

(declare-fun lt!433095 () ListLongMap!13095)

(assert (=> b!974985 (= lt!433095 (getCurrentListMap!3796 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974986 () Bool)

(assert (=> b!974986 (= e!549625 tp_is_empty!22297)))

(declare-fun mapIsEmpty!35455 () Bool)

(assert (=> mapIsEmpty!35455 mapRes!35455))

(assert (= (and start!83574 res!652382) b!974983))

(assert (= (and b!974983 res!652378) b!974978))

(assert (= (and b!974978 res!652379) b!974977))

(assert (= (and b!974977 res!652376) b!974982))

(assert (= (and b!974982 res!652377) b!974980))

(assert (= (and b!974980 res!652380) b!974979))

(assert (= (and b!974979 res!652381) b!974985))

(assert (= (and b!974981 condMapEmpty!35455) mapIsEmpty!35455))

(assert (= (and b!974981 (not condMapEmpty!35455)) mapNonEmpty!35455))

(get-info :version)

(assert (= (and mapNonEmpty!35455 ((_ is ValueCellFull!10667) mapValue!35455)) b!974984))

(assert (= (and b!974981 ((_ is ValueCellFull!10667) mapDefault!35455)) b!974986))

(assert (= start!83574 b!974981))

(declare-fun m!902987 () Bool)

(assert (=> start!83574 m!902987))

(declare-fun m!902989 () Bool)

(assert (=> start!83574 m!902989))

(declare-fun m!902991 () Bool)

(assert (=> start!83574 m!902991))

(declare-fun m!902993 () Bool)

(assert (=> b!974980 m!902993))

(assert (=> b!974980 m!902993))

(declare-fun m!902995 () Bool)

(assert (=> b!974980 m!902995))

(declare-fun m!902997 () Bool)

(assert (=> b!974979 m!902997))

(assert (=> b!974979 m!902993))

(assert (=> b!974979 m!902997))

(assert (=> b!974979 m!902993))

(declare-fun m!902999 () Bool)

(assert (=> b!974979 m!902999))

(declare-fun m!903001 () Bool)

(assert (=> b!974977 m!903001))

(declare-fun m!903003 () Bool)

(assert (=> mapNonEmpty!35455 m!903003))

(declare-fun m!903005 () Bool)

(assert (=> b!974978 m!903005))

(declare-fun m!903007 () Bool)

(assert (=> b!974985 m!903007))

(check-sat (not start!83574) b_and!31011 (not b!974977) (not mapNonEmpty!35455) (not b_next!19399) (not b!974979) (not b!974985) tp_is_empty!22297 (not b!974980) (not b!974978))
(check-sat b_and!31011 (not b_next!19399))
