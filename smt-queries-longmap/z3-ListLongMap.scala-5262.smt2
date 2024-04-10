; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70708 () Bool)

(assert start!70708)

(declare-fun b_free!12981 () Bool)

(declare-fun b_next!12981 () Bool)

(assert (=> start!70708 (= b_free!12981 (not b_next!12981))))

(declare-fun tp!45685 () Bool)

(declare-fun b_and!21843 () Bool)

(assert (=> start!70708 (= tp!45685 b_and!21843)))

(declare-fun b!821289 () Bool)

(declare-fun e!456416 () Bool)

(declare-fun e!456414 () Bool)

(assert (=> b!821289 (= e!456416 (not e!456414))))

(declare-fun res!560265 () Bool)

(assert (=> b!821289 (=> res!560265 e!456414)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821289 (= res!560265 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24589 0))(
  ( (V!24590 (val!7393 Int)) )
))
(declare-datatypes ((tuple2!9752 0))(
  ( (tuple2!9753 (_1!4887 (_ BitVec 64)) (_2!4887 V!24589)) )
))
(declare-datatypes ((List!15570 0))(
  ( (Nil!15567) (Cons!15566 (h!16695 tuple2!9752) (t!21905 List!15570)) )
))
(declare-datatypes ((ListLongMap!8575 0))(
  ( (ListLongMap!8576 (toList!4303 List!15570)) )
))
(declare-fun lt!369149 () ListLongMap!8575)

(declare-fun lt!369147 () ListLongMap!8575)

(assert (=> b!821289 (= lt!369149 lt!369147)))

(declare-fun zeroValueBefore!34 () V!24589)

(declare-datatypes ((array!45578 0))(
  ( (array!45579 (arr!21840 (Array (_ BitVec 32) (_ BitVec 64))) (size!22261 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45578)

(declare-fun zeroValueAfter!34 () V!24589)

(declare-fun minValue!754 () V!24589)

(declare-datatypes ((ValueCell!6930 0))(
  ( (ValueCellFull!6930 (v!9824 V!24589)) (EmptyCell!6930) )
))
(declare-datatypes ((array!45580 0))(
  ( (array!45581 (arr!21841 (Array (_ BitVec 32) ValueCell!6930)) (size!22262 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45580)

(declare-datatypes ((Unit!28083 0))(
  ( (Unit!28084) )
))
(declare-fun lt!369146 () Unit!28083)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!439 (array!45578 array!45580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24589 V!24589 V!24589 V!24589 (_ BitVec 32) Int) Unit!28083)

(assert (=> b!821289 (= lt!369146 (lemmaNoChangeToArrayThenSameMapNoExtras!439 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2329 (array!45578 array!45580 (_ BitVec 32) (_ BitVec 32) V!24589 V!24589 (_ BitVec 32) Int) ListLongMap!8575)

(assert (=> b!821289 (= lt!369147 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821289 (= lt!369149 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821290 () Bool)

(declare-fun res!560263 () Bool)

(assert (=> b!821290 (=> (not res!560263) (not e!456416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45578 (_ BitVec 32)) Bool)

(assert (=> b!821290 (= res!560263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23644 () Bool)

(declare-fun mapRes!23644 () Bool)

(declare-fun tp!45684 () Bool)

(declare-fun e!456413 () Bool)

(assert (=> mapNonEmpty!23644 (= mapRes!23644 (and tp!45684 e!456413))))

(declare-fun mapKey!23644 () (_ BitVec 32))

(declare-fun mapValue!23644 () ValueCell!6930)

(declare-fun mapRest!23644 () (Array (_ BitVec 32) ValueCell!6930))

(assert (=> mapNonEmpty!23644 (= (arr!21841 _values!788) (store mapRest!23644 mapKey!23644 mapValue!23644))))

(declare-fun b!821291 () Bool)

(declare-fun res!560267 () Bool)

(assert (=> b!821291 (=> (not res!560267) (not e!456416))))

(declare-datatypes ((List!15571 0))(
  ( (Nil!15568) (Cons!15567 (h!16696 (_ BitVec 64)) (t!21906 List!15571)) )
))
(declare-fun arrayNoDuplicates!0 (array!45578 (_ BitVec 32) List!15571) Bool)

(assert (=> b!821291 (= res!560267 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15568))))

(declare-fun b!821292 () Bool)

(assert (=> b!821292 (= e!456414 true)))

(declare-fun lt!369148 () ListLongMap!8575)

(declare-fun getCurrentListMap!2473 (array!45578 array!45580 (_ BitVec 32) (_ BitVec 32) V!24589 V!24589 (_ BitVec 32) Int) ListLongMap!8575)

(assert (=> b!821292 (= lt!369148 (getCurrentListMap!2473 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560266 () Bool)

(assert (=> start!70708 (=> (not res!560266) (not e!456416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70708 (= res!560266 (validMask!0 mask!1312))))

(assert (=> start!70708 e!456416))

(declare-fun tp_is_empty!14691 () Bool)

(assert (=> start!70708 tp_is_empty!14691))

(declare-fun array_inv!17457 (array!45578) Bool)

(assert (=> start!70708 (array_inv!17457 _keys!976)))

(assert (=> start!70708 true))

(declare-fun e!456411 () Bool)

(declare-fun array_inv!17458 (array!45580) Bool)

(assert (=> start!70708 (and (array_inv!17458 _values!788) e!456411)))

(assert (=> start!70708 tp!45685))

(declare-fun b!821293 () Bool)

(declare-fun e!456415 () Bool)

(assert (=> b!821293 (= e!456415 tp_is_empty!14691)))

(declare-fun b!821294 () Bool)

(declare-fun res!560264 () Bool)

(assert (=> b!821294 (=> (not res!560264) (not e!456416))))

(assert (=> b!821294 (= res!560264 (and (= (size!22262 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22261 _keys!976) (size!22262 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821295 () Bool)

(assert (=> b!821295 (= e!456411 (and e!456415 mapRes!23644))))

(declare-fun condMapEmpty!23644 () Bool)

(declare-fun mapDefault!23644 () ValueCell!6930)

(assert (=> b!821295 (= condMapEmpty!23644 (= (arr!21841 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6930)) mapDefault!23644)))))

(declare-fun mapIsEmpty!23644 () Bool)

(assert (=> mapIsEmpty!23644 mapRes!23644))

(declare-fun b!821296 () Bool)

(assert (=> b!821296 (= e!456413 tp_is_empty!14691)))

(assert (= (and start!70708 res!560266) b!821294))

(assert (= (and b!821294 res!560264) b!821290))

(assert (= (and b!821290 res!560263) b!821291))

(assert (= (and b!821291 res!560267) b!821289))

(assert (= (and b!821289 (not res!560265)) b!821292))

(assert (= (and b!821295 condMapEmpty!23644) mapIsEmpty!23644))

(assert (= (and b!821295 (not condMapEmpty!23644)) mapNonEmpty!23644))

(get-info :version)

(assert (= (and mapNonEmpty!23644 ((_ is ValueCellFull!6930) mapValue!23644)) b!821296))

(assert (= (and b!821295 ((_ is ValueCellFull!6930) mapDefault!23644)) b!821293))

(assert (= start!70708 b!821295))

(declare-fun m!763109 () Bool)

(assert (=> b!821290 m!763109))

(declare-fun m!763111 () Bool)

(assert (=> b!821289 m!763111))

(declare-fun m!763113 () Bool)

(assert (=> b!821289 m!763113))

(declare-fun m!763115 () Bool)

(assert (=> b!821289 m!763115))

(declare-fun m!763117 () Bool)

(assert (=> b!821292 m!763117))

(declare-fun m!763119 () Bool)

(assert (=> mapNonEmpty!23644 m!763119))

(declare-fun m!763121 () Bool)

(assert (=> b!821291 m!763121))

(declare-fun m!763123 () Bool)

(assert (=> start!70708 m!763123))

(declare-fun m!763125 () Bool)

(assert (=> start!70708 m!763125))

(declare-fun m!763127 () Bool)

(assert (=> start!70708 m!763127))

(check-sat tp_is_empty!14691 (not b!821292) b_and!21843 (not b_next!12981) (not start!70708) (not b!821291) (not b!821289) (not b!821290) (not mapNonEmpty!23644))
(check-sat b_and!21843 (not b_next!12981))
