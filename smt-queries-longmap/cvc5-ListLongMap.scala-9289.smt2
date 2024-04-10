; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111082 () Bool)

(assert start!111082)

(declare-fun b_free!29917 () Bool)

(declare-fun b_next!29917 () Bool)

(assert (=> start!111082 (= b_free!29917 (not b_next!29917))))

(declare-fun tp!105073 () Bool)

(declare-fun b_and!48125 () Bool)

(assert (=> start!111082 (= tp!105073 b_and!48125)))

(declare-fun b!1315186 () Bool)

(declare-fun e!750239 () Bool)

(declare-fun tp_is_empty!35647 () Bool)

(assert (=> b!1315186 (= e!750239 tp_is_empty!35647)))

(declare-fun b!1315187 () Bool)

(declare-fun res!873103 () Bool)

(declare-fun e!750238 () Bool)

(assert (=> b!1315187 (=> (not res!873103) (not e!750238))))

(declare-datatypes ((array!88258 0))(
  ( (array!88259 (arr!42609 (Array (_ BitVec 32) (_ BitVec 64))) (size!43159 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88258)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315187 (= res!873103 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43159 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315188 () Bool)

(declare-fun res!873109 () Bool)

(assert (=> b!1315188 (=> (not res!873109) (not e!750238))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315188 (= res!873109 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1315189 () Bool)

(assert (=> b!1315189 (= e!750238 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52633 0))(
  ( (V!52634 (val!17898 Int)) )
))
(declare-fun minValue!1296 () V!52633)

(declare-datatypes ((ValueCell!16925 0))(
  ( (ValueCellFull!16925 (v!20525 V!52633)) (EmptyCell!16925) )
))
(declare-datatypes ((array!88260 0))(
  ( (array!88261 (arr!42610 (Array (_ BitVec 32) ValueCell!16925)) (size!43160 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88260)

(declare-fun zeroValue!1296 () V!52633)

(declare-datatypes ((tuple2!23086 0))(
  ( (tuple2!23087 (_1!11554 (_ BitVec 64)) (_2!11554 V!52633)) )
))
(declare-datatypes ((List!30221 0))(
  ( (Nil!30218) (Cons!30217 (h!31426 tuple2!23086) (t!43827 List!30221)) )
))
(declare-datatypes ((ListLongMap!20743 0))(
  ( (ListLongMap!20744 (toList!10387 List!30221)) )
))
(declare-fun contains!8537 (ListLongMap!20743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5400 (array!88258 array!88260 (_ BitVec 32) (_ BitVec 32) V!52633 V!52633 (_ BitVec 32) Int) ListLongMap!20743)

(assert (=> b!1315189 (contains!8537 (getCurrentListMap!5400 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43390 0))(
  ( (Unit!43391) )
))
(declare-fun lt!585885 () Unit!43390)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!20 (array!88258 array!88260 (_ BitVec 32) (_ BitVec 32) V!52633 V!52633 (_ BitVec 64) (_ BitVec 32) Int) Unit!43390)

(assert (=> b!1315189 (= lt!585885 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!20 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1315191 () Bool)

(declare-fun e!750240 () Bool)

(assert (=> b!1315191 (= e!750240 tp_is_empty!35647)))

(declare-fun b!1315192 () Bool)

(declare-fun res!873110 () Bool)

(assert (=> b!1315192 (=> (not res!873110) (not e!750238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88258 (_ BitVec 32)) Bool)

(assert (=> b!1315192 (= res!873110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315193 () Bool)

(declare-fun res!873107 () Bool)

(assert (=> b!1315193 (=> (not res!873107) (not e!750238))))

(assert (=> b!1315193 (= res!873107 (and (= (size!43160 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43159 _keys!1628) (size!43160 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315194 () Bool)

(declare-fun res!873108 () Bool)

(assert (=> b!1315194 (=> (not res!873108) (not e!750238))))

(assert (=> b!1315194 (= res!873108 (contains!8537 (getCurrentListMap!5400 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315195 () Bool)

(declare-fun res!873104 () Bool)

(assert (=> b!1315195 (=> (not res!873104) (not e!750238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1315195 (= res!873104 (validKeyInArray!0 (select (arr!42609 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!55099 () Bool)

(declare-fun mapRes!55099 () Bool)

(declare-fun tp!105072 () Bool)

(assert (=> mapNonEmpty!55099 (= mapRes!55099 (and tp!105072 e!750240))))

(declare-fun mapRest!55099 () (Array (_ BitVec 32) ValueCell!16925))

(declare-fun mapValue!55099 () ValueCell!16925)

(declare-fun mapKey!55099 () (_ BitVec 32))

(assert (=> mapNonEmpty!55099 (= (arr!42610 _values!1354) (store mapRest!55099 mapKey!55099 mapValue!55099))))

(declare-fun b!1315196 () Bool)

(declare-fun res!873111 () Bool)

(assert (=> b!1315196 (=> (not res!873111) (not e!750238))))

(declare-datatypes ((List!30222 0))(
  ( (Nil!30219) (Cons!30218 (h!31427 (_ BitVec 64)) (t!43828 List!30222)) )
))
(declare-fun arrayNoDuplicates!0 (array!88258 (_ BitVec 32) List!30222) Bool)

(assert (=> b!1315196 (= res!873111 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30219))))

(declare-fun b!1315190 () Bool)

(declare-fun res!873105 () Bool)

(assert (=> b!1315190 (=> (not res!873105) (not e!750238))))

(assert (=> b!1315190 (= res!873105 (not (= (select (arr!42609 _keys!1628) from!2020) k!1175)))))

(declare-fun res!873106 () Bool)

(assert (=> start!111082 (=> (not res!873106) (not e!750238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111082 (= res!873106 (validMask!0 mask!2040))))

(assert (=> start!111082 e!750238))

(assert (=> start!111082 tp!105073))

(declare-fun array_inv!32179 (array!88258) Bool)

(assert (=> start!111082 (array_inv!32179 _keys!1628)))

(assert (=> start!111082 true))

(assert (=> start!111082 tp_is_empty!35647))

(declare-fun e!750242 () Bool)

(declare-fun array_inv!32180 (array!88260) Bool)

(assert (=> start!111082 (and (array_inv!32180 _values!1354) e!750242)))

(declare-fun mapIsEmpty!55099 () Bool)

(assert (=> mapIsEmpty!55099 mapRes!55099))

(declare-fun b!1315197 () Bool)

(assert (=> b!1315197 (= e!750242 (and e!750239 mapRes!55099))))

(declare-fun condMapEmpty!55099 () Bool)

(declare-fun mapDefault!55099 () ValueCell!16925)

