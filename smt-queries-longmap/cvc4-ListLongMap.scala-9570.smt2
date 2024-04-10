; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113286 () Bool)

(assert start!113286)

(declare-fun b_free!31337 () Bool)

(declare-fun b_next!31337 () Bool)

(assert (=> start!113286 (= b_free!31337 (not b_next!31337))))

(declare-fun tp!109816 () Bool)

(declare-fun b_and!50559 () Bool)

(assert (=> start!113286 (= tp!109816 b_and!50559)))

(declare-fun res!891807 () Bool)

(declare-fun e!765007 () Bool)

(assert (=> start!113286 (=> (not res!891807) (not e!765007))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113286 (= res!891807 (validMask!0 mask!1977))))

(assert (=> start!113286 e!765007))

(declare-fun tp_is_empty!37337 () Bool)

(assert (=> start!113286 tp_is_empty!37337))

(assert (=> start!113286 true))

(declare-datatypes ((array!91518 0))(
  ( (array!91519 (arr!44215 (Array (_ BitVec 32) (_ BitVec 64))) (size!44765 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91518)

(declare-fun array_inv!33323 (array!91518) Bool)

(assert (=> start!113286 (array_inv!33323 _keys!1571)))

(declare-datatypes ((V!54885 0))(
  ( (V!54886 (val!18743 Int)) )
))
(declare-datatypes ((ValueCell!17770 0))(
  ( (ValueCellFull!17770 (v!21391 V!54885)) (EmptyCell!17770) )
))
(declare-datatypes ((array!91520 0))(
  ( (array!91521 (arr!44216 (Array (_ BitVec 32) ValueCell!17770)) (size!44766 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91520)

(declare-fun e!765005 () Bool)

(declare-fun array_inv!33324 (array!91520) Bool)

(assert (=> start!113286 (and (array_inv!33324 _values!1303) e!765005)))

(assert (=> start!113286 tp!109816))

(declare-fun b!1344135 () Bool)

(declare-fun res!891809 () Bool)

(assert (=> b!1344135 (=> (not res!891809) (not e!765007))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344135 (= res!891809 (and (= (size!44766 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44765 _keys!1571) (size!44766 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344136 () Bool)

(declare-fun res!891808 () Bool)

(assert (=> b!1344136 (=> (not res!891808) (not e!765007))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344136 (= res!891808 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44765 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344137 () Bool)

(declare-fun res!891806 () Bool)

(assert (=> b!1344137 (=> (not res!891806) (not e!765007))))

(declare-datatypes ((List!31307 0))(
  ( (Nil!31304) (Cons!31303 (h!32512 (_ BitVec 64)) (t!45831 List!31307)) )
))
(declare-fun arrayNoDuplicates!0 (array!91518 (_ BitVec 32) List!31307) Bool)

(assert (=> b!1344137 (= res!891806 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31304))))

(declare-fun mapIsEmpty!57712 () Bool)

(declare-fun mapRes!57712 () Bool)

(assert (=> mapIsEmpty!57712 mapRes!57712))

(declare-fun mapNonEmpty!57712 () Bool)

(declare-fun tp!109815 () Bool)

(declare-fun e!765008 () Bool)

(assert (=> mapNonEmpty!57712 (= mapRes!57712 (and tp!109815 e!765008))))

(declare-fun mapValue!57712 () ValueCell!17770)

(declare-fun mapRest!57712 () (Array (_ BitVec 32) ValueCell!17770))

(declare-fun mapKey!57712 () (_ BitVec 32))

(assert (=> mapNonEmpty!57712 (= (arr!44216 _values!1303) (store mapRest!57712 mapKey!57712 mapValue!57712))))

(declare-fun b!1344138 () Bool)

(declare-fun res!891810 () Bool)

(assert (=> b!1344138 (=> (not res!891810) (not e!765007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91518 (_ BitVec 32)) Bool)

(assert (=> b!1344138 (= res!891810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344139 () Bool)

(declare-fun e!765006 () Bool)

(assert (=> b!1344139 (= e!765006 tp_is_empty!37337)))

(declare-fun b!1344140 () Bool)

(assert (=> b!1344140 (= e!765007 false)))

(declare-fun lt!595155 () Bool)

(declare-fun minValue!1245 () V!54885)

(declare-fun zeroValue!1245 () V!54885)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24152 0))(
  ( (tuple2!24153 (_1!12087 (_ BitVec 64)) (_2!12087 V!54885)) )
))
(declare-datatypes ((List!31308 0))(
  ( (Nil!31305) (Cons!31304 (h!32513 tuple2!24152) (t!45832 List!31308)) )
))
(declare-datatypes ((ListLongMap!21809 0))(
  ( (ListLongMap!21810 (toList!10920 List!31308)) )
))
(declare-fun contains!9096 (ListLongMap!21809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5876 (array!91518 array!91520 (_ BitVec 32) (_ BitVec 32) V!54885 V!54885 (_ BitVec 32) Int) ListLongMap!21809)

(assert (=> b!1344140 (= lt!595155 (contains!9096 (getCurrentListMap!5876 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344141 () Bool)

(assert (=> b!1344141 (= e!765005 (and e!765006 mapRes!57712))))

(declare-fun condMapEmpty!57712 () Bool)

(declare-fun mapDefault!57712 () ValueCell!17770)

