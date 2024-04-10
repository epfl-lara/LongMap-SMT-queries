; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110926 () Bool)

(assert start!110926)

(declare-fun b_free!29761 () Bool)

(declare-fun b_next!29761 () Bool)

(assert (=> start!110926 (= b_free!29761 (not b_next!29761))))

(declare-fun tp!104605 () Bool)

(declare-fun b_and!47969 () Bool)

(assert (=> start!110926 (= tp!104605 b_and!47969)))

(declare-fun res!871891 () Bool)

(declare-fun e!749068 () Bool)

(assert (=> start!110926 (=> (not res!871891) (not e!749068))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110926 (= res!871891 (validMask!0 mask!2040))))

(assert (=> start!110926 e!749068))

(assert (=> start!110926 tp!104605))

(declare-datatypes ((array!87964 0))(
  ( (array!87965 (arr!42462 (Array (_ BitVec 32) (_ BitVec 64))) (size!43012 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87964)

(declare-fun array_inv!32077 (array!87964) Bool)

(assert (=> start!110926 (array_inv!32077 _keys!1628)))

(assert (=> start!110926 true))

(declare-fun tp_is_empty!35491 () Bool)

(assert (=> start!110926 tp_is_empty!35491))

(declare-datatypes ((V!52425 0))(
  ( (V!52426 (val!17820 Int)) )
))
(declare-datatypes ((ValueCell!16847 0))(
  ( (ValueCellFull!16847 (v!20447 V!52425)) (EmptyCell!16847) )
))
(declare-datatypes ((array!87966 0))(
  ( (array!87967 (arr!42463 (Array (_ BitVec 32) ValueCell!16847)) (size!43013 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87966)

(declare-fun e!749070 () Bool)

(declare-fun array_inv!32078 (array!87966) Bool)

(assert (=> start!110926 (and (array_inv!32078 _values!1354) e!749070)))

(declare-fun b!1313270 () Bool)

(declare-fun res!871889 () Bool)

(assert (=> b!1313270 (=> (not res!871889) (not e!749068))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313270 (= res!871889 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43012 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313271 () Bool)

(declare-fun res!871892 () Bool)

(assert (=> b!1313271 (=> (not res!871892) (not e!749068))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313271 (= res!871892 (and (= (size!43013 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43012 _keys!1628) (size!43013 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313272 () Bool)

(declare-fun res!871890 () Bool)

(assert (=> b!1313272 (=> (not res!871890) (not e!749068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87964 (_ BitVec 32)) Bool)

(assert (=> b!1313272 (= res!871890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313273 () Bool)

(declare-fun res!871893 () Bool)

(assert (=> b!1313273 (=> (not res!871893) (not e!749068))))

(declare-datatypes ((List!30112 0))(
  ( (Nil!30109) (Cons!30108 (h!31317 (_ BitVec 64)) (t!43718 List!30112)) )
))
(declare-fun arrayNoDuplicates!0 (array!87964 (_ BitVec 32) List!30112) Bool)

(assert (=> b!1313273 (= res!871893 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30109))))

(declare-fun b!1313274 () Bool)

(declare-fun e!749071 () Bool)

(declare-fun mapRes!54865 () Bool)

(assert (=> b!1313274 (= e!749070 (and e!749071 mapRes!54865))))

(declare-fun condMapEmpty!54865 () Bool)

(declare-fun mapDefault!54865 () ValueCell!16847)

