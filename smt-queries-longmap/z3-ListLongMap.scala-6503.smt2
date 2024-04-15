; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82840 () Bool)

(assert start!82840)

(declare-fun b_free!18985 () Bool)

(declare-fun b_next!18985 () Bool)

(assert (=> start!82840 (= b_free!18985 (not b_next!18985))))

(declare-fun tp!66084 () Bool)

(declare-fun b_and!30447 () Bool)

(assert (=> start!82840 (= tp!66084 b_and!30447)))

(declare-fun b!966384 () Bool)

(declare-fun res!646922 () Bool)

(declare-fun e!544751 () Bool)

(assert (=> b!966384 (=> (not res!646922) (not e!544751))))

(declare-datatypes ((array!59594 0))(
  ( (array!59595 (arr!28666 (Array (_ BitVec 32) (_ BitVec 64))) (size!29147 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59594)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59594 (_ BitVec 32)) Bool)

(assert (=> b!966384 (= res!646922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!646920 () Bool)

(assert (=> start!82840 (=> (not res!646920) (not e!544751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82840 (= res!646920 (validMask!0 mask!2110))))

(assert (=> start!82840 e!544751))

(assert (=> start!82840 true))

(declare-datatypes ((V!34041 0))(
  ( (V!34042 (val!10947 Int)) )
))
(declare-datatypes ((ValueCell!10415 0))(
  ( (ValueCellFull!10415 (v!13504 V!34041)) (EmptyCell!10415) )
))
(declare-datatypes ((array!59596 0))(
  ( (array!59597 (arr!28667 (Array (_ BitVec 32) ValueCell!10415)) (size!29148 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59596)

(declare-fun e!544753 () Bool)

(declare-fun array_inv!22257 (array!59596) Bool)

(assert (=> start!82840 (and (array_inv!22257 _values!1400) e!544753)))

(declare-fun array_inv!22258 (array!59594) Bool)

(assert (=> start!82840 (array_inv!22258 _keys!1686)))

(assert (=> start!82840 tp!66084))

(declare-fun tp_is_empty!21793 () Bool)

(assert (=> start!82840 tp_is_empty!21793))

(declare-fun b!966385 () Bool)

(declare-fun e!544749 () Bool)

(assert (=> b!966385 (= e!544749 tp_is_empty!21793)))

(declare-fun b!966386 () Bool)

(declare-fun res!646918 () Bool)

(assert (=> b!966386 (=> (not res!646918) (not e!544751))))

(declare-datatypes ((List!19953 0))(
  ( (Nil!19950) (Cons!19949 (h!21111 (_ BitVec 64)) (t!28307 List!19953)) )
))
(declare-fun arrayNoDuplicates!0 (array!59594 (_ BitVec 32) List!19953) Bool)

(assert (=> b!966386 (= res!646918 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19950))))

(declare-fun b!966387 () Bool)

(declare-fun mapRes!34684 () Bool)

(assert (=> b!966387 (= e!544753 (and e!544749 mapRes!34684))))

(declare-fun condMapEmpty!34684 () Bool)

(declare-fun mapDefault!34684 () ValueCell!10415)

(assert (=> b!966387 (= condMapEmpty!34684 (= (arr!28667 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10415)) mapDefault!34684)))))

(declare-fun b!966388 () Bool)

(declare-fun e!544750 () Bool)

(assert (=> b!966388 (= e!544750 tp_is_empty!21793)))

(declare-fun mapIsEmpty!34684 () Bool)

(assert (=> mapIsEmpty!34684 mapRes!34684))

(declare-fun b!966389 () Bool)

(declare-fun res!646919 () Bool)

(assert (=> b!966389 (=> (not res!646919) (not e!544751))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966389 (= res!646919 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29147 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29147 _keys!1686))))))

(declare-fun b!966390 () Bool)

(assert (=> b!966390 (= e!544751 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34041)

(declare-fun lt!431108 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34041)

(declare-datatypes ((tuple2!14148 0))(
  ( (tuple2!14149 (_1!7085 (_ BitVec 64)) (_2!7085 V!34041)) )
))
(declare-datatypes ((List!19954 0))(
  ( (Nil!19951) (Cons!19950 (h!21112 tuple2!14148) (t!28308 List!19954)) )
))
(declare-datatypes ((ListLongMap!12835 0))(
  ( (ListLongMap!12836 (toList!6433 List!19954)) )
))
(declare-fun contains!5478 (ListLongMap!12835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3595 (array!59594 array!59596 (_ BitVec 32) (_ BitVec 32) V!34041 V!34041 (_ BitVec 32) Int) ListLongMap!12835)

(assert (=> b!966390 (= lt!431108 (contains!5478 (getCurrentListMap!3595 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28666 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34684 () Bool)

(declare-fun tp!66085 () Bool)

(assert (=> mapNonEmpty!34684 (= mapRes!34684 (and tp!66085 e!544750))))

(declare-fun mapKey!34684 () (_ BitVec 32))

(declare-fun mapRest!34684 () (Array (_ BitVec 32) ValueCell!10415))

(declare-fun mapValue!34684 () ValueCell!10415)

(assert (=> mapNonEmpty!34684 (= (arr!28667 _values!1400) (store mapRest!34684 mapKey!34684 mapValue!34684))))

(declare-fun b!966391 () Bool)

(declare-fun res!646917 () Bool)

(assert (=> b!966391 (=> (not res!646917) (not e!544751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966391 (= res!646917 (validKeyInArray!0 (select (arr!28666 _keys!1686) i!803)))))

(declare-fun b!966392 () Bool)

(declare-fun res!646921 () Bool)

(assert (=> b!966392 (=> (not res!646921) (not e!544751))))

(assert (=> b!966392 (= res!646921 (and (= (size!29148 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29147 _keys!1686) (size!29148 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82840 res!646920) b!966392))

(assert (= (and b!966392 res!646921) b!966384))

(assert (= (and b!966384 res!646922) b!966386))

(assert (= (and b!966386 res!646918) b!966389))

(assert (= (and b!966389 res!646919) b!966391))

(assert (= (and b!966391 res!646917) b!966390))

(assert (= (and b!966387 condMapEmpty!34684) mapIsEmpty!34684))

(assert (= (and b!966387 (not condMapEmpty!34684)) mapNonEmpty!34684))

(get-info :version)

(assert (= (and mapNonEmpty!34684 ((_ is ValueCellFull!10415) mapValue!34684)) b!966388))

(assert (= (and b!966387 ((_ is ValueCellFull!10415) mapDefault!34684)) b!966385))

(assert (= start!82840 b!966387))

(declare-fun m!894601 () Bool)

(assert (=> b!966386 m!894601))

(declare-fun m!894603 () Bool)

(assert (=> b!966390 m!894603))

(declare-fun m!894605 () Bool)

(assert (=> b!966390 m!894605))

(assert (=> b!966390 m!894603))

(assert (=> b!966390 m!894605))

(declare-fun m!894607 () Bool)

(assert (=> b!966390 m!894607))

(assert (=> b!966391 m!894605))

(assert (=> b!966391 m!894605))

(declare-fun m!894609 () Bool)

(assert (=> b!966391 m!894609))

(declare-fun m!894611 () Bool)

(assert (=> mapNonEmpty!34684 m!894611))

(declare-fun m!894613 () Bool)

(assert (=> start!82840 m!894613))

(declare-fun m!894615 () Bool)

(assert (=> start!82840 m!894615))

(declare-fun m!894617 () Bool)

(assert (=> start!82840 m!894617))

(declare-fun m!894619 () Bool)

(assert (=> b!966384 m!894619))

(check-sat (not b_next!18985) b_and!30447 (not mapNonEmpty!34684) (not b!966390) tp_is_empty!21793 (not start!82840) (not b!966386) (not b!966391) (not b!966384))
(check-sat b_and!30447 (not b_next!18985))
