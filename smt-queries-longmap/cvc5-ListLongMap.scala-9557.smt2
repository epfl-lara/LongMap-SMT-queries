; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113204 () Bool)

(assert start!113204)

(declare-fun b_free!31255 () Bool)

(declare-fun b_next!31255 () Bool)

(assert (=> start!113204 (= b_free!31255 (not b_next!31255))))

(declare-fun tp!109569 () Bool)

(declare-fun b_and!50417 () Bool)

(assert (=> start!113204 (= tp!109569 b_and!50417)))

(declare-fun b!1342739 () Bool)

(declare-fun res!890840 () Bool)

(declare-fun e!764392 () Bool)

(assert (=> b!1342739 (=> (not res!890840) (not e!764392))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91358 0))(
  ( (array!91359 (arr!44135 (Array (_ BitVec 32) (_ BitVec 64))) (size!44685 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91358)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342739 (= res!890840 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44685 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342740 () Bool)

(declare-fun res!890839 () Bool)

(assert (=> b!1342740 (=> (not res!890839) (not e!764392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342740 (= res!890839 (validKeyInArray!0 (select (arr!44135 _keys!1571) from!1960)))))

(declare-fun b!1342741 () Bool)

(declare-fun res!890847 () Bool)

(assert (=> b!1342741 (=> (not res!890847) (not e!764392))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91358 (_ BitVec 32)) Bool)

(assert (=> b!1342741 (= res!890847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342742 () Bool)

(declare-fun res!890844 () Bool)

(assert (=> b!1342742 (=> (not res!890844) (not e!764392))))

(declare-datatypes ((List!31247 0))(
  ( (Nil!31244) (Cons!31243 (h!32452 (_ BitVec 64)) (t!45713 List!31247)) )
))
(declare-fun arrayNoDuplicates!0 (array!91358 (_ BitVec 32) List!31247) Bool)

(assert (=> b!1342742 (= res!890844 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31244))))

(declare-fun mapIsEmpty!57589 () Bool)

(declare-fun mapRes!57589 () Bool)

(assert (=> mapIsEmpty!57589 mapRes!57589))

(declare-fun res!890846 () Bool)

(assert (=> start!113204 (=> (not res!890846) (not e!764392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113204 (= res!890846 (validMask!0 mask!1977))))

(assert (=> start!113204 e!764392))

(declare-fun tp_is_empty!37255 () Bool)

(assert (=> start!113204 tp_is_empty!37255))

(assert (=> start!113204 true))

(declare-fun array_inv!33267 (array!91358) Bool)

(assert (=> start!113204 (array_inv!33267 _keys!1571)))

(declare-datatypes ((V!54777 0))(
  ( (V!54778 (val!18702 Int)) )
))
(declare-datatypes ((ValueCell!17729 0))(
  ( (ValueCellFull!17729 (v!21350 V!54777)) (EmptyCell!17729) )
))
(declare-datatypes ((array!91360 0))(
  ( (array!91361 (arr!44136 (Array (_ BitVec 32) ValueCell!17729)) (size!44686 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91360)

(declare-fun e!764390 () Bool)

(declare-fun array_inv!33268 (array!91360) Bool)

(assert (=> start!113204 (and (array_inv!33268 _values!1303) e!764390)))

(assert (=> start!113204 tp!109569))

(declare-fun b!1342743 () Bool)

(declare-fun res!890843 () Bool)

(assert (=> b!1342743 (=> (not res!890843) (not e!764392))))

(assert (=> b!1342743 (= res!890843 (not (= (select (arr!44135 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1342744 () Bool)

(declare-fun res!890841 () Bool)

(assert (=> b!1342744 (=> (not res!890841) (not e!764392))))

(declare-fun minValue!1245 () V!54777)

(declare-fun zeroValue!1245 () V!54777)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24090 0))(
  ( (tuple2!24091 (_1!12056 (_ BitVec 64)) (_2!12056 V!54777)) )
))
(declare-datatypes ((List!31248 0))(
  ( (Nil!31245) (Cons!31244 (h!32453 tuple2!24090) (t!45714 List!31248)) )
))
(declare-datatypes ((ListLongMap!21747 0))(
  ( (ListLongMap!21748 (toList!10889 List!31248)) )
))
(declare-fun contains!9065 (ListLongMap!21747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5852 (array!91358 array!91360 (_ BitVec 32) (_ BitVec 32) V!54777 V!54777 (_ BitVec 32) Int) ListLongMap!21747)

(assert (=> b!1342744 (= res!890841 (contains!9065 (getCurrentListMap!5852 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1342745 () Bool)

(declare-fun res!890842 () Bool)

(assert (=> b!1342745 (=> (not res!890842) (not e!764392))))

(assert (=> b!1342745 (= res!890842 (and (= (size!44686 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44685 _keys!1571) (size!44686 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342746 () Bool)

(declare-fun e!764393 () Bool)

(assert (=> b!1342746 (= e!764393 tp_is_empty!37255)))

(declare-fun b!1342747 () Bool)

(assert (=> b!1342747 (= e!764390 (and e!764393 mapRes!57589))))

(declare-fun condMapEmpty!57589 () Bool)

(declare-fun mapDefault!57589 () ValueCell!17729)

