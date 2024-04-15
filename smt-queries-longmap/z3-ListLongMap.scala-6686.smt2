; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84070 () Bool)

(assert start!84070)

(declare-fun mapNonEmpty!36365 () Bool)

(declare-fun mapRes!36365 () Bool)

(declare-fun tp!69050 () Bool)

(declare-fun e!554086 () Bool)

(assert (=> mapNonEmpty!36365 (= mapRes!36365 (and tp!69050 e!554086))))

(declare-fun mapKey!36365 () (_ BitVec 32))

(declare-datatypes ((V!35505 0))(
  ( (V!35506 (val!11496 Int)) )
))
(declare-datatypes ((ValueCell!10964 0))(
  ( (ValueCellFull!10964 (v!14057 V!35505)) (EmptyCell!10964) )
))
(declare-datatypes ((array!61706 0))(
  ( (array!61707 (arr!29711 (Array (_ BitVec 32) ValueCell!10964)) (size!30192 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61706)

(declare-fun mapRest!36365 () (Array (_ BitVec 32) ValueCell!10964))

(declare-fun mapValue!36365 () ValueCell!10964)

(assert (=> mapNonEmpty!36365 (= (arr!29711 _values!1278) (store mapRest!36365 mapKey!36365 mapValue!36365))))

(declare-fun b!983045 () Bool)

(declare-fun e!554085 () Bool)

(declare-fun tp_is_empty!22891 () Bool)

(assert (=> b!983045 (= e!554085 tp_is_empty!22891)))

(declare-fun b!983046 () Bool)

(declare-fun e!554083 () Bool)

(assert (=> b!983046 (= e!554083 false)))

(declare-fun lt!436257 () Bool)

(declare-datatypes ((array!61708 0))(
  ( (array!61709 (arr!29712 (Array (_ BitVec 32) (_ BitVec 64))) (size!30193 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61708)

(declare-datatypes ((List!20644 0))(
  ( (Nil!20641) (Cons!20640 (h!21802 (_ BitVec 64)) (t!29426 List!20644)) )
))
(declare-fun arrayNoDuplicates!0 (array!61708 (_ BitVec 32) List!20644) Bool)

(assert (=> b!983046 (= lt!436257 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20641))))

(declare-fun b!983048 () Bool)

(declare-fun e!554084 () Bool)

(assert (=> b!983048 (= e!554084 (and e!554085 mapRes!36365))))

(declare-fun condMapEmpty!36365 () Bool)

(declare-fun mapDefault!36365 () ValueCell!10964)

(assert (=> b!983048 (= condMapEmpty!36365 (= (arr!29711 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10964)) mapDefault!36365)))))

(declare-fun b!983049 () Bool)

(declare-fun res!657908 () Bool)

(assert (=> b!983049 (=> (not res!657908) (not e!554083))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983049 (= res!657908 (and (= (size!30192 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30193 _keys!1544) (size!30192 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!657907 () Bool)

(assert (=> start!84070 (=> (not res!657907) (not e!554083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84070 (= res!657907 (validMask!0 mask!1948))))

(assert (=> start!84070 e!554083))

(assert (=> start!84070 true))

(declare-fun array_inv!22985 (array!61706) Bool)

(assert (=> start!84070 (and (array_inv!22985 _values!1278) e!554084)))

(declare-fun array_inv!22986 (array!61708) Bool)

(assert (=> start!84070 (array_inv!22986 _keys!1544)))

(declare-fun b!983047 () Bool)

(declare-fun res!657909 () Bool)

(assert (=> b!983047 (=> (not res!657909) (not e!554083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61708 (_ BitVec 32)) Bool)

(assert (=> b!983047 (= res!657909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983050 () Bool)

(assert (=> b!983050 (= e!554086 tp_is_empty!22891)))

(declare-fun mapIsEmpty!36365 () Bool)

(assert (=> mapIsEmpty!36365 mapRes!36365))

(assert (= (and start!84070 res!657907) b!983049))

(assert (= (and b!983049 res!657908) b!983047))

(assert (= (and b!983047 res!657909) b!983046))

(assert (= (and b!983048 condMapEmpty!36365) mapIsEmpty!36365))

(assert (= (and b!983048 (not condMapEmpty!36365)) mapNonEmpty!36365))

(get-info :version)

(assert (= (and mapNonEmpty!36365 ((_ is ValueCellFull!10964) mapValue!36365)) b!983050))

(assert (= (and b!983048 ((_ is ValueCellFull!10964) mapDefault!36365)) b!983045))

(assert (= start!84070 b!983048))

(declare-fun m!909851 () Bool)

(assert (=> mapNonEmpty!36365 m!909851))

(declare-fun m!909853 () Bool)

(assert (=> b!983046 m!909853))

(declare-fun m!909855 () Bool)

(assert (=> start!84070 m!909855))

(declare-fun m!909857 () Bool)

(assert (=> start!84070 m!909857))

(declare-fun m!909859 () Bool)

(assert (=> start!84070 m!909859))

(declare-fun m!909861 () Bool)

(assert (=> b!983047 m!909861))

(check-sat (not mapNonEmpty!36365) (not start!84070) (not b!983047) tp_is_empty!22891 (not b!983046))
(check-sat)
