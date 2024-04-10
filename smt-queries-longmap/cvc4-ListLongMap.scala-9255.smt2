; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110882 () Bool)

(assert start!110882)

(declare-fun b_free!29717 () Bool)

(declare-fun b_next!29717 () Bool)

(assert (=> start!110882 (= b_free!29717 (not b_next!29717))))

(declare-fun tp!104472 () Bool)

(declare-fun b_and!47925 () Bool)

(assert (=> start!110882 (= tp!104472 b_and!47925)))

(declare-fun b!1312715 () Bool)

(declare-fun res!871534 () Bool)

(declare-fun e!748741 () Bool)

(assert (=> b!1312715 (=> (not res!871534) (not e!748741))))

(declare-datatypes ((array!87876 0))(
  ( (array!87877 (arr!42418 (Array (_ BitVec 32) (_ BitVec 64))) (size!42968 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87876)

(declare-datatypes ((List!30080 0))(
  ( (Nil!30077) (Cons!30076 (h!31285 (_ BitVec 64)) (t!43686 List!30080)) )
))
(declare-fun arrayNoDuplicates!0 (array!87876 (_ BitVec 32) List!30080) Bool)

(assert (=> b!1312715 (= res!871534 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30077))))

(declare-fun res!871536 () Bool)

(assert (=> start!110882 (=> (not res!871536) (not e!748741))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110882 (= res!871536 (validMask!0 mask!2040))))

(assert (=> start!110882 e!748741))

(assert (=> start!110882 tp!104472))

(declare-fun array_inv!32047 (array!87876) Bool)

(assert (=> start!110882 (array_inv!32047 _keys!1628)))

(assert (=> start!110882 true))

(declare-fun tp_is_empty!35447 () Bool)

(assert (=> start!110882 tp_is_empty!35447))

(declare-datatypes ((V!52365 0))(
  ( (V!52366 (val!17798 Int)) )
))
(declare-datatypes ((ValueCell!16825 0))(
  ( (ValueCellFull!16825 (v!20425 V!52365)) (EmptyCell!16825) )
))
(declare-datatypes ((array!87878 0))(
  ( (array!87879 (arr!42419 (Array (_ BitVec 32) ValueCell!16825)) (size!42969 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87878)

(declare-fun e!748742 () Bool)

(declare-fun array_inv!32048 (array!87878) Bool)

(assert (=> start!110882 (and (array_inv!32048 _values!1354) e!748742)))

(declare-fun b!1312716 () Bool)

(assert (=> b!1312716 (= e!748741 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52365)

(declare-fun zeroValue!1296 () V!52365)

(declare-fun lt!585594 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22942 0))(
  ( (tuple2!22943 (_1!11482 (_ BitVec 64)) (_2!11482 V!52365)) )
))
(declare-datatypes ((List!30081 0))(
  ( (Nil!30078) (Cons!30077 (h!31286 tuple2!22942) (t!43687 List!30081)) )
))
(declare-datatypes ((ListLongMap!20599 0))(
  ( (ListLongMap!20600 (toList!10315 List!30081)) )
))
(declare-fun contains!8465 (ListLongMap!20599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5328 (array!87876 array!87878 (_ BitVec 32) (_ BitVec 32) V!52365 V!52365 (_ BitVec 32) Int) ListLongMap!20599)

(assert (=> b!1312716 (= lt!585594 (contains!8465 (getCurrentListMap!5328 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312717 () Bool)

(declare-fun e!748740 () Bool)

(assert (=> b!1312717 (= e!748740 tp_is_empty!35447)))

(declare-fun b!1312718 () Bool)

(declare-fun e!748739 () Bool)

(assert (=> b!1312718 (= e!748739 tp_is_empty!35447)))

(declare-fun mapIsEmpty!54799 () Bool)

(declare-fun mapRes!54799 () Bool)

(assert (=> mapIsEmpty!54799 mapRes!54799))

(declare-fun b!1312719 () Bool)

(declare-fun res!871535 () Bool)

(assert (=> b!1312719 (=> (not res!871535) (not e!748741))))

(assert (=> b!1312719 (= res!871535 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42968 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54799 () Bool)

(declare-fun tp!104473 () Bool)

(assert (=> mapNonEmpty!54799 (= mapRes!54799 (and tp!104473 e!748740))))

(declare-fun mapValue!54799 () ValueCell!16825)

(declare-fun mapKey!54799 () (_ BitVec 32))

(declare-fun mapRest!54799 () (Array (_ BitVec 32) ValueCell!16825))

(assert (=> mapNonEmpty!54799 (= (arr!42419 _values!1354) (store mapRest!54799 mapKey!54799 mapValue!54799))))

(declare-fun b!1312720 () Bool)

(declare-fun res!871532 () Bool)

(assert (=> b!1312720 (=> (not res!871532) (not e!748741))))

(assert (=> b!1312720 (= res!871532 (and (= (size!42969 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42968 _keys!1628) (size!42969 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312721 () Bool)

(declare-fun res!871533 () Bool)

(assert (=> b!1312721 (=> (not res!871533) (not e!748741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87876 (_ BitVec 32)) Bool)

(assert (=> b!1312721 (= res!871533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312722 () Bool)

(assert (=> b!1312722 (= e!748742 (and e!748739 mapRes!54799))))

(declare-fun condMapEmpty!54799 () Bool)

(declare-fun mapDefault!54799 () ValueCell!16825)

