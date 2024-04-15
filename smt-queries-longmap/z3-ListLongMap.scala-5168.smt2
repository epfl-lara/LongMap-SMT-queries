; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69974 () Bool)

(assert start!69974)

(declare-fun b_free!12415 () Bool)

(declare-fun b_next!12415 () Bool)

(assert (=> start!69974 (= b_free!12415 (not b_next!12415))))

(declare-fun tp!43960 () Bool)

(declare-fun b_and!21161 () Bool)

(assert (=> start!69974 (= tp!43960 b_and!21161)))

(declare-fun b!813266 () Bool)

(declare-fun e!450644 () Bool)

(assert (=> b!813266 (= e!450644 false)))

(declare-datatypes ((array!44459 0))(
  ( (array!44460 (arr!21290 (Array (_ BitVec 32) (_ BitVec 64))) (size!21711 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44459)

(declare-datatypes ((V!23835 0))(
  ( (V!23836 (val!7110 Int)) )
))
(declare-fun zeroValueAfter!34 () V!23835)

(declare-fun minValue!754 () V!23835)

(declare-datatypes ((ValueCell!6647 0))(
  ( (ValueCellFull!6647 (v!9531 V!23835)) (EmptyCell!6647) )
))
(declare-datatypes ((array!44461 0))(
  ( (array!44462 (arr!21291 (Array (_ BitVec 32) ValueCell!6647)) (size!21712 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44461)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9358 0))(
  ( (tuple2!9359 (_1!4690 (_ BitVec 64)) (_2!4690 V!23835)) )
))
(declare-datatypes ((List!15183 0))(
  ( (Nil!15180) (Cons!15179 (h!16308 tuple2!9358) (t!21491 List!15183)) )
))
(declare-datatypes ((ListLongMap!8171 0))(
  ( (ListLongMap!8172 (toList!4101 List!15183)) )
))
(declare-fun lt!364073 () ListLongMap!8171)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2166 (array!44459 array!44461 (_ BitVec 32) (_ BitVec 32) V!23835 V!23835 (_ BitVec 32) Int) ListLongMap!8171)

(assert (=> b!813266 (= lt!364073 (getCurrentListMapNoExtraKeys!2166 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23835)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364074 () ListLongMap!8171)

(assert (=> b!813266 (= lt!364074 (getCurrentListMapNoExtraKeys!2166 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22768 () Bool)

(declare-fun mapRes!22768 () Bool)

(assert (=> mapIsEmpty!22768 mapRes!22768))

(declare-fun b!813267 () Bool)

(declare-fun res!555643 () Bool)

(assert (=> b!813267 (=> (not res!555643) (not e!450644))))

(assert (=> b!813267 (= res!555643 (and (= (size!21712 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21711 _keys!976) (size!21712 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!555641 () Bool)

(assert (=> start!69974 (=> (not res!555641) (not e!450644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69974 (= res!555641 (validMask!0 mask!1312))))

(assert (=> start!69974 e!450644))

(declare-fun tp_is_empty!14125 () Bool)

(assert (=> start!69974 tp_is_empty!14125))

(declare-fun array_inv!17129 (array!44459) Bool)

(assert (=> start!69974 (array_inv!17129 _keys!976)))

(assert (=> start!69974 true))

(declare-fun e!450646 () Bool)

(declare-fun array_inv!17130 (array!44461) Bool)

(assert (=> start!69974 (and (array_inv!17130 _values!788) e!450646)))

(assert (=> start!69974 tp!43960))

(declare-fun b!813268 () Bool)

(declare-fun res!555642 () Bool)

(assert (=> b!813268 (=> (not res!555642) (not e!450644))))

(declare-datatypes ((List!15184 0))(
  ( (Nil!15181) (Cons!15180 (h!16309 (_ BitVec 64)) (t!21492 List!15184)) )
))
(declare-fun arrayNoDuplicates!0 (array!44459 (_ BitVec 32) List!15184) Bool)

(assert (=> b!813268 (= res!555642 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15181))))

(declare-fun mapNonEmpty!22768 () Bool)

(declare-fun tp!43959 () Bool)

(declare-fun e!450647 () Bool)

(assert (=> mapNonEmpty!22768 (= mapRes!22768 (and tp!43959 e!450647))))

(declare-fun mapKey!22768 () (_ BitVec 32))

(declare-fun mapRest!22768 () (Array (_ BitVec 32) ValueCell!6647))

(declare-fun mapValue!22768 () ValueCell!6647)

(assert (=> mapNonEmpty!22768 (= (arr!21291 _values!788) (store mapRest!22768 mapKey!22768 mapValue!22768))))

(declare-fun b!813269 () Bool)

(declare-fun e!450648 () Bool)

(assert (=> b!813269 (= e!450648 tp_is_empty!14125)))

(declare-fun b!813270 () Bool)

(assert (=> b!813270 (= e!450647 tp_is_empty!14125)))

(declare-fun b!813271 () Bool)

(declare-fun res!555644 () Bool)

(assert (=> b!813271 (=> (not res!555644) (not e!450644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44459 (_ BitVec 32)) Bool)

(assert (=> b!813271 (= res!555644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813272 () Bool)

(assert (=> b!813272 (= e!450646 (and e!450648 mapRes!22768))))

(declare-fun condMapEmpty!22768 () Bool)

(declare-fun mapDefault!22768 () ValueCell!6647)

(assert (=> b!813272 (= condMapEmpty!22768 (= (arr!21291 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6647)) mapDefault!22768)))))

(assert (= (and start!69974 res!555641) b!813267))

(assert (= (and b!813267 res!555643) b!813271))

(assert (= (and b!813271 res!555644) b!813268))

(assert (= (and b!813268 res!555642) b!813266))

(assert (= (and b!813272 condMapEmpty!22768) mapIsEmpty!22768))

(assert (= (and b!813272 (not condMapEmpty!22768)) mapNonEmpty!22768))

(get-info :version)

(assert (= (and mapNonEmpty!22768 ((_ is ValueCellFull!6647) mapValue!22768)) b!813270))

(assert (= (and b!813272 ((_ is ValueCellFull!6647) mapDefault!22768)) b!813269))

(assert (= start!69974 b!813272))

(declare-fun m!754773 () Bool)

(assert (=> start!69974 m!754773))

(declare-fun m!754775 () Bool)

(assert (=> start!69974 m!754775))

(declare-fun m!754777 () Bool)

(assert (=> start!69974 m!754777))

(declare-fun m!754779 () Bool)

(assert (=> b!813271 m!754779))

(declare-fun m!754781 () Bool)

(assert (=> b!813266 m!754781))

(declare-fun m!754783 () Bool)

(assert (=> b!813266 m!754783))

(declare-fun m!754785 () Bool)

(assert (=> b!813268 m!754785))

(declare-fun m!754787 () Bool)

(assert (=> mapNonEmpty!22768 m!754787))

(check-sat (not start!69974) tp_is_empty!14125 (not b!813271) (not b!813266) (not mapNonEmpty!22768) b_and!21161 (not b_next!12415) (not b!813268))
(check-sat b_and!21161 (not b_next!12415))
