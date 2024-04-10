; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3928 () Bool)

(assert start!3928)

(declare-fun b_free!833 () Bool)

(declare-fun b_next!833 () Bool)

(assert (=> start!3928 (= b_free!833 (not b_next!833))))

(declare-fun tp!3918 () Bool)

(declare-fun b_and!1643 () Bool)

(assert (=> start!3928 (= tp!3918 b_and!1643)))

(declare-fun res!16550 () Bool)

(declare-fun e!18098 () Bool)

(assert (=> start!3928 (=> (not res!16550) (not e!18098))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3928 (= res!16550 (validMask!0 mask!2294))))

(assert (=> start!3928 e!18098))

(assert (=> start!3928 true))

(assert (=> start!3928 tp!3918))

(declare-datatypes ((V!1407 0))(
  ( (V!1408 (val!620 Int)) )
))
(declare-datatypes ((ValueCell!394 0))(
  ( (ValueCellFull!394 (v!1709 V!1407)) (EmptyCell!394) )
))
(declare-datatypes ((array!1615 0))(
  ( (array!1616 (arr!761 (Array (_ BitVec 32) ValueCell!394)) (size!862 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1615)

(declare-fun e!18096 () Bool)

(declare-fun array_inv!523 (array!1615) Bool)

(assert (=> start!3928 (and (array_inv!523 _values!1501) e!18096)))

(declare-datatypes ((array!1617 0))(
  ( (array!1618 (arr!762 (Array (_ BitVec 32) (_ BitVec 64))) (size!863 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1617)

(declare-fun array_inv!524 (array!1617) Bool)

(assert (=> start!3928 (array_inv!524 _keys!1833)))

(declare-fun tp_is_empty!1187 () Bool)

(assert (=> start!3928 tp_is_empty!1187))

(declare-fun mapIsEmpty!1309 () Bool)

(declare-fun mapRes!1309 () Bool)

(assert (=> mapIsEmpty!1309 mapRes!1309))

(declare-fun b!27876 () Bool)

(declare-fun e!18095 () Bool)

(assert (=> b!27876 (= e!18095 tp_is_empty!1187)))

(declare-fun b!27877 () Bool)

(declare-fun res!16548 () Bool)

(assert (=> b!27877 (=> (not res!16548) (not e!18098))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1407)

(declare-fun minValue!1443 () V!1407)

(declare-datatypes ((tuple2!1038 0))(
  ( (tuple2!1039 (_1!530 (_ BitVec 64)) (_2!530 V!1407)) )
))
(declare-datatypes ((List!640 0))(
  ( (Nil!637) (Cons!636 (h!1203 tuple2!1038) (t!3333 List!640)) )
))
(declare-datatypes ((ListLongMap!615 0))(
  ( (ListLongMap!616 (toList!323 List!640)) )
))
(declare-fun contains!263 (ListLongMap!615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!153 (array!1617 array!1615 (_ BitVec 32) (_ BitVec 32) V!1407 V!1407 (_ BitVec 32) Int) ListLongMap!615)

(assert (=> b!27877 (= res!16548 (not (contains!263 (getCurrentListMap!153 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!27878 () Bool)

(declare-fun e!18094 () Bool)

(assert (=> b!27878 (= e!18096 (and e!18094 mapRes!1309))))

(declare-fun condMapEmpty!1309 () Bool)

(declare-fun mapDefault!1309 () ValueCell!394)

