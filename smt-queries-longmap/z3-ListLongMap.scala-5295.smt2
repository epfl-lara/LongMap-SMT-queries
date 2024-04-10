; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70962 () Bool)

(assert start!70962)

(declare-fun b_free!13179 () Bool)

(declare-fun b_next!13179 () Bool)

(assert (=> start!70962 (= b_free!13179 (not b_next!13179))))

(declare-fun tp!46287 () Bool)

(declare-fun b_and!22075 () Bool)

(assert (=> start!70962 (= tp!46287 b_and!22075)))

(declare-fun b!824116 () Bool)

(declare-fun res!561906 () Bool)

(declare-fun e!458454 () Bool)

(assert (=> b!824116 (=> (not res!561906) (not e!458454))))

(declare-datatypes ((array!45966 0))(
  ( (array!45967 (arr!22031 (Array (_ BitVec 32) (_ BitVec 64))) (size!22452 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45966)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45966 (_ BitVec 32)) Bool)

(assert (=> b!824116 (= res!561906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!561908 () Bool)

(assert (=> start!70962 (=> (not res!561908) (not e!458454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70962 (= res!561908 (validMask!0 mask!1312))))

(assert (=> start!70962 e!458454))

(declare-fun tp_is_empty!14889 () Bool)

(assert (=> start!70962 tp_is_empty!14889))

(declare-fun array_inv!17579 (array!45966) Bool)

(assert (=> start!70962 (array_inv!17579 _keys!976)))

(assert (=> start!70962 true))

(declare-datatypes ((V!24853 0))(
  ( (V!24854 (val!7492 Int)) )
))
(declare-datatypes ((ValueCell!7029 0))(
  ( (ValueCellFull!7029 (v!9925 V!24853)) (EmptyCell!7029) )
))
(declare-datatypes ((array!45968 0))(
  ( (array!45969 (arr!22032 (Array (_ BitVec 32) ValueCell!7029)) (size!22453 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45968)

(declare-fun e!458458 () Bool)

(declare-fun array_inv!17580 (array!45968) Bool)

(assert (=> start!70962 (and (array_inv!17580 _values!788) e!458458)))

(assert (=> start!70962 tp!46287))

(declare-fun b!824117 () Bool)

(assert (=> b!824117 (= e!458454 (not true))))

(declare-datatypes ((tuple2!9912 0))(
  ( (tuple2!9913 (_1!4967 (_ BitVec 64)) (_2!4967 V!24853)) )
))
(declare-datatypes ((List!15723 0))(
  ( (Nil!15720) (Cons!15719 (h!16848 tuple2!9912) (t!22064 List!15723)) )
))
(declare-datatypes ((ListLongMap!8735 0))(
  ( (ListLongMap!8736 (toList!4383 List!15723)) )
))
(declare-fun lt!371674 () ListLongMap!8735)

(declare-fun lt!371673 () ListLongMap!8735)

(assert (=> b!824117 (= lt!371674 lt!371673)))

(declare-fun zeroValueBefore!34 () V!24853)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24853)

(declare-fun minValue!754 () V!24853)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28234 0))(
  ( (Unit!28235) )
))
(declare-fun lt!371672 () Unit!28234)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!508 (array!45966 array!45968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24853 V!24853 V!24853 V!24853 (_ BitVec 32) Int) Unit!28234)

(assert (=> b!824117 (= lt!371672 (lemmaNoChangeToArrayThenSameMapNoExtras!508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2398 (array!45966 array!45968 (_ BitVec 32) (_ BitVec 32) V!24853 V!24853 (_ BitVec 32) Int) ListLongMap!8735)

(assert (=> b!824117 (= lt!371673 (getCurrentListMapNoExtraKeys!2398 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824117 (= lt!371674 (getCurrentListMapNoExtraKeys!2398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824118 () Bool)

(declare-fun e!458456 () Bool)

(assert (=> b!824118 (= e!458456 tp_is_empty!14889)))

(declare-fun mapNonEmpty!23950 () Bool)

(declare-fun mapRes!23950 () Bool)

(declare-fun tp!46288 () Bool)

(declare-fun e!458457 () Bool)

(assert (=> mapNonEmpty!23950 (= mapRes!23950 (and tp!46288 e!458457))))

(declare-fun mapValue!23950 () ValueCell!7029)

(declare-fun mapRest!23950 () (Array (_ BitVec 32) ValueCell!7029))

(declare-fun mapKey!23950 () (_ BitVec 32))

(assert (=> mapNonEmpty!23950 (= (arr!22032 _values!788) (store mapRest!23950 mapKey!23950 mapValue!23950))))

(declare-fun b!824119 () Bool)

(assert (=> b!824119 (= e!458457 tp_is_empty!14889)))

(declare-fun b!824120 () Bool)

(declare-fun res!561907 () Bool)

(assert (=> b!824120 (=> (not res!561907) (not e!458454))))

(assert (=> b!824120 (= res!561907 (and (= (size!22453 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22452 _keys!976) (size!22453 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824121 () Bool)

(assert (=> b!824121 (= e!458458 (and e!458456 mapRes!23950))))

(declare-fun condMapEmpty!23950 () Bool)

(declare-fun mapDefault!23950 () ValueCell!7029)

(assert (=> b!824121 (= condMapEmpty!23950 (= (arr!22032 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7029)) mapDefault!23950)))))

(declare-fun mapIsEmpty!23950 () Bool)

(assert (=> mapIsEmpty!23950 mapRes!23950))

(declare-fun b!824122 () Bool)

(declare-fun res!561905 () Bool)

(assert (=> b!824122 (=> (not res!561905) (not e!458454))))

(declare-datatypes ((List!15724 0))(
  ( (Nil!15721) (Cons!15720 (h!16849 (_ BitVec 64)) (t!22065 List!15724)) )
))
(declare-fun arrayNoDuplicates!0 (array!45966 (_ BitVec 32) List!15724) Bool)

(assert (=> b!824122 (= res!561905 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15721))))

(assert (= (and start!70962 res!561908) b!824120))

(assert (= (and b!824120 res!561907) b!824116))

(assert (= (and b!824116 res!561906) b!824122))

(assert (= (and b!824122 res!561905) b!824117))

(assert (= (and b!824121 condMapEmpty!23950) mapIsEmpty!23950))

(assert (= (and b!824121 (not condMapEmpty!23950)) mapNonEmpty!23950))

(get-info :version)

(assert (= (and mapNonEmpty!23950 ((_ is ValueCellFull!7029) mapValue!23950)) b!824119))

(assert (= (and b!824121 ((_ is ValueCellFull!7029) mapDefault!23950)) b!824118))

(assert (= start!70962 b!824121))

(declare-fun m!766261 () Bool)

(assert (=> mapNonEmpty!23950 m!766261))

(declare-fun m!766263 () Bool)

(assert (=> b!824122 m!766263))

(declare-fun m!766265 () Bool)

(assert (=> start!70962 m!766265))

(declare-fun m!766267 () Bool)

(assert (=> start!70962 m!766267))

(declare-fun m!766269 () Bool)

(assert (=> start!70962 m!766269))

(declare-fun m!766271 () Bool)

(assert (=> b!824117 m!766271))

(declare-fun m!766273 () Bool)

(assert (=> b!824117 m!766273))

(declare-fun m!766275 () Bool)

(assert (=> b!824117 m!766275))

(declare-fun m!766277 () Bool)

(assert (=> b!824116 m!766277))

(check-sat (not b!824117) (not b!824122) (not start!70962) (not mapNonEmpty!23950) b_and!22075 tp_is_empty!14889 (not b_next!13179) (not b!824116))
(check-sat b_and!22075 (not b_next!13179))
