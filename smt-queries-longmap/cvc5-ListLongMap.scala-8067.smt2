; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99268 () Bool)

(assert start!99268)

(declare-fun b_free!24847 () Bool)

(declare-fun b_next!24847 () Bool)

(assert (=> start!99268 (= b_free!24847 (not b_next!24847))))

(declare-fun tp!87255 () Bool)

(declare-fun b_and!40561 () Bool)

(assert (=> start!99268 (= tp!87255 b_and!40561)))

(declare-fun b!1169170 () Bool)

(declare-fun e!664495 () Bool)

(declare-fun e!664494 () Bool)

(assert (=> b!1169170 (= e!664495 e!664494)))

(declare-fun res!775753 () Bool)

(assert (=> b!1169170 (=> (not res!775753) (not e!664494))))

(declare-datatypes ((array!75577 0))(
  ( (array!75578 (arr!36438 (Array (_ BitVec 32) (_ BitVec 64))) (size!36974 (_ BitVec 32))) )
))
(declare-fun lt!526452 () array!75577)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75577 (_ BitVec 32)) Bool)

(assert (=> b!1169170 (= res!775753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526452 mask!1564))))

(declare-fun _keys!1208 () array!75577)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169170 (= lt!526452 (array!75578 (store (arr!36438 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36974 _keys!1208)))))

(declare-fun b!1169171 () Bool)

(declare-fun e!664492 () Bool)

(declare-fun e!664487 () Bool)

(declare-fun mapRes!45893 () Bool)

(assert (=> b!1169171 (= e!664492 (and e!664487 mapRes!45893))))

(declare-fun condMapEmpty!45893 () Bool)

(declare-datatypes ((V!44297 0))(
  ( (V!44298 (val!14745 Int)) )
))
(declare-datatypes ((ValueCell!13979 0))(
  ( (ValueCellFull!13979 (v!17383 V!44297)) (EmptyCell!13979) )
))
(declare-datatypes ((array!75579 0))(
  ( (array!75580 (arr!36439 (Array (_ BitVec 32) ValueCell!13979)) (size!36975 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75579)

(declare-fun mapDefault!45893 () ValueCell!13979)

