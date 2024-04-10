; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38388 () Bool)

(assert start!38388)

(declare-fun b!395981 () Bool)

(declare-fun res!227094 () Bool)

(declare-fun e!239666 () Bool)

(assert (=> b!395981 (=> (not res!227094) (not e!239666))))

(declare-datatypes ((array!23591 0))(
  ( (array!23592 (arr!11247 (Array (_ BitVec 32) (_ BitVec 64))) (size!11599 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23591)

(assert (=> b!395981 (= res!227094 (and (bvsle #b00000000000000000000000000000000 (size!11599 _keys!709)) (bvslt (size!11599 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395982 () Bool)

(declare-fun res!227093 () Bool)

(assert (=> b!395982 (=> (not res!227093) (not e!239666))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23591 (_ BitVec 32)) Bool)

(assert (=> b!395982 (= res!227093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395984 () Bool)

(declare-fun res!227099 () Bool)

(assert (=> b!395984 (=> (not res!227099) (not e!239666))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14227 0))(
  ( (V!14228 (val!4965 Int)) )
))
(declare-datatypes ((ValueCell!4577 0))(
  ( (ValueCellFull!4577 (v!7211 V!14227)) (EmptyCell!4577) )
))
(declare-datatypes ((array!23593 0))(
  ( (array!23594 (arr!11248 (Array (_ BitVec 32) ValueCell!4577)) (size!11600 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23593)

(assert (=> b!395984 (= res!227099 (and (= (size!11600 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11599 _keys!709) (size!11600 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395985 () Bool)

(declare-fun e!239668 () Bool)

(declare-fun tp_is_empty!9841 () Bool)

(assert (=> b!395985 (= e!239668 tp_is_empty!9841)))

(declare-fun b!395986 () Bool)

(declare-fun res!227090 () Bool)

(assert (=> b!395986 (=> (not res!227090) (not e!239666))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395986 (= res!227090 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!395987 () Bool)

(declare-fun res!227098 () Bool)

(assert (=> b!395987 (=> (not res!227098) (not e!239666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395987 (= res!227098 (validMask!0 mask!1025))))

(declare-fun b!395988 () Bool)

(declare-fun e!239665 () Bool)

(assert (=> b!395988 (= e!239665 tp_is_empty!9841)))

(declare-fun mapIsEmpty!16377 () Bool)

(declare-fun mapRes!16377 () Bool)

(assert (=> mapIsEmpty!16377 mapRes!16377))

(declare-fun b!395989 () Bool)

(declare-fun res!227091 () Bool)

(assert (=> b!395989 (=> (not res!227091) (not e!239666))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395989 (= res!227091 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11599 _keys!709))))))

(declare-fun b!395983 () Bool)

(declare-fun res!227092 () Bool)

(assert (=> b!395983 (=> (not res!227092) (not e!239666))))

(assert (=> b!395983 (= res!227092 (or (= (select (arr!11247 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11247 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!227095 () Bool)

(assert (=> start!38388 (=> (not res!227095) (not e!239666))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38388 (= res!227095 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11599 _keys!709))))))

(assert (=> start!38388 e!239666))

(assert (=> start!38388 true))

(declare-fun e!239664 () Bool)

(declare-fun array_inv!8254 (array!23593) Bool)

(assert (=> start!38388 (and (array_inv!8254 _values!549) e!239664)))

(declare-fun array_inv!8255 (array!23591) Bool)

(assert (=> start!38388 (array_inv!8255 _keys!709)))

(declare-fun b!395990 () Bool)

(declare-fun res!227100 () Bool)

(assert (=> b!395990 (=> (not res!227100) (not e!239666))))

(declare-datatypes ((List!6519 0))(
  ( (Nil!6516) (Cons!6515 (h!7371 (_ BitVec 64)) (t!11693 List!6519)) )
))
(declare-fun arrayNoDuplicates!0 (array!23591 (_ BitVec 32) List!6519) Bool)

(assert (=> b!395990 (= res!227100 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6516))))

(declare-fun b!395991 () Bool)

(declare-fun res!227097 () Bool)

(assert (=> b!395991 (=> (not res!227097) (not e!239666))))

(assert (=> b!395991 (= res!227097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23592 (store (arr!11247 _keys!709) i!563 k!794) (size!11599 _keys!709)) mask!1025))))

(declare-fun b!395992 () Bool)

(declare-fun res!227096 () Bool)

(assert (=> b!395992 (=> (not res!227096) (not e!239666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395992 (= res!227096 (validKeyInArray!0 k!794))))

(declare-fun b!395993 () Bool)

(assert (=> b!395993 (= e!239664 (and e!239665 mapRes!16377))))

(declare-fun condMapEmpty!16377 () Bool)

(declare-fun mapDefault!16377 () ValueCell!4577)

