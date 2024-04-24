; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35358 () Bool)

(assert start!35358)

(declare-fun res!196323 () Bool)

(declare-fun e!216952 () Bool)

(assert (=> start!35358 (=> (not res!196323) (not e!216952))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35358 (= res!196323 (validMask!0 mask!1842))))

(assert (=> start!35358 e!216952))

(assert (=> start!35358 true))

(declare-datatypes ((V!11411 0))(
  ( (V!11412 (val!3957 Int)) )
))
(declare-datatypes ((ValueCell!3569 0))(
  ( (ValueCellFull!3569 (v!6152 V!11411)) (EmptyCell!3569) )
))
(declare-datatypes ((array!19230 0))(
  ( (array!19231 (arr!9108 (Array (_ BitVec 32) ValueCell!3569)) (size!9460 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19230)

(declare-fun e!216948 () Bool)

(declare-fun array_inv!6726 (array!19230) Bool)

(assert (=> start!35358 (and (array_inv!6726 _values!1208) e!216948)))

(declare-datatypes ((array!19232 0))(
  ( (array!19233 (arr!9109 (Array (_ BitVec 32) (_ BitVec 64))) (size!9461 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19232)

(declare-fun array_inv!6727 (array!19232) Bool)

(assert (=> start!35358 (array_inv!6727 _keys!1456)))

(declare-fun b!354081 () Bool)

(declare-fun e!216951 () Bool)

(declare-fun mapRes!13245 () Bool)

(assert (=> b!354081 (= e!216948 (and e!216951 mapRes!13245))))

(declare-fun condMapEmpty!13245 () Bool)

(declare-fun mapDefault!13245 () ValueCell!3569)

(assert (=> b!354081 (= condMapEmpty!13245 (= (arr!9108 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3569)) mapDefault!13245)))))

(declare-fun b!354082 () Bool)

(declare-fun res!196322 () Bool)

(assert (=> b!354082 (=> (not res!196322) (not e!216952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19232 (_ BitVec 32)) Bool)

(assert (=> b!354082 (= res!196322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13245 () Bool)

(assert (=> mapIsEmpty!13245 mapRes!13245))

(declare-fun b!354083 () Bool)

(declare-fun e!216949 () Bool)

(declare-fun tp_is_empty!7825 () Bool)

(assert (=> b!354083 (= e!216949 tp_is_empty!7825)))

(declare-fun b!354084 () Bool)

(assert (=> b!354084 (= e!216952 false)))

(declare-fun lt!165671 () Bool)

(declare-datatypes ((List!5194 0))(
  ( (Nil!5191) (Cons!5190 (h!6046 (_ BitVec 64)) (t!10336 List!5194)) )
))
(declare-fun arrayNoDuplicates!0 (array!19232 (_ BitVec 32) List!5194) Bool)

(assert (=> b!354084 (= lt!165671 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5191))))

(declare-fun b!354085 () Bool)

(assert (=> b!354085 (= e!216951 tp_is_empty!7825)))

(declare-fun b!354086 () Bool)

(declare-fun res!196324 () Bool)

(assert (=> b!354086 (=> (not res!196324) (not e!216952))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354086 (= res!196324 (and (= (size!9460 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9461 _keys!1456) (size!9460 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13245 () Bool)

(declare-fun tp!27141 () Bool)

(assert (=> mapNonEmpty!13245 (= mapRes!13245 (and tp!27141 e!216949))))

(declare-fun mapValue!13245 () ValueCell!3569)

(declare-fun mapRest!13245 () (Array (_ BitVec 32) ValueCell!3569))

(declare-fun mapKey!13245 () (_ BitVec 32))

(assert (=> mapNonEmpty!13245 (= (arr!9108 _values!1208) (store mapRest!13245 mapKey!13245 mapValue!13245))))

(assert (= (and start!35358 res!196323) b!354086))

(assert (= (and b!354086 res!196324) b!354082))

(assert (= (and b!354082 res!196322) b!354084))

(assert (= (and b!354081 condMapEmpty!13245) mapIsEmpty!13245))

(assert (= (and b!354081 (not condMapEmpty!13245)) mapNonEmpty!13245))

(get-info :version)

(assert (= (and mapNonEmpty!13245 ((_ is ValueCellFull!3569) mapValue!13245)) b!354083))

(assert (= (and b!354081 ((_ is ValueCellFull!3569) mapDefault!13245)) b!354085))

(assert (= start!35358 b!354081))

(declare-fun m!353475 () Bool)

(assert (=> start!35358 m!353475))

(declare-fun m!353477 () Bool)

(assert (=> start!35358 m!353477))

(declare-fun m!353479 () Bool)

(assert (=> start!35358 m!353479))

(declare-fun m!353481 () Bool)

(assert (=> b!354082 m!353481))

(declare-fun m!353483 () Bool)

(assert (=> b!354084 m!353483))

(declare-fun m!353485 () Bool)

(assert (=> mapNonEmpty!13245 m!353485))

(check-sat (not start!35358) (not mapNonEmpty!13245) (not b!354082) (not b!354084) tp_is_empty!7825)
(check-sat)
