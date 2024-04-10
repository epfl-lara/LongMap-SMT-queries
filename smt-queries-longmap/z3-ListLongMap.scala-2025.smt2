; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35264 () Bool)

(assert start!35264)

(declare-fun mapNonEmpty!13149 () Bool)

(declare-fun mapRes!13149 () Bool)

(declare-fun tp!27045 () Bool)

(declare-fun e!216471 () Bool)

(assert (=> mapNonEmpty!13149 (= mapRes!13149 (and tp!27045 e!216471))))

(declare-datatypes ((V!11341 0))(
  ( (V!11342 (val!3931 Int)) )
))
(declare-datatypes ((ValueCell!3543 0))(
  ( (ValueCellFull!3543 (v!6124 V!11341)) (EmptyCell!3543) )
))
(declare-fun mapRest!13149 () (Array (_ BitVec 32) ValueCell!3543))

(declare-fun mapKey!13149 () (_ BitVec 32))

(declare-datatypes ((array!19135 0))(
  ( (array!19136 (arr!9067 (Array (_ BitVec 32) ValueCell!3543)) (size!9419 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19135)

(declare-fun mapValue!13149 () ValueCell!3543)

(assert (=> mapNonEmpty!13149 (= (arr!9067 _values!1208) (store mapRest!13149 mapKey!13149 mapValue!13149))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun b!353477 () Bool)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun e!216470 () Bool)

(declare-datatypes ((array!19137 0))(
  ( (array!19138 (arr!9068 (Array (_ BitVec 32) (_ BitVec 64))) (size!9420 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19137)

(assert (=> b!353477 (= e!216470 (and (= (size!9419 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9420 _keys!1456) (size!9419 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011) (= (size!9420 _keys!1456) (bvadd #b00000000000000000000000000000001 mask!1842)) (bvsgt #b00000000000000000000000000000000 (size!9420 _keys!1456))))))

(declare-fun b!353478 () Bool)

(declare-fun e!216472 () Bool)

(declare-fun e!216473 () Bool)

(assert (=> b!353478 (= e!216472 (and e!216473 mapRes!13149))))

(declare-fun condMapEmpty!13149 () Bool)

(declare-fun mapDefault!13149 () ValueCell!3543)

(assert (=> b!353478 (= condMapEmpty!13149 (= (arr!9067 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3543)) mapDefault!13149)))))

(declare-fun b!353479 () Bool)

(declare-fun tp_is_empty!7773 () Bool)

(assert (=> b!353479 (= e!216471 tp_is_empty!7773)))

(declare-fun b!353480 () Bool)

(assert (=> b!353480 (= e!216473 tp_is_empty!7773)))

(declare-fun res!195986 () Bool)

(assert (=> start!35264 (=> (not res!195986) (not e!216470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35264 (= res!195986 (validMask!0 mask!1842))))

(assert (=> start!35264 e!216470))

(assert (=> start!35264 true))

(declare-fun array_inv!6680 (array!19135) Bool)

(assert (=> start!35264 (and (array_inv!6680 _values!1208) e!216472)))

(declare-fun array_inv!6681 (array!19137) Bool)

(assert (=> start!35264 (array_inv!6681 _keys!1456)))

(declare-fun mapIsEmpty!13149 () Bool)

(assert (=> mapIsEmpty!13149 mapRes!13149))

(assert (= (and start!35264 res!195986) b!353477))

(assert (= (and b!353478 condMapEmpty!13149) mapIsEmpty!13149))

(assert (= (and b!353478 (not condMapEmpty!13149)) mapNonEmpty!13149))

(get-info :version)

(assert (= (and mapNonEmpty!13149 ((_ is ValueCellFull!3543) mapValue!13149)) b!353479))

(assert (= (and b!353478 ((_ is ValueCellFull!3543) mapDefault!13149)) b!353480))

(assert (= start!35264 b!353478))

(declare-fun m!352847 () Bool)

(assert (=> mapNonEmpty!13149 m!352847))

(declare-fun m!352849 () Bool)

(assert (=> start!35264 m!352849))

(declare-fun m!352851 () Bool)

(assert (=> start!35264 m!352851))

(declare-fun m!352853 () Bool)

(assert (=> start!35264 m!352853))

(check-sat (not start!35264) (not mapNonEmpty!13149) tp_is_empty!7773)
(check-sat)
(get-model)

(declare-fun d!71613 () Bool)

(assert (=> d!71613 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35264 d!71613))

(declare-fun d!71615 () Bool)

(assert (=> d!71615 (= (array_inv!6680 _values!1208) (bvsge (size!9419 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35264 d!71615))

(declare-fun d!71617 () Bool)

(assert (=> d!71617 (= (array_inv!6681 _keys!1456) (bvsge (size!9420 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35264 d!71617))

(declare-fun b!353500 () Bool)

(declare-fun e!216494 () Bool)

(assert (=> b!353500 (= e!216494 tp_is_empty!7773)))

(declare-fun b!353499 () Bool)

(declare-fun e!216495 () Bool)

(assert (=> b!353499 (= e!216495 tp_is_empty!7773)))

(declare-fun condMapEmpty!13155 () Bool)

(declare-fun mapDefault!13155 () ValueCell!3543)

(assert (=> mapNonEmpty!13149 (= condMapEmpty!13155 (= mapRest!13149 ((as const (Array (_ BitVec 32) ValueCell!3543)) mapDefault!13155)))))

(declare-fun mapRes!13155 () Bool)

(assert (=> mapNonEmpty!13149 (= tp!27045 (and e!216494 mapRes!13155))))

(declare-fun mapNonEmpty!13155 () Bool)

(declare-fun tp!27051 () Bool)

(assert (=> mapNonEmpty!13155 (= mapRes!13155 (and tp!27051 e!216495))))

(declare-fun mapRest!13155 () (Array (_ BitVec 32) ValueCell!3543))

(declare-fun mapValue!13155 () ValueCell!3543)

(declare-fun mapKey!13155 () (_ BitVec 32))

(assert (=> mapNonEmpty!13155 (= mapRest!13149 (store mapRest!13155 mapKey!13155 mapValue!13155))))

(declare-fun mapIsEmpty!13155 () Bool)

(assert (=> mapIsEmpty!13155 mapRes!13155))

(assert (= (and mapNonEmpty!13149 condMapEmpty!13155) mapIsEmpty!13155))

(assert (= (and mapNonEmpty!13149 (not condMapEmpty!13155)) mapNonEmpty!13155))

(assert (= (and mapNonEmpty!13155 ((_ is ValueCellFull!3543) mapValue!13155)) b!353499))

(assert (= (and mapNonEmpty!13149 ((_ is ValueCellFull!3543) mapDefault!13155)) b!353500))

(declare-fun m!352863 () Bool)

(assert (=> mapNonEmpty!13155 m!352863))

(check-sat (not mapNonEmpty!13155) tp_is_empty!7773)
(check-sat)
