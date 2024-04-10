; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70416 () Bool)

(assert start!70416)

(declare-fun b_free!12759 () Bool)

(declare-fun b_next!12759 () Bool)

(assert (=> start!70416 (= b_free!12759 (not b_next!12759))))

(declare-fun tp!45007 () Bool)

(declare-fun b_and!21579 () Bool)

(assert (=> start!70416 (= tp!45007 b_and!21579)))

(declare-fun b!817923 () Bool)

(declare-fun res!558248 () Bool)

(declare-fun e!453936 () Bool)

(assert (=> b!817923 (=> (not res!558248) (not e!453936))))

(declare-datatypes ((array!45138 0))(
  ( (array!45139 (arr!21624 (Array (_ BitVec 32) (_ BitVec 64))) (size!22045 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45138)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45138 (_ BitVec 32)) Bool)

(assert (=> b!817923 (= res!558248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817924 () Bool)

(declare-fun e!453935 () Bool)

(declare-fun tp_is_empty!14469 () Bool)

(assert (=> b!817924 (= e!453935 tp_is_empty!14469)))

(declare-fun b!817925 () Bool)

(declare-fun res!558245 () Bool)

(assert (=> b!817925 (=> (not res!558245) (not e!453936))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24293 0))(
  ( (V!24294 (val!7282 Int)) )
))
(declare-datatypes ((ValueCell!6819 0))(
  ( (ValueCellFull!6819 (v!9711 V!24293)) (EmptyCell!6819) )
))
(declare-datatypes ((array!45140 0))(
  ( (array!45141 (arr!21625 (Array (_ BitVec 32) ValueCell!6819)) (size!22046 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45140)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817925 (= res!558245 (and (= (size!22046 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22045 _keys!976) (size!22046 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23299 () Bool)

(declare-fun mapRes!23299 () Bool)

(assert (=> mapIsEmpty!23299 mapRes!23299))

(declare-fun b!817927 () Bool)

(declare-fun res!558244 () Bool)

(assert (=> b!817927 (=> (not res!558244) (not e!453936))))

(declare-datatypes ((List!15400 0))(
  ( (Nil!15397) (Cons!15396 (h!16525 (_ BitVec 64)) (t!21727 List!15400)) )
))
(declare-fun arrayNoDuplicates!0 (array!45138 (_ BitVec 32) List!15400) Bool)

(assert (=> b!817927 (= res!558244 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15397))))

(declare-fun b!817928 () Bool)

(declare-fun e!453938 () Bool)

(assert (=> b!817928 (= e!453936 (not e!453938))))

(declare-fun res!558247 () Bool)

(assert (=> b!817928 (=> res!558247 e!453938)))

(assert (=> b!817928 (= res!558247 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9572 0))(
  ( (tuple2!9573 (_1!4797 (_ BitVec 64)) (_2!4797 V!24293)) )
))
(declare-datatypes ((List!15401 0))(
  ( (Nil!15398) (Cons!15397 (h!16526 tuple2!9572) (t!21728 List!15401)) )
))
(declare-datatypes ((ListLongMap!8395 0))(
  ( (ListLongMap!8396 (toList!4213 List!15401)) )
))
(declare-fun lt!366470 () ListLongMap!8395)

(declare-fun lt!366472 () ListLongMap!8395)

(assert (=> b!817928 (= lt!366470 lt!366472)))

(declare-datatypes ((Unit!27910 0))(
  ( (Unit!27911) )
))
(declare-fun lt!366471 () Unit!27910)

(declare-fun zeroValueBefore!34 () V!24293)

(declare-fun zeroValueAfter!34 () V!24293)

(declare-fun minValue!754 () V!24293)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!364 (array!45138 array!45140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24293 V!24293 V!24293 V!24293 (_ BitVec 32) Int) Unit!27910)

(assert (=> b!817928 (= lt!366471 (lemmaNoChangeToArrayThenSameMapNoExtras!364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2254 (array!45138 array!45140 (_ BitVec 32) (_ BitVec 32) V!24293 V!24293 (_ BitVec 32) Int) ListLongMap!8395)

(assert (=> b!817928 (= lt!366472 (getCurrentListMapNoExtraKeys!2254 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817928 (= lt!366470 (getCurrentListMapNoExtraKeys!2254 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817929 () Bool)

(declare-fun e!453937 () Bool)

(declare-fun e!453939 () Bool)

(assert (=> b!817929 (= e!453937 (and e!453939 mapRes!23299))))

(declare-fun condMapEmpty!23299 () Bool)

(declare-fun mapDefault!23299 () ValueCell!6819)

(assert (=> b!817929 (= condMapEmpty!23299 (= (arr!21625 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6819)) mapDefault!23299)))))

(declare-fun mapNonEmpty!23299 () Bool)

(declare-fun tp!45006 () Bool)

(assert (=> mapNonEmpty!23299 (= mapRes!23299 (and tp!45006 e!453935))))

(declare-fun mapKey!23299 () (_ BitVec 32))

(declare-fun mapRest!23299 () (Array (_ BitVec 32) ValueCell!6819))

(declare-fun mapValue!23299 () ValueCell!6819)

(assert (=> mapNonEmpty!23299 (= (arr!21625 _values!788) (store mapRest!23299 mapKey!23299 mapValue!23299))))

(declare-fun b!817930 () Bool)

(assert (=> b!817930 (= e!453938 true)))

(declare-fun lt!366469 () ListLongMap!8395)

(declare-fun getCurrentListMap!2419 (array!45138 array!45140 (_ BitVec 32) (_ BitVec 32) V!24293 V!24293 (_ BitVec 32) Int) ListLongMap!8395)

(assert (=> b!817930 (= lt!366469 (getCurrentListMap!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558246 () Bool)

(assert (=> start!70416 (=> (not res!558246) (not e!453936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70416 (= res!558246 (validMask!0 mask!1312))))

(assert (=> start!70416 e!453936))

(assert (=> start!70416 tp_is_empty!14469))

(declare-fun array_inv!17297 (array!45138) Bool)

(assert (=> start!70416 (array_inv!17297 _keys!976)))

(assert (=> start!70416 true))

(declare-fun array_inv!17298 (array!45140) Bool)

(assert (=> start!70416 (and (array_inv!17298 _values!788) e!453937)))

(assert (=> start!70416 tp!45007))

(declare-fun b!817926 () Bool)

(assert (=> b!817926 (= e!453939 tp_is_empty!14469)))

(assert (= (and start!70416 res!558246) b!817925))

(assert (= (and b!817925 res!558245) b!817923))

(assert (= (and b!817923 res!558248) b!817927))

(assert (= (and b!817927 res!558244) b!817928))

(assert (= (and b!817928 (not res!558247)) b!817930))

(assert (= (and b!817929 condMapEmpty!23299) mapIsEmpty!23299))

(assert (= (and b!817929 (not condMapEmpty!23299)) mapNonEmpty!23299))

(get-info :version)

(assert (= (and mapNonEmpty!23299 ((_ is ValueCellFull!6819) mapValue!23299)) b!817924))

(assert (= (and b!817929 ((_ is ValueCellFull!6819) mapDefault!23299)) b!817926))

(assert (= start!70416 b!817929))

(declare-fun m!759425 () Bool)

(assert (=> b!817923 m!759425))

(declare-fun m!759427 () Bool)

(assert (=> start!70416 m!759427))

(declare-fun m!759429 () Bool)

(assert (=> start!70416 m!759429))

(declare-fun m!759431 () Bool)

(assert (=> start!70416 m!759431))

(declare-fun m!759433 () Bool)

(assert (=> mapNonEmpty!23299 m!759433))

(declare-fun m!759435 () Bool)

(assert (=> b!817928 m!759435))

(declare-fun m!759437 () Bool)

(assert (=> b!817928 m!759437))

(declare-fun m!759439 () Bool)

(assert (=> b!817928 m!759439))

(declare-fun m!759441 () Bool)

(assert (=> b!817930 m!759441))

(declare-fun m!759443 () Bool)

(assert (=> b!817927 m!759443))

(check-sat (not b!817927) (not b!817923) (not b!817930) tp_is_empty!14469 (not b_next!12759) (not start!70416) (not b!817928) b_and!21579 (not mapNonEmpty!23299))
(check-sat b_and!21579 (not b_next!12759))
