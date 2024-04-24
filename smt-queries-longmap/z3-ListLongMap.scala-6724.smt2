; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84484 () Bool)

(assert start!84484)

(declare-fun b!987247 () Bool)

(declare-fun e!556685 () Bool)

(declare-fun tp_is_empty!23119 () Bool)

(assert (=> b!987247 (= e!556685 tp_is_empty!23119)))

(declare-fun b!987248 () Bool)

(declare-fun res!660288 () Bool)

(declare-fun e!556687 () Bool)

(assert (=> b!987248 (=> (not res!660288) (not e!556687))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35809 0))(
  ( (V!35810 (val!11610 Int)) )
))
(declare-datatypes ((ValueCell!11078 0))(
  ( (ValueCellFull!11078 (v!14169 V!35809)) (EmptyCell!11078) )
))
(declare-datatypes ((array!62242 0))(
  ( (array!62243 (arr!29974 (Array (_ BitVec 32) ValueCell!11078)) (size!30454 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62242)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62244 0))(
  ( (array!62245 (arr!29975 (Array (_ BitVec 32) (_ BitVec 64))) (size!30455 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62244)

(assert (=> b!987248 (= res!660288 (and (= (size!30454 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30455 _keys!1544) (size!30454 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987249 () Bool)

(declare-fun e!556689 () Bool)

(declare-fun mapRes!36707 () Bool)

(assert (=> b!987249 (= e!556689 (and e!556685 mapRes!36707))))

(declare-fun condMapEmpty!36707 () Bool)

(declare-fun mapDefault!36707 () ValueCell!11078)

(assert (=> b!987249 (= condMapEmpty!36707 (= (arr!29974 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11078)) mapDefault!36707)))))

(declare-fun mapIsEmpty!36707 () Bool)

(assert (=> mapIsEmpty!36707 mapRes!36707))

(declare-fun b!987251 () Bool)

(assert (=> b!987251 (= e!556687 false)))

(declare-fun lt!437835 () Bool)

(declare-datatypes ((List!20737 0))(
  ( (Nil!20734) (Cons!20733 (h!21901 (_ BitVec 64)) (t!29628 List!20737)) )
))
(declare-fun arrayNoDuplicates!0 (array!62244 (_ BitVec 32) List!20737) Bool)

(assert (=> b!987251 (= lt!437835 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20734))))

(declare-fun mapNonEmpty!36707 () Bool)

(declare-fun tp!69563 () Bool)

(declare-fun e!556686 () Bool)

(assert (=> mapNonEmpty!36707 (= mapRes!36707 (and tp!69563 e!556686))))

(declare-fun mapKey!36707 () (_ BitVec 32))

(declare-fun mapValue!36707 () ValueCell!11078)

(declare-fun mapRest!36707 () (Array (_ BitVec 32) ValueCell!11078))

(assert (=> mapNonEmpty!36707 (= (arr!29974 _values!1278) (store mapRest!36707 mapKey!36707 mapValue!36707))))

(declare-fun b!987252 () Bool)

(assert (=> b!987252 (= e!556686 tp_is_empty!23119)))

(declare-fun b!987250 () Bool)

(declare-fun res!660287 () Bool)

(assert (=> b!987250 (=> (not res!660287) (not e!556687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62244 (_ BitVec 32)) Bool)

(assert (=> b!987250 (= res!660287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660289 () Bool)

(assert (=> start!84484 (=> (not res!660289) (not e!556687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84484 (= res!660289 (validMask!0 mask!1948))))

(assert (=> start!84484 e!556687))

(assert (=> start!84484 true))

(declare-fun array_inv!23185 (array!62242) Bool)

(assert (=> start!84484 (and (array_inv!23185 _values!1278) e!556689)))

(declare-fun array_inv!23186 (array!62244) Bool)

(assert (=> start!84484 (array_inv!23186 _keys!1544)))

(assert (= (and start!84484 res!660289) b!987248))

(assert (= (and b!987248 res!660288) b!987250))

(assert (= (and b!987250 res!660287) b!987251))

(assert (= (and b!987249 condMapEmpty!36707) mapIsEmpty!36707))

(assert (= (and b!987249 (not condMapEmpty!36707)) mapNonEmpty!36707))

(get-info :version)

(assert (= (and mapNonEmpty!36707 ((_ is ValueCellFull!11078) mapValue!36707)) b!987252))

(assert (= (and b!987249 ((_ is ValueCellFull!11078) mapDefault!36707)) b!987247))

(assert (= start!84484 b!987249))

(declare-fun m!914501 () Bool)

(assert (=> b!987251 m!914501))

(declare-fun m!914503 () Bool)

(assert (=> mapNonEmpty!36707 m!914503))

(declare-fun m!914505 () Bool)

(assert (=> b!987250 m!914505))

(declare-fun m!914507 () Bool)

(assert (=> start!84484 m!914507))

(declare-fun m!914509 () Bool)

(assert (=> start!84484 m!914509))

(declare-fun m!914511 () Bool)

(assert (=> start!84484 m!914511))

(check-sat tp_is_empty!23119 (not mapNonEmpty!36707) (not start!84484) (not b!987251) (not b!987250))
(check-sat)
