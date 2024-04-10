; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101170 () Bool)

(assert start!101170)

(declare-fun b_free!26093 () Bool)

(declare-fun b_next!26093 () Bool)

(assert (=> start!101170 (= b_free!26093 (not b_next!26093))))

(declare-fun tp!91301 () Bool)

(declare-fun b_and!43303 () Bool)

(assert (=> start!101170 (= tp!91301 b_and!43303)))

(declare-fun mapIsEmpty!48070 () Bool)

(declare-fun mapRes!48070 () Bool)

(assert (=> mapIsEmpty!48070 mapRes!48070))

(declare-fun b!1214304 () Bool)

(declare-datatypes ((Unit!40274 0))(
  ( (Unit!40275) )
))
(declare-fun e!689611 () Unit!40274)

(declare-fun e!689599 () Unit!40274)

(assert (=> b!1214304 (= e!689611 e!689599)))

(declare-fun c!120043 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!552301 () Bool)

(assert (=> b!1214304 (= c!120043 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!552301))))

(declare-fun b!1214305 () Bool)

(declare-fun e!689604 () Bool)

(declare-fun e!689600 () Bool)

(assert (=> b!1214305 (= e!689604 (and e!689600 mapRes!48070))))

(declare-fun condMapEmpty!48070 () Bool)

(declare-datatypes ((V!46189 0))(
  ( (V!46190 (val!15455 Int)) )
))
(declare-datatypes ((ValueCell!14689 0))(
  ( (ValueCellFull!14689 (v!18108 V!46189)) (EmptyCell!14689) )
))
(declare-datatypes ((array!78381 0))(
  ( (array!78382 (arr!37825 (Array (_ BitVec 32) ValueCell!14689)) (size!38361 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78381)

(declare-fun mapDefault!48070 () ValueCell!14689)

