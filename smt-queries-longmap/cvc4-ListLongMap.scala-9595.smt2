; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113436 () Bool)

(assert start!113436)

(declare-fun b_free!31487 () Bool)

(declare-fun b_next!31487 () Bool)

(assert (=> start!113436 (= b_free!31487 (not b_next!31487))))

(declare-fun tp!110266 () Bool)

(declare-fun b_and!50775 () Bool)

(assert (=> start!113436 (= tp!110266 b_and!50775)))

(declare-fun b!1346610 () Bool)

(declare-fun res!893544 () Bool)

(declare-fun e!766214 () Bool)

(assert (=> b!1346610 (=> (not res!893544) (not e!766214))))

(declare-datatypes ((array!91806 0))(
  ( (array!91807 (arr!44359 (Array (_ BitVec 32) (_ BitVec 64))) (size!44909 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91806)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346610 (= res!893544 (not (validKeyInArray!0 (select (arr!44359 _keys!1571) from!1960))))))

(declare-fun b!1346611 () Bool)

(declare-fun res!893547 () Bool)

(assert (=> b!1346611 (=> (not res!893547) (not e!766214))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91806 (_ BitVec 32)) Bool)

(assert (=> b!1346611 (= res!893547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57937 () Bool)

(declare-fun mapRes!57937 () Bool)

(assert (=> mapIsEmpty!57937 mapRes!57937))

(declare-fun b!1346612 () Bool)

(declare-fun res!893540 () Bool)

(assert (=> b!1346612 (=> (not res!893540) (not e!766214))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55085 0))(
  ( (V!55086 (val!18818 Int)) )
))
(declare-datatypes ((ValueCell!17845 0))(
  ( (ValueCellFull!17845 (v!21466 V!55085)) (EmptyCell!17845) )
))
(declare-datatypes ((array!91808 0))(
  ( (array!91809 (arr!44360 (Array (_ BitVec 32) ValueCell!17845)) (size!44910 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91808)

(assert (=> b!1346612 (= res!893540 (and (= (size!44910 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44909 _keys!1571) (size!44910 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346613 () Bool)

(declare-fun res!893541 () Bool)

(assert (=> b!1346613 (=> (not res!893541) (not e!766214))))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1346613 (= res!893541 (not (= (select (arr!44359 _keys!1571) from!1960) k!1142)))))

(declare-fun res!893545 () Bool)

(assert (=> start!113436 (=> (not res!893545) (not e!766214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113436 (= res!893545 (validMask!0 mask!1977))))

(assert (=> start!113436 e!766214))

(declare-fun tp_is_empty!37487 () Bool)

(assert (=> start!113436 tp_is_empty!37487))

(assert (=> start!113436 true))

(declare-fun array_inv!33417 (array!91806) Bool)

(assert (=> start!113436 (array_inv!33417 _keys!1571)))

(declare-fun e!766212 () Bool)

(declare-fun array_inv!33418 (array!91808) Bool)

(assert (=> start!113436 (and (array_inv!33418 _values!1303) e!766212)))

(assert (=> start!113436 tp!110266))

(declare-fun b!1346614 () Bool)

(declare-fun res!893542 () Bool)

(assert (=> b!1346614 (=> (not res!893542) (not e!766214))))

(declare-fun minValue!1245 () V!55085)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!55085)

(declare-datatypes ((tuple2!24254 0))(
  ( (tuple2!24255 (_1!12138 (_ BitVec 64)) (_2!12138 V!55085)) )
))
(declare-datatypes ((List!31412 0))(
  ( (Nil!31409) (Cons!31408 (h!32617 tuple2!24254) (t!46002 List!31412)) )
))
(declare-datatypes ((ListLongMap!21911 0))(
  ( (ListLongMap!21912 (toList!10971 List!31412)) )
))
(declare-fun contains!9147 (ListLongMap!21911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5923 (array!91806 array!91808 (_ BitVec 32) (_ BitVec 32) V!55085 V!55085 (_ BitVec 32) Int) ListLongMap!21911)

(assert (=> b!1346614 (= res!893542 (contains!9147 (getCurrentListMap!5923 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1346615 () Bool)

(declare-fun e!766210 () Bool)

(assert (=> b!1346615 (= e!766210 tp_is_empty!37487)))

(declare-fun b!1346616 () Bool)

(declare-fun e!766213 () Bool)

(assert (=> b!1346616 (= e!766212 (and e!766213 mapRes!57937))))

(declare-fun condMapEmpty!57937 () Bool)

(declare-fun mapDefault!57937 () ValueCell!17845)

