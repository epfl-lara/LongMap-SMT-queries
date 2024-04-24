; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82852 () Bool)

(assert start!82852)

(declare-fun b_free!18817 () Bool)

(declare-fun b_next!18817 () Bool)

(assert (=> start!82852 (= b_free!18817 (not b_next!18817))))

(declare-fun tp!65572 () Bool)

(declare-fun b_and!30315 () Bool)

(assert (=> start!82852 (= tp!65572 b_and!30315)))

(declare-fun b!964967 () Bool)

(declare-fun e!544105 () Bool)

(assert (=> b!964967 (= e!544105 true)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33809 0))(
  ( (V!33810 (val!10860 Int)) )
))
(declare-datatypes ((ValueCell!10328 0))(
  ( (ValueCellFull!10328 (v!13415 V!33809)) (EmptyCell!10328) )
))
(declare-datatypes ((array!59348 0))(
  ( (array!59349 (arr!28538 (Array (_ BitVec 32) ValueCell!10328)) (size!29018 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59348)

(declare-datatypes ((array!59350 0))(
  ( (array!59351 (arr!28539 (Array (_ BitVec 32) (_ BitVec 64))) (size!29019 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59350)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33809)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33809)

(declare-datatypes ((tuple2!13942 0))(
  ( (tuple2!13943 (_1!6982 (_ BitVec 64)) (_2!6982 V!33809)) )
))
(declare-datatypes ((List!19789 0))(
  ( (Nil!19786) (Cons!19785 (h!20953 tuple2!13942) (t!28144 List!19789)) )
))
(declare-datatypes ((ListLongMap!12641 0))(
  ( (ListLongMap!12642 (toList!6336 List!19789)) )
))
(declare-fun contains!5451 (ListLongMap!12641 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3569 (array!59350 array!59348 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) Int) ListLongMap!12641)

(assert (=> b!964967 (contains!5451 (getCurrentListMap!3569 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28539 _keys!1686) i!803))))

(declare-datatypes ((Unit!32228 0))(
  ( (Unit!32229) )
))
(declare-fun lt!431402 () Unit!32228)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!23 (array!59350 array!59348 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32228)

(assert (=> b!964967 (= lt!431402 (lemmaInListMapFromThenInFromSmaller!23 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun res!645600 () Bool)

(declare-fun e!544107 () Bool)

(assert (=> start!82852 (=> (not res!645600) (not e!544107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82852 (= res!645600 (validMask!0 mask!2110))))

(assert (=> start!82852 e!544107))

(assert (=> start!82852 true))

(declare-fun e!544108 () Bool)

(declare-fun array_inv!22173 (array!59348) Bool)

(assert (=> start!82852 (and (array_inv!22173 _values!1400) e!544108)))

(declare-fun array_inv!22174 (array!59350) Bool)

(assert (=> start!82852 (array_inv!22174 _keys!1686)))

(assert (=> start!82852 tp!65572))

(declare-fun tp_is_empty!21619 () Bool)

(assert (=> start!82852 tp_is_empty!21619))

(declare-fun b!964968 () Bool)

(declare-fun e!544109 () Bool)

(assert (=> b!964968 (= e!544109 tp_is_empty!21619)))

(declare-fun mapIsEmpty!34423 () Bool)

(declare-fun mapRes!34423 () Bool)

(assert (=> mapIsEmpty!34423 mapRes!34423))

(declare-fun b!964969 () Bool)

(declare-fun res!645597 () Bool)

(assert (=> b!964969 (=> (not res!645597) (not e!544107))))

(declare-datatypes ((List!19790 0))(
  ( (Nil!19787) (Cons!19786 (h!20954 (_ BitVec 64)) (t!28145 List!19790)) )
))
(declare-fun arrayNoDuplicates!0 (array!59350 (_ BitVec 32) List!19790) Bool)

(assert (=> b!964969 (= res!645597 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19787))))

(declare-fun b!964970 () Bool)

(declare-fun res!645598 () Bool)

(assert (=> b!964970 (=> (not res!645598) (not e!544107))))

(assert (=> b!964970 (= res!645598 (and (= (size!29018 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29019 _keys!1686) (size!29018 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964971 () Bool)

(declare-fun res!645603 () Bool)

(assert (=> b!964971 (=> (not res!645603) (not e!544107))))

(assert (=> b!964971 (= res!645603 (contains!5451 (getCurrentListMap!3569 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28539 _keys!1686) i!803)))))

(declare-fun b!964972 () Bool)

(declare-fun res!645595 () Bool)

(assert (=> b!964972 (=> (not res!645595) (not e!544107))))

(assert (=> b!964972 (= res!645595 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964973 () Bool)

(declare-fun e!544106 () Bool)

(assert (=> b!964973 (= e!544106 tp_is_empty!21619)))

(declare-fun mapNonEmpty!34423 () Bool)

(declare-fun tp!65571 () Bool)

(assert (=> mapNonEmpty!34423 (= mapRes!34423 (and tp!65571 e!544109))))

(declare-fun mapRest!34423 () (Array (_ BitVec 32) ValueCell!10328))

(declare-fun mapKey!34423 () (_ BitVec 32))

(declare-fun mapValue!34423 () ValueCell!10328)

(assert (=> mapNonEmpty!34423 (= (arr!28538 _values!1400) (store mapRest!34423 mapKey!34423 mapValue!34423))))

(declare-fun b!964974 () Bool)

(declare-fun res!645596 () Bool)

(assert (=> b!964974 (=> (not res!645596) (not e!544107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59350 (_ BitVec 32)) Bool)

(assert (=> b!964974 (= res!645596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964975 () Bool)

(assert (=> b!964975 (= e!544108 (and e!544106 mapRes!34423))))

(declare-fun condMapEmpty!34423 () Bool)

(declare-fun mapDefault!34423 () ValueCell!10328)

(assert (=> b!964975 (= condMapEmpty!34423 (= (arr!28538 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10328)) mapDefault!34423)))))

(declare-fun b!964976 () Bool)

(declare-fun res!645602 () Bool)

(assert (=> b!964976 (=> (not res!645602) (not e!544107))))

(assert (=> b!964976 (= res!645602 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29019 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29019 _keys!1686))))))

(declare-fun b!964977 () Bool)

(declare-fun res!645599 () Bool)

(assert (=> b!964977 (=> (not res!645599) (not e!544107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964977 (= res!645599 (validKeyInArray!0 (select (arr!28539 _keys!1686) i!803)))))

(declare-fun b!964978 () Bool)

(assert (=> b!964978 (= e!544107 (not e!544105))))

(declare-fun res!645601 () Bool)

(assert (=> b!964978 (=> res!645601 e!544105)))

(assert (=> b!964978 (= res!645601 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29019 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964978 (contains!5451 (getCurrentListMap!3569 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28539 _keys!1686) i!803))))

(declare-fun lt!431401 () Unit!32228)

(declare-fun lemmaInListMapFromThenInFromMinusOne!28 (array!59350 array!59348 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) (_ BitVec 32) Int) Unit!32228)

(assert (=> b!964978 (= lt!431401 (lemmaInListMapFromThenInFromMinusOne!28 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(assert (= (and start!82852 res!645600) b!964970))

(assert (= (and b!964970 res!645598) b!964974))

(assert (= (and b!964974 res!645596) b!964969))

(assert (= (and b!964969 res!645597) b!964976))

(assert (= (and b!964976 res!645602) b!964977))

(assert (= (and b!964977 res!645599) b!964971))

(assert (= (and b!964971 res!645603) b!964972))

(assert (= (and b!964972 res!645595) b!964978))

(assert (= (and b!964978 (not res!645601)) b!964967))

(assert (= (and b!964975 condMapEmpty!34423) mapIsEmpty!34423))

(assert (= (and b!964975 (not condMapEmpty!34423)) mapNonEmpty!34423))

(get-info :version)

(assert (= (and mapNonEmpty!34423 ((_ is ValueCellFull!10328) mapValue!34423)) b!964968))

(assert (= (and b!964975 ((_ is ValueCellFull!10328) mapDefault!34423)) b!964973))

(assert (= start!82852 b!964975))

(declare-fun m!894655 () Bool)

(assert (=> b!964967 m!894655))

(declare-fun m!894657 () Bool)

(assert (=> b!964967 m!894657))

(assert (=> b!964967 m!894655))

(assert (=> b!964967 m!894657))

(declare-fun m!894659 () Bool)

(assert (=> b!964967 m!894659))

(declare-fun m!894661 () Bool)

(assert (=> b!964967 m!894661))

(declare-fun m!894663 () Bool)

(assert (=> b!964978 m!894663))

(assert (=> b!964978 m!894657))

(assert (=> b!964978 m!894663))

(assert (=> b!964978 m!894657))

(declare-fun m!894665 () Bool)

(assert (=> b!964978 m!894665))

(declare-fun m!894667 () Bool)

(assert (=> b!964978 m!894667))

(declare-fun m!894669 () Bool)

(assert (=> start!82852 m!894669))

(declare-fun m!894671 () Bool)

(assert (=> start!82852 m!894671))

(declare-fun m!894673 () Bool)

(assert (=> start!82852 m!894673))

(declare-fun m!894675 () Bool)

(assert (=> b!964974 m!894675))

(declare-fun m!894677 () Bool)

(assert (=> b!964969 m!894677))

(declare-fun m!894679 () Bool)

(assert (=> mapNonEmpty!34423 m!894679))

(declare-fun m!894681 () Bool)

(assert (=> b!964971 m!894681))

(assert (=> b!964971 m!894657))

(assert (=> b!964971 m!894681))

(assert (=> b!964971 m!894657))

(declare-fun m!894683 () Bool)

(assert (=> b!964971 m!894683))

(assert (=> b!964977 m!894657))

(assert (=> b!964977 m!894657))

(declare-fun m!894685 () Bool)

(assert (=> b!964977 m!894685))

(check-sat (not b!964971) (not b!964977) (not mapNonEmpty!34423) (not b_next!18817) (not b!964967) (not b!964969) (not b!964978) tp_is_empty!21619 (not b!964974) b_and!30315 (not start!82852))
(check-sat b_and!30315 (not b_next!18817))
