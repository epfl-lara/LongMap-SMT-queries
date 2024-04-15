; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83094 () Bool)

(assert start!83094)

(declare-fun b_free!19105 () Bool)

(declare-fun b_next!19105 () Bool)

(assert (=> start!83094 (= b_free!19105 (not b_next!19105))))

(declare-fun tp!66595 () Bool)

(declare-fun b_and!30567 () Bool)

(assert (=> start!83094 (= tp!66595 b_and!30567)))

(declare-fun b!969273 () Bool)

(declare-fun e!546440 () Bool)

(assert (=> b!969273 (= e!546440 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34321 0))(
  ( (V!34322 (val!11052 Int)) )
))
(declare-datatypes ((ValueCell!10520 0))(
  ( (ValueCellFull!10520 (v!13610 V!34321)) (EmptyCell!10520) )
))
(declare-datatypes ((array!60004 0))(
  ( (array!60005 (arr!28866 (Array (_ BitVec 32) ValueCell!10520)) (size!29347 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60004)

(declare-fun lt!431409 () Bool)

(declare-fun zeroValue!1367 () V!34321)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34321)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60006 0))(
  ( (array!60007 (arr!28867 (Array (_ BitVec 32) (_ BitVec 64))) (size!29348 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60006)

(declare-datatypes ((tuple2!14242 0))(
  ( (tuple2!14243 (_1!7132 (_ BitVec 64)) (_2!7132 V!34321)) )
))
(declare-datatypes ((List!20062 0))(
  ( (Nil!20059) (Cons!20058 (h!21220 tuple2!14242) (t!28416 List!20062)) )
))
(declare-datatypes ((ListLongMap!12929 0))(
  ( (ListLongMap!12930 (toList!6480 List!20062)) )
))
(declare-fun contains!5528 (ListLongMap!12929 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3642 (array!60006 array!60004 (_ BitVec 32) (_ BitVec 32) V!34321 V!34321 (_ BitVec 32) Int) ListLongMap!12929)

(assert (=> b!969273 (= lt!431409 (contains!5528 (getCurrentListMap!3642 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28867 _keys!1717) i!822)))))

(declare-fun b!969274 () Bool)

(declare-fun res!648802 () Bool)

(assert (=> b!969274 (=> (not res!648802) (not e!546440))))

(assert (=> b!969274 (= res!648802 (and (= (size!29347 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29348 _keys!1717) (size!29347 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969275 () Bool)

(declare-fun res!648798 () Bool)

(assert (=> b!969275 (=> (not res!648798) (not e!546440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60006 (_ BitVec 32)) Bool)

(assert (=> b!969275 (= res!648798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35014 () Bool)

(declare-fun mapRes!35014 () Bool)

(assert (=> mapIsEmpty!35014 mapRes!35014))

(declare-fun res!648800 () Bool)

(assert (=> start!83094 (=> (not res!648800) (not e!546440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83094 (= res!648800 (validMask!0 mask!2147))))

(assert (=> start!83094 e!546440))

(assert (=> start!83094 true))

(declare-fun e!546441 () Bool)

(declare-fun array_inv!22407 (array!60004) Bool)

(assert (=> start!83094 (and (array_inv!22407 _values!1425) e!546441)))

(declare-fun tp_is_empty!22003 () Bool)

(assert (=> start!83094 tp_is_empty!22003))

(assert (=> start!83094 tp!66595))

(declare-fun array_inv!22408 (array!60006) Bool)

(assert (=> start!83094 (array_inv!22408 _keys!1717)))

(declare-fun b!969276 () Bool)

(declare-fun res!648799 () Bool)

(assert (=> b!969276 (=> (not res!648799) (not e!546440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969276 (= res!648799 (validKeyInArray!0 (select (arr!28867 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35014 () Bool)

(declare-fun tp!66594 () Bool)

(declare-fun e!546438 () Bool)

(assert (=> mapNonEmpty!35014 (= mapRes!35014 (and tp!66594 e!546438))))

(declare-fun mapRest!35014 () (Array (_ BitVec 32) ValueCell!10520))

(declare-fun mapValue!35014 () ValueCell!10520)

(declare-fun mapKey!35014 () (_ BitVec 32))

(assert (=> mapNonEmpty!35014 (= (arr!28866 _values!1425) (store mapRest!35014 mapKey!35014 mapValue!35014))))

(declare-fun b!969277 () Bool)

(declare-fun res!648797 () Bool)

(assert (=> b!969277 (=> (not res!648797) (not e!546440))))

(declare-datatypes ((List!20063 0))(
  ( (Nil!20060) (Cons!20059 (h!21221 (_ BitVec 64)) (t!28417 List!20063)) )
))
(declare-fun arrayNoDuplicates!0 (array!60006 (_ BitVec 32) List!20063) Bool)

(assert (=> b!969277 (= res!648797 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20060))))

(declare-fun b!969278 () Bool)

(declare-fun res!648801 () Bool)

(assert (=> b!969278 (=> (not res!648801) (not e!546440))))

(assert (=> b!969278 (= res!648801 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29348 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29348 _keys!1717))))))

(declare-fun b!969279 () Bool)

(declare-fun e!546439 () Bool)

(assert (=> b!969279 (= e!546439 tp_is_empty!22003)))

(declare-fun b!969280 () Bool)

(assert (=> b!969280 (= e!546441 (and e!546439 mapRes!35014))))

(declare-fun condMapEmpty!35014 () Bool)

(declare-fun mapDefault!35014 () ValueCell!10520)

(assert (=> b!969280 (= condMapEmpty!35014 (= (arr!28866 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10520)) mapDefault!35014)))))

(declare-fun b!969281 () Bool)

(assert (=> b!969281 (= e!546438 tp_is_empty!22003)))

(assert (= (and start!83094 res!648800) b!969274))

(assert (= (and b!969274 res!648802) b!969275))

(assert (= (and b!969275 res!648798) b!969277))

(assert (= (and b!969277 res!648797) b!969278))

(assert (= (and b!969278 res!648801) b!969276))

(assert (= (and b!969276 res!648799) b!969273))

(assert (= (and b!969280 condMapEmpty!35014) mapIsEmpty!35014))

(assert (= (and b!969280 (not condMapEmpty!35014)) mapNonEmpty!35014))

(get-info :version)

(assert (= (and mapNonEmpty!35014 ((_ is ValueCellFull!10520) mapValue!35014)) b!969281))

(assert (= (and b!969280 ((_ is ValueCellFull!10520) mapDefault!35014)) b!969279))

(assert (= start!83094 b!969280))

(declare-fun m!896729 () Bool)

(assert (=> b!969275 m!896729))

(declare-fun m!896731 () Bool)

(assert (=> b!969276 m!896731))

(assert (=> b!969276 m!896731))

(declare-fun m!896733 () Bool)

(assert (=> b!969276 m!896733))

(declare-fun m!896735 () Bool)

(assert (=> b!969277 m!896735))

(declare-fun m!896737 () Bool)

(assert (=> start!83094 m!896737))

(declare-fun m!896739 () Bool)

(assert (=> start!83094 m!896739))

(declare-fun m!896741 () Bool)

(assert (=> start!83094 m!896741))

(declare-fun m!896743 () Bool)

(assert (=> b!969273 m!896743))

(assert (=> b!969273 m!896731))

(assert (=> b!969273 m!896743))

(assert (=> b!969273 m!896731))

(declare-fun m!896745 () Bool)

(assert (=> b!969273 m!896745))

(declare-fun m!896747 () Bool)

(assert (=> mapNonEmpty!35014 m!896747))

(check-sat (not b!969276) (not b!969277) (not start!83094) (not b!969273) (not b_next!19105) (not mapNonEmpty!35014) b_and!30567 (not b!969275) tp_is_empty!22003)
(check-sat b_and!30567 (not b_next!19105))
