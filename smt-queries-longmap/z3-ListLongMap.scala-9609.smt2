; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113824 () Bool)

(assert start!113824)

(declare-fun b_free!31567 () Bool)

(declare-fun b_next!31567 () Bool)

(assert (=> start!113824 (= b_free!31567 (not b_next!31567))))

(declare-fun tp!110512 () Bool)

(declare-fun b_and!50927 () Bool)

(assert (=> start!113824 (= tp!110512 b_and!50927)))

(declare-fun mapNonEmpty!58064 () Bool)

(declare-fun mapRes!58064 () Bool)

(declare-fun tp!110513 () Bool)

(declare-fun e!768021 () Bool)

(assert (=> mapNonEmpty!58064 (= mapRes!58064 (and tp!110513 e!768021))))

(declare-datatypes ((V!55193 0))(
  ( (V!55194 (val!18858 Int)) )
))
(declare-datatypes ((ValueCell!17885 0))(
  ( (ValueCellFull!17885 (v!21505 V!55193)) (EmptyCell!17885) )
))
(declare-fun mapValue!58064 () ValueCell!17885)

(declare-fun mapRest!58064 () (Array (_ BitVec 32) ValueCell!17885))

(declare-fun mapKey!58064 () (_ BitVec 32))

(declare-datatypes ((array!92077 0))(
  ( (array!92078 (arr!44488 (Array (_ BitVec 32) ValueCell!17885)) (size!45039 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92077)

(assert (=> mapNonEmpty!58064 (= (arr!44488 _values!1303) (store mapRest!58064 mapKey!58064 mapValue!58064))))

(declare-fun b!1349861 () Bool)

(declare-fun res!895267 () Bool)

(declare-fun e!768019 () Bool)

(assert (=> b!1349861 (=> (not res!895267) (not e!768019))))

(declare-fun minValue!1245 () V!55193)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!92079 0))(
  ( (array!92080 (arr!44489 (Array (_ BitVec 32) (_ BitVec 64))) (size!45040 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92079)

(declare-fun zeroValue!1245 () V!55193)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24368 0))(
  ( (tuple2!24369 (_1!12195 (_ BitVec 64)) (_2!12195 V!55193)) )
))
(declare-datatypes ((List!31505 0))(
  ( (Nil!31502) (Cons!31501 (h!32719 tuple2!24368) (t!46135 List!31505)) )
))
(declare-datatypes ((ListLongMap!22033 0))(
  ( (ListLongMap!22034 (toList!11032 List!31505)) )
))
(declare-fun contains!9223 (ListLongMap!22033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5970 (array!92079 array!92077 (_ BitVec 32) (_ BitVec 32) V!55193 V!55193 (_ BitVec 32) Int) ListLongMap!22033)

(assert (=> b!1349861 (= res!895267 (contains!9223 (getCurrentListMap!5970 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349862 () Bool)

(assert (=> b!1349862 (= e!768019 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1960 (size!45039 _values!1303))))))

(declare-fun b!1349864 () Bool)

(declare-fun res!895273 () Bool)

(assert (=> b!1349864 (=> (not res!895273) (not e!768019))))

(declare-datatypes ((List!31506 0))(
  ( (Nil!31503) (Cons!31502 (h!32720 (_ BitVec 64)) (t!46136 List!31506)) )
))
(declare-fun arrayNoDuplicates!0 (array!92079 (_ BitVec 32) List!31506) Bool)

(assert (=> b!1349864 (= res!895273 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31503))))

(declare-fun b!1349865 () Bool)

(declare-fun res!895270 () Bool)

(assert (=> b!1349865 (=> (not res!895270) (not e!768019))))

(assert (=> b!1349865 (= res!895270 (and (= (size!45039 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45040 _keys!1571) (size!45039 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58064 () Bool)

(assert (=> mapIsEmpty!58064 mapRes!58064))

(declare-fun b!1349866 () Bool)

(declare-fun res!895268 () Bool)

(assert (=> b!1349866 (=> (not res!895268) (not e!768019))))

(assert (=> b!1349866 (= res!895268 (not (= (select (arr!44489 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349867 () Bool)

(declare-fun res!895266 () Bool)

(assert (=> b!1349867 (=> (not res!895266) (not e!768019))))

(assert (=> b!1349867 (= res!895266 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45040 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349868 () Bool)

(declare-fun e!768017 () Bool)

(declare-fun e!768020 () Bool)

(assert (=> b!1349868 (= e!768017 (and e!768020 mapRes!58064))))

(declare-fun condMapEmpty!58064 () Bool)

(declare-fun mapDefault!58064 () ValueCell!17885)

(assert (=> b!1349868 (= condMapEmpty!58064 (= (arr!44488 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17885)) mapDefault!58064)))))

(declare-fun b!1349869 () Bool)

(declare-fun res!895271 () Bool)

(assert (=> b!1349869 (=> (not res!895271) (not e!768019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92079 (_ BitVec 32)) Bool)

(assert (=> b!1349869 (= res!895271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349870 () Bool)

(declare-fun res!895272 () Bool)

(assert (=> b!1349870 (=> (not res!895272) (not e!768019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349870 (= res!895272 (validKeyInArray!0 (select (arr!44489 _keys!1571) from!1960)))))

(declare-fun b!1349871 () Bool)

(declare-fun tp_is_empty!37567 () Bool)

(assert (=> b!1349871 (= e!768020 tp_is_empty!37567)))

(declare-fun b!1349863 () Bool)

(assert (=> b!1349863 (= e!768021 tp_is_empty!37567)))

(declare-fun res!895269 () Bool)

(assert (=> start!113824 (=> (not res!895269) (not e!768019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113824 (= res!895269 (validMask!0 mask!1977))))

(assert (=> start!113824 e!768019))

(assert (=> start!113824 tp_is_empty!37567))

(assert (=> start!113824 true))

(declare-fun array_inv!33773 (array!92079) Bool)

(assert (=> start!113824 (array_inv!33773 _keys!1571)))

(declare-fun array_inv!33774 (array!92077) Bool)

(assert (=> start!113824 (and (array_inv!33774 _values!1303) e!768017)))

(assert (=> start!113824 tp!110512))

(assert (= (and start!113824 res!895269) b!1349865))

(assert (= (and b!1349865 res!895270) b!1349869))

(assert (= (and b!1349869 res!895271) b!1349864))

(assert (= (and b!1349864 res!895273) b!1349867))

(assert (= (and b!1349867 res!895266) b!1349861))

(assert (= (and b!1349861 res!895267) b!1349866))

(assert (= (and b!1349866 res!895268) b!1349870))

(assert (= (and b!1349870 res!895272) b!1349862))

(assert (= (and b!1349868 condMapEmpty!58064) mapIsEmpty!58064))

(assert (= (and b!1349868 (not condMapEmpty!58064)) mapNonEmpty!58064))

(get-info :version)

(assert (= (and mapNonEmpty!58064 ((_ is ValueCellFull!17885) mapValue!58064)) b!1349863))

(assert (= (and b!1349868 ((_ is ValueCellFull!17885) mapDefault!58064)) b!1349871))

(assert (= start!113824 b!1349868))

(declare-fun m!1237217 () Bool)

(assert (=> b!1349864 m!1237217))

(declare-fun m!1237219 () Bool)

(assert (=> b!1349861 m!1237219))

(assert (=> b!1349861 m!1237219))

(declare-fun m!1237221 () Bool)

(assert (=> b!1349861 m!1237221))

(declare-fun m!1237223 () Bool)

(assert (=> b!1349870 m!1237223))

(assert (=> b!1349870 m!1237223))

(declare-fun m!1237225 () Bool)

(assert (=> b!1349870 m!1237225))

(declare-fun m!1237227 () Bool)

(assert (=> mapNonEmpty!58064 m!1237227))

(declare-fun m!1237229 () Bool)

(assert (=> start!113824 m!1237229))

(declare-fun m!1237231 () Bool)

(assert (=> start!113824 m!1237231))

(declare-fun m!1237233 () Bool)

(assert (=> start!113824 m!1237233))

(declare-fun m!1237235 () Bool)

(assert (=> b!1349869 m!1237235))

(assert (=> b!1349866 m!1237223))

(check-sat tp_is_empty!37567 (not b!1349864) (not b_next!31567) (not b!1349861) (not start!113824) (not b!1349870) b_and!50927 (not mapNonEmpty!58064) (not b!1349869))
(check-sat b_and!50927 (not b_next!31567))
