; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69972 () Bool)

(assert start!69972)

(declare-fun b_free!12405 () Bool)

(declare-fun b_next!12405 () Bool)

(assert (=> start!69972 (= b_free!12405 (not b_next!12405))))

(declare-fun tp!43926 () Bool)

(declare-fun b_and!21173 () Bool)

(assert (=> start!69972 (= tp!43926 b_and!21173)))

(declare-fun b!813334 () Bool)

(declare-fun res!555663 () Bool)

(declare-fun e!450675 () Bool)

(assert (=> b!813334 (=> (not res!555663) (not e!450675))))

(declare-datatypes ((array!44438 0))(
  ( (array!44439 (arr!21280 (Array (_ BitVec 32) (_ BitVec 64))) (size!21701 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44438)

(declare-datatypes ((List!15135 0))(
  ( (Nil!15132) (Cons!15131 (h!16260 (_ BitVec 64)) (t!21450 List!15135)) )
))
(declare-fun arrayNoDuplicates!0 (array!44438 (_ BitVec 32) List!15135) Bool)

(assert (=> b!813334 (= res!555663 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15132))))

(declare-fun b!813335 () Bool)

(assert (=> b!813335 (= e!450675 false)))

(declare-datatypes ((V!23821 0))(
  ( (V!23822 (val!7105 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23821)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23821)

(declare-datatypes ((ValueCell!6642 0))(
  ( (ValueCellFull!6642 (v!9532 V!23821)) (EmptyCell!6642) )
))
(declare-datatypes ((array!44440 0))(
  ( (array!44441 (arr!21281 (Array (_ BitVec 32) ValueCell!6642)) (size!21702 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44440)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9302 0))(
  ( (tuple2!9303 (_1!4662 (_ BitVec 64)) (_2!4662 V!23821)) )
))
(declare-datatypes ((List!15136 0))(
  ( (Nil!15133) (Cons!15132 (h!16261 tuple2!9302) (t!21451 List!15136)) )
))
(declare-datatypes ((ListLongMap!8125 0))(
  ( (ListLongMap!8126 (toList!4078 List!15136)) )
))
(declare-fun lt!364269 () ListLongMap!8125)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2128 (array!44438 array!44440 (_ BitVec 32) (_ BitVec 32) V!23821 V!23821 (_ BitVec 32) Int) ListLongMap!8125)

(assert (=> b!813335 (= lt!364269 (getCurrentListMapNoExtraKeys!2128 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813336 () Bool)

(declare-fun e!450671 () Bool)

(declare-fun e!450674 () Bool)

(declare-fun mapRes!22750 () Bool)

(assert (=> b!813336 (= e!450671 (and e!450674 mapRes!22750))))

(declare-fun condMapEmpty!22750 () Bool)

(declare-fun mapDefault!22750 () ValueCell!6642)

(assert (=> b!813336 (= condMapEmpty!22750 (= (arr!21281 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6642)) mapDefault!22750)))))

(declare-fun b!813337 () Bool)

(declare-fun e!450673 () Bool)

(declare-fun tp_is_empty!14115 () Bool)

(assert (=> b!813337 (= e!450673 tp_is_empty!14115)))

(declare-fun res!555662 () Bool)

(assert (=> start!69972 (=> (not res!555662) (not e!450675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69972 (= res!555662 (validMask!0 mask!1312))))

(assert (=> start!69972 e!450675))

(assert (=> start!69972 tp_is_empty!14115))

(declare-fun array_inv!17041 (array!44438) Bool)

(assert (=> start!69972 (array_inv!17041 _keys!976)))

(assert (=> start!69972 true))

(declare-fun array_inv!17042 (array!44440) Bool)

(assert (=> start!69972 (and (array_inv!17042 _values!788) e!450671)))

(assert (=> start!69972 tp!43926))

(declare-fun mapIsEmpty!22750 () Bool)

(assert (=> mapIsEmpty!22750 mapRes!22750))

(declare-fun b!813338 () Bool)

(declare-fun res!555661 () Bool)

(assert (=> b!813338 (=> (not res!555661) (not e!450675))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813338 (= res!555661 (and (= (size!21702 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21701 _keys!976) (size!21702 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813339 () Bool)

(assert (=> b!813339 (= e!450674 tp_is_empty!14115)))

(declare-fun mapNonEmpty!22750 () Bool)

(declare-fun tp!43927 () Bool)

(assert (=> mapNonEmpty!22750 (= mapRes!22750 (and tp!43927 e!450673))))

(declare-fun mapKey!22750 () (_ BitVec 32))

(declare-fun mapRest!22750 () (Array (_ BitVec 32) ValueCell!6642))

(declare-fun mapValue!22750 () ValueCell!6642)

(assert (=> mapNonEmpty!22750 (= (arr!21281 _values!788) (store mapRest!22750 mapKey!22750 mapValue!22750))))

(declare-fun b!813340 () Bool)

(declare-fun res!555660 () Bool)

(assert (=> b!813340 (=> (not res!555660) (not e!450675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44438 (_ BitVec 32)) Bool)

(assert (=> b!813340 (= res!555660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!69972 res!555662) b!813338))

(assert (= (and b!813338 res!555661) b!813340))

(assert (= (and b!813340 res!555660) b!813334))

(assert (= (and b!813334 res!555663) b!813335))

(assert (= (and b!813336 condMapEmpty!22750) mapIsEmpty!22750))

(assert (= (and b!813336 (not condMapEmpty!22750)) mapNonEmpty!22750))

(get-info :version)

(assert (= (and mapNonEmpty!22750 ((_ is ValueCellFull!6642) mapValue!22750)) b!813337))

(assert (= (and b!813336 ((_ is ValueCellFull!6642) mapDefault!22750)) b!813339))

(assert (= start!69972 b!813336))

(declare-fun m!755411 () Bool)

(assert (=> start!69972 m!755411))

(declare-fun m!755413 () Bool)

(assert (=> start!69972 m!755413))

(declare-fun m!755415 () Bool)

(assert (=> start!69972 m!755415))

(declare-fun m!755417 () Bool)

(assert (=> b!813335 m!755417))

(declare-fun m!755419 () Bool)

(assert (=> b!813334 m!755419))

(declare-fun m!755421 () Bool)

(assert (=> b!813340 m!755421))

(declare-fun m!755423 () Bool)

(assert (=> mapNonEmpty!22750 m!755423))

(check-sat (not b!813340) (not b!813334) (not b!813335) (not b_next!12405) (not start!69972) b_and!21173 tp_is_empty!14115 (not mapNonEmpty!22750))
(check-sat b_and!21173 (not b_next!12405))
