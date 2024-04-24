; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38846 () Bool)

(assert start!38846)

(declare-fun b!405913 () Bool)

(declare-fun res!234410 () Bool)

(declare-fun e!243986 () Bool)

(assert (=> b!405913 (=> (not res!234410) (not e!243986))))

(declare-datatypes ((array!24436 0))(
  ( (array!24437 (arr!11667 (Array (_ BitVec 32) (_ BitVec 64))) (size!12019 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24436)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405913 (= res!234410 (or (= (select (arr!11667 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11667 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405914 () Bool)

(declare-fun res!234409 () Bool)

(assert (=> b!405914 (=> (not res!234409) (not e!243986))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24436 (_ BitVec 32)) Bool)

(assert (=> b!405914 (= res!234409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17040 () Bool)

(declare-fun mapRes!17040 () Bool)

(declare-fun tp!33159 () Bool)

(declare-fun e!243984 () Bool)

(assert (=> mapNonEmpty!17040 (= mapRes!17040 (and tp!33159 e!243984))))

(declare-datatypes ((V!14811 0))(
  ( (V!14812 (val!5184 Int)) )
))
(declare-datatypes ((ValueCell!4796 0))(
  ( (ValueCellFull!4796 (v!7432 V!14811)) (EmptyCell!4796) )
))
(declare-fun mapValue!17040 () ValueCell!4796)

(declare-fun mapRest!17040 () (Array (_ BitVec 32) ValueCell!4796))

(declare-fun mapKey!17040 () (_ BitVec 32))

(declare-datatypes ((array!24438 0))(
  ( (array!24439 (arr!11668 (Array (_ BitVec 32) ValueCell!4796)) (size!12020 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24438)

(assert (=> mapNonEmpty!17040 (= (arr!11668 _values!549) (store mapRest!17040 mapKey!17040 mapValue!17040))))

(declare-fun b!405915 () Bool)

(declare-fun e!243987 () Bool)

(assert (=> b!405915 (= e!243986 e!243987)))

(declare-fun res!234413 () Bool)

(assert (=> b!405915 (=> (not res!234413) (not e!243987))))

(declare-fun lt!188435 () array!24436)

(assert (=> b!405915 (= res!234413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188435 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!405915 (= lt!188435 (array!24437 (store (arr!11667 _keys!709) i!563 k0!794) (size!12019 _keys!709)))))

(declare-fun b!405916 () Bool)

(declare-fun res!234406 () Bool)

(assert (=> b!405916 (=> (not res!234406) (not e!243986))))

(declare-datatypes ((List!6658 0))(
  ( (Nil!6655) (Cons!6654 (h!7510 (_ BitVec 64)) (t!11824 List!6658)) )
))
(declare-fun arrayNoDuplicates!0 (array!24436 (_ BitVec 32) List!6658) Bool)

(assert (=> b!405916 (= res!234406 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6655))))

(declare-fun b!405917 () Bool)

(declare-fun res!234407 () Bool)

(assert (=> b!405917 (=> (not res!234407) (not e!243986))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405917 (= res!234407 (and (= (size!12020 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12019 _keys!709) (size!12020 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405919 () Bool)

(declare-fun res!234408 () Bool)

(assert (=> b!405919 (=> (not res!234408) (not e!243986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405919 (= res!234408 (validKeyInArray!0 k0!794))))

(declare-fun b!405920 () Bool)

(declare-fun e!243988 () Bool)

(declare-fun tp_is_empty!10279 () Bool)

(assert (=> b!405920 (= e!243988 tp_is_empty!10279)))

(declare-fun b!405921 () Bool)

(declare-fun e!243983 () Bool)

(assert (=> b!405921 (= e!243983 (and e!243988 mapRes!17040))))

(declare-fun condMapEmpty!17040 () Bool)

(declare-fun mapDefault!17040 () ValueCell!4796)

(assert (=> b!405921 (= condMapEmpty!17040 (= (arr!11668 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4796)) mapDefault!17040)))))

(declare-fun b!405922 () Bool)

(declare-fun res!234412 () Bool)

(assert (=> b!405922 (=> (not res!234412) (not e!243986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405922 (= res!234412 (validMask!0 mask!1025))))

(declare-fun b!405923 () Bool)

(declare-fun res!234411 () Bool)

(assert (=> b!405923 (=> (not res!234411) (not e!243986))))

(declare-fun arrayContainsKey!0 (array!24436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405923 (= res!234411 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405924 () Bool)

(assert (=> b!405924 (= e!243984 tp_is_empty!10279)))

(declare-fun mapIsEmpty!17040 () Bool)

(assert (=> mapIsEmpty!17040 mapRes!17040))

(declare-fun b!405925 () Bool)

(declare-fun res!234414 () Bool)

(assert (=> b!405925 (=> (not res!234414) (not e!243986))))

(assert (=> b!405925 (= res!234414 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12019 _keys!709))))))

(declare-fun b!405918 () Bool)

(assert (=> b!405918 (= e!243987 false)))

(declare-fun lt!188436 () Bool)

(assert (=> b!405918 (= lt!188436 (arrayNoDuplicates!0 lt!188435 #b00000000000000000000000000000000 Nil!6655))))

(declare-fun res!234405 () Bool)

(assert (=> start!38846 (=> (not res!234405) (not e!243986))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38846 (= res!234405 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12019 _keys!709))))))

(assert (=> start!38846 e!243986))

(assert (=> start!38846 true))

(declare-fun array_inv!8616 (array!24438) Bool)

(assert (=> start!38846 (and (array_inv!8616 _values!549) e!243983)))

(declare-fun array_inv!8617 (array!24436) Bool)

(assert (=> start!38846 (array_inv!8617 _keys!709)))

(assert (= (and start!38846 res!234405) b!405922))

(assert (= (and b!405922 res!234412) b!405917))

(assert (= (and b!405917 res!234407) b!405914))

(assert (= (and b!405914 res!234409) b!405916))

(assert (= (and b!405916 res!234406) b!405925))

(assert (= (and b!405925 res!234414) b!405919))

(assert (= (and b!405919 res!234408) b!405913))

(assert (= (and b!405913 res!234410) b!405923))

(assert (= (and b!405923 res!234411) b!405915))

(assert (= (and b!405915 res!234413) b!405918))

(assert (= (and b!405921 condMapEmpty!17040) mapIsEmpty!17040))

(assert (= (and b!405921 (not condMapEmpty!17040)) mapNonEmpty!17040))

(get-info :version)

(assert (= (and mapNonEmpty!17040 ((_ is ValueCellFull!4796) mapValue!17040)) b!405924))

(assert (= (and b!405921 ((_ is ValueCellFull!4796) mapDefault!17040)) b!405920))

(assert (= start!38846 b!405921))

(declare-fun m!398445 () Bool)

(assert (=> b!405916 m!398445))

(declare-fun m!398447 () Bool)

(assert (=> b!405914 m!398447))

(declare-fun m!398449 () Bool)

(assert (=> b!405913 m!398449))

(declare-fun m!398451 () Bool)

(assert (=> b!405922 m!398451))

(declare-fun m!398453 () Bool)

(assert (=> b!405919 m!398453))

(declare-fun m!398455 () Bool)

(assert (=> b!405918 m!398455))

(declare-fun m!398457 () Bool)

(assert (=> start!38846 m!398457))

(declare-fun m!398459 () Bool)

(assert (=> start!38846 m!398459))

(declare-fun m!398461 () Bool)

(assert (=> b!405915 m!398461))

(declare-fun m!398463 () Bool)

(assert (=> b!405915 m!398463))

(declare-fun m!398465 () Bool)

(assert (=> mapNonEmpty!17040 m!398465))

(declare-fun m!398467 () Bool)

(assert (=> b!405923 m!398467))

(check-sat (not b!405915) (not b!405916) (not b!405914) (not start!38846) tp_is_empty!10279 (not mapNonEmpty!17040) (not b!405923) (not b!405922) (not b!405919) (not b!405918))
(check-sat)
