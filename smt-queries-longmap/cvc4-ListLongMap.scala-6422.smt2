; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82332 () Bool)

(assert start!82332)

(declare-fun b_free!18599 () Bool)

(declare-fun b_next!18599 () Bool)

(assert (=> start!82332 (= b_free!18599 (not b_next!18599))))

(declare-fun tp!64766 () Bool)

(declare-fun b_and!30087 () Bool)

(assert (=> start!82332 (= tp!64766 b_and!30087)))

(declare-fun b!959909 () Bool)

(declare-fun res!642549 () Bool)

(declare-fun e!541106 () Bool)

(assert (=> b!959909 (=> (not res!642549) (not e!541106))))

(declare-datatypes ((array!58713 0))(
  ( (array!58714 (arr!28230 (Array (_ BitVec 32) (_ BitVec 64))) (size!28709 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58713)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959909 (= res!642549 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28709 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28709 _keys!1668))))))

(declare-fun b!959911 () Bool)

(declare-fun res!642550 () Bool)

(assert (=> b!959911 (=> (not res!642550) (not e!541106))))

(declare-datatypes ((List!19631 0))(
  ( (Nil!19628) (Cons!19627 (h!20789 (_ BitVec 64)) (t!27994 List!19631)) )
))
(declare-fun arrayNoDuplicates!0 (array!58713 (_ BitVec 32) List!19631) Bool)

(assert (=> b!959911 (= res!642550 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19628))))

(declare-fun b!959912 () Bool)

(declare-fun e!541107 () Bool)

(declare-fun e!541108 () Bool)

(declare-fun mapRes!33946 () Bool)

(assert (=> b!959912 (= e!541107 (and e!541108 mapRes!33946))))

(declare-fun condMapEmpty!33946 () Bool)

(declare-datatypes ((V!33397 0))(
  ( (V!33398 (val!10706 Int)) )
))
(declare-datatypes ((ValueCell!10174 0))(
  ( (ValueCellFull!10174 (v!13263 V!33397)) (EmptyCell!10174) )
))
(declare-datatypes ((array!58715 0))(
  ( (array!58716 (arr!28231 (Array (_ BitVec 32) ValueCell!10174)) (size!28710 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58715)

(declare-fun mapDefault!33946 () ValueCell!10174)

