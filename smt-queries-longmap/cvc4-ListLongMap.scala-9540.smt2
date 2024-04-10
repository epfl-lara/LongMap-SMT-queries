; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113106 () Bool)

(assert start!113106)

(declare-fun b_free!31157 () Bool)

(declare-fun b_next!31157 () Bool)

(assert (=> start!113106 (= b_free!31157 (not b_next!31157))))

(declare-fun tp!109275 () Bool)

(declare-fun b_and!50221 () Bool)

(assert (=> start!113106 (= tp!109275 b_and!50221)))

(declare-fun mapNonEmpty!57442 () Bool)

(declare-fun mapRes!57442 () Bool)

(declare-fun tp!109276 () Bool)

(declare-fun e!763654 () Bool)

(assert (=> mapNonEmpty!57442 (= mapRes!57442 (and tp!109276 e!763654))))

(declare-datatypes ((V!54645 0))(
  ( (V!54646 (val!18653 Int)) )
))
(declare-datatypes ((ValueCell!17680 0))(
  ( (ValueCellFull!17680 (v!21301 V!54645)) (EmptyCell!17680) )
))
(declare-fun mapRest!57442 () (Array (_ BitVec 32) ValueCell!17680))

(declare-fun mapValue!57442 () ValueCell!17680)

(declare-fun mapKey!57442 () (_ BitVec 32))

(declare-datatypes ((array!91166 0))(
  ( (array!91167 (arr!44039 (Array (_ BitVec 32) ValueCell!17680)) (size!44589 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91166)

(assert (=> mapNonEmpty!57442 (= (arr!44039 _values!1303) (store mapRest!57442 mapKey!57442 mapValue!57442))))

(declare-fun mapIsEmpty!57442 () Bool)

(assert (=> mapIsEmpty!57442 mapRes!57442))

(declare-fun b!1340877 () Bool)

(declare-fun e!763655 () Bool)

(declare-fun tp_is_empty!37157 () Bool)

(assert (=> b!1340877 (= e!763655 tp_is_empty!37157)))

(declare-fun b!1340878 () Bool)

(declare-fun res!889524 () Bool)

(declare-fun e!763658 () Bool)

(assert (=> b!1340878 (=> (not res!889524) (not e!763658))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91168 0))(
  ( (array!91169 (arr!44040 (Array (_ BitVec 32) (_ BitVec 64))) (size!44590 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91168)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340878 (= res!889524 (not (= (select (arr!44040 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340880 () Bool)

(declare-fun res!889519 () Bool)

(assert (=> b!1340880 (=> (not res!889519) (not e!763658))))

(declare-datatypes ((List!31176 0))(
  ( (Nil!31173) (Cons!31172 (h!32381 (_ BitVec 64)) (t!45544 List!31176)) )
))
(declare-fun arrayNoDuplicates!0 (array!91168 (_ BitVec 32) List!31176) Bool)

(assert (=> b!1340880 (= res!889519 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31173))))

(declare-fun b!1340881 () Bool)

(declare-fun res!889523 () Bool)

(assert (=> b!1340881 (=> (not res!889523) (not e!763658))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340881 (= res!889523 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44590 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340882 () Bool)

(declare-fun res!889520 () Bool)

(assert (=> b!1340882 (=> (not res!889520) (not e!763658))))

(declare-fun minValue!1245 () V!54645)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54645)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24014 0))(
  ( (tuple2!24015 (_1!12018 (_ BitVec 64)) (_2!12018 V!54645)) )
))
(declare-datatypes ((List!31177 0))(
  ( (Nil!31174) (Cons!31173 (h!32382 tuple2!24014) (t!45545 List!31177)) )
))
(declare-datatypes ((ListLongMap!21671 0))(
  ( (ListLongMap!21672 (toList!10851 List!31177)) )
))
(declare-fun contains!9027 (ListLongMap!21671 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5818 (array!91168 array!91166 (_ BitVec 32) (_ BitVec 32) V!54645 V!54645 (_ BitVec 32) Int) ListLongMap!21671)

(assert (=> b!1340882 (= res!889520 (contains!9027 (getCurrentListMap!5818 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1340883 () Bool)

(declare-fun e!763656 () Bool)

(assert (=> b!1340883 (= e!763656 (and e!763655 mapRes!57442))))

(declare-fun condMapEmpty!57442 () Bool)

(declare-fun mapDefault!57442 () ValueCell!17680)

