; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70936 () Bool)

(assert start!70936)

(declare-fun b_free!13027 () Bool)

(declare-fun b_next!13027 () Bool)

(assert (=> start!70936 (= b_free!13027 (not b_next!13027))))

(declare-fun tp!45826 () Bool)

(declare-fun b_and!21909 () Bool)

(assert (=> start!70936 (= tp!45826 b_and!21909)))

(declare-fun mapNonEmpty!23716 () Bool)

(declare-fun mapRes!23716 () Bool)

(declare-fun tp!45825 () Bool)

(declare-fun e!457509 () Bool)

(assert (=> mapNonEmpty!23716 (= mapRes!23716 (and tp!45825 e!457509))))

(declare-datatypes ((V!24651 0))(
  ( (V!24652 (val!7416 Int)) )
))
(declare-datatypes ((ValueCell!6953 0))(
  ( (ValueCellFull!6953 (v!9847 V!24651)) (EmptyCell!6953) )
))
(declare-fun mapRest!23716 () (Array (_ BitVec 32) ValueCell!6953))

(declare-datatypes ((array!45673 0))(
  ( (array!45674 (arr!21882 (Array (_ BitVec 32) ValueCell!6953)) (size!22302 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45673)

(declare-fun mapValue!23716 () ValueCell!6953)

(declare-fun mapKey!23716 () (_ BitVec 32))

(assert (=> mapNonEmpty!23716 (= (arr!21882 _values!788) (store mapRest!23716 mapKey!23716 mapValue!23716))))

(declare-fun b!822892 () Bool)

(declare-fun res!561025 () Bool)

(declare-fun e!457510 () Bool)

(assert (=> b!822892 (=> (not res!561025) (not e!457510))))

(declare-datatypes ((array!45675 0))(
  ( (array!45676 (arr!21883 (Array (_ BitVec 32) (_ BitVec 64))) (size!22303 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45675)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45675 (_ BitVec 32)) Bool)

(assert (=> b!822892 (= res!561025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822893 () Bool)

(declare-fun tp_is_empty!14737 () Bool)

(assert (=> b!822893 (= e!457509 tp_is_empty!14737)))

(declare-fun b!822894 () Bool)

(declare-fun e!457507 () Bool)

(assert (=> b!822894 (= e!457510 (not e!457507))))

(declare-fun res!561023 () Bool)

(assert (=> b!822894 (=> res!561023 e!457507)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822894 (= res!561023 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9708 0))(
  ( (tuple2!9709 (_1!4865 (_ BitVec 64)) (_2!4865 V!24651)) )
))
(declare-datatypes ((List!15498 0))(
  ( (Nil!15495) (Cons!15494 (h!16629 tuple2!9708) (t!21827 List!15498)) )
))
(declare-datatypes ((ListLongMap!8533 0))(
  ( (ListLongMap!8534 (toList!4282 List!15498)) )
))
(declare-fun lt!369917 () ListLongMap!8533)

(declare-fun lt!369912 () ListLongMap!8533)

(assert (=> b!822894 (= lt!369917 lt!369912)))

(declare-fun zeroValueBefore!34 () V!24651)

(declare-fun zeroValueAfter!34 () V!24651)

(declare-fun minValue!754 () V!24651)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28113 0))(
  ( (Unit!28114) )
))
(declare-fun lt!369919 () Unit!28113)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!459 (array!45675 array!45673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 V!24651 V!24651 (_ BitVec 32) Int) Unit!28113)

(assert (=> b!822894 (= lt!369919 (lemmaNoChangeToArrayThenSameMapNoExtras!459 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2371 (array!45675 array!45673 (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 (_ BitVec 32) Int) ListLongMap!8533)

(assert (=> b!822894 (= lt!369912 (getCurrentListMapNoExtraKeys!2371 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822894 (= lt!369917 (getCurrentListMapNoExtraKeys!2371 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23716 () Bool)

(assert (=> mapIsEmpty!23716 mapRes!23716))

(declare-fun b!822895 () Bool)

(declare-fun res!561022 () Bool)

(assert (=> b!822895 (=> (not res!561022) (not e!457510))))

(declare-datatypes ((List!15499 0))(
  ( (Nil!15496) (Cons!15495 (h!16630 (_ BitVec 64)) (t!21828 List!15499)) )
))
(declare-fun arrayNoDuplicates!0 (array!45675 (_ BitVec 32) List!15499) Bool)

(assert (=> b!822895 (= res!561022 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15496))))

(declare-fun res!561024 () Bool)

(assert (=> start!70936 (=> (not res!561024) (not e!457510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70936 (= res!561024 (validMask!0 mask!1312))))

(assert (=> start!70936 e!457510))

(assert (=> start!70936 tp_is_empty!14737))

(declare-fun array_inv!17511 (array!45675) Bool)

(assert (=> start!70936 (array_inv!17511 _keys!976)))

(assert (=> start!70936 true))

(declare-fun e!457506 () Bool)

(declare-fun array_inv!17512 (array!45673) Bool)

(assert (=> start!70936 (and (array_inv!17512 _values!788) e!457506)))

(assert (=> start!70936 tp!45826))

(declare-fun b!822896 () Bool)

(assert (=> b!822896 (= e!457507 true)))

(declare-fun lt!369915 () ListLongMap!8533)

(declare-fun lt!369914 () ListLongMap!8533)

(declare-fun lt!369916 () tuple2!9708)

(declare-fun +!1872 (ListLongMap!8533 tuple2!9708) ListLongMap!8533)

(assert (=> b!822896 (= lt!369915 (+!1872 lt!369914 lt!369916))))

(declare-fun lt!369913 () Unit!28113)

(declare-fun addCommutativeForDiffKeys!430 (ListLongMap!8533 (_ BitVec 64) V!24651 (_ BitVec 64) V!24651) Unit!28113)

(assert (=> b!822896 (= lt!369913 (addCommutativeForDiffKeys!430 lt!369917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369920 () ListLongMap!8533)

(assert (=> b!822896 (= lt!369920 lt!369915)))

(declare-fun lt!369921 () tuple2!9708)

(assert (=> b!822896 (= lt!369915 (+!1872 (+!1872 lt!369917 lt!369916) lt!369921))))

(assert (=> b!822896 (= lt!369916 (tuple2!9709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369918 () ListLongMap!8533)

(assert (=> b!822896 (= lt!369918 lt!369914)))

(assert (=> b!822896 (= lt!369914 (+!1872 lt!369917 lt!369921))))

(assert (=> b!822896 (= lt!369921 (tuple2!9709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2436 (array!45675 array!45673 (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 (_ BitVec 32) Int) ListLongMap!8533)

(assert (=> b!822896 (= lt!369920 (getCurrentListMap!2436 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822896 (= lt!369918 (getCurrentListMap!2436 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822897 () Bool)

(declare-fun e!457511 () Bool)

(assert (=> b!822897 (= e!457511 tp_is_empty!14737)))

(declare-fun b!822898 () Bool)

(declare-fun res!561021 () Bool)

(assert (=> b!822898 (=> (not res!561021) (not e!457510))))

(assert (=> b!822898 (= res!561021 (and (= (size!22302 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22303 _keys!976) (size!22302 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822899 () Bool)

(assert (=> b!822899 (= e!457506 (and e!457511 mapRes!23716))))

(declare-fun condMapEmpty!23716 () Bool)

(declare-fun mapDefault!23716 () ValueCell!6953)

(assert (=> b!822899 (= condMapEmpty!23716 (= (arr!21882 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6953)) mapDefault!23716)))))

(assert (= (and start!70936 res!561024) b!822898))

(assert (= (and b!822898 res!561021) b!822892))

(assert (= (and b!822892 res!561025) b!822895))

(assert (= (and b!822895 res!561022) b!822894))

(assert (= (and b!822894 (not res!561023)) b!822896))

(assert (= (and b!822899 condMapEmpty!23716) mapIsEmpty!23716))

(assert (= (and b!822899 (not condMapEmpty!23716)) mapNonEmpty!23716))

(get-info :version)

(assert (= (and mapNonEmpty!23716 ((_ is ValueCellFull!6953) mapValue!23716)) b!822893))

(assert (= (and b!822899 ((_ is ValueCellFull!6953) mapDefault!23716)) b!822897))

(assert (= start!70936 b!822899))

(declare-fun m!764987 () Bool)

(assert (=> start!70936 m!764987))

(declare-fun m!764989 () Bool)

(assert (=> start!70936 m!764989))

(declare-fun m!764991 () Bool)

(assert (=> start!70936 m!764991))

(declare-fun m!764993 () Bool)

(assert (=> b!822895 m!764993))

(declare-fun m!764995 () Bool)

(assert (=> b!822896 m!764995))

(declare-fun m!764997 () Bool)

(assert (=> b!822896 m!764997))

(assert (=> b!822896 m!764997))

(declare-fun m!764999 () Bool)

(assert (=> b!822896 m!764999))

(declare-fun m!765001 () Bool)

(assert (=> b!822896 m!765001))

(declare-fun m!765003 () Bool)

(assert (=> b!822896 m!765003))

(declare-fun m!765005 () Bool)

(assert (=> b!822896 m!765005))

(declare-fun m!765007 () Bool)

(assert (=> b!822896 m!765007))

(declare-fun m!765009 () Bool)

(assert (=> b!822892 m!765009))

(declare-fun m!765011 () Bool)

(assert (=> mapNonEmpty!23716 m!765011))

(declare-fun m!765013 () Bool)

(assert (=> b!822894 m!765013))

(declare-fun m!765015 () Bool)

(assert (=> b!822894 m!765015))

(declare-fun m!765017 () Bool)

(assert (=> b!822894 m!765017))

(check-sat b_and!21909 (not mapNonEmpty!23716) tp_is_empty!14737 (not b_next!13027) (not b!822894) (not start!70936) (not b!822892) (not b!822895) (not b!822896))
(check-sat b_and!21909 (not b_next!13027))
