; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111058 () Bool)

(assert start!111058)

(declare-fun b_free!29893 () Bool)

(declare-fun b_next!29893 () Bool)

(assert (=> start!111058 (= b_free!29893 (not b_next!29893))))

(declare-fun tp!105001 () Bool)

(declare-fun b_and!48101 () Bool)

(assert (=> start!111058 (= tp!105001 b_and!48101)))

(declare-fun res!872916 () Bool)

(declare-fun e!750062 () Bool)

(assert (=> start!111058 (=> (not res!872916) (not e!750062))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111058 (= res!872916 (validMask!0 mask!2040))))

(assert (=> start!111058 e!750062))

(assert (=> start!111058 tp!105001))

(declare-datatypes ((array!88210 0))(
  ( (array!88211 (arr!42585 (Array (_ BitVec 32) (_ BitVec 64))) (size!43135 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88210)

(declare-fun array_inv!32159 (array!88210) Bool)

(assert (=> start!111058 (array_inv!32159 _keys!1628)))

(assert (=> start!111058 true))

(declare-fun tp_is_empty!35623 () Bool)

(assert (=> start!111058 tp_is_empty!35623))

(declare-datatypes ((V!52601 0))(
  ( (V!52602 (val!17886 Int)) )
))
(declare-datatypes ((ValueCell!16913 0))(
  ( (ValueCellFull!16913 (v!20513 V!52601)) (EmptyCell!16913) )
))
(declare-datatypes ((array!88212 0))(
  ( (array!88213 (arr!42586 (Array (_ BitVec 32) ValueCell!16913)) (size!43136 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88212)

(declare-fun e!750058 () Bool)

(declare-fun array_inv!32160 (array!88212) Bool)

(assert (=> start!111058 (and (array_inv!32160 _values!1354) e!750058)))

(declare-fun b!1314890 () Bool)

(declare-fun e!750061 () Bool)

(assert (=> b!1314890 (= e!750061 tp_is_empty!35623)))

(declare-fun mapNonEmpty!55063 () Bool)

(declare-fun mapRes!55063 () Bool)

(declare-fun tp!105000 () Bool)

(assert (=> mapNonEmpty!55063 (= mapRes!55063 (and tp!105000 e!750061))))

(declare-fun mapValue!55063 () ValueCell!16913)

(declare-fun mapRest!55063 () (Array (_ BitVec 32) ValueCell!16913))

(declare-fun mapKey!55063 () (_ BitVec 32))

(assert (=> mapNonEmpty!55063 (= (arr!42586 _values!1354) (store mapRest!55063 mapKey!55063 mapValue!55063))))

(declare-fun b!1314891 () Bool)

(declare-fun res!872917 () Bool)

(assert (=> b!1314891 (=> (not res!872917) (not e!750062))))

(declare-datatypes ((List!30204 0))(
  ( (Nil!30201) (Cons!30200 (h!31409 (_ BitVec 64)) (t!43810 List!30204)) )
))
(declare-fun arrayNoDuplicates!0 (array!88210 (_ BitVec 32) List!30204) Bool)

(assert (=> b!1314891 (= res!872917 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30201))))

(declare-fun b!1314892 () Bool)

(declare-fun res!872918 () Bool)

(assert (=> b!1314892 (=> (not res!872918) (not e!750062))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314892 (= res!872918 (and (= (size!43136 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43135 _keys!1628) (size!43136 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314893 () Bool)

(declare-fun res!872919 () Bool)

(assert (=> b!1314893 (=> (not res!872919) (not e!750062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88210 (_ BitVec 32)) Bool)

(assert (=> b!1314893 (= res!872919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55063 () Bool)

(assert (=> mapIsEmpty!55063 mapRes!55063))

(declare-fun b!1314894 () Bool)

(declare-fun res!872915 () Bool)

(assert (=> b!1314894 (=> (not res!872915) (not e!750062))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314894 (= res!872915 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43135 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314895 () Bool)

(declare-fun e!750060 () Bool)

(assert (=> b!1314895 (= e!750058 (and e!750060 mapRes!55063))))

(declare-fun condMapEmpty!55063 () Bool)

(declare-fun mapDefault!55063 () ValueCell!16913)

