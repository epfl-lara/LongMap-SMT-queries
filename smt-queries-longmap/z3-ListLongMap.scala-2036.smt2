; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35370 () Bool)

(assert start!35370)

(declare-fun b!354189 () Bool)

(declare-fun res!196378 () Bool)

(declare-fun e!217040 () Bool)

(assert (=> b!354189 (=> (not res!196378) (not e!217040))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19252 0))(
  ( (array!19253 (arr!9119 (Array (_ BitVec 32) (_ BitVec 64))) (size!9471 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19252)

(declare-datatypes ((V!11427 0))(
  ( (V!11428 (val!3963 Int)) )
))
(declare-datatypes ((ValueCell!3575 0))(
  ( (ValueCellFull!3575 (v!6158 V!11427)) (EmptyCell!3575) )
))
(declare-datatypes ((array!19254 0))(
  ( (array!19255 (arr!9120 (Array (_ BitVec 32) ValueCell!3575)) (size!9472 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19254)

(assert (=> b!354189 (= res!196378 (and (= (size!9472 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9471 _keys!1456) (size!9472 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354190 () Bool)

(declare-fun e!217041 () Bool)

(declare-fun tp_is_empty!7837 () Bool)

(assert (=> b!354190 (= e!217041 tp_is_empty!7837)))

(declare-fun b!354191 () Bool)

(declare-fun e!217039 () Bool)

(declare-fun mapRes!13263 () Bool)

(assert (=> b!354191 (= e!217039 (and e!217041 mapRes!13263))))

(declare-fun condMapEmpty!13263 () Bool)

(declare-fun mapDefault!13263 () ValueCell!3575)

(assert (=> b!354191 (= condMapEmpty!13263 (= (arr!9120 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3575)) mapDefault!13263)))))

(declare-fun b!354192 () Bool)

(declare-fun res!196377 () Bool)

(assert (=> b!354192 (=> (not res!196377) (not e!217040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19252 (_ BitVec 32)) Bool)

(assert (=> b!354192 (= res!196377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196376 () Bool)

(assert (=> start!35370 (=> (not res!196376) (not e!217040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35370 (= res!196376 (validMask!0 mask!1842))))

(assert (=> start!35370 e!217040))

(assert (=> start!35370 true))

(declare-fun array_inv!6736 (array!19254) Bool)

(assert (=> start!35370 (and (array_inv!6736 _values!1208) e!217039)))

(declare-fun array_inv!6737 (array!19252) Bool)

(assert (=> start!35370 (array_inv!6737 _keys!1456)))

(declare-fun mapIsEmpty!13263 () Bool)

(assert (=> mapIsEmpty!13263 mapRes!13263))

(declare-fun mapNonEmpty!13263 () Bool)

(declare-fun tp!27159 () Bool)

(declare-fun e!217038 () Bool)

(assert (=> mapNonEmpty!13263 (= mapRes!13263 (and tp!27159 e!217038))))

(declare-fun mapKey!13263 () (_ BitVec 32))

(declare-fun mapRest!13263 () (Array (_ BitVec 32) ValueCell!3575))

(declare-fun mapValue!13263 () ValueCell!3575)

(assert (=> mapNonEmpty!13263 (= (arr!9120 _values!1208) (store mapRest!13263 mapKey!13263 mapValue!13263))))

(declare-fun b!354193 () Bool)

(assert (=> b!354193 (= e!217038 tp_is_empty!7837)))

(declare-fun b!354194 () Bool)

(assert (=> b!354194 (= e!217040 false)))

(declare-fun lt!165689 () Bool)

(declare-datatypes ((List!5197 0))(
  ( (Nil!5194) (Cons!5193 (h!6049 (_ BitVec 64)) (t!10339 List!5197)) )
))
(declare-fun arrayNoDuplicates!0 (array!19252 (_ BitVec 32) List!5197) Bool)

(assert (=> b!354194 (= lt!165689 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5194))))

(assert (= (and start!35370 res!196376) b!354189))

(assert (= (and b!354189 res!196378) b!354192))

(assert (= (and b!354192 res!196377) b!354194))

(assert (= (and b!354191 condMapEmpty!13263) mapIsEmpty!13263))

(assert (= (and b!354191 (not condMapEmpty!13263)) mapNonEmpty!13263))

(get-info :version)

(assert (= (and mapNonEmpty!13263 ((_ is ValueCellFull!3575) mapValue!13263)) b!354193))

(assert (= (and b!354191 ((_ is ValueCellFull!3575) mapDefault!13263)) b!354190))

(assert (= start!35370 b!354191))

(declare-fun m!353547 () Bool)

(assert (=> b!354192 m!353547))

(declare-fun m!353549 () Bool)

(assert (=> start!35370 m!353549))

(declare-fun m!353551 () Bool)

(assert (=> start!35370 m!353551))

(declare-fun m!353553 () Bool)

(assert (=> start!35370 m!353553))

(declare-fun m!353555 () Bool)

(assert (=> mapNonEmpty!13263 m!353555))

(declare-fun m!353557 () Bool)

(assert (=> b!354194 m!353557))

(check-sat (not b!354192) (not mapNonEmpty!13263) tp_is_empty!7837 (not start!35370) (not b!354194))
(check-sat)
