; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77372 () Bool)

(assert start!77372)

(declare-fun res!608886 () Bool)

(declare-fun e!505212 () Bool)

(assert (=> start!77372 (=> (not res!608886) (not e!505212))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77372 (= res!608886 (validMask!0 mask!1756))))

(assert (=> start!77372 e!505212))

(assert (=> start!77372 true))

(declare-datatypes ((V!29537 0))(
  ( (V!29538 (val!9265 Int)) )
))
(declare-datatypes ((ValueCell!8733 0))(
  ( (ValueCellFull!8733 (v!11769 V!29537)) (EmptyCell!8733) )
))
(declare-datatypes ((array!52920 0))(
  ( (array!52921 (arr!25425 (Array (_ BitVec 32) ValueCell!8733)) (size!25884 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52920)

(declare-fun e!505210 () Bool)

(declare-fun array_inv!19938 (array!52920) Bool)

(assert (=> start!77372 (and (array_inv!19938 _values!1152) e!505210)))

(declare-datatypes ((array!52922 0))(
  ( (array!52923 (arr!25426 (Array (_ BitVec 32) (_ BitVec 64))) (size!25885 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52922)

(declare-fun array_inv!19939 (array!52922) Bool)

(assert (=> start!77372 (array_inv!19939 _keys!1386)))

(declare-fun b!902190 () Bool)

(declare-fun e!505213 () Bool)

(declare-fun tp_is_empty!18429 () Bool)

(assert (=> b!902190 (= e!505213 tp_is_empty!18429)))

(declare-fun mapIsEmpty!29338 () Bool)

(declare-fun mapRes!29338 () Bool)

(assert (=> mapIsEmpty!29338 mapRes!29338))

(declare-fun mapNonEmpty!29338 () Bool)

(declare-fun tp!56397 () Bool)

(assert (=> mapNonEmpty!29338 (= mapRes!29338 (and tp!56397 e!505213))))

(declare-fun mapValue!29338 () ValueCell!8733)

(declare-fun mapRest!29338 () (Array (_ BitVec 32) ValueCell!8733))

(declare-fun mapKey!29338 () (_ BitVec 32))

(assert (=> mapNonEmpty!29338 (= (arr!25425 _values!1152) (store mapRest!29338 mapKey!29338 mapValue!29338))))

(declare-fun b!902191 () Bool)

(declare-fun e!505209 () Bool)

(assert (=> b!902191 (= e!505209 tp_is_empty!18429)))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun b!902192 () Bool)

(assert (=> b!902192 (= e!505212 (and (= (size!25884 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25885 _keys!1386) (size!25884 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (= (size!25885 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)) (bvsgt #b00000000000000000000000000000000 (size!25885 _keys!1386))))))

(declare-fun b!902193 () Bool)

(assert (=> b!902193 (= e!505210 (and e!505209 mapRes!29338))))

(declare-fun condMapEmpty!29338 () Bool)

(declare-fun mapDefault!29338 () ValueCell!8733)

(assert (=> b!902193 (= condMapEmpty!29338 (= (arr!25425 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8733)) mapDefault!29338)))))

(assert (= (and start!77372 res!608886) b!902192))

(assert (= (and b!902193 condMapEmpty!29338) mapIsEmpty!29338))

(assert (= (and b!902193 (not condMapEmpty!29338)) mapNonEmpty!29338))

(get-info :version)

(assert (= (and mapNonEmpty!29338 ((_ is ValueCellFull!8733) mapValue!29338)) b!902190))

(assert (= (and b!902193 ((_ is ValueCellFull!8733) mapDefault!29338)) b!902191))

(assert (= start!77372 b!902193))

(declare-fun m!838295 () Bool)

(assert (=> start!77372 m!838295))

(declare-fun m!838297 () Bool)

(assert (=> start!77372 m!838297))

(declare-fun m!838299 () Bool)

(assert (=> start!77372 m!838299))

(declare-fun m!838301 () Bool)

(assert (=> mapNonEmpty!29338 m!838301))

(check-sat (not start!77372) (not mapNonEmpty!29338) tp_is_empty!18429)
(check-sat)
(get-model)

(declare-fun d!111921 () Bool)

(assert (=> d!111921 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77372 d!111921))

(declare-fun d!111923 () Bool)

(assert (=> d!111923 (= (array_inv!19938 _values!1152) (bvsge (size!25884 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77372 d!111923))

(declare-fun d!111925 () Bool)

(assert (=> d!111925 (= (array_inv!19939 _keys!1386) (bvsge (size!25885 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77372 d!111925))

(declare-fun b!902213 () Bool)

(declare-fun e!505234 () Bool)

(assert (=> b!902213 (= e!505234 tp_is_empty!18429)))

(declare-fun mapNonEmpty!29344 () Bool)

(declare-fun mapRes!29344 () Bool)

(declare-fun tp!56403 () Bool)

(declare-fun e!505233 () Bool)

(assert (=> mapNonEmpty!29344 (= mapRes!29344 (and tp!56403 e!505233))))

(declare-fun mapKey!29344 () (_ BitVec 32))

(declare-fun mapRest!29344 () (Array (_ BitVec 32) ValueCell!8733))

(declare-fun mapValue!29344 () ValueCell!8733)

(assert (=> mapNonEmpty!29344 (= mapRest!29338 (store mapRest!29344 mapKey!29344 mapValue!29344))))

(declare-fun b!902212 () Bool)

(assert (=> b!902212 (= e!505233 tp_is_empty!18429)))

(declare-fun condMapEmpty!29344 () Bool)

(declare-fun mapDefault!29344 () ValueCell!8733)

(assert (=> mapNonEmpty!29338 (= condMapEmpty!29344 (= mapRest!29338 ((as const (Array (_ BitVec 32) ValueCell!8733)) mapDefault!29344)))))

(assert (=> mapNonEmpty!29338 (= tp!56397 (and e!505234 mapRes!29344))))

(declare-fun mapIsEmpty!29344 () Bool)

(assert (=> mapIsEmpty!29344 mapRes!29344))

(assert (= (and mapNonEmpty!29338 condMapEmpty!29344) mapIsEmpty!29344))

(assert (= (and mapNonEmpty!29338 (not condMapEmpty!29344)) mapNonEmpty!29344))

(assert (= (and mapNonEmpty!29344 ((_ is ValueCellFull!8733) mapValue!29344)) b!902212))

(assert (= (and mapNonEmpty!29338 ((_ is ValueCellFull!8733) mapDefault!29344)) b!902213))

(declare-fun m!838311 () Bool)

(assert (=> mapNonEmpty!29344 m!838311))

(check-sat (not mapNonEmpty!29344) tp_is_empty!18429)
(check-sat)
