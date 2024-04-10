; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40424 () Bool)

(assert start!40424)

(declare-fun b!444614 () Bool)

(declare-fun res!263675 () Bool)

(declare-fun e!261453 () Bool)

(assert (=> b!444614 (=> (not res!263675) (not e!261453))))

(declare-datatypes ((array!27427 0))(
  ( (array!27428 (arr!13161 (Array (_ BitVec 32) (_ BitVec 64))) (size!13513 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27427)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16851 0))(
  ( (V!16852 (val!5949 Int)) )
))
(declare-datatypes ((ValueCell!5561 0))(
  ( (ValueCellFull!5561 (v!8200 V!16851)) (EmptyCell!5561) )
))
(declare-datatypes ((array!27429 0))(
  ( (array!27430 (arr!13162 (Array (_ BitVec 32) ValueCell!5561)) (size!13514 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27429)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444614 (= res!263675 (and (= (size!13514 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13513 _keys!709) (size!13514 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444615 () Bool)

(declare-fun res!263679 () Bool)

(assert (=> b!444615 (=> (not res!263679) (not e!261453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27427 (_ BitVec 32)) Bool)

(assert (=> b!444615 (= res!263679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444616 () Bool)

(declare-fun e!261455 () Bool)

(assert (=> b!444616 (= e!261453 e!261455)))

(declare-fun res!263680 () Bool)

(assert (=> b!444616 (=> (not res!263680) (not e!261455))))

(declare-fun lt!203518 () array!27427)

(assert (=> b!444616 (= res!263680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203518 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444616 (= lt!203518 (array!27428 (store (arr!13161 _keys!709) i!563 k!794) (size!13513 _keys!709)))))

(declare-fun b!444617 () Bool)

(declare-fun res!263674 () Bool)

(assert (=> b!444617 (=> (not res!263674) (not e!261453))))

(assert (=> b!444617 (= res!263674 (or (= (select (arr!13161 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13161 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444618 () Bool)

(declare-fun res!263676 () Bool)

(assert (=> b!444618 (=> (not res!263676) (not e!261453))))

(assert (=> b!444618 (= res!263676 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13513 _keys!709))))))

(declare-fun b!444619 () Bool)

(declare-fun res!263673 () Bool)

(assert (=> b!444619 (=> (not res!263673) (not e!261453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444619 (= res!263673 (validKeyInArray!0 k!794))))

(declare-fun b!444620 () Bool)

(declare-fun e!261454 () Bool)

(declare-fun e!261456 () Bool)

(declare-fun mapRes!19341 () Bool)

(assert (=> b!444620 (= e!261454 (and e!261456 mapRes!19341))))

(declare-fun condMapEmpty!19341 () Bool)

(declare-fun mapDefault!19341 () ValueCell!5561)

