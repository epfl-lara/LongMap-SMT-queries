; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70870 () Bool)

(assert start!70870)

(declare-fun b_free!13107 () Bool)

(declare-fun b_next!13107 () Bool)

(assert (=> start!70870 (= b_free!13107 (not b_next!13107))))

(declare-fun tp!46069 () Bool)

(declare-fun b_and!21991 () Bool)

(assert (=> start!70870 (= tp!46069 b_and!21991)))

(declare-fun b!823139 () Bool)

(declare-fun res!561355 () Bool)

(declare-fun e!457762 () Bool)

(assert (=> b!823139 (=> (not res!561355) (not e!457762))))

(declare-datatypes ((array!45828 0))(
  ( (array!45829 (arr!21963 (Array (_ BitVec 32) (_ BitVec 64))) (size!22384 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45828)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45828 (_ BitVec 32)) Bool)

(assert (=> b!823139 (= res!561355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823140 () Bool)

(declare-fun e!457766 () Bool)

(declare-fun e!457765 () Bool)

(declare-fun mapRes!23839 () Bool)

(assert (=> b!823140 (= e!457766 (and e!457765 mapRes!23839))))

(declare-fun condMapEmpty!23839 () Bool)

(declare-datatypes ((V!24757 0))(
  ( (V!24758 (val!7456 Int)) )
))
(declare-datatypes ((ValueCell!6993 0))(
  ( (ValueCellFull!6993 (v!9888 V!24757)) (EmptyCell!6993) )
))
(declare-datatypes ((array!45830 0))(
  ( (array!45831 (arr!21964 (Array (_ BitVec 32) ValueCell!6993)) (size!22385 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45830)

(declare-fun mapDefault!23839 () ValueCell!6993)

(assert (=> b!823140 (= condMapEmpty!23839 (= (arr!21964 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6993)) mapDefault!23839)))))

(declare-fun b!823141 () Bool)

(declare-fun e!457763 () Bool)

(declare-fun tp_is_empty!14817 () Bool)

(assert (=> b!823141 (= e!457763 tp_is_empty!14817)))

(declare-fun mapIsEmpty!23839 () Bool)

(assert (=> mapIsEmpty!23839 mapRes!23839))

(declare-fun b!823142 () Bool)

(declare-fun res!561356 () Bool)

(assert (=> b!823142 (=> (not res!561356) (not e!457762))))

(declare-datatypes ((List!15671 0))(
  ( (Nil!15668) (Cons!15667 (h!16796 (_ BitVec 64)) (t!22010 List!15671)) )
))
(declare-fun arrayNoDuplicates!0 (array!45828 (_ BitVec 32) List!15671) Bool)

(assert (=> b!823142 (= res!561356 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15668))))

(declare-fun b!823143 () Bool)

(declare-fun e!457761 () Bool)

(assert (=> b!823143 (= e!457762 (not e!457761))))

(declare-fun res!561358 () Bool)

(assert (=> b!823143 (=> res!561358 e!457761)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823143 (= res!561358 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9858 0))(
  ( (tuple2!9859 (_1!4940 (_ BitVec 64)) (_2!4940 V!24757)) )
))
(declare-datatypes ((List!15672 0))(
  ( (Nil!15669) (Cons!15668 (h!16797 tuple2!9858) (t!22011 List!15672)) )
))
(declare-datatypes ((ListLongMap!8681 0))(
  ( (ListLongMap!8682 (toList!4356 List!15672)) )
))
(declare-fun lt!370913 () ListLongMap!8681)

(declare-fun lt!370919 () ListLongMap!8681)

(assert (=> b!823143 (= lt!370913 lt!370919)))

(declare-fun zeroValueAfter!34 () V!24757)

(declare-fun minValue!754 () V!24757)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28178 0))(
  ( (Unit!28179) )
))
(declare-fun lt!370916 () Unit!28178)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24757)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!481 (array!45828 array!45830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24757 V!24757 V!24757 V!24757 (_ BitVec 32) Int) Unit!28178)

(assert (=> b!823143 (= lt!370916 (lemmaNoChangeToArrayThenSameMapNoExtras!481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2371 (array!45828 array!45830 (_ BitVec 32) (_ BitVec 32) V!24757 V!24757 (_ BitVec 32) Int) ListLongMap!8681)

(assert (=> b!823143 (= lt!370919 (getCurrentListMapNoExtraKeys!2371 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823143 (= lt!370913 (getCurrentListMapNoExtraKeys!2371 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823144 () Bool)

(assert (=> b!823144 (= e!457761 true)))

(declare-fun lt!370922 () ListLongMap!8681)

(declare-fun lt!370920 () ListLongMap!8681)

(declare-fun lt!370915 () tuple2!9858)

(declare-fun +!1905 (ListLongMap!8681 tuple2!9858) ListLongMap!8681)

(assert (=> b!823144 (= lt!370922 (+!1905 lt!370920 lt!370915))))

(declare-fun lt!370917 () Unit!28178)

(declare-fun addCommutativeForDiffKeys!468 (ListLongMap!8681 (_ BitVec 64) V!24757 (_ BitVec 64) V!24757) Unit!28178)

(assert (=> b!823144 (= lt!370917 (addCommutativeForDiffKeys!468 lt!370913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370914 () ListLongMap!8681)

(assert (=> b!823144 (= lt!370914 lt!370922)))

(declare-fun lt!370921 () tuple2!9858)

(assert (=> b!823144 (= lt!370922 (+!1905 (+!1905 lt!370913 lt!370915) lt!370921))))

(assert (=> b!823144 (= lt!370915 (tuple2!9859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370918 () ListLongMap!8681)

(assert (=> b!823144 (= lt!370918 lt!370920)))

(assert (=> b!823144 (= lt!370920 (+!1905 lt!370913 lt!370921))))

(assert (=> b!823144 (= lt!370921 (tuple2!9859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2519 (array!45828 array!45830 (_ BitVec 32) (_ BitVec 32) V!24757 V!24757 (_ BitVec 32) Int) ListLongMap!8681)

(assert (=> b!823144 (= lt!370914 (getCurrentListMap!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823144 (= lt!370918 (getCurrentListMap!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23839 () Bool)

(declare-fun tp!46068 () Bool)

(assert (=> mapNonEmpty!23839 (= mapRes!23839 (and tp!46068 e!457763))))

(declare-fun mapValue!23839 () ValueCell!6993)

(declare-fun mapRest!23839 () (Array (_ BitVec 32) ValueCell!6993))

(declare-fun mapKey!23839 () (_ BitVec 32))

(assert (=> mapNonEmpty!23839 (= (arr!21964 _values!788) (store mapRest!23839 mapKey!23839 mapValue!23839))))

(declare-fun b!823145 () Bool)

(assert (=> b!823145 (= e!457765 tp_is_empty!14817)))

(declare-fun b!823146 () Bool)

(declare-fun res!561354 () Bool)

(assert (=> b!823146 (=> (not res!561354) (not e!457762))))

(assert (=> b!823146 (= res!561354 (and (= (size!22385 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22384 _keys!976) (size!22385 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!561357 () Bool)

(assert (=> start!70870 (=> (not res!561357) (not e!457762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70870 (= res!561357 (validMask!0 mask!1312))))

(assert (=> start!70870 e!457762))

(assert (=> start!70870 tp_is_empty!14817))

(declare-fun array_inv!17539 (array!45828) Bool)

(assert (=> start!70870 (array_inv!17539 _keys!976)))

(assert (=> start!70870 true))

(declare-fun array_inv!17540 (array!45830) Bool)

(assert (=> start!70870 (and (array_inv!17540 _values!788) e!457766)))

(assert (=> start!70870 tp!46069))

(assert (= (and start!70870 res!561357) b!823146))

(assert (= (and b!823146 res!561354) b!823139))

(assert (= (and b!823139 res!561355) b!823142))

(assert (= (and b!823142 res!561356) b!823143))

(assert (= (and b!823143 (not res!561358)) b!823144))

(assert (= (and b!823140 condMapEmpty!23839) mapIsEmpty!23839))

(assert (= (and b!823140 (not condMapEmpty!23839)) mapNonEmpty!23839))

(get-info :version)

(assert (= (and mapNonEmpty!23839 ((_ is ValueCellFull!6993) mapValue!23839)) b!823141))

(assert (= (and b!823140 ((_ is ValueCellFull!6993) mapDefault!23839)) b!823145))

(assert (= start!70870 b!823140))

(declare-fun m!765201 () Bool)

(assert (=> b!823144 m!765201))

(declare-fun m!765203 () Bool)

(assert (=> b!823144 m!765203))

(assert (=> b!823144 m!765203))

(declare-fun m!765205 () Bool)

(assert (=> b!823144 m!765205))

(declare-fun m!765207 () Bool)

(assert (=> b!823144 m!765207))

(declare-fun m!765209 () Bool)

(assert (=> b!823144 m!765209))

(declare-fun m!765211 () Bool)

(assert (=> b!823144 m!765211))

(declare-fun m!765213 () Bool)

(assert (=> b!823144 m!765213))

(declare-fun m!765215 () Bool)

(assert (=> mapNonEmpty!23839 m!765215))

(declare-fun m!765217 () Bool)

(assert (=> b!823142 m!765217))

(declare-fun m!765219 () Bool)

(assert (=> start!70870 m!765219))

(declare-fun m!765221 () Bool)

(assert (=> start!70870 m!765221))

(declare-fun m!765223 () Bool)

(assert (=> start!70870 m!765223))

(declare-fun m!765225 () Bool)

(assert (=> b!823139 m!765225))

(declare-fun m!765227 () Bool)

(assert (=> b!823143 m!765227))

(declare-fun m!765229 () Bool)

(assert (=> b!823143 m!765229))

(declare-fun m!765231 () Bool)

(assert (=> b!823143 m!765231))

(check-sat (not b!823143) (not b!823139) tp_is_empty!14817 b_and!21991 (not b!823142) (not b!823144) (not b_next!13107) (not start!70870) (not mapNonEmpty!23839))
(check-sat b_and!21991 (not b_next!13107))
