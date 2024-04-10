; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82374 () Bool)

(assert start!82374)

(declare-fun b_free!18641 () Bool)

(declare-fun b_next!18641 () Bool)

(assert (=> start!82374 (= b_free!18641 (not b_next!18641))))

(declare-fun tp!64892 () Bool)

(declare-fun b_and!30129 () Bool)

(assert (=> start!82374 (= tp!64892 b_and!30129)))

(declare-fun b!960476 () Bool)

(declare-fun res!642927 () Bool)

(declare-fun e!541422 () Bool)

(assert (=> b!960476 (=> (not res!642927) (not e!541422))))

(declare-datatypes ((array!58795 0))(
  ( (array!58796 (arr!28271 (Array (_ BitVec 32) (_ BitVec 64))) (size!28750 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58795)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960476 (= res!642927 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28750 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28750 _keys!1668))))))

(declare-fun res!642928 () Bool)

(assert (=> start!82374 (=> (not res!642928) (not e!541422))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82374 (= res!642928 (validMask!0 mask!2088))))

(assert (=> start!82374 e!541422))

(assert (=> start!82374 true))

(declare-fun tp_is_empty!21353 () Bool)

(assert (=> start!82374 tp_is_empty!21353))

(declare-fun array_inv!21907 (array!58795) Bool)

(assert (=> start!82374 (array_inv!21907 _keys!1668)))

(declare-datatypes ((V!33453 0))(
  ( (V!33454 (val!10727 Int)) )
))
(declare-datatypes ((ValueCell!10195 0))(
  ( (ValueCellFull!10195 (v!13284 V!33453)) (EmptyCell!10195) )
))
(declare-datatypes ((array!58797 0))(
  ( (array!58798 (arr!28272 (Array (_ BitVec 32) ValueCell!10195)) (size!28751 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58797)

(declare-fun e!541424 () Bool)

(declare-fun array_inv!21908 (array!58797) Bool)

(assert (=> start!82374 (and (array_inv!21908 _values!1386) e!541424)))

(assert (=> start!82374 tp!64892))

(declare-fun b!960477 () Bool)

(declare-fun res!642929 () Bool)

(assert (=> b!960477 (=> (not res!642929) (not e!541422))))

(declare-datatypes ((List!19660 0))(
  ( (Nil!19657) (Cons!19656 (h!20818 (_ BitVec 64)) (t!28023 List!19660)) )
))
(declare-fun arrayNoDuplicates!0 (array!58795 (_ BitVec 32) List!19660) Bool)

(assert (=> b!960477 (= res!642929 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19657))))

(declare-fun b!960478 () Bool)

(declare-fun e!541425 () Bool)

(declare-fun mapRes!34009 () Bool)

(assert (=> b!960478 (= e!541424 (and e!541425 mapRes!34009))))

(declare-fun condMapEmpty!34009 () Bool)

(declare-fun mapDefault!34009 () ValueCell!10195)

