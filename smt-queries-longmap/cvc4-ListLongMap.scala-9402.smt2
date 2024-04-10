; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111910 () Bool)

(assert start!111910)

(declare-fun b_free!30509 () Bool)

(declare-fun b_next!30509 () Bool)

(assert (=> start!111910 (= b_free!30509 (not b_next!30509))))

(declare-fun tp!107007 () Bool)

(declare-fun b_and!49113 () Bool)

(assert (=> start!111910 (= tp!107007 b_and!49113)))

(declare-fun b!1326188 () Bool)

(declare-fun res!880187 () Bool)

(declare-fun e!755915 () Bool)

(assert (=> b!1326188 (=> (not res!880187) (not e!755915))))

(declare-datatypes ((array!89564 0))(
  ( (array!89565 (arr!43255 (Array (_ BitVec 32) (_ BitVec 64))) (size!43805 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89564)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326188 (= res!880187 (validKeyInArray!0 (select (arr!43255 _keys!1609) from!2000)))))

(declare-fun b!1326189 () Bool)

(declare-fun res!880185 () Bool)

(assert (=> b!1326189 (=> (not res!880185) (not e!755915))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53541 0))(
  ( (V!53542 (val!18239 Int)) )
))
(declare-fun zeroValue!1279 () V!53541)

(declare-datatypes ((ValueCell!17266 0))(
  ( (ValueCellFull!17266 (v!20872 V!53541)) (EmptyCell!17266) )
))
(declare-datatypes ((array!89566 0))(
  ( (array!89567 (arr!43256 (Array (_ BitVec 32) ValueCell!17266)) (size!43806 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89566)

(declare-fun minValue!1279 () V!53541)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23530 0))(
  ( (tuple2!23531 (_1!11776 (_ BitVec 64)) (_2!11776 V!53541)) )
))
(declare-datatypes ((List!30667 0))(
  ( (Nil!30664) (Cons!30663 (h!31872 tuple2!23530) (t!44647 List!30667)) )
))
(declare-datatypes ((ListLongMap!21187 0))(
  ( (ListLongMap!21188 (toList!10609 List!30667)) )
))
(declare-fun contains!8766 (ListLongMap!21187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5600 (array!89564 array!89566 (_ BitVec 32) (_ BitVec 32) V!53541 V!53541 (_ BitVec 32) Int) ListLongMap!21187)

(assert (=> b!1326189 (= res!880185 (contains!8766 (getCurrentListMap!5600 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1326190 () Bool)

(declare-fun res!880192 () Bool)

(assert (=> b!1326190 (=> (not res!880192) (not e!755915))))

(assert (=> b!1326190 (= res!880192 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43805 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326191 () Bool)

(declare-fun e!755916 () Bool)

(declare-fun e!755917 () Bool)

(declare-fun mapRes!56145 () Bool)

(assert (=> b!1326191 (= e!755916 (and e!755917 mapRes!56145))))

(declare-fun condMapEmpty!56145 () Bool)

(declare-fun mapDefault!56145 () ValueCell!17266)

