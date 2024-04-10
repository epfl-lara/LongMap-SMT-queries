; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70410 () Bool)

(assert start!70410)

(declare-fun b_free!12753 () Bool)

(declare-fun b_next!12753 () Bool)

(assert (=> start!70410 (= b_free!12753 (not b_next!12753))))

(declare-fun tp!44989 () Bool)

(declare-fun b_and!21573 () Bool)

(assert (=> start!70410 (= tp!44989 b_and!21573)))

(declare-fun b!817851 () Bool)

(declare-fun res!558199 () Bool)

(declare-fun e!453884 () Bool)

(assert (=> b!817851 (=> (not res!558199) (not e!453884))))

(declare-datatypes ((array!45126 0))(
  ( (array!45127 (arr!21618 (Array (_ BitVec 32) (_ BitVec 64))) (size!22039 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45126)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24285 0))(
  ( (V!24286 (val!7279 Int)) )
))
(declare-datatypes ((ValueCell!6816 0))(
  ( (ValueCellFull!6816 (v!9708 V!24285)) (EmptyCell!6816) )
))
(declare-datatypes ((array!45128 0))(
  ( (array!45129 (arr!21619 (Array (_ BitVec 32) ValueCell!6816)) (size!22040 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45128)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817851 (= res!558199 (and (= (size!22040 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22039 _keys!976) (size!22040 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817852 () Bool)

(declare-fun e!453881 () Bool)

(declare-fun tp_is_empty!14463 () Bool)

(assert (=> b!817852 (= e!453881 tp_is_empty!14463)))

(declare-fun b!817853 () Bool)

(declare-fun e!453886 () Bool)

(declare-fun mapRes!23290 () Bool)

(assert (=> b!817853 (= e!453886 (and e!453881 mapRes!23290))))

(declare-fun condMapEmpty!23290 () Bool)

(declare-fun mapDefault!23290 () ValueCell!6816)

(assert (=> b!817853 (= condMapEmpty!23290 (= (arr!21619 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6816)) mapDefault!23290)))))

(declare-fun b!817854 () Bool)

(declare-fun e!453885 () Bool)

(assert (=> b!817854 (= e!453885 tp_is_empty!14463)))

(declare-fun mapIsEmpty!23290 () Bool)

(assert (=> mapIsEmpty!23290 mapRes!23290))

(declare-fun mapNonEmpty!23290 () Bool)

(declare-fun tp!44988 () Bool)

(assert (=> mapNonEmpty!23290 (= mapRes!23290 (and tp!44988 e!453885))))

(declare-fun mapValue!23290 () ValueCell!6816)

(declare-fun mapKey!23290 () (_ BitVec 32))

(declare-fun mapRest!23290 () (Array (_ BitVec 32) ValueCell!6816))

(assert (=> mapNonEmpty!23290 (= (arr!21619 _values!788) (store mapRest!23290 mapKey!23290 mapValue!23290))))

(declare-fun b!817855 () Bool)

(declare-fun e!453883 () Bool)

(assert (=> b!817855 (= e!453884 (not e!453883))))

(declare-fun res!558200 () Bool)

(assert (=> b!817855 (=> res!558200 e!453883)))

(assert (=> b!817855 (= res!558200 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9566 0))(
  ( (tuple2!9567 (_1!4794 (_ BitVec 64)) (_2!4794 V!24285)) )
))
(declare-datatypes ((List!15395 0))(
  ( (Nil!15392) (Cons!15391 (h!16520 tuple2!9566) (t!21722 List!15395)) )
))
(declare-datatypes ((ListLongMap!8389 0))(
  ( (ListLongMap!8390 (toList!4210 List!15395)) )
))
(declare-fun lt!366435 () ListLongMap!8389)

(declare-fun lt!366436 () ListLongMap!8389)

(assert (=> b!817855 (= lt!366435 lt!366436)))

(declare-fun zeroValueBefore!34 () V!24285)

(declare-fun zeroValueAfter!34 () V!24285)

(declare-fun minValue!754 () V!24285)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27904 0))(
  ( (Unit!27905) )
))
(declare-fun lt!366433 () Unit!27904)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!361 (array!45126 array!45128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24285 V!24285 V!24285 V!24285 (_ BitVec 32) Int) Unit!27904)

(assert (=> b!817855 (= lt!366433 (lemmaNoChangeToArrayThenSameMapNoExtras!361 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2251 (array!45126 array!45128 (_ BitVec 32) (_ BitVec 32) V!24285 V!24285 (_ BitVec 32) Int) ListLongMap!8389)

(assert (=> b!817855 (= lt!366436 (getCurrentListMapNoExtraKeys!2251 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817855 (= lt!366435 (getCurrentListMapNoExtraKeys!2251 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817856 () Bool)

(assert (=> b!817856 (= e!453883 true)))

(declare-fun lt!366434 () ListLongMap!8389)

(declare-fun getCurrentListMap!2417 (array!45126 array!45128 (_ BitVec 32) (_ BitVec 32) V!24285 V!24285 (_ BitVec 32) Int) ListLongMap!8389)

(assert (=> b!817856 (= lt!366434 (getCurrentListMap!2417 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558203 () Bool)

(assert (=> start!70410 (=> (not res!558203) (not e!453884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70410 (= res!558203 (validMask!0 mask!1312))))

(assert (=> start!70410 e!453884))

(assert (=> start!70410 tp_is_empty!14463))

(declare-fun array_inv!17291 (array!45126) Bool)

(assert (=> start!70410 (array_inv!17291 _keys!976)))

(assert (=> start!70410 true))

(declare-fun array_inv!17292 (array!45128) Bool)

(assert (=> start!70410 (and (array_inv!17292 _values!788) e!453886)))

(assert (=> start!70410 tp!44989))

(declare-fun b!817857 () Bool)

(declare-fun res!558201 () Bool)

(assert (=> b!817857 (=> (not res!558201) (not e!453884))))

(declare-datatypes ((List!15396 0))(
  ( (Nil!15393) (Cons!15392 (h!16521 (_ BitVec 64)) (t!21723 List!15396)) )
))
(declare-fun arrayNoDuplicates!0 (array!45126 (_ BitVec 32) List!15396) Bool)

(assert (=> b!817857 (= res!558201 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15393))))

(declare-fun b!817858 () Bool)

(declare-fun res!558202 () Bool)

(assert (=> b!817858 (=> (not res!558202) (not e!453884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45126 (_ BitVec 32)) Bool)

(assert (=> b!817858 (= res!558202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70410 res!558203) b!817851))

(assert (= (and b!817851 res!558199) b!817858))

(assert (= (and b!817858 res!558202) b!817857))

(assert (= (and b!817857 res!558201) b!817855))

(assert (= (and b!817855 (not res!558200)) b!817856))

(assert (= (and b!817853 condMapEmpty!23290) mapIsEmpty!23290))

(assert (= (and b!817853 (not condMapEmpty!23290)) mapNonEmpty!23290))

(get-info :version)

(assert (= (and mapNonEmpty!23290 ((_ is ValueCellFull!6816) mapValue!23290)) b!817854))

(assert (= (and b!817853 ((_ is ValueCellFull!6816) mapDefault!23290)) b!817852))

(assert (= start!70410 b!817853))

(declare-fun m!759365 () Bool)

(assert (=> mapNonEmpty!23290 m!759365))

(declare-fun m!759367 () Bool)

(assert (=> b!817856 m!759367))

(declare-fun m!759369 () Bool)

(assert (=> start!70410 m!759369))

(declare-fun m!759371 () Bool)

(assert (=> start!70410 m!759371))

(declare-fun m!759373 () Bool)

(assert (=> start!70410 m!759373))

(declare-fun m!759375 () Bool)

(assert (=> b!817858 m!759375))

(declare-fun m!759377 () Bool)

(assert (=> b!817857 m!759377))

(declare-fun m!759379 () Bool)

(assert (=> b!817855 m!759379))

(declare-fun m!759381 () Bool)

(assert (=> b!817855 m!759381))

(declare-fun m!759383 () Bool)

(assert (=> b!817855 m!759383))

(check-sat (not start!70410) (not b!817855) (not b!817856) (not b_next!12753) (not mapNonEmpty!23290) (not b!817858) tp_is_empty!14463 b_and!21573 (not b!817857))
(check-sat b_and!21573 (not b_next!12753))
