; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40448 () Bool)

(assert start!40448)

(declare-fun res!264040 () Bool)

(declare-fun e!261674 () Bool)

(assert (=> start!40448 (=> (not res!264040) (not e!261674))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27473 0))(
  ( (array!27474 (arr!13184 (Array (_ BitVec 32) (_ BitVec 64))) (size!13536 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27473)

(assert (=> start!40448 (= res!264040 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13536 _keys!709))))))

(assert (=> start!40448 e!261674))

(assert (=> start!40448 true))

(declare-datatypes ((V!16883 0))(
  ( (V!16884 (val!5961 Int)) )
))
(declare-datatypes ((ValueCell!5573 0))(
  ( (ValueCellFull!5573 (v!8212 V!16883)) (EmptyCell!5573) )
))
(declare-datatypes ((array!27475 0))(
  ( (array!27476 (arr!13185 (Array (_ BitVec 32) ValueCell!5573)) (size!13537 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27475)

(declare-fun e!261673 () Bool)

(declare-fun array_inv!9558 (array!27475) Bool)

(assert (=> start!40448 (and (array_inv!9558 _values!549) e!261673)))

(declare-fun array_inv!9559 (array!27473) Bool)

(assert (=> start!40448 (array_inv!9559 _keys!709)))

(declare-fun b!445082 () Bool)

(declare-fun res!264038 () Bool)

(assert (=> b!445082 (=> (not res!264038) (not e!261674))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27473 (_ BitVec 32)) Bool)

(assert (=> b!445082 (= res!264038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445083 () Bool)

(declare-fun e!261670 () Bool)

(assert (=> b!445083 (= e!261674 e!261670)))

(declare-fun res!264032 () Bool)

(assert (=> b!445083 (=> (not res!264032) (not e!261670))))

(declare-fun lt!203591 () array!27473)

(assert (=> b!445083 (= res!264032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203591 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445083 (= lt!203591 (array!27474 (store (arr!13184 _keys!709) i!563 k!794) (size!13536 _keys!709)))))

(declare-fun b!445084 () Bool)

(declare-fun res!264037 () Bool)

(assert (=> b!445084 (=> (not res!264037) (not e!261674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445084 (= res!264037 (validKeyInArray!0 k!794))))

(declare-fun b!445085 () Bool)

(declare-fun e!261672 () Bool)

(declare-fun mapRes!19377 () Bool)

(assert (=> b!445085 (= e!261673 (and e!261672 mapRes!19377))))

(declare-fun condMapEmpty!19377 () Bool)

(declare-fun mapDefault!19377 () ValueCell!5573)

