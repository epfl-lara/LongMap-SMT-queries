; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112724 () Bool)

(assert start!112724)

(declare-fun b_free!31035 () Bool)

(declare-fun b_next!31035 () Bool)

(assert (=> start!112724 (= b_free!31035 (not b_next!31035))))

(declare-fun tp!108749 () Bool)

(declare-fun b_and!50013 () Bool)

(assert (=> start!112724 (= tp!108749 b_and!50013)))

(declare-fun b!1337144 () Bool)

(declare-fun e!761411 () Bool)

(assert (=> b!1337144 (= e!761411 false)))

(declare-datatypes ((V!54363 0))(
  ( (V!54364 (val!18547 Int)) )
))
(declare-datatypes ((ValueCell!17574 0))(
  ( (ValueCellFull!17574 (v!21188 V!54363)) (EmptyCell!17574) )
))
(declare-datatypes ((array!90750 0))(
  ( (array!90751 (arr!43839 (Array (_ BitVec 32) ValueCell!17574)) (size!44389 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90750)

(declare-fun lt!593085 () Bool)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90752 0))(
  ( (array!90753 (arr!43840 (Array (_ BitVec 32) (_ BitVec 64))) (size!44390 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90752)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54363)

(declare-fun zeroValue!1262 () V!54363)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23924 0))(
  ( (tuple2!23925 (_1!11973 (_ BitVec 64)) (_2!11973 V!54363)) )
))
(declare-datatypes ((List!31066 0))(
  ( (Nil!31063) (Cons!31062 (h!32271 tuple2!23924) (t!45378 List!31066)) )
))
(declare-datatypes ((ListLongMap!21581 0))(
  ( (ListLongMap!21582 (toList!10806 List!31066)) )
))
(declare-fun contains!8973 (ListLongMap!21581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5777 (array!90752 array!90750 (_ BitVec 32) (_ BitVec 32) V!54363 V!54363 (_ BitVec 32) Int) ListLongMap!21581)

(assert (=> b!1337144 (= lt!593085 (contains!8973 (getCurrentListMap!5777 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!887347 () Bool)

(assert (=> start!112724 (=> (not res!887347) (not e!761411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112724 (= res!887347 (validMask!0 mask!1998))))

(assert (=> start!112724 e!761411))

(declare-fun e!761409 () Bool)

(declare-fun array_inv!33063 (array!90750) Bool)

(assert (=> start!112724 (and (array_inv!33063 _values!1320) e!761409)))

(assert (=> start!112724 true))

(declare-fun array_inv!33064 (array!90752) Bool)

(assert (=> start!112724 (array_inv!33064 _keys!1590)))

(assert (=> start!112724 tp!108749))

(declare-fun tp_is_empty!36945 () Bool)

(assert (=> start!112724 tp_is_empty!36945))

(declare-fun b!1337145 () Bool)

(declare-fun e!761410 () Bool)

(assert (=> b!1337145 (= e!761410 tp_is_empty!36945)))

(declare-fun mapIsEmpty!57098 () Bool)

(declare-fun mapRes!57098 () Bool)

(assert (=> mapIsEmpty!57098 mapRes!57098))

(declare-fun mapNonEmpty!57098 () Bool)

(declare-fun tp!108748 () Bool)

(assert (=> mapNonEmpty!57098 (= mapRes!57098 (and tp!108748 e!761410))))

(declare-fun mapRest!57098 () (Array (_ BitVec 32) ValueCell!17574))

(declare-fun mapValue!57098 () ValueCell!17574)

(declare-fun mapKey!57098 () (_ BitVec 32))

(assert (=> mapNonEmpty!57098 (= (arr!43839 _values!1320) (store mapRest!57098 mapKey!57098 mapValue!57098))))

(declare-fun b!1337146 () Bool)

(declare-fun e!761408 () Bool)

(assert (=> b!1337146 (= e!761408 tp_is_empty!36945)))

(declare-fun b!1337147 () Bool)

(declare-fun res!887344 () Bool)

(assert (=> b!1337147 (=> (not res!887344) (not e!761411))))

(assert (=> b!1337147 (= res!887344 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44390 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337148 () Bool)

(declare-fun res!887346 () Bool)

(assert (=> b!1337148 (=> (not res!887346) (not e!761411))))

(declare-datatypes ((List!31067 0))(
  ( (Nil!31064) (Cons!31063 (h!32272 (_ BitVec 64)) (t!45379 List!31067)) )
))
(declare-fun arrayNoDuplicates!0 (array!90752 (_ BitVec 32) List!31067) Bool)

(assert (=> b!1337148 (= res!887346 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31064))))

(declare-fun b!1337149 () Bool)

(assert (=> b!1337149 (= e!761409 (and e!761408 mapRes!57098))))

(declare-fun condMapEmpty!57098 () Bool)

(declare-fun mapDefault!57098 () ValueCell!17574)

(assert (=> b!1337149 (= condMapEmpty!57098 (= (arr!43839 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17574)) mapDefault!57098)))))

(declare-fun b!1337150 () Bool)

(declare-fun res!887348 () Bool)

(assert (=> b!1337150 (=> (not res!887348) (not e!761411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90752 (_ BitVec 32)) Bool)

(assert (=> b!1337150 (= res!887348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337151 () Bool)

(declare-fun res!887345 () Bool)

(assert (=> b!1337151 (=> (not res!887345) (not e!761411))))

(assert (=> b!1337151 (= res!887345 (and (= (size!44389 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44390 _keys!1590) (size!44389 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112724 res!887347) b!1337151))

(assert (= (and b!1337151 res!887345) b!1337150))

(assert (= (and b!1337150 res!887348) b!1337148))

(assert (= (and b!1337148 res!887346) b!1337147))

(assert (= (and b!1337147 res!887344) b!1337144))

(assert (= (and b!1337149 condMapEmpty!57098) mapIsEmpty!57098))

(assert (= (and b!1337149 (not condMapEmpty!57098)) mapNonEmpty!57098))

(get-info :version)

(assert (= (and mapNonEmpty!57098 ((_ is ValueCellFull!17574) mapValue!57098)) b!1337145))

(assert (= (and b!1337149 ((_ is ValueCellFull!17574) mapDefault!57098)) b!1337146))

(assert (= start!112724 b!1337149))

(declare-fun m!1225263 () Bool)

(assert (=> b!1337148 m!1225263))

(declare-fun m!1225265 () Bool)

(assert (=> mapNonEmpty!57098 m!1225265))

(declare-fun m!1225267 () Bool)

(assert (=> start!112724 m!1225267))

(declare-fun m!1225269 () Bool)

(assert (=> start!112724 m!1225269))

(declare-fun m!1225271 () Bool)

(assert (=> start!112724 m!1225271))

(declare-fun m!1225273 () Bool)

(assert (=> b!1337144 m!1225273))

(assert (=> b!1337144 m!1225273))

(declare-fun m!1225275 () Bool)

(assert (=> b!1337144 m!1225275))

(declare-fun m!1225277 () Bool)

(assert (=> b!1337150 m!1225277))

(check-sat (not b!1337148) (not b!1337150) b_and!50013 (not start!112724) tp_is_empty!36945 (not b_next!31035) (not mapNonEmpty!57098) (not b!1337144))
(check-sat b_and!50013 (not b_next!31035))
