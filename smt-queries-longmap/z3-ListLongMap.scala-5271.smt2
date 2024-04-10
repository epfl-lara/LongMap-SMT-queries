; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70778 () Bool)

(assert start!70778)

(declare-fun b_free!13035 () Bool)

(declare-fun b_next!13035 () Bool)

(assert (=> start!70778 (= b_free!13035 (not b_next!13035))))

(declare-fun tp!45850 () Bool)

(declare-fun b_and!21907 () Bool)

(assert (=> start!70778 (= tp!45850 b_and!21907)))

(declare-fun b!822094 () Bool)

(declare-fun e!457003 () Bool)

(declare-fun tp_is_empty!14745 () Bool)

(assert (=> b!822094 (= e!457003 tp_is_empty!14745)))

(declare-fun mapIsEmpty!23728 () Bool)

(declare-fun mapRes!23728 () Bool)

(assert (=> mapIsEmpty!23728 mapRes!23728))

(declare-fun b!822095 () Bool)

(declare-fun e!457004 () Bool)

(assert (=> b!822095 (= e!457004 true)))

(declare-datatypes ((V!24661 0))(
  ( (V!24662 (val!7420 Int)) )
))
(declare-datatypes ((tuple2!9796 0))(
  ( (tuple2!9797 (_1!4909 (_ BitVec 64)) (_2!4909 V!24661)) )
))
(declare-datatypes ((List!15611 0))(
  ( (Nil!15608) (Cons!15607 (h!16736 tuple2!9796) (t!21948 List!15611)) )
))
(declare-datatypes ((ListLongMap!8619 0))(
  ( (ListLongMap!8620 (toList!4325 List!15611)) )
))
(declare-fun lt!369680 () ListLongMap!8619)

(declare-fun lt!369684 () ListLongMap!8619)

(declare-fun lt!369678 () tuple2!9796)

(declare-fun +!1876 (ListLongMap!8619 tuple2!9796) ListLongMap!8619)

(assert (=> b!822095 (= lt!369680 (+!1876 lt!369684 lt!369678))))

(declare-fun zeroValueAfter!34 () V!24661)

(declare-fun minValue!754 () V!24661)

(declare-datatypes ((Unit!28114 0))(
  ( (Unit!28115) )
))
(declare-fun lt!369683 () Unit!28114)

(declare-fun lt!369682 () ListLongMap!8619)

(declare-fun addCommutativeForDiffKeys!439 (ListLongMap!8619 (_ BitVec 64) V!24661 (_ BitVec 64) V!24661) Unit!28114)

(assert (=> b!822095 (= lt!369683 (addCommutativeForDiffKeys!439 lt!369682 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369686 () ListLongMap!8619)

(assert (=> b!822095 (= lt!369686 lt!369680)))

(declare-fun lt!369681 () tuple2!9796)

(assert (=> b!822095 (= lt!369680 (+!1876 (+!1876 lt!369682 lt!369678) lt!369681))))

(assert (=> b!822095 (= lt!369678 (tuple2!9797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369685 () ListLongMap!8619)

(assert (=> b!822095 (= lt!369685 lt!369684)))

(assert (=> b!822095 (= lt!369684 (+!1876 lt!369682 lt!369681))))

(assert (=> b!822095 (= lt!369681 (tuple2!9797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45686 0))(
  ( (array!45687 (arr!21893 (Array (_ BitVec 32) (_ BitVec 64))) (size!22314 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45686)

(declare-datatypes ((ValueCell!6957 0))(
  ( (ValueCellFull!6957 (v!9851 V!24661)) (EmptyCell!6957) )
))
(declare-datatypes ((array!45688 0))(
  ( (array!45689 (arr!21894 (Array (_ BitVec 32) ValueCell!6957)) (size!22315 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45688)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2490 (array!45686 array!45688 (_ BitVec 32) (_ BitVec 32) V!24661 V!24661 (_ BitVec 32) Int) ListLongMap!8619)

(assert (=> b!822095 (= lt!369686 (getCurrentListMap!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24661)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822095 (= lt!369685 (getCurrentListMap!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822096 () Bool)

(declare-fun e!457001 () Bool)

(assert (=> b!822096 (= e!457001 tp_is_empty!14745)))

(declare-fun mapNonEmpty!23728 () Bool)

(declare-fun tp!45849 () Bool)

(assert (=> mapNonEmpty!23728 (= mapRes!23728 (and tp!45849 e!457001))))

(declare-fun mapValue!23728 () ValueCell!6957)

(declare-fun mapKey!23728 () (_ BitVec 32))

(declare-fun mapRest!23728 () (Array (_ BitVec 32) ValueCell!6957))

(assert (=> mapNonEmpty!23728 (= (arr!21894 _values!788) (store mapRest!23728 mapKey!23728 mapValue!23728))))

(declare-fun b!822097 () Bool)

(declare-fun e!457002 () Bool)

(assert (=> b!822097 (= e!457002 (and e!457003 mapRes!23728))))

(declare-fun condMapEmpty!23728 () Bool)

(declare-fun mapDefault!23728 () ValueCell!6957)

(assert (=> b!822097 (= condMapEmpty!23728 (= (arr!21894 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6957)) mapDefault!23728)))))

(declare-fun b!822098 () Bool)

(declare-fun res!560735 () Bool)

(declare-fun e!457000 () Bool)

(assert (=> b!822098 (=> (not res!560735) (not e!457000))))

(declare-datatypes ((List!15612 0))(
  ( (Nil!15609) (Cons!15608 (h!16737 (_ BitVec 64)) (t!21949 List!15612)) )
))
(declare-fun arrayNoDuplicates!0 (array!45686 (_ BitVec 32) List!15612) Bool)

(assert (=> b!822098 (= res!560735 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15609))))

(declare-fun b!822099 () Bool)

(declare-fun res!560738 () Bool)

(assert (=> b!822099 (=> (not res!560738) (not e!457000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45686 (_ BitVec 32)) Bool)

(assert (=> b!822099 (= res!560738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560737 () Bool)

(assert (=> start!70778 (=> (not res!560737) (not e!457000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70778 (= res!560737 (validMask!0 mask!1312))))

(assert (=> start!70778 e!457000))

(assert (=> start!70778 tp_is_empty!14745))

(declare-fun array_inv!17487 (array!45686) Bool)

(assert (=> start!70778 (array_inv!17487 _keys!976)))

(assert (=> start!70778 true))

(declare-fun array_inv!17488 (array!45688) Bool)

(assert (=> start!70778 (and (array_inv!17488 _values!788) e!457002)))

(assert (=> start!70778 tp!45850))

(declare-fun b!822100 () Bool)

(assert (=> b!822100 (= e!457000 (not e!457004))))

(declare-fun res!560736 () Bool)

(assert (=> b!822100 (=> res!560736 e!457004)))

(assert (=> b!822100 (= res!560736 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369687 () ListLongMap!8619)

(assert (=> b!822100 (= lt!369682 lt!369687)))

(declare-fun lt!369679 () Unit!28114)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!454 (array!45686 array!45688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24661 V!24661 V!24661 V!24661 (_ BitVec 32) Int) Unit!28114)

(assert (=> b!822100 (= lt!369679 (lemmaNoChangeToArrayThenSameMapNoExtras!454 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2344 (array!45686 array!45688 (_ BitVec 32) (_ BitVec 32) V!24661 V!24661 (_ BitVec 32) Int) ListLongMap!8619)

(assert (=> b!822100 (= lt!369687 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822100 (= lt!369682 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822101 () Bool)

(declare-fun res!560739 () Bool)

(assert (=> b!822101 (=> (not res!560739) (not e!457000))))

(assert (=> b!822101 (= res!560739 (and (= (size!22315 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22314 _keys!976) (size!22315 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70778 res!560737) b!822101))

(assert (= (and b!822101 res!560739) b!822099))

(assert (= (and b!822099 res!560738) b!822098))

(assert (= (and b!822098 res!560735) b!822100))

(assert (= (and b!822100 (not res!560736)) b!822095))

(assert (= (and b!822097 condMapEmpty!23728) mapIsEmpty!23728))

(assert (= (and b!822097 (not condMapEmpty!23728)) mapNonEmpty!23728))

(get-info :version)

(assert (= (and mapNonEmpty!23728 ((_ is ValueCellFull!6957) mapValue!23728)) b!822096))

(assert (= (and b!822097 ((_ is ValueCellFull!6957) mapDefault!23728)) b!822094))

(assert (= start!70778 b!822097))

(declare-fun m!763833 () Bool)

(assert (=> start!70778 m!763833))

(declare-fun m!763835 () Bool)

(assert (=> start!70778 m!763835))

(declare-fun m!763837 () Bool)

(assert (=> start!70778 m!763837))

(declare-fun m!763839 () Bool)

(assert (=> mapNonEmpty!23728 m!763839))

(declare-fun m!763841 () Bool)

(assert (=> b!822100 m!763841))

(declare-fun m!763843 () Bool)

(assert (=> b!822100 m!763843))

(declare-fun m!763845 () Bool)

(assert (=> b!822100 m!763845))

(declare-fun m!763847 () Bool)

(assert (=> b!822098 m!763847))

(declare-fun m!763849 () Bool)

(assert (=> b!822095 m!763849))

(declare-fun m!763851 () Bool)

(assert (=> b!822095 m!763851))

(declare-fun m!763853 () Bool)

(assert (=> b!822095 m!763853))

(declare-fun m!763855 () Bool)

(assert (=> b!822095 m!763855))

(declare-fun m!763857 () Bool)

(assert (=> b!822095 m!763857))

(declare-fun m!763859 () Bool)

(assert (=> b!822095 m!763859))

(assert (=> b!822095 m!763851))

(declare-fun m!763861 () Bool)

(assert (=> b!822095 m!763861))

(declare-fun m!763863 () Bool)

(assert (=> b!822099 m!763863))

(check-sat (not b!822098) (not mapNonEmpty!23728) (not b!822095) (not b!822099) b_and!21907 (not b!822100) (not start!70778) (not b_next!13035) tp_is_empty!14745)
(check-sat b_and!21907 (not b_next!13035))
