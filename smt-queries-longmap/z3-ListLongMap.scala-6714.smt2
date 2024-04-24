; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84424 () Bool)

(assert start!84424)

(declare-fun b!986680 () Bool)

(declare-fun e!556235 () Bool)

(declare-fun tp_is_empty!23059 () Bool)

(assert (=> b!986680 (= e!556235 tp_is_empty!23059)))

(declare-fun res!659991 () Bool)

(declare-fun e!556239 () Bool)

(assert (=> start!84424 (=> (not res!659991) (not e!556239))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84424 (= res!659991 (validMask!0 mask!1948))))

(assert (=> start!84424 e!556239))

(assert (=> start!84424 true))

(declare-datatypes ((V!35729 0))(
  ( (V!35730 (val!11580 Int)) )
))
(declare-datatypes ((ValueCell!11048 0))(
  ( (ValueCellFull!11048 (v!14139 V!35729)) (EmptyCell!11048) )
))
(declare-datatypes ((array!62132 0))(
  ( (array!62133 (arr!29919 (Array (_ BitVec 32) ValueCell!11048)) (size!30399 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62132)

(declare-fun e!556238 () Bool)

(declare-fun array_inv!23141 (array!62132) Bool)

(assert (=> start!84424 (and (array_inv!23141 _values!1278) e!556238)))

(declare-datatypes ((array!62134 0))(
  ( (array!62135 (arr!29920 (Array (_ BitVec 32) (_ BitVec 64))) (size!30400 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62134)

(declare-fun array_inv!23142 (array!62134) Bool)

(assert (=> start!84424 (array_inv!23142 _keys!1544)))

(declare-fun b!986681 () Bool)

(declare-fun res!659990 () Bool)

(assert (=> b!986681 (=> (not res!659990) (not e!556239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62134 (_ BitVec 32)) Bool)

(assert (=> b!986681 (= res!659990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36617 () Bool)

(declare-fun mapRes!36617 () Bool)

(assert (=> mapIsEmpty!36617 mapRes!36617))

(declare-fun mapNonEmpty!36617 () Bool)

(declare-fun tp!69473 () Bool)

(declare-fun e!556237 () Bool)

(assert (=> mapNonEmpty!36617 (= mapRes!36617 (and tp!69473 e!556237))))

(declare-fun mapValue!36617 () ValueCell!11048)

(declare-fun mapKey!36617 () (_ BitVec 32))

(declare-fun mapRest!36617 () (Array (_ BitVec 32) ValueCell!11048))

(assert (=> mapNonEmpty!36617 (= (arr!29919 _values!1278) (store mapRest!36617 mapKey!36617 mapValue!36617))))

(declare-fun b!986682 () Bool)

(assert (=> b!986682 (= e!556237 tp_is_empty!23059)))

(declare-fun b!986683 () Bool)

(assert (=> b!986683 (= e!556239 false)))

(declare-fun lt!437745 () Bool)

(declare-datatypes ((List!20718 0))(
  ( (Nil!20715) (Cons!20714 (h!21882 (_ BitVec 64)) (t!29609 List!20718)) )
))
(declare-fun arrayNoDuplicates!0 (array!62134 (_ BitVec 32) List!20718) Bool)

(assert (=> b!986683 (= lt!437745 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20715))))

(declare-fun b!986684 () Bool)

(declare-fun res!659992 () Bool)

(assert (=> b!986684 (=> (not res!659992) (not e!556239))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986684 (= res!659992 (and (= (size!30399 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30400 _keys!1544) (size!30399 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986685 () Bool)

(assert (=> b!986685 (= e!556238 (and e!556235 mapRes!36617))))

(declare-fun condMapEmpty!36617 () Bool)

(declare-fun mapDefault!36617 () ValueCell!11048)

(assert (=> b!986685 (= condMapEmpty!36617 (= (arr!29919 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11048)) mapDefault!36617)))))

(assert (= (and start!84424 res!659991) b!986684))

(assert (= (and b!986684 res!659992) b!986681))

(assert (= (and b!986681 res!659990) b!986683))

(assert (= (and b!986685 condMapEmpty!36617) mapIsEmpty!36617))

(assert (= (and b!986685 (not condMapEmpty!36617)) mapNonEmpty!36617))

(get-info :version)

(assert (= (and mapNonEmpty!36617 ((_ is ValueCellFull!11048) mapValue!36617)) b!986682))

(assert (= (and b!986685 ((_ is ValueCellFull!11048) mapDefault!36617)) b!986680))

(assert (= start!84424 b!986685))

(declare-fun m!914129 () Bool)

(assert (=> start!84424 m!914129))

(declare-fun m!914131 () Bool)

(assert (=> start!84424 m!914131))

(declare-fun m!914133 () Bool)

(assert (=> start!84424 m!914133))

(declare-fun m!914135 () Bool)

(assert (=> b!986681 m!914135))

(declare-fun m!914137 () Bool)

(assert (=> mapNonEmpty!36617 m!914137))

(declare-fun m!914139 () Bool)

(assert (=> b!986683 m!914139))

(check-sat (not b!986681) (not mapNonEmpty!36617) (not b!986683) (not start!84424) tp_is_empty!23059)
(check-sat)
