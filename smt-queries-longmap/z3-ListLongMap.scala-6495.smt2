; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82812 () Bool)

(assert start!82812)

(declare-fun b_free!18939 () Bool)

(declare-fun b_next!18939 () Bool)

(assert (=> start!82812 (= b_free!18939 (not b_next!18939))))

(declare-fun tp!65945 () Bool)

(declare-fun b_and!30427 () Bool)

(assert (=> start!82812 (= tp!65945 b_and!30427)))

(declare-fun mapIsEmpty!34615 () Bool)

(declare-fun mapRes!34615 () Bool)

(assert (=> mapIsEmpty!34615 mapRes!34615))

(declare-fun b!965993 () Bool)

(declare-fun res!646607 () Bool)

(declare-fun e!544553 () Bool)

(assert (=> b!965993 (=> (not res!646607) (not e!544553))))

(declare-datatypes ((array!59579 0))(
  ( (array!59580 (arr!28658 (Array (_ BitVec 32) (_ BitVec 64))) (size!29137 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59579)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965993 (= res!646607 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29137 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29137 _keys!1686))))))

(declare-fun b!965994 () Bool)

(declare-fun res!646608 () Bool)

(assert (=> b!965994 (=> (not res!646608) (not e!544553))))

(declare-datatypes ((List!19890 0))(
  ( (Nil!19887) (Cons!19886 (h!21048 (_ BitVec 64)) (t!28253 List!19890)) )
))
(declare-fun arrayNoDuplicates!0 (array!59579 (_ BitVec 32) List!19890) Bool)

(assert (=> b!965994 (= res!646608 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19887))))

(declare-fun b!965995 () Bool)

(declare-fun e!544552 () Bool)

(declare-fun tp_is_empty!21747 () Bool)

(assert (=> b!965995 (= e!544552 tp_is_empty!21747)))

(declare-fun b!965996 () Bool)

(declare-fun res!646604 () Bool)

(assert (=> b!965996 (=> (not res!646604) (not e!544553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965996 (= res!646604 (validKeyInArray!0 (select (arr!28658 _keys!1686) i!803)))))

(declare-fun b!965997 () Bool)

(declare-fun res!646605 () Bool)

(assert (=> b!965997 (=> (not res!646605) (not e!544553))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33979 0))(
  ( (V!33980 (val!10924 Int)) )
))
(declare-datatypes ((ValueCell!10392 0))(
  ( (ValueCellFull!10392 (v!13482 V!33979)) (EmptyCell!10392) )
))
(declare-datatypes ((array!59581 0))(
  ( (array!59582 (arr!28659 (Array (_ BitVec 32) ValueCell!10392)) (size!29138 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59581)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965997 (= res!646605 (and (= (size!29138 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29137 _keys!1686) (size!29138 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965998 () Bool)

(declare-fun e!544555 () Bool)

(assert (=> b!965998 (= e!544555 tp_is_empty!21747)))

(declare-fun b!965999 () Bool)

(assert (=> b!965999 (= e!544553 false)))

(declare-fun lt!431284 () Bool)

(declare-fun minValue!1342 () V!33979)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33979)

(declare-datatypes ((tuple2!14048 0))(
  ( (tuple2!14049 (_1!7035 (_ BitVec 64)) (_2!7035 V!33979)) )
))
(declare-datatypes ((List!19891 0))(
  ( (Nil!19888) (Cons!19887 (h!21049 tuple2!14048) (t!28254 List!19891)) )
))
(declare-datatypes ((ListLongMap!12745 0))(
  ( (ListLongMap!12746 (toList!6388 List!19891)) )
))
(declare-fun contains!5489 (ListLongMap!12745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3621 (array!59579 array!59581 (_ BitVec 32) (_ BitVec 32) V!33979 V!33979 (_ BitVec 32) Int) ListLongMap!12745)

(assert (=> b!965999 (= lt!431284 (contains!5489 (getCurrentListMap!3621 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28658 _keys!1686) i!803)))))

(declare-fun res!646606 () Bool)

(assert (=> start!82812 (=> (not res!646606) (not e!544553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82812 (= res!646606 (validMask!0 mask!2110))))

(assert (=> start!82812 e!544553))

(assert (=> start!82812 true))

(declare-fun e!544554 () Bool)

(declare-fun array_inv!22197 (array!59581) Bool)

(assert (=> start!82812 (and (array_inv!22197 _values!1400) e!544554)))

(declare-fun array_inv!22198 (array!59579) Bool)

(assert (=> start!82812 (array_inv!22198 _keys!1686)))

(assert (=> start!82812 tp!65945))

(assert (=> start!82812 tp_is_empty!21747))

(declare-fun b!966000 () Bool)

(assert (=> b!966000 (= e!544554 (and e!544555 mapRes!34615))))

(declare-fun condMapEmpty!34615 () Bool)

(declare-fun mapDefault!34615 () ValueCell!10392)

(assert (=> b!966000 (= condMapEmpty!34615 (= (arr!28659 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10392)) mapDefault!34615)))))

(declare-fun b!966001 () Bool)

(declare-fun res!646609 () Bool)

(assert (=> b!966001 (=> (not res!646609) (not e!544553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59579 (_ BitVec 32)) Bool)

(assert (=> b!966001 (= res!646609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34615 () Bool)

(declare-fun tp!65946 () Bool)

(assert (=> mapNonEmpty!34615 (= mapRes!34615 (and tp!65946 e!544552))))

(declare-fun mapRest!34615 () (Array (_ BitVec 32) ValueCell!10392))

(declare-fun mapValue!34615 () ValueCell!10392)

(declare-fun mapKey!34615 () (_ BitVec 32))

(assert (=> mapNonEmpty!34615 (= (arr!28659 _values!1400) (store mapRest!34615 mapKey!34615 mapValue!34615))))

(assert (= (and start!82812 res!646606) b!965997))

(assert (= (and b!965997 res!646605) b!966001))

(assert (= (and b!966001 res!646609) b!965994))

(assert (= (and b!965994 res!646608) b!965993))

(assert (= (and b!965993 res!646607) b!965996))

(assert (= (and b!965996 res!646604) b!965999))

(assert (= (and b!966000 condMapEmpty!34615) mapIsEmpty!34615))

(assert (= (and b!966000 (not condMapEmpty!34615)) mapNonEmpty!34615))

(get-info :version)

(assert (= (and mapNonEmpty!34615 ((_ is ValueCellFull!10392) mapValue!34615)) b!965995))

(assert (= (and b!966000 ((_ is ValueCellFull!10392) mapDefault!34615)) b!965998))

(assert (= start!82812 b!966000))

(declare-fun m!894899 () Bool)

(assert (=> b!965999 m!894899))

(declare-fun m!894901 () Bool)

(assert (=> b!965999 m!894901))

(assert (=> b!965999 m!894899))

(assert (=> b!965999 m!894901))

(declare-fun m!894903 () Bool)

(assert (=> b!965999 m!894903))

(declare-fun m!894905 () Bool)

(assert (=> start!82812 m!894905))

(declare-fun m!894907 () Bool)

(assert (=> start!82812 m!894907))

(declare-fun m!894909 () Bool)

(assert (=> start!82812 m!894909))

(declare-fun m!894911 () Bool)

(assert (=> b!965994 m!894911))

(assert (=> b!965996 m!894901))

(assert (=> b!965996 m!894901))

(declare-fun m!894913 () Bool)

(assert (=> b!965996 m!894913))

(declare-fun m!894915 () Bool)

(assert (=> b!966001 m!894915))

(declare-fun m!894917 () Bool)

(assert (=> mapNonEmpty!34615 m!894917))

(check-sat (not b!965996) (not start!82812) b_and!30427 (not b_next!18939) (not b!966001) (not mapNonEmpty!34615) (not b!965994) (not b!965999) tp_is_empty!21747)
(check-sat b_and!30427 (not b_next!18939))
