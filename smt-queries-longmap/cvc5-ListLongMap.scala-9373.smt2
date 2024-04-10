; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111674 () Bool)

(assert start!111674)

(declare-fun b_free!30331 () Bool)

(declare-fun b_next!30331 () Bool)

(assert (=> start!111674 (= b_free!30331 (not b_next!30331))))

(declare-fun tp!106469 () Bool)

(declare-fun b_and!48821 () Bool)

(assert (=> start!111674 (= tp!106469 b_and!48821)))

(declare-fun b!1323010 () Bool)

(declare-fun res!878155 () Bool)

(declare-fun e!754320 () Bool)

(assert (=> b!1323010 (=> (not res!878155) (not e!754320))))

(declare-datatypes ((array!89222 0))(
  ( (array!89223 (arr!43085 (Array (_ BitVec 32) (_ BitVec 64))) (size!43635 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89222)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323010 (= res!878155 (validKeyInArray!0 (select (arr!43085 _keys!1609) from!2000)))))

(declare-fun b!1323011 () Bool)

(declare-fun res!878150 () Bool)

(assert (=> b!1323011 (=> (not res!878150) (not e!754320))))

(declare-datatypes ((List!30535 0))(
  ( (Nil!30532) (Cons!30531 (h!31740 (_ BitVec 64)) (t!44415 List!30535)) )
))
(declare-fun arrayNoDuplicates!0 (array!89222 (_ BitVec 32) List!30535) Bool)

(assert (=> b!1323011 (= res!878150 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30532))))

(declare-fun b!1323012 () Bool)

(declare-fun e!754324 () Bool)

(declare-fun e!754322 () Bool)

(declare-fun mapRes!55874 () Bool)

(assert (=> b!1323012 (= e!754324 (and e!754322 mapRes!55874))))

(declare-fun condMapEmpty!55874 () Bool)

(declare-datatypes ((V!53305 0))(
  ( (V!53306 (val!18150 Int)) )
))
(declare-datatypes ((ValueCell!17177 0))(
  ( (ValueCellFull!17177 (v!20780 V!53305)) (EmptyCell!17177) )
))
(declare-datatypes ((array!89224 0))(
  ( (array!89225 (arr!43086 (Array (_ BitVec 32) ValueCell!17177)) (size!43636 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89224)

(declare-fun mapDefault!55874 () ValueCell!17177)

