; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97886 () Bool)

(assert start!97886)

(declare-fun b_free!23587 () Bool)

(declare-fun b_next!23587 () Bool)

(assert (=> start!97886 (= b_free!23587 (not b_next!23587))))

(declare-fun tp!83464 () Bool)

(declare-fun b_and!37957 () Bool)

(assert (=> start!97886 (= tp!83464 b_and!37957)))

(declare-fun res!748822 () Bool)

(declare-fun e!638245 () Bool)

(assert (=> start!97886 (=> (not res!748822) (not e!638245))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73115 0))(
  ( (array!73116 (arr!35210 (Array (_ BitVec 32) (_ BitVec 64))) (size!35746 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73115)

(assert (=> start!97886 (= res!748822 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35746 _keys!1208))))))

(assert (=> start!97886 e!638245))

(declare-fun tp_is_empty!28117 () Bool)

(assert (=> start!97886 tp_is_empty!28117))

(declare-fun array_inv!27042 (array!73115) Bool)

(assert (=> start!97886 (array_inv!27042 _keys!1208)))

(assert (=> start!97886 true))

(assert (=> start!97886 tp!83464))

(declare-datatypes ((V!42617 0))(
  ( (V!42618 (val!14115 Int)) )
))
(declare-datatypes ((ValueCell!13349 0))(
  ( (ValueCellFull!13349 (v!16748 V!42617)) (EmptyCell!13349) )
))
(declare-datatypes ((array!73117 0))(
  ( (array!73118 (arr!35211 (Array (_ BitVec 32) ValueCell!13349)) (size!35747 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73117)

(declare-fun e!638246 () Bool)

(declare-fun array_inv!27043 (array!73117) Bool)

(assert (=> start!97886 (and (array_inv!27043 _values!996) e!638246)))

(declare-fun b!1120898 () Bool)

(declare-fun e!638240 () Bool)

(declare-fun mapRes!43993 () Bool)

(assert (=> b!1120898 (= e!638246 (and e!638240 mapRes!43993))))

(declare-fun condMapEmpty!43993 () Bool)

(declare-fun mapDefault!43993 () ValueCell!13349)

