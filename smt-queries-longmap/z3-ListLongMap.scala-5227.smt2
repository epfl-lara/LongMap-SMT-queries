; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70428 () Bool)

(assert start!70428)

(declare-fun b_free!12771 () Bool)

(declare-fun b_next!12771 () Bool)

(assert (=> start!70428 (= b_free!12771 (not b_next!12771))))

(declare-fun tp!45042 () Bool)

(declare-fun b_and!21591 () Bool)

(assert (=> start!70428 (= tp!45042 b_and!21591)))

(declare-fun b!818067 () Bool)

(declare-fun res!558334 () Bool)

(declare-fun e!454047 () Bool)

(assert (=> b!818067 (=> (not res!558334) (not e!454047))))

(declare-datatypes ((array!45162 0))(
  ( (array!45163 (arr!21636 (Array (_ BitVec 32) (_ BitVec 64))) (size!22057 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45162)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24309 0))(
  ( (V!24310 (val!7288 Int)) )
))
(declare-datatypes ((ValueCell!6825 0))(
  ( (ValueCellFull!6825 (v!9717 V!24309)) (EmptyCell!6825) )
))
(declare-datatypes ((array!45164 0))(
  ( (array!45165 (arr!21637 (Array (_ BitVec 32) ValueCell!6825)) (size!22058 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45164)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818067 (= res!558334 (and (= (size!22058 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22057 _keys!976) (size!22058 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818068 () Bool)

(declare-fun res!558337 () Bool)

(assert (=> b!818068 (=> (not res!558337) (not e!454047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45162 (_ BitVec 32)) Bool)

(assert (=> b!818068 (= res!558337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23317 () Bool)

(declare-fun mapRes!23317 () Bool)

(declare-fun tp!45043 () Bool)

(declare-fun e!454046 () Bool)

(assert (=> mapNonEmpty!23317 (= mapRes!23317 (and tp!45043 e!454046))))

(declare-fun mapRest!23317 () (Array (_ BitVec 32) ValueCell!6825))

(declare-fun mapKey!23317 () (_ BitVec 32))

(declare-fun mapValue!23317 () ValueCell!6825)

(assert (=> mapNonEmpty!23317 (= (arr!21637 _values!788) (store mapRest!23317 mapKey!23317 mapValue!23317))))

(declare-fun b!818069 () Bool)

(declare-fun e!454044 () Bool)

(declare-fun e!454043 () Bool)

(assert (=> b!818069 (= e!454044 (and e!454043 mapRes!23317))))

(declare-fun condMapEmpty!23317 () Bool)

(declare-fun mapDefault!23317 () ValueCell!6825)

(assert (=> b!818069 (= condMapEmpty!23317 (= (arr!21637 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6825)) mapDefault!23317)))))

(declare-fun b!818070 () Bool)

(declare-fun e!454048 () Bool)

(assert (=> b!818070 (= e!454048 true)))

(declare-fun zeroValueBefore!34 () V!24309)

(declare-fun minValue!754 () V!24309)

(declare-datatypes ((tuple2!9578 0))(
  ( (tuple2!9579 (_1!4800 (_ BitVec 64)) (_2!4800 V!24309)) )
))
(declare-datatypes ((List!15407 0))(
  ( (Nil!15404) (Cons!15403 (h!16532 tuple2!9578) (t!21734 List!15407)) )
))
(declare-datatypes ((ListLongMap!8401 0))(
  ( (ListLongMap!8402 (toList!4216 List!15407)) )
))
(declare-fun lt!366541 () ListLongMap!8401)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2422 (array!45162 array!45164 (_ BitVec 32) (_ BitVec 32) V!24309 V!24309 (_ BitVec 32) Int) ListLongMap!8401)

(assert (=> b!818070 (= lt!366541 (getCurrentListMap!2422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818071 () Bool)

(declare-fun tp_is_empty!14481 () Bool)

(assert (=> b!818071 (= e!454043 tp_is_empty!14481)))

(declare-fun b!818072 () Bool)

(assert (=> b!818072 (= e!454046 tp_is_empty!14481)))

(declare-fun b!818073 () Bool)

(declare-fun res!558335 () Bool)

(assert (=> b!818073 (=> (not res!558335) (not e!454047))))

(declare-datatypes ((List!15408 0))(
  ( (Nil!15405) (Cons!15404 (h!16533 (_ BitVec 64)) (t!21735 List!15408)) )
))
(declare-fun arrayNoDuplicates!0 (array!45162 (_ BitVec 32) List!15408) Bool)

(assert (=> b!818073 (= res!558335 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15405))))

(declare-fun b!818074 () Bool)

(assert (=> b!818074 (= e!454047 (not e!454048))))

(declare-fun res!558338 () Bool)

(assert (=> b!818074 (=> res!558338 e!454048)))

(assert (=> b!818074 (= res!558338 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366543 () ListLongMap!8401)

(declare-fun lt!366544 () ListLongMap!8401)

(assert (=> b!818074 (= lt!366543 lt!366544)))

(declare-datatypes ((Unit!27916 0))(
  ( (Unit!27917) )
))
(declare-fun lt!366542 () Unit!27916)

(declare-fun zeroValueAfter!34 () V!24309)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!367 (array!45162 array!45164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24309 V!24309 V!24309 V!24309 (_ BitVec 32) Int) Unit!27916)

(assert (=> b!818074 (= lt!366542 (lemmaNoChangeToArrayThenSameMapNoExtras!367 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2257 (array!45162 array!45164 (_ BitVec 32) (_ BitVec 32) V!24309 V!24309 (_ BitVec 32) Int) ListLongMap!8401)

(assert (=> b!818074 (= lt!366544 (getCurrentListMapNoExtraKeys!2257 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818074 (= lt!366543 (getCurrentListMapNoExtraKeys!2257 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558336 () Bool)

(assert (=> start!70428 (=> (not res!558336) (not e!454047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70428 (= res!558336 (validMask!0 mask!1312))))

(assert (=> start!70428 e!454047))

(assert (=> start!70428 tp_is_empty!14481))

(declare-fun array_inv!17303 (array!45162) Bool)

(assert (=> start!70428 (array_inv!17303 _keys!976)))

(assert (=> start!70428 true))

(declare-fun array_inv!17304 (array!45164) Bool)

(assert (=> start!70428 (and (array_inv!17304 _values!788) e!454044)))

(assert (=> start!70428 tp!45042))

(declare-fun mapIsEmpty!23317 () Bool)

(assert (=> mapIsEmpty!23317 mapRes!23317))

(assert (= (and start!70428 res!558336) b!818067))

(assert (= (and b!818067 res!558334) b!818068))

(assert (= (and b!818068 res!558337) b!818073))

(assert (= (and b!818073 res!558335) b!818074))

(assert (= (and b!818074 (not res!558338)) b!818070))

(assert (= (and b!818069 condMapEmpty!23317) mapIsEmpty!23317))

(assert (= (and b!818069 (not condMapEmpty!23317)) mapNonEmpty!23317))

(get-info :version)

(assert (= (and mapNonEmpty!23317 ((_ is ValueCellFull!6825) mapValue!23317)) b!818072))

(assert (= (and b!818069 ((_ is ValueCellFull!6825) mapDefault!23317)) b!818071))

(assert (= start!70428 b!818069))

(declare-fun m!759545 () Bool)

(assert (=> b!818073 m!759545))

(declare-fun m!759547 () Bool)

(assert (=> b!818070 m!759547))

(declare-fun m!759549 () Bool)

(assert (=> b!818068 m!759549))

(declare-fun m!759551 () Bool)

(assert (=> mapNonEmpty!23317 m!759551))

(declare-fun m!759553 () Bool)

(assert (=> b!818074 m!759553))

(declare-fun m!759555 () Bool)

(assert (=> b!818074 m!759555))

(declare-fun m!759557 () Bool)

(assert (=> b!818074 m!759557))

(declare-fun m!759559 () Bool)

(assert (=> start!70428 m!759559))

(declare-fun m!759561 () Bool)

(assert (=> start!70428 m!759561))

(declare-fun m!759563 () Bool)

(assert (=> start!70428 m!759563))

(check-sat b_and!21591 (not start!70428) (not b!818070) (not b!818073) (not b_next!12771) tp_is_empty!14481 (not b!818074) (not mapNonEmpty!23317) (not b!818068))
(check-sat b_and!21591 (not b_next!12771))
