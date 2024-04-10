; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111076 () Bool)

(assert start!111076)

(declare-fun b_free!29911 () Bool)

(declare-fun b_next!29911 () Bool)

(assert (=> start!111076 (= b_free!29911 (not b_next!29911))))

(declare-fun tp!105054 () Bool)

(declare-fun b_and!48119 () Bool)

(assert (=> start!111076 (= tp!105054 b_and!48119)))

(declare-fun res!873052 () Bool)

(declare-fun e!750195 () Bool)

(assert (=> start!111076 (=> (not res!873052) (not e!750195))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111076 (= res!873052 (validMask!0 mask!2040))))

(assert (=> start!111076 e!750195))

(assert (=> start!111076 tp!105054))

(declare-datatypes ((array!88246 0))(
  ( (array!88247 (arr!42603 (Array (_ BitVec 32) (_ BitVec 64))) (size!43153 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88246)

(declare-fun array_inv!32175 (array!88246) Bool)

(assert (=> start!111076 (array_inv!32175 _keys!1628)))

(assert (=> start!111076 true))

(declare-fun tp_is_empty!35641 () Bool)

(assert (=> start!111076 tp_is_empty!35641))

(declare-datatypes ((V!52625 0))(
  ( (V!52626 (val!17895 Int)) )
))
(declare-datatypes ((ValueCell!16922 0))(
  ( (ValueCellFull!16922 (v!20522 V!52625)) (EmptyCell!16922) )
))
(declare-datatypes ((array!88248 0))(
  ( (array!88249 (arr!42604 (Array (_ BitVec 32) ValueCell!16922)) (size!43154 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88248)

(declare-fun e!750197 () Bool)

(declare-fun array_inv!32176 (array!88248) Bool)

(assert (=> start!111076 (and (array_inv!32176 _values!1354) e!750197)))

(declare-fun b!1315106 () Bool)

(declare-fun res!873050 () Bool)

(assert (=> b!1315106 (=> (not res!873050) (not e!750195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88246 (_ BitVec 32)) Bool)

(assert (=> b!1315106 (= res!873050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315107 () Bool)

(assert (=> b!1315107 (= e!750195 false)))

(declare-fun lt!585876 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52625)

(declare-fun zeroValue!1296 () V!52625)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!23080 0))(
  ( (tuple2!23081 (_1!11551 (_ BitVec 64)) (_2!11551 V!52625)) )
))
(declare-datatypes ((List!30216 0))(
  ( (Nil!30213) (Cons!30212 (h!31421 tuple2!23080) (t!43822 List!30216)) )
))
(declare-datatypes ((ListLongMap!20737 0))(
  ( (ListLongMap!20738 (toList!10384 List!30216)) )
))
(declare-fun contains!8534 (ListLongMap!20737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5397 (array!88246 array!88248 (_ BitVec 32) (_ BitVec 32) V!52625 V!52625 (_ BitVec 32) Int) ListLongMap!20737)

(assert (=> b!1315107 (= lt!585876 (contains!8534 (getCurrentListMap!5397 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!55090 () Bool)

(declare-fun mapRes!55090 () Bool)

(declare-fun tp!105055 () Bool)

(declare-fun e!750193 () Bool)

(assert (=> mapNonEmpty!55090 (= mapRes!55090 (and tp!105055 e!750193))))

(declare-fun mapRest!55090 () (Array (_ BitVec 32) ValueCell!16922))

(declare-fun mapValue!55090 () ValueCell!16922)

(declare-fun mapKey!55090 () (_ BitVec 32))

(assert (=> mapNonEmpty!55090 (= (arr!42604 _values!1354) (store mapRest!55090 mapKey!55090 mapValue!55090))))

(declare-fun mapIsEmpty!55090 () Bool)

(assert (=> mapIsEmpty!55090 mapRes!55090))

(declare-fun b!1315108 () Bool)

(assert (=> b!1315108 (= e!750193 tp_is_empty!35641)))

(declare-fun b!1315109 () Bool)

(declare-fun res!873051 () Bool)

(assert (=> b!1315109 (=> (not res!873051) (not e!750195))))

(assert (=> b!1315109 (= res!873051 (and (= (size!43154 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43153 _keys!1628) (size!43154 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315110 () Bool)

(declare-fun res!873053 () Bool)

(assert (=> b!1315110 (=> (not res!873053) (not e!750195))))

(declare-datatypes ((List!30217 0))(
  ( (Nil!30214) (Cons!30213 (h!31422 (_ BitVec 64)) (t!43823 List!30217)) )
))
(declare-fun arrayNoDuplicates!0 (array!88246 (_ BitVec 32) List!30217) Bool)

(assert (=> b!1315110 (= res!873053 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30214))))

(declare-fun b!1315111 () Bool)

(declare-fun res!873054 () Bool)

(assert (=> b!1315111 (=> (not res!873054) (not e!750195))))

(assert (=> b!1315111 (= res!873054 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43153 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315112 () Bool)

(declare-fun e!750194 () Bool)

(assert (=> b!1315112 (= e!750197 (and e!750194 mapRes!55090))))

(declare-fun condMapEmpty!55090 () Bool)

(declare-fun mapDefault!55090 () ValueCell!16922)

