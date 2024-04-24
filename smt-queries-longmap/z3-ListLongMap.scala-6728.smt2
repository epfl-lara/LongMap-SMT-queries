; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84508 () Bool)

(assert start!84508)

(declare-fun b!987463 () Bool)

(declare-fun res!660396 () Bool)

(declare-fun e!556866 () Bool)

(assert (=> b!987463 (=> (not res!660396) (not e!556866))))

(declare-datatypes ((array!62290 0))(
  ( (array!62291 (arr!29998 (Array (_ BitVec 32) (_ BitVec 64))) (size!30478 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62290)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62290 (_ BitVec 32)) Bool)

(assert (=> b!987463 (= res!660396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987464 () Bool)

(declare-fun e!556869 () Bool)

(declare-fun tp_is_empty!23143 () Bool)

(assert (=> b!987464 (= e!556869 tp_is_empty!23143)))

(declare-fun mapIsEmpty!36743 () Bool)

(declare-fun mapRes!36743 () Bool)

(assert (=> mapIsEmpty!36743 mapRes!36743))

(declare-fun mapNonEmpty!36743 () Bool)

(declare-fun tp!69599 () Bool)

(assert (=> mapNonEmpty!36743 (= mapRes!36743 (and tp!69599 e!556869))))

(declare-datatypes ((V!35841 0))(
  ( (V!35842 (val!11622 Int)) )
))
(declare-datatypes ((ValueCell!11090 0))(
  ( (ValueCellFull!11090 (v!14181 V!35841)) (EmptyCell!11090) )
))
(declare-fun mapRest!36743 () (Array (_ BitVec 32) ValueCell!11090))

(declare-datatypes ((array!62292 0))(
  ( (array!62293 (arr!29999 (Array (_ BitVec 32) ValueCell!11090)) (size!30479 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62292)

(declare-fun mapValue!36743 () ValueCell!11090)

(declare-fun mapKey!36743 () (_ BitVec 32))

(assert (=> mapNonEmpty!36743 (= (arr!29999 _values!1278) (store mapRest!36743 mapKey!36743 mapValue!36743))))

(declare-fun b!987465 () Bool)

(declare-fun e!556868 () Bool)

(assert (=> b!987465 (= e!556868 tp_is_empty!23143)))

(declare-fun b!987467 () Bool)

(assert (=> b!987467 (= e!556866 false)))

(declare-fun lt!437871 () Bool)

(declare-datatypes ((List!20743 0))(
  ( (Nil!20740) (Cons!20739 (h!21907 (_ BitVec 64)) (t!29634 List!20743)) )
))
(declare-fun arrayNoDuplicates!0 (array!62290 (_ BitVec 32) List!20743) Bool)

(assert (=> b!987467 (= lt!437871 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20740))))

(declare-fun b!987468 () Bool)

(declare-fun res!660395 () Bool)

(assert (=> b!987468 (=> (not res!660395) (not e!556866))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987468 (= res!660395 (and (= (size!30479 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30478 _keys!1544) (size!30479 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!660397 () Bool)

(assert (=> start!84508 (=> (not res!660397) (not e!556866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84508 (= res!660397 (validMask!0 mask!1948))))

(assert (=> start!84508 e!556866))

(assert (=> start!84508 true))

(declare-fun e!556867 () Bool)

(declare-fun array_inv!23201 (array!62292) Bool)

(assert (=> start!84508 (and (array_inv!23201 _values!1278) e!556867)))

(declare-fun array_inv!23202 (array!62290) Bool)

(assert (=> start!84508 (array_inv!23202 _keys!1544)))

(declare-fun b!987466 () Bool)

(assert (=> b!987466 (= e!556867 (and e!556868 mapRes!36743))))

(declare-fun condMapEmpty!36743 () Bool)

(declare-fun mapDefault!36743 () ValueCell!11090)

(assert (=> b!987466 (= condMapEmpty!36743 (= (arr!29999 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11090)) mapDefault!36743)))))

(assert (= (and start!84508 res!660397) b!987468))

(assert (= (and b!987468 res!660395) b!987463))

(assert (= (and b!987463 res!660396) b!987467))

(assert (= (and b!987466 condMapEmpty!36743) mapIsEmpty!36743))

(assert (= (and b!987466 (not condMapEmpty!36743)) mapNonEmpty!36743))

(get-info :version)

(assert (= (and mapNonEmpty!36743 ((_ is ValueCellFull!11090) mapValue!36743)) b!987464))

(assert (= (and b!987466 ((_ is ValueCellFull!11090) mapDefault!36743)) b!987465))

(assert (= start!84508 b!987466))

(declare-fun m!914645 () Bool)

(assert (=> b!987463 m!914645))

(declare-fun m!914647 () Bool)

(assert (=> mapNonEmpty!36743 m!914647))

(declare-fun m!914649 () Bool)

(assert (=> b!987467 m!914649))

(declare-fun m!914651 () Bool)

(assert (=> start!84508 m!914651))

(declare-fun m!914653 () Bool)

(assert (=> start!84508 m!914653))

(declare-fun m!914655 () Bool)

(assert (=> start!84508 m!914655))

(check-sat (not mapNonEmpty!36743) (not start!84508) (not b!987463) (not b!987467) tp_is_empty!23143)
(check-sat)
