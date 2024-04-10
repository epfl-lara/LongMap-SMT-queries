; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112400 () Bool)

(assert start!112400)

(declare-fun b_free!30795 () Bool)

(declare-fun b_next!30795 () Bool)

(assert (=> start!112400 (= b_free!30795 (not b_next!30795))))

(declare-fun tp!108022 () Bool)

(declare-fun b_and!49637 () Bool)

(assert (=> start!112400 (= tp!108022 b_and!49637)))

(declare-fun b!1332603 () Bool)

(declare-fun res!884333 () Bool)

(declare-fun e!759165 () Bool)

(assert (=> b!1332603 (=> (not res!884333) (not e!759165))))

(declare-datatypes ((array!90290 0))(
  ( (array!90291 (arr!43611 (Array (_ BitVec 32) (_ BitVec 64))) (size!44161 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90290)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90290 (_ BitVec 32)) Bool)

(assert (=> b!1332603 (= res!884333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332604 () Bool)

(assert (=> b!1332604 (= e!759165 false)))

(declare-datatypes ((V!54043 0))(
  ( (V!54044 (val!18427 Int)) )
))
(declare-datatypes ((ValueCell!17454 0))(
  ( (ValueCellFull!17454 (v!21064 V!54043)) (EmptyCell!17454) )
))
(declare-datatypes ((array!90292 0))(
  ( (array!90293 (arr!43612 (Array (_ BitVec 32) ValueCell!17454)) (size!44162 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90292)

(declare-fun lt!592045 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54043)

(declare-fun zeroValue!1262 () V!54043)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23750 0))(
  ( (tuple2!23751 (_1!11886 (_ BitVec 64)) (_2!11886 V!54043)) )
))
(declare-datatypes ((List!30894 0))(
  ( (Nil!30891) (Cons!30890 (h!32099 tuple2!23750) (t!45092 List!30894)) )
))
(declare-datatypes ((ListLongMap!21407 0))(
  ( (ListLongMap!21408 (toList!10719 List!30894)) )
))
(declare-fun contains!8883 (ListLongMap!21407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5700 (array!90290 array!90292 (_ BitVec 32) (_ BitVec 32) V!54043 V!54043 (_ BitVec 32) Int) ListLongMap!21407)

(assert (=> b!1332604 (= lt!592045 (contains!8883 (getCurrentListMap!5700 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332605 () Bool)

(declare-fun res!884336 () Bool)

(assert (=> b!1332605 (=> (not res!884336) (not e!759165))))

(assert (=> b!1332605 (= res!884336 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44161 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332606 () Bool)

(declare-fun res!884335 () Bool)

(assert (=> b!1332606 (=> (not res!884335) (not e!759165))))

(declare-datatypes ((List!30895 0))(
  ( (Nil!30892) (Cons!30891 (h!32100 (_ BitVec 64)) (t!45093 List!30895)) )
))
(declare-fun arrayNoDuplicates!0 (array!90290 (_ BitVec 32) List!30895) Bool)

(assert (=> b!1332606 (= res!884335 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30892))))

(declare-fun mapNonEmpty!56731 () Bool)

(declare-fun mapRes!56731 () Bool)

(declare-fun tp!108021 () Bool)

(declare-fun e!759166 () Bool)

(assert (=> mapNonEmpty!56731 (= mapRes!56731 (and tp!108021 e!759166))))

(declare-fun mapValue!56731 () ValueCell!17454)

(declare-fun mapRest!56731 () (Array (_ BitVec 32) ValueCell!17454))

(declare-fun mapKey!56731 () (_ BitVec 32))

(assert (=> mapNonEmpty!56731 (= (arr!43612 _values!1320) (store mapRest!56731 mapKey!56731 mapValue!56731))))

(declare-fun mapIsEmpty!56731 () Bool)

(assert (=> mapIsEmpty!56731 mapRes!56731))

(declare-fun b!1332607 () Bool)

(declare-fun e!759162 () Bool)

(declare-fun e!759164 () Bool)

(assert (=> b!1332607 (= e!759162 (and e!759164 mapRes!56731))))

(declare-fun condMapEmpty!56731 () Bool)

(declare-fun mapDefault!56731 () ValueCell!17454)

(assert (=> b!1332607 (= condMapEmpty!56731 (= (arr!43612 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17454)) mapDefault!56731)))))

(declare-fun res!884334 () Bool)

(assert (=> start!112400 (=> (not res!884334) (not e!759165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112400 (= res!884334 (validMask!0 mask!1998))))

(assert (=> start!112400 e!759165))

(declare-fun array_inv!32897 (array!90292) Bool)

(assert (=> start!112400 (and (array_inv!32897 _values!1320) e!759162)))

(assert (=> start!112400 true))

(declare-fun array_inv!32898 (array!90290) Bool)

(assert (=> start!112400 (array_inv!32898 _keys!1590)))

(assert (=> start!112400 tp!108022))

(declare-fun tp_is_empty!36705 () Bool)

(assert (=> start!112400 tp_is_empty!36705))

(declare-fun b!1332608 () Bool)

(declare-fun res!884337 () Bool)

(assert (=> b!1332608 (=> (not res!884337) (not e!759165))))

(assert (=> b!1332608 (= res!884337 (and (= (size!44162 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44161 _keys!1590) (size!44162 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332609 () Bool)

(assert (=> b!1332609 (= e!759164 tp_is_empty!36705)))

(declare-fun b!1332610 () Bool)

(assert (=> b!1332610 (= e!759166 tp_is_empty!36705)))

(assert (= (and start!112400 res!884334) b!1332608))

(assert (= (and b!1332608 res!884337) b!1332603))

(assert (= (and b!1332603 res!884333) b!1332606))

(assert (= (and b!1332606 res!884335) b!1332605))

(assert (= (and b!1332605 res!884336) b!1332604))

(assert (= (and b!1332607 condMapEmpty!56731) mapIsEmpty!56731))

(assert (= (and b!1332607 (not condMapEmpty!56731)) mapNonEmpty!56731))

(get-info :version)

(assert (= (and mapNonEmpty!56731 ((_ is ValueCellFull!17454) mapValue!56731)) b!1332610))

(assert (= (and b!1332607 ((_ is ValueCellFull!17454) mapDefault!56731)) b!1332609))

(assert (= start!112400 b!1332607))

(declare-fun m!1221403 () Bool)

(assert (=> b!1332603 m!1221403))

(declare-fun m!1221405 () Bool)

(assert (=> b!1332606 m!1221405))

(declare-fun m!1221407 () Bool)

(assert (=> b!1332604 m!1221407))

(assert (=> b!1332604 m!1221407))

(declare-fun m!1221409 () Bool)

(assert (=> b!1332604 m!1221409))

(declare-fun m!1221411 () Bool)

(assert (=> start!112400 m!1221411))

(declare-fun m!1221413 () Bool)

(assert (=> start!112400 m!1221413))

(declare-fun m!1221415 () Bool)

(assert (=> start!112400 m!1221415))

(declare-fun m!1221417 () Bool)

(assert (=> mapNonEmpty!56731 m!1221417))

(check-sat (not b_next!30795) (not b!1332606) (not b!1332603) b_and!49637 tp_is_empty!36705 (not start!112400) (not b!1332604) (not mapNonEmpty!56731))
(check-sat b_and!49637 (not b_next!30795))
