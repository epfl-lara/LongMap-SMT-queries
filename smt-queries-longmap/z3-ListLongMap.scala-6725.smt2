; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84490 () Bool)

(assert start!84490)

(declare-fun mapNonEmpty!36716 () Bool)

(declare-fun mapRes!36716 () Bool)

(declare-fun tp!69572 () Bool)

(declare-fun e!556734 () Bool)

(assert (=> mapNonEmpty!36716 (= mapRes!36716 (and tp!69572 e!556734))))

(declare-datatypes ((V!35817 0))(
  ( (V!35818 (val!11613 Int)) )
))
(declare-datatypes ((ValueCell!11081 0))(
  ( (ValueCellFull!11081 (v!14172 V!35817)) (EmptyCell!11081) )
))
(declare-datatypes ((array!62254 0))(
  ( (array!62255 (arr!29980 (Array (_ BitVec 32) ValueCell!11081)) (size!30460 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62254)

(declare-fun mapRest!36716 () (Array (_ BitVec 32) ValueCell!11081))

(declare-fun mapValue!36716 () ValueCell!11081)

(declare-fun mapKey!36716 () (_ BitVec 32))

(assert (=> mapNonEmpty!36716 (= (arr!29980 _values!1278) (store mapRest!36716 mapKey!36716 mapValue!36716))))

(declare-fun res!660314 () Bool)

(declare-fun e!556733 () Bool)

(assert (=> start!84490 (=> (not res!660314) (not e!556733))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84490 (= res!660314 (validMask!0 mask!1948))))

(assert (=> start!84490 e!556733))

(assert (=> start!84490 true))

(declare-fun e!556731 () Bool)

(declare-fun array_inv!23187 (array!62254) Bool)

(assert (=> start!84490 (and (array_inv!23187 _values!1278) e!556731)))

(declare-datatypes ((array!62256 0))(
  ( (array!62257 (arr!29981 (Array (_ BitVec 32) (_ BitVec 64))) (size!30461 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62256)

(declare-fun array_inv!23188 (array!62256) Bool)

(assert (=> start!84490 (array_inv!23188 _keys!1544)))

(declare-fun b!987301 () Bool)

(declare-fun e!556730 () Bool)

(declare-fun tp_is_empty!23125 () Bool)

(assert (=> b!987301 (= e!556730 tp_is_empty!23125)))

(declare-fun b!987302 () Bool)

(declare-fun res!660315 () Bool)

(assert (=> b!987302 (=> (not res!660315) (not e!556733))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987302 (= res!660315 (and (= (size!30460 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30461 _keys!1544) (size!30460 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987303 () Bool)

(assert (=> b!987303 (= e!556734 tp_is_empty!23125)))

(declare-fun b!987304 () Bool)

(assert (=> b!987304 (= e!556733 false)))

(declare-fun lt!437844 () Bool)

(declare-datatypes ((List!20738 0))(
  ( (Nil!20735) (Cons!20734 (h!21902 (_ BitVec 64)) (t!29629 List!20738)) )
))
(declare-fun arrayNoDuplicates!0 (array!62256 (_ BitVec 32) List!20738) Bool)

(assert (=> b!987304 (= lt!437844 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20735))))

(declare-fun b!987305 () Bool)

(assert (=> b!987305 (= e!556731 (and e!556730 mapRes!36716))))

(declare-fun condMapEmpty!36716 () Bool)

(declare-fun mapDefault!36716 () ValueCell!11081)

(assert (=> b!987305 (= condMapEmpty!36716 (= (arr!29980 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11081)) mapDefault!36716)))))

(declare-fun b!987306 () Bool)

(declare-fun res!660316 () Bool)

(assert (=> b!987306 (=> (not res!660316) (not e!556733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62256 (_ BitVec 32)) Bool)

(assert (=> b!987306 (= res!660316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36716 () Bool)

(assert (=> mapIsEmpty!36716 mapRes!36716))

(assert (= (and start!84490 res!660314) b!987302))

(assert (= (and b!987302 res!660315) b!987306))

(assert (= (and b!987306 res!660316) b!987304))

(assert (= (and b!987305 condMapEmpty!36716) mapIsEmpty!36716))

(assert (= (and b!987305 (not condMapEmpty!36716)) mapNonEmpty!36716))

(get-info :version)

(assert (= (and mapNonEmpty!36716 ((_ is ValueCellFull!11081) mapValue!36716)) b!987303))

(assert (= (and b!987305 ((_ is ValueCellFull!11081) mapDefault!36716)) b!987301))

(assert (= start!84490 b!987305))

(declare-fun m!914537 () Bool)

(assert (=> mapNonEmpty!36716 m!914537))

(declare-fun m!914539 () Bool)

(assert (=> start!84490 m!914539))

(declare-fun m!914541 () Bool)

(assert (=> start!84490 m!914541))

(declare-fun m!914543 () Bool)

(assert (=> start!84490 m!914543))

(declare-fun m!914545 () Bool)

(assert (=> b!987304 m!914545))

(declare-fun m!914547 () Bool)

(assert (=> b!987306 m!914547))

(check-sat (not mapNonEmpty!36716) (not start!84490) tp_is_empty!23125 (not b!987306) (not b!987304))
(check-sat)
