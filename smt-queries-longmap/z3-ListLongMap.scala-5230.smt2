; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70446 () Bool)

(assert start!70446)

(declare-fun b_free!12789 () Bool)

(declare-fun b_next!12789 () Bool)

(assert (=> start!70446 (= b_free!12789 (not b_next!12789))))

(declare-fun tp!45096 () Bool)

(declare-fun b_and!21609 () Bool)

(assert (=> start!70446 (= tp!45096 b_and!21609)))

(declare-fun b!818283 () Bool)

(declare-fun res!558473 () Bool)

(declare-fun e!454206 () Bool)

(assert (=> b!818283 (=> (not res!558473) (not e!454206))))

(declare-datatypes ((array!45198 0))(
  ( (array!45199 (arr!21654 (Array (_ BitVec 32) (_ BitVec 64))) (size!22075 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45198)

(declare-datatypes ((List!15423 0))(
  ( (Nil!15420) (Cons!15419 (h!16548 (_ BitVec 64)) (t!21750 List!15423)) )
))
(declare-fun arrayNoDuplicates!0 (array!45198 (_ BitVec 32) List!15423) Bool)

(assert (=> b!818283 (= res!558473 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15420))))

(declare-fun b!818284 () Bool)

(declare-fun res!558471 () Bool)

(assert (=> b!818284 (=> (not res!558471) (not e!454206))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45198 (_ BitVec 32)) Bool)

(assert (=> b!818284 (= res!558471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818285 () Bool)

(declare-fun e!454208 () Bool)

(declare-fun tp_is_empty!14499 () Bool)

(assert (=> b!818285 (= e!454208 tp_is_empty!14499)))

(declare-fun b!818286 () Bool)

(declare-fun e!454205 () Bool)

(assert (=> b!818286 (= e!454205 tp_is_empty!14499)))

(declare-fun b!818287 () Bool)

(declare-fun e!454207 () Bool)

(declare-fun mapRes!23344 () Bool)

(assert (=> b!818287 (= e!454207 (and e!454208 mapRes!23344))))

(declare-fun condMapEmpty!23344 () Bool)

(declare-datatypes ((V!24333 0))(
  ( (V!24334 (val!7297 Int)) )
))
(declare-datatypes ((ValueCell!6834 0))(
  ( (ValueCellFull!6834 (v!9726 V!24333)) (EmptyCell!6834) )
))
(declare-datatypes ((array!45200 0))(
  ( (array!45201 (arr!21655 (Array (_ BitVec 32) ValueCell!6834)) (size!22076 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45200)

(declare-fun mapDefault!23344 () ValueCell!6834)

(assert (=> b!818287 (= condMapEmpty!23344 (= (arr!21655 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6834)) mapDefault!23344)))))

(declare-fun mapNonEmpty!23344 () Bool)

(declare-fun tp!45097 () Bool)

(assert (=> mapNonEmpty!23344 (= mapRes!23344 (and tp!45097 e!454205))))

(declare-fun mapValue!23344 () ValueCell!6834)

(declare-fun mapRest!23344 () (Array (_ BitVec 32) ValueCell!6834))

(declare-fun mapKey!23344 () (_ BitVec 32))

(assert (=> mapNonEmpty!23344 (= (arr!21655 _values!788) (store mapRest!23344 mapKey!23344 mapValue!23344))))

(declare-fun res!558470 () Bool)

(assert (=> start!70446 (=> (not res!558470) (not e!454206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70446 (= res!558470 (validMask!0 mask!1312))))

(assert (=> start!70446 e!454206))

(assert (=> start!70446 tp_is_empty!14499))

(declare-fun array_inv!17319 (array!45198) Bool)

(assert (=> start!70446 (array_inv!17319 _keys!976)))

(assert (=> start!70446 true))

(declare-fun array_inv!17320 (array!45200) Bool)

(assert (=> start!70446 (and (array_inv!17320 _values!788) e!454207)))

(assert (=> start!70446 tp!45096))

(declare-fun b!818288 () Bool)

(declare-fun e!454210 () Bool)

(assert (=> b!818288 (= e!454206 (not e!454210))))

(declare-fun res!558469 () Bool)

(assert (=> b!818288 (=> res!558469 e!454210)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818288 (= res!558469 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9592 0))(
  ( (tuple2!9593 (_1!4807 (_ BitVec 64)) (_2!4807 V!24333)) )
))
(declare-datatypes ((List!15424 0))(
  ( (Nil!15421) (Cons!15420 (h!16549 tuple2!9592) (t!21751 List!15424)) )
))
(declare-datatypes ((ListLongMap!8415 0))(
  ( (ListLongMap!8416 (toList!4223 List!15424)) )
))
(declare-fun lt!366650 () ListLongMap!8415)

(declare-fun lt!366651 () ListLongMap!8415)

(assert (=> b!818288 (= lt!366650 lt!366651)))

(declare-fun zeroValueBefore!34 () V!24333)

(declare-fun zeroValueAfter!34 () V!24333)

(declare-fun minValue!754 () V!24333)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27928 0))(
  ( (Unit!27929) )
))
(declare-fun lt!366652 () Unit!27928)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!373 (array!45198 array!45200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24333 V!24333 V!24333 V!24333 (_ BitVec 32) Int) Unit!27928)

(assert (=> b!818288 (= lt!366652 (lemmaNoChangeToArrayThenSameMapNoExtras!373 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2263 (array!45198 array!45200 (_ BitVec 32) (_ BitVec 32) V!24333 V!24333 (_ BitVec 32) Int) ListLongMap!8415)

(assert (=> b!818288 (= lt!366651 (getCurrentListMapNoExtraKeys!2263 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818288 (= lt!366650 (getCurrentListMapNoExtraKeys!2263 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23344 () Bool)

(assert (=> mapIsEmpty!23344 mapRes!23344))

(declare-fun b!818289 () Bool)

(declare-fun res!558472 () Bool)

(assert (=> b!818289 (=> (not res!558472) (not e!454206))))

(assert (=> b!818289 (= res!558472 (and (= (size!22076 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22075 _keys!976) (size!22076 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818290 () Bool)

(assert (=> b!818290 (= e!454210 true)))

(declare-fun lt!366649 () ListLongMap!8415)

(declare-fun getCurrentListMap!2429 (array!45198 array!45200 (_ BitVec 32) (_ BitVec 32) V!24333 V!24333 (_ BitVec 32) Int) ListLongMap!8415)

(assert (=> b!818290 (= lt!366649 (getCurrentListMap!2429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70446 res!558470) b!818289))

(assert (= (and b!818289 res!558472) b!818284))

(assert (= (and b!818284 res!558471) b!818283))

(assert (= (and b!818283 res!558473) b!818288))

(assert (= (and b!818288 (not res!558469)) b!818290))

(assert (= (and b!818287 condMapEmpty!23344) mapIsEmpty!23344))

(assert (= (and b!818287 (not condMapEmpty!23344)) mapNonEmpty!23344))

(get-info :version)

(assert (= (and mapNonEmpty!23344 ((_ is ValueCellFull!6834) mapValue!23344)) b!818286))

(assert (= (and b!818287 ((_ is ValueCellFull!6834) mapDefault!23344)) b!818285))

(assert (= start!70446 b!818287))

(declare-fun m!759725 () Bool)

(assert (=> start!70446 m!759725))

(declare-fun m!759727 () Bool)

(assert (=> start!70446 m!759727))

(declare-fun m!759729 () Bool)

(assert (=> start!70446 m!759729))

(declare-fun m!759731 () Bool)

(assert (=> b!818288 m!759731))

(declare-fun m!759733 () Bool)

(assert (=> b!818288 m!759733))

(declare-fun m!759735 () Bool)

(assert (=> b!818288 m!759735))

(declare-fun m!759737 () Bool)

(assert (=> b!818284 m!759737))

(declare-fun m!759739 () Bool)

(assert (=> mapNonEmpty!23344 m!759739))

(declare-fun m!759741 () Bool)

(assert (=> b!818290 m!759741))

(declare-fun m!759743 () Bool)

(assert (=> b!818283 m!759743))

(check-sat (not b!818283) (not b_next!12789) (not start!70446) (not mapNonEmpty!23344) (not b!818290) b_and!21609 (not b!818288) (not b!818284) tp_is_empty!14499)
(check-sat b_and!21609 (not b_next!12789))
