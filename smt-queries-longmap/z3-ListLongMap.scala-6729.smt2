; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84514 () Bool)

(assert start!84514)

(declare-fun mapNonEmpty!36752 () Bool)

(declare-fun mapRes!36752 () Bool)

(declare-fun tp!69608 () Bool)

(declare-fun e!556912 () Bool)

(assert (=> mapNonEmpty!36752 (= mapRes!36752 (and tp!69608 e!556912))))

(declare-fun mapKey!36752 () (_ BitVec 32))

(declare-datatypes ((V!35849 0))(
  ( (V!35850 (val!11625 Int)) )
))
(declare-datatypes ((ValueCell!11093 0))(
  ( (ValueCellFull!11093 (v!14184 V!35849)) (EmptyCell!11093) )
))
(declare-datatypes ((array!62300 0))(
  ( (array!62301 (arr!30003 (Array (_ BitVec 32) ValueCell!11093)) (size!30483 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62300)

(declare-fun mapValue!36752 () ValueCell!11093)

(declare-fun mapRest!36752 () (Array (_ BitVec 32) ValueCell!11093))

(assert (=> mapNonEmpty!36752 (= (arr!30003 _values!1278) (store mapRest!36752 mapKey!36752 mapValue!36752))))

(declare-fun b!987517 () Bool)

(declare-fun tp_is_empty!23149 () Bool)

(assert (=> b!987517 (= e!556912 tp_is_empty!23149)))

(declare-fun b!987518 () Bool)

(declare-fun e!556913 () Bool)

(assert (=> b!987518 (= e!556913 false)))

(declare-fun lt!437880 () Bool)

(declare-datatypes ((array!62302 0))(
  ( (array!62303 (arr!30004 (Array (_ BitVec 32) (_ BitVec 64))) (size!30484 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62302)

(declare-datatypes ((List!20744 0))(
  ( (Nil!20741) (Cons!20740 (h!21908 (_ BitVec 64)) (t!29635 List!20744)) )
))
(declare-fun arrayNoDuplicates!0 (array!62302 (_ BitVec 32) List!20744) Bool)

(assert (=> b!987518 (= lt!437880 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20741))))

(declare-fun res!660422 () Bool)

(assert (=> start!84514 (=> (not res!660422) (not e!556913))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84514 (= res!660422 (validMask!0 mask!1948))))

(assert (=> start!84514 e!556913))

(assert (=> start!84514 true))

(declare-fun e!556910 () Bool)

(declare-fun array_inv!23203 (array!62300) Bool)

(assert (=> start!84514 (and (array_inv!23203 _values!1278) e!556910)))

(declare-fun array_inv!23204 (array!62302) Bool)

(assert (=> start!84514 (array_inv!23204 _keys!1544)))

(declare-fun b!987519 () Bool)

(declare-fun e!556911 () Bool)

(assert (=> b!987519 (= e!556910 (and e!556911 mapRes!36752))))

(declare-fun condMapEmpty!36752 () Bool)

(declare-fun mapDefault!36752 () ValueCell!11093)

(assert (=> b!987519 (= condMapEmpty!36752 (= (arr!30003 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11093)) mapDefault!36752)))))

(declare-fun b!987520 () Bool)

(assert (=> b!987520 (= e!556911 tp_is_empty!23149)))

(declare-fun mapIsEmpty!36752 () Bool)

(assert (=> mapIsEmpty!36752 mapRes!36752))

(declare-fun b!987521 () Bool)

(declare-fun res!660424 () Bool)

(assert (=> b!987521 (=> (not res!660424) (not e!556913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62302 (_ BitVec 32)) Bool)

(assert (=> b!987521 (= res!660424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987522 () Bool)

(declare-fun res!660423 () Bool)

(assert (=> b!987522 (=> (not res!660423) (not e!556913))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987522 (= res!660423 (and (= (size!30483 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30484 _keys!1544) (size!30483 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84514 res!660422) b!987522))

(assert (= (and b!987522 res!660423) b!987521))

(assert (= (and b!987521 res!660424) b!987518))

(assert (= (and b!987519 condMapEmpty!36752) mapIsEmpty!36752))

(assert (= (and b!987519 (not condMapEmpty!36752)) mapNonEmpty!36752))

(get-info :version)

(assert (= (and mapNonEmpty!36752 ((_ is ValueCellFull!11093) mapValue!36752)) b!987517))

(assert (= (and b!987519 ((_ is ValueCellFull!11093) mapDefault!36752)) b!987520))

(assert (= start!84514 b!987519))

(declare-fun m!914681 () Bool)

(assert (=> mapNonEmpty!36752 m!914681))

(declare-fun m!914683 () Bool)

(assert (=> b!987518 m!914683))

(declare-fun m!914685 () Bool)

(assert (=> start!84514 m!914685))

(declare-fun m!914687 () Bool)

(assert (=> start!84514 m!914687))

(declare-fun m!914689 () Bool)

(assert (=> start!84514 m!914689))

(declare-fun m!914691 () Bool)

(assert (=> b!987521 m!914691))

(check-sat (not mapNonEmpty!36752) tp_is_empty!23149 (not b!987518) (not start!84514) (not b!987521))
(check-sat)
