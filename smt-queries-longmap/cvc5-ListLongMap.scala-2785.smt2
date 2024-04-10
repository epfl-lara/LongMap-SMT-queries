; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40598 () Bool)

(assert start!40598)

(declare-fun b_free!10609 () Bool)

(declare-fun b_next!10609 () Bool)

(assert (=> start!40598 (= b_free!10609 (not b_next!10609))))

(declare-fun tp!37647 () Bool)

(declare-fun b_and!18617 () Bool)

(assert (=> start!40598 (= tp!37647 b_and!18617)))

(declare-fun b!447872 () Bool)

(declare-fun res!266086 () Bool)

(declare-fun e!262901 () Bool)

(assert (=> b!447872 (=> (not res!266086) (not e!262901))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27701 0))(
  ( (array!27702 (arr!13296 (Array (_ BitVec 32) (_ BitVec 64))) (size!13648 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27701)

(assert (=> b!447872 (= res!266086 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13648 _keys!709))))))

(declare-fun mapIsEmpty!19554 () Bool)

(declare-fun mapRes!19554 () Bool)

(assert (=> mapIsEmpty!19554 mapRes!19554))

(declare-fun b!447874 () Bool)

(declare-fun e!262900 () Bool)

(assert (=> b!447874 (= e!262901 e!262900)))

(declare-fun res!266091 () Bool)

(assert (=> b!447874 (=> (not res!266091) (not e!262900))))

(declare-fun lt!204052 () array!27701)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27701 (_ BitVec 32)) Bool)

(assert (=> b!447874 (= res!266091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204052 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!447874 (= lt!204052 (array!27702 (store (arr!13296 _keys!709) i!563 k!794) (size!13648 _keys!709)))))

(declare-fun b!447875 () Bool)

(declare-fun res!266089 () Bool)

(assert (=> b!447875 (=> (not res!266089) (not e!262901))))

(assert (=> b!447875 (= res!266089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447876 () Bool)

(declare-fun res!266082 () Bool)

(assert (=> b!447876 (=> (not res!266082) (not e!262901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447876 (= res!266082 (validMask!0 mask!1025))))

(declare-fun b!447877 () Bool)

(declare-fun e!262904 () Bool)

(declare-fun e!262903 () Bool)

(assert (=> b!447877 (= e!262904 (and e!262903 mapRes!19554))))

(declare-fun condMapEmpty!19554 () Bool)

(declare-datatypes ((V!17035 0))(
  ( (V!17036 (val!6018 Int)) )
))
(declare-datatypes ((ValueCell!5630 0))(
  ( (ValueCellFull!5630 (v!8273 V!17035)) (EmptyCell!5630) )
))
(declare-datatypes ((array!27703 0))(
  ( (array!27704 (arr!13297 (Array (_ BitVec 32) ValueCell!5630)) (size!13649 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27703)

(declare-fun mapDefault!19554 () ValueCell!5630)

