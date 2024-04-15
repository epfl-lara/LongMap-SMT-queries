; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83466 () Bool)

(assert start!83466)

(declare-fun b_free!19471 () Bool)

(declare-fun b_next!19471 () Bool)

(assert (=> start!83466 (= b_free!19471 (not b_next!19471))))

(declare-fun tp!67702 () Bool)

(declare-fun b_and!31047 () Bool)

(assert (=> start!83466 (= tp!67702 b_and!31047)))

(declare-fun mapIsEmpty!35572 () Bool)

(declare-fun mapRes!35572 () Bool)

(assert (=> mapIsEmpty!35572 mapRes!35572))

(declare-fun b!974978 () Bool)

(declare-fun res!652716 () Bool)

(declare-fun e!549490 () Bool)

(assert (=> b!974978 (=> (not res!652716) (not e!549490))))

(declare-datatypes ((array!60710 0))(
  ( (array!60711 (arr!29219 (Array (_ BitVec 32) (_ BitVec 64))) (size!29700 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60710)

(declare-datatypes ((List!20319 0))(
  ( (Nil!20316) (Cons!20315 (h!21477 (_ BitVec 64)) (t!28787 List!20319)) )
))
(declare-fun arrayNoDuplicates!0 (array!60710 (_ BitVec 32) List!20319) Bool)

(assert (=> b!974978 (= res!652716 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20316))))

(declare-fun b!974979 () Bool)

(assert (=> b!974979 (= e!549490 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34817 0))(
  ( (V!34818 (val!11238 Int)) )
))
(declare-datatypes ((ValueCell!10706 0))(
  ( (ValueCellFull!10706 (v!13796 V!34817)) (EmptyCell!10706) )
))
(declare-datatypes ((array!60712 0))(
  ( (array!60713 (arr!29220 (Array (_ BitVec 32) ValueCell!10706)) (size!29701 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60712)

(declare-fun zeroValue!1367 () V!34817)

(declare-datatypes ((tuple2!14512 0))(
  ( (tuple2!14513 (_1!7267 (_ BitVec 64)) (_2!7267 V!34817)) )
))
(declare-datatypes ((List!20320 0))(
  ( (Nil!20317) (Cons!20316 (h!21478 tuple2!14512) (t!28788 List!20320)) )
))
(declare-datatypes ((ListLongMap!13199 0))(
  ( (ListLongMap!13200 (toList!6615 List!20320)) )
))
(declare-fun lt!432606 () ListLongMap!13199)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34817)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3777 (array!60710 array!60712 (_ BitVec 32) (_ BitVec 32) V!34817 V!34817 (_ BitVec 32) Int) ListLongMap!13199)

(assert (=> b!974979 (= lt!432606 (getCurrentListMap!3777 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974980 () Bool)

(declare-fun res!652715 () Bool)

(assert (=> b!974980 (=> (not res!652715) (not e!549490))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974980 (= res!652715 (validKeyInArray!0 (select (arr!29219 _keys!1717) i!822)))))

(declare-fun b!974981 () Bool)

(declare-fun e!549491 () Bool)

(declare-fun tp_is_empty!22375 () Bool)

(assert (=> b!974981 (= e!549491 tp_is_empty!22375)))

(declare-fun mapNonEmpty!35572 () Bool)

(declare-fun tp!67701 () Bool)

(declare-fun e!549488 () Bool)

(assert (=> mapNonEmpty!35572 (= mapRes!35572 (and tp!67701 e!549488))))

(declare-fun mapValue!35572 () ValueCell!10706)

(declare-fun mapRest!35572 () (Array (_ BitVec 32) ValueCell!10706))

(declare-fun mapKey!35572 () (_ BitVec 32))

(assert (=> mapNonEmpty!35572 (= (arr!29220 _values!1425) (store mapRest!35572 mapKey!35572 mapValue!35572))))

(declare-fun b!974982 () Bool)

(declare-fun res!652717 () Bool)

(assert (=> b!974982 (=> (not res!652717) (not e!549490))))

(assert (=> b!974982 (= res!652717 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29700 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29700 _keys!1717))))))

(declare-fun b!974983 () Bool)

(assert (=> b!974983 (= e!549488 tp_is_empty!22375)))

(declare-fun res!652718 () Bool)

(assert (=> start!83466 (=> (not res!652718) (not e!549490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83466 (= res!652718 (validMask!0 mask!2147))))

(assert (=> start!83466 e!549490))

(assert (=> start!83466 true))

(declare-fun e!549492 () Bool)

(declare-fun array_inv!22645 (array!60712) Bool)

(assert (=> start!83466 (and (array_inv!22645 _values!1425) e!549492)))

(assert (=> start!83466 tp_is_empty!22375))

(assert (=> start!83466 tp!67702))

(declare-fun array_inv!22646 (array!60710) Bool)

(assert (=> start!83466 (array_inv!22646 _keys!1717)))

(declare-fun b!974984 () Bool)

(assert (=> b!974984 (= e!549492 (and e!549491 mapRes!35572))))

(declare-fun condMapEmpty!35572 () Bool)

(declare-fun mapDefault!35572 () ValueCell!10706)

(assert (=> b!974984 (= condMapEmpty!35572 (= (arr!29220 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10706)) mapDefault!35572)))))

(declare-fun b!974985 () Bool)

(declare-fun res!652719 () Bool)

(assert (=> b!974985 (=> (not res!652719) (not e!549490))))

(assert (=> b!974985 (= res!652719 (and (= (size!29701 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29700 _keys!1717) (size!29701 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974986 () Bool)

(declare-fun res!652714 () Bool)

(assert (=> b!974986 (=> (not res!652714) (not e!549490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60710 (_ BitVec 32)) Bool)

(assert (=> b!974986 (= res!652714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974987 () Bool)

(declare-fun res!652720 () Bool)

(assert (=> b!974987 (=> (not res!652720) (not e!549490))))

(declare-fun contains!5647 (ListLongMap!13199 (_ BitVec 64)) Bool)

(assert (=> b!974987 (= res!652720 (contains!5647 (getCurrentListMap!3777 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29219 _keys!1717) i!822)))))

(assert (= (and start!83466 res!652718) b!974985))

(assert (= (and b!974985 res!652719) b!974986))

(assert (= (and b!974986 res!652714) b!974978))

(assert (= (and b!974978 res!652716) b!974982))

(assert (= (and b!974982 res!652717) b!974980))

(assert (= (and b!974980 res!652715) b!974987))

(assert (= (and b!974987 res!652720) b!974979))

(assert (= (and b!974984 condMapEmpty!35572) mapIsEmpty!35572))

(assert (= (and b!974984 (not condMapEmpty!35572)) mapNonEmpty!35572))

(get-info :version)

(assert (= (and mapNonEmpty!35572 ((_ is ValueCellFull!10706) mapValue!35572)) b!974983))

(assert (= (and b!974984 ((_ is ValueCellFull!10706) mapDefault!35572)) b!974981))

(assert (= start!83466 b!974984))

(declare-fun m!901763 () Bool)

(assert (=> b!974980 m!901763))

(assert (=> b!974980 m!901763))

(declare-fun m!901765 () Bool)

(assert (=> b!974980 m!901765))

(declare-fun m!901767 () Bool)

(assert (=> b!974986 m!901767))

(declare-fun m!901769 () Bool)

(assert (=> b!974978 m!901769))

(declare-fun m!901771 () Bool)

(assert (=> start!83466 m!901771))

(declare-fun m!901773 () Bool)

(assert (=> start!83466 m!901773))

(declare-fun m!901775 () Bool)

(assert (=> start!83466 m!901775))

(declare-fun m!901777 () Bool)

(assert (=> mapNonEmpty!35572 m!901777))

(declare-fun m!901779 () Bool)

(assert (=> b!974979 m!901779))

(declare-fun m!901781 () Bool)

(assert (=> b!974987 m!901781))

(assert (=> b!974987 m!901763))

(assert (=> b!974987 m!901781))

(assert (=> b!974987 m!901763))

(declare-fun m!901783 () Bool)

(assert (=> b!974987 m!901783))

(check-sat (not start!83466) (not b!974979) (not b!974986) b_and!31047 tp_is_empty!22375 (not b!974980) (not b!974987) (not b!974978) (not b_next!19471) (not mapNonEmpty!35572))
(check-sat b_and!31047 (not b_next!19471))
