; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40318 () Bool)

(assert start!40318)

(declare-fun b!442985 () Bool)

(declare-fun e!260683 () Bool)

(assert (=> b!442985 (= e!260683 false)))

(declare-fun lt!203300 () Bool)

(declare-datatypes ((array!27274 0))(
  ( (array!27275 (arr!13085 (Array (_ BitVec 32) (_ BitVec 64))) (size!13437 (_ BitVec 32))) )
))
(declare-fun lt!203301 () array!27274)

(declare-datatypes ((List!7753 0))(
  ( (Nil!7750) (Cons!7749 (h!8605 (_ BitVec 64)) (t!13503 List!7753)) )
))
(declare-fun arrayNoDuplicates!0 (array!27274 (_ BitVec 32) List!7753) Bool)

(assert (=> b!442985 (= lt!203300 (arrayNoDuplicates!0 lt!203301 #b00000000000000000000000000000000 Nil!7750))))

(declare-fun b!442986 () Bool)

(declare-fun e!260681 () Bool)

(declare-fun e!260684 () Bool)

(declare-fun mapRes!19221 () Bool)

(assert (=> b!442986 (= e!260681 (and e!260684 mapRes!19221))))

(declare-fun condMapEmpty!19221 () Bool)

(declare-datatypes ((V!16747 0))(
  ( (V!16748 (val!5910 Int)) )
))
(declare-datatypes ((ValueCell!5522 0))(
  ( (ValueCellFull!5522 (v!8162 V!16747)) (EmptyCell!5522) )
))
(declare-datatypes ((array!27276 0))(
  ( (array!27277 (arr!13086 (Array (_ BitVec 32) ValueCell!5522)) (size!13438 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27276)

(declare-fun mapDefault!19221 () ValueCell!5522)

(assert (=> b!442986 (= condMapEmpty!19221 (= (arr!13086 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5522)) mapDefault!19221)))))

(declare-fun b!442987 () Bool)

(declare-fun res!262466 () Bool)

(declare-fun e!260682 () Bool)

(assert (=> b!442987 (=> (not res!262466) (not e!260682))))

(declare-fun _keys!709 () array!27274)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442987 (= res!262466 (and (= (size!13438 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13437 _keys!709) (size!13438 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442988 () Bool)

(declare-fun tp_is_empty!11731 () Bool)

(assert (=> b!442988 (= e!260684 tp_is_empty!11731)))

(declare-fun b!442989 () Bool)

(declare-fun res!262467 () Bool)

(assert (=> b!442989 (=> (not res!262467) (not e!260682))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442989 (= res!262467 (validKeyInArray!0 k0!794))))

(declare-fun b!442990 () Bool)

(declare-fun e!260680 () Bool)

(assert (=> b!442990 (= e!260680 tp_is_empty!11731)))

(declare-fun res!262472 () Bool)

(assert (=> start!40318 (=> (not res!262472) (not e!260682))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40318 (= res!262472 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13437 _keys!709))))))

(assert (=> start!40318 e!260682))

(assert (=> start!40318 true))

(declare-fun array_inv!9560 (array!27276) Bool)

(assert (=> start!40318 (and (array_inv!9560 _values!549) e!260681)))

(declare-fun array_inv!9561 (array!27274) Bool)

(assert (=> start!40318 (array_inv!9561 _keys!709)))

(declare-fun b!442991 () Bool)

(declare-fun res!262464 () Bool)

(assert (=> b!442991 (=> (not res!262464) (not e!260682))))

(declare-fun arrayContainsKey!0 (array!27274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442991 (= res!262464 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442992 () Bool)

(declare-fun res!262471 () Bool)

(assert (=> b!442992 (=> (not res!262471) (not e!260682))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442992 (= res!262471 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13437 _keys!709))))))

(declare-fun b!442993 () Bool)

(declare-fun res!262470 () Bool)

(assert (=> b!442993 (=> (not res!262470) (not e!260682))))

(assert (=> b!442993 (= res!262470 (or (= (select (arr!13085 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13085 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442994 () Bool)

(declare-fun res!262465 () Bool)

(assert (=> b!442994 (=> (not res!262465) (not e!260682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442994 (= res!262465 (validMask!0 mask!1025))))

(declare-fun b!442995 () Bool)

(declare-fun res!262463 () Bool)

(assert (=> b!442995 (=> (not res!262463) (not e!260682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27274 (_ BitVec 32)) Bool)

(assert (=> b!442995 (= res!262463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442996 () Bool)

(assert (=> b!442996 (= e!260682 e!260683)))

(declare-fun res!262469 () Bool)

(assert (=> b!442996 (=> (not res!262469) (not e!260683))))

(assert (=> b!442996 (= res!262469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203301 mask!1025))))

(assert (=> b!442996 (= lt!203301 (array!27275 (store (arr!13085 _keys!709) i!563 k0!794) (size!13437 _keys!709)))))

(declare-fun mapNonEmpty!19221 () Bool)

(declare-fun tp!37203 () Bool)

(assert (=> mapNonEmpty!19221 (= mapRes!19221 (and tp!37203 e!260680))))

(declare-fun mapValue!19221 () ValueCell!5522)

(declare-fun mapRest!19221 () (Array (_ BitVec 32) ValueCell!5522))

(declare-fun mapKey!19221 () (_ BitVec 32))

(assert (=> mapNonEmpty!19221 (= (arr!13086 _values!549) (store mapRest!19221 mapKey!19221 mapValue!19221))))

(declare-fun b!442997 () Bool)

(declare-fun res!262468 () Bool)

(assert (=> b!442997 (=> (not res!262468) (not e!260682))))

(assert (=> b!442997 (= res!262468 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7750))))

(declare-fun mapIsEmpty!19221 () Bool)

(assert (=> mapIsEmpty!19221 mapRes!19221))

(assert (= (and start!40318 res!262472) b!442994))

(assert (= (and b!442994 res!262465) b!442987))

(assert (= (and b!442987 res!262466) b!442995))

(assert (= (and b!442995 res!262463) b!442997))

(assert (= (and b!442997 res!262468) b!442992))

(assert (= (and b!442992 res!262471) b!442989))

(assert (= (and b!442989 res!262467) b!442993))

(assert (= (and b!442993 res!262470) b!442991))

(assert (= (and b!442991 res!262464) b!442996))

(assert (= (and b!442996 res!262469) b!442985))

(assert (= (and b!442986 condMapEmpty!19221) mapIsEmpty!19221))

(assert (= (and b!442986 (not condMapEmpty!19221)) mapNonEmpty!19221))

(get-info :version)

(assert (= (and mapNonEmpty!19221 ((_ is ValueCellFull!5522) mapValue!19221)) b!442990))

(assert (= (and b!442986 ((_ is ValueCellFull!5522) mapDefault!19221)) b!442988))

(assert (= start!40318 b!442986))

(declare-fun m!429675 () Bool)

(assert (=> b!442993 m!429675))

(declare-fun m!429677 () Bool)

(assert (=> b!442989 m!429677))

(declare-fun m!429679 () Bool)

(assert (=> start!40318 m!429679))

(declare-fun m!429681 () Bool)

(assert (=> start!40318 m!429681))

(declare-fun m!429683 () Bool)

(assert (=> b!442985 m!429683))

(declare-fun m!429685 () Bool)

(assert (=> b!442997 m!429685))

(declare-fun m!429687 () Bool)

(assert (=> mapNonEmpty!19221 m!429687))

(declare-fun m!429689 () Bool)

(assert (=> b!442994 m!429689))

(declare-fun m!429691 () Bool)

(assert (=> b!442996 m!429691))

(declare-fun m!429693 () Bool)

(assert (=> b!442996 m!429693))

(declare-fun m!429695 () Bool)

(assert (=> b!442991 m!429695))

(declare-fun m!429697 () Bool)

(assert (=> b!442995 m!429697))

(check-sat (not b!442989) (not b!442995) (not mapNonEmpty!19221) (not start!40318) (not b!442991) (not b!442985) (not b!442994) tp_is_empty!11731 (not b!442996) (not b!442997))
(check-sat)
