; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84454 () Bool)

(assert start!84454)

(declare-fun b!986950 () Bool)

(declare-fun e!556463 () Bool)

(declare-fun tp_is_empty!23089 () Bool)

(assert (=> b!986950 (= e!556463 tp_is_empty!23089)))

(declare-fun res!660125 () Bool)

(declare-fun e!556461 () Bool)

(assert (=> start!84454 (=> (not res!660125) (not e!556461))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84454 (= res!660125 (validMask!0 mask!1948))))

(assert (=> start!84454 e!556461))

(assert (=> start!84454 true))

(declare-datatypes ((V!35769 0))(
  ( (V!35770 (val!11595 Int)) )
))
(declare-datatypes ((ValueCell!11063 0))(
  ( (ValueCellFull!11063 (v!14154 V!35769)) (EmptyCell!11063) )
))
(declare-datatypes ((array!62190 0))(
  ( (array!62191 (arr!29948 (Array (_ BitVec 32) ValueCell!11063)) (size!30428 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62190)

(declare-fun e!556464 () Bool)

(declare-fun array_inv!23165 (array!62190) Bool)

(assert (=> start!84454 (and (array_inv!23165 _values!1278) e!556464)))

(declare-datatypes ((array!62192 0))(
  ( (array!62193 (arr!29949 (Array (_ BitVec 32) (_ BitVec 64))) (size!30429 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62192)

(declare-fun array_inv!23166 (array!62192) Bool)

(assert (=> start!84454 (array_inv!23166 _keys!1544)))

(declare-fun mapIsEmpty!36662 () Bool)

(declare-fun mapRes!36662 () Bool)

(assert (=> mapIsEmpty!36662 mapRes!36662))

(declare-fun b!986951 () Bool)

(declare-fun e!556460 () Bool)

(assert (=> b!986951 (= e!556460 tp_is_empty!23089)))

(declare-fun b!986952 () Bool)

(assert (=> b!986952 (= e!556461 false)))

(declare-fun lt!437790 () Bool)

(declare-datatypes ((List!20729 0))(
  ( (Nil!20726) (Cons!20725 (h!21893 (_ BitVec 64)) (t!29620 List!20729)) )
))
(declare-fun arrayNoDuplicates!0 (array!62192 (_ BitVec 32) List!20729) Bool)

(assert (=> b!986952 (= lt!437790 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20726))))

(declare-fun mapNonEmpty!36662 () Bool)

(declare-fun tp!69518 () Bool)

(assert (=> mapNonEmpty!36662 (= mapRes!36662 (and tp!69518 e!556460))))

(declare-fun mapRest!36662 () (Array (_ BitVec 32) ValueCell!11063))

(declare-fun mapValue!36662 () ValueCell!11063)

(declare-fun mapKey!36662 () (_ BitVec 32))

(assert (=> mapNonEmpty!36662 (= (arr!29948 _values!1278) (store mapRest!36662 mapKey!36662 mapValue!36662))))

(declare-fun b!986953 () Bool)

(assert (=> b!986953 (= e!556464 (and e!556463 mapRes!36662))))

(declare-fun condMapEmpty!36662 () Bool)

(declare-fun mapDefault!36662 () ValueCell!11063)

(assert (=> b!986953 (= condMapEmpty!36662 (= (arr!29948 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11063)) mapDefault!36662)))))

(declare-fun b!986954 () Bool)

(declare-fun res!660126 () Bool)

(assert (=> b!986954 (=> (not res!660126) (not e!556461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62192 (_ BitVec 32)) Bool)

(assert (=> b!986954 (= res!660126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986955 () Bool)

(declare-fun res!660127 () Bool)

(assert (=> b!986955 (=> (not res!660127) (not e!556461))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986955 (= res!660127 (and (= (size!30428 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30429 _keys!1544) (size!30428 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84454 res!660125) b!986955))

(assert (= (and b!986955 res!660127) b!986954))

(assert (= (and b!986954 res!660126) b!986952))

(assert (= (and b!986953 condMapEmpty!36662) mapIsEmpty!36662))

(assert (= (and b!986953 (not condMapEmpty!36662)) mapNonEmpty!36662))

(get-info :version)

(assert (= (and mapNonEmpty!36662 ((_ is ValueCellFull!11063) mapValue!36662)) b!986951))

(assert (= (and b!986953 ((_ is ValueCellFull!11063) mapDefault!36662)) b!986950))

(assert (= start!84454 b!986953))

(declare-fun m!914309 () Bool)

(assert (=> start!84454 m!914309))

(declare-fun m!914311 () Bool)

(assert (=> start!84454 m!914311))

(declare-fun m!914313 () Bool)

(assert (=> start!84454 m!914313))

(declare-fun m!914315 () Bool)

(assert (=> b!986952 m!914315))

(declare-fun m!914317 () Bool)

(assert (=> mapNonEmpty!36662 m!914317))

(declare-fun m!914319 () Bool)

(assert (=> b!986954 m!914319))

(check-sat (not start!84454) (not b!986954) tp_is_empty!23089 (not b!986952) (not mapNonEmpty!36662))
(check-sat)
