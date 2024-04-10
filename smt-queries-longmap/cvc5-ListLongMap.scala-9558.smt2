; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113210 () Bool)

(assert start!113210)

(declare-fun b_free!31261 () Bool)

(declare-fun b_next!31261 () Bool)

(assert (=> start!113210 (= b_free!31261 (not b_next!31261))))

(declare-fun tp!109587 () Bool)

(declare-fun b_and!50429 () Bool)

(assert (=> start!113210 (= tp!109587 b_and!50429)))

(declare-fun b!1342854 () Bool)

(declare-fun res!890921 () Bool)

(declare-fun e!764438 () Bool)

(assert (=> b!1342854 (=> (not res!890921) (not e!764438))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342854 (= res!890921 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342855 () Bool)

(declare-fun res!890926 () Bool)

(assert (=> b!1342855 (=> (not res!890926) (not e!764438))))

(declare-datatypes ((array!91370 0))(
  ( (array!91371 (arr!44141 (Array (_ BitVec 32) (_ BitVec 64))) (size!44691 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91370)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342855 (= res!890926 (validKeyInArray!0 (select (arr!44141 _keys!1571) from!1960)))))

(declare-fun b!1342856 () Bool)

(assert (=> b!1342856 (= e!764438 (not true))))

(declare-datatypes ((V!54785 0))(
  ( (V!54786 (val!18705 Int)) )
))
(declare-datatypes ((tuple2!24096 0))(
  ( (tuple2!24097 (_1!12059 (_ BitVec 64)) (_2!12059 V!54785)) )
))
(declare-datatypes ((List!31253 0))(
  ( (Nil!31250) (Cons!31249 (h!32458 tuple2!24096) (t!45725 List!31253)) )
))
(declare-datatypes ((ListLongMap!21753 0))(
  ( (ListLongMap!21754 (toList!10892 List!31253)) )
))
(declare-fun lt!594650 () ListLongMap!21753)

(declare-fun zeroValue!1245 () V!54785)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9068 (ListLongMap!21753 (_ BitVec 64)) Bool)

(declare-fun +!4800 (ListLongMap!21753 tuple2!24096) ListLongMap!21753)

(assert (=> b!1342856 (contains!9068 (+!4800 lt!594650 (tuple2!24097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44077 0))(
  ( (Unit!44078) )
))
(declare-fun lt!594651 () Unit!44077)

(declare-fun addStillContains!1193 (ListLongMap!21753 (_ BitVec 64) V!54785 (_ BitVec 64)) Unit!44077)

(assert (=> b!1342856 (= lt!594651 (addStillContains!1193 lt!594650 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1342856 (contains!9068 lt!594650 k!1142)))

(declare-fun lt!594647 () Unit!44077)

(declare-fun lt!594648 () V!54785)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!369 ((_ BitVec 64) (_ BitVec 64) V!54785 ListLongMap!21753) Unit!44077)

(assert (=> b!1342856 (= lt!594647 (lemmaInListMapAfterAddingDiffThenInBefore!369 k!1142 (select (arr!44141 _keys!1571) from!1960) lt!594648 lt!594650))))

(declare-fun lt!594646 () ListLongMap!21753)

(assert (=> b!1342856 (contains!9068 lt!594646 k!1142)))

(declare-fun lt!594649 () Unit!44077)

(assert (=> b!1342856 (= lt!594649 (lemmaInListMapAfterAddingDiffThenInBefore!369 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594646))))

(assert (=> b!1342856 (= lt!594646 (+!4800 lt!594650 (tuple2!24097 (select (arr!44141 _keys!1571) from!1960) lt!594648)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17732 0))(
  ( (ValueCellFull!17732 (v!21353 V!54785)) (EmptyCell!17732) )
))
(declare-datatypes ((array!91372 0))(
  ( (array!91373 (arr!44142 (Array (_ BitVec 32) ValueCell!17732)) (size!44692 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91372)

(declare-fun get!22293 (ValueCell!17732 V!54785) V!54785)

(declare-fun dynLambda!3739 (Int (_ BitVec 64)) V!54785)

(assert (=> b!1342856 (= lt!594648 (get!22293 (select (arr!44142 _values!1303) from!1960) (dynLambda!3739 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54785)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6442 (array!91370 array!91372 (_ BitVec 32) (_ BitVec 32) V!54785 V!54785 (_ BitVec 32) Int) ListLongMap!21753)

(assert (=> b!1342856 (= lt!594650 (getCurrentListMapNoExtraKeys!6442 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342857 () Bool)

(declare-fun res!890927 () Bool)

(assert (=> b!1342857 (=> (not res!890927) (not e!764438))))

(assert (=> b!1342857 (= res!890927 (and (= (size!44692 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44691 _keys!1571) (size!44692 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342858 () Bool)

(declare-fun e!764437 () Bool)

(declare-fun tp_is_empty!37261 () Bool)

(assert (=> b!1342858 (= e!764437 tp_is_empty!37261)))

(declare-fun b!1342859 () Bool)

(declare-fun res!890920 () Bool)

(assert (=> b!1342859 (=> (not res!890920) (not e!764438))))

(declare-datatypes ((List!31254 0))(
  ( (Nil!31251) (Cons!31250 (h!32459 (_ BitVec 64)) (t!45726 List!31254)) )
))
(declare-fun arrayNoDuplicates!0 (array!91370 (_ BitVec 32) List!31254) Bool)

(assert (=> b!1342859 (= res!890920 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31251))))

(declare-fun b!1342860 () Bool)

(declare-fun res!890928 () Bool)

(assert (=> b!1342860 (=> (not res!890928) (not e!764438))))

(assert (=> b!1342860 (= res!890928 (not (= (select (arr!44141 _keys!1571) from!1960) k!1142)))))

(declare-fun mapIsEmpty!57598 () Bool)

(declare-fun mapRes!57598 () Bool)

(assert (=> mapIsEmpty!57598 mapRes!57598))

(declare-fun b!1342861 () Bool)

(declare-fun res!890924 () Bool)

(assert (=> b!1342861 (=> (not res!890924) (not e!764438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91370 (_ BitVec 32)) Bool)

(assert (=> b!1342861 (= res!890924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57598 () Bool)

(declare-fun tp!109588 () Bool)

(assert (=> mapNonEmpty!57598 (= mapRes!57598 (and tp!109588 e!764437))))

(declare-fun mapKey!57598 () (_ BitVec 32))

(declare-fun mapValue!57598 () ValueCell!17732)

(declare-fun mapRest!57598 () (Array (_ BitVec 32) ValueCell!17732))

(assert (=> mapNonEmpty!57598 (= (arr!44142 _values!1303) (store mapRest!57598 mapKey!57598 mapValue!57598))))

(declare-fun b!1342862 () Bool)

(declare-fun e!764435 () Bool)

(assert (=> b!1342862 (= e!764435 tp_is_empty!37261)))

(declare-fun res!890923 () Bool)

(assert (=> start!113210 (=> (not res!890923) (not e!764438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113210 (= res!890923 (validMask!0 mask!1977))))

(assert (=> start!113210 e!764438))

(assert (=> start!113210 tp_is_empty!37261))

(assert (=> start!113210 true))

(declare-fun array_inv!33273 (array!91370) Bool)

(assert (=> start!113210 (array_inv!33273 _keys!1571)))

(declare-fun e!764434 () Bool)

(declare-fun array_inv!33274 (array!91372) Bool)

(assert (=> start!113210 (and (array_inv!33274 _values!1303) e!764434)))

(assert (=> start!113210 tp!109587))

(declare-fun b!1342853 () Bool)

(declare-fun res!890922 () Bool)

(assert (=> b!1342853 (=> (not res!890922) (not e!764438))))

(declare-fun getCurrentListMap!5855 (array!91370 array!91372 (_ BitVec 32) (_ BitVec 32) V!54785 V!54785 (_ BitVec 32) Int) ListLongMap!21753)

(assert (=> b!1342853 (= res!890922 (contains!9068 (getCurrentListMap!5855 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1342863 () Bool)

(assert (=> b!1342863 (= e!764434 (and e!764435 mapRes!57598))))

(declare-fun condMapEmpty!57598 () Bool)

(declare-fun mapDefault!57598 () ValueCell!17732)

