; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112416 () Bool)

(assert start!112416)

(declare-fun b_free!30811 () Bool)

(declare-fun b_next!30811 () Bool)

(assert (=> start!112416 (= b_free!30811 (not b_next!30811))))

(declare-fun tp!108069 () Bool)

(declare-fun b_and!49653 () Bool)

(assert (=> start!112416 (= tp!108069 b_and!49653)))

(declare-fun b!1332795 () Bool)

(declare-fun e!759285 () Bool)

(declare-fun tp_is_empty!36721 () Bool)

(assert (=> b!1332795 (= e!759285 tp_is_empty!36721)))

(declare-fun b!1332796 () Bool)

(declare-fun res!884457 () Bool)

(declare-fun e!759286 () Bool)

(assert (=> b!1332796 (=> (not res!884457) (not e!759286))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90318 0))(
  ( (array!90319 (arr!43625 (Array (_ BitVec 32) (_ BitVec 64))) (size!44175 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90318)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332796 (= res!884457 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44175 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332797 () Bool)

(assert (=> b!1332797 (= e!759286 false)))

(declare-datatypes ((V!54065 0))(
  ( (V!54066 (val!18435 Int)) )
))
(declare-datatypes ((ValueCell!17462 0))(
  ( (ValueCellFull!17462 (v!21072 V!54065)) (EmptyCell!17462) )
))
(declare-datatypes ((array!90320 0))(
  ( (array!90321 (arr!43626 (Array (_ BitVec 32) ValueCell!17462)) (size!44176 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90320)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592069 () Bool)

(declare-fun minValue!1262 () V!54065)

(declare-fun zeroValue!1262 () V!54065)

(declare-datatypes ((tuple2!23758 0))(
  ( (tuple2!23759 (_1!11890 (_ BitVec 64)) (_2!11890 V!54065)) )
))
(declare-datatypes ((List!30903 0))(
  ( (Nil!30900) (Cons!30899 (h!32108 tuple2!23758) (t!45101 List!30903)) )
))
(declare-datatypes ((ListLongMap!21415 0))(
  ( (ListLongMap!21416 (toList!10723 List!30903)) )
))
(declare-fun contains!8887 (ListLongMap!21415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5704 (array!90318 array!90320 (_ BitVec 32) (_ BitVec 32) V!54065 V!54065 (_ BitVec 32) Int) ListLongMap!21415)

(assert (=> b!1332797 (= lt!592069 (contains!8887 (getCurrentListMap!5704 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun res!884456 () Bool)

(assert (=> start!112416 (=> (not res!884456) (not e!759286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112416 (= res!884456 (validMask!0 mask!1998))))

(assert (=> start!112416 e!759286))

(declare-fun e!759282 () Bool)

(declare-fun array_inv!32907 (array!90320) Bool)

(assert (=> start!112416 (and (array_inv!32907 _values!1320) e!759282)))

(assert (=> start!112416 true))

(declare-fun array_inv!32908 (array!90318) Bool)

(assert (=> start!112416 (array_inv!32908 _keys!1590)))

(assert (=> start!112416 tp!108069))

(assert (=> start!112416 tp_is_empty!36721))

(declare-fun b!1332798 () Bool)

(declare-fun res!884454 () Bool)

(assert (=> b!1332798 (=> (not res!884454) (not e!759286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90318 (_ BitVec 32)) Bool)

(assert (=> b!1332798 (= res!884454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56755 () Bool)

(declare-fun mapRes!56755 () Bool)

(assert (=> mapIsEmpty!56755 mapRes!56755))

(declare-fun mapNonEmpty!56755 () Bool)

(declare-fun tp!108070 () Bool)

(declare-fun e!759284 () Bool)

(assert (=> mapNonEmpty!56755 (= mapRes!56755 (and tp!108070 e!759284))))

(declare-fun mapRest!56755 () (Array (_ BitVec 32) ValueCell!17462))

(declare-fun mapValue!56755 () ValueCell!17462)

(declare-fun mapKey!56755 () (_ BitVec 32))

(assert (=> mapNonEmpty!56755 (= (arr!43626 _values!1320) (store mapRest!56755 mapKey!56755 mapValue!56755))))

(declare-fun b!1332799 () Bool)

(assert (=> b!1332799 (= e!759282 (and e!759285 mapRes!56755))))

(declare-fun condMapEmpty!56755 () Bool)

(declare-fun mapDefault!56755 () ValueCell!17462)

