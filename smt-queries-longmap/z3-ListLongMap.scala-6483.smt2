; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82720 () Bool)

(assert start!82720)

(declare-fun b_free!18871 () Bool)

(declare-fun b_next!18871 () Bool)

(assert (=> start!82720 (= b_free!18871 (not b_next!18871))))

(declare-fun tp!65734 () Bool)

(declare-fun b_and!30333 () Bool)

(assert (=> start!82720 (= tp!65734 b_and!30333)))

(declare-fun res!645839 () Bool)

(declare-fun e!543852 () Bool)

(assert (=> start!82720 (=> (not res!645839) (not e!543852))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82720 (= res!645839 (validMask!0 mask!2110))))

(assert (=> start!82720 e!543852))

(assert (=> start!82720 true))

(declare-datatypes ((V!33881 0))(
  ( (V!33882 (val!10887 Int)) )
))
(declare-datatypes ((ValueCell!10355 0))(
  ( (ValueCellFull!10355 (v!13444 V!33881)) (EmptyCell!10355) )
))
(declare-datatypes ((array!59368 0))(
  ( (array!59369 (arr!28553 (Array (_ BitVec 32) ValueCell!10355)) (size!29034 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59368)

(declare-fun e!543849 () Bool)

(declare-fun array_inv!22171 (array!59368) Bool)

(assert (=> start!82720 (and (array_inv!22171 _values!1400) e!543849)))

(declare-datatypes ((array!59370 0))(
  ( (array!59371 (arr!28554 (Array (_ BitVec 32) (_ BitVec 64))) (size!29035 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59370)

(declare-fun array_inv!22172 (array!59370) Bool)

(assert (=> start!82720 (array_inv!22172 _keys!1686)))

(assert (=> start!82720 tp!65734))

(declare-fun tp_is_empty!21673 () Bool)

(assert (=> start!82720 tp_is_empty!21673))

(declare-fun b!964764 () Bool)

(declare-fun res!645838 () Bool)

(assert (=> b!964764 (=> (not res!645838) (not e!543852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59370 (_ BitVec 32)) Bool)

(assert (=> b!964764 (= res!645838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964765 () Bool)

(declare-fun e!543850 () Bool)

(assert (=> b!964765 (= e!543850 tp_is_empty!21673)))

(declare-fun b!964766 () Bool)

(declare-fun e!543853 () Bool)

(assert (=> b!964766 (= e!543853 tp_is_empty!21673)))

(declare-fun b!964767 () Bool)

(assert (=> b!964767 (= e!543852 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!430955 () Bool)

(declare-fun minValue!1342 () V!33881)

(declare-fun zeroValue!1342 () V!33881)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14066 0))(
  ( (tuple2!14067 (_1!7044 (_ BitVec 64)) (_2!7044 V!33881)) )
))
(declare-datatypes ((List!19872 0))(
  ( (Nil!19869) (Cons!19868 (h!21030 tuple2!14066) (t!28226 List!19872)) )
))
(declare-datatypes ((ListLongMap!12753 0))(
  ( (ListLongMap!12754 (toList!6392 List!19872)) )
))
(declare-fun contains!5439 (ListLongMap!12753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3554 (array!59370 array!59368 (_ BitVec 32) (_ BitVec 32) V!33881 V!33881 (_ BitVec 32) Int) ListLongMap!12753)

(assert (=> b!964767 (= lt!430955 (contains!5439 (getCurrentListMap!3554 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28554 _keys!1686) i!803)))))

(declare-fun b!964768 () Bool)

(declare-fun res!645841 () Bool)

(assert (=> b!964768 (=> (not res!645841) (not e!543852))))

(assert (=> b!964768 (= res!645841 (and (= (size!29034 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29035 _keys!1686) (size!29034 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964769 () Bool)

(declare-fun res!645840 () Bool)

(assert (=> b!964769 (=> (not res!645840) (not e!543852))))

(declare-datatypes ((List!19873 0))(
  ( (Nil!19870) (Cons!19869 (h!21031 (_ BitVec 64)) (t!28227 List!19873)) )
))
(declare-fun arrayNoDuplicates!0 (array!59370 (_ BitVec 32) List!19873) Bool)

(assert (=> b!964769 (= res!645840 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19870))))

(declare-fun b!964770 () Bool)

(declare-fun res!645837 () Bool)

(assert (=> b!964770 (=> (not res!645837) (not e!543852))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964770 (= res!645837 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29035 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29035 _keys!1686))))))

(declare-fun mapNonEmpty!34504 () Bool)

(declare-fun mapRes!34504 () Bool)

(declare-fun tp!65733 () Bool)

(assert (=> mapNonEmpty!34504 (= mapRes!34504 (and tp!65733 e!543853))))

(declare-fun mapRest!34504 () (Array (_ BitVec 32) ValueCell!10355))

(declare-fun mapKey!34504 () (_ BitVec 32))

(declare-fun mapValue!34504 () ValueCell!10355)

(assert (=> mapNonEmpty!34504 (= (arr!28553 _values!1400) (store mapRest!34504 mapKey!34504 mapValue!34504))))

(declare-fun mapIsEmpty!34504 () Bool)

(assert (=> mapIsEmpty!34504 mapRes!34504))

(declare-fun b!964771 () Bool)

(assert (=> b!964771 (= e!543849 (and e!543850 mapRes!34504))))

(declare-fun condMapEmpty!34504 () Bool)

(declare-fun mapDefault!34504 () ValueCell!10355)

(assert (=> b!964771 (= condMapEmpty!34504 (= (arr!28553 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10355)) mapDefault!34504)))))

(declare-fun b!964772 () Bool)

(declare-fun res!645842 () Bool)

(assert (=> b!964772 (=> (not res!645842) (not e!543852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964772 (= res!645842 (validKeyInArray!0 (select (arr!28554 _keys!1686) i!803)))))

(assert (= (and start!82720 res!645839) b!964768))

(assert (= (and b!964768 res!645841) b!964764))

(assert (= (and b!964764 res!645838) b!964769))

(assert (= (and b!964769 res!645840) b!964770))

(assert (= (and b!964770 res!645837) b!964772))

(assert (= (and b!964772 res!645842) b!964767))

(assert (= (and b!964771 condMapEmpty!34504) mapIsEmpty!34504))

(assert (= (and b!964771 (not condMapEmpty!34504)) mapNonEmpty!34504))

(get-info :version)

(assert (= (and mapNonEmpty!34504 ((_ is ValueCellFull!10355) mapValue!34504)) b!964766))

(assert (= (and b!964771 ((_ is ValueCellFull!10355) mapDefault!34504)) b!964765))

(assert (= start!82720 b!964771))

(declare-fun m!893431 () Bool)

(assert (=> mapNonEmpty!34504 m!893431))

(declare-fun m!893433 () Bool)

(assert (=> b!964772 m!893433))

(assert (=> b!964772 m!893433))

(declare-fun m!893435 () Bool)

(assert (=> b!964772 m!893435))

(declare-fun m!893437 () Bool)

(assert (=> start!82720 m!893437))

(declare-fun m!893439 () Bool)

(assert (=> start!82720 m!893439))

(declare-fun m!893441 () Bool)

(assert (=> start!82720 m!893441))

(declare-fun m!893443 () Bool)

(assert (=> b!964769 m!893443))

(declare-fun m!893445 () Bool)

(assert (=> b!964767 m!893445))

(assert (=> b!964767 m!893433))

(assert (=> b!964767 m!893445))

(assert (=> b!964767 m!893433))

(declare-fun m!893447 () Bool)

(assert (=> b!964767 m!893447))

(declare-fun m!893449 () Bool)

(assert (=> b!964764 m!893449))

(check-sat tp_is_empty!21673 (not b!964767) (not mapNonEmpty!34504) (not start!82720) (not b!964772) (not b_next!18871) (not b!964764) b_and!30333 (not b!964769))
(check-sat b_and!30333 (not b_next!18871))
