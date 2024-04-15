; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83082 () Bool)

(assert start!83082)

(declare-fun b!969111 () Bool)

(declare-fun e!546347 () Bool)

(declare-fun tp_is_empty!21991 () Bool)

(assert (=> b!969111 (= e!546347 tp_is_empty!21991)))

(declare-fun b!969112 () Bool)

(declare-fun res!648692 () Bool)

(declare-fun e!546349 () Bool)

(assert (=> b!969112 (=> (not res!648692) (not e!546349))))

(declare-datatypes ((array!59980 0))(
  ( (array!59981 (arr!28854 (Array (_ BitVec 32) (_ BitVec 64))) (size!29335 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59980)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969112 (= res!648692 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29335 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29335 _keys!1717))))))

(declare-fun b!969113 () Bool)

(declare-fun res!648694 () Bool)

(assert (=> b!969113 (=> (not res!648694) (not e!546349))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34305 0))(
  ( (V!34306 (val!11046 Int)) )
))
(declare-datatypes ((ValueCell!10514 0))(
  ( (ValueCellFull!10514 (v!13604 V!34305)) (EmptyCell!10514) )
))
(declare-datatypes ((array!59982 0))(
  ( (array!59983 (arr!28855 (Array (_ BitVec 32) ValueCell!10514)) (size!29336 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59982)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969113 (= res!648694 (and (= (size!29336 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29335 _keys!1717) (size!29336 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!648689 () Bool)

(assert (=> start!83082 (=> (not res!648689) (not e!546349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83082 (= res!648689 (validMask!0 mask!2147))))

(assert (=> start!83082 e!546349))

(assert (=> start!83082 true))

(declare-fun e!546351 () Bool)

(declare-fun array_inv!22401 (array!59982) Bool)

(assert (=> start!83082 (and (array_inv!22401 _values!1425) e!546351)))

(declare-fun array_inv!22402 (array!59980) Bool)

(assert (=> start!83082 (array_inv!22402 _keys!1717)))

(declare-fun b!969114 () Bool)

(declare-fun res!648691 () Bool)

(assert (=> b!969114 (=> (not res!648691) (not e!546349))))

(declare-datatypes ((List!20056 0))(
  ( (Nil!20053) (Cons!20052 (h!21214 (_ BitVec 64)) (t!28410 List!20056)) )
))
(declare-fun arrayNoDuplicates!0 (array!59980 (_ BitVec 32) List!20056) Bool)

(assert (=> b!969114 (= res!648691 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20053))))

(declare-fun mapIsEmpty!34996 () Bool)

(declare-fun mapRes!34996 () Bool)

(assert (=> mapIsEmpty!34996 mapRes!34996))

(declare-fun b!969115 () Bool)

(declare-fun res!648693 () Bool)

(assert (=> b!969115 (=> (not res!648693) (not e!546349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59980 (_ BitVec 32)) Bool)

(assert (=> b!969115 (= res!648693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969116 () Bool)

(declare-fun res!648690 () Bool)

(assert (=> b!969116 (=> (not res!648690) (not e!546349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969116 (= res!648690 (validKeyInArray!0 (select (arr!28854 _keys!1717) i!822)))))

(declare-fun b!969117 () Bool)

(declare-fun e!546350 () Bool)

(assert (=> b!969117 (= e!546350 tp_is_empty!21991)))

(declare-fun b!969118 () Bool)

(assert (=> b!969118 (= e!546351 (and e!546347 mapRes!34996))))

(declare-fun condMapEmpty!34996 () Bool)

(declare-fun mapDefault!34996 () ValueCell!10514)

(assert (=> b!969118 (= condMapEmpty!34996 (= (arr!28855 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10514)) mapDefault!34996)))))

(declare-fun b!969119 () Bool)

(assert (=> b!969119 (= e!546349 (or (bvslt from!2118 #b00000000000000000000000000000000) (bvsgt from!2118 (size!29335 _keys!1717))))))

(declare-fun mapNonEmpty!34996 () Bool)

(declare-fun tp!66565 () Bool)

(assert (=> mapNonEmpty!34996 (= mapRes!34996 (and tp!66565 e!546350))))

(declare-fun mapValue!34996 () ValueCell!10514)

(declare-fun mapRest!34996 () (Array (_ BitVec 32) ValueCell!10514))

(declare-fun mapKey!34996 () (_ BitVec 32))

(assert (=> mapNonEmpty!34996 (= (arr!28855 _values!1425) (store mapRest!34996 mapKey!34996 mapValue!34996))))

(assert (= (and start!83082 res!648689) b!969113))

(assert (= (and b!969113 res!648694) b!969115))

(assert (= (and b!969115 res!648693) b!969114))

(assert (= (and b!969114 res!648691) b!969112))

(assert (= (and b!969112 res!648692) b!969116))

(assert (= (and b!969116 res!648690) b!969119))

(assert (= (and b!969118 condMapEmpty!34996) mapIsEmpty!34996))

(assert (= (and b!969118 (not condMapEmpty!34996)) mapNonEmpty!34996))

(get-info :version)

(assert (= (and mapNonEmpty!34996 ((_ is ValueCellFull!10514) mapValue!34996)) b!969117))

(assert (= (and b!969118 ((_ is ValueCellFull!10514) mapDefault!34996)) b!969111))

(assert (= start!83082 b!969118))

(declare-fun m!896621 () Bool)

(assert (=> b!969115 m!896621))

(declare-fun m!896623 () Bool)

(assert (=> b!969116 m!896623))

(assert (=> b!969116 m!896623))

(declare-fun m!896625 () Bool)

(assert (=> b!969116 m!896625))

(declare-fun m!896627 () Bool)

(assert (=> b!969114 m!896627))

(declare-fun m!896629 () Bool)

(assert (=> start!83082 m!896629))

(declare-fun m!896631 () Bool)

(assert (=> start!83082 m!896631))

(declare-fun m!896633 () Bool)

(assert (=> start!83082 m!896633))

(declare-fun m!896635 () Bool)

(assert (=> mapNonEmpty!34996 m!896635))

(check-sat (not mapNonEmpty!34996) (not b!969114) tp_is_empty!21991 (not b!969116) (not b!969115) (not start!83082))
(check-sat)
