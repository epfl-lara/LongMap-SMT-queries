; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38840 () Bool)

(assert start!38840)

(declare-fun b!405796 () Bool)

(declare-fun e!243934 () Bool)

(assert (=> b!405796 (= e!243934 false)))

(declare-fun lt!188417 () Bool)

(declare-datatypes ((array!24426 0))(
  ( (array!24427 (arr!11662 (Array (_ BitVec 32) (_ BitVec 64))) (size!12014 (_ BitVec 32))) )
))
(declare-fun lt!188418 () array!24426)

(declare-datatypes ((List!6656 0))(
  ( (Nil!6653) (Cons!6652 (h!7508 (_ BitVec 64)) (t!11822 List!6656)) )
))
(declare-fun arrayNoDuplicates!0 (array!24426 (_ BitVec 32) List!6656) Bool)

(assert (=> b!405796 (= lt!188417 (arrayNoDuplicates!0 lt!188418 #b00000000000000000000000000000000 Nil!6653))))

(declare-fun b!405797 () Bool)

(declare-fun res!234317 () Bool)

(declare-fun e!243930 () Bool)

(assert (=> b!405797 (=> (not res!234317) (not e!243930))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405797 (= res!234317 (validMask!0 mask!1025))))

(declare-fun b!405798 () Bool)

(declare-fun res!234320 () Bool)

(assert (=> b!405798 (=> (not res!234320) (not e!243930))))

(declare-fun _keys!709 () array!24426)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405798 (= res!234320 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405799 () Bool)

(declare-fun res!234322 () Bool)

(assert (=> b!405799 (=> (not res!234322) (not e!243930))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14803 0))(
  ( (V!14804 (val!5181 Int)) )
))
(declare-datatypes ((ValueCell!4793 0))(
  ( (ValueCellFull!4793 (v!7429 V!14803)) (EmptyCell!4793) )
))
(declare-datatypes ((array!24428 0))(
  ( (array!24429 (arr!11663 (Array (_ BitVec 32) ValueCell!4793)) (size!12015 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24428)

(assert (=> b!405799 (= res!234322 (and (= (size!12015 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12014 _keys!709) (size!12015 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405800 () Bool)

(declare-fun res!234316 () Bool)

(assert (=> b!405800 (=> (not res!234316) (not e!243930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24426 (_ BitVec 32)) Bool)

(assert (=> b!405800 (= res!234316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405801 () Bool)

(declare-fun e!243932 () Bool)

(declare-fun tp_is_empty!10273 () Bool)

(assert (=> b!405801 (= e!243932 tp_is_empty!10273)))

(declare-fun b!405802 () Bool)

(declare-fun e!243933 () Bool)

(assert (=> b!405802 (= e!243933 tp_is_empty!10273)))

(declare-fun b!405803 () Bool)

(declare-fun res!234324 () Bool)

(assert (=> b!405803 (=> (not res!234324) (not e!243930))))

(assert (=> b!405803 (= res!234324 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6653))))

(declare-fun b!405804 () Bool)

(declare-fun res!234323 () Bool)

(assert (=> b!405804 (=> (not res!234323) (not e!243930))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405804 (= res!234323 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12014 _keys!709))))))

(declare-fun mapIsEmpty!17031 () Bool)

(declare-fun mapRes!17031 () Bool)

(assert (=> mapIsEmpty!17031 mapRes!17031))

(declare-fun res!234319 () Bool)

(assert (=> start!38840 (=> (not res!234319) (not e!243930))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38840 (= res!234319 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12014 _keys!709))))))

(assert (=> start!38840 e!243930))

(assert (=> start!38840 true))

(declare-fun e!243931 () Bool)

(declare-fun array_inv!8612 (array!24428) Bool)

(assert (=> start!38840 (and (array_inv!8612 _values!549) e!243931)))

(declare-fun array_inv!8613 (array!24426) Bool)

(assert (=> start!38840 (array_inv!8613 _keys!709)))

(declare-fun mapNonEmpty!17031 () Bool)

(declare-fun tp!33150 () Bool)

(assert (=> mapNonEmpty!17031 (= mapRes!17031 (and tp!33150 e!243932))))

(declare-fun mapKey!17031 () (_ BitVec 32))

(declare-fun mapRest!17031 () (Array (_ BitVec 32) ValueCell!4793))

(declare-fun mapValue!17031 () ValueCell!4793)

(assert (=> mapNonEmpty!17031 (= (arr!11663 _values!549) (store mapRest!17031 mapKey!17031 mapValue!17031))))

(declare-fun b!405805 () Bool)

(assert (=> b!405805 (= e!243931 (and e!243933 mapRes!17031))))

(declare-fun condMapEmpty!17031 () Bool)

(declare-fun mapDefault!17031 () ValueCell!4793)

(assert (=> b!405805 (= condMapEmpty!17031 (= (arr!11663 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4793)) mapDefault!17031)))))

(declare-fun b!405806 () Bool)

(assert (=> b!405806 (= e!243930 e!243934)))

(declare-fun res!234321 () Bool)

(assert (=> b!405806 (=> (not res!234321) (not e!243934))))

(assert (=> b!405806 (= res!234321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188418 mask!1025))))

(assert (=> b!405806 (= lt!188418 (array!24427 (store (arr!11662 _keys!709) i!563 k0!794) (size!12014 _keys!709)))))

(declare-fun b!405807 () Bool)

(declare-fun res!234315 () Bool)

(assert (=> b!405807 (=> (not res!234315) (not e!243930))))

(assert (=> b!405807 (= res!234315 (or (= (select (arr!11662 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11662 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405808 () Bool)

(declare-fun res!234318 () Bool)

(assert (=> b!405808 (=> (not res!234318) (not e!243930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405808 (= res!234318 (validKeyInArray!0 k0!794))))

(assert (= (and start!38840 res!234319) b!405797))

(assert (= (and b!405797 res!234317) b!405799))

(assert (= (and b!405799 res!234322) b!405800))

(assert (= (and b!405800 res!234316) b!405803))

(assert (= (and b!405803 res!234324) b!405804))

(assert (= (and b!405804 res!234323) b!405808))

(assert (= (and b!405808 res!234318) b!405807))

(assert (= (and b!405807 res!234315) b!405798))

(assert (= (and b!405798 res!234320) b!405806))

(assert (= (and b!405806 res!234321) b!405796))

(assert (= (and b!405805 condMapEmpty!17031) mapIsEmpty!17031))

(assert (= (and b!405805 (not condMapEmpty!17031)) mapNonEmpty!17031))

(get-info :version)

(assert (= (and mapNonEmpty!17031 ((_ is ValueCellFull!4793) mapValue!17031)) b!405801))

(assert (= (and b!405805 ((_ is ValueCellFull!4793) mapDefault!17031)) b!405802))

(assert (= start!38840 b!405805))

(declare-fun m!398373 () Bool)

(assert (=> b!405808 m!398373))

(declare-fun m!398375 () Bool)

(assert (=> b!405797 m!398375))

(declare-fun m!398377 () Bool)

(assert (=> b!405798 m!398377))

(declare-fun m!398379 () Bool)

(assert (=> b!405796 m!398379))

(declare-fun m!398381 () Bool)

(assert (=> start!38840 m!398381))

(declare-fun m!398383 () Bool)

(assert (=> start!38840 m!398383))

(declare-fun m!398385 () Bool)

(assert (=> b!405800 m!398385))

(declare-fun m!398387 () Bool)

(assert (=> b!405807 m!398387))

(declare-fun m!398389 () Bool)

(assert (=> mapNonEmpty!17031 m!398389))

(declare-fun m!398391 () Bool)

(assert (=> b!405806 m!398391))

(declare-fun m!398393 () Bool)

(assert (=> b!405806 m!398393))

(declare-fun m!398395 () Bool)

(assert (=> b!405803 m!398395))

(check-sat (not b!405797) (not b!405796) (not start!38840) (not b!405803) (not mapNonEmpty!17031) tp_is_empty!10273 (not b!405808) (not b!405798) (not b!405806) (not b!405800))
(check-sat)
