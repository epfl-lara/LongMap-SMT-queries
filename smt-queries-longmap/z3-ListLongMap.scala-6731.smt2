; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84526 () Bool)

(assert start!84526)

(declare-fun res!660487 () Bool)

(declare-fun e!557004 () Bool)

(assert (=> start!84526 (=> (not res!660487) (not e!557004))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84526 (= res!660487 (validMask!0 mask!1948))))

(assert (=> start!84526 e!557004))

(assert (=> start!84526 true))

(declare-datatypes ((V!35865 0))(
  ( (V!35866 (val!11631 Int)) )
))
(declare-datatypes ((ValueCell!11099 0))(
  ( (ValueCellFull!11099 (v!14190 V!35865)) (EmptyCell!11099) )
))
(declare-datatypes ((array!62324 0))(
  ( (array!62325 (arr!30015 (Array (_ BitVec 32) ValueCell!11099)) (size!30495 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62324)

(declare-fun e!557001 () Bool)

(declare-fun array_inv!23211 (array!62324) Bool)

(assert (=> start!84526 (and (array_inv!23211 _values!1278) e!557001)))

(declare-datatypes ((array!62326 0))(
  ( (array!62327 (arr!30016 (Array (_ BitVec 32) (_ BitVec 64))) (size!30496 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62326)

(declare-fun array_inv!23212 (array!62326) Bool)

(assert (=> start!84526 (array_inv!23212 _keys!1544)))

(declare-fun b!987631 () Bool)

(declare-fun e!557002 () Bool)

(declare-fun mapRes!36770 () Bool)

(assert (=> b!987631 (= e!557001 (and e!557002 mapRes!36770))))

(declare-fun condMapEmpty!36770 () Bool)

(declare-fun mapDefault!36770 () ValueCell!11099)

(assert (=> b!987631 (= condMapEmpty!36770 (= (arr!30015 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11099)) mapDefault!36770)))))

(declare-fun b!987632 () Bool)

(declare-fun res!660483 () Bool)

(assert (=> b!987632 (=> (not res!660483) (not e!557004))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987632 (= res!660483 (validKeyInArray!0 (select (arr!30016 _keys!1544) from!1932)))))

(declare-fun b!987633 () Bool)

(declare-fun res!660486 () Bool)

(assert (=> b!987633 (=> (not res!660486) (not e!557004))))

(assert (=> b!987633 (= res!660486 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30496 _keys!1544))))))

(declare-fun b!987634 () Bool)

(declare-fun tp_is_empty!23161 () Bool)

(assert (=> b!987634 (= e!557002 tp_is_empty!23161)))

(declare-fun b!987635 () Bool)

(declare-fun res!660485 () Bool)

(assert (=> b!987635 (=> (not res!660485) (not e!557004))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987635 (= res!660485 (and (= (size!30495 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30496 _keys!1544) (size!30495 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36770 () Bool)

(assert (=> mapIsEmpty!36770 mapRes!36770))

(declare-fun b!987636 () Bool)

(declare-fun res!660482 () Bool)

(assert (=> b!987636 (=> (not res!660482) (not e!557004))))

(declare-datatypes ((List!20747 0))(
  ( (Nil!20744) (Cons!20743 (h!21911 (_ BitVec 64)) (t!29638 List!20747)) )
))
(declare-fun arrayNoDuplicates!0 (array!62326 (_ BitVec 32) List!20747) Bool)

(assert (=> b!987636 (= res!660482 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20744))))

(declare-fun b!987637 () Bool)

(declare-fun e!557003 () Bool)

(assert (=> b!987637 (= e!557003 tp_is_empty!23161)))

(declare-fun b!987638 () Bool)

(declare-fun lt!437898 () Bool)

(assert (=> b!987638 (= e!557004 (and (or lt!437898 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!437898 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!437898)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(assert (=> b!987638 (= lt!437898 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!987639 () Bool)

(declare-fun res!660484 () Bool)

(assert (=> b!987639 (=> (not res!660484) (not e!557004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62326 (_ BitVec 32)) Bool)

(assert (=> b!987639 (= res!660484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36770 () Bool)

(declare-fun tp!69626 () Bool)

(assert (=> mapNonEmpty!36770 (= mapRes!36770 (and tp!69626 e!557003))))

(declare-fun mapValue!36770 () ValueCell!11099)

(declare-fun mapKey!36770 () (_ BitVec 32))

(declare-fun mapRest!36770 () (Array (_ BitVec 32) ValueCell!11099))

(assert (=> mapNonEmpty!36770 (= (arr!30015 _values!1278) (store mapRest!36770 mapKey!36770 mapValue!36770))))

(assert (= (and start!84526 res!660487) b!987635))

(assert (= (and b!987635 res!660485) b!987639))

(assert (= (and b!987639 res!660484) b!987636))

(assert (= (and b!987636 res!660482) b!987633))

(assert (= (and b!987633 res!660486) b!987632))

(assert (= (and b!987632 res!660483) b!987638))

(assert (= (and b!987631 condMapEmpty!36770) mapIsEmpty!36770))

(assert (= (and b!987631 (not condMapEmpty!36770)) mapNonEmpty!36770))

(get-info :version)

(assert (= (and mapNonEmpty!36770 ((_ is ValueCellFull!11099) mapValue!36770)) b!987637))

(assert (= (and b!987631 ((_ is ValueCellFull!11099) mapDefault!36770)) b!987634))

(assert (= start!84526 b!987631))

(declare-fun m!914753 () Bool)

(assert (=> mapNonEmpty!36770 m!914753))

(declare-fun m!914755 () Bool)

(assert (=> b!987639 m!914755))

(declare-fun m!914757 () Bool)

(assert (=> start!84526 m!914757))

(declare-fun m!914759 () Bool)

(assert (=> start!84526 m!914759))

(declare-fun m!914761 () Bool)

(assert (=> start!84526 m!914761))

(declare-fun m!914763 () Bool)

(assert (=> b!987632 m!914763))

(assert (=> b!987632 m!914763))

(declare-fun m!914765 () Bool)

(assert (=> b!987632 m!914765))

(declare-fun m!914767 () Bool)

(assert (=> b!987636 m!914767))

(check-sat (not start!84526) (not mapNonEmpty!36770) (not b!987639) (not b!987636) (not b!987632) tp_is_empty!23161)
(check-sat)
