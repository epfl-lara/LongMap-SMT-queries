; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38498 () Bool)

(assert start!38498)

(declare-fun res!228332 () Bool)

(declare-fun e!240436 () Bool)

(assert (=> start!38498 (=> (not res!228332) (not e!240436))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23747 0))(
  ( (array!23748 (arr!11323 (Array (_ BitVec 32) (_ BitVec 64))) (size!11675 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23747)

(assert (=> start!38498 (= res!228332 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11675 _keys!709))))))

(assert (=> start!38498 e!240436))

(assert (=> start!38498 true))

(declare-datatypes ((V!14327 0))(
  ( (V!14328 (val!5003 Int)) )
))
(declare-datatypes ((ValueCell!4615 0))(
  ( (ValueCellFull!4615 (v!7250 V!14327)) (EmptyCell!4615) )
))
(declare-datatypes ((array!23749 0))(
  ( (array!23750 (arr!11324 (Array (_ BitVec 32) ValueCell!4615)) (size!11676 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23749)

(declare-fun e!240437 () Bool)

(declare-fun array_inv!8298 (array!23749) Bool)

(assert (=> start!38498 (and (array_inv!8298 _values!549) e!240437)))

(declare-fun array_inv!8299 (array!23747) Bool)

(assert (=> start!38498 (array_inv!8299 _keys!709)))

(declare-fun b!397607 () Bool)

(declare-fun res!228339 () Bool)

(assert (=> b!397607 (=> (not res!228339) (not e!240436))))

(declare-datatypes ((List!6553 0))(
  ( (Nil!6550) (Cons!6549 (h!7405 (_ BitVec 64)) (t!11727 List!6553)) )
))
(declare-fun arrayNoDuplicates!0 (array!23747 (_ BitVec 32) List!6553) Bool)

(assert (=> b!397607 (= res!228339 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6550))))

(declare-fun mapNonEmpty!16497 () Bool)

(declare-fun mapRes!16497 () Bool)

(declare-fun tp!32292 () Bool)

(declare-fun e!240434 () Bool)

(assert (=> mapNonEmpty!16497 (= mapRes!16497 (and tp!32292 e!240434))))

(declare-fun mapKey!16497 () (_ BitVec 32))

(declare-fun mapRest!16497 () (Array (_ BitVec 32) ValueCell!4615))

(declare-fun mapValue!16497 () ValueCell!4615)

(assert (=> mapNonEmpty!16497 (= (arr!11324 _values!549) (store mapRest!16497 mapKey!16497 mapValue!16497))))

(declare-fun b!397608 () Bool)

(declare-fun res!228333 () Bool)

(assert (=> b!397608 (=> (not res!228333) (not e!240436))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397608 (= res!228333 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!397609 () Bool)

(declare-fun e!240438 () Bool)

(assert (=> b!397609 (= e!240436 e!240438)))

(declare-fun res!228335 () Bool)

(assert (=> b!397609 (=> (not res!228335) (not e!240438))))

(declare-fun lt!187331 () array!23747)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23747 (_ BitVec 32)) Bool)

(assert (=> b!397609 (= res!228335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187331 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397609 (= lt!187331 (array!23748 (store (arr!11323 _keys!709) i!563 k!794) (size!11675 _keys!709)))))

(declare-fun b!397610 () Bool)

(declare-fun res!228338 () Bool)

(assert (=> b!397610 (=> (not res!228338) (not e!240436))))

(assert (=> b!397610 (= res!228338 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11675 _keys!709))))))

(declare-fun b!397611 () Bool)

(declare-fun res!228337 () Bool)

(assert (=> b!397611 (=> (not res!228337) (not e!240436))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397611 (= res!228337 (and (= (size!11676 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11675 _keys!709) (size!11676 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397612 () Bool)

(assert (=> b!397612 (= e!240438 false)))

(declare-fun lt!187330 () Bool)

(assert (=> b!397612 (= lt!187330 (arrayNoDuplicates!0 lt!187331 #b00000000000000000000000000000000 Nil!6550))))

(declare-fun b!397613 () Bool)

(declare-fun e!240435 () Bool)

(assert (=> b!397613 (= e!240437 (and e!240435 mapRes!16497))))

(declare-fun condMapEmpty!16497 () Bool)

(declare-fun mapDefault!16497 () ValueCell!4615)

