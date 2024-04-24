; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70506 () Bool)

(assert start!70506)

(declare-fun b_free!12697 () Bool)

(declare-fun b_next!12697 () Bool)

(assert (=> start!70506 (= b_free!12697 (not b_next!12697))))

(declare-fun tp!44818 () Bool)

(declare-fun b_and!21519 () Bool)

(assert (=> start!70506 (= tp!44818 b_and!21519)))

(declare-fun b!818067 () Bool)

(declare-fun e!453983 () Bool)

(declare-fun tp_is_empty!14407 () Bool)

(assert (=> b!818067 (= e!453983 tp_is_empty!14407)))

(declare-fun b!818068 () Bool)

(declare-fun res!558176 () Bool)

(declare-fun e!453981 () Bool)

(assert (=> b!818068 (=> (not res!558176) (not e!453981))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24211 0))(
  ( (V!24212 (val!7251 Int)) )
))
(declare-datatypes ((ValueCell!6788 0))(
  ( (ValueCellFull!6788 (v!9680 V!24211)) (EmptyCell!6788) )
))
(declare-datatypes ((array!45015 0))(
  ( (array!45016 (arr!21559 (Array (_ BitVec 32) ValueCell!6788)) (size!21979 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45015)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!45017 0))(
  ( (array!45018 (arr!21560 (Array (_ BitVec 32) (_ BitVec 64))) (size!21980 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45017)

(assert (=> b!818068 (= res!558176 (and (= (size!21979 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21980 _keys!976) (size!21979 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23203 () Bool)

(declare-fun mapRes!23203 () Bool)

(assert (=> mapIsEmpty!23203 mapRes!23203))

(declare-fun b!818069 () Bool)

(assert (=> b!818069 (= e!453981 (not true))))

(declare-datatypes ((tuple2!9438 0))(
  ( (tuple2!9439 (_1!4730 (_ BitVec 64)) (_2!4730 V!24211)) )
))
(declare-datatypes ((List!15250 0))(
  ( (Nil!15247) (Cons!15246 (h!16381 tuple2!9438) (t!21567 List!15250)) )
))
(declare-datatypes ((ListLongMap!8263 0))(
  ( (ListLongMap!8264 (toList!4147 List!15250)) )
))
(declare-fun lt!366492 () ListLongMap!8263)

(declare-fun lt!366490 () ListLongMap!8263)

(assert (=> b!818069 (= lt!366492 lt!366490)))

(declare-fun zeroValueBefore!34 () V!24211)

(declare-fun zeroValueAfter!34 () V!24211)

(declare-fun minValue!754 () V!24211)

(declare-datatypes ((Unit!27849 0))(
  ( (Unit!27850) )
))
(declare-fun lt!366491 () Unit!27849)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!334 (array!45017 array!45015 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24211 V!24211 V!24211 V!24211 (_ BitVec 32) Int) Unit!27849)

(assert (=> b!818069 (= lt!366491 (lemmaNoChangeToArrayThenSameMapNoExtras!334 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2246 (array!45017 array!45015 (_ BitVec 32) (_ BitVec 32) V!24211 V!24211 (_ BitVec 32) Int) ListLongMap!8263)

(assert (=> b!818069 (= lt!366490 (getCurrentListMapNoExtraKeys!2246 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818069 (= lt!366492 (getCurrentListMapNoExtraKeys!2246 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818070 () Bool)

(declare-fun res!558173 () Bool)

(assert (=> b!818070 (=> (not res!558173) (not e!453981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45017 (_ BitVec 32)) Bool)

(assert (=> b!818070 (= res!558173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23203 () Bool)

(declare-fun tp!44817 () Bool)

(declare-fun e!453982 () Bool)

(assert (=> mapNonEmpty!23203 (= mapRes!23203 (and tp!44817 e!453982))))

(declare-fun mapValue!23203 () ValueCell!6788)

(declare-fun mapKey!23203 () (_ BitVec 32))

(declare-fun mapRest!23203 () (Array (_ BitVec 32) ValueCell!6788))

(assert (=> mapNonEmpty!23203 (= (arr!21559 _values!788) (store mapRest!23203 mapKey!23203 mapValue!23203))))

(declare-fun b!818071 () Bool)

(assert (=> b!818071 (= e!453982 tp_is_empty!14407)))

(declare-fun res!558174 () Bool)

(assert (=> start!70506 (=> (not res!558174) (not e!453981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70506 (= res!558174 (validMask!0 mask!1312))))

(assert (=> start!70506 e!453981))

(assert (=> start!70506 tp_is_empty!14407))

(declare-fun array_inv!17273 (array!45017) Bool)

(assert (=> start!70506 (array_inv!17273 _keys!976)))

(assert (=> start!70506 true))

(declare-fun e!453980 () Bool)

(declare-fun array_inv!17274 (array!45015) Bool)

(assert (=> start!70506 (and (array_inv!17274 _values!788) e!453980)))

(assert (=> start!70506 tp!44818))

(declare-fun b!818072 () Bool)

(declare-fun res!558175 () Bool)

(assert (=> b!818072 (=> (not res!558175) (not e!453981))))

(declare-datatypes ((List!15251 0))(
  ( (Nil!15248) (Cons!15247 (h!16382 (_ BitVec 64)) (t!21568 List!15251)) )
))
(declare-fun arrayNoDuplicates!0 (array!45017 (_ BitVec 32) List!15251) Bool)

(assert (=> b!818072 (= res!558175 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15248))))

(declare-fun b!818073 () Bool)

(assert (=> b!818073 (= e!453980 (and e!453983 mapRes!23203))))

(declare-fun condMapEmpty!23203 () Bool)

(declare-fun mapDefault!23203 () ValueCell!6788)

(assert (=> b!818073 (= condMapEmpty!23203 (= (arr!21559 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6788)) mapDefault!23203)))))

(assert (= (and start!70506 res!558174) b!818068))

(assert (= (and b!818068 res!558176) b!818070))

(assert (= (and b!818070 res!558173) b!818072))

(assert (= (and b!818072 res!558175) b!818069))

(assert (= (and b!818073 condMapEmpty!23203) mapIsEmpty!23203))

(assert (= (and b!818073 (not condMapEmpty!23203)) mapNonEmpty!23203))

(get-info :version)

(assert (= (and mapNonEmpty!23203 ((_ is ValueCellFull!6788) mapValue!23203)) b!818071))

(assert (= (and b!818073 ((_ is ValueCellFull!6788) mapDefault!23203)) b!818067))

(assert (= start!70506 b!818073))

(declare-fun m!760075 () Bool)

(assert (=> start!70506 m!760075))

(declare-fun m!760077 () Bool)

(assert (=> start!70506 m!760077))

(declare-fun m!760079 () Bool)

(assert (=> start!70506 m!760079))

(declare-fun m!760081 () Bool)

(assert (=> b!818072 m!760081))

(declare-fun m!760083 () Bool)

(assert (=> mapNonEmpty!23203 m!760083))

(declare-fun m!760085 () Bool)

(assert (=> b!818069 m!760085))

(declare-fun m!760087 () Bool)

(assert (=> b!818069 m!760087))

(declare-fun m!760089 () Bool)

(assert (=> b!818069 m!760089))

(declare-fun m!760091 () Bool)

(assert (=> b!818070 m!760091))

(check-sat (not b!818070) (not b_next!12697) tp_is_empty!14407 (not b!818069) (not mapNonEmpty!23203) (not b!818072) (not start!70506) b_and!21519)
(check-sat b_and!21519 (not b_next!12697))
