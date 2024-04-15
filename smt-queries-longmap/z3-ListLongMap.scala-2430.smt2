; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38336 () Bool)

(assert start!38336)

(declare-fun res!226627 () Bool)

(declare-fun e!239274 () Bool)

(assert (=> start!38336 (=> (not res!226627) (not e!239274))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23529 0))(
  ( (array!23530 (arr!11217 (Array (_ BitVec 32) (_ BitVec 64))) (size!11570 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23529)

(assert (=> start!38336 (= res!226627 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11570 _keys!709))))))

(assert (=> start!38336 e!239274))

(assert (=> start!38336 true))

(declare-datatypes ((V!14195 0))(
  ( (V!14196 (val!4953 Int)) )
))
(declare-datatypes ((ValueCell!4565 0))(
  ( (ValueCellFull!4565 (v!7193 V!14195)) (EmptyCell!4565) )
))
(declare-datatypes ((array!23531 0))(
  ( (array!23532 (arr!11218 (Array (_ BitVec 32) ValueCell!4565)) (size!11571 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23531)

(declare-fun e!239275 () Bool)

(declare-fun array_inv!8232 (array!23531) Bool)

(assert (=> start!38336 (and (array_inv!8232 _values!549) e!239275)))

(declare-fun array_inv!8233 (array!23529) Bool)

(assert (=> start!38336 (array_inv!8233 _keys!709)))

(declare-fun b!395246 () Bool)

(assert (=> b!395246 (= e!239274 false)))

(declare-fun lt!186853 () Bool)

(declare-datatypes ((List!6471 0))(
  ( (Nil!6468) (Cons!6467 (h!7323 (_ BitVec 64)) (t!11636 List!6471)) )
))
(declare-fun arrayNoDuplicates!0 (array!23529 (_ BitVec 32) List!6471) Bool)

(assert (=> b!395246 (= lt!186853 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6468))))

(declare-fun b!395247 () Bool)

(declare-fun res!226628 () Bool)

(assert (=> b!395247 (=> (not res!226628) (not e!239274))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23529 (_ BitVec 32)) Bool)

(assert (=> b!395247 (= res!226628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395248 () Bool)

(declare-fun e!239276 () Bool)

(declare-fun mapRes!16338 () Bool)

(assert (=> b!395248 (= e!239275 (and e!239276 mapRes!16338))))

(declare-fun condMapEmpty!16338 () Bool)

(declare-fun mapDefault!16338 () ValueCell!4565)

(assert (=> b!395248 (= condMapEmpty!16338 (= (arr!11218 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4565)) mapDefault!16338)))))

(declare-fun b!395249 () Bool)

(declare-fun res!226629 () Bool)

(assert (=> b!395249 (=> (not res!226629) (not e!239274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395249 (= res!226629 (validMask!0 mask!1025))))

(declare-fun b!395250 () Bool)

(declare-fun tp_is_empty!9817 () Bool)

(assert (=> b!395250 (= e!239276 tp_is_empty!9817)))

(declare-fun b!395251 () Bool)

(declare-fun e!239277 () Bool)

(assert (=> b!395251 (= e!239277 tp_is_empty!9817)))

(declare-fun b!395252 () Bool)

(declare-fun res!226630 () Bool)

(assert (=> b!395252 (=> (not res!226630) (not e!239274))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395252 (= res!226630 (and (= (size!11571 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11570 _keys!709) (size!11571 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16338 () Bool)

(declare-fun tp!32133 () Bool)

(assert (=> mapNonEmpty!16338 (= mapRes!16338 (and tp!32133 e!239277))))

(declare-fun mapValue!16338 () ValueCell!4565)

(declare-fun mapKey!16338 () (_ BitVec 32))

(declare-fun mapRest!16338 () (Array (_ BitVec 32) ValueCell!4565))

(assert (=> mapNonEmpty!16338 (= (arr!11218 _values!549) (store mapRest!16338 mapKey!16338 mapValue!16338))))

(declare-fun mapIsEmpty!16338 () Bool)

(assert (=> mapIsEmpty!16338 mapRes!16338))

(assert (= (and start!38336 res!226627) b!395249))

(assert (= (and b!395249 res!226629) b!395252))

(assert (= (and b!395252 res!226630) b!395247))

(assert (= (and b!395247 res!226628) b!395246))

(assert (= (and b!395248 condMapEmpty!16338) mapIsEmpty!16338))

(assert (= (and b!395248 (not condMapEmpty!16338)) mapNonEmpty!16338))

(get-info :version)

(assert (= (and mapNonEmpty!16338 ((_ is ValueCellFull!4565) mapValue!16338)) b!395251))

(assert (= (and b!395248 ((_ is ValueCellFull!4565) mapDefault!16338)) b!395250))

(assert (= start!38336 b!395248))

(declare-fun m!390807 () Bool)

(assert (=> b!395247 m!390807))

(declare-fun m!390809 () Bool)

(assert (=> start!38336 m!390809))

(declare-fun m!390811 () Bool)

(assert (=> start!38336 m!390811))

(declare-fun m!390813 () Bool)

(assert (=> b!395249 m!390813))

(declare-fun m!390815 () Bool)

(assert (=> b!395246 m!390815))

(declare-fun m!390817 () Bool)

(assert (=> mapNonEmpty!16338 m!390817))

(check-sat tp_is_empty!9817 (not b!395249) (not mapNonEmpty!16338) (not b!395247) (not b!395246) (not start!38336))
(check-sat)
