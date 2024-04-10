; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110522 () Bool)

(assert start!110522)

(declare-fun b_free!29357 () Bool)

(declare-fun b_next!29357 () Bool)

(assert (=> start!110522 (= b_free!29357 (not b_next!29357))))

(declare-fun tp!103393 () Bool)

(declare-fun b_and!47565 () Bool)

(assert (=> start!110522 (= tp!103393 b_and!47565)))

(declare-fun mapIsEmpty!54259 () Bool)

(declare-fun mapRes!54259 () Bool)

(assert (=> mapIsEmpty!54259 mapRes!54259))

(declare-fun b!1307423 () Bool)

(declare-fun res!867864 () Bool)

(declare-fun e!746041 () Bool)

(assert (=> b!1307423 (=> (not res!867864) (not e!746041))))

(declare-datatypes ((array!87176 0))(
  ( (array!87177 (arr!42068 (Array (_ BitVec 32) (_ BitVec 64))) (size!42618 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87176)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307423 (= res!867864 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42618 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307424 () Bool)

(declare-fun e!746040 () Bool)

(declare-fun tp_is_empty!35087 () Bool)

(assert (=> b!1307424 (= e!746040 tp_is_empty!35087)))

(declare-fun b!1307425 () Bool)

(declare-fun e!746039 () Bool)

(declare-fun e!746042 () Bool)

(assert (=> b!1307425 (= e!746039 (and e!746042 mapRes!54259))))

(declare-fun condMapEmpty!54259 () Bool)

(declare-datatypes ((V!51885 0))(
  ( (V!51886 (val!17618 Int)) )
))
(declare-datatypes ((ValueCell!16645 0))(
  ( (ValueCellFull!16645 (v!20245 V!51885)) (EmptyCell!16645) )
))
(declare-datatypes ((array!87178 0))(
  ( (array!87179 (arr!42069 (Array (_ BitVec 32) ValueCell!16645)) (size!42619 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87178)

(declare-fun mapDefault!54259 () ValueCell!16645)

