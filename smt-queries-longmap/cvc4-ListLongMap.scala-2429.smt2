; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38348 () Bool)

(assert start!38348)

(declare-fun b!395491 () Bool)

(declare-fun e!239433 () Bool)

(declare-fun tp_is_empty!9815 () Bool)

(assert (=> b!395491 (= e!239433 tp_is_empty!9815)))

(declare-fun b!395492 () Bool)

(declare-fun res!226742 () Bool)

(declare-fun e!239436 () Bool)

(assert (=> b!395492 (=> (not res!226742) (not e!239436))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395492 (= res!226742 (validMask!0 mask!1025))))

(declare-fun b!395493 () Bool)

(declare-fun res!226739 () Bool)

(assert (=> b!395493 (=> (not res!226739) (not e!239436))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23537 0))(
  ( (array!23538 (arr!11221 (Array (_ BitVec 32) (_ BitVec 64))) (size!11573 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23537)

(assert (=> b!395493 (= res!226739 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11573 _keys!709))))))

(declare-fun b!395494 () Bool)

(declare-fun res!226747 () Bool)

(assert (=> b!395494 (=> (not res!226747) (not e!239436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23537 (_ BitVec 32)) Bool)

(assert (=> b!395494 (= res!226747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395495 () Bool)

(declare-fun res!226740 () Bool)

(assert (=> b!395495 (=> (not res!226740) (not e!239436))))

(declare-datatypes ((List!6512 0))(
  ( (Nil!6509) (Cons!6508 (h!7364 (_ BitVec 64)) (t!11686 List!6512)) )
))
(declare-fun arrayNoDuplicates!0 (array!23537 (_ BitVec 32) List!6512) Bool)

(assert (=> b!395495 (= res!226740 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6509))))

(declare-fun b!395496 () Bool)

(declare-fun res!226746 () Bool)

(assert (=> b!395496 (=> (not res!226746) (not e!239436))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395496 (= res!226746 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!16335 () Bool)

(declare-fun mapRes!16335 () Bool)

(declare-fun tp!32130 () Bool)

(declare-fun e!239434 () Bool)

(assert (=> mapNonEmpty!16335 (= mapRes!16335 (and tp!32130 e!239434))))

(declare-datatypes ((V!14191 0))(
  ( (V!14192 (val!4952 Int)) )
))
(declare-datatypes ((ValueCell!4564 0))(
  ( (ValueCellFull!4564 (v!7198 V!14191)) (EmptyCell!4564) )
))
(declare-fun mapRest!16335 () (Array (_ BitVec 32) ValueCell!4564))

(declare-datatypes ((array!23539 0))(
  ( (array!23540 (arr!11222 (Array (_ BitVec 32) ValueCell!4564)) (size!11574 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23539)

(declare-fun mapKey!16335 () (_ BitVec 32))

(declare-fun mapValue!16335 () ValueCell!4564)

(assert (=> mapNonEmpty!16335 (= (arr!11222 _values!549) (store mapRest!16335 mapKey!16335 mapValue!16335))))

(declare-fun b!395497 () Bool)

(declare-fun res!226741 () Bool)

(assert (=> b!395497 (=> (not res!226741) (not e!239436))))

(declare-fun arrayContainsKey!0 (array!23537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395497 (= res!226741 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!395498 () Bool)

(assert (=> b!395498 (= e!239436 (not (= (size!11573 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025))))))

(declare-fun b!395499 () Bool)

(assert (=> b!395499 (= e!239434 tp_is_empty!9815)))

(declare-fun b!395500 () Bool)

(declare-fun res!226745 () Bool)

(assert (=> b!395500 (=> (not res!226745) (not e!239436))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395500 (= res!226745 (and (= (size!11574 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11573 _keys!709) (size!11574 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395501 () Bool)

(declare-fun res!226744 () Bool)

(assert (=> b!395501 (=> (not res!226744) (not e!239436))))

(assert (=> b!395501 (= res!226744 (or (= (select (arr!11221 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11221 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!226743 () Bool)

(assert (=> start!38348 (=> (not res!226743) (not e!239436))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38348 (= res!226743 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11573 _keys!709))))))

(assert (=> start!38348 e!239436))

(assert (=> start!38348 true))

(declare-fun e!239437 () Bool)

(declare-fun array_inv!8238 (array!23539) Bool)

(assert (=> start!38348 (and (array_inv!8238 _values!549) e!239437)))

(declare-fun array_inv!8239 (array!23537) Bool)

(assert (=> start!38348 (array_inv!8239 _keys!709)))

(declare-fun mapIsEmpty!16335 () Bool)

(assert (=> mapIsEmpty!16335 mapRes!16335))

(declare-fun b!395502 () Bool)

(assert (=> b!395502 (= e!239437 (and e!239433 mapRes!16335))))

(declare-fun condMapEmpty!16335 () Bool)

(declare-fun mapDefault!16335 () ValueCell!4564)

