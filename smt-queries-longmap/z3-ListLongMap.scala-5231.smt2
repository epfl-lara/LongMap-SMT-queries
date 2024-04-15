; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70430 () Bool)

(assert start!70430)

(declare-fun b_free!12793 () Bool)

(declare-fun b_next!12793 () Bool)

(assert (=> start!70430 (= b_free!12793 (not b_next!12793))))

(declare-fun tp!45108 () Bool)

(declare-fun b_and!21587 () Bool)

(assert (=> start!70430 (= tp!45108 b_and!21587)))

(declare-fun b!818085 () Bool)

(declare-fun res!558397 () Bool)

(declare-fun e!454092 () Bool)

(assert (=> b!818085 (=> (not res!558397) (not e!454092))))

(declare-datatypes ((array!45181 0))(
  ( (array!45182 (arr!21646 (Array (_ BitVec 32) (_ BitVec 64))) (size!22067 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45181)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24339 0))(
  ( (V!24340 (val!7299 Int)) )
))
(declare-datatypes ((ValueCell!6836 0))(
  ( (ValueCellFull!6836 (v!9722 V!24339)) (EmptyCell!6836) )
))
(declare-datatypes ((array!45183 0))(
  ( (array!45184 (arr!21647 (Array (_ BitVec 32) ValueCell!6836)) (size!22068 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45183)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818085 (= res!558397 (and (= (size!22068 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22067 _keys!976) (size!22068 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818086 () Bool)

(declare-fun e!454093 () Bool)

(declare-fun tp_is_empty!14503 () Bool)

(assert (=> b!818086 (= e!454093 tp_is_empty!14503)))

(declare-fun b!818087 () Bool)

(declare-fun e!454091 () Bool)

(assert (=> b!818087 (= e!454092 (not e!454091))))

(declare-fun res!558395 () Bool)

(assert (=> b!818087 (=> res!558395 e!454091)))

(assert (=> b!818087 (= res!558395 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9614 0))(
  ( (tuple2!9615 (_1!4818 (_ BitVec 64)) (_2!4818 V!24339)) )
))
(declare-datatypes ((List!15438 0))(
  ( (Nil!15435) (Cons!15434 (h!16563 tuple2!9614) (t!21756 List!15438)) )
))
(declare-datatypes ((ListLongMap!8427 0))(
  ( (ListLongMap!8428 (toList!4229 List!15438)) )
))
(declare-fun lt!366430 () ListLongMap!8427)

(declare-fun lt!366433 () ListLongMap!8427)

(assert (=> b!818087 (= lt!366430 lt!366433)))

(declare-fun zeroValueBefore!34 () V!24339)

(declare-fun zeroValueAfter!34 () V!24339)

(declare-fun minValue!754 () V!24339)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27882 0))(
  ( (Unit!27883) )
))
(declare-fun lt!366431 () Unit!27882)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!380 (array!45181 array!45183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24339 V!24339 V!24339 V!24339 (_ BitVec 32) Int) Unit!27882)

(assert (=> b!818087 (= lt!366431 (lemmaNoChangeToArrayThenSameMapNoExtras!380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2287 (array!45181 array!45183 (_ BitVec 32) (_ BitVec 32) V!24339 V!24339 (_ BitVec 32) Int) ListLongMap!8427)

(assert (=> b!818087 (= lt!366433 (getCurrentListMapNoExtraKeys!2287 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818087 (= lt!366430 (getCurrentListMapNoExtraKeys!2287 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818088 () Bool)

(declare-fun e!454095 () Bool)

(assert (=> b!818088 (= e!454095 tp_is_empty!14503)))

(declare-fun mapNonEmpty!23350 () Bool)

(declare-fun mapRes!23350 () Bool)

(declare-fun tp!45109 () Bool)

(assert (=> mapNonEmpty!23350 (= mapRes!23350 (and tp!45109 e!454095))))

(declare-fun mapKey!23350 () (_ BitVec 32))

(declare-fun mapRest!23350 () (Array (_ BitVec 32) ValueCell!6836))

(declare-fun mapValue!23350 () ValueCell!6836)

(assert (=> mapNonEmpty!23350 (= (arr!21647 _values!788) (store mapRest!23350 mapKey!23350 mapValue!23350))))

(declare-fun b!818089 () Bool)

(declare-fun res!558396 () Bool)

(assert (=> b!818089 (=> (not res!558396) (not e!454092))))

(declare-datatypes ((List!15439 0))(
  ( (Nil!15436) (Cons!15435 (h!16564 (_ BitVec 64)) (t!21757 List!15439)) )
))
(declare-fun arrayNoDuplicates!0 (array!45181 (_ BitVec 32) List!15439) Bool)

(assert (=> b!818089 (= res!558396 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15436))))

(declare-fun b!818090 () Bool)

(declare-fun res!558394 () Bool)

(assert (=> b!818090 (=> (not res!558394) (not e!454092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45181 (_ BitVec 32)) Bool)

(assert (=> b!818090 (= res!558394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23350 () Bool)

(assert (=> mapIsEmpty!23350 mapRes!23350))

(declare-fun b!818092 () Bool)

(declare-fun e!454096 () Bool)

(assert (=> b!818092 (= e!454096 (and e!454093 mapRes!23350))))

(declare-fun condMapEmpty!23350 () Bool)

(declare-fun mapDefault!23350 () ValueCell!6836)

(assert (=> b!818092 (= condMapEmpty!23350 (= (arr!21647 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6836)) mapDefault!23350)))))

(declare-fun res!558393 () Bool)

(assert (=> start!70430 (=> (not res!558393) (not e!454092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70430 (= res!558393 (validMask!0 mask!1312))))

(assert (=> start!70430 e!454092))

(assert (=> start!70430 tp_is_empty!14503))

(declare-fun array_inv!17379 (array!45181) Bool)

(assert (=> start!70430 (array_inv!17379 _keys!976)))

(assert (=> start!70430 true))

(declare-fun array_inv!17380 (array!45183) Bool)

(assert (=> start!70430 (and (array_inv!17380 _values!788) e!454096)))

(assert (=> start!70430 tp!45108))

(declare-fun b!818091 () Bool)

(assert (=> b!818091 (= e!454091 true)))

(declare-fun lt!366432 () ListLongMap!8427)

(declare-fun getCurrentListMap!2381 (array!45181 array!45183 (_ BitVec 32) (_ BitVec 32) V!24339 V!24339 (_ BitVec 32) Int) ListLongMap!8427)

(assert (=> b!818091 (= lt!366432 (getCurrentListMap!2381 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70430 res!558393) b!818085))

(assert (= (and b!818085 res!558397) b!818090))

(assert (= (and b!818090 res!558394) b!818089))

(assert (= (and b!818089 res!558396) b!818087))

(assert (= (and b!818087 (not res!558395)) b!818091))

(assert (= (and b!818092 condMapEmpty!23350) mapIsEmpty!23350))

(assert (= (and b!818092 (not condMapEmpty!23350)) mapNonEmpty!23350))

(get-info :version)

(assert (= (and mapNonEmpty!23350 ((_ is ValueCellFull!6836) mapValue!23350)) b!818088))

(assert (= (and b!818092 ((_ is ValueCellFull!6836) mapDefault!23350)) b!818086))

(assert (= start!70430 b!818092))

(declare-fun m!759013 () Bool)

(assert (=> mapNonEmpty!23350 m!759013))

(declare-fun m!759015 () Bool)

(assert (=> b!818089 m!759015))

(declare-fun m!759017 () Bool)

(assert (=> b!818090 m!759017))

(declare-fun m!759019 () Bool)

(assert (=> b!818087 m!759019))

(declare-fun m!759021 () Bool)

(assert (=> b!818087 m!759021))

(declare-fun m!759023 () Bool)

(assert (=> b!818087 m!759023))

(declare-fun m!759025 () Bool)

(assert (=> b!818091 m!759025))

(declare-fun m!759027 () Bool)

(assert (=> start!70430 m!759027))

(declare-fun m!759029 () Bool)

(assert (=> start!70430 m!759029))

(declare-fun m!759031 () Bool)

(assert (=> start!70430 m!759031))

(check-sat (not mapNonEmpty!23350) (not b!818091) (not b_next!12793) (not b!818089) (not b!818090) b_and!21587 (not start!70430) (not b!818087) tp_is_empty!14503)
(check-sat b_and!21587 (not b_next!12793))
