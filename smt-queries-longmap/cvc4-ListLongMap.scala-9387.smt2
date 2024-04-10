; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111762 () Bool)

(assert start!111762)

(declare-fun b_free!30419 () Bool)

(declare-fun b_next!30419 () Bool)

(assert (=> start!111762 (= b_free!30419 (not b_next!30419))))

(declare-fun tp!106732 () Bool)

(declare-fun b_and!48957 () Bool)

(assert (=> start!111762 (= tp!106732 b_and!48957)))

(declare-fun b!1324324 () Bool)

(declare-fun e!754981 () Bool)

(declare-fun tp_is_empty!36239 () Bool)

(assert (=> b!1324324 (= e!754981 tp_is_empty!36239)))

(declare-fun mapIsEmpty!56006 () Bool)

(declare-fun mapRes!56006 () Bool)

(assert (=> mapIsEmpty!56006 mapRes!56006))

(declare-fun b!1324325 () Bool)

(declare-fun res!879020 () Bool)

(declare-fun e!754983 () Bool)

(assert (=> b!1324325 (=> (not res!879020) (not e!754983))))

(declare-datatypes ((array!89394 0))(
  ( (array!89395 (arr!43171 (Array (_ BitVec 32) (_ BitVec 64))) (size!43721 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89394)

(declare-datatypes ((List!30603 0))(
  ( (Nil!30600) (Cons!30599 (h!31808 (_ BitVec 64)) (t!44529 List!30603)) )
))
(declare-fun arrayNoDuplicates!0 (array!89394 (_ BitVec 32) List!30603) Bool)

(assert (=> b!1324325 (= res!879020 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30600))))

(declare-fun b!1324326 () Bool)

(declare-fun e!754980 () Bool)

(assert (=> b!1324326 (= e!754980 tp_is_empty!36239)))

(declare-fun res!879019 () Bool)

(assert (=> start!111762 (=> (not res!879019) (not e!754983))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111762 (= res!879019 (validMask!0 mask!2019))))

(assert (=> start!111762 e!754983))

(declare-fun array_inv!32589 (array!89394) Bool)

(assert (=> start!111762 (array_inv!32589 _keys!1609)))

(assert (=> start!111762 true))

(assert (=> start!111762 tp_is_empty!36239))

(declare-datatypes ((V!53421 0))(
  ( (V!53422 (val!18194 Int)) )
))
(declare-datatypes ((ValueCell!17221 0))(
  ( (ValueCellFull!17221 (v!20824 V!53421)) (EmptyCell!17221) )
))
(declare-datatypes ((array!89396 0))(
  ( (array!89397 (arr!43172 (Array (_ BitVec 32) ValueCell!17221)) (size!43722 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89396)

(declare-fun e!754982 () Bool)

(declare-fun array_inv!32590 (array!89396) Bool)

(assert (=> start!111762 (and (array_inv!32590 _values!1337) e!754982)))

(assert (=> start!111762 tp!106732))

(declare-fun b!1324327 () Bool)

(declare-fun res!879022 () Bool)

(assert (=> b!1324327 (=> (not res!879022) (not e!754983))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1324327 (= res!879022 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43721 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324328 () Bool)

(declare-fun res!879023 () Bool)

(assert (=> b!1324328 (=> (not res!879023) (not e!754983))))

(assert (=> b!1324328 (= res!879023 (and (= (size!43722 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43721 _keys!1609) (size!43722 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324329 () Bool)

(assert (=> b!1324329 (= e!754982 (and e!754981 mapRes!56006))))

(declare-fun condMapEmpty!56006 () Bool)

(declare-fun mapDefault!56006 () ValueCell!17221)

