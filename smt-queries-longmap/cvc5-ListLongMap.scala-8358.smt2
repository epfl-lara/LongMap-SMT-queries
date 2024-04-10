; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101730 () Bool)

(assert start!101730)

(declare-fun b_free!26419 () Bool)

(declare-fun b_next!26419 () Bool)

(assert (=> start!101730 (= b_free!26419 (not b_next!26419))))

(declare-fun tp!92302 () Bool)

(declare-fun b_and!44099 () Bool)

(assert (=> start!101730 (= tp!92302 b_and!44099)))

(declare-fun b!1224437 () Bool)

(declare-fun res!813639 () Bool)

(declare-fun e!695431 () Bool)

(assert (=> b!1224437 (=> (not res!813639) (not e!695431))))

(declare-datatypes ((array!79029 0))(
  ( (array!79030 (arr!38141 (Array (_ BitVec 32) (_ BitVec 64))) (size!38677 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79029)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79029 (_ BitVec 32)) Bool)

(assert (=> b!1224437 (= res!813639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224438 () Bool)

(declare-fun res!813624 () Bool)

(assert (=> b!1224438 (=> (not res!813624) (not e!695431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224438 (= res!813624 (validMask!0 mask!1564))))

(declare-fun b!1224439 () Bool)

(declare-fun res!813637 () Bool)

(assert (=> b!1224439 (=> (not res!813637) (not e!695431))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224439 (= res!813637 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38677 _keys!1208))))))

(declare-fun b!1224440 () Bool)

(declare-datatypes ((Unit!40569 0))(
  ( (Unit!40570) )
))
(declare-fun e!695425 () Unit!40569)

(declare-fun Unit!40571 () Unit!40569)

(assert (=> b!1224440 (= e!695425 Unit!40571)))

(declare-fun b!1224441 () Bool)

(declare-fun e!695433 () Bool)

(declare-fun e!695432 () Bool)

(assert (=> b!1224441 (= e!695433 (not e!695432))))

(declare-fun res!813633 () Bool)

(assert (=> b!1224441 (=> res!813633 e!695432)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1224441 (= res!813633 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224441 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!557518 () Unit!40569)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79029 (_ BitVec 64) (_ BitVec 32)) Unit!40569)

(assert (=> b!1224441 (= lt!557518 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1224442 () Bool)

(declare-fun e!695429 () Bool)

(declare-fun e!695428 () Bool)

(declare-fun mapRes!48583 () Bool)

(assert (=> b!1224442 (= e!695429 (and e!695428 mapRes!48583))))

(declare-fun condMapEmpty!48583 () Bool)

(declare-datatypes ((V!46625 0))(
  ( (V!46626 (val!15618 Int)) )
))
(declare-datatypes ((ValueCell!14852 0))(
  ( (ValueCellFull!14852 (v!18280 V!46625)) (EmptyCell!14852) )
))
(declare-datatypes ((array!79031 0))(
  ( (array!79032 (arr!38142 (Array (_ BitVec 32) ValueCell!14852)) (size!38678 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79031)

(declare-fun mapDefault!48583 () ValueCell!14852)

