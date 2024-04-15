; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70394 () Bool)

(assert start!70394)

(declare-fun b_free!12757 () Bool)

(declare-fun b_next!12757 () Bool)

(assert (=> start!70394 (= b_free!12757 (not b_next!12757))))

(declare-fun tp!45000 () Bool)

(declare-fun b_and!21551 () Bool)

(assert (=> start!70394 (= tp!45000 b_and!21551)))

(declare-fun b!817653 () Bool)

(declare-fun e!453767 () Bool)

(declare-fun tp_is_empty!14467 () Bool)

(assert (=> b!817653 (= e!453767 tp_is_empty!14467)))

(declare-fun res!558127 () Bool)

(declare-fun e!453770 () Bool)

(assert (=> start!70394 (=> (not res!558127) (not e!453770))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70394 (= res!558127 (validMask!0 mask!1312))))

(assert (=> start!70394 e!453770))

(assert (=> start!70394 tp_is_empty!14467))

(declare-datatypes ((array!45111 0))(
  ( (array!45112 (arr!21611 (Array (_ BitVec 32) (_ BitVec 64))) (size!22032 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45111)

(declare-fun array_inv!17349 (array!45111) Bool)

(assert (=> start!70394 (array_inv!17349 _keys!976)))

(assert (=> start!70394 true))

(declare-datatypes ((V!24291 0))(
  ( (V!24292 (val!7281 Int)) )
))
(declare-datatypes ((ValueCell!6818 0))(
  ( (ValueCellFull!6818 (v!9704 V!24291)) (EmptyCell!6818) )
))
(declare-datatypes ((array!45113 0))(
  ( (array!45114 (arr!21612 (Array (_ BitVec 32) ValueCell!6818)) (size!22033 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45113)

(declare-fun e!453771 () Bool)

(declare-fun array_inv!17350 (array!45113) Bool)

(assert (=> start!70394 (and (array_inv!17350 _values!788) e!453771)))

(assert (=> start!70394 tp!45000))

(declare-fun b!817654 () Bool)

(declare-fun e!453772 () Bool)

(assert (=> b!817654 (= e!453770 (not e!453772))))

(declare-fun res!558124 () Bool)

(assert (=> b!817654 (=> res!558124 e!453772)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!817654 (= res!558124 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9586 0))(
  ( (tuple2!9587 (_1!4804 (_ BitVec 64)) (_2!4804 V!24291)) )
))
(declare-datatypes ((List!15409 0))(
  ( (Nil!15406) (Cons!15405 (h!16534 tuple2!9586) (t!21727 List!15409)) )
))
(declare-datatypes ((ListLongMap!8399 0))(
  ( (ListLongMap!8400 (toList!4215 List!15409)) )
))
(declare-fun lt!366217 () ListLongMap!8399)

(declare-fun lt!366214 () ListLongMap!8399)

(assert (=> b!817654 (= lt!366217 lt!366214)))

(declare-fun zeroValueBefore!34 () V!24291)

(declare-fun zeroValueAfter!34 () V!24291)

(declare-fun minValue!754 () V!24291)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27856 0))(
  ( (Unit!27857) )
))
(declare-fun lt!366215 () Unit!27856)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!367 (array!45111 array!45113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24291 V!24291 V!24291 V!24291 (_ BitVec 32) Int) Unit!27856)

(assert (=> b!817654 (= lt!366215 (lemmaNoChangeToArrayThenSameMapNoExtras!367 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2274 (array!45111 array!45113 (_ BitVec 32) (_ BitVec 32) V!24291 V!24291 (_ BitVec 32) Int) ListLongMap!8399)

(assert (=> b!817654 (= lt!366214 (getCurrentListMapNoExtraKeys!2274 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817654 (= lt!366217 (getCurrentListMapNoExtraKeys!2274 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817655 () Bool)

(declare-fun res!558126 () Bool)

(assert (=> b!817655 (=> (not res!558126) (not e!453770))))

(assert (=> b!817655 (= res!558126 (and (= (size!22033 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22032 _keys!976) (size!22033 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817656 () Bool)

(declare-fun e!453769 () Bool)

(declare-fun mapRes!23296 () Bool)

(assert (=> b!817656 (= e!453771 (and e!453769 mapRes!23296))))

(declare-fun condMapEmpty!23296 () Bool)

(declare-fun mapDefault!23296 () ValueCell!6818)

(assert (=> b!817656 (= condMapEmpty!23296 (= (arr!21612 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6818)) mapDefault!23296)))))

(declare-fun mapIsEmpty!23296 () Bool)

(assert (=> mapIsEmpty!23296 mapRes!23296))

(declare-fun mapNonEmpty!23296 () Bool)

(declare-fun tp!45001 () Bool)

(assert (=> mapNonEmpty!23296 (= mapRes!23296 (and tp!45001 e!453767))))

(declare-fun mapValue!23296 () ValueCell!6818)

(declare-fun mapKey!23296 () (_ BitVec 32))

(declare-fun mapRest!23296 () (Array (_ BitVec 32) ValueCell!6818))

(assert (=> mapNonEmpty!23296 (= (arr!21612 _values!788) (store mapRest!23296 mapKey!23296 mapValue!23296))))

(declare-fun b!817657 () Bool)

(assert (=> b!817657 (= e!453772 true)))

(declare-fun lt!366216 () ListLongMap!8399)

(declare-fun getCurrentListMap!2368 (array!45111 array!45113 (_ BitVec 32) (_ BitVec 32) V!24291 V!24291 (_ BitVec 32) Int) ListLongMap!8399)

(assert (=> b!817657 (= lt!366216 (getCurrentListMap!2368 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817658 () Bool)

(declare-fun res!558123 () Bool)

(assert (=> b!817658 (=> (not res!558123) (not e!453770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45111 (_ BitVec 32)) Bool)

(assert (=> b!817658 (= res!558123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817659 () Bool)

(assert (=> b!817659 (= e!453769 tp_is_empty!14467)))

(declare-fun b!817660 () Bool)

(declare-fun res!558125 () Bool)

(assert (=> b!817660 (=> (not res!558125) (not e!453770))))

(declare-datatypes ((List!15410 0))(
  ( (Nil!15407) (Cons!15406 (h!16535 (_ BitVec 64)) (t!21728 List!15410)) )
))
(declare-fun arrayNoDuplicates!0 (array!45111 (_ BitVec 32) List!15410) Bool)

(assert (=> b!817660 (= res!558125 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15407))))

(assert (= (and start!70394 res!558127) b!817655))

(assert (= (and b!817655 res!558126) b!817658))

(assert (= (and b!817658 res!558123) b!817660))

(assert (= (and b!817660 res!558125) b!817654))

(assert (= (and b!817654 (not res!558124)) b!817657))

(assert (= (and b!817656 condMapEmpty!23296) mapIsEmpty!23296))

(assert (= (and b!817656 (not condMapEmpty!23296)) mapNonEmpty!23296))

(get-info :version)

(assert (= (and mapNonEmpty!23296 ((_ is ValueCellFull!6818) mapValue!23296)) b!817653))

(assert (= (and b!817656 ((_ is ValueCellFull!6818) mapDefault!23296)) b!817659))

(assert (= start!70394 b!817656))

(declare-fun m!758653 () Bool)

(assert (=> mapNonEmpty!23296 m!758653))

(declare-fun m!758655 () Bool)

(assert (=> b!817657 m!758655))

(declare-fun m!758657 () Bool)

(assert (=> start!70394 m!758657))

(declare-fun m!758659 () Bool)

(assert (=> start!70394 m!758659))

(declare-fun m!758661 () Bool)

(assert (=> start!70394 m!758661))

(declare-fun m!758663 () Bool)

(assert (=> b!817654 m!758663))

(declare-fun m!758665 () Bool)

(assert (=> b!817654 m!758665))

(declare-fun m!758667 () Bool)

(assert (=> b!817654 m!758667))

(declare-fun m!758669 () Bool)

(assert (=> b!817660 m!758669))

(declare-fun m!758671 () Bool)

(assert (=> b!817658 m!758671))

(check-sat (not b!817660) (not b_next!12757) (not start!70394) b_and!21551 tp_is_empty!14467 (not b!817654) (not mapNonEmpty!23296) (not b!817657) (not b!817658))
(check-sat b_and!21551 (not b_next!12757))
