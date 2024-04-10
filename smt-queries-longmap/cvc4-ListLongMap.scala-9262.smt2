; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110924 () Bool)

(assert start!110924)

(declare-fun b_free!29759 () Bool)

(declare-fun b_next!29759 () Bool)

(assert (=> start!110924 (= b_free!29759 (not b_next!29759))))

(declare-fun tp!104599 () Bool)

(declare-fun b_and!47967 () Bool)

(assert (=> start!110924 (= tp!104599 b_and!47967)))

(declare-fun b!1313246 () Bool)

(declare-fun res!871875 () Bool)

(declare-fun e!749054 () Bool)

(assert (=> b!1313246 (=> (not res!871875) (not e!749054))))

(declare-datatypes ((array!87960 0))(
  ( (array!87961 (arr!42460 (Array (_ BitVec 32) (_ BitVec 64))) (size!43010 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87960)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313246 (= res!871875 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43010 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313247 () Bool)

(declare-fun e!749057 () Bool)

(declare-fun tp_is_empty!35489 () Bool)

(assert (=> b!1313247 (= e!749057 tp_is_empty!35489)))

(declare-fun b!1313248 () Bool)

(declare-fun e!749056 () Bool)

(assert (=> b!1313248 (= e!749056 tp_is_empty!35489)))

(declare-fun mapNonEmpty!54862 () Bool)

(declare-fun mapRes!54862 () Bool)

(declare-fun tp!104598 () Bool)

(assert (=> mapNonEmpty!54862 (= mapRes!54862 (and tp!104598 e!749056))))

(declare-fun mapKey!54862 () (_ BitVec 32))

(declare-datatypes ((V!52421 0))(
  ( (V!52422 (val!17819 Int)) )
))
(declare-datatypes ((ValueCell!16846 0))(
  ( (ValueCellFull!16846 (v!20446 V!52421)) (EmptyCell!16846) )
))
(declare-fun mapValue!54862 () ValueCell!16846)

(declare-datatypes ((array!87962 0))(
  ( (array!87963 (arr!42461 (Array (_ BitVec 32) ValueCell!16846)) (size!43011 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87962)

(declare-fun mapRest!54862 () (Array (_ BitVec 32) ValueCell!16846))

(assert (=> mapNonEmpty!54862 (= (arr!42461 _values!1354) (store mapRest!54862 mapKey!54862 mapValue!54862))))

(declare-fun b!1313249 () Bool)

(declare-fun res!871874 () Bool)

(assert (=> b!1313249 (=> (not res!871874) (not e!749054))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1313249 (= res!871874 (and (= (size!43011 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43010 _keys!1628) (size!43011 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313250 () Bool)

(declare-fun res!871876 () Bool)

(assert (=> b!1313250 (=> (not res!871876) (not e!749054))))

(declare-datatypes ((List!30111 0))(
  ( (Nil!30108) (Cons!30107 (h!31316 (_ BitVec 64)) (t!43717 List!30111)) )
))
(declare-fun arrayNoDuplicates!0 (array!87960 (_ BitVec 32) List!30111) Bool)

(assert (=> b!1313250 (= res!871876 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30108))))

(declare-fun res!871877 () Bool)

(assert (=> start!110924 (=> (not res!871877) (not e!749054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110924 (= res!871877 (validMask!0 mask!2040))))

(assert (=> start!110924 e!749054))

(assert (=> start!110924 tp!104599))

(declare-fun array_inv!32075 (array!87960) Bool)

(assert (=> start!110924 (array_inv!32075 _keys!1628)))

(assert (=> start!110924 true))

(assert (=> start!110924 tp_is_empty!35489))

(declare-fun e!749053 () Bool)

(declare-fun array_inv!32076 (array!87962) Bool)

(assert (=> start!110924 (and (array_inv!32076 _values!1354) e!749053)))

(declare-fun b!1313251 () Bool)

(assert (=> b!1313251 (= e!749053 (and e!749057 mapRes!54862))))

(declare-fun condMapEmpty!54862 () Bool)

(declare-fun mapDefault!54862 () ValueCell!16846)

