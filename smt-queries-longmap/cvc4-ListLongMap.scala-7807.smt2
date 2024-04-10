; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97590 () Bool)

(assert start!97590)

(declare-fun b!1114743 () Bool)

(declare-fun e!635313 () Bool)

(declare-fun e!635311 () Bool)

(assert (=> b!1114743 (= e!635313 e!635311)))

(declare-fun res!744135 () Bool)

(assert (=> b!1114743 (=> (not res!744135) (not e!635311))))

(declare-datatypes ((array!72547 0))(
  ( (array!72548 (arr!34926 (Array (_ BitVec 32) (_ BitVec 64))) (size!35462 (_ BitVec 32))) )
))
(declare-fun lt!496874 () array!72547)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72547 (_ BitVec 32)) Bool)

(assert (=> b!1114743 (= res!744135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496874 mask!1564))))

(declare-fun _keys!1208 () array!72547)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114743 (= lt!496874 (array!72548 (store (arr!34926 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35462 _keys!1208)))))

(declare-fun b!1114744 () Bool)

(declare-fun res!744142 () Bool)

(assert (=> b!1114744 (=> (not res!744142) (not e!635313))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114744 (= res!744142 (validKeyInArray!0 k!934))))

(declare-fun b!1114745 () Bool)

(declare-fun e!635309 () Bool)

(declare-fun e!635308 () Bool)

(declare-fun mapRes!43549 () Bool)

(assert (=> b!1114745 (= e!635309 (and e!635308 mapRes!43549))))

(declare-fun condMapEmpty!43549 () Bool)

(declare-datatypes ((V!42221 0))(
  ( (V!42222 (val!13967 Int)) )
))
(declare-datatypes ((ValueCell!13201 0))(
  ( (ValueCellFull!13201 (v!16600 V!42221)) (EmptyCell!13201) )
))
(declare-datatypes ((array!72549 0))(
  ( (array!72550 (arr!34927 (Array (_ BitVec 32) ValueCell!13201)) (size!35463 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72549)

(declare-fun mapDefault!43549 () ValueCell!13201)

