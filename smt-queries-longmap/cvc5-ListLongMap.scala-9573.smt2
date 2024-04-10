; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113300 () Bool)

(assert start!113300)

(declare-fun b_free!31351 () Bool)

(declare-fun b_next!31351 () Bool)

(assert (=> start!113300 (= b_free!31351 (not b_next!31351))))

(declare-fun tp!109857 () Bool)

(declare-fun b_and!50573 () Bool)

(assert (=> start!113300 (= tp!109857 b_and!50573)))

(declare-fun b!1344304 () Bool)

(declare-fun res!891913 () Bool)

(declare-fun e!765113 () Bool)

(assert (=> b!1344304 (=> (not res!891913) (not e!765113))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91544 0))(
  ( (array!91545 (arr!44228 (Array (_ BitVec 32) (_ BitVec 64))) (size!44778 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91544)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54905 0))(
  ( (V!54906 (val!18750 Int)) )
))
(declare-datatypes ((ValueCell!17777 0))(
  ( (ValueCellFull!17777 (v!21398 V!54905)) (EmptyCell!17777) )
))
(declare-datatypes ((array!91546 0))(
  ( (array!91547 (arr!44229 (Array (_ BitVec 32) ValueCell!17777)) (size!44779 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91546)

(assert (=> b!1344304 (= res!891913 (and (= (size!44779 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44778 _keys!1571) (size!44779 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57733 () Bool)

(declare-fun mapRes!57733 () Bool)

(assert (=> mapIsEmpty!57733 mapRes!57733))

(declare-fun b!1344305 () Bool)

(declare-fun e!765109 () Bool)

(declare-fun tp_is_empty!37351 () Bool)

(assert (=> b!1344305 (= e!765109 tp_is_empty!37351)))

(declare-fun b!1344306 () Bool)

(declare-fun res!891914 () Bool)

(assert (=> b!1344306 (=> (not res!891914) (not e!765113))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344306 (= res!891914 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44778 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57733 () Bool)

(declare-fun tp!109858 () Bool)

(declare-fun e!765111 () Bool)

(assert (=> mapNonEmpty!57733 (= mapRes!57733 (and tp!109858 e!765111))))

(declare-fun mapRest!57733 () (Array (_ BitVec 32) ValueCell!17777))

(declare-fun mapValue!57733 () ValueCell!17777)

(declare-fun mapKey!57733 () (_ BitVec 32))

(assert (=> mapNonEmpty!57733 (= (arr!44229 _values!1303) (store mapRest!57733 mapKey!57733 mapValue!57733))))

(declare-fun res!891912 () Bool)

(assert (=> start!113300 (=> (not res!891912) (not e!765113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113300 (= res!891912 (validMask!0 mask!1977))))

(assert (=> start!113300 e!765113))

(assert (=> start!113300 tp_is_empty!37351))

(assert (=> start!113300 true))

(declare-fun array_inv!33329 (array!91544) Bool)

(assert (=> start!113300 (array_inv!33329 _keys!1571)))

(declare-fun e!765110 () Bool)

(declare-fun array_inv!33330 (array!91546) Bool)

(assert (=> start!113300 (and (array_inv!33330 _values!1303) e!765110)))

(assert (=> start!113300 tp!109857))

(declare-fun b!1344303 () Bool)

(declare-fun res!891911 () Bool)

(assert (=> b!1344303 (=> (not res!891911) (not e!765113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91544 (_ BitVec 32)) Bool)

(assert (=> b!1344303 (= res!891911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344307 () Bool)

(assert (=> b!1344307 (= e!765111 tp_is_empty!37351)))

(declare-fun b!1344308 () Bool)

(assert (=> b!1344308 (= e!765110 (and e!765109 mapRes!57733))))

(declare-fun condMapEmpty!57733 () Bool)

(declare-fun mapDefault!57733 () ValueCell!17777)

