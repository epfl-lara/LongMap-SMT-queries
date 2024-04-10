; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82554 () Bool)

(assert start!82554)

(declare-fun b_free!18687 () Bool)

(declare-fun b_next!18687 () Bool)

(assert (=> start!82554 (= b_free!18687 (not b_next!18687))))

(declare-fun tp!65181 () Bool)

(declare-fun b_and!30175 () Bool)

(assert (=> start!82554 (= tp!65181 b_and!30175)))

(declare-fun b!962060 () Bool)

(declare-fun res!643837 () Bool)

(declare-fun e!542538 () Bool)

(assert (=> b!962060 (=> (not res!643837) (not e!542538))))

(declare-datatypes ((array!59075 0))(
  ( (array!59076 (arr!28406 (Array (_ BitVec 32) (_ BitVec 64))) (size!28885 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59075)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962060 (= res!643837 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28885 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28885 _keys!1686))))))

(declare-fun b!962061 () Bool)

(declare-fun e!542537 () Bool)

(declare-fun e!542539 () Bool)

(declare-fun mapRes!34228 () Bool)

(assert (=> b!962061 (= e!542537 (and e!542539 mapRes!34228))))

(declare-fun condMapEmpty!34228 () Bool)

(declare-datatypes ((V!33635 0))(
  ( (V!33636 (val!10795 Int)) )
))
(declare-datatypes ((ValueCell!10263 0))(
  ( (ValueCellFull!10263 (v!13353 V!33635)) (EmptyCell!10263) )
))
(declare-datatypes ((array!59077 0))(
  ( (array!59078 (arr!28407 (Array (_ BitVec 32) ValueCell!10263)) (size!28886 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59077)

(declare-fun mapDefault!34228 () ValueCell!10263)

(assert (=> b!962061 (= condMapEmpty!34228 (= (arr!28407 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10263)) mapDefault!34228)))))

(declare-fun b!962062 () Bool)

(declare-fun res!643835 () Bool)

(assert (=> b!962062 (=> (not res!643835) (not e!542538))))

(declare-datatypes ((List!19714 0))(
  ( (Nil!19711) (Cons!19710 (h!20872 (_ BitVec 64)) (t!28077 List!19714)) )
))
(declare-fun arrayNoDuplicates!0 (array!59075 (_ BitVec 32) List!19714) Bool)

(assert (=> b!962062 (= res!643835 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19711))))

(declare-fun b!962063 () Bool)

(declare-fun tp_is_empty!21489 () Bool)

(assert (=> b!962063 (= e!542539 tp_is_empty!21489)))

(declare-fun res!643836 () Bool)

(assert (=> start!82554 (=> (not res!643836) (not e!542538))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82554 (= res!643836 (validMask!0 mask!2110))))

(assert (=> start!82554 e!542538))

(assert (=> start!82554 true))

(declare-fun array_inv!22015 (array!59077) Bool)

(assert (=> start!82554 (and (array_inv!22015 _values!1400) e!542537)))

(declare-fun array_inv!22016 (array!59075) Bool)

(assert (=> start!82554 (array_inv!22016 _keys!1686)))

(assert (=> start!82554 tp!65181))

(assert (=> start!82554 tp_is_empty!21489))

(declare-fun b!962064 () Bool)

(declare-fun res!643833 () Bool)

(assert (=> b!962064 (=> (not res!643833) (not e!542538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962064 (= res!643833 (validKeyInArray!0 (select (arr!28406 _keys!1686) i!803)))))

(declare-fun b!962065 () Bool)

(declare-fun res!643834 () Bool)

(assert (=> b!962065 (=> (not res!643834) (not e!542538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59075 (_ BitVec 32)) Bool)

(assert (=> b!962065 (= res!643834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34228 () Bool)

(declare-fun tp!65180 () Bool)

(declare-fun e!542536 () Bool)

(assert (=> mapNonEmpty!34228 (= mapRes!34228 (and tp!65180 e!542536))))

(declare-fun mapValue!34228 () ValueCell!10263)

(declare-fun mapRest!34228 () (Array (_ BitVec 32) ValueCell!10263))

(declare-fun mapKey!34228 () (_ BitVec 32))

(assert (=> mapNonEmpty!34228 (= (arr!28407 _values!1400) (store mapRest!34228 mapKey!34228 mapValue!34228))))

(declare-fun b!962066 () Bool)

(declare-fun res!643832 () Bool)

(assert (=> b!962066 (=> (not res!643832) (not e!542538))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962066 (= res!643832 (and (= (size!28886 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28885 _keys!1686) (size!28886 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962067 () Bool)

(assert (=> b!962067 (= e!542536 tp_is_empty!21489)))

(declare-fun b!962068 () Bool)

(assert (=> b!962068 (= e!542538 false)))

(declare-fun lt!430834 () Bool)

(declare-fun minValue!1342 () V!33635)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33635)

(declare-datatypes ((tuple2!13866 0))(
  ( (tuple2!13867 (_1!6944 (_ BitVec 64)) (_2!6944 V!33635)) )
))
(declare-datatypes ((List!19715 0))(
  ( (Nil!19712) (Cons!19711 (h!20873 tuple2!13866) (t!28078 List!19715)) )
))
(declare-datatypes ((ListLongMap!12563 0))(
  ( (ListLongMap!12564 (toList!6297 List!19715)) )
))
(declare-fun contains!5400 (ListLongMap!12563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3530 (array!59075 array!59077 (_ BitVec 32) (_ BitVec 32) V!33635 V!33635 (_ BitVec 32) Int) ListLongMap!12563)

(assert (=> b!962068 (= lt!430834 (contains!5400 (getCurrentListMap!3530 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28406 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34228 () Bool)

(assert (=> mapIsEmpty!34228 mapRes!34228))

(assert (= (and start!82554 res!643836) b!962066))

(assert (= (and b!962066 res!643832) b!962065))

(assert (= (and b!962065 res!643834) b!962062))

(assert (= (and b!962062 res!643835) b!962060))

(assert (= (and b!962060 res!643837) b!962064))

(assert (= (and b!962064 res!643833) b!962068))

(assert (= (and b!962061 condMapEmpty!34228) mapIsEmpty!34228))

(assert (= (and b!962061 (not condMapEmpty!34228)) mapNonEmpty!34228))

(get-info :version)

(assert (= (and mapNonEmpty!34228 ((_ is ValueCellFull!10263) mapValue!34228)) b!962067))

(assert (= (and b!962061 ((_ is ValueCellFull!10263) mapDefault!34228)) b!962063))

(assert (= start!82554 b!962061))

(declare-fun m!891809 () Bool)

(assert (=> b!962064 m!891809))

(assert (=> b!962064 m!891809))

(declare-fun m!891811 () Bool)

(assert (=> b!962064 m!891811))

(declare-fun m!891813 () Bool)

(assert (=> b!962065 m!891813))

(declare-fun m!891815 () Bool)

(assert (=> b!962062 m!891815))

(declare-fun m!891817 () Bool)

(assert (=> start!82554 m!891817))

(declare-fun m!891819 () Bool)

(assert (=> start!82554 m!891819))

(declare-fun m!891821 () Bool)

(assert (=> start!82554 m!891821))

(declare-fun m!891823 () Bool)

(assert (=> mapNonEmpty!34228 m!891823))

(declare-fun m!891825 () Bool)

(assert (=> b!962068 m!891825))

(assert (=> b!962068 m!891809))

(assert (=> b!962068 m!891825))

(assert (=> b!962068 m!891809))

(declare-fun m!891827 () Bool)

(assert (=> b!962068 m!891827))

(check-sat tp_is_empty!21489 (not b_next!18687) (not start!82554) (not b!962062) (not b!962064) (not b!962068) (not mapNonEmpty!34228) b_and!30175 (not b!962065))
(check-sat b_and!30175 (not b_next!18687))
