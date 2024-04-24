; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84118 () Bool)

(assert start!84118)

(declare-fun b!981964 () Bool)

(declare-fun e!553619 () Bool)

(declare-fun e!553616 () Bool)

(declare-fun mapRes!36158 () Bool)

(assert (=> b!981964 (= e!553619 (and e!553616 mapRes!36158))))

(declare-fun condMapEmpty!36158 () Bool)

(declare-datatypes ((V!35321 0))(
  ( (V!35322 (val!11427 Int)) )
))
(declare-datatypes ((ValueCell!10895 0))(
  ( (ValueCellFull!10895 (v!13986 V!35321)) (EmptyCell!10895) )
))
(declare-datatypes ((array!61540 0))(
  ( (array!61541 (arr!29623 (Array (_ BitVec 32) ValueCell!10895)) (size!30103 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61540)

(declare-fun mapDefault!36158 () ValueCell!10895)

(assert (=> b!981964 (= condMapEmpty!36158 (= (arr!29623 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10895)) mapDefault!36158)))))

(declare-fun res!656867 () Bool)

(declare-fun e!553617 () Bool)

(assert (=> start!84118 (=> (not res!656867) (not e!553617))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84118 (= res!656867 (validMask!0 mask!1948))))

(assert (=> start!84118 e!553617))

(assert (=> start!84118 true))

(declare-fun array_inv!22929 (array!61540) Bool)

(assert (=> start!84118 (and (array_inv!22929 _values!1278) e!553619)))

(declare-datatypes ((array!61542 0))(
  ( (array!61543 (arr!29624 (Array (_ BitVec 32) (_ BitVec 64))) (size!30104 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61542)

(declare-fun array_inv!22930 (array!61542) Bool)

(assert (=> start!84118 (array_inv!22930 _keys!1544)))

(declare-fun mapNonEmpty!36158 () Bool)

(declare-fun tp!68672 () Bool)

(declare-fun e!553618 () Bool)

(assert (=> mapNonEmpty!36158 (= mapRes!36158 (and tp!68672 e!553618))))

(declare-fun mapKey!36158 () (_ BitVec 32))

(declare-fun mapValue!36158 () ValueCell!10895)

(declare-fun mapRest!36158 () (Array (_ BitVec 32) ValueCell!10895))

(assert (=> mapNonEmpty!36158 (= (arr!29623 _values!1278) (store mapRest!36158 mapKey!36158 mapValue!36158))))

(declare-fun b!981965 () Bool)

(declare-fun tp_is_empty!22753 () Bool)

(assert (=> b!981965 (= e!553618 tp_is_empty!22753)))

(declare-fun b!981966 () Bool)

(assert (=> b!981966 (= e!553616 tp_is_empty!22753)))

(declare-fun b!981967 () Bool)

(declare-fun res!656868 () Bool)

(assert (=> b!981967 (=> (not res!656868) (not e!553617))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981967 (= res!656868 (and (= (size!30103 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30104 _keys!1544) (size!30103 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981968 () Bool)

(declare-fun res!656869 () Bool)

(assert (=> b!981968 (=> (not res!656869) (not e!553617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61542 (_ BitVec 32)) Bool)

(assert (=> b!981968 (= res!656869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981969 () Bool)

(assert (=> b!981969 (= e!553617 false)))

(declare-fun lt!436008 () Bool)

(declare-datatypes ((List!20524 0))(
  ( (Nil!20521) (Cons!20520 (h!21688 (_ BitVec 64)) (t!29199 List!20524)) )
))
(declare-fun arrayNoDuplicates!0 (array!61542 (_ BitVec 32) List!20524) Bool)

(assert (=> b!981969 (= lt!436008 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20521))))

(declare-fun mapIsEmpty!36158 () Bool)

(assert (=> mapIsEmpty!36158 mapRes!36158))

(assert (= (and start!84118 res!656867) b!981967))

(assert (= (and b!981967 res!656868) b!981968))

(assert (= (and b!981968 res!656869) b!981969))

(assert (= (and b!981964 condMapEmpty!36158) mapIsEmpty!36158))

(assert (= (and b!981964 (not condMapEmpty!36158)) mapNonEmpty!36158))

(get-info :version)

(assert (= (and mapNonEmpty!36158 ((_ is ValueCellFull!10895) mapValue!36158)) b!981965))

(assert (= (and b!981964 ((_ is ValueCellFull!10895) mapDefault!36158)) b!981966))

(assert (= start!84118 b!981964))

(declare-fun m!909857 () Bool)

(assert (=> start!84118 m!909857))

(declare-fun m!909859 () Bool)

(assert (=> start!84118 m!909859))

(declare-fun m!909861 () Bool)

(assert (=> start!84118 m!909861))

(declare-fun m!909863 () Bool)

(assert (=> mapNonEmpty!36158 m!909863))

(declare-fun m!909865 () Bool)

(assert (=> b!981968 m!909865))

(declare-fun m!909867 () Bool)

(assert (=> b!981969 m!909867))

(check-sat (not start!84118) tp_is_empty!22753 (not b!981969) (not mapNonEmpty!36158) (not b!981968))
(check-sat)
