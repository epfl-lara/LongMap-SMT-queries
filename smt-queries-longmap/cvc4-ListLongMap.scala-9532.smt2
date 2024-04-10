; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113058 () Bool)

(assert start!113058)

(declare-fun b_free!31109 () Bool)

(declare-fun b_next!31109 () Bool)

(assert (=> start!113058 (= b_free!31109 (not b_next!31109))))

(declare-fun tp!109131 () Bool)

(declare-fun b_and!50139 () Bool)

(assert (=> start!113058 (= tp!109131 b_and!50139)))

(declare-fun b!1340028 () Bool)

(declare-fun res!888917 () Bool)

(declare-fun e!763295 () Bool)

(assert (=> b!1340028 (=> (not res!888917) (not e!763295))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91072 0))(
  ( (array!91073 (arr!43992 (Array (_ BitVec 32) (_ BitVec 64))) (size!44542 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91072)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340028 (= res!888917 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44542 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57370 () Bool)

(declare-fun mapRes!57370 () Bool)

(assert (=> mapIsEmpty!57370 mapRes!57370))

(declare-fun b!1340029 () Bool)

(assert (=> b!1340029 (= e!763295 false)))

(declare-datatypes ((V!54581 0))(
  ( (V!54582 (val!18629 Int)) )
))
(declare-fun minValue!1245 () V!54581)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun lt!593958 () Bool)

(declare-fun zeroValue!1245 () V!54581)

(declare-datatypes ((ValueCell!17656 0))(
  ( (ValueCellFull!17656 (v!21277 V!54581)) (EmptyCell!17656) )
))
(declare-datatypes ((array!91074 0))(
  ( (array!91075 (arr!43993 (Array (_ BitVec 32) ValueCell!17656)) (size!44543 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91074)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!23972 0))(
  ( (tuple2!23973 (_1!11997 (_ BitVec 64)) (_2!11997 V!54581)) )
))
(declare-datatypes ((List!31139 0))(
  ( (Nil!31136) (Cons!31135 (h!32344 tuple2!23972) (t!45471 List!31139)) )
))
(declare-datatypes ((ListLongMap!21629 0))(
  ( (ListLongMap!21630 (toList!10830 List!31139)) )
))
(declare-fun contains!9006 (ListLongMap!21629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5799 (array!91072 array!91074 (_ BitVec 32) (_ BitVec 32) V!54581 V!54581 (_ BitVec 32) Int) ListLongMap!21629)

(assert (=> b!1340029 (= lt!593958 (contains!9006 (getCurrentListMap!5799 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapNonEmpty!57370 () Bool)

(declare-fun tp!109132 () Bool)

(declare-fun e!763298 () Bool)

(assert (=> mapNonEmpty!57370 (= mapRes!57370 (and tp!109132 e!763298))))

(declare-fun mapKey!57370 () (_ BitVec 32))

(declare-fun mapRest!57370 () (Array (_ BitVec 32) ValueCell!17656))

(declare-fun mapValue!57370 () ValueCell!17656)

(assert (=> mapNonEmpty!57370 (= (arr!43993 _values!1303) (store mapRest!57370 mapKey!57370 mapValue!57370))))

(declare-fun b!1340030 () Bool)

(declare-fun res!888921 () Bool)

(assert (=> b!1340030 (=> (not res!888921) (not e!763295))))

(declare-datatypes ((List!31140 0))(
  ( (Nil!31137) (Cons!31136 (h!32345 (_ BitVec 64)) (t!45472 List!31140)) )
))
(declare-fun arrayNoDuplicates!0 (array!91072 (_ BitVec 32) List!31140) Bool)

(assert (=> b!1340030 (= res!888921 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31137))))

(declare-fun b!1340031 () Bool)

(declare-fun res!888920 () Bool)

(assert (=> b!1340031 (=> (not res!888920) (not e!763295))))

(assert (=> b!1340031 (= res!888920 (and (= (size!44543 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44542 _keys!1571) (size!44543 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888918 () Bool)

(assert (=> start!113058 (=> (not res!888918) (not e!763295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113058 (= res!888918 (validMask!0 mask!1977))))

(assert (=> start!113058 e!763295))

(declare-fun tp_is_empty!37109 () Bool)

(assert (=> start!113058 tp_is_empty!37109))

(assert (=> start!113058 true))

(declare-fun array_inv!33171 (array!91072) Bool)

(assert (=> start!113058 (array_inv!33171 _keys!1571)))

(declare-fun e!763294 () Bool)

(declare-fun array_inv!33172 (array!91074) Bool)

(assert (=> start!113058 (and (array_inv!33172 _values!1303) e!763294)))

(assert (=> start!113058 tp!109131))

(declare-fun b!1340032 () Bool)

(declare-fun e!763297 () Bool)

(assert (=> b!1340032 (= e!763297 tp_is_empty!37109)))

(declare-fun b!1340033 () Bool)

(assert (=> b!1340033 (= e!763298 tp_is_empty!37109)))

(declare-fun b!1340034 () Bool)

(declare-fun res!888919 () Bool)

(assert (=> b!1340034 (=> (not res!888919) (not e!763295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91072 (_ BitVec 32)) Bool)

(assert (=> b!1340034 (= res!888919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340035 () Bool)

(assert (=> b!1340035 (= e!763294 (and e!763297 mapRes!57370))))

(declare-fun condMapEmpty!57370 () Bool)

(declare-fun mapDefault!57370 () ValueCell!17656)

