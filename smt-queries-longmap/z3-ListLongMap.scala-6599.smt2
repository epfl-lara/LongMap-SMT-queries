; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83480 () Bool)

(assert start!83480)

(declare-fun b_free!19467 () Bool)

(declare-fun b_next!19467 () Bool)

(assert (=> start!83480 (= b_free!19467 (not b_next!19467))))

(declare-fun tp!67689 () Bool)

(declare-fun b_and!31069 () Bool)

(assert (=> start!83480 (= tp!67689 b_and!31069)))

(declare-fun b!975157 () Bool)

(declare-fun res!652783 () Bool)

(declare-fun e!549609 () Bool)

(assert (=> b!975157 (=> (not res!652783) (not e!549609))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34811 0))(
  ( (V!34812 (val!11236 Int)) )
))
(declare-datatypes ((ValueCell!10704 0))(
  ( (ValueCellFull!10704 (v!13795 V!34811)) (EmptyCell!10704) )
))
(declare-datatypes ((array!60773 0))(
  ( (array!60774 (arr!29250 (Array (_ BitVec 32) ValueCell!10704)) (size!29729 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60773)

(declare-fun zeroValue!1367 () V!34811)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60775 0))(
  ( (array!60776 (arr!29251 (Array (_ BitVec 32) (_ BitVec 64))) (size!29730 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60775)

(declare-fun minValue!1367 () V!34811)

(declare-datatypes ((tuple2!14444 0))(
  ( (tuple2!14445 (_1!7233 (_ BitVec 64)) (_2!7233 V!34811)) )
))
(declare-datatypes ((List!20296 0))(
  ( (Nil!20293) (Cons!20292 (h!21454 tuple2!14444) (t!28773 List!20296)) )
))
(declare-datatypes ((ListLongMap!13141 0))(
  ( (ListLongMap!13142 (toList!6586 List!20296)) )
))
(declare-fun contains!5668 (ListLongMap!13141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3819 (array!60775 array!60773 (_ BitVec 32) (_ BitVec 32) V!34811 V!34811 (_ BitVec 32) Int) ListLongMap!13141)

(assert (=> b!975157 (= res!652783 (contains!5668 (getCurrentListMap!3819 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29251 _keys!1717) i!822)))))

(declare-fun b!975158 () Bool)

(declare-fun e!549606 () Bool)

(declare-fun tp_is_empty!22371 () Bool)

(assert (=> b!975158 (= e!549606 tp_is_empty!22371)))

(declare-fun b!975159 () Bool)

(declare-fun res!652787 () Bool)

(assert (=> b!975159 (=> (not res!652787) (not e!549609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60775 (_ BitVec 32)) Bool)

(assert (=> b!975159 (= res!652787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35566 () Bool)

(declare-fun mapRes!35566 () Bool)

(declare-fun tp!67688 () Bool)

(assert (=> mapNonEmpty!35566 (= mapRes!35566 (and tp!67688 e!549606))))

(declare-fun mapRest!35566 () (Array (_ BitVec 32) ValueCell!10704))

(declare-fun mapKey!35566 () (_ BitVec 32))

(declare-fun mapValue!35566 () ValueCell!10704)

(assert (=> mapNonEmpty!35566 (= (arr!29250 _values!1425) (store mapRest!35566 mapKey!35566 mapValue!35566))))

(declare-fun b!975160 () Bool)

(declare-fun res!652782 () Bool)

(assert (=> b!975160 (=> (not res!652782) (not e!549609))))

(assert (=> b!975160 (= res!652782 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29730 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29730 _keys!1717))))))

(declare-fun b!975162 () Bool)

(assert (=> b!975162 (= e!549609 false)))

(declare-fun lt!432836 () ListLongMap!13141)

(assert (=> b!975162 (= lt!432836 (getCurrentListMap!3819 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975163 () Bool)

(declare-fun res!652788 () Bool)

(assert (=> b!975163 (=> (not res!652788) (not e!549609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975163 (= res!652788 (validKeyInArray!0 (select (arr!29251 _keys!1717) i!822)))))

(declare-fun b!975161 () Bool)

(declare-fun res!652785 () Bool)

(assert (=> b!975161 (=> (not res!652785) (not e!549609))))

(assert (=> b!975161 (= res!652785 (and (= (size!29729 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29730 _keys!1717) (size!29729 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!652786 () Bool)

(assert (=> start!83480 (=> (not res!652786) (not e!549609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83480 (= res!652786 (validMask!0 mask!2147))))

(assert (=> start!83480 e!549609))

(assert (=> start!83480 true))

(declare-fun e!549607 () Bool)

(declare-fun array_inv!22619 (array!60773) Bool)

(assert (=> start!83480 (and (array_inv!22619 _values!1425) e!549607)))

(assert (=> start!83480 tp_is_empty!22371))

(assert (=> start!83480 tp!67689))

(declare-fun array_inv!22620 (array!60775) Bool)

(assert (=> start!83480 (array_inv!22620 _keys!1717)))

(declare-fun mapIsEmpty!35566 () Bool)

(assert (=> mapIsEmpty!35566 mapRes!35566))

(declare-fun b!975164 () Bool)

(declare-fun e!549608 () Bool)

(assert (=> b!975164 (= e!549607 (and e!549608 mapRes!35566))))

(declare-fun condMapEmpty!35566 () Bool)

(declare-fun mapDefault!35566 () ValueCell!10704)

(assert (=> b!975164 (= condMapEmpty!35566 (= (arr!29250 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10704)) mapDefault!35566)))))

(declare-fun b!975165 () Bool)

(declare-fun res!652784 () Bool)

(assert (=> b!975165 (=> (not res!652784) (not e!549609))))

(declare-datatypes ((List!20297 0))(
  ( (Nil!20294) (Cons!20293 (h!21455 (_ BitVec 64)) (t!28774 List!20297)) )
))
(declare-fun arrayNoDuplicates!0 (array!60775 (_ BitVec 32) List!20297) Bool)

(assert (=> b!975165 (= res!652784 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20294))))

(declare-fun b!975166 () Bool)

(assert (=> b!975166 (= e!549608 tp_is_empty!22371)))

(assert (= (and start!83480 res!652786) b!975161))

(assert (= (and b!975161 res!652785) b!975159))

(assert (= (and b!975159 res!652787) b!975165))

(assert (= (and b!975165 res!652784) b!975160))

(assert (= (and b!975160 res!652782) b!975163))

(assert (= (and b!975163 res!652788) b!975157))

(assert (= (and b!975157 res!652783) b!975162))

(assert (= (and b!975164 condMapEmpty!35566) mapIsEmpty!35566))

(assert (= (and b!975164 (not condMapEmpty!35566)) mapNonEmpty!35566))

(get-info :version)

(assert (= (and mapNonEmpty!35566 ((_ is ValueCellFull!10704) mapValue!35566)) b!975158))

(assert (= (and b!975164 ((_ is ValueCellFull!10704) mapDefault!35566)) b!975166))

(assert (= start!83480 b!975164))

(declare-fun m!902477 () Bool)

(assert (=> mapNonEmpty!35566 m!902477))

(declare-fun m!902479 () Bool)

(assert (=> start!83480 m!902479))

(declare-fun m!902481 () Bool)

(assert (=> start!83480 m!902481))

(declare-fun m!902483 () Bool)

(assert (=> start!83480 m!902483))

(declare-fun m!902485 () Bool)

(assert (=> b!975163 m!902485))

(assert (=> b!975163 m!902485))

(declare-fun m!902487 () Bool)

(assert (=> b!975163 m!902487))

(declare-fun m!902489 () Bool)

(assert (=> b!975159 m!902489))

(declare-fun m!902491 () Bool)

(assert (=> b!975157 m!902491))

(assert (=> b!975157 m!902485))

(assert (=> b!975157 m!902491))

(assert (=> b!975157 m!902485))

(declare-fun m!902493 () Bool)

(assert (=> b!975157 m!902493))

(declare-fun m!902495 () Bool)

(assert (=> b!975162 m!902495))

(declare-fun m!902497 () Bool)

(assert (=> b!975165 m!902497))

(check-sat (not b!975162) (not b!975163) (not b!975157) (not b!975159) (not start!83480) b_and!31069 tp_is_empty!22371 (not mapNonEmpty!35566) (not b_next!19467) (not b!975165))
(check-sat b_and!31069 (not b_next!19467))
