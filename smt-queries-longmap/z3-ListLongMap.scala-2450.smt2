; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38504 () Bool)

(assert start!38504)

(declare-fun mapNonEmpty!16527 () Bool)

(declare-fun mapRes!16527 () Bool)

(declare-fun tp!32322 () Bool)

(declare-fun e!240582 () Bool)

(assert (=> mapNonEmpty!16527 (= mapRes!16527 (and tp!32322 e!240582))))

(declare-datatypes ((V!14355 0))(
  ( (V!14356 (val!5013 Int)) )
))
(declare-datatypes ((ValueCell!4625 0))(
  ( (ValueCellFull!4625 (v!7261 V!14355)) (EmptyCell!4625) )
))
(declare-fun mapValue!16527 () ValueCell!4625)

(declare-datatypes ((array!23766 0))(
  ( (array!23767 (arr!11332 (Array (_ BitVec 32) ValueCell!4625)) (size!11684 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23766)

(declare-fun mapKey!16527 () (_ BitVec 32))

(declare-fun mapRest!16527 () (Array (_ BitVec 32) ValueCell!4625))

(assert (=> mapNonEmpty!16527 (= (arr!11332 _values!549) (store mapRest!16527 mapKey!16527 mapValue!16527))))

(declare-fun b!397948 () Bool)

(declare-fun e!240585 () Bool)

(assert (=> b!397948 (= e!240585 false)))

(declare-fun lt!187409 () Bool)

(declare-datatypes ((array!23768 0))(
  ( (array!23769 (arr!11333 (Array (_ BitVec 32) (_ BitVec 64))) (size!11685 (_ BitVec 32))) )
))
(declare-fun lt!187410 () array!23768)

(declare-datatypes ((List!6421 0))(
  ( (Nil!6418) (Cons!6417 (h!7273 (_ BitVec 64)) (t!11587 List!6421)) )
))
(declare-fun arrayNoDuplicates!0 (array!23768 (_ BitVec 32) List!6421) Bool)

(assert (=> b!397948 (= lt!187409 (arrayNoDuplicates!0 lt!187410 #b00000000000000000000000000000000 Nil!6418))))

(declare-fun mapIsEmpty!16527 () Bool)

(assert (=> mapIsEmpty!16527 mapRes!16527))

(declare-fun b!397949 () Bool)

(declare-fun res!228627 () Bool)

(declare-fun e!240586 () Bool)

(assert (=> b!397949 (=> (not res!228627) (not e!240586))))

(declare-fun _keys!709 () array!23768)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397949 (= res!228627 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397951 () Bool)

(assert (=> b!397951 (= e!240586 e!240585)))

(declare-fun res!228635 () Bool)

(assert (=> b!397951 (=> (not res!228635) (not e!240585))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23768 (_ BitVec 32)) Bool)

(assert (=> b!397951 (= res!228635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187410 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397951 (= lt!187410 (array!23769 (store (arr!11333 _keys!709) i!563 k0!794) (size!11685 _keys!709)))))

(declare-fun b!397952 () Bool)

(declare-fun res!228628 () Bool)

(assert (=> b!397952 (=> (not res!228628) (not e!240586))))

(assert (=> b!397952 (= res!228628 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11685 _keys!709))))))

(declare-fun b!397953 () Bool)

(declare-fun res!228630 () Bool)

(assert (=> b!397953 (=> (not res!228630) (not e!240586))))

(assert (=> b!397953 (= res!228630 (or (= (select (arr!11333 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11333 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397954 () Bool)

(declare-fun tp_is_empty!9937 () Bool)

(assert (=> b!397954 (= e!240582 tp_is_empty!9937)))

(declare-fun b!397955 () Bool)

(declare-fun res!228636 () Bool)

(assert (=> b!397955 (=> (not res!228636) (not e!240586))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397955 (= res!228636 (and (= (size!11684 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11685 _keys!709) (size!11684 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397956 () Bool)

(declare-fun res!228631 () Bool)

(assert (=> b!397956 (=> (not res!228631) (not e!240586))))

(assert (=> b!397956 (= res!228631 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6418))))

(declare-fun b!397957 () Bool)

(declare-fun res!228629 () Bool)

(assert (=> b!397957 (=> (not res!228629) (not e!240586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397957 (= res!228629 (validKeyInArray!0 k0!794))))

(declare-fun b!397958 () Bool)

(declare-fun res!228632 () Bool)

(assert (=> b!397958 (=> (not res!228632) (not e!240586))))

(assert (=> b!397958 (= res!228632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397959 () Bool)

(declare-fun e!240581 () Bool)

(assert (=> b!397959 (= e!240581 tp_is_empty!9937)))

(declare-fun b!397960 () Bool)

(declare-fun res!228633 () Bool)

(assert (=> b!397960 (=> (not res!228633) (not e!240586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397960 (= res!228633 (validMask!0 mask!1025))))

(declare-fun res!228634 () Bool)

(assert (=> start!38504 (=> (not res!228634) (not e!240586))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38504 (= res!228634 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11685 _keys!709))))))

(assert (=> start!38504 e!240586))

(assert (=> start!38504 true))

(declare-fun e!240583 () Bool)

(declare-fun array_inv!8372 (array!23766) Bool)

(assert (=> start!38504 (and (array_inv!8372 _values!549) e!240583)))

(declare-fun array_inv!8373 (array!23768) Bool)

(assert (=> start!38504 (array_inv!8373 _keys!709)))

(declare-fun b!397950 () Bool)

(assert (=> b!397950 (= e!240583 (and e!240581 mapRes!16527))))

(declare-fun condMapEmpty!16527 () Bool)

(declare-fun mapDefault!16527 () ValueCell!4625)

(assert (=> b!397950 (= condMapEmpty!16527 (= (arr!11332 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4625)) mapDefault!16527)))))

(assert (= (and start!38504 res!228634) b!397960))

(assert (= (and b!397960 res!228633) b!397955))

(assert (= (and b!397955 res!228636) b!397958))

(assert (= (and b!397958 res!228632) b!397956))

(assert (= (and b!397956 res!228631) b!397952))

(assert (= (and b!397952 res!228628) b!397957))

(assert (= (and b!397957 res!228629) b!397953))

(assert (= (and b!397953 res!228630) b!397949))

(assert (= (and b!397949 res!228627) b!397951))

(assert (= (and b!397951 res!228635) b!397948))

(assert (= (and b!397950 condMapEmpty!16527) mapIsEmpty!16527))

(assert (= (and b!397950 (not condMapEmpty!16527)) mapNonEmpty!16527))

(get-info :version)

(assert (= (and mapNonEmpty!16527 ((_ is ValueCellFull!4625) mapValue!16527)) b!397954))

(assert (= (and b!397950 ((_ is ValueCellFull!4625) mapDefault!16527)) b!397959))

(assert (= start!38504 b!397950))

(declare-fun m!393261 () Bool)

(assert (=> start!38504 m!393261))

(declare-fun m!393263 () Bool)

(assert (=> start!38504 m!393263))

(declare-fun m!393265 () Bool)

(assert (=> mapNonEmpty!16527 m!393265))

(declare-fun m!393267 () Bool)

(assert (=> b!397953 m!393267))

(declare-fun m!393269 () Bool)

(assert (=> b!397948 m!393269))

(declare-fun m!393271 () Bool)

(assert (=> b!397949 m!393271))

(declare-fun m!393273 () Bool)

(assert (=> b!397960 m!393273))

(declare-fun m!393275 () Bool)

(assert (=> b!397951 m!393275))

(declare-fun m!393277 () Bool)

(assert (=> b!397951 m!393277))

(declare-fun m!393279 () Bool)

(assert (=> b!397956 m!393279))

(declare-fun m!393281 () Bool)

(assert (=> b!397957 m!393281))

(declare-fun m!393283 () Bool)

(assert (=> b!397958 m!393283))

(check-sat (not b!397957) (not mapNonEmpty!16527) (not b!397951) (not b!397948) (not b!397949) tp_is_empty!9937 (not b!397956) (not b!397960) (not b!397958) (not start!38504))
(check-sat)
