; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112530 () Bool)

(assert start!112530)

(declare-fun b_free!30925 () Bool)

(declare-fun b_next!30925 () Bool)

(assert (=> start!112530 (= b_free!30925 (not b_next!30925))))

(declare-fun tp!108412 () Bool)

(declare-fun b_and!49815 () Bool)

(assert (=> start!112530 (= tp!108412 b_and!49815)))

(declare-fun res!885868 () Bool)

(declare-fun e!760185 () Bool)

(assert (=> start!112530 (=> (not res!885868) (not e!760185))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112530 (= res!885868 (validMask!0 mask!1998))))

(assert (=> start!112530 e!760185))

(declare-datatypes ((V!54217 0))(
  ( (V!54218 (val!18492 Int)) )
))
(declare-datatypes ((ValueCell!17519 0))(
  ( (ValueCellFull!17519 (v!21128 V!54217)) (EmptyCell!17519) )
))
(declare-datatypes ((array!90481 0))(
  ( (array!90482 (arr!43707 (Array (_ BitVec 32) ValueCell!17519)) (size!44259 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90481)

(declare-fun e!760189 () Bool)

(declare-fun array_inv!33161 (array!90481) Bool)

(assert (=> start!112530 (and (array_inv!33161 _values!1320) e!760189)))

(assert (=> start!112530 true))

(declare-datatypes ((array!90483 0))(
  ( (array!90484 (arr!43708 (Array (_ BitVec 32) (_ BitVec 64))) (size!44260 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90483)

(declare-fun array_inv!33162 (array!90483) Bool)

(assert (=> start!112530 (array_inv!33162 _keys!1590)))

(assert (=> start!112530 tp!108412))

(declare-fun tp_is_empty!36835 () Bool)

(assert (=> start!112530 tp_is_empty!36835))

(declare-fun b!1334744 () Bool)

(declare-fun e!760186 () Bool)

(assert (=> b!1334744 (= e!760186 tp_is_empty!36835)))

(declare-fun b!1334745 () Bool)

(assert (=> b!1334745 (= e!760185 false)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592207 () Bool)

(declare-fun minValue!1262 () V!54217)

(declare-fun zeroValue!1262 () V!54217)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23906 0))(
  ( (tuple2!23907 (_1!11964 (_ BitVec 64)) (_2!11964 V!54217)) )
))
(declare-datatypes ((List!31045 0))(
  ( (Nil!31042) (Cons!31041 (h!32250 tuple2!23906) (t!45301 List!31045)) )
))
(declare-datatypes ((ListLongMap!21563 0))(
  ( (ListLongMap!21564 (toList!10797 List!31045)) )
))
(declare-fun contains!8889 (ListLongMap!21563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5651 (array!90483 array!90481 (_ BitVec 32) (_ BitVec 32) V!54217 V!54217 (_ BitVec 32) Int) ListLongMap!21563)

(assert (=> b!1334745 (= lt!592207 (contains!8889 (getCurrentListMap!5651 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56926 () Bool)

(declare-fun mapRes!56926 () Bool)

(declare-fun tp!108413 () Bool)

(assert (=> mapNonEmpty!56926 (= mapRes!56926 (and tp!108413 e!760186))))

(declare-fun mapRest!56926 () (Array (_ BitVec 32) ValueCell!17519))

(declare-fun mapValue!56926 () ValueCell!17519)

(declare-fun mapKey!56926 () (_ BitVec 32))

(assert (=> mapNonEmpty!56926 (= (arr!43707 _values!1320) (store mapRest!56926 mapKey!56926 mapValue!56926))))

(declare-fun b!1334746 () Bool)

(declare-fun res!885866 () Bool)

(assert (=> b!1334746 (=> (not res!885866) (not e!760185))))

(declare-datatypes ((List!31046 0))(
  ( (Nil!31043) (Cons!31042 (h!32251 (_ BitVec 64)) (t!45302 List!31046)) )
))
(declare-fun arrayNoDuplicates!0 (array!90483 (_ BitVec 32) List!31046) Bool)

(assert (=> b!1334746 (= res!885866 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31043))))

(declare-fun b!1334747 () Bool)

(declare-fun res!885865 () Bool)

(assert (=> b!1334747 (=> (not res!885865) (not e!760185))))

(assert (=> b!1334747 (= res!885865 (and (= (size!44259 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44260 _keys!1590) (size!44259 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334748 () Bool)

(declare-fun res!885864 () Bool)

(assert (=> b!1334748 (=> (not res!885864) (not e!760185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90483 (_ BitVec 32)) Bool)

(assert (=> b!1334748 (= res!885864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334749 () Bool)

(declare-fun e!760187 () Bool)

(assert (=> b!1334749 (= e!760187 tp_is_empty!36835)))

(declare-fun b!1334750 () Bool)

(declare-fun res!885867 () Bool)

(assert (=> b!1334750 (=> (not res!885867) (not e!760185))))

(assert (=> b!1334750 (= res!885867 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44260 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56926 () Bool)

(assert (=> mapIsEmpty!56926 mapRes!56926))

(declare-fun b!1334751 () Bool)

(assert (=> b!1334751 (= e!760189 (and e!760187 mapRes!56926))))

(declare-fun condMapEmpty!56926 () Bool)

(declare-fun mapDefault!56926 () ValueCell!17519)

(assert (=> b!1334751 (= condMapEmpty!56926 (= (arr!43707 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17519)) mapDefault!56926)))))

(assert (= (and start!112530 res!885868) b!1334747))

(assert (= (and b!1334747 res!885865) b!1334748))

(assert (= (and b!1334748 res!885864) b!1334746))

(assert (= (and b!1334746 res!885866) b!1334750))

(assert (= (and b!1334750 res!885867) b!1334745))

(assert (= (and b!1334751 condMapEmpty!56926) mapIsEmpty!56926))

(assert (= (and b!1334751 (not condMapEmpty!56926)) mapNonEmpty!56926))

(get-info :version)

(assert (= (and mapNonEmpty!56926 ((_ is ValueCellFull!17519) mapValue!56926)) b!1334744))

(assert (= (and b!1334751 ((_ is ValueCellFull!17519) mapDefault!56926)) b!1334749))

(assert (= start!112530 b!1334751))

(declare-fun m!1222575 () Bool)

(assert (=> b!1334745 m!1222575))

(assert (=> b!1334745 m!1222575))

(declare-fun m!1222577 () Bool)

(assert (=> b!1334745 m!1222577))

(declare-fun m!1222579 () Bool)

(assert (=> start!112530 m!1222579))

(declare-fun m!1222581 () Bool)

(assert (=> start!112530 m!1222581))

(declare-fun m!1222583 () Bool)

(assert (=> start!112530 m!1222583))

(declare-fun m!1222585 () Bool)

(assert (=> b!1334746 m!1222585))

(declare-fun m!1222587 () Bool)

(assert (=> b!1334748 m!1222587))

(declare-fun m!1222589 () Bool)

(assert (=> mapNonEmpty!56926 m!1222589))

(check-sat (not b!1334746) (not b!1334748) (not b!1334745) tp_is_empty!36835 (not start!112530) b_and!49815 (not mapNonEmpty!56926) (not b_next!30925))
(check-sat b_and!49815 (not b_next!30925))
