; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113460 () Bool)

(assert start!113460)

(declare-fun b_free!31511 () Bool)

(declare-fun b_next!31511 () Bool)

(assert (=> start!113460 (= b_free!31511 (not b_next!31511))))

(declare-fun tp!110338 () Bool)

(declare-fun b_and!50799 () Bool)

(assert (=> start!113460 (= tp!110338 b_and!50799)))

(declare-fun b!1346969 () Bool)

(declare-fun res!893798 () Bool)

(declare-fun e!766392 () Bool)

(assert (=> b!1346969 (=> (not res!893798) (not e!766392))))

(declare-datatypes ((V!55117 0))(
  ( (V!55118 (val!18830 Int)) )
))
(declare-fun minValue!1245 () V!55117)

(declare-datatypes ((array!91854 0))(
  ( (array!91855 (arr!44383 (Array (_ BitVec 32) (_ BitVec 64))) (size!44933 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91854)

(declare-fun zeroValue!1245 () V!55117)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17857 0))(
  ( (ValueCellFull!17857 (v!21478 V!55117)) (EmptyCell!17857) )
))
(declare-datatypes ((array!91856 0))(
  ( (array!91857 (arr!44384 (Array (_ BitVec 32) ValueCell!17857)) (size!44934 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91856)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24274 0))(
  ( (tuple2!24275 (_1!12148 (_ BitVec 64)) (_2!12148 V!55117)) )
))
(declare-datatypes ((List!31429 0))(
  ( (Nil!31426) (Cons!31425 (h!32634 tuple2!24274) (t!46019 List!31429)) )
))
(declare-datatypes ((ListLongMap!21931 0))(
  ( (ListLongMap!21932 (toList!10981 List!31429)) )
))
(declare-fun contains!9157 (ListLongMap!21931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5933 (array!91854 array!91856 (_ BitVec 32) (_ BitVec 32) V!55117 V!55117 (_ BitVec 32) Int) ListLongMap!21931)

(assert (=> b!1346969 (= res!893798 (contains!9157 (getCurrentListMap!5933 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1346970 () Bool)

(declare-fun res!893797 () Bool)

(assert (=> b!1346970 (=> (not res!893797) (not e!766392))))

(assert (=> b!1346970 (= res!893797 (not (= (select (arr!44383 _keys!1571) from!1960) k!1142)))))

(declare-fun mapIsEmpty!57973 () Bool)

(declare-fun mapRes!57973 () Bool)

(assert (=> mapIsEmpty!57973 mapRes!57973))

(declare-fun b!1346971 () Bool)

(declare-fun res!893795 () Bool)

(assert (=> b!1346971 (=> (not res!893795) (not e!766392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91854 (_ BitVec 32)) Bool)

(assert (=> b!1346971 (= res!893795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346972 () Bool)

(declare-fun e!766390 () Bool)

(declare-fun tp_is_empty!37511 () Bool)

(assert (=> b!1346972 (= e!766390 tp_is_empty!37511)))

(declare-fun b!1346973 () Bool)

(assert (=> b!1346973 (= e!766392 (bvsge from!1960 (size!44934 _values!1303)))))

(declare-fun lt!595560 () ListLongMap!21931)

(declare-fun getCurrentListMapNoExtraKeys!6482 (array!91854 array!91856 (_ BitVec 32) (_ BitVec 32) V!55117 V!55117 (_ BitVec 32) Int) ListLongMap!21931)

(assert (=> b!1346973 (= lt!595560 (getCurrentListMapNoExtraKeys!6482 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1346974 () Bool)

(declare-fun e!766394 () Bool)

(assert (=> b!1346974 (= e!766394 tp_is_empty!37511)))

(declare-fun b!1346975 () Bool)

(declare-fun res!893793 () Bool)

(assert (=> b!1346975 (=> (not res!893793) (not e!766392))))

(assert (=> b!1346975 (= res!893793 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44933 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346976 () Bool)

(declare-fun res!893796 () Bool)

(assert (=> b!1346976 (=> (not res!893796) (not e!766392))))

(assert (=> b!1346976 (= res!893796 (and (= (size!44934 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44933 _keys!1571) (size!44934 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!893794 () Bool)

(assert (=> start!113460 (=> (not res!893794) (not e!766392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113460 (= res!893794 (validMask!0 mask!1977))))

(assert (=> start!113460 e!766392))

(assert (=> start!113460 tp_is_empty!37511))

(assert (=> start!113460 true))

(declare-fun array_inv!33437 (array!91854) Bool)

(assert (=> start!113460 (array_inv!33437 _keys!1571)))

(declare-fun e!766393 () Bool)

(declare-fun array_inv!33438 (array!91856) Bool)

(assert (=> start!113460 (and (array_inv!33438 _values!1303) e!766393)))

(assert (=> start!113460 tp!110338))

(declare-fun b!1346977 () Bool)

(declare-fun res!893799 () Bool)

(assert (=> b!1346977 (=> (not res!893799) (not e!766392))))

(assert (=> b!1346977 (= res!893799 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57973 () Bool)

(declare-fun tp!110337 () Bool)

(assert (=> mapNonEmpty!57973 (= mapRes!57973 (and tp!110337 e!766390))))

(declare-fun mapKey!57973 () (_ BitVec 32))

(declare-fun mapValue!57973 () ValueCell!17857)

(declare-fun mapRest!57973 () (Array (_ BitVec 32) ValueCell!17857))

(assert (=> mapNonEmpty!57973 (= (arr!44384 _values!1303) (store mapRest!57973 mapKey!57973 mapValue!57973))))

(declare-fun b!1346978 () Bool)

(declare-fun res!893792 () Bool)

(assert (=> b!1346978 (=> (not res!893792) (not e!766392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346978 (= res!893792 (validKeyInArray!0 (select (arr!44383 _keys!1571) from!1960)))))

(declare-fun b!1346979 () Bool)

(declare-fun res!893791 () Bool)

(assert (=> b!1346979 (=> (not res!893791) (not e!766392))))

(declare-datatypes ((List!31430 0))(
  ( (Nil!31427) (Cons!31426 (h!32635 (_ BitVec 64)) (t!46020 List!31430)) )
))
(declare-fun arrayNoDuplicates!0 (array!91854 (_ BitVec 32) List!31430) Bool)

(assert (=> b!1346979 (= res!893791 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31427))))

(declare-fun b!1346980 () Bool)

(assert (=> b!1346980 (= e!766393 (and e!766394 mapRes!57973))))

(declare-fun condMapEmpty!57973 () Bool)

(declare-fun mapDefault!57973 () ValueCell!17857)

