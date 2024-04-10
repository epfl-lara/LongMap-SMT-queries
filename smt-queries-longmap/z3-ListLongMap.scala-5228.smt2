; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70434 () Bool)

(assert start!70434)

(declare-fun b_free!12777 () Bool)

(declare-fun b_next!12777 () Bool)

(assert (=> start!70434 (= b_free!12777 (not b_next!12777))))

(declare-fun tp!45060 () Bool)

(declare-fun b_and!21597 () Bool)

(assert (=> start!70434 (= tp!45060 b_and!21597)))

(declare-fun mapNonEmpty!23326 () Bool)

(declare-fun mapRes!23326 () Bool)

(declare-fun tp!45061 () Bool)

(declare-fun e!454101 () Bool)

(assert (=> mapNonEmpty!23326 (= mapRes!23326 (and tp!45061 e!454101))))

(declare-datatypes ((V!24317 0))(
  ( (V!24318 (val!7291 Int)) )
))
(declare-datatypes ((ValueCell!6828 0))(
  ( (ValueCellFull!6828 (v!9720 V!24317)) (EmptyCell!6828) )
))
(declare-fun mapRest!23326 () (Array (_ BitVec 32) ValueCell!6828))

(declare-fun mapKey!23326 () (_ BitVec 32))

(declare-datatypes ((array!45174 0))(
  ( (array!45175 (arr!21642 (Array (_ BitVec 32) ValueCell!6828)) (size!22063 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45174)

(declare-fun mapValue!23326 () ValueCell!6828)

(assert (=> mapNonEmpty!23326 (= (arr!21642 _values!788) (store mapRest!23326 mapKey!23326 mapValue!23326))))

(declare-fun b!818139 () Bool)

(declare-fun res!558379 () Bool)

(declare-fun e!454099 () Bool)

(assert (=> b!818139 (=> (not res!558379) (not e!454099))))

(declare-datatypes ((array!45176 0))(
  ( (array!45177 (arr!21643 (Array (_ BitVec 32) (_ BitVec 64))) (size!22064 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45176)

(declare-datatypes ((List!15412 0))(
  ( (Nil!15409) (Cons!15408 (h!16537 (_ BitVec 64)) (t!21739 List!15412)) )
))
(declare-fun arrayNoDuplicates!0 (array!45176 (_ BitVec 32) List!15412) Bool)

(assert (=> b!818139 (= res!558379 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15409))))

(declare-fun b!818140 () Bool)

(declare-fun res!558382 () Bool)

(assert (=> b!818140 (=> (not res!558382) (not e!454099))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818140 (= res!558382 (and (= (size!22063 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22064 _keys!976) (size!22063 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818141 () Bool)

(declare-fun e!454102 () Bool)

(assert (=> b!818141 (= e!454102 true)))

(declare-fun zeroValueBefore!34 () V!24317)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24317)

(declare-datatypes ((tuple2!9582 0))(
  ( (tuple2!9583 (_1!4802 (_ BitVec 64)) (_2!4802 V!24317)) )
))
(declare-datatypes ((List!15413 0))(
  ( (Nil!15410) (Cons!15409 (h!16538 tuple2!9582) (t!21740 List!15413)) )
))
(declare-datatypes ((ListLongMap!8405 0))(
  ( (ListLongMap!8406 (toList!4218 List!15413)) )
))
(declare-fun lt!366580 () ListLongMap!8405)

(declare-fun getCurrentListMap!2424 (array!45176 array!45174 (_ BitVec 32) (_ BitVec 32) V!24317 V!24317 (_ BitVec 32) Int) ListLongMap!8405)

(assert (=> b!818141 (= lt!366580 (getCurrentListMap!2424 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818142 () Bool)

(declare-fun res!558383 () Bool)

(assert (=> b!818142 (=> (not res!558383) (not e!454099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45176 (_ BitVec 32)) Bool)

(assert (=> b!818142 (= res!558383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23326 () Bool)

(assert (=> mapIsEmpty!23326 mapRes!23326))

(declare-fun b!818144 () Bool)

(declare-fun tp_is_empty!14487 () Bool)

(assert (=> b!818144 (= e!454101 tp_is_empty!14487)))

(declare-fun b!818145 () Bool)

(declare-fun e!454097 () Bool)

(declare-fun e!454100 () Bool)

(assert (=> b!818145 (= e!454097 (and e!454100 mapRes!23326))))

(declare-fun condMapEmpty!23326 () Bool)

(declare-fun mapDefault!23326 () ValueCell!6828)

(assert (=> b!818145 (= condMapEmpty!23326 (= (arr!21642 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6828)) mapDefault!23326)))))

(declare-fun b!818146 () Bool)

(assert (=> b!818146 (= e!454100 tp_is_empty!14487)))

(declare-fun res!558380 () Bool)

(assert (=> start!70434 (=> (not res!558380) (not e!454099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70434 (= res!558380 (validMask!0 mask!1312))))

(assert (=> start!70434 e!454099))

(assert (=> start!70434 tp_is_empty!14487))

(declare-fun array_inv!17307 (array!45176) Bool)

(assert (=> start!70434 (array_inv!17307 _keys!976)))

(assert (=> start!70434 true))

(declare-fun array_inv!17308 (array!45174) Bool)

(assert (=> start!70434 (and (array_inv!17308 _values!788) e!454097)))

(assert (=> start!70434 tp!45060))

(declare-fun b!818143 () Bool)

(assert (=> b!818143 (= e!454099 (not e!454102))))

(declare-fun res!558381 () Bool)

(assert (=> b!818143 (=> res!558381 e!454102)))

(assert (=> b!818143 (= res!558381 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366577 () ListLongMap!8405)

(declare-fun lt!366578 () ListLongMap!8405)

(assert (=> b!818143 (= lt!366577 lt!366578)))

(declare-datatypes ((Unit!27920 0))(
  ( (Unit!27921) )
))
(declare-fun lt!366579 () Unit!27920)

(declare-fun zeroValueAfter!34 () V!24317)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!369 (array!45176 array!45174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24317 V!24317 V!24317 V!24317 (_ BitVec 32) Int) Unit!27920)

(assert (=> b!818143 (= lt!366579 (lemmaNoChangeToArrayThenSameMapNoExtras!369 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2259 (array!45176 array!45174 (_ BitVec 32) (_ BitVec 32) V!24317 V!24317 (_ BitVec 32) Int) ListLongMap!8405)

(assert (=> b!818143 (= lt!366578 (getCurrentListMapNoExtraKeys!2259 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818143 (= lt!366577 (getCurrentListMapNoExtraKeys!2259 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70434 res!558380) b!818140))

(assert (= (and b!818140 res!558382) b!818142))

(assert (= (and b!818142 res!558383) b!818139))

(assert (= (and b!818139 res!558379) b!818143))

(assert (= (and b!818143 (not res!558381)) b!818141))

(assert (= (and b!818145 condMapEmpty!23326) mapIsEmpty!23326))

(assert (= (and b!818145 (not condMapEmpty!23326)) mapNonEmpty!23326))

(get-info :version)

(assert (= (and mapNonEmpty!23326 ((_ is ValueCellFull!6828) mapValue!23326)) b!818144))

(assert (= (and b!818145 ((_ is ValueCellFull!6828) mapDefault!23326)) b!818146))

(assert (= start!70434 b!818145))

(declare-fun m!759605 () Bool)

(assert (=> b!818141 m!759605))

(declare-fun m!759607 () Bool)

(assert (=> b!818139 m!759607))

(declare-fun m!759609 () Bool)

(assert (=> b!818143 m!759609))

(declare-fun m!759611 () Bool)

(assert (=> b!818143 m!759611))

(declare-fun m!759613 () Bool)

(assert (=> b!818143 m!759613))

(declare-fun m!759615 () Bool)

(assert (=> b!818142 m!759615))

(declare-fun m!759617 () Bool)

(assert (=> start!70434 m!759617))

(declare-fun m!759619 () Bool)

(assert (=> start!70434 m!759619))

(declare-fun m!759621 () Bool)

(assert (=> start!70434 m!759621))

(declare-fun m!759623 () Bool)

(assert (=> mapNonEmpty!23326 m!759623))

(check-sat (not mapNonEmpty!23326) (not b!818139) tp_is_empty!14487 (not b!818141) (not b!818143) b_and!21597 (not start!70434) (not b_next!12777) (not b!818142))
(check-sat b_and!21597 (not b_next!12777))
