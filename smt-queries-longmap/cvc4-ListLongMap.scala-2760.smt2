; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40416 () Bool)

(assert start!40416)

(declare-fun b!444458 () Bool)

(declare-fun res!263551 () Bool)

(declare-fun e!261382 () Bool)

(assert (=> b!444458 (=> (not res!263551) (not e!261382))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444458 (= res!263551 (validMask!0 mask!1025))))

(declare-fun b!444460 () Bool)

(declare-fun e!261384 () Bool)

(declare-fun tp_is_empty!11801 () Bool)

(assert (=> b!444460 (= e!261384 tp_is_empty!11801)))

(declare-fun b!444461 () Bool)

(declare-fun res!263554 () Bool)

(assert (=> b!444461 (=> (not res!263554) (not e!261382))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27411 0))(
  ( (array!27412 (arr!13153 (Array (_ BitVec 32) (_ BitVec 64))) (size!13505 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27411)

(assert (=> b!444461 (= res!263554 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13505 _keys!709))))))

(declare-fun b!444462 () Bool)

(declare-fun res!263557 () Bool)

(assert (=> b!444462 (=> (not res!263557) (not e!261382))))

(assert (=> b!444462 (= res!263557 (or (= (select (arr!13153 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13153 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444463 () Bool)

(declare-fun res!263555 () Bool)

(assert (=> b!444463 (=> (not res!263555) (not e!261382))))

(declare-datatypes ((List!7874 0))(
  ( (Nil!7871) (Cons!7870 (h!8726 (_ BitVec 64)) (t!13632 List!7874)) )
))
(declare-fun arrayNoDuplicates!0 (array!27411 (_ BitVec 32) List!7874) Bool)

(assert (=> b!444463 (= res!263555 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7871))))

(declare-fun b!444464 () Bool)

(declare-fun e!261381 () Bool)

(assert (=> b!444464 (= e!261381 false)))

(declare-fun lt!203494 () Bool)

(declare-fun lt!203495 () array!27411)

(assert (=> b!444464 (= lt!203494 (arrayNoDuplicates!0 lt!203495 #b00000000000000000000000000000000 Nil!7871))))

(declare-fun b!444465 () Bool)

(declare-fun res!263553 () Bool)

(assert (=> b!444465 (=> (not res!263553) (not e!261382))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444465 (= res!263553 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!444466 () Bool)

(declare-fun e!261383 () Bool)

(assert (=> b!444466 (= e!261383 tp_is_empty!11801)))

(declare-fun mapNonEmpty!19329 () Bool)

(declare-fun mapRes!19329 () Bool)

(declare-fun tp!37311 () Bool)

(assert (=> mapNonEmpty!19329 (= mapRes!19329 (and tp!37311 e!261384))))

(declare-fun mapKey!19329 () (_ BitVec 32))

(declare-datatypes ((V!16839 0))(
  ( (V!16840 (val!5945 Int)) )
))
(declare-datatypes ((ValueCell!5557 0))(
  ( (ValueCellFull!5557 (v!8196 V!16839)) (EmptyCell!5557) )
))
(declare-datatypes ((array!27413 0))(
  ( (array!27414 (arr!13154 (Array (_ BitVec 32) ValueCell!5557)) (size!13506 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27413)

(declare-fun mapRest!19329 () (Array (_ BitVec 32) ValueCell!5557))

(declare-fun mapValue!19329 () ValueCell!5557)

(assert (=> mapNonEmpty!19329 (= (arr!13154 _values!549) (store mapRest!19329 mapKey!19329 mapValue!19329))))

(declare-fun b!444467 () Bool)

(declare-fun res!263558 () Bool)

(assert (=> b!444467 (=> (not res!263558) (not e!261382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444467 (= res!263558 (validKeyInArray!0 k!794))))

(declare-fun b!444459 () Bool)

(declare-fun res!263560 () Bool)

(assert (=> b!444459 (=> (not res!263560) (not e!261382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27411 (_ BitVec 32)) Bool)

(assert (=> b!444459 (= res!263560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!263559 () Bool)

(assert (=> start!40416 (=> (not res!263559) (not e!261382))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40416 (= res!263559 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13505 _keys!709))))))

(assert (=> start!40416 e!261382))

(assert (=> start!40416 true))

(declare-fun e!261385 () Bool)

(declare-fun array_inv!9542 (array!27413) Bool)

(assert (=> start!40416 (and (array_inv!9542 _values!549) e!261385)))

(declare-fun array_inv!9543 (array!27411) Bool)

(assert (=> start!40416 (array_inv!9543 _keys!709)))

(declare-fun mapIsEmpty!19329 () Bool)

(assert (=> mapIsEmpty!19329 mapRes!19329))

(declare-fun b!444468 () Bool)

(assert (=> b!444468 (= e!261385 (and e!261383 mapRes!19329))))

(declare-fun condMapEmpty!19329 () Bool)

(declare-fun mapDefault!19329 () ValueCell!5557)

