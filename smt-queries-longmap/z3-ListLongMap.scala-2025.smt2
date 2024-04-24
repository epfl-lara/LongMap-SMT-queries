; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35248 () Bool)

(assert start!35248)

(declare-fun res!195980 () Bool)

(declare-fun e!216424 () Bool)

(assert (=> start!35248 (=> (not res!195980) (not e!216424))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35248 (= res!195980 (validMask!0 mask!1842))))

(assert (=> start!35248 e!216424))

(assert (=> start!35248 true))

(declare-datatypes ((V!11339 0))(
  ( (V!11340 (val!3930 Int)) )
))
(declare-datatypes ((ValueCell!3542 0))(
  ( (ValueCellFull!3542 (v!6124 V!11339)) (EmptyCell!3542) )
))
(declare-datatypes ((array!19118 0))(
  ( (array!19119 (arr!9058 (Array (_ BitVec 32) ValueCell!3542)) (size!9410 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19118)

(declare-fun e!216423 () Bool)

(declare-fun array_inv!6688 (array!19118) Bool)

(assert (=> start!35248 (and (array_inv!6688 _values!1208) e!216423)))

(declare-datatypes ((array!19120 0))(
  ( (array!19121 (arr!9059 (Array (_ BitVec 32) (_ BitVec 64))) (size!9411 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19120)

(declare-fun array_inv!6689 (array!19120) Bool)

(assert (=> start!35248 (array_inv!6689 _keys!1456)))

(declare-fun b!353412 () Bool)

(declare-fun e!216425 () Bool)

(declare-fun mapRes!13146 () Bool)

(assert (=> b!353412 (= e!216423 (and e!216425 mapRes!13146))))

(declare-fun condMapEmpty!13146 () Bool)

(declare-fun mapDefault!13146 () ValueCell!3542)

(assert (=> b!353412 (= condMapEmpty!13146 (= (arr!9058 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3542)) mapDefault!13146)))))

(declare-fun b!353413 () Bool)

(declare-fun e!216422 () Bool)

(declare-fun tp_is_empty!7771 () Bool)

(assert (=> b!353413 (= e!216422 tp_is_empty!7771)))

(declare-fun mapIsEmpty!13146 () Bool)

(assert (=> mapIsEmpty!13146 mapRes!13146))

(declare-fun b!353414 () Bool)

(assert (=> b!353414 (= e!216425 tp_is_empty!7771)))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun b!353415 () Bool)

(assert (=> b!353415 (= e!216424 (and (= (size!9410 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9411 _keys!1456) (size!9410 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011) (= (size!9411 _keys!1456) (bvadd #b00000000000000000000000000000001 mask!1842)) (bvsgt #b00000000000000000000000000000000 (size!9411 _keys!1456))))))

(declare-fun mapNonEmpty!13146 () Bool)

(declare-fun tp!27042 () Bool)

(assert (=> mapNonEmpty!13146 (= mapRes!13146 (and tp!27042 e!216422))))

(declare-fun mapRest!13146 () (Array (_ BitVec 32) ValueCell!3542))

(declare-fun mapValue!13146 () ValueCell!3542)

(declare-fun mapKey!13146 () (_ BitVec 32))

(assert (=> mapNonEmpty!13146 (= (arr!9058 _values!1208) (store mapRest!13146 mapKey!13146 mapValue!13146))))

(assert (= (and start!35248 res!195980) b!353415))

(assert (= (and b!353412 condMapEmpty!13146) mapIsEmpty!13146))

(assert (= (and b!353412 (not condMapEmpty!13146)) mapNonEmpty!13146))

(get-info :version)

(assert (= (and mapNonEmpty!13146 ((_ is ValueCellFull!3542) mapValue!13146)) b!353413))

(assert (= (and b!353412 ((_ is ValueCellFull!3542) mapDefault!13146)) b!353414))

(assert (= start!35248 b!353412))

(declare-fun m!353063 () Bool)

(assert (=> start!35248 m!353063))

(declare-fun m!353065 () Bool)

(assert (=> start!35248 m!353065))

(declare-fun m!353067 () Bool)

(assert (=> start!35248 m!353067))

(declare-fun m!353069 () Bool)

(assert (=> mapNonEmpty!13146 m!353069))

(check-sat (not start!35248) (not mapNonEmpty!13146) tp_is_empty!7771)
(check-sat)
(get-model)

(declare-fun d!71641 () Bool)

(assert (=> d!71641 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35248 d!71641))

(declare-fun d!71643 () Bool)

(assert (=> d!71643 (= (array_inv!6688 _values!1208) (bvsge (size!9410 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35248 d!71643))

(declare-fun d!71645 () Bool)

(assert (=> d!71645 (= (array_inv!6689 _keys!1456) (bvsge (size!9411 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35248 d!71645))

(declare-fun mapIsEmpty!13155 () Bool)

(declare-fun mapRes!13155 () Bool)

(assert (=> mapIsEmpty!13155 mapRes!13155))

(declare-fun mapNonEmpty!13155 () Bool)

(declare-fun tp!27051 () Bool)

(declare-fun e!216461 () Bool)

(assert (=> mapNonEmpty!13155 (= mapRes!13155 (and tp!27051 e!216461))))

(declare-fun mapValue!13155 () ValueCell!3542)

(declare-fun mapKey!13155 () (_ BitVec 32))

(declare-fun mapRest!13155 () (Array (_ BitVec 32) ValueCell!3542))

(assert (=> mapNonEmpty!13155 (= mapRest!13146 (store mapRest!13155 mapKey!13155 mapValue!13155))))

(declare-fun b!353447 () Bool)

(declare-fun e!216460 () Bool)

(assert (=> b!353447 (= e!216460 tp_is_empty!7771)))

(declare-fun b!353446 () Bool)

(assert (=> b!353446 (= e!216461 tp_is_empty!7771)))

(declare-fun condMapEmpty!13155 () Bool)

(declare-fun mapDefault!13155 () ValueCell!3542)

(assert (=> mapNonEmpty!13146 (= condMapEmpty!13155 (= mapRest!13146 ((as const (Array (_ BitVec 32) ValueCell!3542)) mapDefault!13155)))))

(assert (=> mapNonEmpty!13146 (= tp!27042 (and e!216460 mapRes!13155))))

(assert (= (and mapNonEmpty!13146 condMapEmpty!13155) mapIsEmpty!13155))

(assert (= (and mapNonEmpty!13146 (not condMapEmpty!13155)) mapNonEmpty!13155))

(assert (= (and mapNonEmpty!13155 ((_ is ValueCellFull!3542) mapValue!13155)) b!353446))

(assert (= (and mapNonEmpty!13146 ((_ is ValueCellFull!3542) mapDefault!13155)) b!353447))

(declare-fun m!353087 () Bool)

(assert (=> mapNonEmpty!13155 m!353087))

(check-sat (not mapNonEmpty!13155) tp_is_empty!7771)
(check-sat)
