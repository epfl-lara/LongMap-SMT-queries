; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112518 () Bool)

(assert start!112518)

(declare-fun b_free!30913 () Bool)

(declare-fun b_next!30913 () Bool)

(assert (=> start!112518 (= b_free!30913 (not b_next!30913))))

(declare-fun tp!108377 () Bool)

(declare-fun b_and!49803 () Bool)

(assert (=> start!112518 (= tp!108377 b_and!49803)))

(declare-fun b!1334600 () Bool)

(declare-fun res!885775 () Bool)

(declare-fun e!760098 () Bool)

(assert (=> b!1334600 (=> (not res!885775) (not e!760098))))

(declare-datatypes ((V!54201 0))(
  ( (V!54202 (val!18486 Int)) )
))
(declare-datatypes ((ValueCell!17513 0))(
  ( (ValueCellFull!17513 (v!21122 V!54201)) (EmptyCell!17513) )
))
(declare-datatypes ((array!90457 0))(
  ( (array!90458 (arr!43695 (Array (_ BitVec 32) ValueCell!17513)) (size!44247 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90457)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90459 0))(
  ( (array!90460 (arr!43696 (Array (_ BitVec 32) (_ BitVec 64))) (size!44248 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90459)

(assert (=> b!1334600 (= res!885775 (and (= (size!44247 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44248 _keys!1590) (size!44247 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!885778 () Bool)

(assert (=> start!112518 (=> (not res!885778) (not e!760098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112518 (= res!885778 (validMask!0 mask!1998))))

(assert (=> start!112518 e!760098))

(declare-fun e!760099 () Bool)

(declare-fun array_inv!33153 (array!90457) Bool)

(assert (=> start!112518 (and (array_inv!33153 _values!1320) e!760099)))

(assert (=> start!112518 true))

(declare-fun array_inv!33154 (array!90459) Bool)

(assert (=> start!112518 (array_inv!33154 _keys!1590)))

(assert (=> start!112518 tp!108377))

(declare-fun tp_is_empty!36823 () Bool)

(assert (=> start!112518 tp_is_empty!36823))

(declare-fun mapNonEmpty!56908 () Bool)

(declare-fun mapRes!56908 () Bool)

(declare-fun tp!108376 () Bool)

(declare-fun e!760097 () Bool)

(assert (=> mapNonEmpty!56908 (= mapRes!56908 (and tp!108376 e!760097))))

(declare-fun mapKey!56908 () (_ BitVec 32))

(declare-fun mapValue!56908 () ValueCell!17513)

(declare-fun mapRest!56908 () (Array (_ BitVec 32) ValueCell!17513))

(assert (=> mapNonEmpty!56908 (= (arr!43695 _values!1320) (store mapRest!56908 mapKey!56908 mapValue!56908))))

(declare-fun b!1334601 () Bool)

(declare-fun res!885776 () Bool)

(assert (=> b!1334601 (=> (not res!885776) (not e!760098))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334601 (= res!885776 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44248 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334602 () Bool)

(declare-fun res!885774 () Bool)

(assert (=> b!1334602 (=> (not res!885774) (not e!760098))))

(declare-datatypes ((List!31038 0))(
  ( (Nil!31035) (Cons!31034 (h!32243 (_ BitVec 64)) (t!45294 List!31038)) )
))
(declare-fun arrayNoDuplicates!0 (array!90459 (_ BitVec 32) List!31038) Bool)

(assert (=> b!1334602 (= res!885774 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31035))))

(declare-fun mapIsEmpty!56908 () Bool)

(assert (=> mapIsEmpty!56908 mapRes!56908))

(declare-fun b!1334603 () Bool)

(declare-fun e!760096 () Bool)

(assert (=> b!1334603 (= e!760096 tp_is_empty!36823)))

(declare-fun b!1334604 () Bool)

(assert (=> b!1334604 (= e!760099 (and e!760096 mapRes!56908))))

(declare-fun condMapEmpty!56908 () Bool)

(declare-fun mapDefault!56908 () ValueCell!17513)

(assert (=> b!1334604 (= condMapEmpty!56908 (= (arr!43695 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17513)) mapDefault!56908)))))

(declare-fun b!1334605 () Bool)

(assert (=> b!1334605 (= e!760097 tp_is_empty!36823)))

(declare-fun b!1334606 () Bool)

(assert (=> b!1334606 (= e!760098 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592189 () Bool)

(declare-fun minValue!1262 () V!54201)

(declare-fun zeroValue!1262 () V!54201)

(declare-datatypes ((tuple2!23900 0))(
  ( (tuple2!23901 (_1!11961 (_ BitVec 64)) (_2!11961 V!54201)) )
))
(declare-datatypes ((List!31039 0))(
  ( (Nil!31036) (Cons!31035 (h!32244 tuple2!23900) (t!45295 List!31039)) )
))
(declare-datatypes ((ListLongMap!21557 0))(
  ( (ListLongMap!21558 (toList!10794 List!31039)) )
))
(declare-fun contains!8886 (ListLongMap!21557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5648 (array!90459 array!90457 (_ BitVec 32) (_ BitVec 32) V!54201 V!54201 (_ BitVec 32) Int) ListLongMap!21557)

(assert (=> b!1334606 (= lt!592189 (contains!8886 (getCurrentListMap!5648 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334607 () Bool)

(declare-fun res!885777 () Bool)

(assert (=> b!1334607 (=> (not res!885777) (not e!760098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90459 (_ BitVec 32)) Bool)

(assert (=> b!1334607 (= res!885777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112518 res!885778) b!1334600))

(assert (= (and b!1334600 res!885775) b!1334607))

(assert (= (and b!1334607 res!885777) b!1334602))

(assert (= (and b!1334602 res!885774) b!1334601))

(assert (= (and b!1334601 res!885776) b!1334606))

(assert (= (and b!1334604 condMapEmpty!56908) mapIsEmpty!56908))

(assert (= (and b!1334604 (not condMapEmpty!56908)) mapNonEmpty!56908))

(get-info :version)

(assert (= (and mapNonEmpty!56908 ((_ is ValueCellFull!17513) mapValue!56908)) b!1334605))

(assert (= (and b!1334604 ((_ is ValueCellFull!17513) mapDefault!56908)) b!1334603))

(assert (= start!112518 b!1334604))

(declare-fun m!1222479 () Bool)

(assert (=> mapNonEmpty!56908 m!1222479))

(declare-fun m!1222481 () Bool)

(assert (=> b!1334606 m!1222481))

(assert (=> b!1334606 m!1222481))

(declare-fun m!1222483 () Bool)

(assert (=> b!1334606 m!1222483))

(declare-fun m!1222485 () Bool)

(assert (=> b!1334607 m!1222485))

(declare-fun m!1222487 () Bool)

(assert (=> start!112518 m!1222487))

(declare-fun m!1222489 () Bool)

(assert (=> start!112518 m!1222489))

(declare-fun m!1222491 () Bool)

(assert (=> start!112518 m!1222491))

(declare-fun m!1222493 () Bool)

(assert (=> b!1334602 m!1222493))

(check-sat tp_is_empty!36823 (not b!1334606) (not start!112518) (not b!1334602) (not b!1334607) (not b_next!30913) (not mapNonEmpty!56908) b_and!49803)
(check-sat b_and!49803 (not b_next!30913))
