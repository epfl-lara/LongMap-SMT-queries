; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84250 () Bool)

(assert start!84250)

(declare-fun mapNonEmpty!36635 () Bool)

(declare-fun mapRes!36635 () Bool)

(declare-fun tp!69491 () Bool)

(declare-fun e!555597 () Bool)

(assert (=> mapNonEmpty!36635 (= mapRes!36635 (and tp!69491 e!555597))))

(declare-fun mapKey!36635 () (_ BitVec 32))

(declare-datatypes ((V!35745 0))(
  ( (V!35746 (val!11586 Int)) )
))
(declare-datatypes ((ValueCell!11054 0))(
  ( (ValueCellFull!11054 (v!14147 V!35745)) (EmptyCell!11054) )
))
(declare-datatypes ((array!62044 0))(
  ( (array!62045 (arr!29880 (Array (_ BitVec 32) ValueCell!11054)) (size!30361 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62044)

(declare-fun mapValue!36635 () ValueCell!11054)

(declare-fun mapRest!36635 () (Array (_ BitVec 32) ValueCell!11054))

(assert (=> mapNonEmpty!36635 (= (arr!29880 _values!1278) (store mapRest!36635 mapKey!36635 mapValue!36635))))

(declare-fun b!985646 () Bool)

(declare-fun e!555595 () Bool)

(assert (=> b!985646 (= e!555595 false)))

(declare-fun lt!437166 () Bool)

(declare-datatypes ((array!62046 0))(
  ( (array!62047 (arr!29881 (Array (_ BitVec 32) (_ BitVec 64))) (size!30362 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62046)

(declare-datatypes ((List!20756 0))(
  ( (Nil!20753) (Cons!20752 (h!21914 (_ BitVec 64)) (t!29646 List!20756)) )
))
(declare-fun arrayNoDuplicates!0 (array!62046 (_ BitVec 32) List!20756) Bool)

(assert (=> b!985646 (= lt!437166 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20753))))

(declare-fun b!985647 () Bool)

(declare-fun res!659590 () Bool)

(assert (=> b!985647 (=> (not res!659590) (not e!555595))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62046 (_ BitVec 32)) Bool)

(assert (=> b!985647 (= res!659590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985648 () Bool)

(declare-fun tp_is_empty!23071 () Bool)

(assert (=> b!985648 (= e!555597 tp_is_empty!23071)))

(declare-fun mapIsEmpty!36635 () Bool)

(assert (=> mapIsEmpty!36635 mapRes!36635))

(declare-fun b!985649 () Bool)

(declare-fun e!555598 () Bool)

(declare-fun e!555599 () Bool)

(assert (=> b!985649 (= e!555598 (and e!555599 mapRes!36635))))

(declare-fun condMapEmpty!36635 () Bool)

(declare-fun mapDefault!36635 () ValueCell!11054)

(assert (=> b!985649 (= condMapEmpty!36635 (= (arr!29880 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11054)) mapDefault!36635)))))

(declare-fun res!659591 () Bool)

(assert (=> start!84250 (=> (not res!659591) (not e!555595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84250 (= res!659591 (validMask!0 mask!1948))))

(assert (=> start!84250 e!555595))

(assert (=> start!84250 true))

(declare-fun array_inv!23103 (array!62044) Bool)

(assert (=> start!84250 (and (array_inv!23103 _values!1278) e!555598)))

(declare-fun array_inv!23104 (array!62046) Bool)

(assert (=> start!84250 (array_inv!23104 _keys!1544)))

(declare-fun b!985650 () Bool)

(assert (=> b!985650 (= e!555599 tp_is_empty!23071)))

(declare-fun b!985651 () Bool)

(declare-fun res!659592 () Bool)

(assert (=> b!985651 (=> (not res!659592) (not e!555595))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985651 (= res!659592 (and (= (size!30361 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30362 _keys!1544) (size!30361 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84250 res!659591) b!985651))

(assert (= (and b!985651 res!659592) b!985647))

(assert (= (and b!985647 res!659590) b!985646))

(assert (= (and b!985649 condMapEmpty!36635) mapIsEmpty!36635))

(assert (= (and b!985649 (not condMapEmpty!36635)) mapNonEmpty!36635))

(get-info :version)

(assert (= (and mapNonEmpty!36635 ((_ is ValueCellFull!11054) mapValue!36635)) b!985648))

(assert (= (and b!985649 ((_ is ValueCellFull!11054) mapDefault!36635)) b!985650))

(assert (= start!84250 b!985649))

(declare-fun m!912149 () Bool)

(assert (=> mapNonEmpty!36635 m!912149))

(declare-fun m!912151 () Bool)

(assert (=> b!985646 m!912151))

(declare-fun m!912153 () Bool)

(assert (=> b!985647 m!912153))

(declare-fun m!912155 () Bool)

(assert (=> start!84250 m!912155))

(declare-fun m!912157 () Bool)

(assert (=> start!84250 m!912157))

(declare-fun m!912159 () Bool)

(assert (=> start!84250 m!912159))

(check-sat (not b!985647) (not start!84250) (not mapNonEmpty!36635) tp_is_empty!23071 (not b!985646))
(check-sat)
