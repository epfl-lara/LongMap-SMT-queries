; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70852 () Bool)

(assert start!70852)

(declare-fun b_free!13089 () Bool)

(declare-fun b_next!13089 () Bool)

(assert (=> start!70852 (= b_free!13089 (not b_next!13089))))

(declare-fun tp!46015 () Bool)

(declare-fun b_and!21973 () Bool)

(assert (=> start!70852 (= tp!46015 b_and!21973)))

(declare-fun b!822923 () Bool)

(declare-fun res!561219 () Bool)

(declare-fun e!457599 () Bool)

(assert (=> b!822923 (=> (not res!561219) (not e!457599))))

(declare-datatypes ((array!45792 0))(
  ( (array!45793 (arr!21945 (Array (_ BitVec 32) (_ BitVec 64))) (size!22366 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45792)

(declare-datatypes ((List!15654 0))(
  ( (Nil!15651) (Cons!15650 (h!16779 (_ BitVec 64)) (t!21993 List!15654)) )
))
(declare-fun arrayNoDuplicates!0 (array!45792 (_ BitVec 32) List!15654) Bool)

(assert (=> b!822923 (= res!561219 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15651))))

(declare-fun b!822924 () Bool)

(declare-fun e!457602 () Bool)

(assert (=> b!822924 (= e!457599 (not e!457602))))

(declare-fun res!561222 () Bool)

(assert (=> b!822924 (=> res!561222 e!457602)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822924 (= res!561222 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24733 0))(
  ( (V!24734 (val!7447 Int)) )
))
(declare-datatypes ((tuple2!9840 0))(
  ( (tuple2!9841 (_1!4931 (_ BitVec 64)) (_2!4931 V!24733)) )
))
(declare-datatypes ((List!15655 0))(
  ( (Nil!15652) (Cons!15651 (h!16780 tuple2!9840) (t!21994 List!15655)) )
))
(declare-datatypes ((ListLongMap!8663 0))(
  ( (ListLongMap!8664 (toList!4347 List!15655)) )
))
(declare-fun lt!370643 () ListLongMap!8663)

(declare-fun lt!370646 () ListLongMap!8663)

(assert (=> b!822924 (= lt!370643 lt!370646)))

(declare-fun zeroValueBefore!34 () V!24733)

(declare-fun zeroValueAfter!34 () V!24733)

(declare-fun minValue!754 () V!24733)

(declare-datatypes ((ValueCell!6984 0))(
  ( (ValueCellFull!6984 (v!9879 V!24733)) (EmptyCell!6984) )
))
(declare-datatypes ((array!45794 0))(
  ( (array!45795 (arr!21946 (Array (_ BitVec 32) ValueCell!6984)) (size!22367 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45794)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28160 0))(
  ( (Unit!28161) )
))
(declare-fun lt!370645 () Unit!28160)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!475 (array!45792 array!45794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24733 V!24733 V!24733 V!24733 (_ BitVec 32) Int) Unit!28160)

(assert (=> b!822924 (= lt!370645 (lemmaNoChangeToArrayThenSameMapNoExtras!475 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2365 (array!45792 array!45794 (_ BitVec 32) (_ BitVec 32) V!24733 V!24733 (_ BitVec 32) Int) ListLongMap!8663)

(assert (=> b!822924 (= lt!370646 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822924 (= lt!370643 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822925 () Bool)

(declare-fun e!457601 () Bool)

(declare-fun tp_is_empty!14799 () Bool)

(assert (=> b!822925 (= e!457601 tp_is_empty!14799)))

(declare-fun b!822926 () Bool)

(declare-fun e!457600 () Bool)

(assert (=> b!822926 (= e!457600 tp_is_empty!14799)))

(declare-fun b!822927 () Bool)

(declare-fun res!561221 () Bool)

(assert (=> b!822927 (=> (not res!561221) (not e!457599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45792 (_ BitVec 32)) Bool)

(assert (=> b!822927 (= res!561221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822928 () Bool)

(declare-fun res!561223 () Bool)

(assert (=> b!822928 (=> (not res!561223) (not e!457599))))

(assert (=> b!822928 (= res!561223 (and (= (size!22367 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22366 _keys!976) (size!22367 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23812 () Bool)

(declare-fun mapRes!23812 () Bool)

(declare-fun tp!46014 () Bool)

(assert (=> mapNonEmpty!23812 (= mapRes!23812 (and tp!46014 e!457600))))

(declare-fun mapRest!23812 () (Array (_ BitVec 32) ValueCell!6984))

(declare-fun mapKey!23812 () (_ BitVec 32))

(declare-fun mapValue!23812 () ValueCell!6984)

(assert (=> mapNonEmpty!23812 (= (arr!21946 _values!788) (store mapRest!23812 mapKey!23812 mapValue!23812))))

(declare-fun b!822929 () Bool)

(declare-fun e!457603 () Bool)

(assert (=> b!822929 (= e!457603 (and e!457601 mapRes!23812))))

(declare-fun condMapEmpty!23812 () Bool)

(declare-fun mapDefault!23812 () ValueCell!6984)

(assert (=> b!822929 (= condMapEmpty!23812 (= (arr!21946 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6984)) mapDefault!23812)))))

(declare-fun res!561220 () Bool)

(assert (=> start!70852 (=> (not res!561220) (not e!457599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70852 (= res!561220 (validMask!0 mask!1312))))

(assert (=> start!70852 e!457599))

(assert (=> start!70852 tp_is_empty!14799))

(declare-fun array_inv!17529 (array!45792) Bool)

(assert (=> start!70852 (array_inv!17529 _keys!976)))

(assert (=> start!70852 true))

(declare-fun array_inv!17530 (array!45794) Bool)

(assert (=> start!70852 (and (array_inv!17530 _values!788) e!457603)))

(assert (=> start!70852 tp!46015))

(declare-fun mapIsEmpty!23812 () Bool)

(assert (=> mapIsEmpty!23812 mapRes!23812))

(declare-fun b!822930 () Bool)

(assert (=> b!822930 (= e!457602 true)))

(declare-fun lt!370648 () ListLongMap!8663)

(declare-fun lt!370652 () ListLongMap!8663)

(declare-fun lt!370651 () tuple2!9840)

(declare-fun +!1896 (ListLongMap!8663 tuple2!9840) ListLongMap!8663)

(assert (=> b!822930 (= lt!370648 (+!1896 lt!370652 lt!370651))))

(declare-fun lt!370650 () Unit!28160)

(declare-fun addCommutativeForDiffKeys!459 (ListLongMap!8663 (_ BitVec 64) V!24733 (_ BitVec 64) V!24733) Unit!28160)

(assert (=> b!822930 (= lt!370650 (addCommutativeForDiffKeys!459 lt!370643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370644 () ListLongMap!8663)

(assert (=> b!822930 (= lt!370644 lt!370648)))

(declare-fun lt!370647 () tuple2!9840)

(assert (=> b!822930 (= lt!370648 (+!1896 (+!1896 lt!370643 lt!370651) lt!370647))))

(assert (=> b!822930 (= lt!370651 (tuple2!9841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370649 () ListLongMap!8663)

(assert (=> b!822930 (= lt!370649 lt!370652)))

(assert (=> b!822930 (= lt!370652 (+!1896 lt!370643 lt!370647))))

(assert (=> b!822930 (= lt!370647 (tuple2!9841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2510 (array!45792 array!45794 (_ BitVec 32) (_ BitVec 32) V!24733 V!24733 (_ BitVec 32) Int) ListLongMap!8663)

(assert (=> b!822930 (= lt!370644 (getCurrentListMap!2510 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822930 (= lt!370649 (getCurrentListMap!2510 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70852 res!561220) b!822928))

(assert (= (and b!822928 res!561223) b!822927))

(assert (= (and b!822927 res!561221) b!822923))

(assert (= (and b!822923 res!561219) b!822924))

(assert (= (and b!822924 (not res!561222)) b!822930))

(assert (= (and b!822929 condMapEmpty!23812) mapIsEmpty!23812))

(assert (= (and b!822929 (not condMapEmpty!23812)) mapNonEmpty!23812))

(get-info :version)

(assert (= (and mapNonEmpty!23812 ((_ is ValueCellFull!6984) mapValue!23812)) b!822926))

(assert (= (and b!822929 ((_ is ValueCellFull!6984) mapDefault!23812)) b!822925))

(assert (= start!70852 b!822929))

(declare-fun m!764913 () Bool)

(assert (=> start!70852 m!764913))

(declare-fun m!764915 () Bool)

(assert (=> start!70852 m!764915))

(declare-fun m!764917 () Bool)

(assert (=> start!70852 m!764917))

(declare-fun m!764919 () Bool)

(assert (=> b!822930 m!764919))

(declare-fun m!764921 () Bool)

(assert (=> b!822930 m!764921))

(declare-fun m!764923 () Bool)

(assert (=> b!822930 m!764923))

(declare-fun m!764925 () Bool)

(assert (=> b!822930 m!764925))

(declare-fun m!764927 () Bool)

(assert (=> b!822930 m!764927))

(assert (=> b!822930 m!764923))

(declare-fun m!764929 () Bool)

(assert (=> b!822930 m!764929))

(declare-fun m!764931 () Bool)

(assert (=> b!822930 m!764931))

(declare-fun m!764933 () Bool)

(assert (=> b!822927 m!764933))

(declare-fun m!764935 () Bool)

(assert (=> b!822923 m!764935))

(declare-fun m!764937 () Bool)

(assert (=> mapNonEmpty!23812 m!764937))

(declare-fun m!764939 () Bool)

(assert (=> b!822924 m!764939))

(declare-fun m!764941 () Bool)

(assert (=> b!822924 m!764941))

(declare-fun m!764943 () Bool)

(assert (=> b!822924 m!764943))

(check-sat (not mapNonEmpty!23812) (not b_next!13089) (not b!822923) (not b!822927) (not b!822924) b_and!21973 tp_is_empty!14799 (not start!70852) (not b!822930))
(check-sat b_and!21973 (not b_next!13089))
