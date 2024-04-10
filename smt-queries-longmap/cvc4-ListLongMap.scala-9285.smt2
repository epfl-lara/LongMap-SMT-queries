; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111062 () Bool)

(assert start!111062)

(declare-fun b_free!29897 () Bool)

(declare-fun b_next!29897 () Bool)

(assert (=> start!111062 (= b_free!29897 (not b_next!29897))))

(declare-fun tp!105012 () Bool)

(declare-fun b_and!48105 () Bool)

(assert (=> start!111062 (= tp!105012 b_and!48105)))

(declare-fun mapNonEmpty!55069 () Bool)

(declare-fun mapRes!55069 () Bool)

(declare-fun tp!105013 () Bool)

(declare-fun e!750088 () Bool)

(assert (=> mapNonEmpty!55069 (= mapRes!55069 (and tp!105013 e!750088))))

(declare-datatypes ((V!52605 0))(
  ( (V!52606 (val!17888 Int)) )
))
(declare-datatypes ((ValueCell!16915 0))(
  ( (ValueCellFull!16915 (v!20515 V!52605)) (EmptyCell!16915) )
))
(declare-fun mapRest!55069 () (Array (_ BitVec 32) ValueCell!16915))

(declare-datatypes ((array!88218 0))(
  ( (array!88219 (arr!42589 (Array (_ BitVec 32) ValueCell!16915)) (size!43139 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88218)

(declare-fun mapKey!55069 () (_ BitVec 32))

(declare-fun mapValue!55069 () ValueCell!16915)

(assert (=> mapNonEmpty!55069 (= (arr!42589 _values!1354) (store mapRest!55069 mapKey!55069 mapValue!55069))))

(declare-fun b!1314938 () Bool)

(declare-fun tp_is_empty!35627 () Bool)

(assert (=> b!1314938 (= e!750088 tp_is_empty!35627)))

(declare-fun b!1314939 () Bool)

(declare-fun e!750090 () Bool)

(assert (=> b!1314939 (= e!750090 tp_is_empty!35627)))

(declare-fun b!1314940 () Bool)

(declare-fun e!750089 () Bool)

(assert (=> b!1314940 (= e!750089 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88220 0))(
  ( (array!88221 (arr!42590 (Array (_ BitVec 32) (_ BitVec 64))) (size!43140 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88220)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52605)

(declare-fun zeroValue!1296 () V!52605)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585855 () Bool)

(declare-datatypes ((tuple2!23070 0))(
  ( (tuple2!23071 (_1!11546 (_ BitVec 64)) (_2!11546 V!52605)) )
))
(declare-datatypes ((List!30207 0))(
  ( (Nil!30204) (Cons!30203 (h!31412 tuple2!23070) (t!43813 List!30207)) )
))
(declare-datatypes ((ListLongMap!20727 0))(
  ( (ListLongMap!20728 (toList!10379 List!30207)) )
))
(declare-fun contains!8529 (ListLongMap!20727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5392 (array!88220 array!88218 (_ BitVec 32) (_ BitVec 32) V!52605 V!52605 (_ BitVec 32) Int) ListLongMap!20727)

(assert (=> b!1314940 (= lt!585855 (contains!8529 (getCurrentListMap!5392 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!872948 () Bool)

(assert (=> start!111062 (=> (not res!872948) (not e!750089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111062 (= res!872948 (validMask!0 mask!2040))))

(assert (=> start!111062 e!750089))

(assert (=> start!111062 tp!105012))

(declare-fun array_inv!32163 (array!88220) Bool)

(assert (=> start!111062 (array_inv!32163 _keys!1628)))

(assert (=> start!111062 true))

(assert (=> start!111062 tp_is_empty!35627))

(declare-fun e!750091 () Bool)

(declare-fun array_inv!32164 (array!88218) Bool)

(assert (=> start!111062 (and (array_inv!32164 _values!1354) e!750091)))

(declare-fun mapIsEmpty!55069 () Bool)

(assert (=> mapIsEmpty!55069 mapRes!55069))

(declare-fun b!1314941 () Bool)

(declare-fun res!872945 () Bool)

(assert (=> b!1314941 (=> (not res!872945) (not e!750089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88220 (_ BitVec 32)) Bool)

(assert (=> b!1314941 (= res!872945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314942 () Bool)

(assert (=> b!1314942 (= e!750091 (and e!750090 mapRes!55069))))

(declare-fun condMapEmpty!55069 () Bool)

(declare-fun mapDefault!55069 () ValueCell!16915)

