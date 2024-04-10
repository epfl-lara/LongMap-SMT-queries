; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111160 () Bool)

(assert start!111160)

(declare-fun b_free!29995 () Bool)

(declare-fun b_next!29995 () Bool)

(assert (=> start!111160 (= b_free!29995 (not b_next!29995))))

(declare-fun tp!105306 () Bool)

(declare-fun b_and!48203 () Bool)

(assert (=> start!111160 (= tp!105306 b_and!48203)))

(declare-fun b!1316158 () Bool)

(declare-fun res!873729 () Bool)

(declare-fun e!750827 () Bool)

(assert (=> b!1316158 (=> (not res!873729) (not e!750827))))

(declare-datatypes ((array!88408 0))(
  ( (array!88409 (arr!42684 (Array (_ BitVec 32) (_ BitVec 64))) (size!43234 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88408)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52737 0))(
  ( (V!52738 (val!17937 Int)) )
))
(declare-datatypes ((ValueCell!16964 0))(
  ( (ValueCellFull!16964 (v!20564 V!52737)) (EmptyCell!16964) )
))
(declare-datatypes ((array!88410 0))(
  ( (array!88411 (arr!42685 (Array (_ BitVec 32) ValueCell!16964)) (size!43235 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88410)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316158 (= res!873729 (and (= (size!43235 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43234 _keys!1628) (size!43235 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316159 () Bool)

(declare-fun e!750823 () Bool)

(declare-fun tp_is_empty!35725 () Bool)

(assert (=> b!1316159 (= e!750823 tp_is_empty!35725)))

(declare-fun b!1316160 () Bool)

(assert (=> b!1316160 (= e!750827 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52737)

(declare-fun zeroValue!1296 () V!52737)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23142 0))(
  ( (tuple2!23143 (_1!11582 (_ BitVec 64)) (_2!11582 V!52737)) )
))
(declare-datatypes ((List!30280 0))(
  ( (Nil!30277) (Cons!30276 (h!31485 tuple2!23142) (t!43886 List!30280)) )
))
(declare-datatypes ((ListLongMap!20799 0))(
  ( (ListLongMap!20800 (toList!10415 List!30280)) )
))
(declare-fun contains!8565 (ListLongMap!20799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5428 (array!88408 array!88410 (_ BitVec 32) (_ BitVec 32) V!52737 V!52737 (_ BitVec 32) Int) ListLongMap!20799)

(assert (=> b!1316160 (contains!8565 (getCurrentListMap!5428 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43396 0))(
  ( (Unit!43397) )
))
(declare-fun lt!586002 () Unit!43396)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!20 (array!88408 array!88410 (_ BitVec 32) (_ BitVec 32) V!52737 V!52737 (_ BitVec 64) (_ BitVec 32) Int) Unit!43396)

(assert (=> b!1316160 (= lt!586002 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!20 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1316161 () Bool)

(declare-fun res!873724 () Bool)

(assert (=> b!1316161 (=> (not res!873724) (not e!750827))))

(assert (=> b!1316161 (= res!873724 (contains!8565 (getCurrentListMap!5428 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1316162 () Bool)

(declare-fun res!873730 () Bool)

(assert (=> b!1316162 (=> (not res!873730) (not e!750827))))

(assert (=> b!1316162 (= res!873730 (not (= (select (arr!42684 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1316163 () Bool)

(declare-fun res!873726 () Bool)

(assert (=> b!1316163 (=> (not res!873726) (not e!750827))))

(declare-datatypes ((List!30281 0))(
  ( (Nil!30278) (Cons!30277 (h!31486 (_ BitVec 64)) (t!43887 List!30281)) )
))
(declare-fun arrayNoDuplicates!0 (array!88408 (_ BitVec 32) List!30281) Bool)

(assert (=> b!1316163 (= res!873726 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30278))))

(declare-fun b!1316164 () Bool)

(declare-fun res!873727 () Bool)

(assert (=> b!1316164 (=> (not res!873727) (not e!750827))))

(assert (=> b!1316164 (= res!873727 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43234 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316165 () Bool)

(declare-fun res!873732 () Bool)

(assert (=> b!1316165 (=> (not res!873732) (not e!750827))))

(assert (=> b!1316165 (= res!873732 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!873725 () Bool)

(assert (=> start!111160 (=> (not res!873725) (not e!750827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111160 (= res!873725 (validMask!0 mask!2040))))

(assert (=> start!111160 e!750827))

(assert (=> start!111160 tp!105306))

(declare-fun array_inv!32235 (array!88408) Bool)

(assert (=> start!111160 (array_inv!32235 _keys!1628)))

(assert (=> start!111160 true))

(assert (=> start!111160 tp_is_empty!35725))

(declare-fun e!750825 () Bool)

(declare-fun array_inv!32236 (array!88410) Bool)

(assert (=> start!111160 (and (array_inv!32236 _values!1354) e!750825)))

(declare-fun b!1316166 () Bool)

(declare-fun e!750824 () Bool)

(assert (=> b!1316166 (= e!750824 tp_is_empty!35725)))

(declare-fun b!1316167 () Bool)

(declare-fun mapRes!55216 () Bool)

(assert (=> b!1316167 (= e!750825 (and e!750823 mapRes!55216))))

(declare-fun condMapEmpty!55216 () Bool)

(declare-fun mapDefault!55216 () ValueCell!16964)

