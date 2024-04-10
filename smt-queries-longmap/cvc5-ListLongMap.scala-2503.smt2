; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38836 () Bool)

(assert start!38836)

(declare-fun b!405494 () Bool)

(declare-fun res!234057 () Bool)

(declare-fun e!243800 () Bool)

(assert (=> b!405494 (=> (not res!234057) (not e!243800))))

(declare-datatypes ((array!24401 0))(
  ( (array!24402 (arr!11650 (Array (_ BitVec 32) (_ BitVec 64))) (size!12002 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24401)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405494 (= res!234057 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17004 () Bool)

(declare-fun mapRes!17004 () Bool)

(declare-fun tp!33123 () Bool)

(declare-fun e!243804 () Bool)

(assert (=> mapNonEmpty!17004 (= mapRes!17004 (and tp!33123 e!243804))))

(declare-fun mapKey!17004 () (_ BitVec 32))

(declare-datatypes ((V!14779 0))(
  ( (V!14780 (val!5172 Int)) )
))
(declare-datatypes ((ValueCell!4784 0))(
  ( (ValueCellFull!4784 (v!7419 V!14779)) (EmptyCell!4784) )
))
(declare-fun mapRest!17004 () (Array (_ BitVec 32) ValueCell!4784))

(declare-datatypes ((array!24403 0))(
  ( (array!24404 (arr!11651 (Array (_ BitVec 32) ValueCell!4784)) (size!12003 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24403)

(declare-fun mapValue!17004 () ValueCell!4784)

(assert (=> mapNonEmpty!17004 (= (arr!11651 _values!549) (store mapRest!17004 mapKey!17004 mapValue!17004))))

(declare-fun b!405495 () Bool)

(declare-fun tp_is_empty!10255 () Bool)

(assert (=> b!405495 (= e!243804 tp_is_empty!10255)))

(declare-fun b!405496 () Bool)

(declare-fun res!234053 () Bool)

(assert (=> b!405496 (=> (not res!234053) (not e!243800))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405496 (= res!234053 (and (= (size!12003 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12002 _keys!709) (size!12003 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405497 () Bool)

(declare-fun res!234052 () Bool)

(assert (=> b!405497 (=> (not res!234052) (not e!243800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405497 (= res!234052 (validMask!0 mask!1025))))

(declare-fun b!405498 () Bool)

(declare-fun res!234048 () Bool)

(assert (=> b!405498 (=> (not res!234048) (not e!243800))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405498 (= res!234048 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12002 _keys!709))))))

(declare-fun b!405499 () Bool)

(declare-fun e!243799 () Bool)

(assert (=> b!405499 (= e!243799 tp_is_empty!10255)))

(declare-fun b!405500 () Bool)

(declare-fun res!234051 () Bool)

(assert (=> b!405500 (=> (not res!234051) (not e!243800))))

(assert (=> b!405500 (= res!234051 (or (= (select (arr!11650 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11650 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405501 () Bool)

(declare-fun res!234049 () Bool)

(assert (=> b!405501 (=> (not res!234049) (not e!243800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405501 (= res!234049 (validKeyInArray!0 k!794))))

(declare-fun b!405502 () Bool)

(declare-fun res!234055 () Bool)

(assert (=> b!405502 (=> (not res!234055) (not e!243800))))

(declare-datatypes ((List!6774 0))(
  ( (Nil!6771) (Cons!6770 (h!7626 (_ BitVec 64)) (t!11948 List!6774)) )
))
(declare-fun arrayNoDuplicates!0 (array!24401 (_ BitVec 32) List!6774) Bool)

(assert (=> b!405502 (= res!234055 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6771))))

(declare-fun mapIsEmpty!17004 () Bool)

(assert (=> mapIsEmpty!17004 mapRes!17004))

(declare-fun res!234054 () Bool)

(assert (=> start!38836 (=> (not res!234054) (not e!243800))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38836 (= res!234054 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12002 _keys!709))))))

(assert (=> start!38836 e!243800))

(assert (=> start!38836 true))

(declare-fun e!243803 () Bool)

(declare-fun array_inv!8514 (array!24403) Bool)

(assert (=> start!38836 (and (array_inv!8514 _values!549) e!243803)))

(declare-fun array_inv!8515 (array!24401) Bool)

(assert (=> start!38836 (array_inv!8515 _keys!709)))

(declare-fun b!405503 () Bool)

(declare-fun e!243801 () Bool)

(assert (=> b!405503 (= e!243800 e!243801)))

(declare-fun res!234056 () Bool)

(assert (=> b!405503 (=> (not res!234056) (not e!243801))))

(declare-fun lt!188344 () array!24401)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24401 (_ BitVec 32)) Bool)

(assert (=> b!405503 (= res!234056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188344 mask!1025))))

(assert (=> b!405503 (= lt!188344 (array!24402 (store (arr!11650 _keys!709) i!563 k!794) (size!12002 _keys!709)))))

(declare-fun b!405504 () Bool)

(assert (=> b!405504 (= e!243801 false)))

(declare-fun lt!188345 () Bool)

(assert (=> b!405504 (= lt!188345 (arrayNoDuplicates!0 lt!188344 #b00000000000000000000000000000000 Nil!6771))))

(declare-fun b!405505 () Bool)

(declare-fun res!234050 () Bool)

(assert (=> b!405505 (=> (not res!234050) (not e!243800))))

(assert (=> b!405505 (= res!234050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405506 () Bool)

(assert (=> b!405506 (= e!243803 (and e!243799 mapRes!17004))))

(declare-fun condMapEmpty!17004 () Bool)

(declare-fun mapDefault!17004 () ValueCell!4784)

