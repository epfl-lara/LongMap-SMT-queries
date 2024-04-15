; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112548 () Bool)

(assert start!112548)

(declare-fun b_free!30943 () Bool)

(declare-fun b_next!30943 () Bool)

(assert (=> start!112548 (= b_free!30943 (not b_next!30943))))

(declare-fun tp!108466 () Bool)

(declare-fun b_and!49833 () Bool)

(assert (=> start!112548 (= tp!108466 b_and!49833)))

(declare-fun b!1334960 () Bool)

(declare-fun e!760324 () Bool)

(declare-fun e!760322 () Bool)

(declare-fun mapRes!56953 () Bool)

(assert (=> b!1334960 (= e!760324 (and e!760322 mapRes!56953))))

(declare-fun condMapEmpty!56953 () Bool)

(declare-datatypes ((V!54241 0))(
  ( (V!54242 (val!18501 Int)) )
))
(declare-datatypes ((ValueCell!17528 0))(
  ( (ValueCellFull!17528 (v!21137 V!54241)) (EmptyCell!17528) )
))
(declare-datatypes ((array!90515 0))(
  ( (array!90516 (arr!43724 (Array (_ BitVec 32) ValueCell!17528)) (size!44276 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90515)

(declare-fun mapDefault!56953 () ValueCell!17528)

(assert (=> b!1334960 (= condMapEmpty!56953 (= (arr!43724 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17528)) mapDefault!56953)))))

(declare-fun b!1334961 () Bool)

(declare-fun e!760320 () Bool)

(assert (=> b!1334961 (= e!760320 false)))

(declare-fun lt!592234 () Bool)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90517 0))(
  ( (array!90518 (arr!43725 (Array (_ BitVec 32) (_ BitVec 64))) (size!44277 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90517)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54241)

(declare-fun zeroValue!1262 () V!54241)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23918 0))(
  ( (tuple2!23919 (_1!11970 (_ BitVec 64)) (_2!11970 V!54241)) )
))
(declare-datatypes ((List!31055 0))(
  ( (Nil!31052) (Cons!31051 (h!32260 tuple2!23918) (t!45311 List!31055)) )
))
(declare-datatypes ((ListLongMap!21575 0))(
  ( (ListLongMap!21576 (toList!10803 List!31055)) )
))
(declare-fun contains!8895 (ListLongMap!21575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5657 (array!90517 array!90515 (_ BitVec 32) (_ BitVec 32) V!54241 V!54241 (_ BitVec 32) Int) ListLongMap!21575)

(assert (=> b!1334961 (= lt!592234 (contains!8895 (getCurrentListMap!5657 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!885999 () Bool)

(assert (=> start!112548 (=> (not res!885999) (not e!760320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112548 (= res!885999 (validMask!0 mask!1998))))

(assert (=> start!112548 e!760320))

(declare-fun array_inv!33175 (array!90515) Bool)

(assert (=> start!112548 (and (array_inv!33175 _values!1320) e!760324)))

(assert (=> start!112548 true))

(declare-fun array_inv!33176 (array!90517) Bool)

(assert (=> start!112548 (array_inv!33176 _keys!1590)))

(assert (=> start!112548 tp!108466))

(declare-fun tp_is_empty!36853 () Bool)

(assert (=> start!112548 tp_is_empty!36853))

(declare-fun mapIsEmpty!56953 () Bool)

(assert (=> mapIsEmpty!56953 mapRes!56953))

(declare-fun b!1334962 () Bool)

(declare-fun res!886001 () Bool)

(assert (=> b!1334962 (=> (not res!886001) (not e!760320))))

(assert (=> b!1334962 (= res!886001 (and (= (size!44276 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44277 _keys!1590) (size!44276 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334963 () Bool)

(declare-fun res!886003 () Bool)

(assert (=> b!1334963 (=> (not res!886003) (not e!760320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90517 (_ BitVec 32)) Bool)

(assert (=> b!1334963 (= res!886003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334964 () Bool)

(declare-fun res!886000 () Bool)

(assert (=> b!1334964 (=> (not res!886000) (not e!760320))))

(assert (=> b!1334964 (= res!886000 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44277 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334965 () Bool)

(assert (=> b!1334965 (= e!760322 tp_is_empty!36853)))

(declare-fun b!1334966 () Bool)

(declare-fun res!886002 () Bool)

(assert (=> b!1334966 (=> (not res!886002) (not e!760320))))

(declare-datatypes ((List!31056 0))(
  ( (Nil!31053) (Cons!31052 (h!32261 (_ BitVec 64)) (t!45312 List!31056)) )
))
(declare-fun arrayNoDuplicates!0 (array!90517 (_ BitVec 32) List!31056) Bool)

(assert (=> b!1334966 (= res!886002 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31053))))

(declare-fun mapNonEmpty!56953 () Bool)

(declare-fun tp!108467 () Bool)

(declare-fun e!760323 () Bool)

(assert (=> mapNonEmpty!56953 (= mapRes!56953 (and tp!108467 e!760323))))

(declare-fun mapRest!56953 () (Array (_ BitVec 32) ValueCell!17528))

(declare-fun mapKey!56953 () (_ BitVec 32))

(declare-fun mapValue!56953 () ValueCell!17528)

(assert (=> mapNonEmpty!56953 (= (arr!43724 _values!1320) (store mapRest!56953 mapKey!56953 mapValue!56953))))

(declare-fun b!1334967 () Bool)

(assert (=> b!1334967 (= e!760323 tp_is_empty!36853)))

(assert (= (and start!112548 res!885999) b!1334962))

(assert (= (and b!1334962 res!886001) b!1334963))

(assert (= (and b!1334963 res!886003) b!1334966))

(assert (= (and b!1334966 res!886002) b!1334964))

(assert (= (and b!1334964 res!886000) b!1334961))

(assert (= (and b!1334960 condMapEmpty!56953) mapIsEmpty!56953))

(assert (= (and b!1334960 (not condMapEmpty!56953)) mapNonEmpty!56953))

(get-info :version)

(assert (= (and mapNonEmpty!56953 ((_ is ValueCellFull!17528) mapValue!56953)) b!1334967))

(assert (= (and b!1334960 ((_ is ValueCellFull!17528) mapDefault!56953)) b!1334965))

(assert (= start!112548 b!1334960))

(declare-fun m!1222719 () Bool)

(assert (=> mapNonEmpty!56953 m!1222719))

(declare-fun m!1222721 () Bool)

(assert (=> b!1334963 m!1222721))

(declare-fun m!1222723 () Bool)

(assert (=> start!112548 m!1222723))

(declare-fun m!1222725 () Bool)

(assert (=> start!112548 m!1222725))

(declare-fun m!1222727 () Bool)

(assert (=> start!112548 m!1222727))

(declare-fun m!1222729 () Bool)

(assert (=> b!1334961 m!1222729))

(assert (=> b!1334961 m!1222729))

(declare-fun m!1222731 () Bool)

(assert (=> b!1334961 m!1222731))

(declare-fun m!1222733 () Bool)

(assert (=> b!1334966 m!1222733))

(check-sat (not b!1334961) (not start!112548) tp_is_empty!36853 (not b!1334963) (not b!1334966) b_and!49833 (not mapNonEmpty!56953) (not b_next!30943))
(check-sat b_and!49833 (not b_next!30943))
