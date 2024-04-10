; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82390 () Bool)

(assert start!82390)

(declare-fun b_free!18657 () Bool)

(declare-fun b_next!18657 () Bool)

(assert (=> start!82390 (= b_free!18657 (not b_next!18657))))

(declare-fun tp!64941 () Bool)

(declare-fun b_and!30145 () Bool)

(assert (=> start!82390 (= tp!64941 b_and!30145)))

(declare-fun b!960692 () Bool)

(declare-fun res!643071 () Bool)

(declare-fun e!541542 () Bool)

(assert (=> b!960692 (=> (not res!643071) (not e!541542))))

(declare-datatypes ((array!58827 0))(
  ( (array!58828 (arr!28287 (Array (_ BitVec 32) (_ BitVec 64))) (size!28766 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58827)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960692 (= res!643071 (validKeyInArray!0 (select (arr!28287 _keys!1668) i!793)))))

(declare-fun b!960693 () Bool)

(declare-fun e!541543 () Bool)

(declare-fun e!541541 () Bool)

(declare-fun mapRes!34033 () Bool)

(assert (=> b!960693 (= e!541543 (and e!541541 mapRes!34033))))

(declare-fun condMapEmpty!34033 () Bool)

(declare-datatypes ((V!33475 0))(
  ( (V!33476 (val!10735 Int)) )
))
(declare-datatypes ((ValueCell!10203 0))(
  ( (ValueCellFull!10203 (v!13292 V!33475)) (EmptyCell!10203) )
))
(declare-datatypes ((array!58829 0))(
  ( (array!58830 (arr!28288 (Array (_ BitVec 32) ValueCell!10203)) (size!28767 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58829)

(declare-fun mapDefault!34033 () ValueCell!10203)

(assert (=> b!960693 (= condMapEmpty!34033 (= (arr!28288 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10203)) mapDefault!34033)))))

(declare-fun b!960694 () Bool)

(declare-fun e!541544 () Bool)

(declare-fun tp_is_empty!21369 () Bool)

(assert (=> b!960694 (= e!541544 tp_is_empty!21369)))

(declare-fun b!960695 () Bool)

(declare-fun res!643072 () Bool)

(assert (=> b!960695 (=> (not res!643072) (not e!541542))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58827 (_ BitVec 32)) Bool)

(assert (=> b!960695 (= res!643072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960696 () Bool)

(declare-fun res!643070 () Bool)

(assert (=> b!960696 (=> (not res!643070) (not e!541542))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960696 (= res!643070 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28766 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28766 _keys!1668))))))

(declare-fun res!643073 () Bool)

(assert (=> start!82390 (=> (not res!643073) (not e!541542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82390 (= res!643073 (validMask!0 mask!2088))))

(assert (=> start!82390 e!541542))

(assert (=> start!82390 true))

(assert (=> start!82390 tp_is_empty!21369))

(declare-fun array_inv!21919 (array!58827) Bool)

(assert (=> start!82390 (array_inv!21919 _keys!1668)))

(declare-fun array_inv!21920 (array!58829) Bool)

(assert (=> start!82390 (and (array_inv!21920 _values!1386) e!541543)))

(assert (=> start!82390 tp!64941))

(declare-fun mapIsEmpty!34033 () Bool)

(assert (=> mapIsEmpty!34033 mapRes!34033))

(declare-fun b!960697 () Bool)

(assert (=> b!960697 (= e!541542 false)))

(declare-fun minValue!1328 () V!33475)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33475)

(declare-fun lt!430677 () Bool)

(declare-datatypes ((tuple2!13848 0))(
  ( (tuple2!13849 (_1!6935 (_ BitVec 64)) (_2!6935 V!33475)) )
))
(declare-datatypes ((List!19670 0))(
  ( (Nil!19667) (Cons!19666 (h!20828 tuple2!13848) (t!28033 List!19670)) )
))
(declare-datatypes ((ListLongMap!12545 0))(
  ( (ListLongMap!12546 (toList!6288 List!19670)) )
))
(declare-fun contains!5387 (ListLongMap!12545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3521 (array!58827 array!58829 (_ BitVec 32) (_ BitVec 32) V!33475 V!33475 (_ BitVec 32) Int) ListLongMap!12545)

(assert (=> b!960697 (= lt!430677 (contains!5387 (getCurrentListMap!3521 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28287 _keys!1668) i!793)))))

(declare-fun b!960698 () Bool)

(assert (=> b!960698 (= e!541541 tp_is_empty!21369)))

(declare-fun b!960699 () Bool)

(declare-fun res!643068 () Bool)

(assert (=> b!960699 (=> (not res!643068) (not e!541542))))

(declare-datatypes ((List!19671 0))(
  ( (Nil!19668) (Cons!19667 (h!20829 (_ BitVec 64)) (t!28034 List!19671)) )
))
(declare-fun arrayNoDuplicates!0 (array!58827 (_ BitVec 32) List!19671) Bool)

(assert (=> b!960699 (= res!643068 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19668))))

(declare-fun b!960700 () Bool)

(declare-fun res!643069 () Bool)

(assert (=> b!960700 (=> (not res!643069) (not e!541542))))

(assert (=> b!960700 (= res!643069 (and (= (size!28767 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28766 _keys!1668) (size!28767 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34033 () Bool)

(declare-fun tp!64940 () Bool)

(assert (=> mapNonEmpty!34033 (= mapRes!34033 (and tp!64940 e!541544))))

(declare-fun mapKey!34033 () (_ BitVec 32))

(declare-fun mapRest!34033 () (Array (_ BitVec 32) ValueCell!10203))

(declare-fun mapValue!34033 () ValueCell!10203)

(assert (=> mapNonEmpty!34033 (= (arr!28288 _values!1386) (store mapRest!34033 mapKey!34033 mapValue!34033))))

(assert (= (and start!82390 res!643073) b!960700))

(assert (= (and b!960700 res!643069) b!960695))

(assert (= (and b!960695 res!643072) b!960699))

(assert (= (and b!960699 res!643068) b!960696))

(assert (= (and b!960696 res!643070) b!960692))

(assert (= (and b!960692 res!643071) b!960697))

(assert (= (and b!960693 condMapEmpty!34033) mapIsEmpty!34033))

(assert (= (and b!960693 (not condMapEmpty!34033)) mapNonEmpty!34033))

(get-info :version)

(assert (= (and mapNonEmpty!34033 ((_ is ValueCellFull!10203) mapValue!34033)) b!960694))

(assert (= (and b!960693 ((_ is ValueCellFull!10203) mapDefault!34033)) b!960698))

(assert (= start!82390 b!960693))

(declare-fun m!890869 () Bool)

(assert (=> b!960695 m!890869))

(declare-fun m!890871 () Bool)

(assert (=> b!960692 m!890871))

(assert (=> b!960692 m!890871))

(declare-fun m!890873 () Bool)

(assert (=> b!960692 m!890873))

(declare-fun m!890875 () Bool)

(assert (=> b!960697 m!890875))

(assert (=> b!960697 m!890871))

(assert (=> b!960697 m!890875))

(assert (=> b!960697 m!890871))

(declare-fun m!890877 () Bool)

(assert (=> b!960697 m!890877))

(declare-fun m!890879 () Bool)

(assert (=> start!82390 m!890879))

(declare-fun m!890881 () Bool)

(assert (=> start!82390 m!890881))

(declare-fun m!890883 () Bool)

(assert (=> start!82390 m!890883))

(declare-fun m!890885 () Bool)

(assert (=> mapNonEmpty!34033 m!890885))

(declare-fun m!890887 () Bool)

(assert (=> b!960699 m!890887))

(check-sat (not b!960695) (not mapNonEmpty!34033) (not start!82390) (not b!960699) (not b_next!18657) (not b!960697) (not b!960692) tp_is_empty!21369 b_and!30145)
(check-sat b_and!30145 (not b_next!18657))
