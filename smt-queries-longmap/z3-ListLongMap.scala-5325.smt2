; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71376 () Bool)

(assert start!71376)

(declare-fun b_free!13357 () Bool)

(declare-fun b_next!13357 () Bool)

(assert (=> start!71376 (= b_free!13357 (not b_next!13357))))

(declare-fun tp!46834 () Bool)

(declare-fun b_and!22305 () Bool)

(assert (=> start!71376 (= tp!46834 b_and!22305)))

(declare-fun b!828091 () Bool)

(declare-fun e!461343 () Bool)

(declare-fun e!461347 () Bool)

(declare-fun mapRes!24229 () Bool)

(assert (=> b!828091 (= e!461343 (and e!461347 mapRes!24229))))

(declare-fun condMapEmpty!24229 () Bool)

(declare-datatypes ((V!25091 0))(
  ( (V!25092 (val!7581 Int)) )
))
(declare-datatypes ((ValueCell!7118 0))(
  ( (ValueCellFull!7118 (v!10016 V!25091)) (EmptyCell!7118) )
))
(declare-datatypes ((array!46313 0))(
  ( (array!46314 (arr!22196 (Array (_ BitVec 32) ValueCell!7118)) (size!22616 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46313)

(declare-fun mapDefault!24229 () ValueCell!7118)

(assert (=> b!828091 (= condMapEmpty!24229 (= (arr!22196 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7118)) mapDefault!24229)))))

(declare-fun b!828092 () Bool)

(declare-fun tp_is_empty!15067 () Bool)

(assert (=> b!828092 (= e!461347 tp_is_empty!15067)))

(declare-fun b!828093 () Bool)

(declare-fun res!564185 () Bool)

(declare-fun e!461344 () Bool)

(assert (=> b!828093 (=> (not res!564185) (not e!461344))))

(declare-datatypes ((array!46315 0))(
  ( (array!46316 (arr!22197 (Array (_ BitVec 32) (_ BitVec 64))) (size!22617 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46315)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46315 (_ BitVec 32)) Bool)

(assert (=> b!828093 (= res!564185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828094 () Bool)

(declare-fun e!461346 () Bool)

(assert (=> b!828094 (= e!461346 tp_is_empty!15067)))

(declare-fun mapIsEmpty!24229 () Bool)

(assert (=> mapIsEmpty!24229 mapRes!24229))

(declare-fun res!564186 () Bool)

(assert (=> start!71376 (=> (not res!564186) (not e!461344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71376 (= res!564186 (validMask!0 mask!1312))))

(assert (=> start!71376 e!461344))

(assert (=> start!71376 tp_is_empty!15067))

(declare-fun array_inv!17731 (array!46315) Bool)

(assert (=> start!71376 (array_inv!17731 _keys!976)))

(assert (=> start!71376 true))

(declare-fun array_inv!17732 (array!46313) Bool)

(assert (=> start!71376 (and (array_inv!17732 _values!788) e!461343)))

(assert (=> start!71376 tp!46834))

(declare-fun b!828095 () Bool)

(declare-fun res!564183 () Bool)

(assert (=> b!828095 (=> (not res!564183) (not e!461344))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828095 (= res!564183 (and (= (size!22616 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22617 _keys!976) (size!22616 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828096 () Bool)

(assert (=> b!828096 (= e!461344 false)))

(declare-datatypes ((tuple2!9976 0))(
  ( (tuple2!9977 (_1!4999 (_ BitVec 64)) (_2!4999 V!25091)) )
))
(declare-datatypes ((List!15750 0))(
  ( (Nil!15747) (Cons!15746 (h!16881 tuple2!9976) (t!22091 List!15750)) )
))
(declare-datatypes ((ListLongMap!8801 0))(
  ( (ListLongMap!8802 (toList!4416 List!15750)) )
))
(declare-fun lt!375191 () ListLongMap!8801)

(declare-fun zeroValueAfter!34 () V!25091)

(declare-fun minValue!754 () V!25091)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2493 (array!46315 array!46313 (_ BitVec 32) (_ BitVec 32) V!25091 V!25091 (_ BitVec 32) Int) ListLongMap!8801)

(assert (=> b!828096 (= lt!375191 (getCurrentListMapNoExtraKeys!2493 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25091)

(declare-fun lt!375190 () ListLongMap!8801)

(assert (=> b!828096 (= lt!375190 (getCurrentListMapNoExtraKeys!2493 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24229 () Bool)

(declare-fun tp!46833 () Bool)

(assert (=> mapNonEmpty!24229 (= mapRes!24229 (and tp!46833 e!461346))))

(declare-fun mapKey!24229 () (_ BitVec 32))

(declare-fun mapValue!24229 () ValueCell!7118)

(declare-fun mapRest!24229 () (Array (_ BitVec 32) ValueCell!7118))

(assert (=> mapNonEmpty!24229 (= (arr!22196 _values!788) (store mapRest!24229 mapKey!24229 mapValue!24229))))

(declare-fun b!828097 () Bool)

(declare-fun res!564184 () Bool)

(assert (=> b!828097 (=> (not res!564184) (not e!461344))))

(declare-datatypes ((List!15751 0))(
  ( (Nil!15748) (Cons!15747 (h!16882 (_ BitVec 64)) (t!22092 List!15751)) )
))
(declare-fun arrayNoDuplicates!0 (array!46315 (_ BitVec 32) List!15751) Bool)

(assert (=> b!828097 (= res!564184 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15748))))

(assert (= (and start!71376 res!564186) b!828095))

(assert (= (and b!828095 res!564183) b!828093))

(assert (= (and b!828093 res!564185) b!828097))

(assert (= (and b!828097 res!564184) b!828096))

(assert (= (and b!828091 condMapEmpty!24229) mapIsEmpty!24229))

(assert (= (and b!828091 (not condMapEmpty!24229)) mapNonEmpty!24229))

(get-info :version)

(assert (= (and mapNonEmpty!24229 ((_ is ValueCellFull!7118) mapValue!24229)) b!828094))

(assert (= (and b!828091 ((_ is ValueCellFull!7118) mapDefault!24229)) b!828092))

(assert (= start!71376 b!828091))

(declare-fun m!771617 () Bool)

(assert (=> b!828093 m!771617))

(declare-fun m!771619 () Bool)

(assert (=> start!71376 m!771619))

(declare-fun m!771621 () Bool)

(assert (=> start!71376 m!771621))

(declare-fun m!771623 () Bool)

(assert (=> start!71376 m!771623))

(declare-fun m!771625 () Bool)

(assert (=> b!828097 m!771625))

(declare-fun m!771627 () Bool)

(assert (=> b!828096 m!771627))

(declare-fun m!771629 () Bool)

(assert (=> b!828096 m!771629))

(declare-fun m!771631 () Bool)

(assert (=> mapNonEmpty!24229 m!771631))

(check-sat (not mapNonEmpty!24229) (not b!828093) (not start!71376) tp_is_empty!15067 (not b_next!13357) (not b!828096) b_and!22305 (not b!828097))
(check-sat b_and!22305 (not b_next!13357))
