; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108646 () Bool)

(assert start!108646)

(declare-fun b_free!28159 () Bool)

(declare-fun b_next!28159 () Bool)

(assert (=> start!108646 (= b_free!28159 (not b_next!28159))))

(declare-fun tp!99594 () Bool)

(declare-fun b_and!46207 () Bool)

(assert (=> start!108646 (= tp!99594 b_and!46207)))

(declare-fun b!1282381 () Bool)

(declare-fun res!851812 () Bool)

(declare-fun e!732726 () Bool)

(assert (=> b!1282381 (=> (not res!851812) (not e!732726))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84561 0))(
  ( (array!84562 (arr!40783 (Array (_ BitVec 32) (_ BitVec 64))) (size!41335 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84561)

(assert (=> b!1282381 (= res!851812 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41335 _keys!1741))))))

(declare-fun b!1282382 () Bool)

(declare-fun res!851813 () Bool)

(assert (=> b!1282382 (=> (not res!851813) (not e!732726))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84561 (_ BitVec 32)) Bool)

(assert (=> b!1282382 (= res!851813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52256 () Bool)

(declare-fun mapRes!52256 () Bool)

(declare-fun tp!99593 () Bool)

(declare-fun e!732723 () Bool)

(assert (=> mapNonEmpty!52256 (= mapRes!52256 (and tp!99593 e!732723))))

(declare-fun mapKey!52256 () (_ BitVec 32))

(declare-datatypes ((V!50169 0))(
  ( (V!50170 (val!16974 Int)) )
))
(declare-datatypes ((ValueCell!16001 0))(
  ( (ValueCellFull!16001 (v!19575 V!50169)) (EmptyCell!16001) )
))
(declare-fun mapRest!52256 () (Array (_ BitVec 32) ValueCell!16001))

(declare-datatypes ((array!84563 0))(
  ( (array!84564 (arr!40784 (Array (_ BitVec 32) ValueCell!16001)) (size!41336 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84563)

(declare-fun mapValue!52256 () ValueCell!16001)

(assert (=> mapNonEmpty!52256 (= (arr!40784 _values!1445) (store mapRest!52256 mapKey!52256 mapValue!52256))))

(declare-fun b!1282383 () Bool)

(declare-fun tp_is_empty!33799 () Bool)

(assert (=> b!1282383 (= e!732723 tp_is_empty!33799)))

(declare-fun b!1282384 () Bool)

(declare-fun e!732724 () Bool)

(assert (=> b!1282384 (= e!732724 tp_is_empty!33799)))

(declare-fun res!851811 () Bool)

(assert (=> start!108646 (=> (not res!851811) (not e!732726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108646 (= res!851811 (validMask!0 mask!2175))))

(assert (=> start!108646 e!732726))

(assert (=> start!108646 tp_is_empty!33799))

(assert (=> start!108646 true))

(declare-fun e!732722 () Bool)

(declare-fun array_inv!31099 (array!84563) Bool)

(assert (=> start!108646 (and (array_inv!31099 _values!1445) e!732722)))

(declare-fun array_inv!31100 (array!84561) Bool)

(assert (=> start!108646 (array_inv!31100 _keys!1741)))

(assert (=> start!108646 tp!99594))

(declare-fun b!1282385 () Bool)

(declare-fun res!851810 () Bool)

(assert (=> b!1282385 (=> (not res!851810) (not e!732726))))

(declare-datatypes ((List!28989 0))(
  ( (Nil!28986) (Cons!28985 (h!30194 (_ BitVec 64)) (t!42525 List!28989)) )
))
(declare-fun arrayNoDuplicates!0 (array!84561 (_ BitVec 32) List!28989) Bool)

(assert (=> b!1282385 (= res!851810 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28986))))

(declare-fun b!1282386 () Bool)

(assert (=> b!1282386 (= e!732726 false)))

(declare-fun minValue!1387 () V!50169)

(declare-fun zeroValue!1387 () V!50169)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576357 () Bool)

(declare-datatypes ((tuple2!21800 0))(
  ( (tuple2!21801 (_1!10911 (_ BitVec 64)) (_2!10911 V!50169)) )
))
(declare-datatypes ((List!28990 0))(
  ( (Nil!28987) (Cons!28986 (h!30195 tuple2!21800) (t!42526 List!28990)) )
))
(declare-datatypes ((ListLongMap!19457 0))(
  ( (ListLongMap!19458 (toList!9744 List!28990)) )
))
(declare-fun contains!7791 (ListLongMap!19457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4718 (array!84561 array!84563 (_ BitVec 32) (_ BitVec 32) V!50169 V!50169 (_ BitVec 32) Int) ListLongMap!19457)

(assert (=> b!1282386 (= lt!576357 (contains!7791 (getCurrentListMap!4718 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282387 () Bool)

(declare-fun res!851814 () Bool)

(assert (=> b!1282387 (=> (not res!851814) (not e!732726))))

(assert (=> b!1282387 (= res!851814 (and (= (size!41336 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41335 _keys!1741) (size!41336 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52256 () Bool)

(assert (=> mapIsEmpty!52256 mapRes!52256))

(declare-fun b!1282388 () Bool)

(assert (=> b!1282388 (= e!732722 (and e!732724 mapRes!52256))))

(declare-fun condMapEmpty!52256 () Bool)

(declare-fun mapDefault!52256 () ValueCell!16001)

(assert (=> b!1282388 (= condMapEmpty!52256 (= (arr!40784 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16001)) mapDefault!52256)))))

(assert (= (and start!108646 res!851811) b!1282387))

(assert (= (and b!1282387 res!851814) b!1282382))

(assert (= (and b!1282382 res!851813) b!1282385))

(assert (= (and b!1282385 res!851810) b!1282381))

(assert (= (and b!1282381 res!851812) b!1282386))

(assert (= (and b!1282388 condMapEmpty!52256) mapIsEmpty!52256))

(assert (= (and b!1282388 (not condMapEmpty!52256)) mapNonEmpty!52256))

(get-info :version)

(assert (= (and mapNonEmpty!52256 ((_ is ValueCellFull!16001) mapValue!52256)) b!1282383))

(assert (= (and b!1282388 ((_ is ValueCellFull!16001) mapDefault!52256)) b!1282384))

(assert (= start!108646 b!1282388))

(declare-fun m!1176145 () Bool)

(assert (=> b!1282386 m!1176145))

(assert (=> b!1282386 m!1176145))

(declare-fun m!1176147 () Bool)

(assert (=> b!1282386 m!1176147))

(declare-fun m!1176149 () Bool)

(assert (=> b!1282382 m!1176149))

(declare-fun m!1176151 () Bool)

(assert (=> mapNonEmpty!52256 m!1176151))

(declare-fun m!1176153 () Bool)

(assert (=> b!1282385 m!1176153))

(declare-fun m!1176155 () Bool)

(assert (=> start!108646 m!1176155))

(declare-fun m!1176157 () Bool)

(assert (=> start!108646 m!1176157))

(declare-fun m!1176159 () Bool)

(assert (=> start!108646 m!1176159))

(check-sat (not b!1282386) (not b!1282385) (not start!108646) tp_is_empty!33799 (not b_next!28159) b_and!46207 (not b!1282382) (not mapNonEmpty!52256))
(check-sat b_and!46207 (not b_next!28159))
