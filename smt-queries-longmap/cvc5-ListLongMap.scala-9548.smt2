; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113150 () Bool)

(assert start!113150)

(declare-fun b_free!31201 () Bool)

(declare-fun b_next!31201 () Bool)

(assert (=> start!113150 (= b_free!31201 (not b_next!31201))))

(declare-fun tp!109407 () Bool)

(declare-fun b_and!50309 () Bool)

(assert (=> start!113150 (= tp!109407 b_and!50309)))

(declare-fun b!1341713 () Bool)

(declare-fun res!890118 () Bool)

(declare-fun e!763984 () Bool)

(assert (=> b!1341713 (=> (not res!890118) (not e!763984))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91254 0))(
  ( (array!91255 (arr!44083 (Array (_ BitVec 32) (_ BitVec 64))) (size!44633 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91254)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341713 (= res!890118 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44633 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341714 () Bool)

(declare-fun res!890111 () Bool)

(assert (=> b!1341714 (=> (not res!890111) (not e!763984))))

(declare-datatypes ((V!54705 0))(
  ( (V!54706 (val!18675 Int)) )
))
(declare-fun minValue!1245 () V!54705)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54705)

(declare-datatypes ((ValueCell!17702 0))(
  ( (ValueCellFull!17702 (v!21323 V!54705)) (EmptyCell!17702) )
))
(declare-datatypes ((array!91256 0))(
  ( (array!91257 (arr!44084 (Array (_ BitVec 32) ValueCell!17702)) (size!44634 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91256)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24050 0))(
  ( (tuple2!24051 (_1!12036 (_ BitVec 64)) (_2!12036 V!54705)) )
))
(declare-datatypes ((List!31207 0))(
  ( (Nil!31204) (Cons!31203 (h!32412 tuple2!24050) (t!45619 List!31207)) )
))
(declare-datatypes ((ListLongMap!21707 0))(
  ( (ListLongMap!21708 (toList!10869 List!31207)) )
))
(declare-fun contains!9045 (ListLongMap!21707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5833 (array!91254 array!91256 (_ BitVec 32) (_ BitVec 32) V!54705 V!54705 (_ BitVec 32) Int) ListLongMap!21707)

(assert (=> b!1341714 (= res!890111 (contains!9045 (getCurrentListMap!5833 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1341715 () Bool)

(declare-fun e!763988 () Bool)

(declare-fun tp_is_empty!37201 () Bool)

(assert (=> b!1341715 (= e!763988 tp_is_empty!37201)))

(declare-fun b!1341716 () Bool)

(declare-fun res!890115 () Bool)

(assert (=> b!1341716 (=> (not res!890115) (not e!763984))))

(declare-datatypes ((List!31208 0))(
  ( (Nil!31205) (Cons!31204 (h!32413 (_ BitVec 64)) (t!45620 List!31208)) )
))
(declare-fun arrayNoDuplicates!0 (array!91254 (_ BitVec 32) List!31208) Bool)

(assert (=> b!1341716 (= res!890115 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31205))))

(declare-fun mapNonEmpty!57508 () Bool)

(declare-fun mapRes!57508 () Bool)

(declare-fun tp!109408 () Bool)

(declare-fun e!763985 () Bool)

(assert (=> mapNonEmpty!57508 (= mapRes!57508 (and tp!109408 e!763985))))

(declare-fun mapKey!57508 () (_ BitVec 32))

(declare-fun mapRest!57508 () (Array (_ BitVec 32) ValueCell!17702))

(declare-fun mapValue!57508 () ValueCell!17702)

(assert (=> mapNonEmpty!57508 (= (arr!44084 _values!1303) (store mapRest!57508 mapKey!57508 mapValue!57508))))

(declare-fun b!1341717 () Bool)

(declare-fun e!763986 () Bool)

(assert (=> b!1341717 (= e!763986 (and e!763988 mapRes!57508))))

(declare-fun condMapEmpty!57508 () Bool)

(declare-fun mapDefault!57508 () ValueCell!17702)

