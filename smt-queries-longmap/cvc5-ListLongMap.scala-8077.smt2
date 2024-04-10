; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99328 () Bool)

(assert start!99328)

(declare-fun b_free!24907 () Bool)

(declare-fun b_next!24907 () Bool)

(assert (=> start!99328 (= b_free!24907 (not b_next!24907))))

(declare-fun tp!87434 () Bool)

(declare-fun b_and!40681 () Bool)

(assert (=> start!99328 (= tp!87434 b_and!40681)))

(declare-fun b!1170903 () Bool)

(declare-fun e!665536 () Bool)

(declare-fun e!665529 () Bool)

(assert (=> b!1170903 (= e!665536 e!665529)))

(declare-fun res!777157 () Bool)

(assert (=> b!1170903 (=> (not res!777157) (not e!665529))))

(declare-datatypes ((array!75693 0))(
  ( (array!75694 (arr!36496 (Array (_ BitVec 32) (_ BitVec 64))) (size!37032 (_ BitVec 32))) )
))
(declare-fun lt!527395 () array!75693)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75693 (_ BitVec 32)) Bool)

(assert (=> b!1170903 (= res!777157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527395 mask!1564))))

(declare-fun _keys!1208 () array!75693)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170903 (= lt!527395 (array!75694 (store (arr!36496 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37032 _keys!1208)))))

(declare-fun mapNonEmpty!45983 () Bool)

(declare-fun mapRes!45983 () Bool)

(declare-fun tp!87435 () Bool)

(declare-fun e!665531 () Bool)

(assert (=> mapNonEmpty!45983 (= mapRes!45983 (and tp!87435 e!665531))))

(declare-datatypes ((V!44377 0))(
  ( (V!44378 (val!14775 Int)) )
))
(declare-datatypes ((ValueCell!14009 0))(
  ( (ValueCellFull!14009 (v!17413 V!44377)) (EmptyCell!14009) )
))
(declare-fun mapValue!45983 () ValueCell!14009)

(declare-datatypes ((array!75695 0))(
  ( (array!75696 (arr!36497 (Array (_ BitVec 32) ValueCell!14009)) (size!37033 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75695)

(declare-fun mapKey!45983 () (_ BitVec 32))

(declare-fun mapRest!45983 () (Array (_ BitVec 32) ValueCell!14009))

(assert (=> mapNonEmpty!45983 (= (arr!36497 _values!996) (store mapRest!45983 mapKey!45983 mapValue!45983))))

(declare-fun res!777162 () Bool)

(assert (=> start!99328 (=> (not res!777162) (not e!665536))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99328 (= res!777162 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37032 _keys!1208))))))

(assert (=> start!99328 e!665536))

(declare-fun tp_is_empty!29437 () Bool)

(assert (=> start!99328 tp_is_empty!29437))

(declare-fun array_inv!27894 (array!75693) Bool)

(assert (=> start!99328 (array_inv!27894 _keys!1208)))

(assert (=> start!99328 true))

(assert (=> start!99328 tp!87434))

(declare-fun e!665528 () Bool)

(declare-fun array_inv!27895 (array!75695) Bool)

(assert (=> start!99328 (and (array_inv!27895 _values!996) e!665528)))

(declare-fun b!1170904 () Bool)

(declare-fun e!665526 () Bool)

(assert (=> b!1170904 (= e!665526 true)))

(declare-fun lt!527397 () Bool)

(declare-datatypes ((List!25607 0))(
  ( (Nil!25604) (Cons!25603 (h!26812 (_ BitVec 64)) (t!37506 List!25607)) )
))
(declare-fun contains!6841 (List!25607 (_ BitVec 64)) Bool)

(assert (=> b!1170904 (= lt!527397 (contains!6841 Nil!25604 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1170905 () Bool)

(declare-fun res!777169 () Bool)

(assert (=> b!1170905 (=> (not res!777169) (not e!665536))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1170905 (= res!777169 (and (= (size!37033 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37032 _keys!1208) (size!37033 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170906 () Bool)

(declare-fun e!665535 () Bool)

(assert (=> b!1170906 (= e!665528 (and e!665535 mapRes!45983))))

(declare-fun condMapEmpty!45983 () Bool)

(declare-fun mapDefault!45983 () ValueCell!14009)

