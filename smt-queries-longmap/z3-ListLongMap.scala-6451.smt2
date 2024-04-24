; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82714 () Bool)

(assert start!82714)

(declare-fun b_free!18679 () Bool)

(declare-fun b_next!18679 () Bool)

(assert (=> start!82714 (= b_free!18679 (not b_next!18679))))

(declare-fun tp!65157 () Bool)

(declare-fun b_and!30177 () Bool)

(assert (=> start!82714 (= tp!65157 b_and!30177)))

(declare-fun res!644105 () Bool)

(declare-fun e!543062 () Bool)

(assert (=> start!82714 (=> (not res!644105) (not e!543062))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82714 (= res!644105 (validMask!0 mask!2110))))

(assert (=> start!82714 e!543062))

(assert (=> start!82714 true))

(declare-datatypes ((V!33625 0))(
  ( (V!33626 (val!10791 Int)) )
))
(declare-datatypes ((ValueCell!10259 0))(
  ( (ValueCellFull!10259 (v!13346 V!33625)) (EmptyCell!10259) )
))
(declare-datatypes ((array!59080 0))(
  ( (array!59081 (arr!28404 (Array (_ BitVec 32) ValueCell!10259)) (size!28884 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59080)

(declare-fun e!543058 () Bool)

(declare-fun array_inv!22081 (array!59080) Bool)

(assert (=> start!82714 (and (array_inv!22081 _values!1400) e!543058)))

(declare-datatypes ((array!59082 0))(
  ( (array!59083 (arr!28405 (Array (_ BitVec 32) (_ BitVec 64))) (size!28885 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59082)

(declare-fun array_inv!22082 (array!59082) Bool)

(assert (=> start!82714 (array_inv!22082 _keys!1686)))

(assert (=> start!82714 tp!65157))

(declare-fun tp_is_empty!21481 () Bool)

(assert (=> start!82714 tp_is_empty!21481))

(declare-fun b!962855 () Bool)

(declare-fun res!644109 () Bool)

(assert (=> b!962855 (=> (not res!644109) (not e!543062))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962855 (= res!644109 (validKeyInArray!0 (select (arr!28405 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34216 () Bool)

(declare-fun mapRes!34216 () Bool)

(declare-fun tp!65158 () Bool)

(declare-fun e!543059 () Bool)

(assert (=> mapNonEmpty!34216 (= mapRes!34216 (and tp!65158 e!543059))))

(declare-fun mapRest!34216 () (Array (_ BitVec 32) ValueCell!10259))

(declare-fun mapValue!34216 () ValueCell!10259)

(declare-fun mapKey!34216 () (_ BitVec 32))

(assert (=> mapNonEmpty!34216 (= (arr!28404 _values!1400) (store mapRest!34216 mapKey!34216 mapValue!34216))))

(declare-fun b!962856 () Bool)

(assert (=> b!962856 (= e!543062 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431183 () Bool)

(declare-fun minValue!1342 () V!33625)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33625)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13836 0))(
  ( (tuple2!13837 (_1!6929 (_ BitVec 64)) (_2!6929 V!33625)) )
))
(declare-datatypes ((List!19689 0))(
  ( (Nil!19686) (Cons!19685 (h!20853 tuple2!13836) (t!28044 List!19689)) )
))
(declare-datatypes ((ListLongMap!12535 0))(
  ( (ListLongMap!12536 (toList!6283 List!19689)) )
))
(declare-fun contains!5398 (ListLongMap!12535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3516 (array!59082 array!59080 (_ BitVec 32) (_ BitVec 32) V!33625 V!33625 (_ BitVec 32) Int) ListLongMap!12535)

(assert (=> b!962856 (= lt!431183 (contains!5398 (getCurrentListMap!3516 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28405 _keys!1686) i!803)))))

(declare-fun b!962857 () Bool)

(declare-fun res!644107 () Bool)

(assert (=> b!962857 (=> (not res!644107) (not e!543062))))

(declare-datatypes ((List!19690 0))(
  ( (Nil!19687) (Cons!19686 (h!20854 (_ BitVec 64)) (t!28045 List!19690)) )
))
(declare-fun arrayNoDuplicates!0 (array!59082 (_ BitVec 32) List!19690) Bool)

(assert (=> b!962857 (= res!644107 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19687))))

(declare-fun b!962858 () Bool)

(declare-fun res!644104 () Bool)

(assert (=> b!962858 (=> (not res!644104) (not e!543062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59082 (_ BitVec 32)) Bool)

(assert (=> b!962858 (= res!644104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962859 () Bool)

(declare-fun e!543061 () Bool)

(assert (=> b!962859 (= e!543058 (and e!543061 mapRes!34216))))

(declare-fun condMapEmpty!34216 () Bool)

(declare-fun mapDefault!34216 () ValueCell!10259)

(assert (=> b!962859 (= condMapEmpty!34216 (= (arr!28404 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10259)) mapDefault!34216)))))

(declare-fun b!962860 () Bool)

(assert (=> b!962860 (= e!543061 tp_is_empty!21481)))

(declare-fun mapIsEmpty!34216 () Bool)

(assert (=> mapIsEmpty!34216 mapRes!34216))

(declare-fun b!962861 () Bool)

(declare-fun res!644106 () Bool)

(assert (=> b!962861 (=> (not res!644106) (not e!543062))))

(assert (=> b!962861 (= res!644106 (and (= (size!28884 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28885 _keys!1686) (size!28884 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962862 () Bool)

(assert (=> b!962862 (= e!543059 tp_is_empty!21481)))

(declare-fun b!962863 () Bool)

(declare-fun res!644108 () Bool)

(assert (=> b!962863 (=> (not res!644108) (not e!543062))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962863 (= res!644108 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28885 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28885 _keys!1686))))))

(assert (= (and start!82714 res!644105) b!962861))

(assert (= (and b!962861 res!644106) b!962858))

(assert (= (and b!962858 res!644104) b!962857))

(assert (= (and b!962857 res!644107) b!962863))

(assert (= (and b!962863 res!644108) b!962855))

(assert (= (and b!962855 res!644109) b!962856))

(assert (= (and b!962859 condMapEmpty!34216) mapIsEmpty!34216))

(assert (= (and b!962859 (not condMapEmpty!34216)) mapNonEmpty!34216))

(get-info :version)

(assert (= (and mapNonEmpty!34216 ((_ is ValueCellFull!10259) mapValue!34216)) b!962862))

(assert (= (and b!962859 ((_ is ValueCellFull!10259) mapDefault!34216)) b!962860))

(assert (= start!82714 b!962859))

(declare-fun m!893023 () Bool)

(assert (=> b!962858 m!893023))

(declare-fun m!893025 () Bool)

(assert (=> mapNonEmpty!34216 m!893025))

(declare-fun m!893027 () Bool)

(assert (=> start!82714 m!893027))

(declare-fun m!893029 () Bool)

(assert (=> start!82714 m!893029))

(declare-fun m!893031 () Bool)

(assert (=> start!82714 m!893031))

(declare-fun m!893033 () Bool)

(assert (=> b!962857 m!893033))

(declare-fun m!893035 () Bool)

(assert (=> b!962856 m!893035))

(declare-fun m!893037 () Bool)

(assert (=> b!962856 m!893037))

(assert (=> b!962856 m!893035))

(assert (=> b!962856 m!893037))

(declare-fun m!893039 () Bool)

(assert (=> b!962856 m!893039))

(assert (=> b!962855 m!893037))

(assert (=> b!962855 m!893037))

(declare-fun m!893041 () Bool)

(assert (=> b!962855 m!893041))

(check-sat (not b!962856) (not b!962855) b_and!30177 (not b_next!18679) tp_is_empty!21481 (not b!962857) (not start!82714) (not b!962858) (not mapNonEmpty!34216))
(check-sat b_and!30177 (not b_next!18679))
