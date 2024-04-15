; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84280 () Bool)

(assert start!84280)

(declare-fun res!659725 () Bool)

(declare-fun e!555823 () Bool)

(assert (=> start!84280 (=> (not res!659725) (not e!555823))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84280 (= res!659725 (validMask!0 mask!1948))))

(assert (=> start!84280 e!555823))

(assert (=> start!84280 true))

(declare-datatypes ((V!35785 0))(
  ( (V!35786 (val!11601 Int)) )
))
(declare-datatypes ((ValueCell!11069 0))(
  ( (ValueCellFull!11069 (v!14162 V!35785)) (EmptyCell!11069) )
))
(declare-datatypes ((array!62102 0))(
  ( (array!62103 (arr!29909 (Array (_ BitVec 32) ValueCell!11069)) (size!30390 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62102)

(declare-fun e!555820 () Bool)

(declare-fun array_inv!23125 (array!62102) Bool)

(assert (=> start!84280 (and (array_inv!23125 _values!1278) e!555820)))

(declare-datatypes ((array!62104 0))(
  ( (array!62105 (arr!29910 (Array (_ BitVec 32) (_ BitVec 64))) (size!30391 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62104)

(declare-fun array_inv!23126 (array!62104) Bool)

(assert (=> start!84280 (array_inv!23126 _keys!1544)))

(declare-fun b!985916 () Bool)

(declare-fun e!555822 () Bool)

(declare-fun tp_is_empty!23101 () Bool)

(assert (=> b!985916 (= e!555822 tp_is_empty!23101)))

(declare-fun mapIsEmpty!36680 () Bool)

(declare-fun mapRes!36680 () Bool)

(assert (=> mapIsEmpty!36680 mapRes!36680))

(declare-fun b!985917 () Bool)

(assert (=> b!985917 (= e!555823 false)))

(declare-fun lt!437211 () Bool)

(declare-datatypes ((List!20766 0))(
  ( (Nil!20763) (Cons!20762 (h!21924 (_ BitVec 64)) (t!29656 List!20766)) )
))
(declare-fun arrayNoDuplicates!0 (array!62104 (_ BitVec 32) List!20766) Bool)

(assert (=> b!985917 (= lt!437211 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20763))))

(declare-fun b!985918 () Bool)

(declare-fun e!555821 () Bool)

(assert (=> b!985918 (= e!555821 tp_is_empty!23101)))

(declare-fun b!985919 () Bool)

(assert (=> b!985919 (= e!555820 (and e!555822 mapRes!36680))))

(declare-fun condMapEmpty!36680 () Bool)

(declare-fun mapDefault!36680 () ValueCell!11069)

(assert (=> b!985919 (= condMapEmpty!36680 (= (arr!29909 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11069)) mapDefault!36680)))))

(declare-fun b!985920 () Bool)

(declare-fun res!659726 () Bool)

(assert (=> b!985920 (=> (not res!659726) (not e!555823))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985920 (= res!659726 (and (= (size!30390 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30391 _keys!1544) (size!30390 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985921 () Bool)

(declare-fun res!659727 () Bool)

(assert (=> b!985921 (=> (not res!659727) (not e!555823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62104 (_ BitVec 32)) Bool)

(assert (=> b!985921 (= res!659727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36680 () Bool)

(declare-fun tp!69536 () Bool)

(assert (=> mapNonEmpty!36680 (= mapRes!36680 (and tp!69536 e!555821))))

(declare-fun mapRest!36680 () (Array (_ BitVec 32) ValueCell!11069))

(declare-fun mapKey!36680 () (_ BitVec 32))

(declare-fun mapValue!36680 () ValueCell!11069)

(assert (=> mapNonEmpty!36680 (= (arr!29909 _values!1278) (store mapRest!36680 mapKey!36680 mapValue!36680))))

(assert (= (and start!84280 res!659725) b!985920))

(assert (= (and b!985920 res!659726) b!985921))

(assert (= (and b!985921 res!659727) b!985917))

(assert (= (and b!985919 condMapEmpty!36680) mapIsEmpty!36680))

(assert (= (and b!985919 (not condMapEmpty!36680)) mapNonEmpty!36680))

(get-info :version)

(assert (= (and mapNonEmpty!36680 ((_ is ValueCellFull!11069) mapValue!36680)) b!985918))

(assert (= (and b!985919 ((_ is ValueCellFull!11069) mapDefault!36680)) b!985916))

(assert (= start!84280 b!985919))

(declare-fun m!912329 () Bool)

(assert (=> start!84280 m!912329))

(declare-fun m!912331 () Bool)

(assert (=> start!84280 m!912331))

(declare-fun m!912333 () Bool)

(assert (=> start!84280 m!912333))

(declare-fun m!912335 () Bool)

(assert (=> b!985917 m!912335))

(declare-fun m!912337 () Bool)

(assert (=> b!985921 m!912337))

(declare-fun m!912339 () Bool)

(assert (=> mapNonEmpty!36680 m!912339))

(check-sat (not b!985921) tp_is_empty!23101 (not start!84280) (not b!985917) (not mapNonEmpty!36680))
(check-sat)
