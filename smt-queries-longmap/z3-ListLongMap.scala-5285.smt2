; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70860 () Bool)

(assert start!70860)

(declare-fun b_free!13117 () Bool)

(declare-fun b_next!13117 () Bool)

(assert (=> start!70860 (= b_free!13117 (not b_next!13117))))

(declare-fun tp!46099 () Bool)

(declare-fun b_and!21975 () Bool)

(assert (=> start!70860 (= tp!46099 b_and!21975)))

(declare-fun b!823013 () Bool)

(declare-fun res!561326 () Bool)

(declare-fun e!457704 () Bool)

(assert (=> b!823013 (=> (not res!561326) (not e!457704))))

(declare-datatypes ((array!45813 0))(
  ( (array!45814 (arr!21956 (Array (_ BitVec 32) (_ BitVec 64))) (size!22377 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45813)

(declare-datatypes ((V!24771 0))(
  ( (V!24772 (val!7461 Int)) )
))
(declare-datatypes ((ValueCell!6998 0))(
  ( (ValueCellFull!6998 (v!9887 V!24771)) (EmptyCell!6998) )
))
(declare-datatypes ((array!45815 0))(
  ( (array!45816 (arr!21957 (Array (_ BitVec 32) ValueCell!6998)) (size!22378 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45815)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823013 (= res!561326 (and (= (size!22378 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22377 _keys!976) (size!22378 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823014 () Bool)

(declare-fun res!561325 () Bool)

(assert (=> b!823014 (=> (not res!561325) (not e!457704))))

(declare-datatypes ((List!15672 0))(
  ( (Nil!15669) (Cons!15668 (h!16797 (_ BitVec 64)) (t!22002 List!15672)) )
))
(declare-fun arrayNoDuplicates!0 (array!45813 (_ BitVec 32) List!15672) Bool)

(assert (=> b!823014 (= res!561325 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15669))))

(declare-fun b!823015 () Bool)

(declare-fun e!457701 () Bool)

(assert (=> b!823015 (= e!457701 true)))

(declare-datatypes ((tuple2!9866 0))(
  ( (tuple2!9867 (_1!4944 (_ BitVec 64)) (_2!4944 V!24771)) )
))
(declare-datatypes ((List!15673 0))(
  ( (Nil!15670) (Cons!15669 (h!16798 tuple2!9866) (t!22003 List!15673)) )
))
(declare-datatypes ((ListLongMap!8679 0))(
  ( (ListLongMap!8680 (toList!4355 List!15673)) )
))
(declare-fun lt!370824 () ListLongMap!8679)

(declare-fun lt!370829 () ListLongMap!8679)

(declare-fun lt!370826 () tuple2!9866)

(declare-fun +!1930 (ListLongMap!8679 tuple2!9866) ListLongMap!8679)

(assert (=> b!823015 (= lt!370824 (+!1930 lt!370829 lt!370826))))

(declare-fun minValue!754 () V!24771)

(declare-datatypes ((Unit!28132 0))(
  ( (Unit!28133) )
))
(declare-fun lt!370823 () Unit!28132)

(declare-fun zeroValueAfter!34 () V!24771)

(declare-fun lt!370828 () ListLongMap!8679)

(declare-fun addCommutativeForDiffKeys!461 (ListLongMap!8679 (_ BitVec 64) V!24771 (_ BitVec 64) V!24771) Unit!28132)

(assert (=> b!823015 (= lt!370823 (addCommutativeForDiffKeys!461 lt!370828 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370825 () ListLongMap!8679)

(assert (=> b!823015 (= lt!370825 lt!370824)))

(declare-fun lt!370827 () tuple2!9866)

(assert (=> b!823015 (= lt!370824 (+!1930 (+!1930 lt!370828 lt!370826) lt!370827))))

(assert (=> b!823015 (= lt!370826 (tuple2!9867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370820 () ListLongMap!8679)

(assert (=> b!823015 (= lt!370820 lt!370829)))

(assert (=> b!823015 (= lt!370829 (+!1930 lt!370828 lt!370827))))

(assert (=> b!823015 (= lt!370827 (tuple2!9867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2472 (array!45813 array!45815 (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 (_ BitVec 32) Int) ListLongMap!8679)

(assert (=> b!823015 (= lt!370825 (getCurrentListMap!2472 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24771)

(assert (=> b!823015 (= lt!370820 (getCurrentListMap!2472 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823016 () Bool)

(declare-fun e!457703 () Bool)

(declare-fun tp_is_empty!14827 () Bool)

(assert (=> b!823016 (= e!457703 tp_is_empty!14827)))

(declare-fun b!823017 () Bool)

(declare-fun e!457705 () Bool)

(assert (=> b!823017 (= e!457705 tp_is_empty!14827)))

(declare-fun b!823018 () Bool)

(declare-fun e!457702 () Bool)

(declare-fun mapRes!23854 () Bool)

(assert (=> b!823018 (= e!457702 (and e!457703 mapRes!23854))))

(declare-fun condMapEmpty!23854 () Bool)

(declare-fun mapDefault!23854 () ValueCell!6998)

(assert (=> b!823018 (= condMapEmpty!23854 (= (arr!21957 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6998)) mapDefault!23854)))))

(declare-fun mapNonEmpty!23854 () Bool)

(declare-fun tp!46098 () Bool)

(assert (=> mapNonEmpty!23854 (= mapRes!23854 (and tp!46098 e!457705))))

(declare-fun mapRest!23854 () (Array (_ BitVec 32) ValueCell!6998))

(declare-fun mapValue!23854 () ValueCell!6998)

(declare-fun mapKey!23854 () (_ BitVec 32))

(assert (=> mapNonEmpty!23854 (= (arr!21957 _values!788) (store mapRest!23854 mapKey!23854 mapValue!23854))))

(declare-fun mapIsEmpty!23854 () Bool)

(assert (=> mapIsEmpty!23854 mapRes!23854))

(declare-fun res!561323 () Bool)

(assert (=> start!70860 (=> (not res!561323) (not e!457704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70860 (= res!561323 (validMask!0 mask!1312))))

(assert (=> start!70860 e!457704))

(assert (=> start!70860 tp_is_empty!14827))

(declare-fun array_inv!17595 (array!45813) Bool)

(assert (=> start!70860 (array_inv!17595 _keys!976)))

(assert (=> start!70860 true))

(declare-fun array_inv!17596 (array!45815) Bool)

(assert (=> start!70860 (and (array_inv!17596 _values!788) e!457702)))

(assert (=> start!70860 tp!46099))

(declare-fun b!823019 () Bool)

(assert (=> b!823019 (= e!457704 (not e!457701))))

(declare-fun res!561327 () Bool)

(assert (=> b!823019 (=> res!561327 e!457701)))

(assert (=> b!823019 (= res!561327 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370822 () ListLongMap!8679)

(assert (=> b!823019 (= lt!370828 lt!370822)))

(declare-fun lt!370821 () Unit!28132)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!493 (array!45813 array!45815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 V!24771 V!24771 (_ BitVec 32) Int) Unit!28132)

(assert (=> b!823019 (= lt!370821 (lemmaNoChangeToArrayThenSameMapNoExtras!493 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2400 (array!45813 array!45815 (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 (_ BitVec 32) Int) ListLongMap!8679)

(assert (=> b!823019 (= lt!370822 (getCurrentListMapNoExtraKeys!2400 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823019 (= lt!370828 (getCurrentListMapNoExtraKeys!2400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823020 () Bool)

(declare-fun res!561324 () Bool)

(assert (=> b!823020 (=> (not res!561324) (not e!457704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45813 (_ BitVec 32)) Bool)

(assert (=> b!823020 (= res!561324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70860 res!561323) b!823013))

(assert (= (and b!823013 res!561326) b!823020))

(assert (= (and b!823020 res!561324) b!823014))

(assert (= (and b!823014 res!561325) b!823019))

(assert (= (and b!823019 (not res!561327)) b!823015))

(assert (= (and b!823018 condMapEmpty!23854) mapIsEmpty!23854))

(assert (= (and b!823018 (not condMapEmpty!23854)) mapNonEmpty!23854))

(get-info :version)

(assert (= (and mapNonEmpty!23854 ((_ is ValueCellFull!6998) mapValue!23854)) b!823017))

(assert (= (and b!823018 ((_ is ValueCellFull!6998) mapDefault!23854)) b!823016))

(assert (= start!70860 b!823018))

(declare-fun m!764609 () Bool)

(assert (=> b!823019 m!764609))

(declare-fun m!764611 () Bool)

(assert (=> b!823019 m!764611))

(declare-fun m!764613 () Bool)

(assert (=> b!823019 m!764613))

(declare-fun m!764615 () Bool)

(assert (=> mapNonEmpty!23854 m!764615))

(declare-fun m!764617 () Bool)

(assert (=> b!823014 m!764617))

(declare-fun m!764619 () Bool)

(assert (=> start!70860 m!764619))

(declare-fun m!764621 () Bool)

(assert (=> start!70860 m!764621))

(declare-fun m!764623 () Bool)

(assert (=> start!70860 m!764623))

(declare-fun m!764625 () Bool)

(assert (=> b!823020 m!764625))

(declare-fun m!764627 () Bool)

(assert (=> b!823015 m!764627))

(declare-fun m!764629 () Bool)

(assert (=> b!823015 m!764629))

(declare-fun m!764631 () Bool)

(assert (=> b!823015 m!764631))

(declare-fun m!764633 () Bool)

(assert (=> b!823015 m!764633))

(declare-fun m!764635 () Bool)

(assert (=> b!823015 m!764635))

(declare-fun m!764637 () Bool)

(assert (=> b!823015 m!764637))

(assert (=> b!823015 m!764635))

(declare-fun m!764639 () Bool)

(assert (=> b!823015 m!764639))

(check-sat (not b!823014) b_and!21975 (not b_next!13117) tp_is_empty!14827 (not start!70860) (not mapNonEmpty!23854) (not b!823015) (not b!823019) (not b!823020))
(check-sat b_and!21975 (not b_next!13117))
