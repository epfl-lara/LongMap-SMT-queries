; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70784 () Bool)

(assert start!70784)

(declare-fun b_free!13041 () Bool)

(declare-fun b_next!13041 () Bool)

(assert (=> start!70784 (= b_free!13041 (not b_next!13041))))

(declare-fun tp!45867 () Bool)

(declare-fun b_and!21913 () Bool)

(assert (=> start!70784 (= tp!45867 b_and!21913)))

(declare-fun mapIsEmpty!23737 () Bool)

(declare-fun mapRes!23737 () Bool)

(assert (=> mapIsEmpty!23737 mapRes!23737))

(declare-fun b!822166 () Bool)

(declare-fun e!457054 () Bool)

(assert (=> b!822166 (= e!457054 true)))

(declare-datatypes ((V!24669 0))(
  ( (V!24670 (val!7423 Int)) )
))
(declare-datatypes ((tuple2!9800 0))(
  ( (tuple2!9801 (_1!4911 (_ BitVec 64)) (_2!4911 V!24669)) )
))
(declare-datatypes ((List!15615 0))(
  ( (Nil!15612) (Cons!15611 (h!16740 tuple2!9800) (t!21952 List!15615)) )
))
(declare-datatypes ((ListLongMap!8623 0))(
  ( (ListLongMap!8624 (toList!4327 List!15615)) )
))
(declare-fun lt!369776 () ListLongMap!8623)

(declare-fun lt!369770 () ListLongMap!8623)

(declare-fun lt!369773 () tuple2!9800)

(declare-fun +!1878 (ListLongMap!8623 tuple2!9800) ListLongMap!8623)

(assert (=> b!822166 (= lt!369776 (+!1878 lt!369770 lt!369773))))

(declare-fun zeroValueAfter!34 () V!24669)

(declare-fun minValue!754 () V!24669)

(declare-datatypes ((Unit!28118 0))(
  ( (Unit!28119) )
))
(declare-fun lt!369771 () Unit!28118)

(declare-fun lt!369768 () ListLongMap!8623)

(declare-fun addCommutativeForDiffKeys!441 (ListLongMap!8623 (_ BitVec 64) V!24669 (_ BitVec 64) V!24669) Unit!28118)

(assert (=> b!822166 (= lt!369771 (addCommutativeForDiffKeys!441 lt!369768 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369777 () ListLongMap!8623)

(assert (=> b!822166 (= lt!369777 lt!369776)))

(declare-fun lt!369775 () tuple2!9800)

(assert (=> b!822166 (= lt!369776 (+!1878 (+!1878 lt!369768 lt!369773) lt!369775))))

(assert (=> b!822166 (= lt!369773 (tuple2!9801 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369769 () ListLongMap!8623)

(assert (=> b!822166 (= lt!369769 lt!369770)))

(assert (=> b!822166 (= lt!369770 (+!1878 lt!369768 lt!369775))))

(assert (=> b!822166 (= lt!369775 (tuple2!9801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((ValueCell!6960 0))(
  ( (ValueCellFull!6960 (v!9854 V!24669)) (EmptyCell!6960) )
))
(declare-datatypes ((array!45696 0))(
  ( (array!45697 (arr!21898 (Array (_ BitVec 32) ValueCell!6960)) (size!22319 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45696)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!45698 0))(
  ( (array!45699 (arr!21899 (Array (_ BitVec 32) (_ BitVec 64))) (size!22320 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45698)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun getCurrentListMap!2492 (array!45698 array!45696 (_ BitVec 32) (_ BitVec 32) V!24669 V!24669 (_ BitVec 32) Int) ListLongMap!8623)

(assert (=> b!822166 (= lt!369777 (getCurrentListMap!2492 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24669)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822166 (= lt!369769 (getCurrentListMap!2492 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822167 () Bool)

(declare-fun e!457055 () Bool)

(declare-fun tp_is_empty!14751 () Bool)

(assert (=> b!822167 (= e!457055 tp_is_empty!14751)))

(declare-fun b!822168 () Bool)

(declare-fun e!457056 () Bool)

(assert (=> b!822168 (= e!457056 (not e!457054))))

(declare-fun res!560781 () Bool)

(assert (=> b!822168 (=> res!560781 e!457054)))

(assert (=> b!822168 (= res!560781 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369774 () ListLongMap!8623)

(assert (=> b!822168 (= lt!369768 lt!369774)))

(declare-fun lt!369772 () Unit!28118)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!456 (array!45698 array!45696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24669 V!24669 V!24669 V!24669 (_ BitVec 32) Int) Unit!28118)

(assert (=> b!822168 (= lt!369772 (lemmaNoChangeToArrayThenSameMapNoExtras!456 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2346 (array!45698 array!45696 (_ BitVec 32) (_ BitVec 32) V!24669 V!24669 (_ BitVec 32) Int) ListLongMap!8623)

(assert (=> b!822168 (= lt!369774 (getCurrentListMapNoExtraKeys!2346 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822168 (= lt!369768 (getCurrentListMapNoExtraKeys!2346 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23737 () Bool)

(declare-fun tp!45868 () Bool)

(declare-fun e!457059 () Bool)

(assert (=> mapNonEmpty!23737 (= mapRes!23737 (and tp!45868 e!457059))))

(declare-fun mapKey!23737 () (_ BitVec 32))

(declare-fun mapRest!23737 () (Array (_ BitVec 32) ValueCell!6960))

(declare-fun mapValue!23737 () ValueCell!6960)

(assert (=> mapNonEmpty!23737 (= (arr!21898 _values!788) (store mapRest!23737 mapKey!23737 mapValue!23737))))

(declare-fun b!822169 () Bool)

(declare-fun res!560784 () Bool)

(assert (=> b!822169 (=> (not res!560784) (not e!457056))))

(assert (=> b!822169 (= res!560784 (and (= (size!22319 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22320 _keys!976) (size!22319 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822170 () Bool)

(assert (=> b!822170 (= e!457059 tp_is_empty!14751)))

(declare-fun b!822171 () Bool)

(declare-fun e!457058 () Bool)

(assert (=> b!822171 (= e!457058 (and e!457055 mapRes!23737))))

(declare-fun condMapEmpty!23737 () Bool)

(declare-fun mapDefault!23737 () ValueCell!6960)

(assert (=> b!822171 (= condMapEmpty!23737 (= (arr!21898 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6960)) mapDefault!23737)))))

(declare-fun res!560780 () Bool)

(assert (=> start!70784 (=> (not res!560780) (not e!457056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70784 (= res!560780 (validMask!0 mask!1312))))

(assert (=> start!70784 e!457056))

(assert (=> start!70784 tp_is_empty!14751))

(declare-fun array_inv!17491 (array!45698) Bool)

(assert (=> start!70784 (array_inv!17491 _keys!976)))

(assert (=> start!70784 true))

(declare-fun array_inv!17492 (array!45696) Bool)

(assert (=> start!70784 (and (array_inv!17492 _values!788) e!457058)))

(assert (=> start!70784 tp!45867))

(declare-fun b!822172 () Bool)

(declare-fun res!560782 () Bool)

(assert (=> b!822172 (=> (not res!560782) (not e!457056))))

(declare-datatypes ((List!15616 0))(
  ( (Nil!15613) (Cons!15612 (h!16741 (_ BitVec 64)) (t!21953 List!15616)) )
))
(declare-fun arrayNoDuplicates!0 (array!45698 (_ BitVec 32) List!15616) Bool)

(assert (=> b!822172 (= res!560782 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15613))))

(declare-fun b!822173 () Bool)

(declare-fun res!560783 () Bool)

(assert (=> b!822173 (=> (not res!560783) (not e!457056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45698 (_ BitVec 32)) Bool)

(assert (=> b!822173 (= res!560783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70784 res!560780) b!822169))

(assert (= (and b!822169 res!560784) b!822173))

(assert (= (and b!822173 res!560783) b!822172))

(assert (= (and b!822172 res!560782) b!822168))

(assert (= (and b!822168 (not res!560781)) b!822166))

(assert (= (and b!822171 condMapEmpty!23737) mapIsEmpty!23737))

(assert (= (and b!822171 (not condMapEmpty!23737)) mapNonEmpty!23737))

(get-info :version)

(assert (= (and mapNonEmpty!23737 ((_ is ValueCellFull!6960) mapValue!23737)) b!822170))

(assert (= (and b!822171 ((_ is ValueCellFull!6960) mapDefault!23737)) b!822167))

(assert (= start!70784 b!822171))

(declare-fun m!763929 () Bool)

(assert (=> b!822172 m!763929))

(declare-fun m!763931 () Bool)

(assert (=> b!822166 m!763931))

(declare-fun m!763933 () Bool)

(assert (=> b!822166 m!763933))

(declare-fun m!763935 () Bool)

(assert (=> b!822166 m!763935))

(assert (=> b!822166 m!763931))

(declare-fun m!763937 () Bool)

(assert (=> b!822166 m!763937))

(declare-fun m!763939 () Bool)

(assert (=> b!822166 m!763939))

(declare-fun m!763941 () Bool)

(assert (=> b!822166 m!763941))

(declare-fun m!763943 () Bool)

(assert (=> b!822166 m!763943))

(declare-fun m!763945 () Bool)

(assert (=> b!822168 m!763945))

(declare-fun m!763947 () Bool)

(assert (=> b!822168 m!763947))

(declare-fun m!763949 () Bool)

(assert (=> b!822168 m!763949))

(declare-fun m!763951 () Bool)

(assert (=> b!822173 m!763951))

(declare-fun m!763953 () Bool)

(assert (=> mapNonEmpty!23737 m!763953))

(declare-fun m!763955 () Bool)

(assert (=> start!70784 m!763955))

(declare-fun m!763957 () Bool)

(assert (=> start!70784 m!763957))

(declare-fun m!763959 () Bool)

(assert (=> start!70784 m!763959))

(check-sat (not b!822166) b_and!21913 (not b!822168) (not b_next!13041) (not start!70784) (not b!822173) (not b!822172) (not mapNonEmpty!23737) tp_is_empty!14751)
(check-sat b_and!21913 (not b_next!13041))
