; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111086 () Bool)

(assert start!111086)

(declare-fun b_free!29921 () Bool)

(declare-fun b_next!29921 () Bool)

(assert (=> start!111086 (= b_free!29921 (not b_next!29921))))

(declare-fun tp!105084 () Bool)

(declare-fun b_and!48129 () Bool)

(assert (=> start!111086 (= tp!105084 b_and!48129)))

(declare-fun b!1315258 () Bool)

(declare-fun res!873160 () Bool)

(declare-fun e!750272 () Bool)

(assert (=> b!1315258 (=> (not res!873160) (not e!750272))))

(declare-datatypes ((array!88266 0))(
  ( (array!88267 (arr!42613 (Array (_ BitVec 32) (_ BitVec 64))) (size!43163 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88266)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315258 (= res!873160 (not (= (select (arr!42613 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1315259 () Bool)

(declare-fun res!873159 () Bool)

(assert (=> b!1315259 (=> (not res!873159) (not e!750272))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52637 0))(
  ( (V!52638 (val!17900 Int)) )
))
(declare-fun minValue!1296 () V!52637)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16927 0))(
  ( (ValueCellFull!16927 (v!20527 V!52637)) (EmptyCell!16927) )
))
(declare-datatypes ((array!88268 0))(
  ( (array!88269 (arr!42614 (Array (_ BitVec 32) ValueCell!16927)) (size!43164 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88268)

(declare-fun zeroValue!1296 () V!52637)

(declare-datatypes ((tuple2!23090 0))(
  ( (tuple2!23091 (_1!11556 (_ BitVec 64)) (_2!11556 V!52637)) )
))
(declare-datatypes ((List!30225 0))(
  ( (Nil!30222) (Cons!30221 (h!31430 tuple2!23090) (t!43831 List!30225)) )
))
(declare-datatypes ((ListLongMap!20747 0))(
  ( (ListLongMap!20748 (toList!10389 List!30225)) )
))
(declare-fun contains!8539 (ListLongMap!20747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5402 (array!88266 array!88268 (_ BitVec 32) (_ BitVec 32) V!52637 V!52637 (_ BitVec 32) Int) ListLongMap!20747)

(assert (=> b!1315259 (= res!873159 (contains!8539 (getCurrentListMap!5402 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315260 () Bool)

(declare-fun res!873165 () Bool)

(assert (=> b!1315260 (=> (not res!873165) (not e!750272))))

(assert (=> b!1315260 (= res!873165 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1315261 () Bool)

(declare-fun res!873163 () Bool)

(assert (=> b!1315261 (=> (not res!873163) (not e!750272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88266 (_ BitVec 32)) Bool)

(assert (=> b!1315261 (= res!873163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55105 () Bool)

(declare-fun mapRes!55105 () Bool)

(assert (=> mapIsEmpty!55105 mapRes!55105))

(declare-fun mapNonEmpty!55105 () Bool)

(declare-fun tp!105085 () Bool)

(declare-fun e!750270 () Bool)

(assert (=> mapNonEmpty!55105 (= mapRes!55105 (and tp!105085 e!750270))))

(declare-fun mapRest!55105 () (Array (_ BitVec 32) ValueCell!16927))

(declare-fun mapKey!55105 () (_ BitVec 32))

(declare-fun mapValue!55105 () ValueCell!16927)

(assert (=> mapNonEmpty!55105 (= (arr!42614 _values!1354) (store mapRest!55105 mapKey!55105 mapValue!55105))))

(declare-fun b!1315263 () Bool)

(assert (=> b!1315263 (= e!750272 (not true))))

(assert (=> b!1315263 (contains!8539 (getCurrentListMap!5402 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43394 0))(
  ( (Unit!43395) )
))
(declare-fun lt!585891 () Unit!43394)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!22 (array!88266 array!88268 (_ BitVec 32) (_ BitVec 32) V!52637 V!52637 (_ BitVec 64) (_ BitVec 32) Int) Unit!43394)

(assert (=> b!1315263 (= lt!585891 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!22 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1315264 () Bool)

(declare-fun e!750269 () Bool)

(declare-fun tp_is_empty!35651 () Bool)

(assert (=> b!1315264 (= e!750269 tp_is_empty!35651)))

(declare-fun b!1315265 () Bool)

(declare-fun res!873162 () Bool)

(assert (=> b!1315265 (=> (not res!873162) (not e!750272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1315265 (= res!873162 (validKeyInArray!0 (select (arr!42613 _keys!1628) from!2020)))))

(declare-fun b!1315266 () Bool)

(assert (=> b!1315266 (= e!750270 tp_is_empty!35651)))

(declare-fun b!1315267 () Bool)

(declare-fun res!873164 () Bool)

(assert (=> b!1315267 (=> (not res!873164) (not e!750272))))

(assert (=> b!1315267 (= res!873164 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43163 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!873158 () Bool)

(assert (=> start!111086 (=> (not res!873158) (not e!750272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111086 (= res!873158 (validMask!0 mask!2040))))

(assert (=> start!111086 e!750272))

(assert (=> start!111086 tp!105084))

(declare-fun array_inv!32183 (array!88266) Bool)

(assert (=> start!111086 (array_inv!32183 _keys!1628)))

(assert (=> start!111086 true))

(assert (=> start!111086 tp_is_empty!35651))

(declare-fun e!750268 () Bool)

(declare-fun array_inv!32184 (array!88268) Bool)

(assert (=> start!111086 (and (array_inv!32184 _values!1354) e!750268)))

(declare-fun b!1315262 () Bool)

(declare-fun res!873157 () Bool)

(assert (=> b!1315262 (=> (not res!873157) (not e!750272))))

(declare-datatypes ((List!30226 0))(
  ( (Nil!30223) (Cons!30222 (h!31431 (_ BitVec 64)) (t!43832 List!30226)) )
))
(declare-fun arrayNoDuplicates!0 (array!88266 (_ BitVec 32) List!30226) Bool)

(assert (=> b!1315262 (= res!873157 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30223))))

(declare-fun b!1315268 () Bool)

(assert (=> b!1315268 (= e!750268 (and e!750269 mapRes!55105))))

(declare-fun condMapEmpty!55105 () Bool)

(declare-fun mapDefault!55105 () ValueCell!16927)

