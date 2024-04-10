; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82384 () Bool)

(assert start!82384)

(declare-fun b_free!18651 () Bool)

(declare-fun b_next!18651 () Bool)

(assert (=> start!82384 (= b_free!18651 (not b_next!18651))))

(declare-fun tp!64923 () Bool)

(declare-fun b_and!30139 () Bool)

(assert (=> start!82384 (= tp!64923 b_and!30139)))

(declare-fun b!960611 () Bool)

(declare-fun e!541499 () Bool)

(declare-fun tp_is_empty!21363 () Bool)

(assert (=> b!960611 (= e!541499 tp_is_empty!21363)))

(declare-fun b!960612 () Bool)

(declare-fun e!541500 () Bool)

(declare-fun mapRes!34024 () Bool)

(assert (=> b!960612 (= e!541500 (and e!541499 mapRes!34024))))

(declare-fun condMapEmpty!34024 () Bool)

(declare-datatypes ((V!33467 0))(
  ( (V!33468 (val!10732 Int)) )
))
(declare-datatypes ((ValueCell!10200 0))(
  ( (ValueCellFull!10200 (v!13289 V!33467)) (EmptyCell!10200) )
))
(declare-datatypes ((array!58815 0))(
  ( (array!58816 (arr!28281 (Array (_ BitVec 32) ValueCell!10200)) (size!28760 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58815)

(declare-fun mapDefault!34024 () ValueCell!10200)

(assert (=> b!960612 (= condMapEmpty!34024 (= (arr!28281 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10200)) mapDefault!34024)))))

(declare-fun b!960613 () Bool)

(declare-fun res!643016 () Bool)

(declare-fun e!541497 () Bool)

(assert (=> b!960613 (=> (not res!643016) (not e!541497))))

(declare-datatypes ((array!58817 0))(
  ( (array!58818 (arr!28282 (Array (_ BitVec 32) (_ BitVec 64))) (size!28761 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58817)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58817 (_ BitVec 32)) Bool)

(assert (=> b!960613 (= res!643016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960614 () Bool)

(declare-fun res!643018 () Bool)

(assert (=> b!960614 (=> (not res!643018) (not e!541497))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960614 (= res!643018 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28761 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28761 _keys!1668))))))

(declare-fun mapIsEmpty!34024 () Bool)

(assert (=> mapIsEmpty!34024 mapRes!34024))

(declare-fun b!960616 () Bool)

(assert (=> b!960616 (= e!541497 false)))

(declare-fun lt!430668 () Bool)

(declare-fun minValue!1328 () V!33467)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33467)

(declare-datatypes ((tuple2!13842 0))(
  ( (tuple2!13843 (_1!6932 (_ BitVec 64)) (_2!6932 V!33467)) )
))
(declare-datatypes ((List!19664 0))(
  ( (Nil!19661) (Cons!19660 (h!20822 tuple2!13842) (t!28027 List!19664)) )
))
(declare-datatypes ((ListLongMap!12539 0))(
  ( (ListLongMap!12540 (toList!6285 List!19664)) )
))
(declare-fun contains!5384 (ListLongMap!12539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3518 (array!58817 array!58815 (_ BitVec 32) (_ BitVec 32) V!33467 V!33467 (_ BitVec 32) Int) ListLongMap!12539)

(assert (=> b!960616 (= lt!430668 (contains!5384 (getCurrentListMap!3518 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28282 _keys!1668) i!793)))))

(declare-fun b!960617 () Bool)

(declare-fun e!541496 () Bool)

(assert (=> b!960617 (= e!541496 tp_is_empty!21363)))

(declare-fun mapNonEmpty!34024 () Bool)

(declare-fun tp!64922 () Bool)

(assert (=> mapNonEmpty!34024 (= mapRes!34024 (and tp!64922 e!541496))))

(declare-fun mapKey!34024 () (_ BitVec 32))

(declare-fun mapValue!34024 () ValueCell!10200)

(declare-fun mapRest!34024 () (Array (_ BitVec 32) ValueCell!10200))

(assert (=> mapNonEmpty!34024 (= (arr!28281 _values!1386) (store mapRest!34024 mapKey!34024 mapValue!34024))))

(declare-fun b!960618 () Bool)

(declare-fun res!643017 () Bool)

(assert (=> b!960618 (=> (not res!643017) (not e!541497))))

(declare-datatypes ((List!19665 0))(
  ( (Nil!19662) (Cons!19661 (h!20823 (_ BitVec 64)) (t!28028 List!19665)) )
))
(declare-fun arrayNoDuplicates!0 (array!58817 (_ BitVec 32) List!19665) Bool)

(assert (=> b!960618 (= res!643017 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19662))))

(declare-fun b!960619 () Bool)

(declare-fun res!643014 () Bool)

(assert (=> b!960619 (=> (not res!643014) (not e!541497))))

(assert (=> b!960619 (= res!643014 (and (= (size!28760 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28761 _keys!1668) (size!28760 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960615 () Bool)

(declare-fun res!643019 () Bool)

(assert (=> b!960615 (=> (not res!643019) (not e!541497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960615 (= res!643019 (validKeyInArray!0 (select (arr!28282 _keys!1668) i!793)))))

(declare-fun res!643015 () Bool)

(assert (=> start!82384 (=> (not res!643015) (not e!541497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82384 (= res!643015 (validMask!0 mask!2088))))

(assert (=> start!82384 e!541497))

(assert (=> start!82384 true))

(assert (=> start!82384 tp_is_empty!21363))

(declare-fun array_inv!21915 (array!58817) Bool)

(assert (=> start!82384 (array_inv!21915 _keys!1668)))

(declare-fun array_inv!21916 (array!58815) Bool)

(assert (=> start!82384 (and (array_inv!21916 _values!1386) e!541500)))

(assert (=> start!82384 tp!64923))

(assert (= (and start!82384 res!643015) b!960619))

(assert (= (and b!960619 res!643014) b!960613))

(assert (= (and b!960613 res!643016) b!960618))

(assert (= (and b!960618 res!643017) b!960614))

(assert (= (and b!960614 res!643018) b!960615))

(assert (= (and b!960615 res!643019) b!960616))

(assert (= (and b!960612 condMapEmpty!34024) mapIsEmpty!34024))

(assert (= (and b!960612 (not condMapEmpty!34024)) mapNonEmpty!34024))

(get-info :version)

(assert (= (and mapNonEmpty!34024 ((_ is ValueCellFull!10200) mapValue!34024)) b!960617))

(assert (= (and b!960612 ((_ is ValueCellFull!10200) mapDefault!34024)) b!960611))

(assert (= start!82384 b!960612))

(declare-fun m!890809 () Bool)

(assert (=> mapNonEmpty!34024 m!890809))

(declare-fun m!890811 () Bool)

(assert (=> start!82384 m!890811))

(declare-fun m!890813 () Bool)

(assert (=> start!82384 m!890813))

(declare-fun m!890815 () Bool)

(assert (=> start!82384 m!890815))

(declare-fun m!890817 () Bool)

(assert (=> b!960618 m!890817))

(declare-fun m!890819 () Bool)

(assert (=> b!960616 m!890819))

(declare-fun m!890821 () Bool)

(assert (=> b!960616 m!890821))

(assert (=> b!960616 m!890819))

(assert (=> b!960616 m!890821))

(declare-fun m!890823 () Bool)

(assert (=> b!960616 m!890823))

(assert (=> b!960615 m!890821))

(assert (=> b!960615 m!890821))

(declare-fun m!890825 () Bool)

(assert (=> b!960615 m!890825))

(declare-fun m!890827 () Bool)

(assert (=> b!960613 m!890827))

(check-sat tp_is_empty!21363 b_and!30139 (not b!960618) (not b!960616) (not b!960613) (not b_next!18651) (not b!960615) (not mapNonEmpty!34024) (not start!82384))
(check-sat b_and!30139 (not b_next!18651))
