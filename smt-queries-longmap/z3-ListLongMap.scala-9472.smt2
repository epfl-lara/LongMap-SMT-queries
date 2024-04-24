; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112664 () Bool)

(assert start!112664)

(declare-fun b_free!30835 () Bool)

(declare-fun b_next!30835 () Bool)

(assert (=> start!112664 (= b_free!30835 (not b_next!30835))))

(declare-fun tp!108142 () Bool)

(declare-fun b_and!49679 () Bool)

(assert (=> start!112664 (= tp!108142 b_and!49679)))

(declare-fun b!1334388 () Bool)

(declare-fun res!885161 () Bool)

(declare-fun e!760305 () Bool)

(assert (=> b!1334388 (=> (not res!885161) (not e!760305))))

(declare-datatypes ((array!90463 0))(
  ( (array!90464 (arr!43693 (Array (_ BitVec 32) (_ BitVec 64))) (size!44244 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90463)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334388 (= res!885161 (validKeyInArray!0 (select (arr!43693 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!56791 () Bool)

(declare-fun mapRes!56791 () Bool)

(assert (=> mapIsEmpty!56791 mapRes!56791))

(declare-fun b!1334390 () Bool)

(declare-fun e!760309 () Bool)

(declare-fun e!760308 () Bool)

(assert (=> b!1334390 (= e!760309 (and e!760308 mapRes!56791))))

(declare-fun condMapEmpty!56791 () Bool)

(declare-datatypes ((V!54097 0))(
  ( (V!54098 (val!18447 Int)) )
))
(declare-datatypes ((ValueCell!17474 0))(
  ( (ValueCellFull!17474 (v!21079 V!54097)) (EmptyCell!17474) )
))
(declare-datatypes ((array!90465 0))(
  ( (array!90466 (arr!43694 (Array (_ BitVec 32) ValueCell!17474)) (size!44245 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90465)

(declare-fun mapDefault!56791 () ValueCell!17474)

(assert (=> b!1334390 (= condMapEmpty!56791 (= (arr!43694 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17474)) mapDefault!56791)))))

(declare-fun b!1334391 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334391 (= e!760305 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun b!1334392 () Bool)

(declare-fun e!760307 () Bool)

(declare-fun tp_is_empty!36745 () Bool)

(assert (=> b!1334392 (= e!760307 tp_is_empty!36745)))

(declare-fun b!1334393 () Bool)

(declare-fun res!885162 () Bool)

(assert (=> b!1334393 (=> (not res!885162) (not e!760305))))

(declare-datatypes ((List!30961 0))(
  ( (Nil!30958) (Cons!30957 (h!32175 (_ BitVec 64)) (t!45151 List!30961)) )
))
(declare-fun arrayNoDuplicates!0 (array!90463 (_ BitVec 32) List!30961) Bool)

(assert (=> b!1334393 (= res!885162 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30958))))

(declare-fun b!1334394 () Bool)

(declare-fun res!885158 () Bool)

(assert (=> b!1334394 (=> (not res!885158) (not e!760305))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54097)

(declare-fun zeroValue!1262 () V!54097)

(declare-datatypes ((tuple2!23804 0))(
  ( (tuple2!23805 (_1!11913 (_ BitVec 64)) (_2!11913 V!54097)) )
))
(declare-datatypes ((List!30962 0))(
  ( (Nil!30959) (Cons!30958 (h!32176 tuple2!23804) (t!45152 List!30962)) )
))
(declare-datatypes ((ListLongMap!21469 0))(
  ( (ListLongMap!21470 (toList!10750 List!30962)) )
))
(declare-fun contains!8926 (ListLongMap!21469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5714 (array!90463 array!90465 (_ BitVec 32) (_ BitVec 32) V!54097 V!54097 (_ BitVec 32) Int) ListLongMap!21469)

(assert (=> b!1334394 (= res!885158 (contains!8926 (getCurrentListMap!5714 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334395 () Bool)

(declare-fun res!885159 () Bool)

(assert (=> b!1334395 (=> (not res!885159) (not e!760305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90463 (_ BitVec 32)) Bool)

(assert (=> b!1334395 (= res!885159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334389 () Bool)

(declare-fun res!885157 () Bool)

(assert (=> b!1334389 (=> (not res!885157) (not e!760305))))

(assert (=> b!1334389 (= res!885157 (not (= (select (arr!43693 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!885163 () Bool)

(assert (=> start!112664 (=> (not res!885163) (not e!760305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112664 (= res!885163 (validMask!0 mask!1998))))

(assert (=> start!112664 e!760305))

(declare-fun array_inv!33229 (array!90465) Bool)

(assert (=> start!112664 (and (array_inv!33229 _values!1320) e!760309)))

(assert (=> start!112664 true))

(declare-fun array_inv!33230 (array!90463) Bool)

(assert (=> start!112664 (array_inv!33230 _keys!1590)))

(assert (=> start!112664 tp!108142))

(assert (=> start!112664 tp_is_empty!36745))

(declare-fun b!1334396 () Bool)

(assert (=> b!1334396 (= e!760308 tp_is_empty!36745)))

(declare-fun mapNonEmpty!56791 () Bool)

(declare-fun tp!108141 () Bool)

(assert (=> mapNonEmpty!56791 (= mapRes!56791 (and tp!108141 e!760307))))

(declare-fun mapValue!56791 () ValueCell!17474)

(declare-fun mapRest!56791 () (Array (_ BitVec 32) ValueCell!17474))

(declare-fun mapKey!56791 () (_ BitVec 32))

(assert (=> mapNonEmpty!56791 (= (arr!43694 _values!1320) (store mapRest!56791 mapKey!56791 mapValue!56791))))

(declare-fun b!1334397 () Bool)

(declare-fun res!885160 () Bool)

(assert (=> b!1334397 (=> (not res!885160) (not e!760305))))

(assert (=> b!1334397 (= res!885160 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44244 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334398 () Bool)

(declare-fun res!885164 () Bool)

(assert (=> b!1334398 (=> (not res!885164) (not e!760305))))

(assert (=> b!1334398 (= res!885164 (and (= (size!44245 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44244 _keys!1590) (size!44245 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112664 res!885163) b!1334398))

(assert (= (and b!1334398 res!885164) b!1334395))

(assert (= (and b!1334395 res!885159) b!1334393))

(assert (= (and b!1334393 res!885162) b!1334397))

(assert (= (and b!1334397 res!885160) b!1334394))

(assert (= (and b!1334394 res!885158) b!1334389))

(assert (= (and b!1334389 res!885157) b!1334388))

(assert (= (and b!1334388 res!885161) b!1334391))

(assert (= (and b!1334390 condMapEmpty!56791) mapIsEmpty!56791))

(assert (= (and b!1334390 (not condMapEmpty!56791)) mapNonEmpty!56791))

(get-info :version)

(assert (= (and mapNonEmpty!56791 ((_ is ValueCellFull!17474) mapValue!56791)) b!1334392))

(assert (= (and b!1334390 ((_ is ValueCellFull!17474) mapDefault!56791)) b!1334396))

(assert (= start!112664 b!1334390))

(declare-fun m!1223321 () Bool)

(assert (=> b!1334395 m!1223321))

(declare-fun m!1223323 () Bool)

(assert (=> mapNonEmpty!56791 m!1223323))

(declare-fun m!1223325 () Bool)

(assert (=> b!1334388 m!1223325))

(assert (=> b!1334388 m!1223325))

(declare-fun m!1223327 () Bool)

(assert (=> b!1334388 m!1223327))

(declare-fun m!1223329 () Bool)

(assert (=> b!1334393 m!1223329))

(declare-fun m!1223331 () Bool)

(assert (=> start!112664 m!1223331))

(declare-fun m!1223333 () Bool)

(assert (=> start!112664 m!1223333))

(declare-fun m!1223335 () Bool)

(assert (=> start!112664 m!1223335))

(declare-fun m!1223337 () Bool)

(assert (=> b!1334394 m!1223337))

(assert (=> b!1334394 m!1223337))

(declare-fun m!1223339 () Bool)

(assert (=> b!1334394 m!1223339))

(assert (=> b!1334389 m!1223325))

(check-sat (not b!1334393) tp_is_empty!36745 (not start!112664) b_and!49679 (not b!1334388) (not b!1334394) (not b_next!30835) (not b!1334395) (not mapNonEmpty!56791))
(check-sat b_and!49679 (not b_next!30835))
