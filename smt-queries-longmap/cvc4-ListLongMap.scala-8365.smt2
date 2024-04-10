; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101776 () Bool)

(assert start!101776)

(declare-fun b_free!26465 () Bool)

(declare-fun b_next!26465 () Bool)

(assert (=> start!101776 (= b_free!26465 (not b_next!26465))))

(declare-fun tp!92441 () Bool)

(declare-fun b_and!44191 () Bool)

(assert (=> start!101776 (= tp!92441 b_and!44191)))

(declare-fun b!1225800 () Bool)

(declare-fun e!696198 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((V!46685 0))(
  ( (V!46686 (val!15641 Int)) )
))
(declare-datatypes ((ValueCell!14875 0))(
  ( (ValueCellFull!14875 (v!18303 V!46685)) (EmptyCell!14875) )
))
(declare-datatypes ((array!79117 0))(
  ( (array!79118 (arr!38185 (Array (_ BitVec 32) ValueCell!14875)) (size!38721 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79117)

(assert (=> b!1225800 (= e!696198 (bvslt i!673 (size!38721 _values!996)))))

(declare-fun b!1225801 () Bool)

(declare-fun res!814638 () Bool)

(declare-fun e!696202 () Bool)

(assert (=> b!1225801 (=> (not res!814638) (not e!696202))))

(declare-datatypes ((array!79119 0))(
  ( (array!79120 (arr!38186 (Array (_ BitVec 32) (_ BitVec 64))) (size!38722 (_ BitVec 32))) )
))
(declare-fun lt!558580 () array!79119)

(declare-datatypes ((List!26963 0))(
  ( (Nil!26960) (Cons!26959 (h!28168 (_ BitVec 64)) (t!40408 List!26963)) )
))
(declare-fun arrayNoDuplicates!0 (array!79119 (_ BitVec 32) List!26963) Bool)

(assert (=> b!1225801 (= res!814638 (arrayNoDuplicates!0 lt!558580 #b00000000000000000000000000000000 Nil!26960))))

(declare-fun b!1225802 () Bool)

(declare-fun res!814631 () Bool)

(declare-fun e!696205 () Bool)

(assert (=> b!1225802 (=> (not res!814631) (not e!696205))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun _keys!1208 () array!79119)

(assert (=> b!1225802 (= res!814631 (and (= (size!38721 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38722 _keys!1208) (size!38721 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225803 () Bool)

(declare-fun e!696201 () Bool)

(declare-fun e!696200 () Bool)

(declare-fun mapRes!48652 () Bool)

(assert (=> b!1225803 (= e!696201 (and e!696200 mapRes!48652))))

(declare-fun condMapEmpty!48652 () Bool)

(declare-fun mapDefault!48652 () ValueCell!14875)

