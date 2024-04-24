; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35364 () Bool)

(assert start!35364)

(declare-fun b!354135 () Bool)

(declare-fun res!196350 () Bool)

(declare-fun e!216993 () Bool)

(assert (=> b!354135 (=> (not res!196350) (not e!216993))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19240 0))(
  ( (array!19241 (arr!9113 (Array (_ BitVec 32) (_ BitVec 64))) (size!9465 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19240)

(declare-datatypes ((V!11419 0))(
  ( (V!11420 (val!3960 Int)) )
))
(declare-datatypes ((ValueCell!3572 0))(
  ( (ValueCellFull!3572 (v!6155 V!11419)) (EmptyCell!3572) )
))
(declare-datatypes ((array!19242 0))(
  ( (array!19243 (arr!9114 (Array (_ BitVec 32) ValueCell!3572)) (size!9466 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19242)

(assert (=> b!354135 (= res!196350 (and (= (size!9466 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9465 _keys!1456) (size!9466 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13254 () Bool)

(declare-fun mapRes!13254 () Bool)

(declare-fun tp!27150 () Bool)

(declare-fun e!216994 () Bool)

(assert (=> mapNonEmpty!13254 (= mapRes!13254 (and tp!27150 e!216994))))

(declare-fun mapRest!13254 () (Array (_ BitVec 32) ValueCell!3572))

(declare-fun mapValue!13254 () ValueCell!3572)

(declare-fun mapKey!13254 () (_ BitVec 32))

(assert (=> mapNonEmpty!13254 (= (arr!9114 _values!1208) (store mapRest!13254 mapKey!13254 mapValue!13254))))

(declare-fun b!354136 () Bool)

(assert (=> b!354136 (= e!216993 false)))

(declare-fun lt!165680 () Bool)

(declare-datatypes ((List!5196 0))(
  ( (Nil!5193) (Cons!5192 (h!6048 (_ BitVec 64)) (t!10338 List!5196)) )
))
(declare-fun arrayNoDuplicates!0 (array!19240 (_ BitVec 32) List!5196) Bool)

(assert (=> b!354136 (= lt!165680 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5193))))

(declare-fun b!354137 () Bool)

(declare-fun tp_is_empty!7831 () Bool)

(assert (=> b!354137 (= e!216994 tp_is_empty!7831)))

(declare-fun res!196349 () Bool)

(assert (=> start!35364 (=> (not res!196349) (not e!216993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35364 (= res!196349 (validMask!0 mask!1842))))

(assert (=> start!35364 e!216993))

(assert (=> start!35364 true))

(declare-fun e!216995 () Bool)

(declare-fun array_inv!6730 (array!19242) Bool)

(assert (=> start!35364 (and (array_inv!6730 _values!1208) e!216995)))

(declare-fun array_inv!6731 (array!19240) Bool)

(assert (=> start!35364 (array_inv!6731 _keys!1456)))

(declare-fun mapIsEmpty!13254 () Bool)

(assert (=> mapIsEmpty!13254 mapRes!13254))

(declare-fun b!354138 () Bool)

(declare-fun e!216996 () Bool)

(assert (=> b!354138 (= e!216996 tp_is_empty!7831)))

(declare-fun b!354139 () Bool)

(declare-fun res!196351 () Bool)

(assert (=> b!354139 (=> (not res!196351) (not e!216993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19240 (_ BitVec 32)) Bool)

(assert (=> b!354139 (= res!196351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354140 () Bool)

(assert (=> b!354140 (= e!216995 (and e!216996 mapRes!13254))))

(declare-fun condMapEmpty!13254 () Bool)

(declare-fun mapDefault!13254 () ValueCell!3572)

(assert (=> b!354140 (= condMapEmpty!13254 (= (arr!9114 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3572)) mapDefault!13254)))))

(assert (= (and start!35364 res!196349) b!354135))

(assert (= (and b!354135 res!196350) b!354139))

(assert (= (and b!354139 res!196351) b!354136))

(assert (= (and b!354140 condMapEmpty!13254) mapIsEmpty!13254))

(assert (= (and b!354140 (not condMapEmpty!13254)) mapNonEmpty!13254))

(get-info :version)

(assert (= (and mapNonEmpty!13254 ((_ is ValueCellFull!3572) mapValue!13254)) b!354137))

(assert (= (and b!354140 ((_ is ValueCellFull!3572) mapDefault!13254)) b!354138))

(assert (= start!35364 b!354140))

(declare-fun m!353511 () Bool)

(assert (=> mapNonEmpty!13254 m!353511))

(declare-fun m!353513 () Bool)

(assert (=> b!354136 m!353513))

(declare-fun m!353515 () Bool)

(assert (=> start!35364 m!353515))

(declare-fun m!353517 () Bool)

(assert (=> start!35364 m!353517))

(declare-fun m!353519 () Bool)

(assert (=> start!35364 m!353519))

(declare-fun m!353521 () Bool)

(assert (=> b!354139 m!353521))

(check-sat tp_is_empty!7831 (not mapNonEmpty!13254) (not b!354139) (not start!35364) (not b!354136))
(check-sat)
