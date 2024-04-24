; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82948 () Bool)

(assert start!82948)

(declare-fun b_free!18913 () Bool)

(declare-fun b_next!18913 () Bool)

(assert (=> start!82948 (= b_free!18913 (not b_next!18913))))

(declare-fun tp!65860 () Bool)

(declare-fun b_and!30411 () Bool)

(assert (=> start!82948 (= tp!65860 b_and!30411)))

(declare-fun b!966475 () Bool)

(declare-fun e!544894 () Bool)

(declare-fun tp_is_empty!21715 () Bool)

(assert (=> b!966475 (= e!544894 tp_is_empty!21715)))

(declare-fun b!966476 () Bool)

(declare-fun res!646676 () Bool)

(declare-fun e!544895 () Bool)

(assert (=> b!966476 (=> (not res!646676) (not e!544895))))

(declare-datatypes ((array!59530 0))(
  ( (array!59531 (arr!28629 (Array (_ BitVec 32) (_ BitVec 64))) (size!29109 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59530)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59530 (_ BitVec 32)) Bool)

(assert (=> b!966476 (= res!646676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34567 () Bool)

(declare-fun mapRes!34567 () Bool)

(assert (=> mapIsEmpty!34567 mapRes!34567))

(declare-fun b!966478 () Bool)

(declare-fun res!646677 () Bool)

(assert (=> b!966478 (=> (not res!646677) (not e!544895))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966478 (= res!646677 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29109 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29109 _keys!1686))))))

(declare-fun b!966479 () Bool)

(declare-fun e!544898 () Bool)

(assert (=> b!966479 (= e!544898 tp_is_empty!21715)))

(declare-fun b!966480 () Bool)

(declare-fun res!646674 () Bool)

(assert (=> b!966480 (=> (not res!646674) (not e!544895))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33937 0))(
  ( (V!33938 (val!10908 Int)) )
))
(declare-datatypes ((ValueCell!10376 0))(
  ( (ValueCellFull!10376 (v!13463 V!33937)) (EmptyCell!10376) )
))
(declare-datatypes ((array!59532 0))(
  ( (array!59533 (arr!28630 (Array (_ BitVec 32) ValueCell!10376)) (size!29110 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59532)

(assert (=> b!966480 (= res!646674 (and (= (size!29110 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29109 _keys!1686) (size!29110 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34567 () Bool)

(declare-fun tp!65859 () Bool)

(assert (=> mapNonEmpty!34567 (= mapRes!34567 (and tp!65859 e!544894))))

(declare-fun mapValue!34567 () ValueCell!10376)

(declare-fun mapKey!34567 () (_ BitVec 32))

(declare-fun mapRest!34567 () (Array (_ BitVec 32) ValueCell!10376))

(assert (=> mapNonEmpty!34567 (= (arr!28630 _values!1400) (store mapRest!34567 mapKey!34567 mapValue!34567))))

(declare-fun b!966481 () Bool)

(declare-fun res!646675 () Bool)

(assert (=> b!966481 (=> (not res!646675) (not e!544895))))

(declare-fun defaultEntry!1403 () Int)

(declare-fun minValue!1342 () V!33937)

(declare-fun zeroValue!1342 () V!33937)

(declare-datatypes ((tuple2!14010 0))(
  ( (tuple2!14011 (_1!7016 (_ BitVec 64)) (_2!7016 V!33937)) )
))
(declare-datatypes ((List!19855 0))(
  ( (Nil!19852) (Cons!19851 (h!21019 tuple2!14010) (t!28210 List!19855)) )
))
(declare-datatypes ((ListLongMap!12709 0))(
  ( (ListLongMap!12710 (toList!6370 List!19855)) )
))
(declare-fun contains!5485 (ListLongMap!12709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3603 (array!59530 array!59532 (_ BitVec 32) (_ BitVec 32) V!33937 V!33937 (_ BitVec 32) Int) ListLongMap!12709)

(assert (=> b!966481 (= res!646675 (contains!5485 (getCurrentListMap!3603 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28629 _keys!1686) i!803)))))

(declare-fun b!966477 () Bool)

(declare-fun res!646671 () Bool)

(assert (=> b!966477 (=> (not res!646671) (not e!544895))))

(declare-datatypes ((List!19856 0))(
  ( (Nil!19853) (Cons!19852 (h!21020 (_ BitVec 64)) (t!28211 List!19856)) )
))
(declare-fun arrayNoDuplicates!0 (array!59530 (_ BitVec 32) List!19856) Bool)

(assert (=> b!966477 (= res!646671 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19853))))

(declare-fun res!646672 () Bool)

(assert (=> start!82948 (=> (not res!646672) (not e!544895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82948 (= res!646672 (validMask!0 mask!2110))))

(assert (=> start!82948 e!544895))

(assert (=> start!82948 true))

(declare-fun e!544896 () Bool)

(declare-fun array_inv!22227 (array!59532) Bool)

(assert (=> start!82948 (and (array_inv!22227 _values!1400) e!544896)))

(declare-fun array_inv!22228 (array!59530) Bool)

(assert (=> start!82948 (array_inv!22228 _keys!1686)))

(assert (=> start!82948 tp!65860))

(assert (=> start!82948 tp_is_empty!21715))

(declare-fun b!966482 () Bool)

(declare-fun res!646673 () Bool)

(assert (=> b!966482 (=> (not res!646673) (not e!544895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966482 (= res!646673 (validKeyInArray!0 (select (arr!28629 _keys!1686) i!803)))))

(declare-fun b!966483 () Bool)

(assert (=> b!966483 (= e!544896 (and e!544898 mapRes!34567))))

(declare-fun condMapEmpty!34567 () Bool)

(declare-fun mapDefault!34567 () ValueCell!10376)

(assert (=> b!966483 (= condMapEmpty!34567 (= (arr!28630 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10376)) mapDefault!34567)))))

(declare-fun b!966484 () Bool)

(assert (=> b!966484 (= e!544895 (and (bvsle from!2084 newFrom!159) (bvsgt newFrom!159 (size!29109 _keys!1686))))))

(assert (= (and start!82948 res!646672) b!966480))

(assert (= (and b!966480 res!646674) b!966476))

(assert (= (and b!966476 res!646676) b!966477))

(assert (= (and b!966477 res!646671) b!966478))

(assert (= (and b!966478 res!646677) b!966482))

(assert (= (and b!966482 res!646673) b!966481))

(assert (= (and b!966481 res!646675) b!966484))

(assert (= (and b!966483 condMapEmpty!34567) mapIsEmpty!34567))

(assert (= (and b!966483 (not condMapEmpty!34567)) mapNonEmpty!34567))

(get-info :version)

(assert (= (and mapNonEmpty!34567 ((_ is ValueCellFull!10376) mapValue!34567)) b!966475))

(assert (= (and b!966483 ((_ is ValueCellFull!10376) mapDefault!34567)) b!966479))

(assert (= start!82948 b!966483))

(declare-fun m!895903 () Bool)

(assert (=> b!966476 m!895903))

(declare-fun m!895905 () Bool)

(assert (=> mapNonEmpty!34567 m!895905))

(declare-fun m!895907 () Bool)

(assert (=> b!966477 m!895907))

(declare-fun m!895909 () Bool)

(assert (=> b!966481 m!895909))

(declare-fun m!895911 () Bool)

(assert (=> b!966481 m!895911))

(assert (=> b!966481 m!895909))

(assert (=> b!966481 m!895911))

(declare-fun m!895913 () Bool)

(assert (=> b!966481 m!895913))

(declare-fun m!895915 () Bool)

(assert (=> start!82948 m!895915))

(declare-fun m!895917 () Bool)

(assert (=> start!82948 m!895917))

(declare-fun m!895919 () Bool)

(assert (=> start!82948 m!895919))

(assert (=> b!966482 m!895911))

(assert (=> b!966482 m!895911))

(declare-fun m!895921 () Bool)

(assert (=> b!966482 m!895921))

(check-sat (not start!82948) (not b!966481) b_and!30411 (not b!966476) (not b!966477) tp_is_empty!21715 (not mapNonEmpty!34567) (not b!966482) (not b_next!18913))
(check-sat b_and!30411 (not b_next!18913))
