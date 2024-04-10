; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83462 () Bool)

(assert start!83462)

(declare-fun b_free!19449 () Bool)

(declare-fun b_next!19449 () Bool)

(assert (=> start!83462 (= b_free!19449 (not b_next!19449))))

(declare-fun tp!67635 () Bool)

(declare-fun b_and!31051 () Bool)

(assert (=> start!83462 (= tp!67635 b_and!31051)))

(declare-fun b!974887 () Bool)

(declare-fun res!652598 () Bool)

(declare-fun e!549471 () Bool)

(assert (=> b!974887 (=> (not res!652598) (not e!549471))))

(declare-datatypes ((array!60741 0))(
  ( (array!60742 (arr!29234 (Array (_ BitVec 32) (_ BitVec 64))) (size!29713 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60741)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974887 (= res!652598 (validKeyInArray!0 (select (arr!29234 _keys!1717) i!822)))))

(declare-fun b!974888 () Bool)

(declare-fun res!652599 () Bool)

(assert (=> b!974888 (=> (not res!652599) (not e!549471))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974888 (= res!652599 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29713 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29713 _keys!1717))))))

(declare-fun b!974889 () Bool)

(declare-fun res!652597 () Bool)

(assert (=> b!974889 (=> (not res!652597) (not e!549471))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34787 0))(
  ( (V!34788 (val!11227 Int)) )
))
(declare-datatypes ((ValueCell!10695 0))(
  ( (ValueCellFull!10695 (v!13786 V!34787)) (EmptyCell!10695) )
))
(declare-datatypes ((array!60743 0))(
  ( (array!60744 (arr!29235 (Array (_ BitVec 32) ValueCell!10695)) (size!29714 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60743)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974889 (= res!652597 (and (= (size!29714 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29713 _keys!1717) (size!29714 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974890 () Bool)

(assert (=> b!974890 (= e!549471 false)))

(declare-datatypes ((tuple2!14430 0))(
  ( (tuple2!14431 (_1!7226 (_ BitVec 64)) (_2!7226 V!34787)) )
))
(declare-datatypes ((List!20284 0))(
  ( (Nil!20281) (Cons!20280 (h!21442 tuple2!14430) (t!28761 List!20284)) )
))
(declare-datatypes ((ListLongMap!13127 0))(
  ( (ListLongMap!13128 (toList!6579 List!20284)) )
))
(declare-fun lt!432809 () ListLongMap!13127)

(declare-fun zeroValue!1367 () V!34787)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34787)

(declare-fun getCurrentListMap!3812 (array!60741 array!60743 (_ BitVec 32) (_ BitVec 32) V!34787 V!34787 (_ BitVec 32) Int) ListLongMap!13127)

(assert (=> b!974890 (= lt!432809 (getCurrentListMap!3812 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974891 () Bool)

(declare-fun e!549473 () Bool)

(declare-fun e!549475 () Bool)

(declare-fun mapRes!35539 () Bool)

(assert (=> b!974891 (= e!549473 (and e!549475 mapRes!35539))))

(declare-fun condMapEmpty!35539 () Bool)

(declare-fun mapDefault!35539 () ValueCell!10695)

(assert (=> b!974891 (= condMapEmpty!35539 (= (arr!29235 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10695)) mapDefault!35539)))))

(declare-fun res!652595 () Bool)

(assert (=> start!83462 (=> (not res!652595) (not e!549471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83462 (= res!652595 (validMask!0 mask!2147))))

(assert (=> start!83462 e!549471))

(assert (=> start!83462 true))

(declare-fun array_inv!22611 (array!60743) Bool)

(assert (=> start!83462 (and (array_inv!22611 _values!1425) e!549473)))

(declare-fun tp_is_empty!22353 () Bool)

(assert (=> start!83462 tp_is_empty!22353))

(assert (=> start!83462 tp!67635))

(declare-fun array_inv!22612 (array!60741) Bool)

(assert (=> start!83462 (array_inv!22612 _keys!1717)))

(declare-fun b!974892 () Bool)

(assert (=> b!974892 (= e!549475 tp_is_empty!22353)))

(declare-fun b!974893 () Bool)

(declare-fun res!652596 () Bool)

(assert (=> b!974893 (=> (not res!652596) (not e!549471))))

(declare-datatypes ((List!20285 0))(
  ( (Nil!20282) (Cons!20281 (h!21443 (_ BitVec 64)) (t!28762 List!20285)) )
))
(declare-fun arrayNoDuplicates!0 (array!60741 (_ BitVec 32) List!20285) Bool)

(assert (=> b!974893 (= res!652596 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20282))))

(declare-fun b!974894 () Bool)

(declare-fun e!549472 () Bool)

(assert (=> b!974894 (= e!549472 tp_is_empty!22353)))

(declare-fun b!974895 () Bool)

(declare-fun res!652594 () Bool)

(assert (=> b!974895 (=> (not res!652594) (not e!549471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60741 (_ BitVec 32)) Bool)

(assert (=> b!974895 (= res!652594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35539 () Bool)

(declare-fun tp!67634 () Bool)

(assert (=> mapNonEmpty!35539 (= mapRes!35539 (and tp!67634 e!549472))))

(declare-fun mapKey!35539 () (_ BitVec 32))

(declare-fun mapRest!35539 () (Array (_ BitVec 32) ValueCell!10695))

(declare-fun mapValue!35539 () ValueCell!10695)

(assert (=> mapNonEmpty!35539 (= (arr!29235 _values!1425) (store mapRest!35539 mapKey!35539 mapValue!35539))))

(declare-fun b!974896 () Bool)

(declare-fun res!652593 () Bool)

(assert (=> b!974896 (=> (not res!652593) (not e!549471))))

(declare-fun contains!5663 (ListLongMap!13127 (_ BitVec 64)) Bool)

(assert (=> b!974896 (= res!652593 (contains!5663 (getCurrentListMap!3812 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29234 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35539 () Bool)

(assert (=> mapIsEmpty!35539 mapRes!35539))

(assert (= (and start!83462 res!652595) b!974889))

(assert (= (and b!974889 res!652597) b!974895))

(assert (= (and b!974895 res!652594) b!974893))

(assert (= (and b!974893 res!652596) b!974888))

(assert (= (and b!974888 res!652599) b!974887))

(assert (= (and b!974887 res!652598) b!974896))

(assert (= (and b!974896 res!652593) b!974890))

(assert (= (and b!974891 condMapEmpty!35539) mapIsEmpty!35539))

(assert (= (and b!974891 (not condMapEmpty!35539)) mapNonEmpty!35539))

(get-info :version)

(assert (= (and mapNonEmpty!35539 ((_ is ValueCellFull!10695) mapValue!35539)) b!974894))

(assert (= (and b!974891 ((_ is ValueCellFull!10695) mapDefault!35539)) b!974892))

(assert (= start!83462 b!974891))

(declare-fun m!902279 () Bool)

(assert (=> b!974890 m!902279))

(declare-fun m!902281 () Bool)

(assert (=> b!974896 m!902281))

(declare-fun m!902283 () Bool)

(assert (=> b!974896 m!902283))

(assert (=> b!974896 m!902281))

(assert (=> b!974896 m!902283))

(declare-fun m!902285 () Bool)

(assert (=> b!974896 m!902285))

(declare-fun m!902287 () Bool)

(assert (=> b!974893 m!902287))

(assert (=> b!974887 m!902283))

(assert (=> b!974887 m!902283))

(declare-fun m!902289 () Bool)

(assert (=> b!974887 m!902289))

(declare-fun m!902291 () Bool)

(assert (=> mapNonEmpty!35539 m!902291))

(declare-fun m!902293 () Bool)

(assert (=> start!83462 m!902293))

(declare-fun m!902295 () Bool)

(assert (=> start!83462 m!902295))

(declare-fun m!902297 () Bool)

(assert (=> start!83462 m!902297))

(declare-fun m!902299 () Bool)

(assert (=> b!974895 m!902299))

(check-sat (not start!83462) (not b!974887) (not b!974893) b_and!31051 tp_is_empty!22353 (not b!974895) (not b!974890) (not b!974896) (not b_next!19449) (not mapNonEmpty!35539))
(check-sat b_and!31051 (not b_next!19449))
