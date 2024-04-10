; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70080 () Bool)

(assert start!70080)

(declare-fun b_free!12501 () Bool)

(declare-fun b_next!12501 () Bool)

(assert (=> start!70080 (= b_free!12501 (not b_next!12501))))

(declare-fun tp!44217 () Bool)

(declare-fun b_and!21273 () Bool)

(assert (=> start!70080 (= tp!44217 b_and!21273)))

(declare-fun mapIsEmpty!22897 () Bool)

(declare-fun mapRes!22897 () Bool)

(assert (=> mapIsEmpty!22897 mapRes!22897))

(declare-fun b!814416 () Bool)

(declare-fun res!556264 () Bool)

(declare-fun e!451439 () Bool)

(assert (=> b!814416 (=> (not res!556264) (not e!451439))))

(declare-datatypes ((array!44624 0))(
  ( (array!44625 (arr!21372 (Array (_ BitVec 32) (_ BitVec 64))) (size!21793 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44624)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44624 (_ BitVec 32)) Bool)

(assert (=> b!814416 (= res!556264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22897 () Bool)

(declare-fun tp!44218 () Bool)

(declare-fun e!451440 () Bool)

(assert (=> mapNonEmpty!22897 (= mapRes!22897 (and tp!44218 e!451440))))

(declare-datatypes ((V!23949 0))(
  ( (V!23950 (val!7153 Int)) )
))
(declare-datatypes ((ValueCell!6690 0))(
  ( (ValueCellFull!6690 (v!9580 V!23949)) (EmptyCell!6690) )
))
(declare-fun mapRest!22897 () (Array (_ BitVec 32) ValueCell!6690))

(declare-datatypes ((array!44626 0))(
  ( (array!44627 (arr!21373 (Array (_ BitVec 32) ValueCell!6690)) (size!21794 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44626)

(declare-fun mapValue!22897 () ValueCell!6690)

(declare-fun mapKey!22897 () (_ BitVec 32))

(assert (=> mapNonEmpty!22897 (= (arr!21373 _values!788) (store mapRest!22897 mapKey!22897 mapValue!22897))))

(declare-fun b!814417 () Bool)

(declare-fun e!451441 () Bool)

(declare-fun tp_is_empty!14211 () Bool)

(assert (=> b!814417 (= e!451441 tp_is_empty!14211)))

(declare-fun b!814418 () Bool)

(declare-fun res!556266 () Bool)

(assert (=> b!814418 (=> (not res!556266) (not e!451439))))

(declare-datatypes ((List!15207 0))(
  ( (Nil!15204) (Cons!15203 (h!16332 (_ BitVec 64)) (t!21524 List!15207)) )
))
(declare-fun arrayNoDuplicates!0 (array!44624 (_ BitVec 32) List!15207) Bool)

(assert (=> b!814418 (= res!556266 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15204))))

(declare-fun b!814419 () Bool)

(assert (=> b!814419 (= e!451439 (not true))))

(declare-datatypes ((tuple2!9374 0))(
  ( (tuple2!9375 (_1!4698 (_ BitVec 64)) (_2!4698 V!23949)) )
))
(declare-datatypes ((List!15208 0))(
  ( (Nil!15205) (Cons!15204 (h!16333 tuple2!9374) (t!21525 List!15208)) )
))
(declare-datatypes ((ListLongMap!8197 0))(
  ( (ListLongMap!8198 (toList!4114 List!15208)) )
))
(declare-fun lt!364606 () ListLongMap!8197)

(declare-fun lt!364608 () ListLongMap!8197)

(assert (=> b!814419 (= lt!364606 lt!364608)))

(declare-fun zeroValueBefore!34 () V!23949)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23949)

(declare-fun minValue!754 () V!23949)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27726 0))(
  ( (Unit!27727) )
))
(declare-fun lt!364607 () Unit!27726)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!274 (array!44624 array!44626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23949 V!23949 V!23949 V!23949 (_ BitVec 32) Int) Unit!27726)

(assert (=> b!814419 (= lt!364607 (lemmaNoChangeToArrayThenSameMapNoExtras!274 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2164 (array!44624 array!44626 (_ BitVec 32) (_ BitVec 32) V!23949 V!23949 (_ BitVec 32) Int) ListLongMap!8197)

(assert (=> b!814419 (= lt!364608 (getCurrentListMapNoExtraKeys!2164 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814419 (= lt!364606 (getCurrentListMapNoExtraKeys!2164 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814415 () Bool)

(declare-fun res!556263 () Bool)

(assert (=> b!814415 (=> (not res!556263) (not e!451439))))

(assert (=> b!814415 (= res!556263 (and (= (size!21794 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21793 _keys!976) (size!21794 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556265 () Bool)

(assert (=> start!70080 (=> (not res!556265) (not e!451439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70080 (= res!556265 (validMask!0 mask!1312))))

(assert (=> start!70080 e!451439))

(assert (=> start!70080 tp_is_empty!14211))

(declare-fun array_inv!17101 (array!44624) Bool)

(assert (=> start!70080 (array_inv!17101 _keys!976)))

(assert (=> start!70080 true))

(declare-fun e!451442 () Bool)

(declare-fun array_inv!17102 (array!44626) Bool)

(assert (=> start!70080 (and (array_inv!17102 _values!788) e!451442)))

(assert (=> start!70080 tp!44217))

(declare-fun b!814420 () Bool)

(assert (=> b!814420 (= e!451442 (and e!451441 mapRes!22897))))

(declare-fun condMapEmpty!22897 () Bool)

(declare-fun mapDefault!22897 () ValueCell!6690)

(assert (=> b!814420 (= condMapEmpty!22897 (= (arr!21373 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6690)) mapDefault!22897)))))

(declare-fun b!814421 () Bool)

(assert (=> b!814421 (= e!451440 tp_is_empty!14211)))

(assert (= (and start!70080 res!556265) b!814415))

(assert (= (and b!814415 res!556263) b!814416))

(assert (= (and b!814416 res!556264) b!814418))

(assert (= (and b!814418 res!556266) b!814419))

(assert (= (and b!814420 condMapEmpty!22897) mapIsEmpty!22897))

(assert (= (and b!814420 (not condMapEmpty!22897)) mapNonEmpty!22897))

(get-info :version)

(assert (= (and mapNonEmpty!22897 ((_ is ValueCellFull!6690) mapValue!22897)) b!814421))

(assert (= (and b!814420 ((_ is ValueCellFull!6690) mapDefault!22897)) b!814417))

(assert (= start!70080 b!814420))

(declare-fun m!756233 () Bool)

(assert (=> b!814418 m!756233))

(declare-fun m!756235 () Bool)

(assert (=> start!70080 m!756235))

(declare-fun m!756237 () Bool)

(assert (=> start!70080 m!756237))

(declare-fun m!756239 () Bool)

(assert (=> start!70080 m!756239))

(declare-fun m!756241 () Bool)

(assert (=> b!814419 m!756241))

(declare-fun m!756243 () Bool)

(assert (=> b!814419 m!756243))

(declare-fun m!756245 () Bool)

(assert (=> b!814419 m!756245))

(declare-fun m!756247 () Bool)

(assert (=> b!814416 m!756247))

(declare-fun m!756249 () Bool)

(assert (=> mapNonEmpty!22897 m!756249))

(check-sat (not b!814416) (not b!814419) (not start!70080) (not b_next!12501) b_and!21273 tp_is_empty!14211 (not b!814418) (not mapNonEmpty!22897))
(check-sat b_and!21273 (not b_next!12501))
