; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82606 () Bool)

(assert start!82606)

(declare-fun b_free!18757 () Bool)

(declare-fun b_next!18757 () Bool)

(assert (=> start!82606 (= b_free!18757 (not b_next!18757))))

(declare-fun tp!65392 () Bool)

(declare-fun b_and!30219 () Bool)

(assert (=> start!82606 (= tp!65392 b_and!30219)))

(declare-fun b!962824 () Bool)

(declare-fun res!644413 () Bool)

(declare-fun e!542915 () Bool)

(assert (=> b!962824 (=> (not res!644413) (not e!542915))))

(declare-datatypes ((array!59144 0))(
  ( (array!59145 (arr!28441 (Array (_ BitVec 32) (_ BitVec 64))) (size!28922 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59144)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962824 (= res!644413 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28922 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28922 _keys!1686))))))

(declare-fun mapNonEmpty!34333 () Bool)

(declare-fun mapRes!34333 () Bool)

(declare-fun tp!65391 () Bool)

(declare-fun e!542916 () Bool)

(assert (=> mapNonEmpty!34333 (= mapRes!34333 (and tp!65391 e!542916))))

(declare-datatypes ((V!33729 0))(
  ( (V!33730 (val!10830 Int)) )
))
(declare-datatypes ((ValueCell!10298 0))(
  ( (ValueCellFull!10298 (v!13387 V!33729)) (EmptyCell!10298) )
))
(declare-datatypes ((array!59146 0))(
  ( (array!59147 (arr!28442 (Array (_ BitVec 32) ValueCell!10298)) (size!28923 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59146)

(declare-fun mapValue!34333 () ValueCell!10298)

(declare-fun mapKey!34333 () (_ BitVec 32))

(declare-fun mapRest!34333 () (Array (_ BitVec 32) ValueCell!10298))

(assert (=> mapNonEmpty!34333 (= (arr!28442 _values!1400) (store mapRest!34333 mapKey!34333 mapValue!34333))))

(declare-fun b!962825 () Bool)

(assert (=> b!962825 (= e!542915 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33729)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33729)

(declare-datatypes ((tuple2!13972 0))(
  ( (tuple2!13973 (_1!6997 (_ BitVec 64)) (_2!6997 V!33729)) )
))
(declare-datatypes ((List!19781 0))(
  ( (Nil!19778) (Cons!19777 (h!20939 tuple2!13972) (t!28135 List!19781)) )
))
(declare-datatypes ((ListLongMap!12659 0))(
  ( (ListLongMap!12660 (toList!6345 List!19781)) )
))
(declare-fun contains!5392 (ListLongMap!12659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3507 (array!59144 array!59146 (_ BitVec 32) (_ BitVec 32) V!33729 V!33729 (_ BitVec 32) Int) ListLongMap!12659)

(assert (=> b!962825 (contains!5392 (getCurrentListMap!3507 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28441 _keys!1686) i!803))))

(declare-datatypes ((Unit!32078 0))(
  ( (Unit!32079) )
))
(declare-fun lt!430703 () Unit!32078)

(declare-fun lemmaInListMapFromThenInFromMinusOne!5 (array!59144 array!59146 (_ BitVec 32) (_ BitVec 32) V!33729 V!33729 (_ BitVec 32) (_ BitVec 32) Int) Unit!32078)

(assert (=> b!962825 (= lt!430703 (lemmaInListMapFromThenInFromMinusOne!5 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!962826 () Bool)

(declare-fun res!644410 () Bool)

(assert (=> b!962826 (=> (not res!644410) (not e!542915))))

(assert (=> b!962826 (= res!644410 (and (= (size!28923 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28922 _keys!1686) (size!28923 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962827 () Bool)

(declare-fun e!542914 () Bool)

(declare-fun tp_is_empty!21559 () Bool)

(assert (=> b!962827 (= e!542914 tp_is_empty!21559)))

(declare-fun b!962828 () Bool)

(declare-fun res!644412 () Bool)

(assert (=> b!962828 (=> (not res!644412) (not e!542915))))

(declare-datatypes ((List!19782 0))(
  ( (Nil!19779) (Cons!19778 (h!20940 (_ BitVec 64)) (t!28136 List!19782)) )
))
(declare-fun arrayNoDuplicates!0 (array!59144 (_ BitVec 32) List!19782) Bool)

(assert (=> b!962828 (= res!644412 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19779))))

(declare-fun b!962829 () Bool)

(assert (=> b!962829 (= e!542916 tp_is_empty!21559)))

(declare-fun b!962830 () Bool)

(declare-fun res!644415 () Bool)

(assert (=> b!962830 (=> (not res!644415) (not e!542915))))

(assert (=> b!962830 (= res!644415 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34333 () Bool)

(assert (=> mapIsEmpty!34333 mapRes!34333))

(declare-fun res!644411 () Bool)

(assert (=> start!82606 (=> (not res!644411) (not e!542915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82606 (= res!644411 (validMask!0 mask!2110))))

(assert (=> start!82606 e!542915))

(assert (=> start!82606 true))

(declare-fun e!542917 () Bool)

(declare-fun array_inv!22097 (array!59146) Bool)

(assert (=> start!82606 (and (array_inv!22097 _values!1400) e!542917)))

(declare-fun array_inv!22098 (array!59144) Bool)

(assert (=> start!82606 (array_inv!22098 _keys!1686)))

(assert (=> start!82606 tp!65392))

(assert (=> start!82606 tp_is_empty!21559))

(declare-fun b!962831 () Bool)

(declare-fun res!644416 () Bool)

(assert (=> b!962831 (=> (not res!644416) (not e!542915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59144 (_ BitVec 32)) Bool)

(assert (=> b!962831 (= res!644416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962832 () Bool)

(declare-fun res!644417 () Bool)

(assert (=> b!962832 (=> (not res!644417) (not e!542915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962832 (= res!644417 (validKeyInArray!0 (select (arr!28441 _keys!1686) i!803)))))

(declare-fun b!962833 () Bool)

(assert (=> b!962833 (= e!542917 (and e!542914 mapRes!34333))))

(declare-fun condMapEmpty!34333 () Bool)

(declare-fun mapDefault!34333 () ValueCell!10298)

(assert (=> b!962833 (= condMapEmpty!34333 (= (arr!28442 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10298)) mapDefault!34333)))))

(declare-fun b!962834 () Bool)

(declare-fun res!644414 () Bool)

(assert (=> b!962834 (=> (not res!644414) (not e!542915))))

(assert (=> b!962834 (= res!644414 (contains!5392 (getCurrentListMap!3507 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28441 _keys!1686) i!803)))))

(assert (= (and start!82606 res!644411) b!962826))

(assert (= (and b!962826 res!644410) b!962831))

(assert (= (and b!962831 res!644416) b!962828))

(assert (= (and b!962828 res!644412) b!962824))

(assert (= (and b!962824 res!644413) b!962832))

(assert (= (and b!962832 res!644417) b!962834))

(assert (= (and b!962834 res!644414) b!962830))

(assert (= (and b!962830 res!644415) b!962825))

(assert (= (and b!962833 condMapEmpty!34333) mapIsEmpty!34333))

(assert (= (and b!962833 (not condMapEmpty!34333)) mapNonEmpty!34333))

(get-info :version)

(assert (= (and mapNonEmpty!34333 ((_ is ValueCellFull!10298) mapValue!34333)) b!962829))

(assert (= (and b!962833 ((_ is ValueCellFull!10298) mapDefault!34333)) b!962827))

(assert (= start!82606 b!962833))

(declare-fun m!891805 () Bool)

(assert (=> b!962825 m!891805))

(declare-fun m!891807 () Bool)

(assert (=> b!962825 m!891807))

(assert (=> b!962825 m!891805))

(assert (=> b!962825 m!891807))

(declare-fun m!891809 () Bool)

(assert (=> b!962825 m!891809))

(declare-fun m!891811 () Bool)

(assert (=> b!962825 m!891811))

(declare-fun m!891813 () Bool)

(assert (=> b!962834 m!891813))

(assert (=> b!962834 m!891807))

(assert (=> b!962834 m!891813))

(assert (=> b!962834 m!891807))

(declare-fun m!891815 () Bool)

(assert (=> b!962834 m!891815))

(declare-fun m!891817 () Bool)

(assert (=> b!962831 m!891817))

(declare-fun m!891819 () Bool)

(assert (=> start!82606 m!891819))

(declare-fun m!891821 () Bool)

(assert (=> start!82606 m!891821))

(declare-fun m!891823 () Bool)

(assert (=> start!82606 m!891823))

(assert (=> b!962832 m!891807))

(assert (=> b!962832 m!891807))

(declare-fun m!891825 () Bool)

(assert (=> b!962832 m!891825))

(declare-fun m!891827 () Bool)

(assert (=> b!962828 m!891827))

(declare-fun m!891829 () Bool)

(assert (=> mapNonEmpty!34333 m!891829))

(check-sat (not b!962834) tp_is_empty!21559 (not b!962831) (not mapNonEmpty!34333) b_and!30219 (not b!962825) (not b_next!18757) (not b!962832) (not b!962828) (not start!82606))
(check-sat b_and!30219 (not b_next!18757))
