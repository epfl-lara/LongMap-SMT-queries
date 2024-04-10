; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40522 () Bool)

(assert start!40522)

(declare-fun b!446463 () Bool)

(declare-fun e!262295 () Bool)

(declare-fun tp_is_empty!11887 () Bool)

(assert (=> b!446463 (= e!262295 tp_is_empty!11887)))

(declare-fun b!446464 () Bool)

(declare-fun res!265006 () Bool)

(declare-fun e!262294 () Bool)

(assert (=> b!446464 (=> (not res!265006) (not e!262294))))

(declare-datatypes ((array!27581 0))(
  ( (array!27582 (arr!13237 (Array (_ BitVec 32) (_ BitVec 64))) (size!13589 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27581)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446464 (= res!265006 (or (= (select (arr!13237 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13237 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446465 () Bool)

(declare-fun res!265007 () Bool)

(assert (=> b!446465 (=> (not res!265007) (not e!262294))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446465 (= res!265007 (validMask!0 mask!1025))))

(declare-fun b!446466 () Bool)

(declare-fun res!265004 () Bool)

(assert (=> b!446466 (=> (not res!265004) (not e!262294))))

(assert (=> b!446466 (= res!265004 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13589 _keys!709))))))

(declare-fun b!446467 () Bool)

(declare-fun res!265008 () Bool)

(assert (=> b!446467 (=> (not res!265008) (not e!262294))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446467 (= res!265008 (validKeyInArray!0 k!794))))

(declare-fun b!446468 () Bool)

(declare-fun e!262292 () Bool)

(assert (=> b!446468 (= e!262292 tp_is_empty!11887)))

(declare-fun res!264999 () Bool)

(assert (=> start!40522 (=> (not res!264999) (not e!262294))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40522 (= res!264999 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13589 _keys!709))))))

(assert (=> start!40522 e!262294))

(assert (=> start!40522 true))

(declare-datatypes ((V!16955 0))(
  ( (V!16956 (val!5988 Int)) )
))
(declare-datatypes ((ValueCell!5600 0))(
  ( (ValueCellFull!5600 (v!8243 V!16955)) (EmptyCell!5600) )
))
(declare-datatypes ((array!27583 0))(
  ( (array!27584 (arr!13238 (Array (_ BitVec 32) ValueCell!5600)) (size!13590 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27583)

(declare-fun e!262296 () Bool)

(declare-fun array_inv!9598 (array!27583) Bool)

(assert (=> start!40522 (and (array_inv!9598 _values!549) e!262296)))

(declare-fun array_inv!9599 (array!27581) Bool)

(assert (=> start!40522 (array_inv!9599 _keys!709)))

(declare-fun b!446469 () Bool)

(declare-fun res!265000 () Bool)

(assert (=> b!446469 (=> (not res!265000) (not e!262294))))

(declare-datatypes ((List!7919 0))(
  ( (Nil!7916) (Cons!7915 (h!8771 (_ BitVec 64)) (t!13679 List!7919)) )
))
(declare-fun arrayNoDuplicates!0 (array!27581 (_ BitVec 32) List!7919) Bool)

(assert (=> b!446469 (= res!265000 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7916))))

(declare-fun b!446470 () Bool)

(declare-fun mapRes!19461 () Bool)

(assert (=> b!446470 (= e!262296 (and e!262292 mapRes!19461))))

(declare-fun condMapEmpty!19461 () Bool)

(declare-fun mapDefault!19461 () ValueCell!5600)

