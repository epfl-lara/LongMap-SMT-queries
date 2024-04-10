; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70440 () Bool)

(assert start!70440)

(declare-fun b_free!12783 () Bool)

(declare-fun b_next!12783 () Bool)

(assert (=> start!70440 (= b_free!12783 (not b_next!12783))))

(declare-fun tp!45079 () Bool)

(declare-fun b_and!21603 () Bool)

(assert (=> start!70440 (= tp!45079 b_and!21603)))

(declare-fun b!818211 () Bool)

(declare-fun res!558428 () Bool)

(declare-fun e!454152 () Bool)

(assert (=> b!818211 (=> (not res!558428) (not e!454152))))

(declare-datatypes ((array!45186 0))(
  ( (array!45187 (arr!21648 (Array (_ BitVec 32) (_ BitVec 64))) (size!22069 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45186)

(declare-datatypes ((List!15417 0))(
  ( (Nil!15414) (Cons!15413 (h!16542 (_ BitVec 64)) (t!21744 List!15417)) )
))
(declare-fun arrayNoDuplicates!0 (array!45186 (_ BitVec 32) List!15417) Bool)

(assert (=> b!818211 (= res!558428 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15414))))

(declare-fun b!818212 () Bool)

(declare-fun e!454155 () Bool)

(declare-fun tp_is_empty!14493 () Bool)

(assert (=> b!818212 (= e!454155 tp_is_empty!14493)))

(declare-fun b!818213 () Bool)

(declare-fun res!558427 () Bool)

(assert (=> b!818213 (=> (not res!558427) (not e!454152))))

(declare-datatypes ((V!24325 0))(
  ( (V!24326 (val!7294 Int)) )
))
(declare-datatypes ((ValueCell!6831 0))(
  ( (ValueCellFull!6831 (v!9723 V!24325)) (EmptyCell!6831) )
))
(declare-datatypes ((array!45188 0))(
  ( (array!45189 (arr!21649 (Array (_ BitVec 32) ValueCell!6831)) (size!22070 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45188)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818213 (= res!558427 (and (= (size!22070 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22069 _keys!976) (size!22070 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818214 () Bool)

(declare-fun res!558426 () Bool)

(assert (=> b!818214 (=> (not res!558426) (not e!454152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45186 (_ BitVec 32)) Bool)

(assert (=> b!818214 (= res!558426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818215 () Bool)

(declare-fun e!454153 () Bool)

(assert (=> b!818215 (= e!454153 true)))

(declare-datatypes ((tuple2!9586 0))(
  ( (tuple2!9587 (_1!4804 (_ BitVec 64)) (_2!4804 V!24325)) )
))
(declare-datatypes ((List!15418 0))(
  ( (Nil!15415) (Cons!15414 (h!16543 tuple2!9586) (t!21745 List!15418)) )
))
(declare-datatypes ((ListLongMap!8409 0))(
  ( (ListLongMap!8410 (toList!4220 List!15418)) )
))
(declare-fun lt!366613 () ListLongMap!8409)

(declare-fun zeroValueBefore!34 () V!24325)

(declare-fun minValue!754 () V!24325)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2426 (array!45186 array!45188 (_ BitVec 32) (_ BitVec 32) V!24325 V!24325 (_ BitVec 32) Int) ListLongMap!8409)

(assert (=> b!818215 (= lt!366613 (getCurrentListMap!2426 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23335 () Bool)

(declare-fun mapRes!23335 () Bool)

(declare-fun tp!45078 () Bool)

(declare-fun e!454151 () Bool)

(assert (=> mapNonEmpty!23335 (= mapRes!23335 (and tp!45078 e!454151))))

(declare-fun mapValue!23335 () ValueCell!6831)

(declare-fun mapRest!23335 () (Array (_ BitVec 32) ValueCell!6831))

(declare-fun mapKey!23335 () (_ BitVec 32))

(assert (=> mapNonEmpty!23335 (= (arr!21649 _values!788) (store mapRest!23335 mapKey!23335 mapValue!23335))))

(declare-fun b!818216 () Bool)

(assert (=> b!818216 (= e!454152 (not e!454153))))

(declare-fun res!558424 () Bool)

(assert (=> b!818216 (=> res!558424 e!454153)))

(assert (=> b!818216 (= res!558424 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366616 () ListLongMap!8409)

(declare-fun lt!366614 () ListLongMap!8409)

(assert (=> b!818216 (= lt!366616 lt!366614)))

(declare-datatypes ((Unit!27924 0))(
  ( (Unit!27925) )
))
(declare-fun lt!366615 () Unit!27924)

(declare-fun zeroValueAfter!34 () V!24325)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!371 (array!45186 array!45188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24325 V!24325 V!24325 V!24325 (_ BitVec 32) Int) Unit!27924)

(assert (=> b!818216 (= lt!366615 (lemmaNoChangeToArrayThenSameMapNoExtras!371 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2261 (array!45186 array!45188 (_ BitVec 32) (_ BitVec 32) V!24325 V!24325 (_ BitVec 32) Int) ListLongMap!8409)

(assert (=> b!818216 (= lt!366614 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818216 (= lt!366616 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818217 () Bool)

(assert (=> b!818217 (= e!454151 tp_is_empty!14493)))

(declare-fun b!818218 () Bool)

(declare-fun e!454154 () Bool)

(assert (=> b!818218 (= e!454154 (and e!454155 mapRes!23335))))

(declare-fun condMapEmpty!23335 () Bool)

(declare-fun mapDefault!23335 () ValueCell!6831)

(assert (=> b!818218 (= condMapEmpty!23335 (= (arr!21649 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6831)) mapDefault!23335)))))

(declare-fun mapIsEmpty!23335 () Bool)

(assert (=> mapIsEmpty!23335 mapRes!23335))

(declare-fun res!558425 () Bool)

(assert (=> start!70440 (=> (not res!558425) (not e!454152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70440 (= res!558425 (validMask!0 mask!1312))))

(assert (=> start!70440 e!454152))

(assert (=> start!70440 tp_is_empty!14493))

(declare-fun array_inv!17313 (array!45186) Bool)

(assert (=> start!70440 (array_inv!17313 _keys!976)))

(assert (=> start!70440 true))

(declare-fun array_inv!17314 (array!45188) Bool)

(assert (=> start!70440 (and (array_inv!17314 _values!788) e!454154)))

(assert (=> start!70440 tp!45079))

(assert (= (and start!70440 res!558425) b!818213))

(assert (= (and b!818213 res!558427) b!818214))

(assert (= (and b!818214 res!558426) b!818211))

(assert (= (and b!818211 res!558428) b!818216))

(assert (= (and b!818216 (not res!558424)) b!818215))

(assert (= (and b!818218 condMapEmpty!23335) mapIsEmpty!23335))

(assert (= (and b!818218 (not condMapEmpty!23335)) mapNonEmpty!23335))

(get-info :version)

(assert (= (and mapNonEmpty!23335 ((_ is ValueCellFull!6831) mapValue!23335)) b!818217))

(assert (= (and b!818218 ((_ is ValueCellFull!6831) mapDefault!23335)) b!818212))

(assert (= start!70440 b!818218))

(declare-fun m!759665 () Bool)

(assert (=> b!818211 m!759665))

(declare-fun m!759667 () Bool)

(assert (=> start!70440 m!759667))

(declare-fun m!759669 () Bool)

(assert (=> start!70440 m!759669))

(declare-fun m!759671 () Bool)

(assert (=> start!70440 m!759671))

(declare-fun m!759673 () Bool)

(assert (=> b!818216 m!759673))

(declare-fun m!759675 () Bool)

(assert (=> b!818216 m!759675))

(declare-fun m!759677 () Bool)

(assert (=> b!818216 m!759677))

(declare-fun m!759679 () Bool)

(assert (=> mapNonEmpty!23335 m!759679))

(declare-fun m!759681 () Bool)

(assert (=> b!818214 m!759681))

(declare-fun m!759683 () Bool)

(assert (=> b!818215 m!759683))

(check-sat (not b!818214) tp_is_empty!14493 b_and!21603 (not b!818211) (not start!70440) (not b!818216) (not mapNonEmpty!23335) (not b!818215) (not b_next!12783))
(check-sat b_and!21603 (not b_next!12783))
