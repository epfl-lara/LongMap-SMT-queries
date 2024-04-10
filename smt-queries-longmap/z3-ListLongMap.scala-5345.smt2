; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71434 () Bool)

(assert start!71434)

(declare-fun b_free!13479 () Bool)

(declare-fun b_next!13479 () Bool)

(assert (=> start!71434 (= b_free!13479 (not b_next!13479))))

(declare-fun tp!47217 () Bool)

(declare-fun b_and!22485 () Bool)

(assert (=> start!71434 (= tp!47217 b_and!22485)))

(declare-fun b!829602 () Bool)

(declare-fun res!565129 () Bool)

(declare-fun e!462448 () Bool)

(assert (=> b!829602 (=> (not res!565129) (not e!462448))))

(declare-datatypes ((array!46544 0))(
  ( (array!46545 (arr!22310 (Array (_ BitVec 32) (_ BitVec 64))) (size!22731 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46544)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46544 (_ BitVec 32)) Bool)

(assert (=> b!829602 (= res!565129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829603 () Bool)

(declare-fun e!462450 () Bool)

(declare-fun tp_is_empty!15189 () Bool)

(assert (=> b!829603 (= e!462450 tp_is_empty!15189)))

(declare-fun mapIsEmpty!24430 () Bool)

(declare-fun mapRes!24430 () Bool)

(assert (=> mapIsEmpty!24430 mapRes!24430))

(declare-fun res!565132 () Bool)

(assert (=> start!71434 (=> (not res!565132) (not e!462448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71434 (= res!565132 (validMask!0 mask!1312))))

(assert (=> start!71434 e!462448))

(assert (=> start!71434 tp_is_empty!15189))

(declare-fun array_inv!17769 (array!46544) Bool)

(assert (=> start!71434 (array_inv!17769 _keys!976)))

(assert (=> start!71434 true))

(declare-datatypes ((V!25253 0))(
  ( (V!25254 (val!7642 Int)) )
))
(declare-datatypes ((ValueCell!7179 0))(
  ( (ValueCellFull!7179 (v!10082 V!25253)) (EmptyCell!7179) )
))
(declare-datatypes ((array!46546 0))(
  ( (array!46547 (arr!22311 (Array (_ BitVec 32) ValueCell!7179)) (size!22732 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46546)

(declare-fun e!462451 () Bool)

(declare-fun array_inv!17770 (array!46546) Bool)

(assert (=> start!71434 (and (array_inv!17770 _values!788) e!462451)))

(assert (=> start!71434 tp!47217))

(declare-datatypes ((tuple2!10136 0))(
  ( (tuple2!10137 (_1!5079 (_ BitVec 64)) (_2!5079 V!25253)) )
))
(declare-fun lt!376250 () tuple2!10136)

(declare-fun b!829604 () Bool)

(declare-datatypes ((List!15929 0))(
  ( (Nil!15926) (Cons!15925 (h!17054 tuple2!10136) (t!22290 List!15929)) )
))
(declare-datatypes ((ListLongMap!8959 0))(
  ( (ListLongMap!8960 (toList!4495 List!15929)) )
))
(declare-fun lt!376247 () ListLongMap!8959)

(declare-fun e!462446 () Bool)

(declare-fun lt!376248 () ListLongMap!8959)

(declare-fun +!1975 (ListLongMap!8959 tuple2!10136) ListLongMap!8959)

(assert (=> b!829604 (= e!462446 (= (+!1975 lt!376248 lt!376250) lt!376247))))

(declare-fun lt!376251 () ListLongMap!8959)

(declare-fun lt!376249 () ListLongMap!8959)

(assert (=> b!829604 (= lt!376251 (+!1975 lt!376249 lt!376250))))

(declare-fun lt!376244 () ListLongMap!8959)

(declare-fun zeroValueAfter!34 () V!25253)

(declare-fun minValue!754 () V!25253)

(declare-datatypes ((Unit!28411 0))(
  ( (Unit!28412) )
))
(declare-fun lt!376252 () Unit!28411)

(declare-fun addCommutativeForDiffKeys!477 (ListLongMap!8959 (_ BitVec 64) V!25253 (_ BitVec 64) V!25253) Unit!28411)

(assert (=> b!829604 (= lt!376252 (addCommutativeForDiffKeys!477 lt!376244 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!829604 (= lt!376247 lt!376251)))

(declare-fun lt!376246 () tuple2!10136)

(assert (=> b!829604 (= lt!376251 (+!1975 (+!1975 lt!376244 lt!376250) lt!376246))))

(assert (=> b!829604 (= lt!376250 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!829604 (= lt!376248 lt!376249)))

(assert (=> b!829604 (= lt!376249 (+!1975 lt!376244 lt!376246))))

(assert (=> b!829604 (= lt!376246 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2593 (array!46544 array!46546 (_ BitVec 32) (_ BitVec 32) V!25253 V!25253 (_ BitVec 32) Int) ListLongMap!8959)

(assert (=> b!829604 (= lt!376247 (getCurrentListMap!2593 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25253)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829604 (= lt!376248 (getCurrentListMap!2593 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829605 () Bool)

(assert (=> b!829605 (= e!462448 (not e!462446))))

(declare-fun res!565130 () Bool)

(assert (=> b!829605 (=> res!565130 e!462446)))

(assert (=> b!829605 (= res!565130 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!376245 () ListLongMap!8959)

(assert (=> b!829605 (= lt!376244 lt!376245)))

(declare-fun lt!376243 () Unit!28411)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!582 (array!46544 array!46546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25253 V!25253 V!25253 V!25253 (_ BitVec 32) Int) Unit!28411)

(assert (=> b!829605 (= lt!376243 (lemmaNoChangeToArrayThenSameMapNoExtras!582 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2494 (array!46544 array!46546 (_ BitVec 32) (_ BitVec 32) V!25253 V!25253 (_ BitVec 32) Int) ListLongMap!8959)

(assert (=> b!829605 (= lt!376245 (getCurrentListMapNoExtraKeys!2494 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829605 (= lt!376244 (getCurrentListMapNoExtraKeys!2494 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24430 () Bool)

(declare-fun tp!47218 () Bool)

(assert (=> mapNonEmpty!24430 (= mapRes!24430 (and tp!47218 e!462450))))

(declare-fun mapRest!24430 () (Array (_ BitVec 32) ValueCell!7179))

(declare-fun mapKey!24430 () (_ BitVec 32))

(declare-fun mapValue!24430 () ValueCell!7179)

(assert (=> mapNonEmpty!24430 (= (arr!22311 _values!788) (store mapRest!24430 mapKey!24430 mapValue!24430))))

(declare-fun b!829606 () Bool)

(declare-fun res!565133 () Bool)

(assert (=> b!829606 (=> (not res!565133) (not e!462448))))

(declare-datatypes ((List!15930 0))(
  ( (Nil!15927) (Cons!15926 (h!17055 (_ BitVec 64)) (t!22291 List!15930)) )
))
(declare-fun arrayNoDuplicates!0 (array!46544 (_ BitVec 32) List!15930) Bool)

(assert (=> b!829606 (= res!565133 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15927))))

(declare-fun b!829607 () Bool)

(declare-fun e!462447 () Bool)

(assert (=> b!829607 (= e!462447 tp_is_empty!15189)))

(declare-fun b!829608 () Bool)

(assert (=> b!829608 (= e!462451 (and e!462447 mapRes!24430))))

(declare-fun condMapEmpty!24430 () Bool)

(declare-fun mapDefault!24430 () ValueCell!7179)

(assert (=> b!829608 (= condMapEmpty!24430 (= (arr!22311 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7179)) mapDefault!24430)))))

(declare-fun b!829609 () Bool)

(declare-fun res!565131 () Bool)

(assert (=> b!829609 (=> (not res!565131) (not e!462448))))

(assert (=> b!829609 (= res!565131 (and (= (size!22732 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22731 _keys!976) (size!22732 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71434 res!565132) b!829609))

(assert (= (and b!829609 res!565131) b!829602))

(assert (= (and b!829602 res!565129) b!829606))

(assert (= (and b!829606 res!565133) b!829605))

(assert (= (and b!829605 (not res!565130)) b!829604))

(assert (= (and b!829608 condMapEmpty!24430) mapIsEmpty!24430))

(assert (= (and b!829608 (not condMapEmpty!24430)) mapNonEmpty!24430))

(get-info :version)

(assert (= (and mapNonEmpty!24430 ((_ is ValueCellFull!7179) mapValue!24430)) b!829603))

(assert (= (and b!829608 ((_ is ValueCellFull!7179) mapDefault!24430)) b!829607))

(assert (= start!71434 b!829608))

(declare-fun m!772603 () Bool)

(assert (=> b!829604 m!772603))

(declare-fun m!772605 () Bool)

(assert (=> b!829604 m!772605))

(declare-fun m!772607 () Bool)

(assert (=> b!829604 m!772607))

(declare-fun m!772609 () Bool)

(assert (=> b!829604 m!772609))

(assert (=> b!829604 m!772603))

(declare-fun m!772611 () Bool)

(assert (=> b!829604 m!772611))

(declare-fun m!772613 () Bool)

(assert (=> b!829604 m!772613))

(declare-fun m!772615 () Bool)

(assert (=> b!829604 m!772615))

(declare-fun m!772617 () Bool)

(assert (=> b!829604 m!772617))

(declare-fun m!772619 () Bool)

(assert (=> mapNonEmpty!24430 m!772619))

(declare-fun m!772621 () Bool)

(assert (=> b!829606 m!772621))

(declare-fun m!772623 () Bool)

(assert (=> b!829605 m!772623))

(declare-fun m!772625 () Bool)

(assert (=> b!829605 m!772625))

(declare-fun m!772627 () Bool)

(assert (=> b!829605 m!772627))

(declare-fun m!772629 () Bool)

(assert (=> b!829602 m!772629))

(declare-fun m!772631 () Bool)

(assert (=> start!71434 m!772631))

(declare-fun m!772633 () Bool)

(assert (=> start!71434 m!772633))

(declare-fun m!772635 () Bool)

(assert (=> start!71434 m!772635))

(check-sat (not start!71434) (not b!829602) (not b!829605) (not b!829604) (not b!829606) (not b_next!13479) tp_is_empty!15189 b_and!22485 (not mapNonEmpty!24430))
(check-sat b_and!22485 (not b_next!13479))
