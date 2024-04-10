; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82256 () Bool)

(assert start!82256)

(declare-fun b_free!18529 () Bool)

(declare-fun b_next!18529 () Bool)

(assert (=> start!82256 (= b_free!18529 (not b_next!18529))))

(declare-fun tp!64548 () Bool)

(declare-fun b_and!30017 () Bool)

(assert (=> start!82256 (= tp!64548 b_and!30017)))

(declare-fun b!958822 () Bool)

(declare-fun res!641803 () Bool)

(declare-fun e!540540 () Bool)

(assert (=> b!958822 (=> (not res!641803) (not e!540540))))

(declare-datatypes ((array!58569 0))(
  ( (array!58570 (arr!28158 (Array (_ BitVec 32) (_ BitVec 64))) (size!28637 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58569)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958822 (= res!641803 (validKeyInArray!0 (select (arr!28158 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33832 () Bool)

(declare-fun mapRes!33832 () Bool)

(assert (=> mapIsEmpty!33832 mapRes!33832))

(declare-fun b!958823 () Bool)

(declare-fun res!641804 () Bool)

(assert (=> b!958823 (=> (not res!641804) (not e!540540))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58569 (_ BitVec 32)) Bool)

(assert (=> b!958823 (= res!641804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958824 () Bool)

(declare-fun e!540538 () Bool)

(declare-fun tp_is_empty!21235 () Bool)

(assert (=> b!958824 (= e!540538 tp_is_empty!21235)))

(declare-fun b!958825 () Bool)

(declare-fun res!641807 () Bool)

(assert (=> b!958825 (=> (not res!641807) (not e!540540))))

(declare-datatypes ((V!33297 0))(
  ( (V!33298 (val!10668 Int)) )
))
(declare-fun minValue!1328 () V!33297)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10136 0))(
  ( (ValueCellFull!10136 (v!13225 V!33297)) (EmptyCell!10136) )
))
(declare-datatypes ((array!58571 0))(
  ( (array!58572 (arr!28159 (Array (_ BitVec 32) ValueCell!10136)) (size!28638 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58571)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33297)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13754 0))(
  ( (tuple2!13755 (_1!6888 (_ BitVec 64)) (_2!6888 V!33297)) )
))
(declare-datatypes ((List!19575 0))(
  ( (Nil!19572) (Cons!19571 (h!20733 tuple2!13754) (t!27938 List!19575)) )
))
(declare-datatypes ((ListLongMap!12451 0))(
  ( (ListLongMap!12452 (toList!6241 List!19575)) )
))
(declare-fun contains!5342 (ListLongMap!12451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3474 (array!58569 array!58571 (_ BitVec 32) (_ BitVec 32) V!33297 V!33297 (_ BitVec 32) Int) ListLongMap!12451)

(assert (=> b!958825 (= res!641807 (contains!5342 (getCurrentListMap!3474 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28158 _keys!1668) i!793)))))

(declare-fun b!958826 () Bool)

(declare-fun e!540537 () Bool)

(assert (=> b!958826 (= e!540537 tp_is_empty!21235)))

(declare-fun b!958827 () Bool)

(declare-fun e!540536 () Bool)

(assert (=> b!958827 (= e!540536 (and e!540537 mapRes!33832))))

(declare-fun condMapEmpty!33832 () Bool)

(declare-fun mapDefault!33832 () ValueCell!10136)

