; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99464 () Bool)

(assert start!99464)

(declare-fun b_free!25043 () Bool)

(declare-fun b_next!25043 () Bool)

(assert (=> start!99464 (= b_free!25043 (not b_next!25043))))

(declare-fun tp!87843 () Bool)

(declare-fun b_and!40953 () Bool)

(assert (=> start!99464 (= tp!87843 b_and!40953)))

(declare-fun b!1175277 () Bool)

(declare-fun e!668051 () Bool)

(declare-fun e!668061 () Bool)

(assert (=> b!1175277 (= e!668051 e!668061)))

(declare-fun res!780533 () Bool)

(assert (=> b!1175277 (=> (not res!780533) (not e!668061))))

(declare-datatypes ((array!75957 0))(
  ( (array!75958 (arr!36628 (Array (_ BitVec 32) (_ BitVec 64))) (size!37164 (_ BitVec 32))) )
))
(declare-fun lt!530181 () array!75957)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75957 (_ BitVec 32)) Bool)

(assert (=> b!1175277 (= res!780533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530181 mask!1564))))

(declare-fun _keys!1208 () array!75957)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175277 (= lt!530181 (array!75958 (store (arr!36628 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37164 _keys!1208)))))

(declare-fun mapIsEmpty!46187 () Bool)

(declare-fun mapRes!46187 () Bool)

(assert (=> mapIsEmpty!46187 mapRes!46187))

(declare-fun b!1175278 () Bool)

(declare-fun res!780530 () Bool)

(assert (=> b!1175278 (=> (not res!780530) (not e!668051))))

(assert (=> b!1175278 (= res!780530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46187 () Bool)

(declare-fun tp!87842 () Bool)

(declare-fun e!668060 () Bool)

(assert (=> mapNonEmpty!46187 (= mapRes!46187 (and tp!87842 e!668060))))

(declare-fun mapKey!46187 () (_ BitVec 32))

(declare-datatypes ((V!44557 0))(
  ( (V!44558 (val!14843 Int)) )
))
(declare-datatypes ((ValueCell!14077 0))(
  ( (ValueCellFull!14077 (v!17481 V!44557)) (EmptyCell!14077) )
))
(declare-datatypes ((array!75959 0))(
  ( (array!75960 (arr!36629 (Array (_ BitVec 32) ValueCell!14077)) (size!37165 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75959)

(declare-fun mapRest!46187 () (Array (_ BitVec 32) ValueCell!14077))

(declare-fun mapValue!46187 () ValueCell!14077)

(assert (=> mapNonEmpty!46187 (= (arr!36629 _values!996) (store mapRest!46187 mapKey!46187 mapValue!46187))))

(declare-fun b!1175280 () Bool)

(declare-fun res!780538 () Bool)

(assert (=> b!1175280 (=> (not res!780538) (not e!668051))))

(assert (=> b!1175280 (= res!780538 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37164 _keys!1208))))))

(declare-fun b!1175281 () Bool)

(declare-fun res!780534 () Bool)

(assert (=> b!1175281 (=> (not res!780534) (not e!668051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175281 (= res!780534 (validMask!0 mask!1564))))

(declare-fun b!1175282 () Bool)

(declare-fun res!780532 () Bool)

(assert (=> b!1175282 (=> (not res!780532) (not e!668051))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1175282 (= res!780532 (and (= (size!37165 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37164 _keys!1208) (size!37165 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175283 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!668056 () Bool)

(declare-fun arrayContainsKey!0 (array!75957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175283 (= e!668056 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1175284 () Bool)

(declare-fun e!668053 () Bool)

(declare-fun e!668055 () Bool)

(assert (=> b!1175284 (= e!668053 (and e!668055 mapRes!46187))))

(declare-fun condMapEmpty!46187 () Bool)

(declare-fun mapDefault!46187 () ValueCell!14077)

