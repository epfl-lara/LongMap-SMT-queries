; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40306 () Bool)

(assert start!40306)

(declare-fun mapIsEmpty!19203 () Bool)

(declare-fun mapRes!19203 () Bool)

(assert (=> mapIsEmpty!19203 mapRes!19203))

(declare-fun b!442529 () Bool)

(declare-fun res!262158 () Bool)

(declare-fun e!260429 () Bool)

(assert (=> b!442529 (=> (not res!262158) (not e!260429))))

(declare-datatypes ((array!27249 0))(
  ( (array!27250 (arr!13073 (Array (_ BitVec 32) (_ BitVec 64))) (size!13426 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27249)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16731 0))(
  ( (V!16732 (val!5904 Int)) )
))
(declare-datatypes ((ValueCell!5516 0))(
  ( (ValueCellFull!5516 (v!8149 V!16731)) (EmptyCell!5516) )
))
(declare-datatypes ((array!27251 0))(
  ( (array!27252 (arr!13074 (Array (_ BitVec 32) ValueCell!5516)) (size!13427 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27251)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442529 (= res!262158 (and (= (size!13427 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13426 _keys!709) (size!13427 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442530 () Bool)

(declare-fun res!262157 () Bool)

(assert (=> b!442530 (=> (not res!262157) (not e!260429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27249 (_ BitVec 32)) Bool)

(assert (=> b!442530 (= res!262157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19203 () Bool)

(declare-fun tp!37185 () Bool)

(declare-fun e!260431 () Bool)

(assert (=> mapNonEmpty!19203 (= mapRes!19203 (and tp!37185 e!260431))))

(declare-fun mapKey!19203 () (_ BitVec 32))

(declare-fun mapValue!19203 () ValueCell!5516)

(declare-fun mapRest!19203 () (Array (_ BitVec 32) ValueCell!5516))

(assert (=> mapNonEmpty!19203 (= (arr!13074 _values!549) (store mapRest!19203 mapKey!19203 mapValue!19203))))

(declare-fun b!442531 () Bool)

(declare-fun res!262162 () Bool)

(assert (=> b!442531 (=> (not res!262162) (not e!260429))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442531 (= res!262162 (validKeyInArray!0 k0!794))))

(declare-fun b!442532 () Bool)

(declare-fun e!260433 () Bool)

(declare-fun e!260434 () Bool)

(assert (=> b!442532 (= e!260433 (and e!260434 mapRes!19203))))

(declare-fun condMapEmpty!19203 () Bool)

(declare-fun mapDefault!19203 () ValueCell!5516)

(assert (=> b!442532 (= condMapEmpty!19203 (= (arr!13074 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5516)) mapDefault!19203)))))

(declare-fun b!442533 () Bool)

(declare-fun res!262166 () Bool)

(assert (=> b!442533 (=> (not res!262166) (not e!260429))))

(declare-fun arrayContainsKey!0 (array!27249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442533 (= res!262166 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442534 () Bool)

(declare-fun res!262159 () Bool)

(assert (=> b!442534 (=> (not res!262159) (not e!260429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442534 (= res!262159 (validMask!0 mask!1025))))

(declare-fun res!262161 () Bool)

(assert (=> start!40306 (=> (not res!262161) (not e!260429))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40306 (= res!262161 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13426 _keys!709))))))

(assert (=> start!40306 e!260429))

(assert (=> start!40306 true))

(declare-fun array_inv!9532 (array!27251) Bool)

(assert (=> start!40306 (and (array_inv!9532 _values!549) e!260433)))

(declare-fun array_inv!9533 (array!27249) Bool)

(assert (=> start!40306 (array_inv!9533 _keys!709)))

(declare-fun b!442535 () Bool)

(declare-fun res!262163 () Bool)

(assert (=> b!442535 (=> (not res!262163) (not e!260429))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442535 (= res!262163 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13426 _keys!709))))))

(declare-fun b!442536 () Bool)

(declare-fun tp_is_empty!11719 () Bool)

(assert (=> b!442536 (= e!260434 tp_is_empty!11719)))

(declare-fun b!442537 () Bool)

(declare-fun e!260430 () Bool)

(assert (=> b!442537 (= e!260429 e!260430)))

(declare-fun res!262160 () Bool)

(assert (=> b!442537 (=> (not res!262160) (not e!260430))))

(declare-fun lt!203012 () array!27249)

(assert (=> b!442537 (= res!262160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203012 mask!1025))))

(assert (=> b!442537 (= lt!203012 (array!27250 (store (arr!13073 _keys!709) i!563 k0!794) (size!13426 _keys!709)))))

(declare-fun b!442538 () Bool)

(declare-fun res!262164 () Bool)

(assert (=> b!442538 (=> (not res!262164) (not e!260429))))

(declare-datatypes ((List!7845 0))(
  ( (Nil!7842) (Cons!7841 (h!8697 (_ BitVec 64)) (t!13594 List!7845)) )
))
(declare-fun arrayNoDuplicates!0 (array!27249 (_ BitVec 32) List!7845) Bool)

(assert (=> b!442538 (= res!262164 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7842))))

(declare-fun b!442539 () Bool)

(assert (=> b!442539 (= e!260431 tp_is_empty!11719)))

(declare-fun b!442540 () Bool)

(declare-fun res!262165 () Bool)

(assert (=> b!442540 (=> (not res!262165) (not e!260429))))

(assert (=> b!442540 (= res!262165 (or (= (select (arr!13073 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13073 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442541 () Bool)

(assert (=> b!442541 (= e!260430 false)))

(declare-fun lt!203011 () Bool)

(assert (=> b!442541 (= lt!203011 (arrayNoDuplicates!0 lt!203012 #b00000000000000000000000000000000 Nil!7842))))

(assert (= (and start!40306 res!262161) b!442534))

(assert (= (and b!442534 res!262159) b!442529))

(assert (= (and b!442529 res!262158) b!442530))

(assert (= (and b!442530 res!262157) b!442538))

(assert (= (and b!442538 res!262164) b!442535))

(assert (= (and b!442535 res!262163) b!442531))

(assert (= (and b!442531 res!262162) b!442540))

(assert (= (and b!442540 res!262165) b!442533))

(assert (= (and b!442533 res!262166) b!442537))

(assert (= (and b!442537 res!262160) b!442541))

(assert (= (and b!442532 condMapEmpty!19203) mapIsEmpty!19203))

(assert (= (and b!442532 (not condMapEmpty!19203)) mapNonEmpty!19203))

(get-info :version)

(assert (= (and mapNonEmpty!19203 ((_ is ValueCellFull!5516) mapValue!19203)) b!442539))

(assert (= (and b!442532 ((_ is ValueCellFull!5516) mapDefault!19203)) b!442536))

(assert (= start!40306 b!442532))

(declare-fun m!428581 () Bool)

(assert (=> b!442533 m!428581))

(declare-fun m!428583 () Bool)

(assert (=> b!442534 m!428583))

(declare-fun m!428585 () Bool)

(assert (=> b!442538 m!428585))

(declare-fun m!428587 () Bool)

(assert (=> b!442530 m!428587))

(declare-fun m!428589 () Bool)

(assert (=> b!442540 m!428589))

(declare-fun m!428591 () Bool)

(assert (=> b!442541 m!428591))

(declare-fun m!428593 () Bool)

(assert (=> mapNonEmpty!19203 m!428593))

(declare-fun m!428595 () Bool)

(assert (=> start!40306 m!428595))

(declare-fun m!428597 () Bool)

(assert (=> start!40306 m!428597))

(declare-fun m!428599 () Bool)

(assert (=> b!442537 m!428599))

(declare-fun m!428601 () Bool)

(assert (=> b!442537 m!428601))

(declare-fun m!428603 () Bool)

(assert (=> b!442531 m!428603))

(check-sat (not b!442537) (not start!40306) (not b!442531) (not b!442530) tp_is_empty!11719 (not b!442541) (not b!442538) (not mapNonEmpty!19203) (not b!442534) (not b!442533))
(check-sat)
