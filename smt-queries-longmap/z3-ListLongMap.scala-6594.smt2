; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83616 () Bool)

(assert start!83616)

(declare-fun b_free!19435 () Bool)

(declare-fun b_next!19435 () Bool)

(assert (=> start!83616 (= b_free!19435 (not b_next!19435))))

(declare-fun tp!67594 () Bool)

(declare-fun b_and!31047 () Bool)

(assert (=> start!83616 (= tp!67594 b_and!31047)))

(declare-fun b!975587 () Bool)

(declare-fun res!652801 () Bool)

(declare-fun e!549948 () Bool)

(assert (=> b!975587 (=> (not res!652801) (not e!549948))))

(declare-datatypes ((array!60746 0))(
  ( (array!60747 (arr!29232 (Array (_ BitVec 32) (_ BitVec 64))) (size!29712 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60746)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975587 (= res!652801 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29712 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29712 _keys!1717))))))

(declare-fun b!975588 () Bool)

(declare-fun res!652797 () Bool)

(assert (=> b!975588 (=> (not res!652797) (not e!549948))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60746 (_ BitVec 32)) Bool)

(assert (=> b!975588 (= res!652797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975589 () Bool)

(declare-fun res!652798 () Bool)

(assert (=> b!975589 (=> (not res!652798) (not e!549948))))

(declare-datatypes ((List!20273 0))(
  ( (Nil!20270) (Cons!20269 (h!21437 (_ BitVec 64)) (t!28742 List!20273)) )
))
(declare-fun arrayNoDuplicates!0 (array!60746 (_ BitVec 32) List!20273) Bool)

(assert (=> b!975589 (= res!652798 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20270))))

(declare-fun mapIsEmpty!35518 () Bool)

(declare-fun mapRes!35518 () Bool)

(assert (=> mapIsEmpty!35518 mapRes!35518))

(declare-fun mapNonEmpty!35518 () Bool)

(declare-fun tp!67593 () Bool)

(declare-fun e!549951 () Bool)

(assert (=> mapNonEmpty!35518 (= mapRes!35518 (and tp!67593 e!549951))))

(declare-fun mapKey!35518 () (_ BitVec 32))

(declare-datatypes ((V!34769 0))(
  ( (V!34770 (val!11220 Int)) )
))
(declare-datatypes ((ValueCell!10688 0))(
  ( (ValueCellFull!10688 (v!13776 V!34769)) (EmptyCell!10688) )
))
(declare-fun mapRest!35518 () (Array (_ BitVec 32) ValueCell!10688))

(declare-datatypes ((array!60748 0))(
  ( (array!60749 (arr!29233 (Array (_ BitVec 32) ValueCell!10688)) (size!29713 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60748)

(declare-fun mapValue!35518 () ValueCell!10688)

(assert (=> mapNonEmpty!35518 (= (arr!29233 _values!1425) (store mapRest!35518 mapKey!35518 mapValue!35518))))

(declare-fun b!975591 () Bool)

(declare-fun res!652799 () Bool)

(assert (=> b!975591 (=> (not res!652799) (not e!549948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975591 (= res!652799 (validKeyInArray!0 (select (arr!29232 _keys!1717) i!822)))))

(declare-fun b!975590 () Bool)

(assert (=> b!975590 (= e!549948 (bvslt i!822 #b00000000000000000000000000000000))))

(declare-fun zeroValue!1367 () V!34769)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14426 0))(
  ( (tuple2!14427 (_1!7224 (_ BitVec 64)) (_2!7224 V!34769)) )
))
(declare-datatypes ((List!20274 0))(
  ( (Nil!20271) (Cons!20270 (h!21438 tuple2!14426) (t!28743 List!20274)) )
))
(declare-datatypes ((ListLongMap!13125 0))(
  ( (ListLongMap!13126 (toList!6578 List!20274)) )
))
(declare-fun lt!433149 () ListLongMap!13125)

(declare-fun minValue!1367 () V!34769)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3811 (array!60746 array!60748 (_ BitVec 32) (_ BitVec 32) V!34769 V!34769 (_ BitVec 32) Int) ListLongMap!13125)

(assert (=> b!975590 (= lt!433149 (getCurrentListMap!3811 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun res!652802 () Bool)

(assert (=> start!83616 (=> (not res!652802) (not e!549948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83616 (= res!652802 (validMask!0 mask!2147))))

(assert (=> start!83616 e!549948))

(assert (=> start!83616 true))

(declare-fun e!549949 () Bool)

(declare-fun array_inv!22659 (array!60748) Bool)

(assert (=> start!83616 (and (array_inv!22659 _values!1425) e!549949)))

(declare-fun tp_is_empty!22339 () Bool)

(assert (=> start!83616 tp_is_empty!22339))

(assert (=> start!83616 tp!67594))

(declare-fun array_inv!22660 (array!60746) Bool)

(assert (=> start!83616 (array_inv!22660 _keys!1717)))

(declare-fun b!975592 () Bool)

(declare-fun e!549950 () Bool)

(assert (=> b!975592 (= e!549950 tp_is_empty!22339)))

(declare-fun b!975593 () Bool)

(assert (=> b!975593 (= e!549949 (and e!549950 mapRes!35518))))

(declare-fun condMapEmpty!35518 () Bool)

(declare-fun mapDefault!35518 () ValueCell!10688)

(assert (=> b!975593 (= condMapEmpty!35518 (= (arr!29233 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10688)) mapDefault!35518)))))

(declare-fun b!975594 () Bool)

(declare-fun res!652800 () Bool)

(assert (=> b!975594 (=> (not res!652800) (not e!549948))))

(assert (=> b!975594 (= res!652800 (and (= (size!29713 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29712 _keys!1717) (size!29713 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975595 () Bool)

(assert (=> b!975595 (= e!549951 tp_is_empty!22339)))

(assert (= (and start!83616 res!652802) b!975594))

(assert (= (and b!975594 res!652800) b!975588))

(assert (= (and b!975588 res!652797) b!975589))

(assert (= (and b!975589 res!652798) b!975587))

(assert (= (and b!975587 res!652801) b!975591))

(assert (= (and b!975591 res!652799) b!975590))

(assert (= (and b!975593 condMapEmpty!35518) mapIsEmpty!35518))

(assert (= (and b!975593 (not condMapEmpty!35518)) mapNonEmpty!35518))

(get-info :version)

(assert (= (and mapNonEmpty!35518 ((_ is ValueCellFull!10688) mapValue!35518)) b!975595))

(assert (= (and b!975593 ((_ is ValueCellFull!10688) mapDefault!35518)) b!975592))

(assert (= start!83616 b!975593))

(declare-fun m!903431 () Bool)

(assert (=> mapNonEmpty!35518 m!903431))

(declare-fun m!903433 () Bool)

(assert (=> start!83616 m!903433))

(declare-fun m!903435 () Bool)

(assert (=> start!83616 m!903435))

(declare-fun m!903437 () Bool)

(assert (=> start!83616 m!903437))

(declare-fun m!903439 () Bool)

(assert (=> b!975589 m!903439))

(declare-fun m!903441 () Bool)

(assert (=> b!975590 m!903441))

(declare-fun m!903443 () Bool)

(assert (=> b!975591 m!903443))

(assert (=> b!975591 m!903443))

(declare-fun m!903445 () Bool)

(assert (=> b!975591 m!903445))

(declare-fun m!903447 () Bool)

(assert (=> b!975588 m!903447))

(check-sat b_and!31047 (not b_next!19435) (not b!975588) (not mapNonEmpty!35518) tp_is_empty!22339 (not start!83616) (not b!975590) (not b!975591) (not b!975589))
(check-sat b_and!31047 (not b_next!19435))
