; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69880 () Bool)

(assert start!69880)

(declare-fun b!812418 () Bool)

(declare-fun e!450030 () Bool)

(declare-fun tp_is_empty!14053 () Bool)

(assert (=> b!812418 (= e!450030 tp_is_empty!14053)))

(declare-fun b!812419 () Bool)

(declare-fun res!555183 () Bool)

(declare-fun e!450029 () Bool)

(assert (=> b!812419 (=> (not res!555183) (not e!450029))))

(declare-datatypes ((array!44327 0))(
  ( (array!44328 (arr!21226 (Array (_ BitVec 32) (_ BitVec 64))) (size!21647 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44327)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23739 0))(
  ( (V!23740 (val!7074 Int)) )
))
(declare-datatypes ((ValueCell!6611 0))(
  ( (ValueCellFull!6611 (v!9495 V!23739)) (EmptyCell!6611) )
))
(declare-datatypes ((array!44329 0))(
  ( (array!44330 (arr!21227 (Array (_ BitVec 32) ValueCell!6611)) (size!21648 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44329)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812419 (= res!555183 (and (= (size!21648 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21647 _keys!976) (size!21648 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812420 () Bool)

(declare-fun res!555185 () Bool)

(assert (=> b!812420 (=> (not res!555185) (not e!450029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44327 (_ BitVec 32)) Bool)

(assert (=> b!812420 (= res!555185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812421 () Bool)

(declare-fun e!450032 () Bool)

(declare-fun mapRes!22654 () Bool)

(assert (=> b!812421 (= e!450032 (and e!450030 mapRes!22654))))

(declare-fun condMapEmpty!22654 () Bool)

(declare-fun mapDefault!22654 () ValueCell!6611)

(assert (=> b!812421 (= condMapEmpty!22654 (= (arr!21227 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6611)) mapDefault!22654)))))

(declare-fun mapNonEmpty!22654 () Bool)

(declare-fun tp!43762 () Bool)

(declare-fun e!450031 () Bool)

(assert (=> mapNonEmpty!22654 (= mapRes!22654 (and tp!43762 e!450031))))

(declare-fun mapValue!22654 () ValueCell!6611)

(declare-fun mapRest!22654 () (Array (_ BitVec 32) ValueCell!6611))

(declare-fun mapKey!22654 () (_ BitVec 32))

(assert (=> mapNonEmpty!22654 (= (arr!21227 _values!788) (store mapRest!22654 mapKey!22654 mapValue!22654))))

(declare-fun res!555184 () Bool)

(assert (=> start!69880 (=> (not res!555184) (not e!450029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69880 (= res!555184 (validMask!0 mask!1312))))

(assert (=> start!69880 e!450029))

(declare-fun array_inv!17087 (array!44327) Bool)

(assert (=> start!69880 (array_inv!17087 _keys!976)))

(assert (=> start!69880 true))

(declare-fun array_inv!17088 (array!44329) Bool)

(assert (=> start!69880 (and (array_inv!17088 _values!788) e!450032)))

(declare-fun b!812422 () Bool)

(assert (=> b!812422 (= e!450029 false)))

(declare-fun lt!363933 () Bool)

(declare-datatypes ((List!15144 0))(
  ( (Nil!15141) (Cons!15140 (h!16269 (_ BitVec 64)) (t!21450 List!15144)) )
))
(declare-fun arrayNoDuplicates!0 (array!44327 (_ BitVec 32) List!15144) Bool)

(assert (=> b!812422 (= lt!363933 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15141))))

(declare-fun mapIsEmpty!22654 () Bool)

(assert (=> mapIsEmpty!22654 mapRes!22654))

(declare-fun b!812423 () Bool)

(assert (=> b!812423 (= e!450031 tp_is_empty!14053)))

(assert (= (and start!69880 res!555184) b!812419))

(assert (= (and b!812419 res!555183) b!812420))

(assert (= (and b!812420 res!555185) b!812422))

(assert (= (and b!812421 condMapEmpty!22654) mapIsEmpty!22654))

(assert (= (and b!812421 (not condMapEmpty!22654)) mapNonEmpty!22654))

(get-info :version)

(assert (= (and mapNonEmpty!22654 ((_ is ValueCellFull!6611) mapValue!22654)) b!812423))

(assert (= (and b!812421 ((_ is ValueCellFull!6611) mapDefault!22654)) b!812418))

(assert (= start!69880 b!812421))

(declare-fun m!754225 () Bool)

(assert (=> b!812420 m!754225))

(declare-fun m!754227 () Bool)

(assert (=> mapNonEmpty!22654 m!754227))

(declare-fun m!754229 () Bool)

(assert (=> start!69880 m!754229))

(declare-fun m!754231 () Bool)

(assert (=> start!69880 m!754231))

(declare-fun m!754233 () Bool)

(assert (=> start!69880 m!754233))

(declare-fun m!754235 () Bool)

(assert (=> b!812422 m!754235))

(check-sat (not mapNonEmpty!22654) (not b!812422) tp_is_empty!14053 (not b!812420) (not start!69880))
(check-sat)
