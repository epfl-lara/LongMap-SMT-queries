; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84360 () Bool)

(assert start!84360)

(declare-fun b!986755 () Bool)

(declare-fun res!660158 () Bool)

(declare-fun e!556433 () Bool)

(assert (=> b!986755 (=> (not res!660158) (not e!556433))))

(declare-datatypes ((array!62287 0))(
  ( (array!62288 (arr!30001 (Array (_ BitVec 32) (_ BitVec 64))) (size!30480 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62287)

(declare-datatypes ((List!20752 0))(
  ( (Nil!20749) (Cons!20748 (h!21910 (_ BitVec 64)) (t!29651 List!20752)) )
))
(declare-fun arrayNoDuplicates!0 (array!62287 (_ BitVec 32) List!20752) Bool)

(assert (=> b!986755 (= res!660158 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20749))))

(declare-fun b!986756 () Bool)

(declare-fun res!660157 () Bool)

(assert (=> b!986756 (=> (not res!660157) (not e!556433))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62287 (_ BitVec 32)) Bool)

(assert (=> b!986756 (= res!660157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986757 () Bool)

(declare-fun res!660159 () Bool)

(assert (=> b!986757 (=> (not res!660159) (not e!556433))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986757 (= res!660159 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30480 _keys!1544))))))

(declare-fun b!986758 () Bool)

(declare-fun res!660156 () Bool)

(assert (=> b!986758 (=> (not res!660156) (not e!556433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986758 (= res!660156 (validKeyInArray!0 (select (arr!30001 _keys!1544) from!1932)))))

(declare-fun b!986759 () Bool)

(declare-fun e!556434 () Bool)

(declare-fun tp_is_empty!23163 () Bool)

(assert (=> b!986759 (= e!556434 tp_is_empty!23163)))

(declare-fun b!986760 () Bool)

(declare-fun e!556437 () Bool)

(declare-fun mapRes!36773 () Bool)

(assert (=> b!986760 (= e!556437 (and e!556434 mapRes!36773))))

(declare-fun condMapEmpty!36773 () Bool)

(declare-datatypes ((V!35867 0))(
  ( (V!35868 (val!11632 Int)) )
))
(declare-datatypes ((ValueCell!11100 0))(
  ( (ValueCellFull!11100 (v!14194 V!35867)) (EmptyCell!11100) )
))
(declare-datatypes ((array!62289 0))(
  ( (array!62290 (arr!30002 (Array (_ BitVec 32) ValueCell!11100)) (size!30481 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62289)

(declare-fun mapDefault!36773 () ValueCell!11100)

(assert (=> b!986760 (= condMapEmpty!36773 (= (arr!30002 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11100)) mapDefault!36773)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun b!986761 () Bool)

(declare-fun lt!437540 () Bool)

(assert (=> b!986761 (= e!556433 (and (or lt!437540 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!437540 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!437540)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(assert (=> b!986761 (= lt!437540 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!660161 () Bool)

(assert (=> start!84360 (=> (not res!660161) (not e!556433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84360 (= res!660161 (validMask!0 mask!1948))))

(assert (=> start!84360 e!556433))

(assert (=> start!84360 true))

(declare-fun array_inv!23185 (array!62289) Bool)

(assert (=> start!84360 (and (array_inv!23185 _values!1278) e!556437)))

(declare-fun array_inv!23186 (array!62287) Bool)

(assert (=> start!84360 (array_inv!23186 _keys!1544)))

(declare-fun mapIsEmpty!36773 () Bool)

(assert (=> mapIsEmpty!36773 mapRes!36773))

(declare-fun b!986762 () Bool)

(declare-fun e!556435 () Bool)

(assert (=> b!986762 (= e!556435 tp_is_empty!23163)))

(declare-fun mapNonEmpty!36773 () Bool)

(declare-fun tp!69628 () Bool)

(assert (=> mapNonEmpty!36773 (= mapRes!36773 (and tp!69628 e!556435))))

(declare-fun mapValue!36773 () ValueCell!11100)

(declare-fun mapRest!36773 () (Array (_ BitVec 32) ValueCell!11100))

(declare-fun mapKey!36773 () (_ BitVec 32))

(assert (=> mapNonEmpty!36773 (= (arr!30002 _values!1278) (store mapRest!36773 mapKey!36773 mapValue!36773))))

(declare-fun b!986763 () Bool)

(declare-fun res!660160 () Bool)

(assert (=> b!986763 (=> (not res!660160) (not e!556433))))

(assert (=> b!986763 (= res!660160 (and (= (size!30481 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30480 _keys!1544) (size!30481 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84360 res!660161) b!986763))

(assert (= (and b!986763 res!660160) b!986756))

(assert (= (and b!986756 res!660157) b!986755))

(assert (= (and b!986755 res!660158) b!986757))

(assert (= (and b!986757 res!660159) b!986758))

(assert (= (and b!986758 res!660156) b!986761))

(assert (= (and b!986760 condMapEmpty!36773) mapIsEmpty!36773))

(assert (= (and b!986760 (not condMapEmpty!36773)) mapNonEmpty!36773))

(get-info :version)

(assert (= (and mapNonEmpty!36773 ((_ is ValueCellFull!11100) mapValue!36773)) b!986762))

(assert (= (and b!986760 ((_ is ValueCellFull!11100) mapDefault!36773)) b!986759))

(assert (= start!84360 b!986760))

(declare-fun m!913475 () Bool)

(assert (=> b!986758 m!913475))

(assert (=> b!986758 m!913475))

(declare-fun m!913477 () Bool)

(assert (=> b!986758 m!913477))

(declare-fun m!913479 () Bool)

(assert (=> start!84360 m!913479))

(declare-fun m!913481 () Bool)

(assert (=> start!84360 m!913481))

(declare-fun m!913483 () Bool)

(assert (=> start!84360 m!913483))

(declare-fun m!913485 () Bool)

(assert (=> b!986756 m!913485))

(declare-fun m!913487 () Bool)

(assert (=> b!986755 m!913487))

(declare-fun m!913489 () Bool)

(assert (=> mapNonEmpty!36773 m!913489))

(check-sat tp_is_empty!23163 (not b!986756) (not b!986758) (not b!986755) (not mapNonEmpty!36773) (not start!84360))
(check-sat)
