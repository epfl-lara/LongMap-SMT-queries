; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110512 () Bool)

(assert start!110512)

(declare-fun b_free!29347 () Bool)

(declare-fun b_next!29347 () Bool)

(assert (=> start!110512 (= b_free!29347 (not b_next!29347))))

(declare-fun tp!103362 () Bool)

(declare-fun b_and!47555 () Bool)

(assert (=> start!110512 (= tp!103362 b_and!47555)))

(declare-fun b!1307303 () Bool)

(declare-fun e!745967 () Bool)

(declare-fun tp_is_empty!35077 () Bool)

(assert (=> b!1307303 (= e!745967 tp_is_empty!35077)))

(declare-fun mapNonEmpty!54244 () Bool)

(declare-fun mapRes!54244 () Bool)

(declare-fun tp!103363 () Bool)

(assert (=> mapNonEmpty!54244 (= mapRes!54244 (and tp!103363 e!745967))))

(declare-fun mapKey!54244 () (_ BitVec 32))

(declare-datatypes ((V!51873 0))(
  ( (V!51874 (val!17613 Int)) )
))
(declare-datatypes ((ValueCell!16640 0))(
  ( (ValueCellFull!16640 (v!20240 V!51873)) (EmptyCell!16640) )
))
(declare-fun mapRest!54244 () (Array (_ BitVec 32) ValueCell!16640))

(declare-fun mapValue!54244 () ValueCell!16640)

(declare-datatypes ((array!87158 0))(
  ( (array!87159 (arr!42059 (Array (_ BitVec 32) ValueCell!16640)) (size!42609 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87158)

(assert (=> mapNonEmpty!54244 (= (arr!42059 _values!1354) (store mapRest!54244 mapKey!54244 mapValue!54244))))

(declare-fun mapIsEmpty!54244 () Bool)

(assert (=> mapIsEmpty!54244 mapRes!54244))

(declare-fun b!1307304 () Bool)

(declare-fun res!867787 () Bool)

(declare-fun e!745964 () Bool)

(assert (=> b!1307304 (=> (not res!867787) (not e!745964))))

(declare-datatypes ((array!87160 0))(
  ( (array!87161 (arr!42060 (Array (_ BitVec 32) (_ BitVec 64))) (size!42610 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87160)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307304 (= res!867787 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42610 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307305 () Bool)

(declare-fun e!745966 () Bool)

(declare-fun e!745963 () Bool)

(assert (=> b!1307305 (= e!745966 (and e!745963 mapRes!54244))))

(declare-fun condMapEmpty!54244 () Bool)

(declare-fun mapDefault!54244 () ValueCell!16640)

