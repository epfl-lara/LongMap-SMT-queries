; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83622 () Bool)

(assert start!83622)

(declare-fun b_free!19441 () Bool)

(declare-fun b_next!19441 () Bool)

(assert (=> start!83622 (= b_free!19441 (not b_next!19441))))

(declare-fun tp!67612 () Bool)

(declare-fun b_and!31053 () Bool)

(assert (=> start!83622 (= tp!67612 b_and!31053)))

(declare-fun b!975670 () Bool)

(declare-fun res!652859 () Bool)

(declare-fun e!549994 () Bool)

(assert (=> b!975670 (=> (not res!652859) (not e!549994))))

(declare-datatypes ((array!60758 0))(
  ( (array!60759 (arr!29238 (Array (_ BitVec 32) (_ BitVec 64))) (size!29718 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60758)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975670 (= res!652859 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29718 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29718 _keys!1717))))))

(declare-fun b!975671 () Bool)

(declare-fun res!652854 () Bool)

(assert (=> b!975671 (=> (not res!652854) (not e!549994))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60758 (_ BitVec 32)) Bool)

(assert (=> b!975671 (= res!652854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975672 () Bool)

(assert (=> b!975672 (= e!549994 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29718 _keys!1717)))))

(declare-datatypes ((V!34777 0))(
  ( (V!34778 (val!11223 Int)) )
))
(declare-datatypes ((ValueCell!10691 0))(
  ( (ValueCellFull!10691 (v!13779 V!34777)) (EmptyCell!10691) )
))
(declare-datatypes ((array!60760 0))(
  ( (array!60761 (arr!29239 (Array (_ BitVec 32) ValueCell!10691)) (size!29719 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60760)

(declare-fun zeroValue!1367 () V!34777)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34777)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14430 0))(
  ( (tuple2!14431 (_1!7226 (_ BitVec 64)) (_2!7226 V!34777)) )
))
(declare-datatypes ((List!20278 0))(
  ( (Nil!20275) (Cons!20274 (h!21442 tuple2!14430) (t!28747 List!20278)) )
))
(declare-datatypes ((ListLongMap!13129 0))(
  ( (ListLongMap!13130 (toList!6580 List!20278)) )
))
(declare-fun lt!433158 () ListLongMap!13129)

(declare-fun getCurrentListMap!3813 (array!60758 array!60760 (_ BitVec 32) (_ BitVec 32) V!34777 V!34777 (_ BitVec 32) Int) ListLongMap!13129)

(assert (=> b!975672 (= lt!433158 (getCurrentListMap!3813 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975673 () Bool)

(declare-fun e!549993 () Bool)

(declare-fun e!549996 () Bool)

(declare-fun mapRes!35527 () Bool)

(assert (=> b!975673 (= e!549993 (and e!549996 mapRes!35527))))

(declare-fun condMapEmpty!35527 () Bool)

(declare-fun mapDefault!35527 () ValueCell!10691)

(assert (=> b!975673 (= condMapEmpty!35527 (= (arr!29239 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10691)) mapDefault!35527)))))

(declare-fun b!975674 () Bool)

(declare-fun res!652853 () Bool)

(assert (=> b!975674 (=> (not res!652853) (not e!549994))))

(declare-datatypes ((List!20279 0))(
  ( (Nil!20276) (Cons!20275 (h!21443 (_ BitVec 64)) (t!28748 List!20279)) )
))
(declare-fun arrayNoDuplicates!0 (array!60758 (_ BitVec 32) List!20279) Bool)

(assert (=> b!975674 (= res!652853 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20276))))

(declare-fun b!975675 () Bool)

(declare-fun res!652856 () Bool)

(assert (=> b!975675 (=> (not res!652856) (not e!549994))))

(declare-fun contains!5683 (ListLongMap!13129 (_ BitVec 64)) Bool)

(assert (=> b!975675 (= res!652856 (contains!5683 (getCurrentListMap!3813 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29238 _keys!1717) i!822)))))

(declare-fun b!975676 () Bool)

(declare-fun tp_is_empty!22345 () Bool)

(assert (=> b!975676 (= e!549996 tp_is_empty!22345)))

(declare-fun b!975677 () Bool)

(declare-fun e!549995 () Bool)

(assert (=> b!975677 (= e!549995 tp_is_empty!22345)))

(declare-fun b!975678 () Bool)

(declare-fun res!652857 () Bool)

(assert (=> b!975678 (=> (not res!652857) (not e!549994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975678 (= res!652857 (validKeyInArray!0 (select (arr!29238 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35527 () Bool)

(declare-fun tp!67611 () Bool)

(assert (=> mapNonEmpty!35527 (= mapRes!35527 (and tp!67611 e!549995))))

(declare-fun mapRest!35527 () (Array (_ BitVec 32) ValueCell!10691))

(declare-fun mapValue!35527 () ValueCell!10691)

(declare-fun mapKey!35527 () (_ BitVec 32))

(assert (=> mapNonEmpty!35527 (= (arr!29239 _values!1425) (store mapRest!35527 mapKey!35527 mapValue!35527))))

(declare-fun b!975679 () Bool)

(declare-fun res!652858 () Bool)

(assert (=> b!975679 (=> (not res!652858) (not e!549994))))

(assert (=> b!975679 (= res!652858 (and (= (size!29719 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29718 _keys!1717) (size!29719 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35527 () Bool)

(assert (=> mapIsEmpty!35527 mapRes!35527))

(declare-fun res!652855 () Bool)

(assert (=> start!83622 (=> (not res!652855) (not e!549994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83622 (= res!652855 (validMask!0 mask!2147))))

(assert (=> start!83622 e!549994))

(assert (=> start!83622 true))

(declare-fun array_inv!22663 (array!60760) Bool)

(assert (=> start!83622 (and (array_inv!22663 _values!1425) e!549993)))

(assert (=> start!83622 tp_is_empty!22345))

(assert (=> start!83622 tp!67612))

(declare-fun array_inv!22664 (array!60758) Bool)

(assert (=> start!83622 (array_inv!22664 _keys!1717)))

(assert (= (and start!83622 res!652855) b!975679))

(assert (= (and b!975679 res!652858) b!975671))

(assert (= (and b!975671 res!652854) b!975674))

(assert (= (and b!975674 res!652853) b!975670))

(assert (= (and b!975670 res!652859) b!975678))

(assert (= (and b!975678 res!652857) b!975675))

(assert (= (and b!975675 res!652856) b!975672))

(assert (= (and b!975673 condMapEmpty!35527) mapIsEmpty!35527))

(assert (= (and b!975673 (not condMapEmpty!35527)) mapNonEmpty!35527))

(get-info :version)

(assert (= (and mapNonEmpty!35527 ((_ is ValueCellFull!10691) mapValue!35527)) b!975677))

(assert (= (and b!975673 ((_ is ValueCellFull!10691) mapDefault!35527)) b!975676))

(assert (= start!83622 b!975673))

(declare-fun m!903485 () Bool)

(assert (=> b!975678 m!903485))

(assert (=> b!975678 m!903485))

(declare-fun m!903487 () Bool)

(assert (=> b!975678 m!903487))

(declare-fun m!903489 () Bool)

(assert (=> b!975671 m!903489))

(declare-fun m!903491 () Bool)

(assert (=> b!975672 m!903491))

(declare-fun m!903493 () Bool)

(assert (=> b!975675 m!903493))

(assert (=> b!975675 m!903485))

(assert (=> b!975675 m!903493))

(assert (=> b!975675 m!903485))

(declare-fun m!903495 () Bool)

(assert (=> b!975675 m!903495))

(declare-fun m!903497 () Bool)

(assert (=> start!83622 m!903497))

(declare-fun m!903499 () Bool)

(assert (=> start!83622 m!903499))

(declare-fun m!903501 () Bool)

(assert (=> start!83622 m!903501))

(declare-fun m!903503 () Bool)

(assert (=> b!975674 m!903503))

(declare-fun m!903505 () Bool)

(assert (=> mapNonEmpty!35527 m!903505))

(check-sat (not b!975674) tp_is_empty!22345 b_and!31053 (not b!975672) (not b!975675) (not b!975671) (not b_next!19441) (not b!975678) (not mapNonEmpty!35527) (not start!83622))
(check-sat b_and!31053 (not b_next!19441))
