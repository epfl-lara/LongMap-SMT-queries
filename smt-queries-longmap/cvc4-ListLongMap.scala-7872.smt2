; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97980 () Bool)

(assert start!97980)

(declare-fun b_free!23681 () Bool)

(declare-fun b_next!23681 () Bool)

(assert (=> start!97980 (= b_free!23681 (not b_next!23681))))

(declare-fun tp!83747 () Bool)

(declare-fun b_and!38145 () Bool)

(assert (=> start!97980 (= tp!83747 b_and!38145)))

(declare-fun res!750607 () Bool)

(declare-fun e!639594 () Bool)

(assert (=> start!97980 (=> (not res!750607) (not e!639594))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73291 0))(
  ( (array!73292 (arr!35298 (Array (_ BitVec 32) (_ BitVec 64))) (size!35834 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73291)

(assert (=> start!97980 (= res!750607 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35834 _keys!1208))))))

(assert (=> start!97980 e!639594))

(declare-fun tp_is_empty!28211 () Bool)

(assert (=> start!97980 tp_is_empty!28211))

(declare-fun array_inv!27100 (array!73291) Bool)

(assert (=> start!97980 (array_inv!27100 _keys!1208)))

(assert (=> start!97980 true))

(assert (=> start!97980 tp!83747))

(declare-datatypes ((V!42741 0))(
  ( (V!42742 (val!14162 Int)) )
))
(declare-datatypes ((ValueCell!13396 0))(
  ( (ValueCellFull!13396 (v!16795 V!42741)) (EmptyCell!13396) )
))
(declare-datatypes ((array!73293 0))(
  ( (array!73294 (arr!35299 (Array (_ BitVec 32) ValueCell!13396)) (size!35835 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73293)

(declare-fun e!639588 () Bool)

(declare-fun array_inv!27101 (array!73293) Bool)

(assert (=> start!97980 (and (array_inv!27101 _values!996) e!639588)))

(declare-fun b!1123477 () Bool)

(declare-fun e!639590 () Bool)

(declare-fun mapRes!44134 () Bool)

(assert (=> b!1123477 (= e!639588 (and e!639590 mapRes!44134))))

(declare-fun condMapEmpty!44134 () Bool)

(declare-fun mapDefault!44134 () ValueCell!13396)

