; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70702 () Bool)

(assert start!70702)

(declare-fun b_free!12975 () Bool)

(declare-fun b_next!12975 () Bool)

(assert (=> start!70702 (= b_free!12975 (not b_next!12975))))

(declare-fun tp!45666 () Bool)

(declare-fun b_and!21837 () Bool)

(assert (=> start!70702 (= tp!45666 b_and!21837)))

(declare-fun mapNonEmpty!23635 () Bool)

(declare-fun mapRes!23635 () Bool)

(declare-fun tp!45667 () Bool)

(declare-fun e!456359 () Bool)

(assert (=> mapNonEmpty!23635 (= mapRes!23635 (and tp!45667 e!456359))))

(declare-datatypes ((V!24581 0))(
  ( (V!24582 (val!7390 Int)) )
))
(declare-datatypes ((ValueCell!6927 0))(
  ( (ValueCellFull!6927 (v!9821 V!24581)) (EmptyCell!6927) )
))
(declare-fun mapValue!23635 () ValueCell!6927)

(declare-fun mapKey!23635 () (_ BitVec 32))

(declare-datatypes ((array!45566 0))(
  ( (array!45567 (arr!21834 (Array (_ BitVec 32) ValueCell!6927)) (size!22255 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45566)

(declare-fun mapRest!23635 () (Array (_ BitVec 32) ValueCell!6927))

(assert (=> mapNonEmpty!23635 (= (arr!21834 _values!788) (store mapRest!23635 mapKey!23635 mapValue!23635))))

(declare-fun b!821218 () Bool)

(declare-fun res!560220 () Bool)

(declare-fun e!456362 () Bool)

(assert (=> b!821218 (=> (not res!560220) (not e!456362))))

(declare-datatypes ((array!45568 0))(
  ( (array!45569 (arr!21835 (Array (_ BitVec 32) (_ BitVec 64))) (size!22256 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45568)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821218 (= res!560220 (and (= (size!22255 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22256 _keys!976) (size!22255 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821219 () Bool)

(declare-fun tp_is_empty!14685 () Bool)

(assert (=> b!821219 (= e!456359 tp_is_empty!14685)))

(declare-fun b!821220 () Bool)

(declare-fun e!456358 () Bool)

(assert (=> b!821220 (= e!456358 true)))

(declare-fun zeroValueBefore!34 () V!24581)

(declare-fun minValue!754 () V!24581)

(declare-datatypes ((tuple2!9746 0))(
  ( (tuple2!9747 (_1!4884 (_ BitVec 64)) (_2!4884 V!24581)) )
))
(declare-datatypes ((List!15565 0))(
  ( (Nil!15562) (Cons!15561 (h!16690 tuple2!9746) (t!21900 List!15565)) )
))
(declare-datatypes ((ListLongMap!8569 0))(
  ( (ListLongMap!8570 (toList!4300 List!15565)) )
))
(declare-fun lt!369111 () ListLongMap!8569)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2472 (array!45568 array!45566 (_ BitVec 32) (_ BitVec 32) V!24581 V!24581 (_ BitVec 32) Int) ListLongMap!8569)

(assert (=> b!821220 (= lt!369111 (getCurrentListMap!2472 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821221 () Bool)

(declare-fun e!456361 () Bool)

(assert (=> b!821221 (= e!456361 tp_is_empty!14685)))

(declare-fun b!821222 () Bool)

(declare-fun res!560222 () Bool)

(assert (=> b!821222 (=> (not res!560222) (not e!456362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45568 (_ BitVec 32)) Bool)

(assert (=> b!821222 (= res!560222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23635 () Bool)

(assert (=> mapIsEmpty!23635 mapRes!23635))

(declare-fun res!560219 () Bool)

(assert (=> start!70702 (=> (not res!560219) (not e!456362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70702 (= res!560219 (validMask!0 mask!1312))))

(assert (=> start!70702 e!456362))

(assert (=> start!70702 tp_is_empty!14685))

(declare-fun array_inv!17453 (array!45568) Bool)

(assert (=> start!70702 (array_inv!17453 _keys!976)))

(assert (=> start!70702 true))

(declare-fun e!456357 () Bool)

(declare-fun array_inv!17454 (array!45566) Bool)

(assert (=> start!70702 (and (array_inv!17454 _values!788) e!456357)))

(assert (=> start!70702 tp!45666))

(declare-fun b!821217 () Bool)

(assert (=> b!821217 (= e!456362 (not e!456358))))

(declare-fun res!560221 () Bool)

(assert (=> b!821217 (=> res!560221 e!456358)))

(assert (=> b!821217 (= res!560221 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369110 () ListLongMap!8569)

(declare-fun lt!369112 () ListLongMap!8569)

(assert (=> b!821217 (= lt!369110 lt!369112)))

(declare-datatypes ((Unit!28077 0))(
  ( (Unit!28078) )
))
(declare-fun lt!369113 () Unit!28077)

(declare-fun zeroValueAfter!34 () V!24581)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!436 (array!45568 array!45566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24581 V!24581 V!24581 V!24581 (_ BitVec 32) Int) Unit!28077)

(assert (=> b!821217 (= lt!369113 (lemmaNoChangeToArrayThenSameMapNoExtras!436 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2326 (array!45568 array!45566 (_ BitVec 32) (_ BitVec 32) V!24581 V!24581 (_ BitVec 32) Int) ListLongMap!8569)

(assert (=> b!821217 (= lt!369112 (getCurrentListMapNoExtraKeys!2326 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821217 (= lt!369110 (getCurrentListMapNoExtraKeys!2326 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821223 () Bool)

(assert (=> b!821223 (= e!456357 (and e!456361 mapRes!23635))))

(declare-fun condMapEmpty!23635 () Bool)

(declare-fun mapDefault!23635 () ValueCell!6927)

(assert (=> b!821223 (= condMapEmpty!23635 (= (arr!21834 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6927)) mapDefault!23635)))))

(declare-fun b!821224 () Bool)

(declare-fun res!560218 () Bool)

(assert (=> b!821224 (=> (not res!560218) (not e!456362))))

(declare-datatypes ((List!15566 0))(
  ( (Nil!15563) (Cons!15562 (h!16691 (_ BitVec 64)) (t!21901 List!15566)) )
))
(declare-fun arrayNoDuplicates!0 (array!45568 (_ BitVec 32) List!15566) Bool)

(assert (=> b!821224 (= res!560218 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15563))))

(assert (= (and start!70702 res!560219) b!821218))

(assert (= (and b!821218 res!560220) b!821222))

(assert (= (and b!821222 res!560222) b!821224))

(assert (= (and b!821224 res!560218) b!821217))

(assert (= (and b!821217 (not res!560221)) b!821220))

(assert (= (and b!821223 condMapEmpty!23635) mapIsEmpty!23635))

(assert (= (and b!821223 (not condMapEmpty!23635)) mapNonEmpty!23635))

(get-info :version)

(assert (= (and mapNonEmpty!23635 ((_ is ValueCellFull!6927) mapValue!23635)) b!821219))

(assert (= (and b!821223 ((_ is ValueCellFull!6927) mapDefault!23635)) b!821221))

(assert (= start!70702 b!821223))

(declare-fun m!763049 () Bool)

(assert (=> b!821222 m!763049))

(declare-fun m!763051 () Bool)

(assert (=> b!821224 m!763051))

(declare-fun m!763053 () Bool)

(assert (=> start!70702 m!763053))

(declare-fun m!763055 () Bool)

(assert (=> start!70702 m!763055))

(declare-fun m!763057 () Bool)

(assert (=> start!70702 m!763057))

(declare-fun m!763059 () Bool)

(assert (=> b!821217 m!763059))

(declare-fun m!763061 () Bool)

(assert (=> b!821217 m!763061))

(declare-fun m!763063 () Bool)

(assert (=> b!821217 m!763063))

(declare-fun m!763065 () Bool)

(assert (=> b!821220 m!763065))

(declare-fun m!763067 () Bool)

(assert (=> mapNonEmpty!23635 m!763067))

(check-sat (not b!821217) tp_is_empty!14685 b_and!21837 (not b_next!12975) (not b!821220) (not b!821222) (not b!821224) (not start!70702) (not mapNonEmpty!23635))
(check-sat b_and!21837 (not b_next!12975))
