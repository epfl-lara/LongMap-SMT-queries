; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111758 () Bool)

(assert start!111758)

(declare-fun b_free!30415 () Bool)

(declare-fun b_next!30415 () Bool)

(assert (=> start!111758 (= b_free!30415 (not b_next!30415))))

(declare-fun tp!106721 () Bool)

(declare-fun b_and!48953 () Bool)

(assert (=> start!111758 (= tp!106721 b_and!48953)))

(declare-fun b!1324276 () Bool)

(declare-fun e!754950 () Bool)

(declare-fun tp_is_empty!36235 () Bool)

(assert (=> b!1324276 (= e!754950 tp_is_empty!36235)))

(declare-fun b!1324277 () Bool)

(declare-fun res!878992 () Bool)

(declare-fun e!754952 () Bool)

(assert (=> b!1324277 (=> (not res!878992) (not e!754952))))

(declare-datatypes ((array!89386 0))(
  ( (array!89387 (arr!43167 (Array (_ BitVec 32) (_ BitVec 64))) (size!43717 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89386)

(declare-datatypes ((List!30599 0))(
  ( (Nil!30596) (Cons!30595 (h!31804 (_ BitVec 64)) (t!44525 List!30599)) )
))
(declare-fun arrayNoDuplicates!0 (array!89386 (_ BitVec 32) List!30599) Bool)

(assert (=> b!1324277 (= res!878992 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30596))))

(declare-fun b!1324278 () Bool)

(assert (=> b!1324278 (= e!754952 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53417 0))(
  ( (V!53418 (val!18192 Int)) )
))
(declare-fun zeroValue!1279 () V!53417)

(declare-datatypes ((ValueCell!17219 0))(
  ( (ValueCellFull!17219 (v!20822 V!53417)) (EmptyCell!17219) )
))
(declare-datatypes ((array!89388 0))(
  ( (array!89389 (arr!43168 (Array (_ BitVec 32) ValueCell!17219)) (size!43718 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89388)

(declare-fun minValue!1279 () V!53417)

(declare-fun lt!589455 () Bool)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23458 0))(
  ( (tuple2!23459 (_1!11740 (_ BitVec 64)) (_2!11740 V!53417)) )
))
(declare-datatypes ((List!30600 0))(
  ( (Nil!30597) (Cons!30596 (h!31805 tuple2!23458) (t!44526 List!30600)) )
))
(declare-datatypes ((ListLongMap!21115 0))(
  ( (ListLongMap!21116 (toList!10573 List!30600)) )
))
(declare-fun contains!8728 (ListLongMap!21115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5569 (array!89386 array!89388 (_ BitVec 32) (_ BitVec 32) V!53417 V!53417 (_ BitVec 32) Int) ListLongMap!21115)

(assert (=> b!1324278 (= lt!589455 (contains!8728 (getCurrentListMap!5569 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324279 () Bool)

(declare-fun e!754954 () Bool)

(assert (=> b!1324279 (= e!754954 tp_is_empty!36235)))

(declare-fun b!1324280 () Bool)

(declare-fun res!878989 () Bool)

(assert (=> b!1324280 (=> (not res!878989) (not e!754952))))

(assert (=> b!1324280 (= res!878989 (and (= (size!43718 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43717 _keys!1609) (size!43718 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56000 () Bool)

(declare-fun mapRes!56000 () Bool)

(assert (=> mapIsEmpty!56000 mapRes!56000))

(declare-fun res!878990 () Bool)

(assert (=> start!111758 (=> (not res!878990) (not e!754952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111758 (= res!878990 (validMask!0 mask!2019))))

(assert (=> start!111758 e!754952))

(declare-fun array_inv!32585 (array!89386) Bool)

(assert (=> start!111758 (array_inv!32585 _keys!1609)))

(assert (=> start!111758 true))

(assert (=> start!111758 tp_is_empty!36235))

(declare-fun e!754953 () Bool)

(declare-fun array_inv!32586 (array!89388) Bool)

(assert (=> start!111758 (and (array_inv!32586 _values!1337) e!754953)))

(assert (=> start!111758 tp!106721))

(declare-fun b!1324281 () Bool)

(assert (=> b!1324281 (= e!754953 (and e!754954 mapRes!56000))))

(declare-fun condMapEmpty!56000 () Bool)

(declare-fun mapDefault!56000 () ValueCell!17219)

