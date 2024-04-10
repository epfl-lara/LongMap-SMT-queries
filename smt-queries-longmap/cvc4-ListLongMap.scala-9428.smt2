; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112180 () Bool)

(assert start!112180)

(declare-fun b_free!30575 () Bool)

(declare-fun b_next!30575 () Bool)

(assert (=> start!112180 (= b_free!30575 (not b_next!30575))))

(declare-fun tp!107361 () Bool)

(declare-fun b_and!49225 () Bool)

(assert (=> start!112180 (= tp!107361 b_and!49225)))

(declare-fun mapIsEmpty!56401 () Bool)

(declare-fun mapRes!56401 () Bool)

(assert (=> mapIsEmpty!56401 mapRes!56401))

(declare-fun b!1328592 () Bool)

(declare-fun res!881505 () Bool)

(declare-fun e!757516 () Bool)

(assert (=> b!1328592 (=> (not res!881505) (not e!757516))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(declare-datatypes ((array!89864 0))(
  ( (array!89865 (arr!43398 (Array (_ BitVec 32) (_ BitVec 64))) (size!43948 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89864)

(assert (=> b!1328592 (= res!881505 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43948 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328593 () Bool)

(declare-fun e!757515 () Bool)

(declare-fun tp_is_empty!36485 () Bool)

(assert (=> b!1328593 (= e!757515 tp_is_empty!36485)))

(declare-fun b!1328594 () Bool)

(declare-fun res!881506 () Bool)

(assert (=> b!1328594 (=> (not res!881506) (not e!757516))))

(declare-datatypes ((List!30734 0))(
  ( (Nil!30731) (Cons!30730 (h!31939 (_ BitVec 64)) (t!44740 List!30734)) )
))
(declare-fun arrayNoDuplicates!0 (array!89864 (_ BitVec 32) List!30734) Bool)

(assert (=> b!1328594 (= res!881506 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30731))))

(declare-fun b!1328596 () Bool)

(declare-fun res!881507 () Bool)

(assert (=> b!1328596 (=> (not res!881507) (not e!757516))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((V!53749 0))(
  ( (V!53750 (val!18317 Int)) )
))
(declare-datatypes ((ValueCell!17344 0))(
  ( (ValueCellFull!17344 (v!20954 V!53749)) (EmptyCell!17344) )
))
(declare-datatypes ((array!89866 0))(
  ( (array!89867 (arr!43399 (Array (_ BitVec 32) ValueCell!17344)) (size!43949 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89866)

(assert (=> b!1328596 (= res!881507 (and (= (size!43949 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43948 _keys!1590) (size!43949 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56401 () Bool)

(declare-fun tp!107362 () Bool)

(assert (=> mapNonEmpty!56401 (= mapRes!56401 (and tp!107362 e!757515))))

(declare-fun mapRest!56401 () (Array (_ BitVec 32) ValueCell!17344))

(declare-fun mapValue!56401 () ValueCell!17344)

(declare-fun mapKey!56401 () (_ BitVec 32))

(assert (=> mapNonEmpty!56401 (= (arr!43399 _values!1320) (store mapRest!56401 mapKey!56401 mapValue!56401))))

(declare-fun b!1328597 () Bool)

(declare-fun e!757512 () Bool)

(declare-fun e!757513 () Bool)

(assert (=> b!1328597 (= e!757512 (and e!757513 mapRes!56401))))

(declare-fun condMapEmpty!56401 () Bool)

(declare-fun mapDefault!56401 () ValueCell!17344)

