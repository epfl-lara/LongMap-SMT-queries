; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82334 () Bool)

(assert start!82334)

(declare-fun b_free!18601 () Bool)

(declare-fun b_next!18601 () Bool)

(assert (=> start!82334 (= b_free!18601 (not b_next!18601))))

(declare-fun tp!64772 () Bool)

(declare-fun b_and!30089 () Bool)

(assert (=> start!82334 (= tp!64772 b_and!30089)))

(declare-fun mapIsEmpty!33949 () Bool)

(declare-fun mapRes!33949 () Bool)

(assert (=> mapIsEmpty!33949 mapRes!33949))

(declare-fun b!959936 () Bool)

(declare-fun res!642569 () Bool)

(declare-fun e!541121 () Bool)

(assert (=> b!959936 (=> (not res!642569) (not e!541121))))

(declare-datatypes ((array!58717 0))(
  ( (array!58718 (arr!28232 (Array (_ BitVec 32) (_ BitVec 64))) (size!28711 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58717)

(declare-datatypes ((List!19632 0))(
  ( (Nil!19629) (Cons!19628 (h!20790 (_ BitVec 64)) (t!27995 List!19632)) )
))
(declare-fun arrayNoDuplicates!0 (array!58717 (_ BitVec 32) List!19632) Bool)

(assert (=> b!959936 (= res!642569 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19629))))

(declare-fun b!959937 () Bool)

(declare-fun e!541123 () Bool)

(declare-fun e!541124 () Bool)

(assert (=> b!959937 (= e!541123 (and e!541124 mapRes!33949))))

(declare-fun condMapEmpty!33949 () Bool)

(declare-datatypes ((V!33401 0))(
  ( (V!33402 (val!10707 Int)) )
))
(declare-datatypes ((ValueCell!10175 0))(
  ( (ValueCellFull!10175 (v!13264 V!33401)) (EmptyCell!10175) )
))
(declare-datatypes ((array!58719 0))(
  ( (array!58720 (arr!28233 (Array (_ BitVec 32) ValueCell!10175)) (size!28712 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58719)

(declare-fun mapDefault!33949 () ValueCell!10175)

