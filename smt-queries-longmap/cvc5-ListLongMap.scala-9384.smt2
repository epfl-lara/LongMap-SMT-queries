; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111740 () Bool)

(assert start!111740)

(declare-fun b_free!30397 () Bool)

(declare-fun b_next!30397 () Bool)

(assert (=> start!111740 (= b_free!30397 (not b_next!30397))))

(declare-fun tp!106666 () Bool)

(declare-fun b_and!48935 () Bool)

(assert (=> start!111740 (= tp!106666 b_and!48935)))

(declare-fun b!1324060 () Bool)

(declare-fun res!878855 () Bool)

(declare-fun e!754815 () Bool)

(assert (=> b!1324060 (=> (not res!878855) (not e!754815))))

(declare-datatypes ((array!89350 0))(
  ( (array!89351 (arr!43149 (Array (_ BitVec 32) (_ BitVec 64))) (size!43699 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89350)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1324060 (= res!878855 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43699 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324061 () Bool)

(declare-fun res!878857 () Bool)

(assert (=> b!1324061 (=> (not res!878857) (not e!754815))))

(declare-datatypes ((List!30585 0))(
  ( (Nil!30582) (Cons!30581 (h!31790 (_ BitVec 64)) (t!44511 List!30585)) )
))
(declare-fun arrayNoDuplicates!0 (array!89350 (_ BitVec 32) List!30585) Bool)

(assert (=> b!1324061 (= res!878857 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30582))))

(declare-fun mapNonEmpty!55973 () Bool)

(declare-fun mapRes!55973 () Bool)

(declare-fun tp!106667 () Bool)

(declare-fun e!754818 () Bool)

(assert (=> mapNonEmpty!55973 (= mapRes!55973 (and tp!106667 e!754818))))

(declare-datatypes ((V!53393 0))(
  ( (V!53394 (val!18183 Int)) )
))
(declare-datatypes ((ValueCell!17210 0))(
  ( (ValueCellFull!17210 (v!20813 V!53393)) (EmptyCell!17210) )
))
(declare-datatypes ((array!89352 0))(
  ( (array!89353 (arr!43150 (Array (_ BitVec 32) ValueCell!17210)) (size!43700 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89352)

(declare-fun mapRest!55973 () (Array (_ BitVec 32) ValueCell!17210))

(declare-fun mapKey!55973 () (_ BitVec 32))

(declare-fun mapValue!55973 () ValueCell!17210)

(assert (=> mapNonEmpty!55973 (= (arr!43150 _values!1337) (store mapRest!55973 mapKey!55973 mapValue!55973))))

(declare-fun mapIsEmpty!55973 () Bool)

(assert (=> mapIsEmpty!55973 mapRes!55973))

(declare-fun b!1324062 () Bool)

(declare-fun res!878858 () Bool)

(assert (=> b!1324062 (=> (not res!878858) (not e!754815))))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1324062 (= res!878858 (and (= (size!43700 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43699 _keys!1609) (size!43700 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!878854 () Bool)

(assert (=> start!111740 (=> (not res!878854) (not e!754815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111740 (= res!878854 (validMask!0 mask!2019))))

(assert (=> start!111740 e!754815))

(declare-fun array_inv!32573 (array!89350) Bool)

(assert (=> start!111740 (array_inv!32573 _keys!1609)))

(assert (=> start!111740 true))

(declare-fun tp_is_empty!36217 () Bool)

(assert (=> start!111740 tp_is_empty!36217))

(declare-fun e!754817 () Bool)

(declare-fun array_inv!32574 (array!89352) Bool)

(assert (=> start!111740 (and (array_inv!32574 _values!1337) e!754817)))

(assert (=> start!111740 tp!106666))

(declare-fun b!1324063 () Bool)

(declare-fun res!878856 () Bool)

(assert (=> b!1324063 (=> (not res!878856) (not e!754815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89350 (_ BitVec 32)) Bool)

(assert (=> b!1324063 (= res!878856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324064 () Bool)

(declare-fun e!754816 () Bool)

(assert (=> b!1324064 (= e!754816 tp_is_empty!36217)))

(declare-fun b!1324065 () Bool)

(assert (=> b!1324065 (= e!754815 false)))

(declare-fun zeroValue!1279 () V!53393)

(declare-fun minValue!1279 () V!53393)

(declare-fun lt!589428 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23444 0))(
  ( (tuple2!23445 (_1!11733 (_ BitVec 64)) (_2!11733 V!53393)) )
))
(declare-datatypes ((List!30586 0))(
  ( (Nil!30583) (Cons!30582 (h!31791 tuple2!23444) (t!44512 List!30586)) )
))
(declare-datatypes ((ListLongMap!21101 0))(
  ( (ListLongMap!21102 (toList!10566 List!30586)) )
))
(declare-fun contains!8721 (ListLongMap!21101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5562 (array!89350 array!89352 (_ BitVec 32) (_ BitVec 32) V!53393 V!53393 (_ BitVec 32) Int) ListLongMap!21101)

(assert (=> b!1324065 (= lt!589428 (contains!8721 (getCurrentListMap!5562 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324066 () Bool)

(assert (=> b!1324066 (= e!754817 (and e!754816 mapRes!55973))))

(declare-fun condMapEmpty!55973 () Bool)

(declare-fun mapDefault!55973 () ValueCell!17210)

