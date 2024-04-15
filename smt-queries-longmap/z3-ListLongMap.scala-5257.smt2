; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70642 () Bool)

(assert start!70642)

(declare-fun b_free!12949 () Bool)

(declare-fun b_next!12949 () Bool)

(assert (=> start!70642 (= b_free!12949 (not b_next!12949))))

(declare-fun tp!45585 () Bool)

(declare-fun b_and!21777 () Bool)

(assert (=> start!70642 (= tp!45585 b_and!21777)))

(declare-fun b!820599 () Bool)

(declare-fun e!455946 () Bool)

(declare-fun tp_is_empty!14659 () Bool)

(assert (=> b!820599 (= e!455946 tp_is_empty!14659)))

(declare-fun mapIsEmpty!23593 () Bool)

(declare-fun mapRes!23593 () Bool)

(assert (=> mapIsEmpty!23593 mapRes!23593))

(declare-fun b!820600 () Bool)

(declare-fun res!559911 () Bool)

(declare-fun e!455945 () Bool)

(assert (=> b!820600 (=> (not res!559911) (not e!455945))))

(declare-datatypes ((array!45485 0))(
  ( (array!45486 (arr!21795 (Array (_ BitVec 32) (_ BitVec 64))) (size!22216 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45485)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!24547 0))(
  ( (V!24548 (val!7377 Int)) )
))
(declare-datatypes ((ValueCell!6914 0))(
  ( (ValueCellFull!6914 (v!9802 V!24547)) (EmptyCell!6914) )
))
(declare-datatypes ((array!45487 0))(
  ( (array!45488 (arr!21796 (Array (_ BitVec 32) ValueCell!6914)) (size!22217 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45487)

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!820600 (= res!559911 (and (= (size!22217 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22216 _keys!976) (size!22217 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820601 () Bool)

(declare-fun res!559913 () Bool)

(assert (=> b!820601 (=> (not res!559913) (not e!455945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45485 (_ BitVec 32)) Bool)

(assert (=> b!820601 (= res!559913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820603 () Bool)

(declare-fun e!455944 () Bool)

(assert (=> b!820603 (= e!455944 tp_is_empty!14659)))

(declare-fun b!820604 () Bool)

(assert (=> b!820604 (= e!455945 (not true))))

(declare-datatypes ((tuple2!9736 0))(
  ( (tuple2!9737 (_1!4879 (_ BitVec 64)) (_2!4879 V!24547)) )
))
(declare-datatypes ((List!15549 0))(
  ( (Nil!15546) (Cons!15545 (h!16674 tuple2!9736) (t!21873 List!15549)) )
))
(declare-datatypes ((ListLongMap!8549 0))(
  ( (ListLongMap!8550 (toList!4290 List!15549)) )
))
(declare-fun lt!368698 () ListLongMap!8549)

(declare-fun lt!368696 () ListLongMap!8549)

(assert (=> b!820604 (= lt!368698 lt!368696)))

(declare-fun zeroValueBefore!34 () V!24547)

(declare-fun zeroValueAfter!34 () V!24547)

(declare-fun minValue!754 () V!24547)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28009 0))(
  ( (Unit!28010) )
))
(declare-fun lt!368697 () Unit!28009)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!435 (array!45485 array!45487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24547 V!24547 V!24547 V!24547 (_ BitVec 32) Int) Unit!28009)

(assert (=> b!820604 (= lt!368697 (lemmaNoChangeToArrayThenSameMapNoExtras!435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2342 (array!45485 array!45487 (_ BitVec 32) (_ BitVec 32) V!24547 V!24547 (_ BitVec 32) Int) ListLongMap!8549)

(assert (=> b!820604 (= lt!368696 (getCurrentListMapNoExtraKeys!2342 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820604 (= lt!368698 (getCurrentListMapNoExtraKeys!2342 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820605 () Bool)

(declare-fun res!559914 () Bool)

(assert (=> b!820605 (=> (not res!559914) (not e!455945))))

(declare-datatypes ((List!15550 0))(
  ( (Nil!15547) (Cons!15546 (h!16675 (_ BitVec 64)) (t!21874 List!15550)) )
))
(declare-fun arrayNoDuplicates!0 (array!45485 (_ BitVec 32) List!15550) Bool)

(assert (=> b!820605 (= res!559914 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15547))))

(declare-fun mapNonEmpty!23593 () Bool)

(declare-fun tp!45586 () Bool)

(assert (=> mapNonEmpty!23593 (= mapRes!23593 (and tp!45586 e!455944))))

(declare-fun mapKey!23593 () (_ BitVec 32))

(declare-fun mapRest!23593 () (Array (_ BitVec 32) ValueCell!6914))

(declare-fun mapValue!23593 () ValueCell!6914)

(assert (=> mapNonEmpty!23593 (= (arr!21796 _values!788) (store mapRest!23593 mapKey!23593 mapValue!23593))))

(declare-fun res!559912 () Bool)

(assert (=> start!70642 (=> (not res!559912) (not e!455945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70642 (= res!559912 (validMask!0 mask!1312))))

(assert (=> start!70642 e!455945))

(assert (=> start!70642 tp_is_empty!14659))

(declare-fun array_inv!17483 (array!45485) Bool)

(assert (=> start!70642 (array_inv!17483 _keys!976)))

(assert (=> start!70642 true))

(declare-fun e!455943 () Bool)

(declare-fun array_inv!17484 (array!45487) Bool)

(assert (=> start!70642 (and (array_inv!17484 _values!788) e!455943)))

(assert (=> start!70642 tp!45585))

(declare-fun b!820602 () Bool)

(assert (=> b!820602 (= e!455943 (and e!455946 mapRes!23593))))

(declare-fun condMapEmpty!23593 () Bool)

(declare-fun mapDefault!23593 () ValueCell!6914)

(assert (=> b!820602 (= condMapEmpty!23593 (= (arr!21796 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6914)) mapDefault!23593)))))

(assert (= (and start!70642 res!559912) b!820600))

(assert (= (and b!820600 res!559911) b!820601))

(assert (= (and b!820601 res!559913) b!820605))

(assert (= (and b!820605 res!559914) b!820604))

(assert (= (and b!820602 condMapEmpty!23593) mapIsEmpty!23593))

(assert (= (and b!820602 (not condMapEmpty!23593)) mapNonEmpty!23593))

(get-info :version)

(assert (= (and mapNonEmpty!23593 ((_ is ValueCellFull!6914) mapValue!23593)) b!820603))

(assert (= (and b!820602 ((_ is ValueCellFull!6914) mapDefault!23593)) b!820599))

(assert (= start!70642 b!820602))

(declare-fun m!761989 () Bool)

(assert (=> b!820604 m!761989))

(declare-fun m!761991 () Bool)

(assert (=> b!820604 m!761991))

(declare-fun m!761993 () Bool)

(assert (=> b!820604 m!761993))

(declare-fun m!761995 () Bool)

(assert (=> b!820605 m!761995))

(declare-fun m!761997 () Bool)

(assert (=> mapNonEmpty!23593 m!761997))

(declare-fun m!761999 () Bool)

(assert (=> b!820601 m!761999))

(declare-fun m!762001 () Bool)

(assert (=> start!70642 m!762001))

(declare-fun m!762003 () Bool)

(assert (=> start!70642 m!762003))

(declare-fun m!762005 () Bool)

(assert (=> start!70642 m!762005))

(check-sat (not b!820605) b_and!21777 (not mapNonEmpty!23593) tp_is_empty!14659 (not b!820604) (not b_next!12949) (not start!70642) (not b!820601))
(check-sat b_and!21777 (not b_next!12949))
