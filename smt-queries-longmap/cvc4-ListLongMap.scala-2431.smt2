; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38360 () Bool)

(assert start!38360)

(declare-fun b!395662 () Bool)

(declare-fun res!226857 () Bool)

(declare-fun e!239523 () Bool)

(assert (=> b!395662 (=> (not res!226857) (not e!239523))))

(declare-datatypes ((array!23561 0))(
  ( (array!23562 (arr!11233 (Array (_ BitVec 32) (_ BitVec 64))) (size!11585 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23561)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395662 (= res!226857 (or (= (select (arr!11233 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11233 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!226858 () Bool)

(assert (=> start!38360 (=> (not res!226858) (not e!239523))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38360 (= res!226858 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11585 _keys!709))))))

(assert (=> start!38360 e!239523))

(assert (=> start!38360 true))

(declare-datatypes ((V!14207 0))(
  ( (V!14208 (val!4958 Int)) )
))
(declare-datatypes ((ValueCell!4570 0))(
  ( (ValueCellFull!4570 (v!7204 V!14207)) (EmptyCell!4570) )
))
(declare-datatypes ((array!23563 0))(
  ( (array!23564 (arr!11234 (Array (_ BitVec 32) ValueCell!4570)) (size!11586 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23563)

(declare-fun e!239526 () Bool)

(declare-fun array_inv!8246 (array!23563) Bool)

(assert (=> start!38360 (and (array_inv!8246 _values!549) e!239526)))

(declare-fun array_inv!8247 (array!23561) Bool)

(assert (=> start!38360 (array_inv!8247 _keys!709)))

(declare-fun b!395663 () Bool)

(declare-fun res!226861 () Bool)

(assert (=> b!395663 (=> (not res!226861) (not e!239523))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23561 (_ BitVec 32)) Bool)

(assert (=> b!395663 (= res!226861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395664 () Bool)

(declare-fun res!226856 () Bool)

(assert (=> b!395664 (=> (not res!226856) (not e!239523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395664 (= res!226856 (validMask!0 mask!1025))))

(declare-fun b!395665 () Bool)

(declare-fun res!226862 () Bool)

(assert (=> b!395665 (=> (not res!226862) (not e!239523))))

(declare-datatypes ((List!6515 0))(
  ( (Nil!6512) (Cons!6511 (h!7367 (_ BitVec 64)) (t!11689 List!6515)) )
))
(declare-fun arrayNoDuplicates!0 (array!23561 (_ BitVec 32) List!6515) Bool)

(assert (=> b!395665 (= res!226862 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6512))))

(declare-fun b!395666 () Bool)

(declare-fun res!226860 () Bool)

(assert (=> b!395666 (=> (not res!226860) (not e!239523))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395666 (= res!226860 (and (= (size!11586 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11585 _keys!709) (size!11586 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395667 () Bool)

(declare-fun e!239527 () Bool)

(declare-fun tp_is_empty!9827 () Bool)

(assert (=> b!395667 (= e!239527 tp_is_empty!9827)))

(declare-fun b!395668 () Bool)

(declare-fun res!226863 () Bool)

(assert (=> b!395668 (=> (not res!226863) (not e!239523))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395668 (= res!226863 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!395669 () Bool)

(declare-fun res!226859 () Bool)

(assert (=> b!395669 (=> (not res!226859) (not e!239523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395669 (= res!226859 (validKeyInArray!0 k!794))))

(declare-fun b!395670 () Bool)

(declare-fun res!226864 () Bool)

(assert (=> b!395670 (=> (not res!226864) (not e!239523))))

(assert (=> b!395670 (= res!226864 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11585 _keys!709))))))

(declare-fun b!395671 () Bool)

(assert (=> b!395671 (= e!239523 (and (= (size!11585 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)) (bvsgt #b00000000000000000000000000000000 (size!11585 _keys!709))))))

(declare-fun b!395672 () Bool)

(declare-fun e!239525 () Bool)

(declare-fun mapRes!16353 () Bool)

(assert (=> b!395672 (= e!239526 (and e!239525 mapRes!16353))))

(declare-fun condMapEmpty!16353 () Bool)

(declare-fun mapDefault!16353 () ValueCell!4570)

