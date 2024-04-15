; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82328 () Bool)

(assert start!82328)

(declare-fun b_free!18613 () Bool)

(declare-fun b_next!18613 () Bool)

(assert (=> start!82328 (= b_free!18613 (not b_next!18613))))

(declare-fun tp!64809 () Bool)

(declare-fun b_and!30075 () Bool)

(assert (=> start!82328 (= tp!64809 b_and!30075)))

(declare-fun b!959859 () Bool)

(declare-fun e!541063 () Bool)

(declare-fun e!541067 () Bool)

(declare-fun mapRes!33967 () Bool)

(assert (=> b!959859 (= e!541063 (and e!541067 mapRes!33967))))

(declare-fun condMapEmpty!33967 () Bool)

(declare-datatypes ((V!33417 0))(
  ( (V!33418 (val!10713 Int)) )
))
(declare-datatypes ((ValueCell!10181 0))(
  ( (ValueCellFull!10181 (v!13269 V!33417)) (EmptyCell!10181) )
))
(declare-datatypes ((array!58678 0))(
  ( (array!58679 (arr!28213 (Array (_ BitVec 32) ValueCell!10181)) (size!28694 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58678)

(declare-fun mapDefault!33967 () ValueCell!10181)

(assert (=> b!959859 (= condMapEmpty!33967 (= (arr!28213 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10181)) mapDefault!33967)))))

(declare-fun mapNonEmpty!33967 () Bool)

(declare-fun tp!64810 () Bool)

(declare-fun e!541064 () Bool)

(assert (=> mapNonEmpty!33967 (= mapRes!33967 (and tp!64810 e!541064))))

(declare-fun mapKey!33967 () (_ BitVec 32))

(declare-fun mapValue!33967 () ValueCell!10181)

(declare-fun mapRest!33967 () (Array (_ BitVec 32) ValueCell!10181))

(assert (=> mapNonEmpty!33967 (= (arr!28213 _values!1386) (store mapRest!33967 mapKey!33967 mapValue!33967))))

(declare-fun mapIsEmpty!33967 () Bool)

(assert (=> mapIsEmpty!33967 mapRes!33967))

(declare-fun b!959860 () Bool)

(declare-fun res!642562 () Bool)

(declare-fun e!541066 () Bool)

(assert (=> b!959860 (=> (not res!642562) (not e!541066))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((array!58680 0))(
  ( (array!58681 (arr!28214 (Array (_ BitVec 32) (_ BitVec 64))) (size!28695 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58680)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!959860 (= res!642562 (and (= (size!28694 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28695 _keys!1668) (size!28694 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959861 () Bool)

(declare-fun res!642564 () Bool)

(assert (=> b!959861 (=> (not res!642564) (not e!541066))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959861 (= res!642564 (validKeyInArray!0 (select (arr!28214 _keys!1668) i!793)))))

(declare-fun b!959862 () Bool)

(declare-fun tp_is_empty!21325 () Bool)

(assert (=> b!959862 (= e!541064 tp_is_empty!21325)))

(declare-fun res!642563 () Bool)

(assert (=> start!82328 (=> (not res!642563) (not e!541066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82328 (= res!642563 (validMask!0 mask!2088))))

(assert (=> start!82328 e!541066))

(assert (=> start!82328 true))

(assert (=> start!82328 tp_is_empty!21325))

(declare-fun array_inv!21927 (array!58680) Bool)

(assert (=> start!82328 (array_inv!21927 _keys!1668)))

(declare-fun array_inv!21928 (array!58678) Bool)

(assert (=> start!82328 (and (array_inv!21928 _values!1386) e!541063)))

(assert (=> start!82328 tp!64809))

(declare-fun b!959863 () Bool)

(assert (=> b!959863 (= e!541066 false)))

(declare-fun minValue!1328 () V!33417)

(declare-fun lt!430375 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33417)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13872 0))(
  ( (tuple2!13873 (_1!6947 (_ BitVec 64)) (_2!6947 V!33417)) )
))
(declare-datatypes ((List!19655 0))(
  ( (Nil!19652) (Cons!19651 (h!20813 tuple2!13872) (t!28009 List!19655)) )
))
(declare-datatypes ((ListLongMap!12559 0))(
  ( (ListLongMap!12560 (toList!6295 List!19655)) )
))
(declare-fun contains!5338 (ListLongMap!12559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3457 (array!58680 array!58678 (_ BitVec 32) (_ BitVec 32) V!33417 V!33417 (_ BitVec 32) Int) ListLongMap!12559)

(assert (=> b!959863 (= lt!430375 (contains!5338 (getCurrentListMap!3457 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28214 _keys!1668) i!793)))))

(declare-fun b!959864 () Bool)

(declare-fun res!642566 () Bool)

(assert (=> b!959864 (=> (not res!642566) (not e!541066))))

(declare-datatypes ((List!19656 0))(
  ( (Nil!19653) (Cons!19652 (h!20814 (_ BitVec 64)) (t!28010 List!19656)) )
))
(declare-fun arrayNoDuplicates!0 (array!58680 (_ BitVec 32) List!19656) Bool)

(assert (=> b!959864 (= res!642566 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19653))))

(declare-fun b!959865 () Bool)

(declare-fun res!642565 () Bool)

(assert (=> b!959865 (=> (not res!642565) (not e!541066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58680 (_ BitVec 32)) Bool)

(assert (=> b!959865 (= res!642565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959866 () Bool)

(assert (=> b!959866 (= e!541067 tp_is_empty!21325)))

(declare-fun b!959867 () Bool)

(declare-fun res!642567 () Bool)

(assert (=> b!959867 (=> (not res!642567) (not e!541066))))

(assert (=> b!959867 (= res!642567 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28695 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28695 _keys!1668))))))

(assert (= (and start!82328 res!642563) b!959860))

(assert (= (and b!959860 res!642562) b!959865))

(assert (= (and b!959865 res!642565) b!959864))

(assert (= (and b!959864 res!642566) b!959867))

(assert (= (and b!959867 res!642567) b!959861))

(assert (= (and b!959861 res!642564) b!959863))

(assert (= (and b!959859 condMapEmpty!33967) mapIsEmpty!33967))

(assert (= (and b!959859 (not condMapEmpty!33967)) mapNonEmpty!33967))

(get-info :version)

(assert (= (and mapNonEmpty!33967 ((_ is ValueCellFull!10181) mapValue!33967)) b!959862))

(assert (= (and b!959859 ((_ is ValueCellFull!10181) mapDefault!33967)) b!959866))

(assert (= start!82328 b!959859))

(declare-fun m!889671 () Bool)

(assert (=> b!959863 m!889671))

(declare-fun m!889673 () Bool)

(assert (=> b!959863 m!889673))

(assert (=> b!959863 m!889671))

(assert (=> b!959863 m!889673))

(declare-fun m!889675 () Bool)

(assert (=> b!959863 m!889675))

(declare-fun m!889677 () Bool)

(assert (=> b!959864 m!889677))

(declare-fun m!889679 () Bool)

(assert (=> mapNonEmpty!33967 m!889679))

(declare-fun m!889681 () Bool)

(assert (=> start!82328 m!889681))

(declare-fun m!889683 () Bool)

(assert (=> start!82328 m!889683))

(declare-fun m!889685 () Bool)

(assert (=> start!82328 m!889685))

(declare-fun m!889687 () Bool)

(assert (=> b!959865 m!889687))

(assert (=> b!959861 m!889673))

(assert (=> b!959861 m!889673))

(declare-fun m!889689 () Bool)

(assert (=> b!959861 m!889689))

(check-sat tp_is_empty!21325 (not b!959863) (not b!959861) (not b!959865) (not b!959864) (not b_next!18613) (not start!82328) b_and!30075 (not mapNonEmpty!33967))
(check-sat b_and!30075 (not b_next!18613))
