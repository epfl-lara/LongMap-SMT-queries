; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112392 () Bool)

(assert start!112392)

(declare-fun b_free!30787 () Bool)

(declare-fun b_next!30787 () Bool)

(assert (=> start!112392 (= b_free!30787 (not b_next!30787))))

(declare-fun tp!107998 () Bool)

(declare-fun b_and!49629 () Bool)

(assert (=> start!112392 (= tp!107998 b_and!49629)))

(declare-fun b!1332507 () Bool)

(declare-fun e!759105 () Bool)

(declare-fun tp_is_empty!36697 () Bool)

(assert (=> b!1332507 (= e!759105 tp_is_empty!36697)))

(declare-fun res!884275 () Bool)

(declare-fun e!759103 () Bool)

(assert (=> start!112392 (=> (not res!884275) (not e!759103))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112392 (= res!884275 (validMask!0 mask!1998))))

(assert (=> start!112392 e!759103))

(declare-datatypes ((V!54033 0))(
  ( (V!54034 (val!18423 Int)) )
))
(declare-datatypes ((ValueCell!17450 0))(
  ( (ValueCellFull!17450 (v!21060 V!54033)) (EmptyCell!17450) )
))
(declare-datatypes ((array!90274 0))(
  ( (array!90275 (arr!43603 (Array (_ BitVec 32) ValueCell!17450)) (size!44153 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90274)

(declare-fun e!759102 () Bool)

(declare-fun array_inv!32889 (array!90274) Bool)

(assert (=> start!112392 (and (array_inv!32889 _values!1320) e!759102)))

(assert (=> start!112392 true))

(declare-datatypes ((array!90276 0))(
  ( (array!90277 (arr!43604 (Array (_ BitVec 32) (_ BitVec 64))) (size!44154 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90276)

(declare-fun array_inv!32890 (array!90276) Bool)

(assert (=> start!112392 (array_inv!32890 _keys!1590)))

(assert (=> start!112392 tp!107998))

(assert (=> start!112392 tp_is_empty!36697))

(declare-fun b!1332508 () Bool)

(declare-fun res!884277 () Bool)

(assert (=> b!1332508 (=> (not res!884277) (not e!759103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90276 (_ BitVec 32)) Bool)

(assert (=> b!1332508 (= res!884277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332509 () Bool)

(declare-fun res!884276 () Bool)

(assert (=> b!1332509 (=> (not res!884276) (not e!759103))))

(declare-datatypes ((List!30886 0))(
  ( (Nil!30883) (Cons!30882 (h!32091 (_ BitVec 64)) (t!45084 List!30886)) )
))
(declare-fun arrayNoDuplicates!0 (array!90276 (_ BitVec 32) List!30886) Bool)

(assert (=> b!1332509 (= res!884276 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30883))))

(declare-fun b!1332510 () Bool)

(declare-fun res!884273 () Bool)

(assert (=> b!1332510 (=> (not res!884273) (not e!759103))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332510 (= res!884273 (and (= (size!44153 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44154 _keys!1590) (size!44153 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56719 () Bool)

(declare-fun mapRes!56719 () Bool)

(declare-fun tp!107997 () Bool)

(assert (=> mapNonEmpty!56719 (= mapRes!56719 (and tp!107997 e!759105))))

(declare-fun mapKey!56719 () (_ BitVec 32))

(declare-fun mapValue!56719 () ValueCell!17450)

(declare-fun mapRest!56719 () (Array (_ BitVec 32) ValueCell!17450))

(assert (=> mapNonEmpty!56719 (= (arr!43603 _values!1320) (store mapRest!56719 mapKey!56719 mapValue!56719))))

(declare-fun mapIsEmpty!56719 () Bool)

(assert (=> mapIsEmpty!56719 mapRes!56719))

(declare-fun b!1332511 () Bool)

(assert (=> b!1332511 (= e!759103 false)))

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!592033 () Bool)

(declare-fun minValue!1262 () V!54033)

(declare-fun zeroValue!1262 () V!54033)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23742 0))(
  ( (tuple2!23743 (_1!11882 (_ BitVec 64)) (_2!11882 V!54033)) )
))
(declare-datatypes ((List!30887 0))(
  ( (Nil!30884) (Cons!30883 (h!32092 tuple2!23742) (t!45085 List!30887)) )
))
(declare-datatypes ((ListLongMap!21399 0))(
  ( (ListLongMap!21400 (toList!10715 List!30887)) )
))
(declare-fun contains!8879 (ListLongMap!21399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5696 (array!90276 array!90274 (_ BitVec 32) (_ BitVec 32) V!54033 V!54033 (_ BitVec 32) Int) ListLongMap!21399)

(assert (=> b!1332511 (= lt!592033 (contains!8879 (getCurrentListMap!5696 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332512 () Bool)

(declare-fun res!884274 () Bool)

(assert (=> b!1332512 (=> (not res!884274) (not e!759103))))

(assert (=> b!1332512 (= res!884274 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44154 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332513 () Bool)

(declare-fun e!759104 () Bool)

(assert (=> b!1332513 (= e!759102 (and e!759104 mapRes!56719))))

(declare-fun condMapEmpty!56719 () Bool)

(declare-fun mapDefault!56719 () ValueCell!17450)

