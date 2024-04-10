; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111924 () Bool)

(assert start!111924)

(declare-fun b_free!30523 () Bool)

(declare-fun b_next!30523 () Bool)

(assert (=> start!111924 (= b_free!30523 (not b_next!30523))))

(declare-fun tp!107048 () Bool)

(declare-fun b_and!49141 () Bool)

(assert (=> start!111924 (= tp!107048 b_and!49141)))

(declare-fun b!1326433 () Bool)

(declare-fun res!880359 () Bool)

(declare-fun e!756018 () Bool)

(assert (=> b!1326433 (=> (not res!880359) (not e!756018))))

(declare-datatypes ((array!89592 0))(
  ( (array!89593 (arr!43269 (Array (_ BitVec 32) (_ BitVec 64))) (size!43819 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89592)

(declare-datatypes ((List!30679 0))(
  ( (Nil!30676) (Cons!30675 (h!31884 (_ BitVec 64)) (t!44673 List!30679)) )
))
(declare-fun arrayNoDuplicates!0 (array!89592 (_ BitVec 32) List!30679) Bool)

(assert (=> b!1326433 (= res!880359 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30676))))

(declare-fun b!1326434 () Bool)

(declare-fun res!880357 () Bool)

(assert (=> b!1326434 (=> (not res!880357) (not e!756018))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1326434 (= res!880357 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43819 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326435 () Bool)

(declare-fun e!756022 () Bool)

(declare-fun tp_is_empty!36343 () Bool)

(assert (=> b!1326435 (= e!756022 tp_is_empty!36343)))

(declare-fun b!1326436 () Bool)

(declare-fun e!756020 () Bool)

(declare-fun e!756019 () Bool)

(declare-fun mapRes!56166 () Bool)

(assert (=> b!1326436 (= e!756020 (and e!756019 mapRes!56166))))

(declare-fun condMapEmpty!56166 () Bool)

(declare-datatypes ((V!53561 0))(
  ( (V!53562 (val!18246 Int)) )
))
(declare-datatypes ((ValueCell!17273 0))(
  ( (ValueCellFull!17273 (v!20879 V!53561)) (EmptyCell!17273) )
))
(declare-datatypes ((array!89594 0))(
  ( (array!89595 (arr!43270 (Array (_ BitVec 32) ValueCell!17273)) (size!43820 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89594)

(declare-fun mapDefault!56166 () ValueCell!17273)

