; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35466 () Bool)

(assert start!35466)

(declare-fun b!355317 () Bool)

(declare-fun res!197169 () Bool)

(declare-fun e!217620 () Bool)

(assert (=> b!355317 (=> (not res!197169) (not e!217620))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19431 0))(
  ( (array!19432 (arr!9209 (Array (_ BitVec 32) (_ BitVec 64))) (size!9562 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19431)

(declare-datatypes ((V!11555 0))(
  ( (V!11556 (val!4011 Int)) )
))
(declare-datatypes ((ValueCell!3623 0))(
  ( (ValueCellFull!3623 (v!6199 V!11555)) (EmptyCell!3623) )
))
(declare-datatypes ((array!19433 0))(
  ( (array!19434 (arr!9210 (Array (_ BitVec 32) ValueCell!3623)) (size!9563 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19433)

(assert (=> b!355317 (= res!197169 (and (= (size!9563 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9562 _keys!1456) (size!9563 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355318 () Bool)

(assert (=> b!355318 (= e!217620 false)))

(declare-fun lt!165580 () Bool)

(declare-datatypes ((List!5312 0))(
  ( (Nil!5309) (Cons!5308 (h!6164 (_ BitVec 64)) (t!10453 List!5312)) )
))
(declare-fun arrayNoDuplicates!0 (array!19431 (_ BitVec 32) List!5312) Bool)

(assert (=> b!355318 (= lt!165580 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5309))))

(declare-fun mapIsEmpty!13407 () Bool)

(declare-fun mapRes!13407 () Bool)

(assert (=> mapIsEmpty!13407 mapRes!13407))

(declare-fun b!355319 () Bool)

(declare-fun e!217616 () Bool)

(declare-fun tp_is_empty!7933 () Bool)

(assert (=> b!355319 (= e!217616 tp_is_empty!7933)))

(declare-fun b!355320 () Bool)

(declare-fun e!217619 () Bool)

(assert (=> b!355320 (= e!217619 tp_is_empty!7933)))

(declare-fun b!355321 () Bool)

(declare-fun res!197168 () Bool)

(assert (=> b!355321 (=> (not res!197168) (not e!217620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19431 (_ BitVec 32)) Bool)

(assert (=> b!355321 (= res!197168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355322 () Bool)

(declare-fun e!217618 () Bool)

(assert (=> b!355322 (= e!217618 (and e!217619 mapRes!13407))))

(declare-fun condMapEmpty!13407 () Bool)

(declare-fun mapDefault!13407 () ValueCell!3623)

(assert (=> b!355322 (= condMapEmpty!13407 (= (arr!9210 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3623)) mapDefault!13407)))))

(declare-fun res!197170 () Bool)

(assert (=> start!35466 (=> (not res!197170) (not e!217620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35466 (= res!197170 (validMask!0 mask!1842))))

(assert (=> start!35466 e!217620))

(assert (=> start!35466 true))

(declare-fun array_inv!6814 (array!19433) Bool)

(assert (=> start!35466 (and (array_inv!6814 _values!1208) e!217618)))

(declare-fun array_inv!6815 (array!19431) Bool)

(assert (=> start!35466 (array_inv!6815 _keys!1456)))

(declare-fun mapNonEmpty!13407 () Bool)

(declare-fun tp!27384 () Bool)

(assert (=> mapNonEmpty!13407 (= mapRes!13407 (and tp!27384 e!217616))))

(declare-fun mapValue!13407 () ValueCell!3623)

(declare-fun mapRest!13407 () (Array (_ BitVec 32) ValueCell!3623))

(declare-fun mapKey!13407 () (_ BitVec 32))

(assert (=> mapNonEmpty!13407 (= (arr!9210 _values!1208) (store mapRest!13407 mapKey!13407 mapValue!13407))))

(assert (= (and start!35466 res!197170) b!355317))

(assert (= (and b!355317 res!197169) b!355321))

(assert (= (and b!355321 res!197168) b!355318))

(assert (= (and b!355322 condMapEmpty!13407) mapIsEmpty!13407))

(assert (= (and b!355322 (not condMapEmpty!13407)) mapNonEmpty!13407))

(get-info :version)

(assert (= (and mapNonEmpty!13407 ((_ is ValueCellFull!3623) mapValue!13407)) b!355319))

(assert (= (and b!355322 ((_ is ValueCellFull!3623) mapDefault!13407)) b!355320))

(assert (= start!35466 b!355322))

(declare-fun m!353547 () Bool)

(assert (=> b!355318 m!353547))

(declare-fun m!353549 () Bool)

(assert (=> b!355321 m!353549))

(declare-fun m!353551 () Bool)

(assert (=> start!35466 m!353551))

(declare-fun m!353553 () Bool)

(assert (=> start!35466 m!353553))

(declare-fun m!353555 () Bool)

(assert (=> start!35466 m!353555))

(declare-fun m!353557 () Bool)

(assert (=> mapNonEmpty!13407 m!353557))

(check-sat (not b!355318) (not b!355321) (not mapNonEmpty!13407) (not start!35466) tp_is_empty!7933)
(check-sat)
