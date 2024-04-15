; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35790 () Bool)

(assert start!35790)

(declare-fun res!199743 () Bool)

(declare-fun e!220128 () Bool)

(assert (=> start!35790 (=> (not res!199743) (not e!220128))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35790 (= res!199743 (validMask!0 mask!1842))))

(assert (=> start!35790 e!220128))

(assert (=> start!35790 true))

(declare-datatypes ((V!11987 0))(
  ( (V!11988 (val!4173 Int)) )
))
(declare-datatypes ((ValueCell!3785 0))(
  ( (ValueCellFull!3785 (v!6361 V!11987)) (EmptyCell!3785) )
))
(declare-datatypes ((array!20043 0))(
  ( (array!20044 (arr!9515 (Array (_ BitVec 32) ValueCell!3785)) (size!9868 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20043)

(declare-fun e!220129 () Bool)

(declare-fun array_inv!7020 (array!20043) Bool)

(assert (=> start!35790 (and (array_inv!7020 _values!1208) e!220129)))

(declare-datatypes ((array!20045 0))(
  ( (array!20046 (arr!9516 (Array (_ BitVec 32) (_ BitVec 64))) (size!9869 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20045)

(declare-fun array_inv!7021 (array!20045) Bool)

(assert (=> start!35790 (array_inv!7021 _keys!1456)))

(declare-fun b!359349 () Bool)

(declare-fun e!220130 () Bool)

(declare-fun tp_is_empty!8257 () Bool)

(assert (=> b!359349 (= e!220130 tp_is_empty!8257)))

(declare-fun b!359350 () Bool)

(declare-fun e!220131 () Bool)

(declare-fun mapRes!13893 () Bool)

(assert (=> b!359350 (= e!220129 (and e!220131 mapRes!13893))))

(declare-fun condMapEmpty!13893 () Bool)

(declare-fun mapDefault!13893 () ValueCell!3785)

(assert (=> b!359350 (= condMapEmpty!13893 (= (arr!9515 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3785)) mapDefault!13893)))))

(declare-fun b!359351 () Bool)

(assert (=> b!359351 (= e!220128 false)))

(declare-fun lt!166138 () Bool)

(declare-datatypes ((List!5439 0))(
  ( (Nil!5436) (Cons!5435 (h!6291 (_ BitVec 64)) (t!10580 List!5439)) )
))
(declare-fun arrayNoDuplicates!0 (array!20045 (_ BitVec 32) List!5439) Bool)

(assert (=> b!359351 (= lt!166138 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5436))))

(declare-fun mapNonEmpty!13893 () Bool)

(declare-fun tp!27960 () Bool)

(assert (=> mapNonEmpty!13893 (= mapRes!13893 (and tp!27960 e!220130))))

(declare-fun mapKey!13893 () (_ BitVec 32))

(declare-fun mapRest!13893 () (Array (_ BitVec 32) ValueCell!3785))

(declare-fun mapValue!13893 () ValueCell!3785)

(assert (=> mapNonEmpty!13893 (= (arr!9515 _values!1208) (store mapRest!13893 mapKey!13893 mapValue!13893))))

(declare-fun b!359352 () Bool)

(assert (=> b!359352 (= e!220131 tp_is_empty!8257)))

(declare-fun b!359353 () Bool)

(declare-fun res!199744 () Bool)

(assert (=> b!359353 (=> (not res!199744) (not e!220128))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359353 (= res!199744 (and (= (size!9868 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9869 _keys!1456) (size!9868 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13893 () Bool)

(assert (=> mapIsEmpty!13893 mapRes!13893))

(declare-fun b!359354 () Bool)

(declare-fun res!199742 () Bool)

(assert (=> b!359354 (=> (not res!199742) (not e!220128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20045 (_ BitVec 32)) Bool)

(assert (=> b!359354 (= res!199742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35790 res!199743) b!359353))

(assert (= (and b!359353 res!199744) b!359354))

(assert (= (and b!359354 res!199742) b!359351))

(assert (= (and b!359350 condMapEmpty!13893) mapIsEmpty!13893))

(assert (= (and b!359350 (not condMapEmpty!13893)) mapNonEmpty!13893))

(get-info :version)

(assert (= (and mapNonEmpty!13893 ((_ is ValueCellFull!3785) mapValue!13893)) b!359349))

(assert (= (and b!359350 ((_ is ValueCellFull!3785) mapDefault!13893)) b!359352))

(assert (= start!35790 b!359350))

(declare-fun m!356337 () Bool)

(assert (=> start!35790 m!356337))

(declare-fun m!356339 () Bool)

(assert (=> start!35790 m!356339))

(declare-fun m!356341 () Bool)

(assert (=> start!35790 m!356341))

(declare-fun m!356343 () Bool)

(assert (=> b!359351 m!356343))

(declare-fun m!356345 () Bool)

(assert (=> mapNonEmpty!13893 m!356345))

(declare-fun m!356347 () Bool)

(assert (=> b!359354 m!356347))

(check-sat (not b!359351) (not b!359354) (not start!35790) (not mapNonEmpty!13893) tp_is_empty!8257)
(check-sat)
