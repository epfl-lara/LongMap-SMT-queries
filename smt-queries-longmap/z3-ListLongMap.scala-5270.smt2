; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70750 () Bool)

(assert start!70750)

(declare-fun b_free!13027 () Bool)

(declare-fun b_next!13027 () Bool)

(assert (=> start!70750 (= b_free!13027 (not b_next!13027))))

(declare-fun tp!45826 () Bool)

(declare-fun b_and!21873 () Bool)

(assert (=> start!70750 (= tp!45826 b_and!21873)))

(declare-fun b!821752 () Bool)

(declare-fun e!456783 () Bool)

(declare-fun e!456780 () Bool)

(declare-fun mapRes!23716 () Bool)

(assert (=> b!821752 (= e!456783 (and e!456780 mapRes!23716))))

(declare-fun condMapEmpty!23716 () Bool)

(declare-datatypes ((V!24651 0))(
  ( (V!24652 (val!7416 Int)) )
))
(declare-datatypes ((ValueCell!6953 0))(
  ( (ValueCellFull!6953 (v!9841 V!24651)) (EmptyCell!6953) )
))
(declare-datatypes ((array!45637 0))(
  ( (array!45638 (arr!21869 (Array (_ BitVec 32) ValueCell!6953)) (size!22290 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45637)

(declare-fun mapDefault!23716 () ValueCell!6953)

(assert (=> b!821752 (= condMapEmpty!23716 (= (arr!21869 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6953)) mapDefault!23716)))))

(declare-fun mapNonEmpty!23716 () Bool)

(declare-fun tp!45825 () Bool)

(declare-fun e!456781 () Bool)

(assert (=> mapNonEmpty!23716 (= mapRes!23716 (and tp!45825 e!456781))))

(declare-fun mapValue!23716 () ValueCell!6953)

(declare-fun mapRest!23716 () (Array (_ BitVec 32) ValueCell!6953))

(declare-fun mapKey!23716 () (_ BitVec 32))

(assert (=> mapNonEmpty!23716 (= (arr!21869 _values!788) (store mapRest!23716 mapKey!23716 mapValue!23716))))

(declare-fun b!821753 () Bool)

(declare-fun e!456782 () Bool)

(declare-fun e!456778 () Bool)

(assert (=> b!821753 (= e!456782 (not e!456778))))

(declare-fun res!560573 () Bool)

(assert (=> b!821753 (=> res!560573 e!456778)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821753 (= res!560573 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9794 0))(
  ( (tuple2!9795 (_1!4908 (_ BitVec 64)) (_2!4908 V!24651)) )
))
(declare-datatypes ((List!15606 0))(
  ( (Nil!15603) (Cons!15602 (h!16731 tuple2!9794) (t!21934 List!15606)) )
))
(declare-datatypes ((ListLongMap!8607 0))(
  ( (ListLongMap!8608 (toList!4319 List!15606)) )
))
(declare-fun lt!369318 () ListLongMap!8607)

(declare-fun lt!369323 () ListLongMap!8607)

(assert (=> b!821753 (= lt!369318 lt!369323)))

(declare-fun zeroValueBefore!34 () V!24651)

(declare-datatypes ((array!45639 0))(
  ( (array!45640 (arr!21870 (Array (_ BitVec 32) (_ BitVec 64))) (size!22291 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45639)

(declare-fun minValue!754 () V!24651)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24651)

(declare-datatypes ((Unit!28058 0))(
  ( (Unit!28059) )
))
(declare-fun lt!369315 () Unit!28058)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!459 (array!45639 array!45637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 V!24651 V!24651 (_ BitVec 32) Int) Unit!28058)

(assert (=> b!821753 (= lt!369315 (lemmaNoChangeToArrayThenSameMapNoExtras!459 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2366 (array!45639 array!45637 (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 (_ BitVec 32) Int) ListLongMap!8607)

(assert (=> b!821753 (= lt!369323 (getCurrentListMapNoExtraKeys!2366 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821753 (= lt!369318 (getCurrentListMapNoExtraKeys!2366 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821754 () Bool)

(declare-fun tp_is_empty!14737 () Bool)

(assert (=> b!821754 (= e!456781 tp_is_empty!14737)))

(declare-fun b!821755 () Bool)

(assert (=> b!821755 (= e!456778 true)))

(declare-fun lt!369316 () ListLongMap!8607)

(declare-fun lt!369319 () ListLongMap!8607)

(declare-fun lt!369322 () tuple2!9794)

(declare-fun +!1903 (ListLongMap!8607 tuple2!9794) ListLongMap!8607)

(assert (=> b!821755 (= lt!369316 (+!1903 lt!369319 lt!369322))))

(declare-fun lt!369320 () Unit!28058)

(declare-fun addCommutativeForDiffKeys!434 (ListLongMap!8607 (_ BitVec 64) V!24651 (_ BitVec 64) V!24651) Unit!28058)

(assert (=> b!821755 (= lt!369320 (addCommutativeForDiffKeys!434 lt!369318 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369324 () ListLongMap!8607)

(assert (=> b!821755 (= lt!369324 lt!369316)))

(declare-fun lt!369317 () tuple2!9794)

(assert (=> b!821755 (= lt!369316 (+!1903 (+!1903 lt!369318 lt!369322) lt!369317))))

(assert (=> b!821755 (= lt!369322 (tuple2!9795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369321 () ListLongMap!8607)

(assert (=> b!821755 (= lt!369321 lt!369319)))

(assert (=> b!821755 (= lt!369319 (+!1903 lt!369318 lt!369317))))

(assert (=> b!821755 (= lt!369317 (tuple2!9795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2445 (array!45639 array!45637 (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 (_ BitVec 32) Int) ListLongMap!8607)

(assert (=> b!821755 (= lt!369324 (getCurrentListMap!2445 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821755 (= lt!369321 (getCurrentListMap!2445 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821756 () Bool)

(declare-fun res!560570 () Bool)

(assert (=> b!821756 (=> (not res!560570) (not e!456782))))

(assert (=> b!821756 (= res!560570 (and (= (size!22290 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22291 _keys!976) (size!22290 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821757 () Bool)

(assert (=> b!821757 (= e!456780 tp_is_empty!14737)))

(declare-fun b!821759 () Bool)

(declare-fun res!560572 () Bool)

(assert (=> b!821759 (=> (not res!560572) (not e!456782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45639 (_ BitVec 32)) Bool)

(assert (=> b!821759 (= res!560572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23716 () Bool)

(assert (=> mapIsEmpty!23716 mapRes!23716))

(declare-fun b!821758 () Bool)

(declare-fun res!560571 () Bool)

(assert (=> b!821758 (=> (not res!560571) (not e!456782))))

(declare-datatypes ((List!15607 0))(
  ( (Nil!15604) (Cons!15603 (h!16732 (_ BitVec 64)) (t!21935 List!15607)) )
))
(declare-fun arrayNoDuplicates!0 (array!45639 (_ BitVec 32) List!15607) Bool)

(assert (=> b!821758 (= res!560571 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15604))))

(declare-fun res!560569 () Bool)

(assert (=> start!70750 (=> (not res!560569) (not e!456782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70750 (= res!560569 (validMask!0 mask!1312))))

(assert (=> start!70750 e!456782))

(assert (=> start!70750 tp_is_empty!14737))

(declare-fun array_inv!17537 (array!45639) Bool)

(assert (=> start!70750 (array_inv!17537 _keys!976)))

(assert (=> start!70750 true))

(declare-fun array_inv!17538 (array!45637) Bool)

(assert (=> start!70750 (and (array_inv!17538 _values!788) e!456783)))

(assert (=> start!70750 tp!45826))

(assert (= (and start!70750 res!560569) b!821756))

(assert (= (and b!821756 res!560570) b!821759))

(assert (= (and b!821759 res!560572) b!821758))

(assert (= (and b!821758 res!560571) b!821753))

(assert (= (and b!821753 (not res!560573)) b!821755))

(assert (= (and b!821752 condMapEmpty!23716) mapIsEmpty!23716))

(assert (= (and b!821752 (not condMapEmpty!23716)) mapNonEmpty!23716))

(get-info :version)

(assert (= (and mapNonEmpty!23716 ((_ is ValueCellFull!6953) mapValue!23716)) b!821754))

(assert (= (and b!821752 ((_ is ValueCellFull!6953) mapDefault!23716)) b!821757))

(assert (= start!70750 b!821752))

(declare-fun m!762953 () Bool)

(assert (=> mapNonEmpty!23716 m!762953))

(declare-fun m!762955 () Bool)

(assert (=> start!70750 m!762955))

(declare-fun m!762957 () Bool)

(assert (=> start!70750 m!762957))

(declare-fun m!762959 () Bool)

(assert (=> start!70750 m!762959))

(declare-fun m!762961 () Bool)

(assert (=> b!821753 m!762961))

(declare-fun m!762963 () Bool)

(assert (=> b!821753 m!762963))

(declare-fun m!762965 () Bool)

(assert (=> b!821753 m!762965))

(declare-fun m!762967 () Bool)

(assert (=> b!821755 m!762967))

(declare-fun m!762969 () Bool)

(assert (=> b!821755 m!762969))

(declare-fun m!762971 () Bool)

(assert (=> b!821755 m!762971))

(declare-fun m!762973 () Bool)

(assert (=> b!821755 m!762973))

(declare-fun m!762975 () Bool)

(assert (=> b!821755 m!762975))

(declare-fun m!762977 () Bool)

(assert (=> b!821755 m!762977))

(assert (=> b!821755 m!762967))

(declare-fun m!762979 () Bool)

(assert (=> b!821755 m!762979))

(declare-fun m!762981 () Bool)

(assert (=> b!821759 m!762981))

(declare-fun m!762983 () Bool)

(assert (=> b!821758 m!762983))

(check-sat (not mapNonEmpty!23716) (not b!821753) (not start!70750) (not b!821755) (not b_next!13027) (not b!821758) (not b!821759) b_and!21873 tp_is_empty!14737)
(check-sat b_and!21873 (not b_next!13027))
