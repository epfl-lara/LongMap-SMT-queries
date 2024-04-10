; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98966 () Bool)

(assert start!98966)

(declare-fun b_free!24571 () Bool)

(declare-fun b_next!24571 () Bool)

(assert (=> start!98966 (= b_free!24571 (not b_next!24571))))

(declare-fun tp!86423 () Bool)

(declare-fun b_and!39991 () Bool)

(assert (=> start!98966 (= tp!86423 b_and!39991)))

(declare-fun b!1161278 () Bool)

(declare-fun call!56400 () Bool)

(assert (=> b!1161278 call!56400))

(declare-datatypes ((Unit!38298 0))(
  ( (Unit!38299) )
))
(declare-fun lt!522586 () Unit!38298)

(declare-fun call!56397 () Unit!38298)

(assert (=> b!1161278 (= lt!522586 call!56397)))

(declare-fun e!660344 () Unit!38298)

(assert (=> b!1161278 (= e!660344 lt!522586)))

(declare-fun b!1161279 () Bool)

(declare-fun c!115998 () Bool)

(declare-fun lt!522588 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1161279 (= c!115998 (and (not lt!522588) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660354 () Unit!38298)

(declare-fun e!660357 () Unit!38298)

(assert (=> b!1161279 (= e!660354 e!660357)))

(declare-fun b!1161280 () Bool)

(declare-fun e!660352 () Bool)

(declare-fun e!660360 () Bool)

(declare-fun mapRes!45476 () Bool)

(assert (=> b!1161280 (= e!660352 (and e!660360 mapRes!45476))))

(declare-fun condMapEmpty!45476 () Bool)

(declare-datatypes ((V!43929 0))(
  ( (V!43930 (val!14607 Int)) )
))
(declare-datatypes ((ValueCell!13841 0))(
  ( (ValueCellFull!13841 (v!17244 V!43929)) (EmptyCell!13841) )
))
(declare-datatypes ((array!75043 0))(
  ( (array!75044 (arr!36172 (Array (_ BitVec 32) ValueCell!13841)) (size!36708 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75043)

(declare-fun mapDefault!45476 () ValueCell!13841)

