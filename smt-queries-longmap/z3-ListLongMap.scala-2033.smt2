; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35368 () Bool)

(assert start!35368)

(declare-fun b!354098 () Bool)

(declare-fun e!216953 () Bool)

(declare-fun e!216954 () Bool)

(declare-fun mapRes!13239 () Bool)

(assert (=> b!354098 (= e!216953 (and e!216954 mapRes!13239))))

(declare-fun condMapEmpty!13239 () Bool)

(declare-datatypes ((V!11405 0))(
  ( (V!11406 (val!3955 Int)) )
))
(declare-datatypes ((ValueCell!3567 0))(
  ( (ValueCellFull!3567 (v!6149 V!11405)) (EmptyCell!3567) )
))
(declare-datatypes ((array!19231 0))(
  ( (array!19232 (arr!9109 (Array (_ BitVec 32) ValueCell!3567)) (size!9461 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19231)

(declare-fun mapDefault!13239 () ValueCell!3567)

(assert (=> b!354098 (= condMapEmpty!13239 (= (arr!9109 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3567)) mapDefault!13239)))))

(declare-fun res!196308 () Bool)

(declare-fun e!216955 () Bool)

(assert (=> start!35368 (=> (not res!196308) (not e!216955))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35368 (= res!196308 (validMask!0 mask!1842))))

(assert (=> start!35368 e!216955))

(assert (=> start!35368 true))

(declare-fun array_inv!6702 (array!19231) Bool)

(assert (=> start!35368 (and (array_inv!6702 _values!1208) e!216953)))

(declare-datatypes ((array!19233 0))(
  ( (array!19234 (arr!9110 (Array (_ BitVec 32) (_ BitVec 64))) (size!9462 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19233)

(declare-fun array_inv!6703 (array!19233) Bool)

(assert (=> start!35368 (array_inv!6703 _keys!1456)))

(declare-fun b!354099 () Bool)

(assert (=> b!354099 (= e!216955 false)))

(declare-fun lt!165647 () Bool)

(declare-datatypes ((List!5287 0))(
  ( (Nil!5284) (Cons!5283 (h!6139 (_ BitVec 64)) (t!10437 List!5287)) )
))
(declare-fun arrayNoDuplicates!0 (array!19233 (_ BitVec 32) List!5287) Bool)

(assert (=> b!354099 (= lt!165647 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5284))))

(declare-fun mapIsEmpty!13239 () Bool)

(assert (=> mapIsEmpty!13239 mapRes!13239))

(declare-fun mapNonEmpty!13239 () Bool)

(declare-fun tp!27135 () Bool)

(declare-fun e!216952 () Bool)

(assert (=> mapNonEmpty!13239 (= mapRes!13239 (and tp!27135 e!216952))))

(declare-fun mapValue!13239 () ValueCell!3567)

(declare-fun mapKey!13239 () (_ BitVec 32))

(declare-fun mapRest!13239 () (Array (_ BitVec 32) ValueCell!3567))

(assert (=> mapNonEmpty!13239 (= (arr!9109 _values!1208) (store mapRest!13239 mapKey!13239 mapValue!13239))))

(declare-fun b!354100 () Bool)

(declare-fun res!196309 () Bool)

(assert (=> b!354100 (=> (not res!196309) (not e!216955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19233 (_ BitVec 32)) Bool)

(assert (=> b!354100 (= res!196309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354101 () Bool)

(declare-fun tp_is_empty!7821 () Bool)

(assert (=> b!354101 (= e!216952 tp_is_empty!7821)))

(declare-fun b!354102 () Bool)

(declare-fun res!196307 () Bool)

(assert (=> b!354102 (=> (not res!196307) (not e!216955))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354102 (= res!196307 (and (= (size!9461 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9462 _keys!1456) (size!9461 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354103 () Bool)

(assert (=> b!354103 (= e!216954 tp_is_empty!7821)))

(assert (= (and start!35368 res!196308) b!354102))

(assert (= (and b!354102 res!196307) b!354100))

(assert (= (and b!354100 res!196309) b!354099))

(assert (= (and b!354098 condMapEmpty!13239) mapIsEmpty!13239))

(assert (= (and b!354098 (not condMapEmpty!13239)) mapNonEmpty!13239))

(get-info :version)

(assert (= (and mapNonEmpty!13239 ((_ is ValueCellFull!3567) mapValue!13239)) b!354101))

(assert (= (and b!354098 ((_ is ValueCellFull!3567) mapDefault!13239)) b!354103))

(assert (= start!35368 b!354098))

(declare-fun m!353227 () Bool)

(assert (=> start!35368 m!353227))

(declare-fun m!353229 () Bool)

(assert (=> start!35368 m!353229))

(declare-fun m!353231 () Bool)

(assert (=> start!35368 m!353231))

(declare-fun m!353233 () Bool)

(assert (=> b!354099 m!353233))

(declare-fun m!353235 () Bool)

(assert (=> mapNonEmpty!13239 m!353235))

(declare-fun m!353237 () Bool)

(assert (=> b!354100 m!353237))

(check-sat (not b!354099) (not mapNonEmpty!13239) (not start!35368) tp_is_empty!7821 (not b!354100))
(check-sat)
