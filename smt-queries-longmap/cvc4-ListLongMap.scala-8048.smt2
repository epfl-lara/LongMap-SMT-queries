; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99132 () Bool)

(assert start!99132)

(declare-fun b_free!24737 () Bool)

(declare-fun b_next!24737 () Bool)

(assert (=> start!99132 (= b_free!24737 (not b_next!24737))))

(declare-fun tp!86921 () Bool)

(declare-fun b_and!40323 () Bool)

(assert (=> start!99132 (= tp!86921 b_and!40323)))

(declare-fun res!773651 () Bool)

(declare-fun e!663008 () Bool)

(assert (=> start!99132 (=> (not res!773651) (not e!663008))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75365 0))(
  ( (array!75366 (arr!36333 (Array (_ BitVec 32) (_ BitVec 64))) (size!36869 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75365)

(assert (=> start!99132 (= res!773651 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36869 _keys!1208))))))

(assert (=> start!99132 e!663008))

(declare-fun tp_is_empty!29267 () Bool)

(assert (=> start!99132 tp_is_empty!29267))

(declare-fun array_inv!27788 (array!75365) Bool)

(assert (=> start!99132 (array_inv!27788 _keys!1208)))

(assert (=> start!99132 true))

(assert (=> start!99132 tp!86921))

(declare-datatypes ((V!44149 0))(
  ( (V!44150 (val!14690 Int)) )
))
(declare-datatypes ((ValueCell!13924 0))(
  ( (ValueCellFull!13924 (v!17327 V!44149)) (EmptyCell!13924) )
))
(declare-datatypes ((array!75367 0))(
  ( (array!75368 (arr!36334 (Array (_ BitVec 32) ValueCell!13924)) (size!36870 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75367)

(declare-fun e!663006 () Bool)

(declare-fun array_inv!27789 (array!75367) Bool)

(assert (=> start!99132 (and (array_inv!27789 _values!996) e!663006)))

(declare-fun b!1166373 () Bool)

(declare-fun res!773648 () Bool)

(declare-fun e!663007 () Bool)

(assert (=> b!1166373 (=> (not res!773648) (not e!663007))))

(declare-fun lt!525231 () array!75365)

(declare-datatypes ((List!25475 0))(
  ( (Nil!25472) (Cons!25471 (h!26680 (_ BitVec 64)) (t!37204 List!25475)) )
))
(declare-fun arrayNoDuplicates!0 (array!75365 (_ BitVec 32) List!25475) Bool)

(assert (=> b!1166373 (= res!773648 (arrayNoDuplicates!0 lt!525231 #b00000000000000000000000000000000 Nil!25472))))

(declare-fun mapNonEmpty!45725 () Bool)

(declare-fun mapRes!45725 () Bool)

(declare-fun tp!86922 () Bool)

(declare-fun e!663005 () Bool)

(assert (=> mapNonEmpty!45725 (= mapRes!45725 (and tp!86922 e!663005))))

(declare-fun mapValue!45725 () ValueCell!13924)

(declare-fun mapKey!45725 () (_ BitVec 32))

(declare-fun mapRest!45725 () (Array (_ BitVec 32) ValueCell!13924))

(assert (=> mapNonEmpty!45725 (= (arr!36334 _values!996) (store mapRest!45725 mapKey!45725 mapValue!45725))))

(declare-fun b!1166374 () Bool)

(declare-fun e!663003 () Bool)

(assert (=> b!1166374 (= e!663006 (and e!663003 mapRes!45725))))

(declare-fun condMapEmpty!45725 () Bool)

(declare-fun mapDefault!45725 () ValueCell!13924)

