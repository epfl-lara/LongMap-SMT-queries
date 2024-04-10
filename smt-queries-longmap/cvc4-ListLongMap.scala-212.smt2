; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3958 () Bool)

(assert start!3958)

(declare-fun b_free!863 () Bool)

(declare-fun b_next!863 () Bool)

(assert (=> start!3958 (= b_free!863 (not b_next!863))))

(declare-fun tp!4009 () Bool)

(declare-fun b_and!1673 () Bool)

(assert (=> start!3958 (= tp!4009 b_and!1673)))

(declare-fun b!28326 () Bool)

(declare-fun res!16860 () Bool)

(declare-fun e!18319 () Bool)

(assert (=> b!28326 (=> (not res!16860) (not e!18319))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1673 0))(
  ( (array!1674 (arr!790 (Array (_ BitVec 32) (_ BitVec 64))) (size!891 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1673)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((V!1447 0))(
  ( (V!1448 (val!635 Int)) )
))
(declare-datatypes ((ValueCell!409 0))(
  ( (ValueCellFull!409 (v!1724 V!1447)) (EmptyCell!409) )
))
(declare-datatypes ((array!1675 0))(
  ( (array!1676 (arr!791 (Array (_ BitVec 32) ValueCell!409)) (size!892 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1675)

(declare-fun zeroValue!1443 () V!1447)

(declare-fun minValue!1443 () V!1447)

(declare-datatypes ((tuple2!1058 0))(
  ( (tuple2!1059 (_1!540 (_ BitVec 64)) (_2!540 V!1447)) )
))
(declare-datatypes ((List!659 0))(
  ( (Nil!656) (Cons!655 (h!1222 tuple2!1058) (t!3352 List!659)) )
))
(declare-datatypes ((ListLongMap!635 0))(
  ( (ListLongMap!636 (toList!333 List!659)) )
))
(declare-fun contains!273 (ListLongMap!635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!163 (array!1673 array!1675 (_ BitVec 32) (_ BitVec 32) V!1447 V!1447 (_ BitVec 32) Int) ListLongMap!635)

(assert (=> b!28326 (= res!16860 (not (contains!273 (getCurrentListMap!163 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!28327 () Bool)

(declare-fun res!16864 () Bool)

(assert (=> b!28327 (=> (not res!16864) (not e!18319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28327 (= res!16864 (validKeyInArray!0 k!1304))))

(declare-fun b!28328 () Bool)

(declare-fun e!18323 () Bool)

(declare-fun tp_is_empty!1217 () Bool)

(assert (=> b!28328 (= e!18323 tp_is_empty!1217)))

(declare-fun b!28329 () Bool)

(declare-fun e!18321 () Bool)

(declare-fun mapRes!1354 () Bool)

(assert (=> b!28329 (= e!18321 (and e!18323 mapRes!1354))))

(declare-fun condMapEmpty!1354 () Bool)

(declare-fun mapDefault!1354 () ValueCell!409)

