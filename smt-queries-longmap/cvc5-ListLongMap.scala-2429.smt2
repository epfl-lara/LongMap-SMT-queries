; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38344 () Bool)

(assert start!38344)

(declare-fun b!395419 () Bool)

(declare-fun res!226687 () Bool)

(declare-fun e!239406 () Bool)

(assert (=> b!395419 (=> (not res!226687) (not e!239406))))

(declare-datatypes ((array!23529 0))(
  ( (array!23530 (arr!11217 (Array (_ BitVec 32) (_ BitVec 64))) (size!11569 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23529)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395419 (= res!226687 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16329 () Bool)

(declare-fun mapRes!16329 () Bool)

(declare-fun tp!32124 () Bool)

(declare-fun e!239407 () Bool)

(assert (=> mapNonEmpty!16329 (= mapRes!16329 (and tp!32124 e!239407))))

(declare-datatypes ((V!14187 0))(
  ( (V!14188 (val!4950 Int)) )
))
(declare-datatypes ((ValueCell!4562 0))(
  ( (ValueCellFull!4562 (v!7196 V!14187)) (EmptyCell!4562) )
))
(declare-datatypes ((array!23531 0))(
  ( (array!23532 (arr!11218 (Array (_ BitVec 32) ValueCell!4562)) (size!11570 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23531)

(declare-fun mapRest!16329 () (Array (_ BitVec 32) ValueCell!4562))

(declare-fun mapKey!16329 () (_ BitVec 32))

(declare-fun mapValue!16329 () ValueCell!4562)

(assert (=> mapNonEmpty!16329 (= (arr!11218 _values!549) (store mapRest!16329 mapKey!16329 mapValue!16329))))

(declare-fun b!395421 () Bool)

(declare-fun res!226692 () Bool)

(assert (=> b!395421 (=> (not res!226692) (not e!239406))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395421 (= res!226692 (validMask!0 mask!1025))))

(declare-fun b!395422 () Bool)

(declare-fun res!226690 () Bool)

(assert (=> b!395422 (=> (not res!226690) (not e!239406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395422 (= res!226690 (validKeyInArray!0 k!794))))

(declare-fun b!395423 () Bool)

(declare-fun res!226688 () Bool)

(assert (=> b!395423 (=> (not res!226688) (not e!239406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23529 (_ BitVec 32)) Bool)

(assert (=> b!395423 (= res!226688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395424 () Bool)

(declare-fun res!226685 () Bool)

(assert (=> b!395424 (=> (not res!226685) (not e!239406))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395424 (= res!226685 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11569 _keys!709))))))

(declare-fun b!395425 () Bool)

(declare-fun res!226693 () Bool)

(assert (=> b!395425 (=> (not res!226693) (not e!239406))))

(declare-datatypes ((List!6510 0))(
  ( (Nil!6507) (Cons!6506 (h!7362 (_ BitVec 64)) (t!11684 List!6510)) )
))
(declare-fun arrayNoDuplicates!0 (array!23529 (_ BitVec 32) List!6510) Bool)

(assert (=> b!395425 (= res!226693 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6507))))

(declare-fun b!395426 () Bool)

(assert (=> b!395426 (= e!239406 (not (= (size!11569 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025))))))

(declare-fun mapIsEmpty!16329 () Bool)

(assert (=> mapIsEmpty!16329 mapRes!16329))

(declare-fun b!395427 () Bool)

(declare-fun res!226689 () Bool)

(assert (=> b!395427 (=> (not res!226689) (not e!239406))))

(assert (=> b!395427 (= res!226689 (or (= (select (arr!11217 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11217 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395428 () Bool)

(declare-fun res!226686 () Bool)

(assert (=> b!395428 (=> (not res!226686) (not e!239406))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395428 (= res!226686 (and (= (size!11570 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11569 _keys!709) (size!11570 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!226691 () Bool)

(assert (=> start!38344 (=> (not res!226691) (not e!239406))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38344 (= res!226691 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11569 _keys!709))))))

(assert (=> start!38344 e!239406))

(assert (=> start!38344 true))

(declare-fun e!239404 () Bool)

(declare-fun array_inv!8234 (array!23531) Bool)

(assert (=> start!38344 (and (array_inv!8234 _values!549) e!239404)))

(declare-fun array_inv!8235 (array!23529) Bool)

(assert (=> start!38344 (array_inv!8235 _keys!709)))

(declare-fun b!395420 () Bool)

(declare-fun tp_is_empty!9811 () Bool)

(assert (=> b!395420 (= e!239407 tp_is_empty!9811)))

(declare-fun b!395429 () Bool)

(declare-fun e!239405 () Bool)

(assert (=> b!395429 (= e!239404 (and e!239405 mapRes!16329))))

(declare-fun condMapEmpty!16329 () Bool)

(declare-fun mapDefault!16329 () ValueCell!4562)

