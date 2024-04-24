; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71478 () Bool)

(assert start!71478)

(declare-fun b_free!13429 () Bool)

(declare-fun b_next!13429 () Bool)

(assert (=> start!71478 (= b_free!13429 (not b_next!13429))))

(declare-fun tp!47056 () Bool)

(declare-fun b_and!22397 () Bool)

(assert (=> start!71478 (= tp!47056 b_and!22397)))

(declare-fun b!829118 () Bool)

(declare-fun e!462060 () Bool)

(assert (=> b!829118 (= e!462060 true)))

(declare-datatypes ((array!46453 0))(
  ( (array!46454 (arr!22264 (Array (_ BitVec 32) (_ BitVec 64))) (size!22684 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46453)

(declare-datatypes ((V!25187 0))(
  ( (V!25188 (val!7617 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25187)

(declare-fun minValue!754 () V!25187)

(declare-datatypes ((ValueCell!7154 0))(
  ( (ValueCellFull!7154 (v!10053 V!25187)) (EmptyCell!7154) )
))
(declare-datatypes ((array!46455 0))(
  ( (array!46456 (arr!22265 (Array (_ BitVec 32) ValueCell!7154)) (size!22685 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46455)

(declare-datatypes ((tuple2!10020 0))(
  ( (tuple2!10021 (_1!5021 (_ BitVec 64)) (_2!5021 V!25187)) )
))
(declare-datatypes ((List!15797 0))(
  ( (Nil!15794) (Cons!15793 (h!16928 tuple2!10020) (t!22142 List!15797)) )
))
(declare-datatypes ((ListLongMap!8845 0))(
  ( (ListLongMap!8846 (toList!4438 List!15797)) )
))
(declare-fun lt!375602 () ListLongMap!8845)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2534 (array!46453 array!46455 (_ BitVec 32) (_ BitVec 32) V!25187 V!25187 (_ BitVec 32) Int) ListLongMap!8845)

(assert (=> b!829118 (= lt!375602 (getCurrentListMap!2534 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25187)

(declare-fun lt!375599 () ListLongMap!8845)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun +!1961 (ListLongMap!8845 tuple2!10020) ListLongMap!8845)

(assert (=> b!829118 (= lt!375599 (+!1961 (getCurrentListMap!2534 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!24343 () Bool)

(declare-fun mapRes!24343 () Bool)

(assert (=> mapIsEmpty!24343 mapRes!24343))

(declare-fun b!829119 () Bool)

(declare-fun res!564731 () Bool)

(declare-fun e!462062 () Bool)

(assert (=> b!829119 (=> (not res!564731) (not e!462062))))

(declare-datatypes ((List!15798 0))(
  ( (Nil!15795) (Cons!15794 (h!16929 (_ BitVec 64)) (t!22143 List!15798)) )
))
(declare-fun arrayNoDuplicates!0 (array!46453 (_ BitVec 32) List!15798) Bool)

(assert (=> b!829119 (= res!564731 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15795))))

(declare-fun b!829120 () Bool)

(declare-fun e!462059 () Bool)

(declare-fun tp_is_empty!15139 () Bool)

(assert (=> b!829120 (= e!462059 tp_is_empty!15139)))

(declare-fun mapNonEmpty!24343 () Bool)

(declare-fun tp!47055 () Bool)

(assert (=> mapNonEmpty!24343 (= mapRes!24343 (and tp!47055 e!462059))))

(declare-fun mapValue!24343 () ValueCell!7154)

(declare-fun mapRest!24343 () (Array (_ BitVec 32) ValueCell!7154))

(declare-fun mapKey!24343 () (_ BitVec 32))

(assert (=> mapNonEmpty!24343 (= (arr!22265 _values!788) (store mapRest!24343 mapKey!24343 mapValue!24343))))

(declare-fun res!564733 () Bool)

(assert (=> start!71478 (=> (not res!564733) (not e!462062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71478 (= res!564733 (validMask!0 mask!1312))))

(assert (=> start!71478 e!462062))

(assert (=> start!71478 tp_is_empty!15139))

(declare-fun array_inv!17781 (array!46453) Bool)

(assert (=> start!71478 (array_inv!17781 _keys!976)))

(assert (=> start!71478 true))

(declare-fun e!462063 () Bool)

(declare-fun array_inv!17782 (array!46455) Bool)

(assert (=> start!71478 (and (array_inv!17782 _values!788) e!462063)))

(assert (=> start!71478 tp!47056))

(declare-fun b!829121 () Bool)

(declare-fun e!462064 () Bool)

(assert (=> b!829121 (= e!462064 tp_is_empty!15139)))

(declare-fun b!829122 () Bool)

(assert (=> b!829122 (= e!462063 (and e!462064 mapRes!24343))))

(declare-fun condMapEmpty!24343 () Bool)

(declare-fun mapDefault!24343 () ValueCell!7154)

(assert (=> b!829122 (= condMapEmpty!24343 (= (arr!22265 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7154)) mapDefault!24343)))))

(declare-fun b!829123 () Bool)

(declare-fun res!564732 () Bool)

(assert (=> b!829123 (=> (not res!564732) (not e!462062))))

(assert (=> b!829123 (= res!564732 (and (= (size!22685 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22684 _keys!976) (size!22685 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829124 () Bool)

(assert (=> b!829124 (= e!462062 (not e!462060))))

(declare-fun res!564734 () Bool)

(assert (=> b!829124 (=> res!564734 e!462060)))

(assert (=> b!829124 (= res!564734 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!375598 () ListLongMap!8845)

(declare-fun lt!375601 () ListLongMap!8845)

(assert (=> b!829124 (= lt!375598 lt!375601)))

(declare-datatypes ((Unit!28390 0))(
  ( (Unit!28391) )
))
(declare-fun lt!375600 () Unit!28390)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!582 (array!46453 array!46455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25187 V!25187 V!25187 V!25187 (_ BitVec 32) Int) Unit!28390)

(assert (=> b!829124 (= lt!375600 (lemmaNoChangeToArrayThenSameMapNoExtras!582 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2515 (array!46453 array!46455 (_ BitVec 32) (_ BitVec 32) V!25187 V!25187 (_ BitVec 32) Int) ListLongMap!8845)

(assert (=> b!829124 (= lt!375601 (getCurrentListMapNoExtraKeys!2515 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829124 (= lt!375598 (getCurrentListMapNoExtraKeys!2515 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829125 () Bool)

(declare-fun res!564730 () Bool)

(assert (=> b!829125 (=> (not res!564730) (not e!462062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46453 (_ BitVec 32)) Bool)

(assert (=> b!829125 (= res!564730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71478 res!564733) b!829123))

(assert (= (and b!829123 res!564732) b!829125))

(assert (= (and b!829125 res!564730) b!829119))

(assert (= (and b!829119 res!564731) b!829124))

(assert (= (and b!829124 (not res!564734)) b!829118))

(assert (= (and b!829122 condMapEmpty!24343) mapIsEmpty!24343))

(assert (= (and b!829122 (not condMapEmpty!24343)) mapNonEmpty!24343))

(get-info :version)

(assert (= (and mapNonEmpty!24343 ((_ is ValueCellFull!7154) mapValue!24343)) b!829120))

(assert (= (and b!829122 ((_ is ValueCellFull!7154) mapDefault!24343)) b!829121))

(assert (= start!71478 b!829122))

(declare-fun m!772451 () Bool)

(assert (=> start!71478 m!772451))

(declare-fun m!772453 () Bool)

(assert (=> start!71478 m!772453))

(declare-fun m!772455 () Bool)

(assert (=> start!71478 m!772455))

(declare-fun m!772457 () Bool)

(assert (=> mapNonEmpty!24343 m!772457))

(declare-fun m!772459 () Bool)

(assert (=> b!829124 m!772459))

(declare-fun m!772461 () Bool)

(assert (=> b!829124 m!772461))

(declare-fun m!772463 () Bool)

(assert (=> b!829124 m!772463))

(declare-fun m!772465 () Bool)

(assert (=> b!829118 m!772465))

(declare-fun m!772467 () Bool)

(assert (=> b!829118 m!772467))

(assert (=> b!829118 m!772467))

(declare-fun m!772469 () Bool)

(assert (=> b!829118 m!772469))

(declare-fun m!772471 () Bool)

(assert (=> b!829125 m!772471))

(declare-fun m!772473 () Bool)

(assert (=> b!829119 m!772473))

(check-sat b_and!22397 (not b!829124) (not b_next!13429) (not b!829119) (not b!829118) (not start!71478) (not b!829125) tp_is_empty!15139 (not mapNonEmpty!24343))
(check-sat b_and!22397 (not b_next!13429))
