; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83492 () Bool)

(assert start!83492)

(declare-fun b_free!19479 () Bool)

(declare-fun b_next!19479 () Bool)

(assert (=> start!83492 (= b_free!19479 (not b_next!19479))))

(declare-fun tp!67725 () Bool)

(declare-fun b_and!31081 () Bool)

(assert (=> start!83492 (= tp!67725 b_and!31081)))

(declare-fun b!975337 () Bool)

(declare-fun res!652908 () Bool)

(declare-fun e!549700 () Bool)

(assert (=> b!975337 (=> (not res!652908) (not e!549700))))

(declare-datatypes ((array!60797 0))(
  ( (array!60798 (arr!29262 (Array (_ BitVec 32) (_ BitVec 64))) (size!29741 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60797)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60797 (_ BitVec 32)) Bool)

(assert (=> b!975337 (= res!652908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35584 () Bool)

(declare-fun mapRes!35584 () Bool)

(declare-fun tp!67724 () Bool)

(declare-fun e!549696 () Bool)

(assert (=> mapNonEmpty!35584 (= mapRes!35584 (and tp!67724 e!549696))))

(declare-datatypes ((V!34827 0))(
  ( (V!34828 (val!11242 Int)) )
))
(declare-datatypes ((ValueCell!10710 0))(
  ( (ValueCellFull!10710 (v!13801 V!34827)) (EmptyCell!10710) )
))
(declare-datatypes ((array!60799 0))(
  ( (array!60800 (arr!29263 (Array (_ BitVec 32) ValueCell!10710)) (size!29742 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60799)

(declare-fun mapKey!35584 () (_ BitVec 32))

(declare-fun mapValue!35584 () ValueCell!10710)

(declare-fun mapRest!35584 () (Array (_ BitVec 32) ValueCell!10710))

(assert (=> mapNonEmpty!35584 (= (arr!29263 _values!1425) (store mapRest!35584 mapKey!35584 mapValue!35584))))

(declare-fun mapIsEmpty!35584 () Bool)

(assert (=> mapIsEmpty!35584 mapRes!35584))

(declare-fun b!975338 () Bool)

(declare-fun e!549699 () Bool)

(declare-fun e!549698 () Bool)

(assert (=> b!975338 (= e!549699 (and e!549698 mapRes!35584))))

(declare-fun condMapEmpty!35584 () Bool)

(declare-fun mapDefault!35584 () ValueCell!10710)

(assert (=> b!975338 (= condMapEmpty!35584 (= (arr!29263 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10710)) mapDefault!35584)))))

(declare-fun b!975339 () Bool)

(declare-fun res!652914 () Bool)

(assert (=> b!975339 (=> (not res!652914) (not e!549700))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975339 (= res!652914 (validKeyInArray!0 (select (arr!29262 _keys!1717) i!822)))))

(declare-fun b!975340 () Bool)

(assert (=> b!975340 (= e!549700 false)))

(declare-fun zeroValue!1367 () V!34827)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34827)

(declare-datatypes ((tuple2!14456 0))(
  ( (tuple2!14457 (_1!7239 (_ BitVec 64)) (_2!7239 V!34827)) )
))
(declare-datatypes ((List!20308 0))(
  ( (Nil!20305) (Cons!20304 (h!21466 tuple2!14456) (t!28785 List!20308)) )
))
(declare-datatypes ((ListLongMap!13153 0))(
  ( (ListLongMap!13154 (toList!6592 List!20308)) )
))
(declare-fun lt!432854 () ListLongMap!13153)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3825 (array!60797 array!60799 (_ BitVec 32) (_ BitVec 32) V!34827 V!34827 (_ BitVec 32) Int) ListLongMap!13153)

(assert (=> b!975340 (= lt!432854 (getCurrentListMap!3825 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975342 () Bool)

(declare-fun tp_is_empty!22383 () Bool)

(assert (=> b!975342 (= e!549696 tp_is_empty!22383)))

(declare-fun b!975343 () Bool)

(declare-fun res!652911 () Bool)

(assert (=> b!975343 (=> (not res!652911) (not e!549700))))

(assert (=> b!975343 (= res!652911 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29741 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29741 _keys!1717))))))

(declare-fun b!975344 () Bool)

(declare-fun res!652909 () Bool)

(assert (=> b!975344 (=> (not res!652909) (not e!549700))))

(assert (=> b!975344 (= res!652909 (and (= (size!29742 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29741 _keys!1717) (size!29742 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975341 () Bool)

(declare-fun res!652910 () Bool)

(assert (=> b!975341 (=> (not res!652910) (not e!549700))))

(declare-datatypes ((List!20309 0))(
  ( (Nil!20306) (Cons!20305 (h!21467 (_ BitVec 64)) (t!28786 List!20309)) )
))
(declare-fun arrayNoDuplicates!0 (array!60797 (_ BitVec 32) List!20309) Bool)

(assert (=> b!975341 (= res!652910 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20306))))

(declare-fun res!652913 () Bool)

(assert (=> start!83492 (=> (not res!652913) (not e!549700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83492 (= res!652913 (validMask!0 mask!2147))))

(assert (=> start!83492 e!549700))

(assert (=> start!83492 true))

(declare-fun array_inv!22629 (array!60799) Bool)

(assert (=> start!83492 (and (array_inv!22629 _values!1425) e!549699)))

(assert (=> start!83492 tp_is_empty!22383))

(assert (=> start!83492 tp!67725))

(declare-fun array_inv!22630 (array!60797) Bool)

(assert (=> start!83492 (array_inv!22630 _keys!1717)))

(declare-fun b!975345 () Bool)

(assert (=> b!975345 (= e!549698 tp_is_empty!22383)))

(declare-fun b!975346 () Bool)

(declare-fun res!652912 () Bool)

(assert (=> b!975346 (=> (not res!652912) (not e!549700))))

(declare-fun contains!5674 (ListLongMap!13153 (_ BitVec 64)) Bool)

(assert (=> b!975346 (= res!652912 (contains!5674 (getCurrentListMap!3825 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29262 _keys!1717) i!822)))))

(assert (= (and start!83492 res!652913) b!975344))

(assert (= (and b!975344 res!652909) b!975337))

(assert (= (and b!975337 res!652908) b!975341))

(assert (= (and b!975341 res!652910) b!975343))

(assert (= (and b!975343 res!652911) b!975339))

(assert (= (and b!975339 res!652914) b!975346))

(assert (= (and b!975346 res!652912) b!975340))

(assert (= (and b!975338 condMapEmpty!35584) mapIsEmpty!35584))

(assert (= (and b!975338 (not condMapEmpty!35584)) mapNonEmpty!35584))

(get-info :version)

(assert (= (and mapNonEmpty!35584 ((_ is ValueCellFull!10710) mapValue!35584)) b!975342))

(assert (= (and b!975338 ((_ is ValueCellFull!10710) mapDefault!35584)) b!975345))

(assert (= start!83492 b!975338))

(declare-fun m!902609 () Bool)

(assert (=> b!975346 m!902609))

(declare-fun m!902611 () Bool)

(assert (=> b!975346 m!902611))

(assert (=> b!975346 m!902609))

(assert (=> b!975346 m!902611))

(declare-fun m!902613 () Bool)

(assert (=> b!975346 m!902613))

(declare-fun m!902615 () Bool)

(assert (=> mapNonEmpty!35584 m!902615))

(declare-fun m!902617 () Bool)

(assert (=> start!83492 m!902617))

(declare-fun m!902619 () Bool)

(assert (=> start!83492 m!902619))

(declare-fun m!902621 () Bool)

(assert (=> start!83492 m!902621))

(assert (=> b!975339 m!902611))

(assert (=> b!975339 m!902611))

(declare-fun m!902623 () Bool)

(assert (=> b!975339 m!902623))

(declare-fun m!902625 () Bool)

(assert (=> b!975337 m!902625))

(declare-fun m!902627 () Bool)

(assert (=> b!975340 m!902627))

(declare-fun m!902629 () Bool)

(assert (=> b!975341 m!902629))

(check-sat b_and!31081 (not b_next!19479) (not b!975340) (not mapNonEmpty!35584) (not b!975341) (not b!975339) (not b!975337) (not b!975346) (not start!83492) tp_is_empty!22383)
(check-sat b_and!31081 (not b_next!19479))
