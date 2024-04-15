; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71226 () Bool)

(assert start!71226)

(declare-fun b_free!13393 () Bool)

(declare-fun b_next!13393 () Bool)

(assert (=> start!71226 (= b_free!13393 (not b_next!13393))))

(declare-fun tp!46942 () Bool)

(declare-fun b_and!22305 () Bool)

(assert (=> start!71226 (= tp!46942 b_and!22305)))

(declare-fun b!827329 () Bool)

(declare-fun e!460887 () Bool)

(assert (=> b!827329 (= e!460887 false)))

(declare-datatypes ((array!46347 0))(
  ( (array!46348 (arr!22218 (Array (_ BitVec 32) (_ BitVec 64))) (size!22639 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46347)

(declare-datatypes ((V!25139 0))(
  ( (V!25140 (val!7599 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25139)

(declare-fun minValue!754 () V!25139)

(declare-datatypes ((ValueCell!7136 0))(
  ( (ValueCellFull!7136 (v!10028 V!25139)) (EmptyCell!7136) )
))
(declare-datatypes ((array!46349 0))(
  ( (array!46350 (arr!22219 (Array (_ BitVec 32) ValueCell!7136)) (size!22640 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46349)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!10086 0))(
  ( (tuple2!10087 (_1!5054 (_ BitVec 64)) (_2!5054 V!25139)) )
))
(declare-datatypes ((List!15872 0))(
  ( (Nil!15869) (Cons!15868 (h!16997 tuple2!10086) (t!22212 List!15872)) )
))
(declare-datatypes ((ListLongMap!8899 0))(
  ( (ListLongMap!8900 (toList!4465 List!15872)) )
))
(declare-fun lt!374701 () ListLongMap!8899)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2497 (array!46347 array!46349 (_ BitVec 32) (_ BitVec 32) V!25139 V!25139 (_ BitVec 32) Int) ListLongMap!8899)

(assert (=> b!827329 (= lt!374701 (getCurrentListMapNoExtraKeys!2497 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374702 () ListLongMap!8899)

(declare-fun zeroValueBefore!34 () V!25139)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827329 (= lt!374702 (getCurrentListMapNoExtraKeys!2497 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827330 () Bool)

(declare-fun res!563950 () Bool)

(assert (=> b!827330 (=> (not res!563950) (not e!460887))))

(assert (=> b!827330 (= res!563950 (and (= (size!22640 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22639 _keys!976) (size!22640 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827331 () Bool)

(declare-fun e!460889 () Bool)

(declare-fun tp_is_empty!15103 () Bool)

(assert (=> b!827331 (= e!460889 tp_is_empty!15103)))

(declare-fun res!563947 () Bool)

(assert (=> start!71226 (=> (not res!563947) (not e!460887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71226 (= res!563947 (validMask!0 mask!1312))))

(assert (=> start!71226 e!460887))

(assert (=> start!71226 tp_is_empty!15103))

(declare-fun array_inv!17767 (array!46347) Bool)

(assert (=> start!71226 (array_inv!17767 _keys!976)))

(assert (=> start!71226 true))

(declare-fun e!460885 () Bool)

(declare-fun array_inv!17768 (array!46349) Bool)

(assert (=> start!71226 (and (array_inv!17768 _values!788) e!460885)))

(assert (=> start!71226 tp!46942))

(declare-fun b!827332 () Bool)

(declare-fun res!563949 () Bool)

(assert (=> b!827332 (=> (not res!563949) (not e!460887))))

(declare-datatypes ((List!15873 0))(
  ( (Nil!15870) (Cons!15869 (h!16998 (_ BitVec 64)) (t!22213 List!15873)) )
))
(declare-fun arrayNoDuplicates!0 (array!46347 (_ BitVec 32) List!15873) Bool)

(assert (=> b!827332 (= res!563949 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15870))))

(declare-fun b!827333 () Bool)

(declare-fun e!460886 () Bool)

(assert (=> b!827333 (= e!460886 tp_is_empty!15103)))

(declare-fun b!827334 () Bool)

(declare-fun res!563948 () Bool)

(assert (=> b!827334 (=> (not res!563948) (not e!460887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46347 (_ BitVec 32)) Bool)

(assert (=> b!827334 (= res!563948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24283 () Bool)

(declare-fun mapRes!24283 () Bool)

(assert (=> mapIsEmpty!24283 mapRes!24283))

(declare-fun b!827335 () Bool)

(assert (=> b!827335 (= e!460885 (and e!460889 mapRes!24283))))

(declare-fun condMapEmpty!24283 () Bool)

(declare-fun mapDefault!24283 () ValueCell!7136)

(assert (=> b!827335 (= condMapEmpty!24283 (= (arr!22219 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7136)) mapDefault!24283)))))

(declare-fun mapNonEmpty!24283 () Bool)

(declare-fun tp!46941 () Bool)

(assert (=> mapNonEmpty!24283 (= mapRes!24283 (and tp!46941 e!460886))))

(declare-fun mapKey!24283 () (_ BitVec 32))

(declare-fun mapValue!24283 () ValueCell!7136)

(declare-fun mapRest!24283 () (Array (_ BitVec 32) ValueCell!7136))

(assert (=> mapNonEmpty!24283 (= (arr!22219 _values!788) (store mapRest!24283 mapKey!24283 mapValue!24283))))

(assert (= (and start!71226 res!563947) b!827330))

(assert (= (and b!827330 res!563950) b!827334))

(assert (= (and b!827334 res!563948) b!827332))

(assert (= (and b!827332 res!563949) b!827329))

(assert (= (and b!827335 condMapEmpty!24283) mapIsEmpty!24283))

(assert (= (and b!827335 (not condMapEmpty!24283)) mapNonEmpty!24283))

(get-info :version)

(assert (= (and mapNonEmpty!24283 ((_ is ValueCellFull!7136) mapValue!24283)) b!827333))

(assert (= (and b!827335 ((_ is ValueCellFull!7136) mapDefault!24283)) b!827331))

(assert (= start!71226 b!827335))

(declare-fun m!769871 () Bool)

(assert (=> b!827329 m!769871))

(declare-fun m!769873 () Bool)

(assert (=> b!827329 m!769873))

(declare-fun m!769875 () Bool)

(assert (=> mapNonEmpty!24283 m!769875))

(declare-fun m!769877 () Bool)

(assert (=> b!827334 m!769877))

(declare-fun m!769879 () Bool)

(assert (=> b!827332 m!769879))

(declare-fun m!769881 () Bool)

(assert (=> start!71226 m!769881))

(declare-fun m!769883 () Bool)

(assert (=> start!71226 m!769883))

(declare-fun m!769885 () Bool)

(assert (=> start!71226 m!769885))

(check-sat tp_is_empty!15103 (not b_next!13393) (not b!827332) (not b!827329) (not mapNonEmpty!24283) (not start!71226) (not b!827334) b_and!22305)
(check-sat b_and!22305 (not b_next!13393))
