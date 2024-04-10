; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113376 () Bool)

(assert start!113376)

(declare-fun b_free!31427 () Bool)

(declare-fun b_next!31427 () Bool)

(assert (=> start!113376 (= b_free!31427 (not b_next!31427))))

(declare-fun tp!110086 () Bool)

(declare-fun b_and!50707 () Bool)

(assert (=> start!113376 (= tp!110086 b_and!50707)))

(declare-fun b!1345798 () Bool)

(declare-fun res!893011 () Bool)

(declare-fun e!765750 () Bool)

(assert (=> b!1345798 (=> (not res!893011) (not e!765750))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91694 0))(
  ( (array!91695 (arr!44303 (Array (_ BitVec 32) (_ BitVec 64))) (size!44853 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91694)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345798 (= res!893011 (not (= k!1142 (select (arr!44303 _keys!1571) from!1960))))))

(declare-fun b!1345799 () Bool)

(declare-fun res!893009 () Bool)

(declare-fun e!765751 () Bool)

(assert (=> b!1345799 (=> (not res!893009) (not e!765751))))

(assert (=> b!1345799 (= res!893009 (not (= (select (arr!44303 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1345800 () Bool)

(declare-fun res!893015 () Bool)

(assert (=> b!1345800 (=> (not res!893015) (not e!765751))))

(declare-datatypes ((List!31376 0))(
  ( (Nil!31373) (Cons!31372 (h!32581 (_ BitVec 64)) (t!45960 List!31376)) )
))
(declare-fun arrayNoDuplicates!0 (array!91694 (_ BitVec 32) List!31376) Bool)

(assert (=> b!1345800 (= res!893015 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31373))))

(declare-fun b!1345801 () Bool)

(declare-fun res!893007 () Bool)

(assert (=> b!1345801 (=> (not res!893007) (not e!765751))))

(declare-datatypes ((V!55005 0))(
  ( (V!55006 (val!18788 Int)) )
))
(declare-fun minValue!1245 () V!55005)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55005)

(declare-datatypes ((ValueCell!17815 0))(
  ( (ValueCellFull!17815 (v!21436 V!55005)) (EmptyCell!17815) )
))
(declare-datatypes ((array!91696 0))(
  ( (array!91697 (arr!44304 (Array (_ BitVec 32) ValueCell!17815)) (size!44854 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91696)

(declare-fun defaultEntry!1306 () Int)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((tuple2!24220 0))(
  ( (tuple2!24221 (_1!12121 (_ BitVec 64)) (_2!12121 V!55005)) )
))
(declare-datatypes ((List!31377 0))(
  ( (Nil!31374) (Cons!31373 (h!32582 tuple2!24220) (t!45961 List!31377)) )
))
(declare-datatypes ((ListLongMap!21877 0))(
  ( (ListLongMap!21878 (toList!10954 List!31377)) )
))
(declare-fun contains!9130 (ListLongMap!21877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5907 (array!91694 array!91696 (_ BitVec 32) (_ BitVec 32) V!55005 V!55005 (_ BitVec 32) Int) ListLongMap!21877)

(assert (=> b!1345801 (= res!893007 (contains!9130 (getCurrentListMap!5907 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1345802 () Bool)

(declare-fun res!893010 () Bool)

(assert (=> b!1345802 (=> (not res!893010) (not e!765751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91694 (_ BitVec 32)) Bool)

(assert (=> b!1345802 (= res!893010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345803 () Bool)

(declare-fun res!893014 () Bool)

(assert (=> b!1345803 (=> (not res!893014) (not e!765751))))

(assert (=> b!1345803 (= res!893014 (and (= (size!44854 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44853 _keys!1571) (size!44854 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345804 () Bool)

(declare-fun res!893008 () Bool)

(assert (=> b!1345804 (=> (not res!893008) (not e!765751))))

(assert (=> b!1345804 (= res!893008 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!893006 () Bool)

(assert (=> start!113376 (=> (not res!893006) (not e!765751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113376 (= res!893006 (validMask!0 mask!1977))))

(assert (=> start!113376 e!765751))

(declare-fun tp_is_empty!37427 () Bool)

(assert (=> start!113376 tp_is_empty!37427))

(assert (=> start!113376 true))

(declare-fun array_inv!33383 (array!91694) Bool)

(assert (=> start!113376 (array_inv!33383 _keys!1571)))

(declare-fun e!765755 () Bool)

(declare-fun array_inv!33384 (array!91696) Bool)

(assert (=> start!113376 (and (array_inv!33384 _values!1303) e!765755)))

(assert (=> start!113376 tp!110086))

(declare-fun mapIsEmpty!57847 () Bool)

(declare-fun mapRes!57847 () Bool)

(assert (=> mapIsEmpty!57847 mapRes!57847))

(declare-fun b!1345805 () Bool)

(declare-fun e!765752 () Bool)

(assert (=> b!1345805 (= e!765752 tp_is_empty!37427)))

(declare-fun b!1345806 () Bool)

(declare-fun res!893016 () Bool)

(assert (=> b!1345806 (=> (not res!893016) (not e!765751))))

(assert (=> b!1345806 (= res!893016 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44853 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345807 () Bool)

(declare-fun res!893012 () Bool)

(assert (=> b!1345807 (=> (not res!893012) (not e!765751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345807 (= res!893012 (validKeyInArray!0 (select (arr!44303 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57847 () Bool)

(declare-fun tp!110085 () Bool)

(declare-fun e!765753 () Bool)

(assert (=> mapNonEmpty!57847 (= mapRes!57847 (and tp!110085 e!765753))))

(declare-fun mapRest!57847 () (Array (_ BitVec 32) ValueCell!17815))

(declare-fun mapKey!57847 () (_ BitVec 32))

(declare-fun mapValue!57847 () ValueCell!17815)

(assert (=> mapNonEmpty!57847 (= (arr!44304 _values!1303) (store mapRest!57847 mapKey!57847 mapValue!57847))))

(declare-fun b!1345808 () Bool)

(assert (=> b!1345808 (= e!765755 (and e!765752 mapRes!57847))))

(declare-fun condMapEmpty!57847 () Bool)

(declare-fun mapDefault!57847 () ValueCell!17815)

