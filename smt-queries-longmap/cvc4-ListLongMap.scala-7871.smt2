; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97974 () Bool)

(assert start!97974)

(declare-fun b_free!23675 () Bool)

(declare-fun b_next!23675 () Bool)

(assert (=> start!97974 (= b_free!23675 (not b_next!23675))))

(declare-fun tp!83728 () Bool)

(declare-fun b_and!38133 () Bool)

(assert (=> start!97974 (= tp!83728 b_and!38133)))

(declare-fun b!1123301 () Bool)

(declare-fun res!750479 () Bool)

(declare-fun e!639498 () Bool)

(assert (=> b!1123301 (=> (not res!750479) (not e!639498))))

(declare-datatypes ((array!73281 0))(
  ( (array!73282 (arr!35293 (Array (_ BitVec 32) (_ BitVec 64))) (size!35829 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73281)

(declare-datatypes ((List!24562 0))(
  ( (Nil!24559) (Cons!24558 (h!25767 (_ BitVec 64)) (t!35229 List!24562)) )
))
(declare-fun arrayNoDuplicates!0 (array!73281 (_ BitVec 32) List!24562) Bool)

(assert (=> b!1123301 (= res!750479 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24559))))

(declare-fun b!1123302 () Bool)

(declare-fun e!639507 () Bool)

(declare-fun tp_is_empty!28205 () Bool)

(assert (=> b!1123302 (= e!639507 tp_is_empty!28205)))

(declare-fun b!1123303 () Bool)

(declare-fun e!639499 () Bool)

(declare-fun e!639506 () Bool)

(declare-fun mapRes!44125 () Bool)

(assert (=> b!1123303 (= e!639499 (and e!639506 mapRes!44125))))

(declare-fun condMapEmpty!44125 () Bool)

(declare-datatypes ((V!42733 0))(
  ( (V!42734 (val!14159 Int)) )
))
(declare-datatypes ((ValueCell!13393 0))(
  ( (ValueCellFull!13393 (v!16792 V!42733)) (EmptyCell!13393) )
))
(declare-datatypes ((array!73283 0))(
  ( (array!73284 (arr!35294 (Array (_ BitVec 32) ValueCell!13393)) (size!35830 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73283)

(declare-fun mapDefault!44125 () ValueCell!13393)

