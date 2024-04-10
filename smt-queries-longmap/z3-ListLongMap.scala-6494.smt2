; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82806 () Bool)

(assert start!82806)

(declare-fun b_free!18933 () Bool)

(declare-fun b_next!18933 () Bool)

(assert (=> start!82806 (= b_free!18933 (not b_next!18933))))

(declare-fun tp!65928 () Bool)

(declare-fun b_and!30421 () Bool)

(assert (=> start!82806 (= tp!65928 b_and!30421)))

(declare-fun mapIsEmpty!34606 () Bool)

(declare-fun mapRes!34606 () Bool)

(assert (=> mapIsEmpty!34606 mapRes!34606))

(declare-fun b!965912 () Bool)

(declare-fun e!544510 () Bool)

(declare-fun tp_is_empty!21741 () Bool)

(assert (=> b!965912 (= e!544510 tp_is_empty!21741)))

(declare-fun b!965913 () Bool)

(declare-fun res!646550 () Bool)

(declare-fun e!544507 () Bool)

(assert (=> b!965913 (=> (not res!646550) (not e!544507))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33971 0))(
  ( (V!33972 (val!10921 Int)) )
))
(declare-datatypes ((ValueCell!10389 0))(
  ( (ValueCellFull!10389 (v!13479 V!33971)) (EmptyCell!10389) )
))
(declare-datatypes ((array!59567 0))(
  ( (array!59568 (arr!28652 (Array (_ BitVec 32) ValueCell!10389)) (size!29131 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59567)

(declare-datatypes ((array!59569 0))(
  ( (array!59570 (arr!28653 (Array (_ BitVec 32) (_ BitVec 64))) (size!29132 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59569)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965913 (= res!646550 (and (= (size!29131 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29132 _keys!1686) (size!29131 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965914 () Bool)

(declare-fun res!646552 () Bool)

(assert (=> b!965914 (=> (not res!646552) (not e!544507))))

(declare-datatypes ((List!19886 0))(
  ( (Nil!19883) (Cons!19882 (h!21044 (_ BitVec 64)) (t!28249 List!19886)) )
))
(declare-fun arrayNoDuplicates!0 (array!59569 (_ BitVec 32) List!19886) Bool)

(assert (=> b!965914 (= res!646552 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19883))))

(declare-fun b!965915 () Bool)

(declare-fun res!646555 () Bool)

(assert (=> b!965915 (=> (not res!646555) (not e!544507))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965915 (= res!646555 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29132 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29132 _keys!1686))))))

(declare-fun b!965916 () Bool)

(declare-fun e!544511 () Bool)

(assert (=> b!965916 (= e!544511 (and e!544510 mapRes!34606))))

(declare-fun condMapEmpty!34606 () Bool)

(declare-fun mapDefault!34606 () ValueCell!10389)

(assert (=> b!965916 (= condMapEmpty!34606 (= (arr!28652 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10389)) mapDefault!34606)))))

(declare-fun b!965917 () Bool)

(declare-fun e!544508 () Bool)

(assert (=> b!965917 (= e!544508 tp_is_empty!21741)))

(declare-fun res!646553 () Bool)

(assert (=> start!82806 (=> (not res!646553) (not e!544507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82806 (= res!646553 (validMask!0 mask!2110))))

(assert (=> start!82806 e!544507))

(assert (=> start!82806 true))

(declare-fun array_inv!22191 (array!59567) Bool)

(assert (=> start!82806 (and (array_inv!22191 _values!1400) e!544511)))

(declare-fun array_inv!22192 (array!59569) Bool)

(assert (=> start!82806 (array_inv!22192 _keys!1686)))

(assert (=> start!82806 tp!65928))

(assert (=> start!82806 tp_is_empty!21741))

(declare-fun b!965918 () Bool)

(assert (=> b!965918 (= e!544507 false)))

(declare-fun minValue!1342 () V!33971)

(declare-fun lt!431275 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33971)

(declare-datatypes ((tuple2!14044 0))(
  ( (tuple2!14045 (_1!7033 (_ BitVec 64)) (_2!7033 V!33971)) )
))
(declare-datatypes ((List!19887 0))(
  ( (Nil!19884) (Cons!19883 (h!21045 tuple2!14044) (t!28250 List!19887)) )
))
(declare-datatypes ((ListLongMap!12741 0))(
  ( (ListLongMap!12742 (toList!6386 List!19887)) )
))
(declare-fun contains!5487 (ListLongMap!12741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3619 (array!59569 array!59567 (_ BitVec 32) (_ BitVec 32) V!33971 V!33971 (_ BitVec 32) Int) ListLongMap!12741)

(assert (=> b!965918 (= lt!431275 (contains!5487 (getCurrentListMap!3619 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28653 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34606 () Bool)

(declare-fun tp!65927 () Bool)

(assert (=> mapNonEmpty!34606 (= mapRes!34606 (and tp!65927 e!544508))))

(declare-fun mapKey!34606 () (_ BitVec 32))

(declare-fun mapRest!34606 () (Array (_ BitVec 32) ValueCell!10389))

(declare-fun mapValue!34606 () ValueCell!10389)

(assert (=> mapNonEmpty!34606 (= (arr!28652 _values!1400) (store mapRest!34606 mapKey!34606 mapValue!34606))))

(declare-fun b!965919 () Bool)

(declare-fun res!646554 () Bool)

(assert (=> b!965919 (=> (not res!646554) (not e!544507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59569 (_ BitVec 32)) Bool)

(assert (=> b!965919 (= res!646554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965920 () Bool)

(declare-fun res!646551 () Bool)

(assert (=> b!965920 (=> (not res!646551) (not e!544507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965920 (= res!646551 (validKeyInArray!0 (select (arr!28653 _keys!1686) i!803)))))

(assert (= (and start!82806 res!646553) b!965913))

(assert (= (and b!965913 res!646550) b!965919))

(assert (= (and b!965919 res!646554) b!965914))

(assert (= (and b!965914 res!646552) b!965915))

(assert (= (and b!965915 res!646555) b!965920))

(assert (= (and b!965920 res!646551) b!965918))

(assert (= (and b!965916 condMapEmpty!34606) mapIsEmpty!34606))

(assert (= (and b!965916 (not condMapEmpty!34606)) mapNonEmpty!34606))

(get-info :version)

(assert (= (and mapNonEmpty!34606 ((_ is ValueCellFull!10389) mapValue!34606)) b!965917))

(assert (= (and b!965916 ((_ is ValueCellFull!10389) mapDefault!34606)) b!965912))

(assert (= start!82806 b!965916))

(declare-fun m!894839 () Bool)

(assert (=> b!965919 m!894839))

(declare-fun m!894841 () Bool)

(assert (=> b!965918 m!894841))

(declare-fun m!894843 () Bool)

(assert (=> b!965918 m!894843))

(assert (=> b!965918 m!894841))

(assert (=> b!965918 m!894843))

(declare-fun m!894845 () Bool)

(assert (=> b!965918 m!894845))

(declare-fun m!894847 () Bool)

(assert (=> start!82806 m!894847))

(declare-fun m!894849 () Bool)

(assert (=> start!82806 m!894849))

(declare-fun m!894851 () Bool)

(assert (=> start!82806 m!894851))

(declare-fun m!894853 () Bool)

(assert (=> b!965914 m!894853))

(declare-fun m!894855 () Bool)

(assert (=> mapNonEmpty!34606 m!894855))

(assert (=> b!965920 m!894843))

(assert (=> b!965920 m!894843))

(declare-fun m!894857 () Bool)

(assert (=> b!965920 m!894857))

(check-sat (not b!965918) (not b!965919) (not b_next!18933) (not b!965920) (not start!82806) tp_is_empty!21741 (not mapNonEmpty!34606) b_and!30421 (not b!965914))
(check-sat b_and!30421 (not b_next!18933))
