; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111734 () Bool)

(assert start!111734)

(declare-fun b_free!30391 () Bool)

(declare-fun b_next!30391 () Bool)

(assert (=> start!111734 (= b_free!30391 (not b_next!30391))))

(declare-fun tp!106648 () Bool)

(declare-fun b_and!48929 () Bool)

(assert (=> start!111734 (= tp!106648 b_and!48929)))

(declare-fun b!1323988 () Bool)

(declare-fun res!878813 () Bool)

(declare-fun e!754772 () Bool)

(assert (=> b!1323988 (=> (not res!878813) (not e!754772))))

(declare-datatypes ((array!89338 0))(
  ( (array!89339 (arr!43143 (Array (_ BitVec 32) (_ BitVec 64))) (size!43693 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89338)

(declare-datatypes ((List!30581 0))(
  ( (Nil!30578) (Cons!30577 (h!31786 (_ BitVec 64)) (t!44507 List!30581)) )
))
(declare-fun arrayNoDuplicates!0 (array!89338 (_ BitVec 32) List!30581) Bool)

(assert (=> b!1323988 (= res!878813 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30578))))

(declare-fun res!878809 () Bool)

(assert (=> start!111734 (=> (not res!878809) (not e!754772))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111734 (= res!878809 (validMask!0 mask!2019))))

(assert (=> start!111734 e!754772))

(declare-fun array_inv!32567 (array!89338) Bool)

(assert (=> start!111734 (array_inv!32567 _keys!1609)))

(assert (=> start!111734 true))

(declare-fun tp_is_empty!36211 () Bool)

(assert (=> start!111734 tp_is_empty!36211))

(declare-datatypes ((V!53385 0))(
  ( (V!53386 (val!18180 Int)) )
))
(declare-datatypes ((ValueCell!17207 0))(
  ( (ValueCellFull!17207 (v!20810 V!53385)) (EmptyCell!17207) )
))
(declare-datatypes ((array!89340 0))(
  ( (array!89341 (arr!43144 (Array (_ BitVec 32) ValueCell!17207)) (size!43694 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89340)

(declare-fun e!754773 () Bool)

(declare-fun array_inv!32568 (array!89340) Bool)

(assert (=> start!111734 (and (array_inv!32568 _values!1337) e!754773)))

(assert (=> start!111734 tp!106648))

(declare-fun b!1323989 () Bool)

(declare-fun res!878812 () Bool)

(assert (=> b!1323989 (=> (not res!878812) (not e!754772))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1323989 (= res!878812 (and (= (size!43694 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43693 _keys!1609) (size!43694 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55964 () Bool)

(declare-fun mapRes!55964 () Bool)

(assert (=> mapIsEmpty!55964 mapRes!55964))

(declare-fun b!1323990 () Bool)

(declare-fun res!878810 () Bool)

(assert (=> b!1323990 (=> (not res!878810) (not e!754772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89338 (_ BitVec 32)) Bool)

(assert (=> b!1323990 (= res!878810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323991 () Bool)

(declare-fun res!878811 () Bool)

(assert (=> b!1323991 (=> (not res!878811) (not e!754772))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1323991 (= res!878811 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43693 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323992 () Bool)

(declare-fun e!754770 () Bool)

(assert (=> b!1323992 (= e!754770 tp_is_empty!36211)))

(declare-fun b!1323993 () Bool)

(declare-fun e!754771 () Bool)

(assert (=> b!1323993 (= e!754771 tp_is_empty!36211)))

(declare-fun b!1323994 () Bool)

(assert (=> b!1323994 (= e!754773 (and e!754771 mapRes!55964))))

(declare-fun condMapEmpty!55964 () Bool)

(declare-fun mapDefault!55964 () ValueCell!17207)

