; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101772 () Bool)

(assert start!101772)

(declare-fun b_free!26461 () Bool)

(declare-fun b_next!26461 () Bool)

(assert (=> start!101772 (= b_free!26461 (not b_next!26461))))

(declare-fun tp!92428 () Bool)

(declare-fun b_and!44183 () Bool)

(assert (=> start!101772 (= tp!92428 b_and!44183)))

(declare-fun b!1225700 () Bool)

(declare-fun res!814563 () Bool)

(declare-fun e!696149 () Bool)

(assert (=> b!1225700 (=> (not res!814563) (not e!696149))))

(declare-datatypes ((array!79109 0))(
  ( (array!79110 (arr!38181 (Array (_ BitVec 32) (_ BitVec 64))) (size!38717 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79109)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46681 0))(
  ( (V!46682 (val!15639 Int)) )
))
(declare-datatypes ((ValueCell!14873 0))(
  ( (ValueCellFull!14873 (v!18301 V!46681)) (EmptyCell!14873) )
))
(declare-datatypes ((array!79111 0))(
  ( (array!79112 (arr!38182 (Array (_ BitVec 32) ValueCell!14873)) (size!38718 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79111)

(assert (=> b!1225700 (= res!814563 (and (= (size!38718 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38717 _keys!1208) (size!38718 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225701 () Bool)

(declare-fun res!814552 () Bool)

(assert (=> b!1225701 (=> (not res!814552) (not e!696149))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225701 (= res!814552 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38717 _keys!1208))))))

(declare-fun mapIsEmpty!48646 () Bool)

(declare-fun mapRes!48646 () Bool)

(assert (=> mapIsEmpty!48646 mapRes!48646))

(declare-fun b!1225702 () Bool)

(declare-fun res!814562 () Bool)

(declare-fun e!696148 () Bool)

(assert (=> b!1225702 (=> (not res!814562) (not e!696148))))

(declare-fun lt!558548 () array!79109)

(declare-datatypes ((List!26960 0))(
  ( (Nil!26957) (Cons!26956 (h!28165 (_ BitVec 64)) (t!40401 List!26960)) )
))
(declare-fun arrayNoDuplicates!0 (array!79109 (_ BitVec 32) List!26960) Bool)

(assert (=> b!1225702 (= res!814562 (arrayNoDuplicates!0 lt!558548 #b00000000000000000000000000000000 Nil!26957))))

(declare-fun b!1225703 () Bool)

(declare-fun res!814555 () Bool)

(assert (=> b!1225703 (=> (not res!814555) (not e!696149))))

(assert (=> b!1225703 (= res!814555 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26957))))

(declare-fun b!1225704 () Bool)

(declare-fun e!696145 () Bool)

(declare-fun e!696150 () Bool)

(assert (=> b!1225704 (= e!696145 (and e!696150 mapRes!48646))))

(declare-fun condMapEmpty!48646 () Bool)

(declare-fun mapDefault!48646 () ValueCell!14873)

