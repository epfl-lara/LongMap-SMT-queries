; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99164 () Bool)

(assert start!99164)

(declare-fun b_free!24769 () Bool)

(declare-fun b_next!24769 () Bool)

(assert (=> start!99164 (= b_free!24769 (not b_next!24769))))

(declare-fun tp!87018 () Bool)

(declare-fun b_and!40387 () Bool)

(assert (=> start!99164 (= tp!87018 b_and!40387)))

(declare-fun b!1167126 () Bool)

(declare-fun e!663393 () Bool)

(declare-fun e!663389 () Bool)

(assert (=> b!1167126 (= e!663393 e!663389)))

(declare-fun res!774227 () Bool)

(assert (=> b!1167126 (=> (not res!774227) (not e!663389))))

(declare-datatypes ((array!75427 0))(
  ( (array!75428 (arr!36364 (Array (_ BitVec 32) (_ BitVec 64))) (size!36900 (_ BitVec 32))) )
))
(declare-fun lt!525515 () array!75427)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75427 (_ BitVec 32)) Bool)

(assert (=> b!1167126 (= res!774227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525515 mask!1564))))

(declare-fun _keys!1208 () array!75427)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167126 (= lt!525515 (array!75428 (store (arr!36364 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36900 _keys!1208)))))

(declare-fun b!1167127 () Bool)

(declare-fun res!774223 () Bool)

(assert (=> b!1167127 (=> (not res!774223) (not e!663393))))

(assert (=> b!1167127 (= res!774223 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36900 _keys!1208))))))

(declare-fun b!1167128 () Bool)

(declare-fun e!663390 () Bool)

(declare-fun e!663387 () Bool)

(declare-fun mapRes!45773 () Bool)

(assert (=> b!1167128 (= e!663390 (and e!663387 mapRes!45773))))

(declare-fun condMapEmpty!45773 () Bool)

(declare-datatypes ((V!44193 0))(
  ( (V!44194 (val!14706 Int)) )
))
(declare-datatypes ((ValueCell!13940 0))(
  ( (ValueCellFull!13940 (v!17343 V!44193)) (EmptyCell!13940) )
))
(declare-datatypes ((array!75429 0))(
  ( (array!75430 (arr!36365 (Array (_ BitVec 32) ValueCell!13940)) (size!36901 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75429)

(declare-fun mapDefault!45773 () ValueCell!13940)

