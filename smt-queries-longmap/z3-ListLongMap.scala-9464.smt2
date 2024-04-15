; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112392 () Bool)

(assert start!112392)

(declare-fun b_free!30787 () Bool)

(declare-fun b_next!30787 () Bool)

(assert (=> start!112392 (= b_free!30787 (not b_next!30787))))

(declare-fun tp!107998 () Bool)

(declare-fun b_and!49611 () Bool)

(assert (=> start!112392 (= tp!107998 b_and!49611)))

(declare-fun res!884247 () Bool)

(declare-fun e!759070 () Bool)

(assert (=> start!112392 (=> (not res!884247) (not e!759070))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112392 (= res!884247 (validMask!0 mask!1998))))

(assert (=> start!112392 e!759070))

(declare-datatypes ((V!54033 0))(
  ( (V!54034 (val!18423 Int)) )
))
(declare-datatypes ((ValueCell!17450 0))(
  ( (ValueCellFull!17450 (v!21059 V!54033)) (EmptyCell!17450) )
))
(declare-datatypes ((array!90213 0))(
  ( (array!90214 (arr!43573 (Array (_ BitVec 32) ValueCell!17450)) (size!44125 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90213)

(declare-fun e!759069 () Bool)

(declare-fun array_inv!33053 (array!90213) Bool)

(assert (=> start!112392 (and (array_inv!33053 _values!1320) e!759069)))

(assert (=> start!112392 true))

(declare-datatypes ((array!90215 0))(
  ( (array!90216 (arr!43574 (Array (_ BitVec 32) (_ BitVec 64))) (size!44126 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90215)

(declare-fun array_inv!33054 (array!90215) Bool)

(assert (=> start!112392 (array_inv!33054 _keys!1590)))

(assert (=> start!112392 tp!107998))

(declare-fun tp_is_empty!36697 () Bool)

(assert (=> start!112392 tp_is_empty!36697))

(declare-fun b!1332437 () Bool)

(declare-fun e!759073 () Bool)

(assert (=> b!1332437 (= e!759073 tp_is_empty!36697)))

(declare-fun mapIsEmpty!56719 () Bool)

(declare-fun mapRes!56719 () Bool)

(assert (=> mapIsEmpty!56719 mapRes!56719))

(declare-fun b!1332438 () Bool)

(assert (=> b!1332438 (= e!759070 false)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!591847 () Bool)

(declare-fun minValue!1262 () V!54033)

(declare-fun zeroValue!1262 () V!54033)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23814 0))(
  ( (tuple2!23815 (_1!11918 (_ BitVec 64)) (_2!11918 V!54033)) )
))
(declare-datatypes ((List!30948 0))(
  ( (Nil!30945) (Cons!30944 (h!32153 tuple2!23814) (t!45138 List!30948)) )
))
(declare-datatypes ((ListLongMap!21471 0))(
  ( (ListLongMap!21472 (toList!10751 List!30948)) )
))
(declare-fun contains!8843 (ListLongMap!21471 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5611 (array!90215 array!90213 (_ BitVec 32) (_ BitVec 32) V!54033 V!54033 (_ BitVec 32) Int) ListLongMap!21471)

(assert (=> b!1332438 (= lt!591847 (contains!8843 (getCurrentListMap!5611 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332439 () Bool)

(declare-fun res!884245 () Bool)

(assert (=> b!1332439 (=> (not res!884245) (not e!759070))))

(assert (=> b!1332439 (= res!884245 (and (= (size!44125 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44126 _keys!1590) (size!44125 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332440 () Bool)

(declare-fun res!884246 () Bool)

(assert (=> b!1332440 (=> (not res!884246) (not e!759070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90215 (_ BitVec 32)) Bool)

(assert (=> b!1332440 (= res!884246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332441 () Bool)

(declare-fun e!759072 () Bool)

(assert (=> b!1332441 (= e!759072 tp_is_empty!36697)))

(declare-fun b!1332442 () Bool)

(assert (=> b!1332442 (= e!759069 (and e!759073 mapRes!56719))))

(declare-fun condMapEmpty!56719 () Bool)

(declare-fun mapDefault!56719 () ValueCell!17450)

(assert (=> b!1332442 (= condMapEmpty!56719 (= (arr!43573 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17450)) mapDefault!56719)))))

(declare-fun b!1332443 () Bool)

(declare-fun res!884244 () Bool)

(assert (=> b!1332443 (=> (not res!884244) (not e!759070))))

(declare-datatypes ((List!30949 0))(
  ( (Nil!30946) (Cons!30945 (h!32154 (_ BitVec 64)) (t!45139 List!30949)) )
))
(declare-fun arrayNoDuplicates!0 (array!90215 (_ BitVec 32) List!30949) Bool)

(assert (=> b!1332443 (= res!884244 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30946))))

(declare-fun mapNonEmpty!56719 () Bool)

(declare-fun tp!107999 () Bool)

(assert (=> mapNonEmpty!56719 (= mapRes!56719 (and tp!107999 e!759072))))

(declare-fun mapKey!56719 () (_ BitVec 32))

(declare-fun mapValue!56719 () ValueCell!17450)

(declare-fun mapRest!56719 () (Array (_ BitVec 32) ValueCell!17450))

(assert (=> mapNonEmpty!56719 (= (arr!43573 _values!1320) (store mapRest!56719 mapKey!56719 mapValue!56719))))

(declare-fun b!1332444 () Bool)

(declare-fun res!884248 () Bool)

(assert (=> b!1332444 (=> (not res!884248) (not e!759070))))

(assert (=> b!1332444 (= res!884248 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44126 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112392 res!884247) b!1332439))

(assert (= (and b!1332439 res!884245) b!1332440))

(assert (= (and b!1332440 res!884246) b!1332443))

(assert (= (and b!1332443 res!884244) b!1332444))

(assert (= (and b!1332444 res!884248) b!1332438))

(assert (= (and b!1332442 condMapEmpty!56719) mapIsEmpty!56719))

(assert (= (and b!1332442 (not condMapEmpty!56719)) mapNonEmpty!56719))

(get-info :version)

(assert (= (and mapNonEmpty!56719 ((_ is ValueCellFull!17450) mapValue!56719)) b!1332441))

(assert (= (and b!1332442 ((_ is ValueCellFull!17450) mapDefault!56719)) b!1332437))

(assert (= start!112392 b!1332442))

(declare-fun m!1220823 () Bool)

(assert (=> b!1332440 m!1220823))

(declare-fun m!1220825 () Bool)

(assert (=> mapNonEmpty!56719 m!1220825))

(declare-fun m!1220827 () Bool)

(assert (=> b!1332438 m!1220827))

(assert (=> b!1332438 m!1220827))

(declare-fun m!1220829 () Bool)

(assert (=> b!1332438 m!1220829))

(declare-fun m!1220831 () Bool)

(assert (=> start!112392 m!1220831))

(declare-fun m!1220833 () Bool)

(assert (=> start!112392 m!1220833))

(declare-fun m!1220835 () Bool)

(assert (=> start!112392 m!1220835))

(declare-fun m!1220837 () Bool)

(assert (=> b!1332443 m!1220837))

(check-sat (not b!1332438) b_and!49611 (not b!1332440) (not start!112392) (not b_next!30787) tp_is_empty!36697 (not b!1332443) (not mapNonEmpty!56719))
(check-sat b_and!49611 (not b_next!30787))
