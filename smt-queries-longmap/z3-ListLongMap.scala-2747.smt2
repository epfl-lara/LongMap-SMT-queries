; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40322 () Bool)

(assert start!40322)

(declare-fun b!442839 () Bool)

(declare-fun e!260622 () Bool)

(declare-fun tp_is_empty!11721 () Bool)

(assert (=> b!442839 (= e!260622 tp_is_empty!11721)))

(declare-fun b!442840 () Bool)

(declare-fun res!262319 () Bool)

(declare-fun e!260625 () Bool)

(assert (=> b!442840 (=> (not res!262319) (not e!260625))))

(declare-datatypes ((array!27253 0))(
  ( (array!27254 (arr!13075 (Array (_ BitVec 32) (_ BitVec 64))) (size!13427 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27253)

(declare-datatypes ((List!7846 0))(
  ( (Nil!7843) (Cons!7842 (h!8698 (_ BitVec 64)) (t!13604 List!7846)) )
))
(declare-fun arrayNoDuplicates!0 (array!27253 (_ BitVec 32) List!7846) Bool)

(assert (=> b!442840 (= res!262319 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7843))))

(declare-fun b!442841 () Bool)

(declare-fun res!262325 () Bool)

(assert (=> b!442841 (=> (not res!262325) (not e!260625))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442841 (= res!262325 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13427 _keys!709))))))

(declare-fun b!442842 () Bool)

(declare-fun res!262317 () Bool)

(assert (=> b!442842 (=> (not res!262317) (not e!260625))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16733 0))(
  ( (V!16734 (val!5905 Int)) )
))
(declare-datatypes ((ValueCell!5517 0))(
  ( (ValueCellFull!5517 (v!8156 V!16733)) (EmptyCell!5517) )
))
(declare-datatypes ((array!27255 0))(
  ( (array!27256 (arr!13076 (Array (_ BitVec 32) ValueCell!5517)) (size!13428 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27255)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442842 (= res!262317 (and (= (size!13428 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13427 _keys!709) (size!13428 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442843 () Bool)

(declare-fun res!262321 () Bool)

(assert (=> b!442843 (=> (not res!262321) (not e!260625))))

(assert (=> b!442843 (= res!262321 (or (= (select (arr!13075 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13075 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19206 () Bool)

(declare-fun mapRes!19206 () Bool)

(assert (=> mapIsEmpty!19206 mapRes!19206))

(declare-fun b!442844 () Bool)

(declare-fun res!262323 () Bool)

(assert (=> b!442844 (=> (not res!262323) (not e!260625))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442844 (= res!262323 (validKeyInArray!0 k0!794))))

(declare-fun b!442845 () Bool)

(declare-fun e!260623 () Bool)

(assert (=> b!442845 (= e!260623 (and e!260622 mapRes!19206))))

(declare-fun condMapEmpty!19206 () Bool)

(declare-fun mapDefault!19206 () ValueCell!5517)

(assert (=> b!442845 (= condMapEmpty!19206 (= (arr!13076 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5517)) mapDefault!19206)))))

(declare-fun mapNonEmpty!19206 () Bool)

(declare-fun tp!37188 () Bool)

(declare-fun e!260626 () Bool)

(assert (=> mapNonEmpty!19206 (= mapRes!19206 (and tp!37188 e!260626))))

(declare-fun mapValue!19206 () ValueCell!5517)

(declare-fun mapRest!19206 () (Array (_ BitVec 32) ValueCell!5517))

(declare-fun mapKey!19206 () (_ BitVec 32))

(assert (=> mapNonEmpty!19206 (= (arr!13076 _values!549) (store mapRest!19206 mapKey!19206 mapValue!19206))))

(declare-fun res!262320 () Bool)

(assert (=> start!40322 (=> (not res!262320) (not e!260625))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40322 (= res!262320 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13427 _keys!709))))))

(assert (=> start!40322 e!260625))

(assert (=> start!40322 true))

(declare-fun array_inv!9482 (array!27255) Bool)

(assert (=> start!40322 (and (array_inv!9482 _values!549) e!260623)))

(declare-fun array_inv!9483 (array!27253) Bool)

(assert (=> start!40322 (array_inv!9483 _keys!709)))

(declare-fun b!442846 () Bool)

(declare-fun res!262324 () Bool)

(assert (=> b!442846 (=> (not res!262324) (not e!260625))))

(declare-fun arrayContainsKey!0 (array!27253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442846 (= res!262324 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442847 () Bool)

(declare-fun res!262316 () Bool)

(assert (=> b!442847 (=> (not res!262316) (not e!260625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27253 (_ BitVec 32)) Bool)

(assert (=> b!442847 (= res!262316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442848 () Bool)

(declare-fun res!262322 () Bool)

(assert (=> b!442848 (=> (not res!262322) (not e!260625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442848 (= res!262322 (validMask!0 mask!1025))))

(declare-fun b!442849 () Bool)

(declare-fun e!260624 () Bool)

(assert (=> b!442849 (= e!260624 false)))

(declare-fun lt!203252 () Bool)

(declare-fun lt!203251 () array!27253)

(assert (=> b!442849 (= lt!203252 (arrayNoDuplicates!0 lt!203251 #b00000000000000000000000000000000 Nil!7843))))

(declare-fun b!442850 () Bool)

(assert (=> b!442850 (= e!260625 e!260624)))

(declare-fun res!262318 () Bool)

(assert (=> b!442850 (=> (not res!262318) (not e!260624))))

(assert (=> b!442850 (= res!262318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203251 mask!1025))))

(assert (=> b!442850 (= lt!203251 (array!27254 (store (arr!13075 _keys!709) i!563 k0!794) (size!13427 _keys!709)))))

(declare-fun b!442851 () Bool)

(assert (=> b!442851 (= e!260626 tp_is_empty!11721)))

(assert (= (and start!40322 res!262320) b!442848))

(assert (= (and b!442848 res!262322) b!442842))

(assert (= (and b!442842 res!262317) b!442847))

(assert (= (and b!442847 res!262316) b!442840))

(assert (= (and b!442840 res!262319) b!442841))

(assert (= (and b!442841 res!262325) b!442844))

(assert (= (and b!442844 res!262323) b!442843))

(assert (= (and b!442843 res!262321) b!442846))

(assert (= (and b!442846 res!262324) b!442850))

(assert (= (and b!442850 res!262318) b!442849))

(assert (= (and b!442845 condMapEmpty!19206) mapIsEmpty!19206))

(assert (= (and b!442845 (not condMapEmpty!19206)) mapNonEmpty!19206))

(get-info :version)

(assert (= (and mapNonEmpty!19206 ((_ is ValueCellFull!5517) mapValue!19206)) b!442851))

(assert (= (and b!442845 ((_ is ValueCellFull!5517) mapDefault!19206)) b!442839))

(assert (= start!40322 b!442845))

(declare-fun m!429337 () Bool)

(assert (=> b!442850 m!429337))

(declare-fun m!429339 () Bool)

(assert (=> b!442850 m!429339))

(declare-fun m!429341 () Bool)

(assert (=> b!442846 m!429341))

(declare-fun m!429343 () Bool)

(assert (=> b!442843 m!429343))

(declare-fun m!429345 () Bool)

(assert (=> b!442844 m!429345))

(declare-fun m!429347 () Bool)

(assert (=> b!442847 m!429347))

(declare-fun m!429349 () Bool)

(assert (=> b!442840 m!429349))

(declare-fun m!429351 () Bool)

(assert (=> mapNonEmpty!19206 m!429351))

(declare-fun m!429353 () Bool)

(assert (=> b!442849 m!429353))

(declare-fun m!429355 () Bool)

(assert (=> b!442848 m!429355))

(declare-fun m!429357 () Bool)

(assert (=> start!40322 m!429357))

(declare-fun m!429359 () Bool)

(assert (=> start!40322 m!429359))

(check-sat (not b!442847) (not start!40322) (not mapNonEmpty!19206) (not b!442848) (not b!442846) (not b!442840) (not b!442850) (not b!442844) (not b!442849) tp_is_empty!11721)
(check-sat)
