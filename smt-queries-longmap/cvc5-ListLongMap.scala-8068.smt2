; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99274 () Bool)

(assert start!99274)

(declare-fun b_free!24853 () Bool)

(declare-fun b_next!24853 () Bool)

(assert (=> start!99274 (= b_free!24853 (not b_next!24853))))

(declare-fun tp!87272 () Bool)

(declare-fun b_and!40573 () Bool)

(assert (=> start!99274 (= tp!87272 b_and!40573)))

(declare-fun mapIsEmpty!45902 () Bool)

(declare-fun mapRes!45902 () Bool)

(assert (=> mapIsEmpty!45902 mapRes!45902))

(declare-fun b!1169338 () Bool)

(declare-fun e!664585 () Bool)

(declare-fun e!664588 () Bool)

(assert (=> b!1169338 (= e!664585 e!664588)))

(declare-fun res!775895 () Bool)

(assert (=> b!1169338 (=> res!775895 e!664588)))

(declare-datatypes ((array!75589 0))(
  ( (array!75590 (arr!36444 (Array (_ BitVec 32) (_ BitVec 64))) (size!36980 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75589)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1169338 (= res!775895 (not (= (select (arr!36444 _keys!1208) from!1455) k!934)))))

(declare-fun b!1169339 () Bool)

(declare-fun res!775894 () Bool)

(declare-fun e!664590 () Bool)

(assert (=> b!1169339 (=> (not res!775894) (not e!664590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169339 (= res!775894 (validKeyInArray!0 k!934))))

(declare-fun b!1169340 () Bool)

(declare-fun res!775891 () Bool)

(assert (=> b!1169340 (=> (not res!775891) (not e!664590))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169340 (= res!775891 (validMask!0 mask!1564))))

(declare-fun b!1169341 () Bool)

(declare-fun e!664591 () Bool)

(declare-fun e!664587 () Bool)

(assert (=> b!1169341 (= e!664591 (and e!664587 mapRes!45902))))

(declare-fun condMapEmpty!45902 () Bool)

(declare-datatypes ((V!44305 0))(
  ( (V!44306 (val!14748 Int)) )
))
(declare-datatypes ((ValueCell!13982 0))(
  ( (ValueCellFull!13982 (v!17386 V!44305)) (EmptyCell!13982) )
))
(declare-datatypes ((array!75591 0))(
  ( (array!75592 (arr!36445 (Array (_ BitVec 32) ValueCell!13982)) (size!36981 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75591)

(declare-fun mapDefault!45902 () ValueCell!13982)

