; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69856 () Bool)

(assert start!69856)

(declare-fun mapIsEmpty!22618 () Bool)

(declare-fun mapRes!22618 () Bool)

(assert (=> mapIsEmpty!22618 mapRes!22618))

(declare-fun b!812202 () Bool)

(declare-fun res!555077 () Bool)

(declare-fun e!449849 () Bool)

(assert (=> b!812202 (=> (not res!555077) (not e!449849))))

(declare-datatypes ((array!44281 0))(
  ( (array!44282 (arr!21203 (Array (_ BitVec 32) (_ BitVec 64))) (size!21624 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44281)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44281 (_ BitVec 32)) Bool)

(assert (=> b!812202 (= res!555077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812203 () Bool)

(assert (=> b!812203 (= e!449849 false)))

(declare-fun lt!363897 () Bool)

(declare-datatypes ((List!15136 0))(
  ( (Nil!15133) (Cons!15132 (h!16261 (_ BitVec 64)) (t!21442 List!15136)) )
))
(declare-fun arrayNoDuplicates!0 (array!44281 (_ BitVec 32) List!15136) Bool)

(assert (=> b!812203 (= lt!363897 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15133))))

(declare-fun b!812204 () Bool)

(declare-fun e!449850 () Bool)

(declare-fun e!449851 () Bool)

(assert (=> b!812204 (= e!449850 (and e!449851 mapRes!22618))))

(declare-fun condMapEmpty!22618 () Bool)

(declare-datatypes ((V!23707 0))(
  ( (V!23708 (val!7062 Int)) )
))
(declare-datatypes ((ValueCell!6599 0))(
  ( (ValueCellFull!6599 (v!9483 V!23707)) (EmptyCell!6599) )
))
(declare-datatypes ((array!44283 0))(
  ( (array!44284 (arr!21204 (Array (_ BitVec 32) ValueCell!6599)) (size!21625 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44283)

(declare-fun mapDefault!22618 () ValueCell!6599)

(assert (=> b!812204 (= condMapEmpty!22618 (= (arr!21204 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6599)) mapDefault!22618)))))

(declare-fun b!812205 () Bool)

(declare-fun tp_is_empty!14029 () Bool)

(assert (=> b!812205 (= e!449851 tp_is_empty!14029)))

(declare-fun res!555075 () Bool)

(assert (=> start!69856 (=> (not res!555075) (not e!449849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69856 (= res!555075 (validMask!0 mask!1312))))

(assert (=> start!69856 e!449849))

(declare-fun array_inv!17073 (array!44281) Bool)

(assert (=> start!69856 (array_inv!17073 _keys!976)))

(assert (=> start!69856 true))

(declare-fun array_inv!17074 (array!44283) Bool)

(assert (=> start!69856 (and (array_inv!17074 _values!788) e!449850)))

(declare-fun b!812206 () Bool)

(declare-fun e!449853 () Bool)

(assert (=> b!812206 (= e!449853 tp_is_empty!14029)))

(declare-fun mapNonEmpty!22618 () Bool)

(declare-fun tp!43726 () Bool)

(assert (=> mapNonEmpty!22618 (= mapRes!22618 (and tp!43726 e!449853))))

(declare-fun mapValue!22618 () ValueCell!6599)

(declare-fun mapKey!22618 () (_ BitVec 32))

(declare-fun mapRest!22618 () (Array (_ BitVec 32) ValueCell!6599))

(assert (=> mapNonEmpty!22618 (= (arr!21204 _values!788) (store mapRest!22618 mapKey!22618 mapValue!22618))))

(declare-fun b!812207 () Bool)

(declare-fun res!555076 () Bool)

(assert (=> b!812207 (=> (not res!555076) (not e!449849))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812207 (= res!555076 (and (= (size!21625 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21624 _keys!976) (size!21625 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69856 res!555075) b!812207))

(assert (= (and b!812207 res!555076) b!812202))

(assert (= (and b!812202 res!555077) b!812203))

(assert (= (and b!812204 condMapEmpty!22618) mapIsEmpty!22618))

(assert (= (and b!812204 (not condMapEmpty!22618)) mapNonEmpty!22618))

(get-info :version)

(assert (= (and mapNonEmpty!22618 ((_ is ValueCellFull!6599) mapValue!22618)) b!812206))

(assert (= (and b!812204 ((_ is ValueCellFull!6599) mapDefault!22618)) b!812205))

(assert (= start!69856 b!812204))

(declare-fun m!754081 () Bool)

(assert (=> b!812202 m!754081))

(declare-fun m!754083 () Bool)

(assert (=> b!812203 m!754083))

(declare-fun m!754085 () Bool)

(assert (=> start!69856 m!754085))

(declare-fun m!754087 () Bool)

(assert (=> start!69856 m!754087))

(declare-fun m!754089 () Bool)

(assert (=> start!69856 m!754089))

(declare-fun m!754091 () Bool)

(assert (=> mapNonEmpty!22618 m!754091))

(check-sat tp_is_empty!14029 (not b!812202) (not start!69856) (not mapNonEmpty!22618) (not b!812203))
(check-sat)
