; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35248 () Bool)

(assert start!35248)

(declare-fun mapIsEmpty!13146 () Bool)

(declare-fun mapRes!13146 () Bool)

(assert (=> mapIsEmpty!13146 mapRes!13146))

(declare-fun mapNonEmpty!13146 () Bool)

(declare-fun tp!27042 () Bool)

(declare-fun e!216281 () Bool)

(assert (=> mapNonEmpty!13146 (= mapRes!13146 (and tp!27042 e!216281))))

(declare-fun mapKey!13146 () (_ BitVec 32))

(declare-datatypes ((V!11339 0))(
  ( (V!11340 (val!3930 Int)) )
))
(declare-datatypes ((ValueCell!3542 0))(
  ( (ValueCellFull!3542 (v!6117 V!11339)) (EmptyCell!3542) )
))
(declare-fun mapRest!13146 () (Array (_ BitVec 32) ValueCell!3542))

(declare-fun mapValue!13146 () ValueCell!3542)

(declare-datatypes ((array!19109 0))(
  ( (array!19110 (arr!9054 (Array (_ BitVec 32) ValueCell!3542)) (size!9407 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19109)

(assert (=> mapNonEmpty!13146 (= (arr!9054 _values!1208) (store mapRest!13146 mapKey!13146 mapValue!13146))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun b!353191 () Bool)

(declare-datatypes ((array!19111 0))(
  ( (array!19112 (arr!9055 (Array (_ BitVec 32) (_ BitVec 64))) (size!9408 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19111)

(declare-fun e!216282 () Bool)

(assert (=> b!353191 (= e!216282 (and (= (size!9407 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9408 _keys!1456) (size!9407 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011) (= (size!9408 _keys!1456) (bvadd #b00000000000000000000000000000001 mask!1842)) (bvsgt #b00000000000000000000000000000000 (size!9408 _keys!1456))))))

(declare-fun b!353192 () Bool)

(declare-fun e!216280 () Bool)

(declare-fun e!216279 () Bool)

(assert (=> b!353192 (= e!216280 (and e!216279 mapRes!13146))))

(declare-fun condMapEmpty!13146 () Bool)

(declare-fun mapDefault!13146 () ValueCell!3542)

(assert (=> b!353192 (= condMapEmpty!13146 (= (arr!9054 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3542)) mapDefault!13146)))))

(declare-fun b!353193 () Bool)

(declare-fun tp_is_empty!7771 () Bool)

(assert (=> b!353193 (= e!216279 tp_is_empty!7771)))

(declare-fun b!353190 () Bool)

(assert (=> b!353190 (= e!216281 tp_is_empty!7771)))

(declare-fun res!195854 () Bool)

(assert (=> start!35248 (=> (not res!195854) (not e!216282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35248 (= res!195854 (validMask!0 mask!1842))))

(assert (=> start!35248 e!216282))

(assert (=> start!35248 true))

(declare-fun array_inv!6700 (array!19109) Bool)

(assert (=> start!35248 (and (array_inv!6700 _values!1208) e!216280)))

(declare-fun array_inv!6701 (array!19111) Bool)

(assert (=> start!35248 (array_inv!6701 _keys!1456)))

(assert (= (and start!35248 res!195854) b!353191))

(assert (= (and b!353192 condMapEmpty!13146) mapIsEmpty!13146))

(assert (= (and b!353192 (not condMapEmpty!13146)) mapNonEmpty!13146))

(get-info :version)

(assert (= (and mapNonEmpty!13146 ((_ is ValueCellFull!3542) mapValue!13146)) b!353190))

(assert (= (and b!353192 ((_ is ValueCellFull!3542) mapDefault!13146)) b!353193))

(assert (= start!35248 b!353192))

(declare-fun m!352109 () Bool)

(assert (=> mapNonEmpty!13146 m!352109))

(declare-fun m!352111 () Bool)

(assert (=> start!35248 m!352111))

(declare-fun m!352113 () Bool)

(assert (=> start!35248 m!352113))

(declare-fun m!352115 () Bool)

(assert (=> start!35248 m!352115))

(check-sat (not start!35248) (not mapNonEmpty!13146) tp_is_empty!7771)
(check-sat)
(get-model)

(declare-fun d!71407 () Bool)

(assert (=> d!71407 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35248 d!71407))

(declare-fun d!71409 () Bool)

(assert (=> d!71409 (= (array_inv!6700 _values!1208) (bvsge (size!9407 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35248 d!71409))

(declare-fun d!71411 () Bool)

(assert (=> d!71411 (= (array_inv!6701 _keys!1456) (bvsge (size!9408 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35248 d!71411))

(declare-fun mapNonEmpty!13155 () Bool)

(declare-fun mapRes!13155 () Bool)

(declare-fun tp!27051 () Bool)

(declare-fun e!216319 () Bool)

(assert (=> mapNonEmpty!13155 (= mapRes!13155 (and tp!27051 e!216319))))

(declare-fun mapValue!13155 () ValueCell!3542)

(declare-fun mapRest!13155 () (Array (_ BitVec 32) ValueCell!3542))

(declare-fun mapKey!13155 () (_ BitVec 32))

(assert (=> mapNonEmpty!13155 (= mapRest!13146 (store mapRest!13155 mapKey!13155 mapValue!13155))))

(declare-fun b!353225 () Bool)

(declare-fun e!216318 () Bool)

(assert (=> b!353225 (= e!216318 tp_is_empty!7771)))

(declare-fun condMapEmpty!13155 () Bool)

(declare-fun mapDefault!13155 () ValueCell!3542)

(assert (=> mapNonEmpty!13146 (= condMapEmpty!13155 (= mapRest!13146 ((as const (Array (_ BitVec 32) ValueCell!3542)) mapDefault!13155)))))

(assert (=> mapNonEmpty!13146 (= tp!27042 (and e!216318 mapRes!13155))))

(declare-fun b!353224 () Bool)

(assert (=> b!353224 (= e!216319 tp_is_empty!7771)))

(declare-fun mapIsEmpty!13155 () Bool)

(assert (=> mapIsEmpty!13155 mapRes!13155))

(assert (= (and mapNonEmpty!13146 condMapEmpty!13155) mapIsEmpty!13155))

(assert (= (and mapNonEmpty!13146 (not condMapEmpty!13155)) mapNonEmpty!13155))

(assert (= (and mapNonEmpty!13155 ((_ is ValueCellFull!3542) mapValue!13155)) b!353224))

(assert (= (and mapNonEmpty!13146 ((_ is ValueCellFull!3542) mapDefault!13155)) b!353225))

(declare-fun m!352133 () Bool)

(assert (=> mapNonEmpty!13155 m!352133))

(check-sat (not mapNonEmpty!13155) tp_is_empty!7771)
(check-sat)
