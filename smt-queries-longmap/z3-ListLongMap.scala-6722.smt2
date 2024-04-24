; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84472 () Bool)

(assert start!84472)

(declare-fun b!987118 () Bool)

(declare-fun res!660214 () Bool)

(declare-fun e!556596 () Bool)

(assert (=> b!987118 (=> (not res!660214) (not e!556596))))

(declare-datatypes ((array!62220 0))(
  ( (array!62221 (arr!29963 (Array (_ BitVec 32) (_ BitVec 64))) (size!30443 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62220)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62220 (_ BitVec 32)) Bool)

(assert (=> b!987118 (= res!660214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36689 () Bool)

(declare-fun mapRes!36689 () Bool)

(declare-fun tp!69545 () Bool)

(declare-fun e!556598 () Bool)

(assert (=> mapNonEmpty!36689 (= mapRes!36689 (and tp!69545 e!556598))))

(declare-datatypes ((V!35793 0))(
  ( (V!35794 (val!11604 Int)) )
))
(declare-datatypes ((ValueCell!11072 0))(
  ( (ValueCellFull!11072 (v!14163 V!35793)) (EmptyCell!11072) )
))
(declare-datatypes ((array!62222 0))(
  ( (array!62223 (arr!29964 (Array (_ BitVec 32) ValueCell!11072)) (size!30444 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62222)

(declare-fun mapRest!36689 () (Array (_ BitVec 32) ValueCell!11072))

(declare-fun mapValue!36689 () ValueCell!11072)

(declare-fun mapKey!36689 () (_ BitVec 32))

(assert (=> mapNonEmpty!36689 (= (arr!29964 _values!1278) (store mapRest!36689 mapKey!36689 mapValue!36689))))

(declare-fun b!987119 () Bool)

(declare-fun tp_is_empty!23107 () Bool)

(assert (=> b!987119 (= e!556598 tp_is_empty!23107)))

(declare-fun mapIsEmpty!36689 () Bool)

(assert (=> mapIsEmpty!36689 mapRes!36689))

(declare-fun res!660213 () Bool)

(assert (=> start!84472 (=> (not res!660213) (not e!556596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84472 (= res!660213 (validMask!0 mask!1948))))

(assert (=> start!84472 e!556596))

(assert (=> start!84472 true))

(declare-fun e!556595 () Bool)

(declare-fun array_inv!23175 (array!62222) Bool)

(assert (=> start!84472 (and (array_inv!23175 _values!1278) e!556595)))

(declare-fun array_inv!23176 (array!62220) Bool)

(assert (=> start!84472 (array_inv!23176 _keys!1544)))

(declare-fun b!987120 () Bool)

(declare-fun e!556597 () Bool)

(assert (=> b!987120 (= e!556597 tp_is_empty!23107)))

(declare-fun b!987121 () Bool)

(declare-fun res!660217 () Bool)

(assert (=> b!987121 (=> (not res!660217) (not e!556596))))

(declare-datatypes ((List!20733 0))(
  ( (Nil!20730) (Cons!20729 (h!21897 (_ BitVec 64)) (t!29624 List!20733)) )
))
(declare-fun arrayNoDuplicates!0 (array!62220 (_ BitVec 32) List!20733) Bool)

(assert (=> b!987121 (= res!660217 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20730))))

(declare-fun b!987122 () Bool)

(declare-fun res!660212 () Bool)

(assert (=> b!987122 (=> (not res!660212) (not e!556596))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987122 (= res!660212 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30443 _keys!1544))))))

(declare-fun b!987123 () Bool)

(declare-fun res!660216 () Bool)

(assert (=> b!987123 (=> (not res!660216) (not e!556596))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987123 (= res!660216 (and (= (size!30444 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30443 _keys!1544) (size!30444 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987124 () Bool)

(declare-fun res!660215 () Bool)

(assert (=> b!987124 (=> (not res!660215) (not e!556596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987124 (= res!660215 (validKeyInArray!0 (select (arr!29963 _keys!1544) from!1932)))))

(declare-fun b!987125 () Bool)

(assert (=> b!987125 (= e!556595 (and e!556597 mapRes!36689))))

(declare-fun condMapEmpty!36689 () Bool)

(declare-fun mapDefault!36689 () ValueCell!11072)

(assert (=> b!987125 (= condMapEmpty!36689 (= (arr!29964 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11072)) mapDefault!36689)))))

(declare-fun b!987126 () Bool)

(declare-fun lt!437817 () Bool)

(assert (=> b!987126 (= e!556596 (and (or lt!437817 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!437817 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!437817)) (bvsgt from!1932 (size!30443 _keys!1544))))))

(assert (=> b!987126 (= lt!437817 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!84472 res!660213) b!987123))

(assert (= (and b!987123 res!660216) b!987118))

(assert (= (and b!987118 res!660214) b!987121))

(assert (= (and b!987121 res!660217) b!987122))

(assert (= (and b!987122 res!660212) b!987124))

(assert (= (and b!987124 res!660215) b!987126))

(assert (= (and b!987125 condMapEmpty!36689) mapIsEmpty!36689))

(assert (= (and b!987125 (not condMapEmpty!36689)) mapNonEmpty!36689))

(get-info :version)

(assert (= (and mapNonEmpty!36689 ((_ is ValueCellFull!11072) mapValue!36689)) b!987119))

(assert (= (and b!987125 ((_ is ValueCellFull!11072) mapDefault!36689)) b!987120))

(assert (= start!84472 b!987125))

(declare-fun m!914417 () Bool)

(assert (=> mapNonEmpty!36689 m!914417))

(declare-fun m!914419 () Bool)

(assert (=> b!987121 m!914419))

(declare-fun m!914421 () Bool)

(assert (=> b!987118 m!914421))

(declare-fun m!914423 () Bool)

(assert (=> b!987124 m!914423))

(assert (=> b!987124 m!914423))

(declare-fun m!914425 () Bool)

(assert (=> b!987124 m!914425))

(declare-fun m!914427 () Bool)

(assert (=> start!84472 m!914427))

(declare-fun m!914429 () Bool)

(assert (=> start!84472 m!914429))

(declare-fun m!914431 () Bool)

(assert (=> start!84472 m!914431))

(check-sat (not b!987124) (not mapNonEmpty!36689) (not b!987121) (not b!987118) (not start!84472) tp_is_empty!23107)
(check-sat)
