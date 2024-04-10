; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97668 () Bool)

(assert start!97668)

(declare-fun b!1116264 () Bool)

(declare-fun e!636012 () Bool)

(declare-fun tp_is_empty!27899 () Bool)

(assert (=> b!1116264 (= e!636012 tp_is_empty!27899)))

(declare-fun b!1116265 () Bool)

(declare-fun res!745304 () Bool)

(declare-fun e!636015 () Bool)

(assert (=> b!1116265 (=> (not res!745304) (not e!636015))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116265 (= res!745304 (validKeyInArray!0 k!934))))

(declare-fun b!1116266 () Bool)

(declare-fun res!745306 () Bool)

(assert (=> b!1116266 (=> (not res!745306) (not e!636015))))

(declare-datatypes ((array!72695 0))(
  ( (array!72696 (arr!35000 (Array (_ BitVec 32) (_ BitVec 64))) (size!35536 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72695)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72695 (_ BitVec 32)) Bool)

(assert (=> b!1116266 (= res!745306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116267 () Bool)

(declare-fun e!636011 () Bool)

(declare-fun e!636014 () Bool)

(declare-fun mapRes!43666 () Bool)

(assert (=> b!1116267 (= e!636011 (and e!636014 mapRes!43666))))

(declare-fun condMapEmpty!43666 () Bool)

(declare-datatypes ((V!42325 0))(
  ( (V!42326 (val!14006 Int)) )
))
(declare-datatypes ((ValueCell!13240 0))(
  ( (ValueCellFull!13240 (v!16639 V!42325)) (EmptyCell!13240) )
))
(declare-datatypes ((array!72697 0))(
  ( (array!72698 (arr!35001 (Array (_ BitVec 32) ValueCell!13240)) (size!35537 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72697)

(declare-fun mapDefault!43666 () ValueCell!13240)

