; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113198 () Bool)

(assert start!113198)

(declare-fun b_free!31249 () Bool)

(declare-fun b_next!31249 () Bool)

(assert (=> start!113198 (= b_free!31249 (not b_next!31249))))

(declare-fun tp!109552 () Bool)

(declare-fun b_and!50405 () Bool)

(assert (=> start!113198 (= tp!109552 b_and!50405)))

(declare-fun b!1342625 () Bool)

(declare-fun res!890761 () Bool)

(declare-fun e!764346 () Bool)

(assert (=> b!1342625 (=> (not res!890761) (not e!764346))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91346 0))(
  ( (array!91347 (arr!44129 (Array (_ BitVec 32) (_ BitVec 64))) (size!44679 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91346)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54769 0))(
  ( (V!54770 (val!18699 Int)) )
))
(declare-datatypes ((ValueCell!17726 0))(
  ( (ValueCellFull!17726 (v!21347 V!54769)) (EmptyCell!17726) )
))
(declare-datatypes ((array!91348 0))(
  ( (array!91349 (arr!44130 (Array (_ BitVec 32) ValueCell!17726)) (size!44680 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91348)

(assert (=> b!1342625 (= res!890761 (and (= (size!44680 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44679 _keys!1571) (size!44680 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!890765 () Bool)

(assert (=> start!113198 (=> (not res!890765) (not e!764346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113198 (= res!890765 (validMask!0 mask!1977))))

(assert (=> start!113198 e!764346))

(declare-fun tp_is_empty!37249 () Bool)

(assert (=> start!113198 tp_is_empty!37249))

(assert (=> start!113198 true))

(declare-fun array_inv!33261 (array!91346) Bool)

(assert (=> start!113198 (array_inv!33261 _keys!1571)))

(declare-fun e!764348 () Bool)

(declare-fun array_inv!33262 (array!91348) Bool)

(assert (=> start!113198 (and (array_inv!33262 _values!1303) e!764348)))

(assert (=> start!113198 tp!109552))

(declare-fun b!1342626 () Bool)

(declare-fun res!890759 () Bool)

(assert (=> b!1342626 (=> (not res!890759) (not e!764346))))

(assert (=> b!1342626 (= res!890759 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342627 () Bool)

(declare-fun res!890763 () Bool)

(assert (=> b!1342627 (=> (not res!890763) (not e!764346))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342627 (= res!890763 (not (= (select (arr!44129 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1342628 () Bool)

(declare-fun res!890764 () Bool)

(assert (=> b!1342628 (=> (not res!890764) (not e!764346))))

(declare-datatypes ((List!31241 0))(
  ( (Nil!31238) (Cons!31237 (h!32446 (_ BitVec 64)) (t!45701 List!31241)) )
))
(declare-fun arrayNoDuplicates!0 (array!91346 (_ BitVec 32) List!31241) Bool)

(assert (=> b!1342628 (= res!890764 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31238))))

(declare-fun mapNonEmpty!57580 () Bool)

(declare-fun mapRes!57580 () Bool)

(declare-fun tp!109551 () Bool)

(declare-fun e!764345 () Bool)

(assert (=> mapNonEmpty!57580 (= mapRes!57580 (and tp!109551 e!764345))))

(declare-fun mapRest!57580 () (Array (_ BitVec 32) ValueCell!17726))

(declare-fun mapValue!57580 () ValueCell!17726)

(declare-fun mapKey!57580 () (_ BitVec 32))

(assert (=> mapNonEmpty!57580 (= (arr!44130 _values!1303) (store mapRest!57580 mapKey!57580 mapValue!57580))))

(declare-fun b!1342629 () Bool)

(declare-fun e!764344 () Bool)

(assert (=> b!1342629 (= e!764344 tp_is_empty!37249)))

(declare-fun b!1342630 () Bool)

(declare-fun res!890760 () Bool)

(assert (=> b!1342630 (=> (not res!890760) (not e!764346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342630 (= res!890760 (validKeyInArray!0 (select (arr!44129 _keys!1571) from!1960)))))

(declare-fun b!1342631 () Bool)

(declare-fun res!890766 () Bool)

(assert (=> b!1342631 (=> (not res!890766) (not e!764346))))

(declare-fun minValue!1245 () V!54769)

(declare-fun zeroValue!1245 () V!54769)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24084 0))(
  ( (tuple2!24085 (_1!12053 (_ BitVec 64)) (_2!12053 V!54769)) )
))
(declare-datatypes ((List!31242 0))(
  ( (Nil!31239) (Cons!31238 (h!32447 tuple2!24084) (t!45702 List!31242)) )
))
(declare-datatypes ((ListLongMap!21741 0))(
  ( (ListLongMap!21742 (toList!10886 List!31242)) )
))
(declare-fun contains!9062 (ListLongMap!21741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5849 (array!91346 array!91348 (_ BitVec 32) (_ BitVec 32) V!54769 V!54769 (_ BitVec 32) Int) ListLongMap!21741)

(assert (=> b!1342631 (= res!890766 (contains!9062 (getCurrentListMap!5849 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1342632 () Bool)

(declare-fun res!890762 () Bool)

(assert (=> b!1342632 (=> (not res!890762) (not e!764346))))

(assert (=> b!1342632 (= res!890762 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44679 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342633 () Bool)

(declare-fun res!890758 () Bool)

(assert (=> b!1342633 (=> (not res!890758) (not e!764346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91346 (_ BitVec 32)) Bool)

(assert (=> b!1342633 (= res!890758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342634 () Bool)

(assert (=> b!1342634 (= e!764348 (and e!764344 mapRes!57580))))

(declare-fun condMapEmpty!57580 () Bool)

(declare-fun mapDefault!57580 () ValueCell!17726)

