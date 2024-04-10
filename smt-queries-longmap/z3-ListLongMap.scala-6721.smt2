; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84300 () Bool)

(assert start!84300)

(declare-fun mapIsEmpty!36683 () Bool)

(declare-fun mapRes!36683 () Bool)

(assert (=> mapIsEmpty!36683 mapRes!36683))

(declare-fun b!986173 () Bool)

(declare-fun e!555985 () Bool)

(assert (=> b!986173 (= e!555985 false)))

(declare-fun lt!437450 () Bool)

(declare-datatypes ((array!62173 0))(
  ( (array!62174 (arr!29944 (Array (_ BitVec 32) (_ BitVec 64))) (size!30423 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62173)

(declare-datatypes ((List!20731 0))(
  ( (Nil!20728) (Cons!20727 (h!21889 (_ BitVec 64)) (t!29630 List!20731)) )
))
(declare-fun arrayNoDuplicates!0 (array!62173 (_ BitVec 32) List!20731) Bool)

(assert (=> b!986173 (= lt!437450 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20728))))

(declare-fun res!659844 () Bool)

(assert (=> start!84300 (=> (not res!659844) (not e!555985))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84300 (= res!659844 (validMask!0 mask!1948))))

(assert (=> start!84300 e!555985))

(assert (=> start!84300 true))

(declare-datatypes ((V!35787 0))(
  ( (V!35788 (val!11602 Int)) )
))
(declare-datatypes ((ValueCell!11070 0))(
  ( (ValueCellFull!11070 (v!14164 V!35787)) (EmptyCell!11070) )
))
(declare-datatypes ((array!62175 0))(
  ( (array!62176 (arr!29945 (Array (_ BitVec 32) ValueCell!11070)) (size!30424 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62175)

(declare-fun e!555983 () Bool)

(declare-fun array_inv!23141 (array!62175) Bool)

(assert (=> start!84300 (and (array_inv!23141 _values!1278) e!555983)))

(declare-fun array_inv!23142 (array!62173) Bool)

(assert (=> start!84300 (array_inv!23142 _keys!1544)))

(declare-fun b!986174 () Bool)

(declare-fun res!659846 () Bool)

(assert (=> b!986174 (=> (not res!659846) (not e!555985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62173 (_ BitVec 32)) Bool)

(assert (=> b!986174 (= res!659846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986175 () Bool)

(declare-fun e!555986 () Bool)

(assert (=> b!986175 (= e!555983 (and e!555986 mapRes!36683))))

(declare-fun condMapEmpty!36683 () Bool)

(declare-fun mapDefault!36683 () ValueCell!11070)

(assert (=> b!986175 (= condMapEmpty!36683 (= (arr!29945 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11070)) mapDefault!36683)))))

(declare-fun b!986176 () Bool)

(declare-fun res!659845 () Bool)

(assert (=> b!986176 (=> (not res!659845) (not e!555985))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986176 (= res!659845 (and (= (size!30424 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30423 _keys!1544) (size!30424 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986177 () Bool)

(declare-fun tp_is_empty!23103 () Bool)

(assert (=> b!986177 (= e!555986 tp_is_empty!23103)))

(declare-fun b!986178 () Bool)

(declare-fun e!555987 () Bool)

(assert (=> b!986178 (= e!555987 tp_is_empty!23103)))

(declare-fun mapNonEmpty!36683 () Bool)

(declare-fun tp!69538 () Bool)

(assert (=> mapNonEmpty!36683 (= mapRes!36683 (and tp!69538 e!555987))))

(declare-fun mapKey!36683 () (_ BitVec 32))

(declare-fun mapValue!36683 () ValueCell!11070)

(declare-fun mapRest!36683 () (Array (_ BitVec 32) ValueCell!11070))

(assert (=> mapNonEmpty!36683 (= (arr!29945 _values!1278) (store mapRest!36683 mapKey!36683 mapValue!36683))))

(assert (= (and start!84300 res!659844) b!986176))

(assert (= (and b!986176 res!659845) b!986174))

(assert (= (and b!986174 res!659846) b!986173))

(assert (= (and b!986175 condMapEmpty!36683) mapIsEmpty!36683))

(assert (= (and b!986175 (not condMapEmpty!36683)) mapNonEmpty!36683))

(get-info :version)

(assert (= (and mapNonEmpty!36683 ((_ is ValueCellFull!11070) mapValue!36683)) b!986178))

(assert (= (and b!986175 ((_ is ValueCellFull!11070) mapDefault!36683)) b!986177))

(assert (= start!84300 b!986175))

(declare-fun m!913099 () Bool)

(assert (=> b!986173 m!913099))

(declare-fun m!913101 () Bool)

(assert (=> start!84300 m!913101))

(declare-fun m!913103 () Bool)

(assert (=> start!84300 m!913103))

(declare-fun m!913105 () Bool)

(assert (=> start!84300 m!913105))

(declare-fun m!913107 () Bool)

(assert (=> b!986174 m!913107))

(declare-fun m!913109 () Bool)

(assert (=> mapNonEmpty!36683 m!913109))

(check-sat (not mapNonEmpty!36683) (not start!84300) tp_is_empty!23103 (not b!986173) (not b!986174))
(check-sat)
