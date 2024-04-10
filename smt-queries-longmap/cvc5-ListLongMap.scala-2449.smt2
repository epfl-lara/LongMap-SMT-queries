; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38512 () Bool)

(assert start!38512)

(declare-fun res!228541 () Bool)

(declare-fun e!240559 () Bool)

(assert (=> start!38512 (=> (not res!228541) (not e!240559))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23773 0))(
  ( (array!23774 (arr!11336 (Array (_ BitVec 32) (_ BitVec 64))) (size!11688 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23773)

(assert (=> start!38512 (= res!228541 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11688 _keys!709))))))

(assert (=> start!38512 e!240559))

(assert (=> start!38512 true))

(declare-datatypes ((V!14347 0))(
  ( (V!14348 (val!5010 Int)) )
))
(declare-datatypes ((ValueCell!4622 0))(
  ( (ValueCellFull!4622 (v!7257 V!14347)) (EmptyCell!4622) )
))
(declare-datatypes ((array!23775 0))(
  ( (array!23776 (arr!11337 (Array (_ BitVec 32) ValueCell!4622)) (size!11689 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23775)

(declare-fun e!240561 () Bool)

(declare-fun array_inv!8308 (array!23775) Bool)

(assert (=> start!38512 (and (array_inv!8308 _values!549) e!240561)))

(declare-fun array_inv!8309 (array!23773) Bool)

(assert (=> start!38512 (array_inv!8309 _keys!709)))

(declare-fun b!397880 () Bool)

(declare-fun res!228546 () Bool)

(assert (=> b!397880 (=> (not res!228546) (not e!240559))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397880 (= res!228546 (validKeyInArray!0 k!794))))

(declare-fun b!397881 () Bool)

(declare-fun e!240564 () Bool)

(declare-fun tp_is_empty!9931 () Bool)

(assert (=> b!397881 (= e!240564 tp_is_empty!9931)))

(declare-fun b!397882 () Bool)

(declare-fun res!228548 () Bool)

(assert (=> b!397882 (=> (not res!228548) (not e!240559))))

(declare-datatypes ((List!6559 0))(
  ( (Nil!6556) (Cons!6555 (h!7411 (_ BitVec 64)) (t!11733 List!6559)) )
))
(declare-fun arrayNoDuplicates!0 (array!23773 (_ BitVec 32) List!6559) Bool)

(assert (=> b!397882 (= res!228548 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6556))))

(declare-fun b!397883 () Bool)

(declare-fun e!240560 () Bool)

(assert (=> b!397883 (= e!240559 e!240560)))

(declare-fun res!228547 () Bool)

(assert (=> b!397883 (=> (not res!228547) (not e!240560))))

(declare-fun lt!187373 () array!23773)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23773 (_ BitVec 32)) Bool)

(assert (=> b!397883 (= res!228547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187373 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397883 (= lt!187373 (array!23774 (store (arr!11336 _keys!709) i!563 k!794) (size!11688 _keys!709)))))

(declare-fun mapNonEmpty!16518 () Bool)

(declare-fun mapRes!16518 () Bool)

(declare-fun tp!32313 () Bool)

(assert (=> mapNonEmpty!16518 (= mapRes!16518 (and tp!32313 e!240564))))

(declare-fun mapKey!16518 () (_ BitVec 32))

(declare-fun mapValue!16518 () ValueCell!4622)

(declare-fun mapRest!16518 () (Array (_ BitVec 32) ValueCell!4622))

(assert (=> mapNonEmpty!16518 (= (arr!11337 _values!549) (store mapRest!16518 mapKey!16518 mapValue!16518))))

(declare-fun b!397884 () Bool)

(declare-fun res!228545 () Bool)

(assert (=> b!397884 (=> (not res!228545) (not e!240559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397884 (= res!228545 (validMask!0 mask!1025))))

(declare-fun b!397885 () Bool)

(declare-fun res!228542 () Bool)

(assert (=> b!397885 (=> (not res!228542) (not e!240559))))

(assert (=> b!397885 (= res!228542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397886 () Bool)

(declare-fun e!240563 () Bool)

(assert (=> b!397886 (= e!240561 (and e!240563 mapRes!16518))))

(declare-fun condMapEmpty!16518 () Bool)

(declare-fun mapDefault!16518 () ValueCell!4622)

