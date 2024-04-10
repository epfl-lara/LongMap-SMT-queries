; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38450 () Bool)

(assert start!38450)

(declare-fun b!396671 () Bool)

(declare-fun e!240006 () Bool)

(declare-fun e!240001 () Bool)

(assert (=> b!396671 (= e!240006 e!240001)))

(declare-fun res!227614 () Bool)

(assert (=> b!396671 (=> (not res!227614) (not e!240001))))

(declare-datatypes ((array!23651 0))(
  ( (array!23652 (arr!11275 (Array (_ BitVec 32) (_ BitVec 64))) (size!11627 (_ BitVec 32))) )
))
(declare-fun lt!187186 () array!23651)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23651 (_ BitVec 32)) Bool)

(assert (=> b!396671 (= res!227614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187186 mask!1025))))

(declare-fun _keys!709 () array!23651)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396671 (= lt!187186 (array!23652 (store (arr!11275 _keys!709) i!563 k!794) (size!11627 _keys!709)))))

(declare-fun b!396672 () Bool)

(declare-fun res!227613 () Bool)

(assert (=> b!396672 (=> (not res!227613) (not e!240006))))

(assert (=> b!396672 (= res!227613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396673 () Bool)

(declare-fun res!227617 () Bool)

(assert (=> b!396673 (=> (not res!227617) (not e!240006))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14263 0))(
  ( (V!14264 (val!4979 Int)) )
))
(declare-datatypes ((ValueCell!4591 0))(
  ( (ValueCellFull!4591 (v!7226 V!14263)) (EmptyCell!4591) )
))
(declare-datatypes ((array!23653 0))(
  ( (array!23654 (arr!11276 (Array (_ BitVec 32) ValueCell!4591)) (size!11628 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23653)

(assert (=> b!396673 (= res!227617 (and (= (size!11628 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11627 _keys!709) (size!11628 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16425 () Bool)

(declare-fun mapRes!16425 () Bool)

(assert (=> mapIsEmpty!16425 mapRes!16425))

(declare-fun b!396674 () Bool)

(declare-fun res!227616 () Bool)

(assert (=> b!396674 (=> (not res!227616) (not e!240006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396674 (= res!227616 (validKeyInArray!0 k!794))))

(declare-fun b!396675 () Bool)

(declare-fun res!227610 () Bool)

(assert (=> b!396675 (=> (not res!227610) (not e!240006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396675 (= res!227610 (validMask!0 mask!1025))))

(declare-fun b!396676 () Bool)

(declare-fun res!227618 () Bool)

(assert (=> b!396676 (=> (not res!227618) (not e!240006))))

(declare-fun arrayContainsKey!0 (array!23651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396676 (= res!227618 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396677 () Bool)

(declare-fun e!240002 () Bool)

(declare-fun e!240005 () Bool)

(assert (=> b!396677 (= e!240002 (and e!240005 mapRes!16425))))

(declare-fun condMapEmpty!16425 () Bool)

(declare-fun mapDefault!16425 () ValueCell!4591)

