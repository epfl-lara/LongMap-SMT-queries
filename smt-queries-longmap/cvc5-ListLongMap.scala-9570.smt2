; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113282 () Bool)

(assert start!113282)

(declare-fun b_free!31333 () Bool)

(declare-fun b_next!31333 () Bool)

(assert (=> start!113282 (= b_free!31333 (not b_next!31333))))

(declare-fun tp!109803 () Bool)

(declare-fun b_and!50555 () Bool)

(assert (=> start!113282 (= tp!109803 b_and!50555)))

(declare-fun mapNonEmpty!57706 () Bool)

(declare-fun mapRes!57706 () Bool)

(declare-fun tp!109804 () Bool)

(declare-fun e!764976 () Bool)

(assert (=> mapNonEmpty!57706 (= mapRes!57706 (and tp!109804 e!764976))))

(declare-fun mapKey!57706 () (_ BitVec 32))

(declare-datatypes ((V!54881 0))(
  ( (V!54882 (val!18741 Int)) )
))
(declare-datatypes ((ValueCell!17768 0))(
  ( (ValueCellFull!17768 (v!21389 V!54881)) (EmptyCell!17768) )
))
(declare-fun mapRest!57706 () (Array (_ BitVec 32) ValueCell!17768))

(declare-datatypes ((array!91510 0))(
  ( (array!91511 (arr!44211 (Array (_ BitVec 32) ValueCell!17768)) (size!44761 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91510)

(declare-fun mapValue!57706 () ValueCell!17768)

(assert (=> mapNonEmpty!57706 (= (arr!44211 _values!1303) (store mapRest!57706 mapKey!57706 mapValue!57706))))

(declare-fun b!1344087 () Bool)

(declare-fun res!891776 () Bool)

(declare-fun e!764975 () Bool)

(assert (=> b!1344087 (=> (not res!891776) (not e!764975))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91512 0))(
  ( (array!91513 (arr!44212 (Array (_ BitVec 32) (_ BitVec 64))) (size!44762 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91512)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344087 (= res!891776 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44762 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344088 () Bool)

(declare-fun e!764974 () Bool)

(declare-fun tp_is_empty!37333 () Bool)

(assert (=> b!1344088 (= e!764974 tp_is_empty!37333)))

(declare-fun mapIsEmpty!57706 () Bool)

(assert (=> mapIsEmpty!57706 mapRes!57706))

(declare-fun b!1344089 () Bool)

(assert (=> b!1344089 (= e!764975 false)))

(declare-fun minValue!1245 () V!54881)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54881)

(declare-fun lt!595149 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24148 0))(
  ( (tuple2!24149 (_1!12085 (_ BitVec 64)) (_2!12085 V!54881)) )
))
(declare-datatypes ((List!31303 0))(
  ( (Nil!31300) (Cons!31299 (h!32508 tuple2!24148) (t!45827 List!31303)) )
))
(declare-datatypes ((ListLongMap!21805 0))(
  ( (ListLongMap!21806 (toList!10918 List!31303)) )
))
(declare-fun contains!9094 (ListLongMap!21805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5874 (array!91512 array!91510 (_ BitVec 32) (_ BitVec 32) V!54881 V!54881 (_ BitVec 32) Int) ListLongMap!21805)

(assert (=> b!1344089 (= lt!595149 (contains!9094 (getCurrentListMap!5874 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!891780 () Bool)

(assert (=> start!113282 (=> (not res!891780) (not e!764975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113282 (= res!891780 (validMask!0 mask!1977))))

(assert (=> start!113282 e!764975))

(assert (=> start!113282 tp_is_empty!37333))

(assert (=> start!113282 true))

(declare-fun array_inv!33319 (array!91512) Bool)

(assert (=> start!113282 (array_inv!33319 _keys!1571)))

(declare-fun e!764978 () Bool)

(declare-fun array_inv!33320 (array!91510) Bool)

(assert (=> start!113282 (and (array_inv!33320 _values!1303) e!764978)))

(assert (=> start!113282 tp!109803))

(declare-fun b!1344090 () Bool)

(assert (=> b!1344090 (= e!764976 tp_is_empty!37333)))

(declare-fun b!1344091 () Bool)

(declare-fun res!891779 () Bool)

(assert (=> b!1344091 (=> (not res!891779) (not e!764975))))

(assert (=> b!1344091 (= res!891779 (and (= (size!44761 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44762 _keys!1571) (size!44761 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344092 () Bool)

(declare-fun res!891777 () Bool)

(assert (=> b!1344092 (=> (not res!891777) (not e!764975))))

(declare-datatypes ((List!31304 0))(
  ( (Nil!31301) (Cons!31300 (h!32509 (_ BitVec 64)) (t!45828 List!31304)) )
))
(declare-fun arrayNoDuplicates!0 (array!91512 (_ BitVec 32) List!31304) Bool)

(assert (=> b!1344092 (= res!891777 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31301))))

(declare-fun b!1344093 () Bool)

(assert (=> b!1344093 (= e!764978 (and e!764974 mapRes!57706))))

(declare-fun condMapEmpty!57706 () Bool)

(declare-fun mapDefault!57706 () ValueCell!17768)

