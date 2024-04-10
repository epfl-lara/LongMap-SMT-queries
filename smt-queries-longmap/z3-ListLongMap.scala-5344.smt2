; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71428 () Bool)

(assert start!71428)

(declare-fun b_free!13473 () Bool)

(declare-fun b_next!13473 () Bool)

(assert (=> start!71428 (= b_free!13473 (not b_next!13473))))

(declare-fun tp!47200 () Bool)

(declare-fun b_and!22479 () Bool)

(assert (=> start!71428 (= tp!47200 b_and!22479)))

(declare-fun b!829526 () Bool)

(declare-fun e!462393 () Bool)

(declare-fun tp_is_empty!15183 () Bool)

(assert (=> b!829526 (= e!462393 tp_is_empty!15183)))

(declare-fun b!829527 () Bool)

(declare-fun res!565080 () Bool)

(declare-fun e!462388 () Bool)

(assert (=> b!829527 (=> (not res!565080) (not e!462388))))

(declare-datatypes ((array!46532 0))(
  ( (array!46533 (arr!22304 (Array (_ BitVec 32) (_ BitVec 64))) (size!22725 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46532)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46532 (_ BitVec 32)) Bool)

(assert (=> b!829527 (= res!565080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24421 () Bool)

(declare-fun mapRes!24421 () Bool)

(declare-fun tp!47199 () Bool)

(assert (=> mapNonEmpty!24421 (= mapRes!24421 (and tp!47199 e!462393))))

(declare-datatypes ((V!25245 0))(
  ( (V!25246 (val!7639 Int)) )
))
(declare-datatypes ((ValueCell!7176 0))(
  ( (ValueCellFull!7176 (v!10079 V!25245)) (EmptyCell!7176) )
))
(declare-fun mapRest!24421 () (Array (_ BitVec 32) ValueCell!7176))

(declare-fun mapValue!24421 () ValueCell!7176)

(declare-datatypes ((array!46534 0))(
  ( (array!46535 (arr!22305 (Array (_ BitVec 32) ValueCell!7176)) (size!22726 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46534)

(declare-fun mapKey!24421 () (_ BitVec 32))

(assert (=> mapNonEmpty!24421 (= (arr!22305 _values!788) (store mapRest!24421 mapKey!24421 mapValue!24421))))

(declare-fun b!829528 () Bool)

(declare-fun e!462390 () Bool)

(assert (=> b!829528 (= e!462390 tp_is_empty!15183)))

(declare-fun b!829529 () Bool)

(declare-fun res!565083 () Bool)

(assert (=> b!829529 (=> (not res!565083) (not e!462388))))

(declare-datatypes ((List!15924 0))(
  ( (Nil!15921) (Cons!15920 (h!17049 (_ BitVec 64)) (t!22285 List!15924)) )
))
(declare-fun arrayNoDuplicates!0 (array!46532 (_ BitVec 32) List!15924) Bool)

(assert (=> b!829529 (= res!565083 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15921))))

(declare-fun res!565085 () Bool)

(assert (=> start!71428 (=> (not res!565085) (not e!462388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71428 (= res!565085 (validMask!0 mask!1312))))

(assert (=> start!71428 e!462388))

(assert (=> start!71428 tp_is_empty!15183))

(declare-fun array_inv!17765 (array!46532) Bool)

(assert (=> start!71428 (array_inv!17765 _keys!976)))

(assert (=> start!71428 true))

(declare-fun e!462389 () Bool)

(declare-fun array_inv!17766 (array!46534) Bool)

(assert (=> start!71428 (and (array_inv!17766 _values!788) e!462389)))

(assert (=> start!71428 tp!47200))

(declare-fun mapIsEmpty!24421 () Bool)

(assert (=> mapIsEmpty!24421 mapRes!24421))

(declare-datatypes ((tuple2!10132 0))(
  ( (tuple2!10133 (_1!5077 (_ BitVec 64)) (_2!5077 V!25245)) )
))
(declare-fun lt!376171 () tuple2!10132)

(declare-fun zeroValueAfter!34 () V!25245)

(declare-fun b!829530 () Bool)

(declare-datatypes ((List!15925 0))(
  ( (Nil!15922) (Cons!15921 (h!17050 tuple2!10132) (t!22286 List!15925)) )
))
(declare-datatypes ((ListLongMap!8955 0))(
  ( (ListLongMap!8956 (toList!4493 List!15925)) )
))
(declare-fun lt!376174 () ListLongMap!8955)

(declare-fun lt!376173 () ListLongMap!8955)

(declare-fun e!462394 () Bool)

(declare-fun +!1974 (ListLongMap!8955 tuple2!10132) ListLongMap!8955)

(assert (=> b!829530 (= e!462394 (= lt!376174 (+!1974 (+!1974 lt!376173 (tuple2!10133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376171)))))

(declare-fun b!829531 () Bool)

(declare-fun e!462391 () Bool)

(assert (=> b!829531 (= e!462391 true)))

(assert (=> b!829531 e!462394))

(declare-fun res!565082 () Bool)

(assert (=> b!829531 (=> (not res!565082) (not e!462394))))

(declare-fun lt!376169 () ListLongMap!8955)

(assert (=> b!829531 (= res!565082 (= lt!376169 (+!1974 lt!376173 lt!376171)))))

(declare-fun minValue!754 () V!25245)

(assert (=> b!829531 (= lt!376171 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2592 (array!46532 array!46534 (_ BitVec 32) (_ BitVec 32) V!25245 V!25245 (_ BitVec 32) Int) ListLongMap!8955)

(assert (=> b!829531 (= lt!376174 (getCurrentListMap!2592 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25245)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829531 (= lt!376169 (getCurrentListMap!2592 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829532 () Bool)

(declare-fun res!565081 () Bool)

(assert (=> b!829532 (=> (not res!565081) (not e!462388))))

(assert (=> b!829532 (= res!565081 (and (= (size!22726 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22725 _keys!976) (size!22726 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829533 () Bool)

(assert (=> b!829533 (= e!462389 (and e!462390 mapRes!24421))))

(declare-fun condMapEmpty!24421 () Bool)

(declare-fun mapDefault!24421 () ValueCell!7176)

(assert (=> b!829533 (= condMapEmpty!24421 (= (arr!22305 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7176)) mapDefault!24421)))))

(declare-fun b!829534 () Bool)

(assert (=> b!829534 (= e!462388 (not e!462391))))

(declare-fun res!565084 () Bool)

(assert (=> b!829534 (=> res!565084 e!462391)))

(assert (=> b!829534 (= res!565084 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!376170 () ListLongMap!8955)

(assert (=> b!829534 (= lt!376173 lt!376170)))

(declare-datatypes ((Unit!28407 0))(
  ( (Unit!28408) )
))
(declare-fun lt!376172 () Unit!28407)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!580 (array!46532 array!46534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25245 V!25245 V!25245 V!25245 (_ BitVec 32) Int) Unit!28407)

(assert (=> b!829534 (= lt!376172 (lemmaNoChangeToArrayThenSameMapNoExtras!580 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2492 (array!46532 array!46534 (_ BitVec 32) (_ BitVec 32) V!25245 V!25245 (_ BitVec 32) Int) ListLongMap!8955)

(assert (=> b!829534 (= lt!376170 (getCurrentListMapNoExtraKeys!2492 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829534 (= lt!376173 (getCurrentListMapNoExtraKeys!2492 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71428 res!565085) b!829532))

(assert (= (and b!829532 res!565081) b!829527))

(assert (= (and b!829527 res!565080) b!829529))

(assert (= (and b!829529 res!565083) b!829534))

(assert (= (and b!829534 (not res!565084)) b!829531))

(assert (= (and b!829531 res!565082) b!829530))

(assert (= (and b!829533 condMapEmpty!24421) mapIsEmpty!24421))

(assert (= (and b!829533 (not condMapEmpty!24421)) mapNonEmpty!24421))

(get-info :version)

(assert (= (and mapNonEmpty!24421 ((_ is ValueCellFull!7176) mapValue!24421)) b!829526))

(assert (= (and b!829533 ((_ is ValueCellFull!7176) mapDefault!24421)) b!829528))

(assert (= start!71428 b!829533))

(declare-fun m!772513 () Bool)

(assert (=> b!829527 m!772513))

(declare-fun m!772515 () Bool)

(assert (=> b!829534 m!772515))

(declare-fun m!772517 () Bool)

(assert (=> b!829534 m!772517))

(declare-fun m!772519 () Bool)

(assert (=> b!829534 m!772519))

(declare-fun m!772521 () Bool)

(assert (=> b!829531 m!772521))

(declare-fun m!772523 () Bool)

(assert (=> b!829531 m!772523))

(declare-fun m!772525 () Bool)

(assert (=> b!829531 m!772525))

(declare-fun m!772527 () Bool)

(assert (=> start!71428 m!772527))

(declare-fun m!772529 () Bool)

(assert (=> start!71428 m!772529))

(declare-fun m!772531 () Bool)

(assert (=> start!71428 m!772531))

(declare-fun m!772533 () Bool)

(assert (=> mapNonEmpty!24421 m!772533))

(declare-fun m!772535 () Bool)

(assert (=> b!829529 m!772535))

(declare-fun m!772537 () Bool)

(assert (=> b!829530 m!772537))

(assert (=> b!829530 m!772537))

(declare-fun m!772539 () Bool)

(assert (=> b!829530 m!772539))

(check-sat (not b!829531) (not b_next!13473) (not b!829529) (not start!71428) (not b!829530) tp_is_empty!15183 b_and!22479 (not mapNonEmpty!24421) (not b!829527) (not b!829534))
(check-sat b_and!22479 (not b_next!13473))
