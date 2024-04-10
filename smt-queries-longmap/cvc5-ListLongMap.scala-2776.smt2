; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40528 () Bool)

(assert start!40528)

(declare-fun b!446581 () Bool)

(declare-fun res!265095 () Bool)

(declare-fun e!262349 () Bool)

(assert (=> b!446581 (=> (not res!265095) (not e!262349))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27593 0))(
  ( (array!27594 (arr!13243 (Array (_ BitVec 32) (_ BitVec 64))) (size!13595 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27593)

(assert (=> b!446581 (= res!265095 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13595 _keys!709))))))

(declare-fun b!446582 () Bool)

(declare-fun res!265092 () Bool)

(assert (=> b!446582 (=> (not res!265092) (not e!262349))))

(declare-datatypes ((List!7922 0))(
  ( (Nil!7919) (Cons!7918 (h!8774 (_ BitVec 64)) (t!13682 List!7922)) )
))
(declare-fun arrayNoDuplicates!0 (array!27593 (_ BitVec 32) List!7922) Bool)

(assert (=> b!446582 (= res!265092 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7919))))

(declare-fun b!446583 () Bool)

(declare-fun res!265091 () Bool)

(assert (=> b!446583 (=> (not res!265091) (not e!262349))))

(assert (=> b!446583 (= res!265091 (or (= (select (arr!13243 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13243 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19470 () Bool)

(declare-fun mapRes!19470 () Bool)

(assert (=> mapIsEmpty!19470 mapRes!19470))

(declare-fun mapNonEmpty!19470 () Bool)

(declare-fun tp!37497 () Bool)

(declare-fun e!262347 () Bool)

(assert (=> mapNonEmpty!19470 (= mapRes!19470 (and tp!37497 e!262347))))

(declare-datatypes ((V!16963 0))(
  ( (V!16964 (val!5991 Int)) )
))
(declare-datatypes ((ValueCell!5603 0))(
  ( (ValueCellFull!5603 (v!8246 V!16963)) (EmptyCell!5603) )
))
(declare-datatypes ((array!27595 0))(
  ( (array!27596 (arr!13244 (Array (_ BitVec 32) ValueCell!5603)) (size!13596 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27595)

(declare-fun mapRest!19470 () (Array (_ BitVec 32) ValueCell!5603))

(declare-fun mapKey!19470 () (_ BitVec 32))

(declare-fun mapValue!19470 () ValueCell!5603)

(assert (=> mapNonEmpty!19470 (= (arr!13244 _values!549) (store mapRest!19470 mapKey!19470 mapValue!19470))))

(declare-fun b!446584 () Bool)

(declare-fun res!265089 () Bool)

(assert (=> b!446584 (=> (not res!265089) (not e!262349))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27593 (_ BitVec 32)) Bool)

(assert (=> b!446584 (= res!265089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446585 () Bool)

(declare-fun e!262350 () Bool)

(assert (=> b!446585 (= e!262349 e!262350)))

(declare-fun res!265094 () Bool)

(assert (=> b!446585 (=> (not res!265094) (not e!262350))))

(declare-fun lt!203831 () array!27593)

(assert (=> b!446585 (= res!265094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203831 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!446585 (= lt!203831 (array!27594 (store (arr!13243 _keys!709) i!563 k!794) (size!13595 _keys!709)))))

(declare-fun b!446586 () Bool)

(declare-fun tp_is_empty!11893 () Bool)

(assert (=> b!446586 (= e!262347 tp_is_empty!11893)))

(declare-fun b!446587 () Bool)

(declare-fun res!265097 () Bool)

(assert (=> b!446587 (=> (not res!265097) (not e!262349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446587 (= res!265097 (validMask!0 mask!1025))))

(declare-fun b!446588 () Bool)

(declare-fun e!262345 () Bool)

(assert (=> b!446588 (= e!262345 tp_is_empty!11893)))

(declare-fun b!446589 () Bool)

(declare-fun res!265093 () Bool)

(assert (=> b!446589 (=> (not res!265093) (not e!262349))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446589 (= res!265093 (and (= (size!13596 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13595 _keys!709) (size!13596 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446590 () Bool)

(declare-fun res!265098 () Bool)

(assert (=> b!446590 (=> (not res!265098) (not e!262349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446590 (= res!265098 (validKeyInArray!0 k!794))))

(declare-fun b!446591 () Bool)

(declare-fun res!265090 () Bool)

(assert (=> b!446591 (=> (not res!265090) (not e!262349))))

(declare-fun arrayContainsKey!0 (array!27593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446591 (= res!265090 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!446592 () Bool)

(declare-fun e!262346 () Bool)

(assert (=> b!446592 (= e!262346 (and e!262345 mapRes!19470))))

(declare-fun condMapEmpty!19470 () Bool)

(declare-fun mapDefault!19470 () ValueCell!5603)

