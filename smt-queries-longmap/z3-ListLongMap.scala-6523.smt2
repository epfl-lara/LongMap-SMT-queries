; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82960 () Bool)

(assert start!82960)

(declare-fun b!968273 () Bool)

(declare-fun e!545669 () Bool)

(declare-fun tp_is_empty!21913 () Bool)

(assert (=> b!968273 (= e!545669 tp_is_empty!21913)))

(declare-fun b!968274 () Bool)

(declare-fun e!545667 () Bool)

(assert (=> b!968274 (= e!545667 tp_is_empty!21913)))

(declare-fun mapIsEmpty!34864 () Bool)

(declare-fun mapRes!34864 () Bool)

(assert (=> mapIsEmpty!34864 mapRes!34864))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34201 0))(
  ( (V!34202 (val!11007 Int)) )
))
(declare-datatypes ((ValueCell!10475 0))(
  ( (ValueCellFull!10475 (v!13564 V!34201)) (EmptyCell!10475) )
))
(declare-datatypes ((array!59826 0))(
  ( (array!59827 (arr!28782 (Array (_ BitVec 32) ValueCell!10475)) (size!29263 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59826)

(declare-fun b!968275 () Bool)

(declare-fun e!545670 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59828 0))(
  ( (array!59829 (arr!28783 (Array (_ BitVec 32) (_ BitVec 64))) (size!29264 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59828)

(assert (=> b!968275 (= e!545670 (and (= (size!29263 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29264 _keys!1717) (size!29263 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (= (size!29264 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)) (bvsgt #b00000000000000000000000000000000 (size!29264 _keys!1717))))))

(declare-fun res!648266 () Bool)

(assert (=> start!82960 (=> (not res!648266) (not e!545670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82960 (= res!648266 (validMask!0 mask!2147))))

(assert (=> start!82960 e!545670))

(assert (=> start!82960 true))

(declare-fun e!545668 () Bool)

(declare-fun array_inv!22347 (array!59826) Bool)

(assert (=> start!82960 (and (array_inv!22347 _values!1425) e!545668)))

(declare-fun array_inv!22348 (array!59828) Bool)

(assert (=> start!82960 (array_inv!22348 _keys!1717)))

(declare-fun b!968276 () Bool)

(assert (=> b!968276 (= e!545668 (and e!545669 mapRes!34864))))

(declare-fun condMapEmpty!34864 () Bool)

(declare-fun mapDefault!34864 () ValueCell!10475)

(assert (=> b!968276 (= condMapEmpty!34864 (= (arr!28782 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10475)) mapDefault!34864)))))

(declare-fun mapNonEmpty!34864 () Bool)

(declare-fun tp!66433 () Bool)

(assert (=> mapNonEmpty!34864 (= mapRes!34864 (and tp!66433 e!545667))))

(declare-fun mapKey!34864 () (_ BitVec 32))

(declare-fun mapValue!34864 () ValueCell!10475)

(declare-fun mapRest!34864 () (Array (_ BitVec 32) ValueCell!10475))

(assert (=> mapNonEmpty!34864 (= (arr!28782 _values!1425) (store mapRest!34864 mapKey!34864 mapValue!34864))))

(assert (= (and start!82960 res!648266) b!968275))

(assert (= (and b!968276 condMapEmpty!34864) mapIsEmpty!34864))

(assert (= (and b!968276 (not condMapEmpty!34864)) mapNonEmpty!34864))

(get-info :version)

(assert (= (and mapNonEmpty!34864 ((_ is ValueCellFull!10475) mapValue!34864)) b!968274))

(assert (= (and b!968276 ((_ is ValueCellFull!10475) mapDefault!34864)) b!968273))

(assert (= start!82960 b!968276))

(declare-fun m!896089 () Bool)

(assert (=> start!82960 m!896089))

(declare-fun m!896091 () Bool)

(assert (=> start!82960 m!896091))

(declare-fun m!896093 () Bool)

(assert (=> start!82960 m!896093))

(declare-fun m!896095 () Bool)

(assert (=> mapNonEmpty!34864 m!896095))

(check-sat (not start!82960) (not mapNonEmpty!34864) tp_is_empty!21913)
(check-sat)
(get-model)

(declare-fun d!116035 () Bool)

(assert (=> d!116035 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!82960 d!116035))

(declare-fun d!116037 () Bool)

(assert (=> d!116037 (= (array_inv!22347 _values!1425) (bvsge (size!29263 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!82960 d!116037))

(declare-fun d!116039 () Bool)

(assert (=> d!116039 (= (array_inv!22348 _keys!1717) (bvsge (size!29264 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!82960 d!116039))

(declare-fun mapIsEmpty!34873 () Bool)

(declare-fun mapRes!34873 () Bool)

(assert (=> mapIsEmpty!34873 mapRes!34873))

(declare-fun condMapEmpty!34873 () Bool)

(declare-fun mapDefault!34873 () ValueCell!10475)

(assert (=> mapNonEmpty!34864 (= condMapEmpty!34873 (= mapRest!34864 ((as const (Array (_ BitVec 32) ValueCell!10475)) mapDefault!34873)))))

(declare-fun e!545707 () Bool)

(assert (=> mapNonEmpty!34864 (= tp!66433 (and e!545707 mapRes!34873))))

(declare-fun b!968307 () Bool)

(declare-fun e!545706 () Bool)

(assert (=> b!968307 (= e!545706 tp_is_empty!21913)))

(declare-fun mapNonEmpty!34873 () Bool)

(declare-fun tp!66442 () Bool)

(assert (=> mapNonEmpty!34873 (= mapRes!34873 (and tp!66442 e!545706))))

(declare-fun mapKey!34873 () (_ BitVec 32))

(declare-fun mapValue!34873 () ValueCell!10475)

(declare-fun mapRest!34873 () (Array (_ BitVec 32) ValueCell!10475))

(assert (=> mapNonEmpty!34873 (= mapRest!34864 (store mapRest!34873 mapKey!34873 mapValue!34873))))

(declare-fun b!968308 () Bool)

(assert (=> b!968308 (= e!545707 tp_is_empty!21913)))

(assert (= (and mapNonEmpty!34864 condMapEmpty!34873) mapIsEmpty!34873))

(assert (= (and mapNonEmpty!34864 (not condMapEmpty!34873)) mapNonEmpty!34873))

(assert (= (and mapNonEmpty!34873 ((_ is ValueCellFull!10475) mapValue!34873)) b!968307))

(assert (= (and mapNonEmpty!34864 ((_ is ValueCellFull!10475) mapDefault!34873)) b!968308))

(declare-fun m!896113 () Bool)

(assert (=> mapNonEmpty!34873 m!896113))

(check-sat (not mapNonEmpty!34873) tp_is_empty!21913)
(check-sat)
