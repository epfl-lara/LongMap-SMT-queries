; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112130 () Bool)

(assert start!112130)

(declare-fun b!1328027 () Bool)

(declare-fun res!881166 () Bool)

(declare-fun e!757140 () Bool)

(assert (=> b!1328027 (=> (not res!881166) (not e!757140))))

(declare-datatypes ((V!53683 0))(
  ( (V!53684 (val!18292 Int)) )
))
(declare-datatypes ((ValueCell!17319 0))(
  ( (ValueCellFull!17319 (v!20929 V!53683)) (EmptyCell!17319) )
))
(declare-datatypes ((array!89770 0))(
  ( (array!89771 (arr!43351 (Array (_ BitVec 32) ValueCell!17319)) (size!43901 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89770)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89772 0))(
  ( (array!89773 (arr!43352 (Array (_ BitVec 32) (_ BitVec 64))) (size!43902 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89772)

(assert (=> b!1328027 (= res!881166 (and (= (size!43901 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43902 _keys!1590) (size!43901 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56326 () Bool)

(declare-fun mapRes!56326 () Bool)

(assert (=> mapIsEmpty!56326 mapRes!56326))

(declare-fun b!1328028 () Bool)

(declare-fun e!757137 () Bool)

(declare-fun e!757139 () Bool)

(assert (=> b!1328028 (= e!757137 (and e!757139 mapRes!56326))))

(declare-fun condMapEmpty!56326 () Bool)

(declare-fun mapDefault!56326 () ValueCell!17319)

(assert (=> b!1328028 (= condMapEmpty!56326 (= (arr!43351 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17319)) mapDefault!56326)))))

(declare-fun res!881165 () Bool)

(assert (=> start!112130 (=> (not res!881165) (not e!757140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112130 (= res!881165 (validMask!0 mask!1998))))

(assert (=> start!112130 e!757140))

(assert (=> start!112130 true))

(declare-fun array_inv!32715 (array!89770) Bool)

(assert (=> start!112130 (and (array_inv!32715 _values!1320) e!757137)))

(declare-fun array_inv!32716 (array!89772) Bool)

(assert (=> start!112130 (array_inv!32716 _keys!1590)))

(declare-fun b!1328029 () Bool)

(declare-fun e!757141 () Bool)

(declare-fun tp_is_empty!36435 () Bool)

(assert (=> b!1328029 (= e!757141 tp_is_empty!36435)))

(declare-fun b!1328030 () Bool)

(assert (=> b!1328030 (= e!757140 false)))

(declare-fun lt!590794 () Bool)

(declare-datatypes ((List!30707 0))(
  ( (Nil!30704) (Cons!30703 (h!31912 (_ BitVec 64)) (t!44713 List!30707)) )
))
(declare-fun arrayNoDuplicates!0 (array!89772 (_ BitVec 32) List!30707) Bool)

(assert (=> b!1328030 (= lt!590794 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30704))))

(declare-fun b!1328031 () Bool)

(assert (=> b!1328031 (= e!757139 tp_is_empty!36435)))

(declare-fun mapNonEmpty!56326 () Bool)

(declare-fun tp!107233 () Bool)

(assert (=> mapNonEmpty!56326 (= mapRes!56326 (and tp!107233 e!757141))))

(declare-fun mapValue!56326 () ValueCell!17319)

(declare-fun mapKey!56326 () (_ BitVec 32))

(declare-fun mapRest!56326 () (Array (_ BitVec 32) ValueCell!17319))

(assert (=> mapNonEmpty!56326 (= (arr!43351 _values!1320) (store mapRest!56326 mapKey!56326 mapValue!56326))))

(declare-fun b!1328032 () Bool)

(declare-fun res!881164 () Bool)

(assert (=> b!1328032 (=> (not res!881164) (not e!757140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89772 (_ BitVec 32)) Bool)

(assert (=> b!1328032 (= res!881164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112130 res!881165) b!1328027))

(assert (= (and b!1328027 res!881166) b!1328032))

(assert (= (and b!1328032 res!881164) b!1328030))

(assert (= (and b!1328028 condMapEmpty!56326) mapIsEmpty!56326))

(assert (= (and b!1328028 (not condMapEmpty!56326)) mapNonEmpty!56326))

(get-info :version)

(assert (= (and mapNonEmpty!56326 ((_ is ValueCellFull!17319) mapValue!56326)) b!1328029))

(assert (= (and b!1328028 ((_ is ValueCellFull!17319) mapDefault!56326)) b!1328031))

(assert (= start!112130 b!1328028))

(declare-fun m!1217145 () Bool)

(assert (=> start!112130 m!1217145))

(declare-fun m!1217147 () Bool)

(assert (=> start!112130 m!1217147))

(declare-fun m!1217149 () Bool)

(assert (=> start!112130 m!1217149))

(declare-fun m!1217151 () Bool)

(assert (=> b!1328030 m!1217151))

(declare-fun m!1217153 () Bool)

(assert (=> mapNonEmpty!56326 m!1217153))

(declare-fun m!1217155 () Bool)

(assert (=> b!1328032 m!1217155))

(check-sat (not b!1328030) (not mapNonEmpty!56326) (not start!112130) tp_is_empty!36435 (not b!1328032))
(check-sat)
