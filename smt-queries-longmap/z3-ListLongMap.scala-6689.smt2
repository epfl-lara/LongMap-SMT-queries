; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84108 () Bool)

(assert start!84108)

(declare-fun b!983464 () Bool)

(declare-fun e!554385 () Bool)

(assert (=> b!983464 (= e!554385 false)))

(declare-fun lt!436523 () Bool)

(declare-datatypes ((array!61809 0))(
  ( (array!61810 (arr!29762 (Array (_ BitVec 32) (_ BitVec 64))) (size!30241 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61809)

(declare-datatypes ((List!20613 0))(
  ( (Nil!20610) (Cons!20609 (h!21771 (_ BitVec 64)) (t!29404 List!20613)) )
))
(declare-fun arrayNoDuplicates!0 (array!61809 (_ BitVec 32) List!20613) Bool)

(assert (=> b!983464 (= lt!436523 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20610))))

(declare-fun mapNonEmpty!36395 () Bool)

(declare-fun mapRes!36395 () Bool)

(declare-fun tp!69079 () Bool)

(declare-fun e!554382 () Bool)

(assert (=> mapNonEmpty!36395 (= mapRes!36395 (and tp!69079 e!554382))))

(declare-datatypes ((V!35531 0))(
  ( (V!35532 (val!11506 Int)) )
))
(declare-datatypes ((ValueCell!10974 0))(
  ( (ValueCellFull!10974 (v!14068 V!35531)) (EmptyCell!10974) )
))
(declare-datatypes ((array!61811 0))(
  ( (array!61812 (arr!29763 (Array (_ BitVec 32) ValueCell!10974)) (size!30242 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61811)

(declare-fun mapValue!36395 () ValueCell!10974)

(declare-fun mapRest!36395 () (Array (_ BitVec 32) ValueCell!10974))

(declare-fun mapKey!36395 () (_ BitVec 32))

(assert (=> mapNonEmpty!36395 (= (arr!29763 _values!1278) (store mapRest!36395 mapKey!36395 mapValue!36395))))

(declare-fun b!983465 () Bool)

(declare-fun e!554384 () Bool)

(declare-fun tp_is_empty!22911 () Bool)

(assert (=> b!983465 (= e!554384 tp_is_empty!22911)))

(declare-fun b!983466 () Bool)

(declare-fun res!658107 () Bool)

(assert (=> b!983466 (=> (not res!658107) (not e!554385))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61809 (_ BitVec 32)) Bool)

(assert (=> b!983466 (= res!658107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983467 () Bool)

(assert (=> b!983467 (= e!554382 tp_is_empty!22911)))

(declare-fun res!658109 () Bool)

(assert (=> start!84108 (=> (not res!658109) (not e!554385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84108 (= res!658109 (validMask!0 mask!1948))))

(assert (=> start!84108 e!554385))

(assert (=> start!84108 true))

(declare-fun e!554383 () Bool)

(declare-fun array_inv!23013 (array!61811) Bool)

(assert (=> start!84108 (and (array_inv!23013 _values!1278) e!554383)))

(declare-fun array_inv!23014 (array!61809) Bool)

(assert (=> start!84108 (array_inv!23014 _keys!1544)))

(declare-fun mapIsEmpty!36395 () Bool)

(assert (=> mapIsEmpty!36395 mapRes!36395))

(declare-fun b!983468 () Bool)

(assert (=> b!983468 (= e!554383 (and e!554384 mapRes!36395))))

(declare-fun condMapEmpty!36395 () Bool)

(declare-fun mapDefault!36395 () ValueCell!10974)

(assert (=> b!983468 (= condMapEmpty!36395 (= (arr!29763 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10974)) mapDefault!36395)))))

(declare-fun b!983469 () Bool)

(declare-fun res!658108 () Bool)

(assert (=> b!983469 (=> (not res!658108) (not e!554385))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983469 (= res!658108 (and (= (size!30242 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30241 _keys!1544) (size!30242 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84108 res!658109) b!983469))

(assert (= (and b!983469 res!658108) b!983466))

(assert (= (and b!983466 res!658107) b!983464))

(assert (= (and b!983468 condMapEmpty!36395) mapIsEmpty!36395))

(assert (= (and b!983468 (not condMapEmpty!36395)) mapNonEmpty!36395))

(get-info :version)

(assert (= (and mapNonEmpty!36395 ((_ is ValueCellFull!10974) mapValue!36395)) b!983467))

(assert (= (and b!983468 ((_ is ValueCellFull!10974) mapDefault!36395)) b!983465))

(assert (= start!84108 b!983468))

(declare-fun m!910729 () Bool)

(assert (=> b!983464 m!910729))

(declare-fun m!910731 () Bool)

(assert (=> mapNonEmpty!36395 m!910731))

(declare-fun m!910733 () Bool)

(assert (=> b!983466 m!910733))

(declare-fun m!910735 () Bool)

(assert (=> start!84108 m!910735))

(declare-fun m!910737 () Bool)

(assert (=> start!84108 m!910737))

(declare-fun m!910739 () Bool)

(assert (=> start!84108 m!910739))

(check-sat (not b!983464) (not b!983466) (not start!84108) tp_is_empty!22911 (not mapNonEmpty!36395))
(check-sat)
