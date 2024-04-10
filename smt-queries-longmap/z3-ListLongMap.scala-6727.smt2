; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84336 () Bool)

(assert start!84336)

(declare-fun b!986524 () Bool)

(declare-fun res!660035 () Bool)

(declare-fun e!556255 () Bool)

(assert (=> b!986524 (=> (not res!660035) (not e!556255))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35835 0))(
  ( (V!35836 (val!11620 Int)) )
))
(declare-datatypes ((ValueCell!11088 0))(
  ( (ValueCellFull!11088 (v!14182 V!35835)) (EmptyCell!11088) )
))
(declare-datatypes ((array!62239 0))(
  ( (array!62240 (arr!29977 (Array (_ BitVec 32) ValueCell!11088)) (size!30456 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62239)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62241 0))(
  ( (array!62242 (arr!29978 (Array (_ BitVec 32) (_ BitVec 64))) (size!30457 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62241)

(assert (=> b!986524 (= res!660035 (and (= (size!30456 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30457 _keys!1544) (size!30456 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986525 () Bool)

(declare-fun e!556253 () Bool)

(declare-fun tp_is_empty!23139 () Bool)

(assert (=> b!986525 (= e!556253 tp_is_empty!23139)))

(declare-fun mapIsEmpty!36737 () Bool)

(declare-fun mapRes!36737 () Bool)

(assert (=> mapIsEmpty!36737 mapRes!36737))

(declare-fun b!986526 () Bool)

(declare-fun e!556254 () Bool)

(assert (=> b!986526 (= e!556254 (and e!556253 mapRes!36737))))

(declare-fun condMapEmpty!36737 () Bool)

(declare-fun mapDefault!36737 () ValueCell!11088)

(assert (=> b!986526 (= condMapEmpty!36737 (= (arr!29977 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11088)) mapDefault!36737)))))

(declare-fun b!986528 () Bool)

(assert (=> b!986528 (= e!556255 false)))

(declare-fun lt!437504 () Bool)

(declare-datatypes ((List!20744 0))(
  ( (Nil!20741) (Cons!20740 (h!21902 (_ BitVec 64)) (t!29643 List!20744)) )
))
(declare-fun arrayNoDuplicates!0 (array!62241 (_ BitVec 32) List!20744) Bool)

(assert (=> b!986528 (= lt!437504 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20741))))

(declare-fun b!986529 () Bool)

(declare-fun res!660034 () Bool)

(assert (=> b!986529 (=> (not res!660034) (not e!556255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62241 (_ BitVec 32)) Bool)

(assert (=> b!986529 (= res!660034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36737 () Bool)

(declare-fun tp!69592 () Bool)

(declare-fun e!556256 () Bool)

(assert (=> mapNonEmpty!36737 (= mapRes!36737 (and tp!69592 e!556256))))

(declare-fun mapRest!36737 () (Array (_ BitVec 32) ValueCell!11088))

(declare-fun mapValue!36737 () ValueCell!11088)

(declare-fun mapKey!36737 () (_ BitVec 32))

(assert (=> mapNonEmpty!36737 (= (arr!29977 _values!1278) (store mapRest!36737 mapKey!36737 mapValue!36737))))

(declare-fun res!660033 () Bool)

(assert (=> start!84336 (=> (not res!660033) (not e!556255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84336 (= res!660033 (validMask!0 mask!1948))))

(assert (=> start!84336 e!556255))

(assert (=> start!84336 true))

(declare-fun array_inv!23167 (array!62239) Bool)

(assert (=> start!84336 (and (array_inv!23167 _values!1278) e!556254)))

(declare-fun array_inv!23168 (array!62241) Bool)

(assert (=> start!84336 (array_inv!23168 _keys!1544)))

(declare-fun b!986527 () Bool)

(assert (=> b!986527 (= e!556256 tp_is_empty!23139)))

(assert (= (and start!84336 res!660033) b!986524))

(assert (= (and b!986524 res!660035) b!986529))

(assert (= (and b!986529 res!660034) b!986528))

(assert (= (and b!986526 condMapEmpty!36737) mapIsEmpty!36737))

(assert (= (and b!986526 (not condMapEmpty!36737)) mapNonEmpty!36737))

(get-info :version)

(assert (= (and mapNonEmpty!36737 ((_ is ValueCellFull!11088) mapValue!36737)) b!986527))

(assert (= (and b!986526 ((_ is ValueCellFull!11088) mapDefault!36737)) b!986525))

(assert (= start!84336 b!986526))

(declare-fun m!913327 () Bool)

(assert (=> b!986528 m!913327))

(declare-fun m!913329 () Bool)

(assert (=> b!986529 m!913329))

(declare-fun m!913331 () Bool)

(assert (=> mapNonEmpty!36737 m!913331))

(declare-fun m!913333 () Bool)

(assert (=> start!84336 m!913333))

(declare-fun m!913335 () Bool)

(assert (=> start!84336 m!913335))

(declare-fun m!913337 () Bool)

(assert (=> start!84336 m!913337))

(check-sat tp_is_empty!23139 (not b!986528) (not start!84336) (not b!986529) (not mapNonEmpty!36737))
(check-sat)
