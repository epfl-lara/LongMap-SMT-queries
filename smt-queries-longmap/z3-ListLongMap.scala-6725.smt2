; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84304 () Bool)

(assert start!84304)

(declare-fun mapNonEmpty!36716 () Bool)

(declare-fun mapRes!36716 () Bool)

(declare-fun tp!69572 () Bool)

(declare-fun e!556001 () Bool)

(assert (=> mapNonEmpty!36716 (= mapRes!36716 (and tp!69572 e!556001))))

(declare-datatypes ((V!35817 0))(
  ( (V!35818 (val!11613 Int)) )
))
(declare-datatypes ((ValueCell!11081 0))(
  ( (ValueCellFull!11081 (v!14174 V!35817)) (EmptyCell!11081) )
))
(declare-datatypes ((array!62146 0))(
  ( (array!62147 (arr!29931 (Array (_ BitVec 32) ValueCell!11081)) (size!30412 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62146)

(declare-fun mapKey!36716 () (_ BitVec 32))

(declare-fun mapValue!36716 () ValueCell!11081)

(declare-fun mapRest!36716 () (Array (_ BitVec 32) ValueCell!11081))

(assert (=> mapNonEmpty!36716 (= (arr!29931 _values!1278) (store mapRest!36716 mapKey!36716 mapValue!36716))))

(declare-fun b!986159 () Bool)

(declare-fun tp_is_empty!23125 () Bool)

(assert (=> b!986159 (= e!556001 tp_is_empty!23125)))

(declare-fun b!986160 () Bool)

(declare-fun e!556000 () Bool)

(assert (=> b!986160 (= e!556000 tp_is_empty!23125)))

(declare-fun b!986161 () Bool)

(declare-fun e!556003 () Bool)

(assert (=> b!986161 (= e!556003 false)))

(declare-fun lt!437247 () Bool)

(declare-datatypes ((array!62148 0))(
  ( (array!62149 (arr!29932 (Array (_ BitVec 32) (_ BitVec 64))) (size!30413 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62148)

(declare-datatypes ((List!20773 0))(
  ( (Nil!20770) (Cons!20769 (h!21931 (_ BitVec 64)) (t!29663 List!20773)) )
))
(declare-fun arrayNoDuplicates!0 (array!62148 (_ BitVec 32) List!20773) Bool)

(assert (=> b!986161 (= lt!437247 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20770))))

(declare-fun b!986162 () Bool)

(declare-fun res!659862 () Bool)

(assert (=> b!986162 (=> (not res!659862) (not e!556003))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986162 (= res!659862 (and (= (size!30412 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30413 _keys!1544) (size!30412 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986163 () Bool)

(declare-fun e!556002 () Bool)

(assert (=> b!986163 (= e!556002 (and e!556000 mapRes!36716))))

(declare-fun condMapEmpty!36716 () Bool)

(declare-fun mapDefault!36716 () ValueCell!11081)

(assert (=> b!986163 (= condMapEmpty!36716 (= (arr!29931 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11081)) mapDefault!36716)))))

(declare-fun b!986164 () Bool)

(declare-fun res!659860 () Bool)

(assert (=> b!986164 (=> (not res!659860) (not e!556003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62148 (_ BitVec 32)) Bool)

(assert (=> b!986164 (= res!659860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36716 () Bool)

(assert (=> mapIsEmpty!36716 mapRes!36716))

(declare-fun res!659861 () Bool)

(assert (=> start!84304 (=> (not res!659861) (not e!556003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84304 (= res!659861 (validMask!0 mask!1948))))

(assert (=> start!84304 e!556003))

(assert (=> start!84304 true))

(declare-fun array_inv!23141 (array!62146) Bool)

(assert (=> start!84304 (and (array_inv!23141 _values!1278) e!556002)))

(declare-fun array_inv!23142 (array!62148) Bool)

(assert (=> start!84304 (array_inv!23142 _keys!1544)))

(assert (= (and start!84304 res!659861) b!986162))

(assert (= (and b!986162 res!659862) b!986164))

(assert (= (and b!986164 res!659860) b!986161))

(assert (= (and b!986163 condMapEmpty!36716) mapIsEmpty!36716))

(assert (= (and b!986163 (not condMapEmpty!36716)) mapNonEmpty!36716))

(get-info :version)

(assert (= (and mapNonEmpty!36716 ((_ is ValueCellFull!11081) mapValue!36716)) b!986159))

(assert (= (and b!986163 ((_ is ValueCellFull!11081) mapDefault!36716)) b!986160))

(assert (= start!84304 b!986163))

(declare-fun m!912485 () Bool)

(assert (=> mapNonEmpty!36716 m!912485))

(declare-fun m!912487 () Bool)

(assert (=> b!986161 m!912487))

(declare-fun m!912489 () Bool)

(assert (=> b!986164 m!912489))

(declare-fun m!912491 () Bool)

(assert (=> start!84304 m!912491))

(declare-fun m!912493 () Bool)

(assert (=> start!84304 m!912493))

(declare-fun m!912495 () Bool)

(assert (=> start!84304 m!912495))

(check-sat (not start!84304) tp_is_empty!23125 (not b!986161) (not b!986164) (not mapNonEmpty!36716))
(check-sat)
