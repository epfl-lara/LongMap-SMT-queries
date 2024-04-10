; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113196 () Bool)

(assert start!113196)

(declare-fun b_free!31247 () Bool)

(declare-fun b_next!31247 () Bool)

(assert (=> start!113196 (= b_free!31247 (not b_next!31247))))

(declare-fun tp!109546 () Bool)

(declare-fun b_and!50401 () Bool)

(assert (=> start!113196 (= tp!109546 b_and!50401)))

(declare-fun mapNonEmpty!57577 () Bool)

(declare-fun mapRes!57577 () Bool)

(declare-fun tp!109545 () Bool)

(declare-fun e!764332 () Bool)

(assert (=> mapNonEmpty!57577 (= mapRes!57577 (and tp!109545 e!764332))))

(declare-datatypes ((V!54765 0))(
  ( (V!54766 (val!18698 Int)) )
))
(declare-datatypes ((ValueCell!17725 0))(
  ( (ValueCellFull!17725 (v!21346 V!54765)) (EmptyCell!17725) )
))
(declare-fun mapRest!57577 () (Array (_ BitVec 32) ValueCell!17725))

(declare-fun mapValue!57577 () ValueCell!17725)

(declare-fun mapKey!57577 () (_ BitVec 32))

(declare-datatypes ((array!91342 0))(
  ( (array!91343 (arr!44127 (Array (_ BitVec 32) ValueCell!17725)) (size!44677 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91342)

(assert (=> mapNonEmpty!57577 (= (arr!44127 _values!1303) (store mapRest!57577 mapKey!57577 mapValue!57577))))

(declare-fun b!1342587 () Bool)

(declare-fun res!890736 () Bool)

(declare-fun e!764330 () Bool)

(assert (=> b!1342587 (=> (not res!890736) (not e!764330))))

(declare-datatypes ((array!91344 0))(
  ( (array!91345 (arr!44128 (Array (_ BitVec 32) (_ BitVec 64))) (size!44678 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91344)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1342587 (= res!890736 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44678 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!890737 () Bool)

(assert (=> start!113196 (=> (not res!890737) (not e!764330))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113196 (= res!890737 (validMask!0 mask!1977))))

(assert (=> start!113196 e!764330))

(declare-fun tp_is_empty!37247 () Bool)

(assert (=> start!113196 tp_is_empty!37247))

(assert (=> start!113196 true))

(declare-fun array_inv!33259 (array!91344) Bool)

(assert (=> start!113196 (array_inv!33259 _keys!1571)))

(declare-fun e!764331 () Bool)

(declare-fun array_inv!33260 (array!91342) Bool)

(assert (=> start!113196 (and (array_inv!33260 _values!1303) e!764331)))

(assert (=> start!113196 tp!109546))

(declare-fun b!1342588 () Bool)

(declare-fun res!890739 () Bool)

(assert (=> b!1342588 (=> (not res!890739) (not e!764330))))

(assert (=> b!1342588 (= res!890739 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342589 () Bool)

(declare-fun e!764333 () Bool)

(assert (=> b!1342589 (= e!764333 tp_is_empty!37247)))

(declare-fun mapIsEmpty!57577 () Bool)

(assert (=> mapIsEmpty!57577 mapRes!57577))

(declare-fun b!1342590 () Bool)

(declare-fun res!890734 () Bool)

(assert (=> b!1342590 (=> (not res!890734) (not e!764330))))

(declare-datatypes ((List!31239 0))(
  ( (Nil!31236) (Cons!31235 (h!32444 (_ BitVec 64)) (t!45697 List!31239)) )
))
(declare-fun arrayNoDuplicates!0 (array!91344 (_ BitVec 32) List!31239) Bool)

(assert (=> b!1342590 (= res!890734 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31236))))

(declare-fun b!1342591 () Bool)

(declare-fun res!890733 () Bool)

(assert (=> b!1342591 (=> (not res!890733) (not e!764330))))

(declare-fun minValue!1245 () V!54765)

(declare-fun zeroValue!1245 () V!54765)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24082 0))(
  ( (tuple2!24083 (_1!12052 (_ BitVec 64)) (_2!12052 V!54765)) )
))
(declare-datatypes ((List!31240 0))(
  ( (Nil!31237) (Cons!31236 (h!32445 tuple2!24082) (t!45698 List!31240)) )
))
(declare-datatypes ((ListLongMap!21739 0))(
  ( (ListLongMap!21740 (toList!10885 List!31240)) )
))
(declare-fun contains!9061 (ListLongMap!21739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5848 (array!91344 array!91342 (_ BitVec 32) (_ BitVec 32) V!54765 V!54765 (_ BitVec 32) Int) ListLongMap!21739)

(assert (=> b!1342591 (= res!890733 (contains!9061 (getCurrentListMap!5848 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1342592 () Bool)

(declare-fun res!890735 () Bool)

(assert (=> b!1342592 (=> (not res!890735) (not e!764330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342592 (= res!890735 (validKeyInArray!0 (select (arr!44128 _keys!1571) from!1960)))))

(declare-fun b!1342593 () Bool)

(assert (=> b!1342593 (= e!764331 (and e!764333 mapRes!57577))))

(declare-fun condMapEmpty!57577 () Bool)

(declare-fun mapDefault!57577 () ValueCell!17725)

