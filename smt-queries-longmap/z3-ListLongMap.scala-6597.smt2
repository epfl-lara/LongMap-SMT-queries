; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83468 () Bool)

(assert start!83468)

(declare-fun b_free!19455 () Bool)

(declare-fun b_next!19455 () Bool)

(assert (=> start!83468 (= b_free!19455 (not b_next!19455))))

(declare-fun tp!67652 () Bool)

(declare-fun b_and!31057 () Bool)

(assert (=> start!83468 (= tp!67652 b_and!31057)))

(declare-fun b!974977 () Bool)

(declare-fun e!549517 () Bool)

(declare-fun tp_is_empty!22359 () Bool)

(assert (=> b!974977 (= e!549517 tp_is_empty!22359)))

(declare-fun b!974978 () Bool)

(declare-fun res!652661 () Bool)

(declare-fun e!549516 () Bool)

(assert (=> b!974978 (=> (not res!652661) (not e!549516))))

(declare-datatypes ((array!60753 0))(
  ( (array!60754 (arr!29240 (Array (_ BitVec 32) (_ BitVec 64))) (size!29719 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60753)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60753 (_ BitVec 32)) Bool)

(assert (=> b!974978 (= res!652661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974979 () Bool)

(declare-fun res!652658 () Bool)

(assert (=> b!974979 (=> (not res!652658) (not e!549516))))

(declare-datatypes ((V!34795 0))(
  ( (V!34796 (val!11230 Int)) )
))
(declare-datatypes ((ValueCell!10698 0))(
  ( (ValueCellFull!10698 (v!13789 V!34795)) (EmptyCell!10698) )
))
(declare-datatypes ((array!60755 0))(
  ( (array!60756 (arr!29241 (Array (_ BitVec 32) ValueCell!10698)) (size!29720 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60755)

(declare-fun zeroValue!1367 () V!34795)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34795)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14436 0))(
  ( (tuple2!14437 (_1!7229 (_ BitVec 64)) (_2!7229 V!34795)) )
))
(declare-datatypes ((List!20289 0))(
  ( (Nil!20286) (Cons!20285 (h!21447 tuple2!14436) (t!28766 List!20289)) )
))
(declare-datatypes ((ListLongMap!13133 0))(
  ( (ListLongMap!13134 (toList!6582 List!20289)) )
))
(declare-fun contains!5665 (ListLongMap!13133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3815 (array!60753 array!60755 (_ BitVec 32) (_ BitVec 32) V!34795 V!34795 (_ BitVec 32) Int) ListLongMap!13133)

(assert (=> b!974979 (= res!652658 (contains!5665 (getCurrentListMap!3815 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29240 _keys!1717) i!822)))))

(declare-fun b!974980 () Bool)

(declare-fun res!652662 () Bool)

(assert (=> b!974980 (=> (not res!652662) (not e!549516))))

(assert (=> b!974980 (= res!652662 (and (= (size!29720 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29719 _keys!1717) (size!29720 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35548 () Bool)

(declare-fun mapRes!35548 () Bool)

(declare-fun tp!67653 () Bool)

(assert (=> mapNonEmpty!35548 (= mapRes!35548 (and tp!67653 e!549517))))

(declare-fun mapKey!35548 () (_ BitVec 32))

(declare-fun mapValue!35548 () ValueCell!10698)

(declare-fun mapRest!35548 () (Array (_ BitVec 32) ValueCell!10698))

(assert (=> mapNonEmpty!35548 (= (arr!29241 _values!1425) (store mapRest!35548 mapKey!35548 mapValue!35548))))

(declare-fun b!974981 () Bool)

(declare-fun res!652660 () Bool)

(assert (=> b!974981 (=> (not res!652660) (not e!549516))))

(declare-datatypes ((List!20290 0))(
  ( (Nil!20287) (Cons!20286 (h!21448 (_ BitVec 64)) (t!28767 List!20290)) )
))
(declare-fun arrayNoDuplicates!0 (array!60753 (_ BitVec 32) List!20290) Bool)

(assert (=> b!974981 (= res!652660 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20287))))

(declare-fun b!974982 () Bool)

(assert (=> b!974982 (= e!549516 false)))

(declare-fun lt!432818 () ListLongMap!13133)

(assert (=> b!974982 (= lt!432818 (getCurrentListMap!3815 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974983 () Bool)

(declare-fun res!652657 () Bool)

(assert (=> b!974983 (=> (not res!652657) (not e!549516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974983 (= res!652657 (validKeyInArray!0 (select (arr!29240 _keys!1717) i!822)))))

(declare-fun b!974984 () Bool)

(declare-fun e!549519 () Bool)

(declare-fun e!549518 () Bool)

(assert (=> b!974984 (= e!549519 (and e!549518 mapRes!35548))))

(declare-fun condMapEmpty!35548 () Bool)

(declare-fun mapDefault!35548 () ValueCell!10698)

(assert (=> b!974984 (= condMapEmpty!35548 (= (arr!29241 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10698)) mapDefault!35548)))))

(declare-fun mapIsEmpty!35548 () Bool)

(assert (=> mapIsEmpty!35548 mapRes!35548))

(declare-fun b!974985 () Bool)

(assert (=> b!974985 (= e!549518 tp_is_empty!22359)))

(declare-fun b!974986 () Bool)

(declare-fun res!652656 () Bool)

(assert (=> b!974986 (=> (not res!652656) (not e!549516))))

(assert (=> b!974986 (= res!652656 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29719 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29719 _keys!1717))))))

(declare-fun res!652659 () Bool)

(assert (=> start!83468 (=> (not res!652659) (not e!549516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83468 (= res!652659 (validMask!0 mask!2147))))

(assert (=> start!83468 e!549516))

(assert (=> start!83468 true))

(declare-fun array_inv!22613 (array!60755) Bool)

(assert (=> start!83468 (and (array_inv!22613 _values!1425) e!549519)))

(assert (=> start!83468 tp_is_empty!22359))

(assert (=> start!83468 tp!67652))

(declare-fun array_inv!22614 (array!60753) Bool)

(assert (=> start!83468 (array_inv!22614 _keys!1717)))

(assert (= (and start!83468 res!652659) b!974980))

(assert (= (and b!974980 res!652662) b!974978))

(assert (= (and b!974978 res!652661) b!974981))

(assert (= (and b!974981 res!652660) b!974986))

(assert (= (and b!974986 res!652656) b!974983))

(assert (= (and b!974983 res!652657) b!974979))

(assert (= (and b!974979 res!652658) b!974982))

(assert (= (and b!974984 condMapEmpty!35548) mapIsEmpty!35548))

(assert (= (and b!974984 (not condMapEmpty!35548)) mapNonEmpty!35548))

(get-info :version)

(assert (= (and mapNonEmpty!35548 ((_ is ValueCellFull!10698) mapValue!35548)) b!974977))

(assert (= (and b!974984 ((_ is ValueCellFull!10698) mapDefault!35548)) b!974985))

(assert (= start!83468 b!974984))

(declare-fun m!902345 () Bool)

(assert (=> b!974979 m!902345))

(declare-fun m!902347 () Bool)

(assert (=> b!974979 m!902347))

(assert (=> b!974979 m!902345))

(assert (=> b!974979 m!902347))

(declare-fun m!902349 () Bool)

(assert (=> b!974979 m!902349))

(assert (=> b!974983 m!902347))

(assert (=> b!974983 m!902347))

(declare-fun m!902351 () Bool)

(assert (=> b!974983 m!902351))

(declare-fun m!902353 () Bool)

(assert (=> b!974981 m!902353))

(declare-fun m!902355 () Bool)

(assert (=> b!974978 m!902355))

(declare-fun m!902357 () Bool)

(assert (=> mapNonEmpty!35548 m!902357))

(declare-fun m!902359 () Bool)

(assert (=> start!83468 m!902359))

(declare-fun m!902361 () Bool)

(assert (=> start!83468 m!902361))

(declare-fun m!902363 () Bool)

(assert (=> start!83468 m!902363))

(declare-fun m!902365 () Bool)

(assert (=> b!974982 m!902365))

(check-sat (not mapNonEmpty!35548) (not b!974978) (not b!974979) (not b!974983) (not start!83468) tp_is_empty!22359 (not b!974981) (not b_next!19455) (not b!974982) b_and!31057)
(check-sat b_and!31057 (not b_next!19455))
