; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70194 () Bool)

(assert start!70194)

(declare-fun b_free!12607 () Bool)

(declare-fun b_next!12607 () Bool)

(assert (=> start!70194 (= b_free!12607 (not b_next!12607))))

(declare-fun tp!44541 () Bool)

(declare-fun b_and!21369 () Bool)

(assert (=> start!70194 (= tp!44541 b_and!21369)))

(declare-fun b!815481 () Bool)

(declare-fun e!452226 () Bool)

(declare-fun e!452223 () Bool)

(declare-fun mapRes!23062 () Bool)

(assert (=> b!815481 (= e!452226 (and e!452223 mapRes!23062))))

(declare-fun condMapEmpty!23062 () Bool)

(declare-datatypes ((V!24091 0))(
  ( (V!24092 (val!7206 Int)) )
))
(declare-datatypes ((ValueCell!6743 0))(
  ( (ValueCellFull!6743 (v!9627 V!24091)) (EmptyCell!6743) )
))
(declare-datatypes ((array!44823 0))(
  ( (array!44824 (arr!21470 (Array (_ BitVec 32) ValueCell!6743)) (size!21891 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44823)

(declare-fun mapDefault!23062 () ValueCell!6743)

(assert (=> b!815481 (= condMapEmpty!23062 (= (arr!21470 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6743)) mapDefault!23062)))))

(declare-fun b!815482 () Bool)

(declare-fun res!556885 () Bool)

(declare-fun e!452225 () Bool)

(assert (=> b!815482 (=> (not res!556885) (not e!452225))))

(declare-datatypes ((array!44825 0))(
  ( (array!44826 (arr!21471 (Array (_ BitVec 32) (_ BitVec 64))) (size!21892 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44825)

(declare-datatypes ((List!15303 0))(
  ( (Nil!15300) (Cons!15299 (h!16428 (_ BitVec 64)) (t!21615 List!15303)) )
))
(declare-fun arrayNoDuplicates!0 (array!44825 (_ BitVec 32) List!15303) Bool)

(assert (=> b!815482 (= res!556885 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15300))))

(declare-fun b!815483 () Bool)

(declare-fun e!452227 () Bool)

(assert (=> b!815483 (= e!452225 (not e!452227))))

(declare-fun res!556884 () Bool)

(assert (=> b!815483 (=> res!556884 e!452227)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815483 (= res!556884 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9476 0))(
  ( (tuple2!9477 (_1!4749 (_ BitVec 64)) (_2!4749 V!24091)) )
))
(declare-datatypes ((List!15304 0))(
  ( (Nil!15301) (Cons!15300 (h!16429 tuple2!9476) (t!21616 List!15304)) )
))
(declare-datatypes ((ListLongMap!8289 0))(
  ( (ListLongMap!8290 (toList!4160 List!15304)) )
))
(declare-fun lt!364979 () ListLongMap!8289)

(declare-fun lt!364981 () ListLongMap!8289)

(assert (=> b!815483 (= lt!364979 lt!364981)))

(declare-fun zeroValueBefore!34 () V!24091)

(declare-fun zeroValueAfter!34 () V!24091)

(declare-fun minValue!754 () V!24091)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27752 0))(
  ( (Unit!27753) )
))
(declare-fun lt!364978 () Unit!27752)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!317 (array!44825 array!44823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24091 V!24091 V!24091 V!24091 (_ BitVec 32) Int) Unit!27752)

(assert (=> b!815483 (= lt!364978 (lemmaNoChangeToArrayThenSameMapNoExtras!317 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2224 (array!44825 array!44823 (_ BitVec 32) (_ BitVec 32) V!24091 V!24091 (_ BitVec 32) Int) ListLongMap!8289)

(assert (=> b!815483 (= lt!364981 (getCurrentListMapNoExtraKeys!2224 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815483 (= lt!364979 (getCurrentListMapNoExtraKeys!2224 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23062 () Bool)

(assert (=> mapIsEmpty!23062 mapRes!23062))

(declare-fun mapNonEmpty!23062 () Bool)

(declare-fun tp!44542 () Bool)

(declare-fun e!452224 () Bool)

(assert (=> mapNonEmpty!23062 (= mapRes!23062 (and tp!44542 e!452224))))

(declare-fun mapKey!23062 () (_ BitVec 32))

(declare-fun mapValue!23062 () ValueCell!6743)

(declare-fun mapRest!23062 () (Array (_ BitVec 32) ValueCell!6743))

(assert (=> mapNonEmpty!23062 (= (arr!21470 _values!788) (store mapRest!23062 mapKey!23062 mapValue!23062))))

(declare-fun b!815485 () Bool)

(declare-fun tp_is_empty!14317 () Bool)

(assert (=> b!815485 (= e!452224 tp_is_empty!14317)))

(declare-fun b!815486 () Bool)

(declare-fun res!556887 () Bool)

(assert (=> b!815486 (=> (not res!556887) (not e!452225))))

(assert (=> b!815486 (= res!556887 (and (= (size!21891 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21892 _keys!976) (size!21891 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815484 () Bool)

(assert (=> b!815484 (= e!452227 true)))

(declare-fun lt!364980 () ListLongMap!8289)

(declare-fun getCurrentListMap!2337 (array!44825 array!44823 (_ BitVec 32) (_ BitVec 32) V!24091 V!24091 (_ BitVec 32) Int) ListLongMap!8289)

(assert (=> b!815484 (= lt!364980 (getCurrentListMap!2337 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364982 () ListLongMap!8289)

(declare-fun +!1825 (ListLongMap!8289 tuple2!9476) ListLongMap!8289)

(assert (=> b!815484 (= lt!364982 (+!1825 (getCurrentListMap!2337 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun res!556886 () Bool)

(assert (=> start!70194 (=> (not res!556886) (not e!452225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70194 (= res!556886 (validMask!0 mask!1312))))

(assert (=> start!70194 e!452225))

(assert (=> start!70194 tp_is_empty!14317))

(declare-fun array_inv!17257 (array!44825) Bool)

(assert (=> start!70194 (array_inv!17257 _keys!976)))

(assert (=> start!70194 true))

(declare-fun array_inv!17258 (array!44823) Bool)

(assert (=> start!70194 (and (array_inv!17258 _values!788) e!452226)))

(assert (=> start!70194 tp!44541))

(declare-fun b!815487 () Bool)

(assert (=> b!815487 (= e!452223 tp_is_empty!14317)))

(declare-fun b!815488 () Bool)

(declare-fun res!556888 () Bool)

(assert (=> b!815488 (=> (not res!556888) (not e!452225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44825 (_ BitVec 32)) Bool)

(assert (=> b!815488 (= res!556888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70194 res!556886) b!815486))

(assert (= (and b!815486 res!556887) b!815488))

(assert (= (and b!815488 res!556888) b!815482))

(assert (= (and b!815482 res!556885) b!815483))

(assert (= (and b!815483 (not res!556884)) b!815484))

(assert (= (and b!815481 condMapEmpty!23062) mapIsEmpty!23062))

(assert (= (and b!815481 (not condMapEmpty!23062)) mapNonEmpty!23062))

(get-info :version)

(assert (= (and mapNonEmpty!23062 ((_ is ValueCellFull!6743) mapValue!23062)) b!815485))

(assert (= (and b!815481 ((_ is ValueCellFull!6743) mapDefault!23062)) b!815487))

(assert (= start!70194 b!815481))

(declare-fun m!756621 () Bool)

(assert (=> b!815482 m!756621))

(declare-fun m!756623 () Bool)

(assert (=> mapNonEmpty!23062 m!756623))

(declare-fun m!756625 () Bool)

(assert (=> b!815483 m!756625))

(declare-fun m!756627 () Bool)

(assert (=> b!815483 m!756627))

(declare-fun m!756629 () Bool)

(assert (=> b!815483 m!756629))

(declare-fun m!756631 () Bool)

(assert (=> b!815488 m!756631))

(declare-fun m!756633 () Bool)

(assert (=> b!815484 m!756633))

(declare-fun m!756635 () Bool)

(assert (=> b!815484 m!756635))

(assert (=> b!815484 m!756635))

(declare-fun m!756637 () Bool)

(assert (=> b!815484 m!756637))

(declare-fun m!756639 () Bool)

(assert (=> start!70194 m!756639))

(declare-fun m!756641 () Bool)

(assert (=> start!70194 m!756641))

(declare-fun m!756643 () Bool)

(assert (=> start!70194 m!756643))

(check-sat (not b!815484) (not b_next!12607) b_and!21369 (not mapNonEmpty!23062) (not b!815488) (not b!815483) (not b!815482) tp_is_empty!14317 (not start!70194))
(check-sat b_and!21369 (not b_next!12607))
