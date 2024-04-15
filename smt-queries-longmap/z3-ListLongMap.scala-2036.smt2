; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35370 () Bool)

(assert start!35370)

(declare-fun mapNonEmpty!13263 () Bool)

(declare-fun mapRes!13263 () Bool)

(declare-fun tp!27159 () Bool)

(declare-fun e!216896 () Bool)

(assert (=> mapNonEmpty!13263 (= mapRes!13263 (and tp!27159 e!216896))))

(declare-datatypes ((V!11427 0))(
  ( (V!11428 (val!3963 Int)) )
))
(declare-datatypes ((ValueCell!3575 0))(
  ( (ValueCellFull!3575 (v!6151 V!11427)) (EmptyCell!3575) )
))
(declare-fun mapValue!13263 () ValueCell!3575)

(declare-fun mapKey!13263 () (_ BitVec 32))

(declare-datatypes ((array!19243 0))(
  ( (array!19244 (arr!9115 (Array (_ BitVec 32) ValueCell!3575)) (size!9468 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19243)

(declare-fun mapRest!13263 () (Array (_ BitVec 32) ValueCell!3575))

(assert (=> mapNonEmpty!13263 (= (arr!9115 _values!1208) (store mapRest!13263 mapKey!13263 mapValue!13263))))

(declare-fun b!353967 () Bool)

(declare-fun tp_is_empty!7837 () Bool)

(assert (=> b!353967 (= e!216896 tp_is_empty!7837)))

(declare-fun b!353968 () Bool)

(declare-fun res!196250 () Bool)

(declare-fun e!216900 () Bool)

(assert (=> b!353968 (=> (not res!196250) (not e!216900))))

(declare-datatypes ((array!19245 0))(
  ( (array!19246 (arr!9116 (Array (_ BitVec 32) (_ BitVec 64))) (size!9469 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19245)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19245 (_ BitVec 32)) Bool)

(assert (=> b!353968 (= res!196250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13263 () Bool)

(assert (=> mapIsEmpty!13263 mapRes!13263))

(declare-fun b!353969 () Bool)

(declare-fun e!216898 () Bool)

(declare-fun e!216899 () Bool)

(assert (=> b!353969 (= e!216898 (and e!216899 mapRes!13263))))

(declare-fun condMapEmpty!13263 () Bool)

(declare-fun mapDefault!13263 () ValueCell!3575)

(assert (=> b!353969 (= condMapEmpty!13263 (= (arr!9115 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3575)) mapDefault!13263)))))

(declare-fun b!353970 () Bool)

(declare-fun res!196251 () Bool)

(assert (=> b!353970 (=> (not res!196251) (not e!216900))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353970 (= res!196251 (and (= (size!9468 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9469 _keys!1456) (size!9468 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!196252 () Bool)

(assert (=> start!35370 (=> (not res!196252) (not e!216900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35370 (= res!196252 (validMask!0 mask!1842))))

(assert (=> start!35370 e!216900))

(assert (=> start!35370 true))

(declare-fun array_inv!6750 (array!19243) Bool)

(assert (=> start!35370 (and (array_inv!6750 _values!1208) e!216898)))

(declare-fun array_inv!6751 (array!19245) Bool)

(assert (=> start!35370 (array_inv!6751 _keys!1456)))

(declare-fun b!353971 () Bool)

(assert (=> b!353971 (= e!216899 tp_is_empty!7837)))

(declare-fun b!353972 () Bool)

(assert (=> b!353972 (= e!216900 false)))

(declare-fun lt!165436 () Bool)

(declare-datatypes ((List!5261 0))(
  ( (Nil!5258) (Cons!5257 (h!6113 (_ BitVec 64)) (t!10402 List!5261)) )
))
(declare-fun arrayNoDuplicates!0 (array!19245 (_ BitVec 32) List!5261) Bool)

(assert (=> b!353972 (= lt!165436 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5258))))

(assert (= (and start!35370 res!196252) b!353970))

(assert (= (and b!353970 res!196251) b!353968))

(assert (= (and b!353968 res!196250) b!353972))

(assert (= (and b!353969 condMapEmpty!13263) mapIsEmpty!13263))

(assert (= (and b!353969 (not condMapEmpty!13263)) mapNonEmpty!13263))

(get-info :version)

(assert (= (and mapNonEmpty!13263 ((_ is ValueCellFull!3575) mapValue!13263)) b!353967))

(assert (= (and b!353969 ((_ is ValueCellFull!3575) mapDefault!13263)) b!353971))

(assert (= start!35370 b!353969))

(declare-fun m!352593 () Bool)

(assert (=> mapNonEmpty!13263 m!352593))

(declare-fun m!352595 () Bool)

(assert (=> b!353968 m!352595))

(declare-fun m!352597 () Bool)

(assert (=> start!35370 m!352597))

(declare-fun m!352599 () Bool)

(assert (=> start!35370 m!352599))

(declare-fun m!352601 () Bool)

(assert (=> start!35370 m!352601))

(declare-fun m!352603 () Bool)

(assert (=> b!353972 m!352603))

(check-sat (not mapNonEmpty!13263) (not b!353972) (not start!35370) (not b!353968) tp_is_empty!7837)
(check-sat)
