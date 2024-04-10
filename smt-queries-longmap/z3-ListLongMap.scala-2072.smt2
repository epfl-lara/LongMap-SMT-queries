; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35602 () Bool)

(assert start!35602)

(declare-fun b!357120 () Bool)

(declare-fun e!218708 () Bool)

(declare-fun tp_is_empty!8055 () Bool)

(assert (=> b!357120 (= e!218708 tp_is_empty!8055)))

(declare-fun b!357121 () Bool)

(declare-fun res!198280 () Bool)

(declare-fun e!218707 () Bool)

(assert (=> b!357121 (=> (not res!198280) (not e!218707))))

(declare-datatypes ((array!19677 0))(
  ( (array!19678 (arr!9332 (Array (_ BitVec 32) (_ BitVec 64))) (size!9684 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19677)

(declare-datatypes ((List!5385 0))(
  ( (Nil!5382) (Cons!5381 (h!6237 (_ BitVec 64)) (t!10535 List!5385)) )
))
(declare-fun arrayNoDuplicates!0 (array!19677 (_ BitVec 32) List!5385) Bool)

(assert (=> b!357121 (= res!198280 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5382))))

(declare-fun b!357122 () Bool)

(declare-fun res!198282 () Bool)

(assert (=> b!357122 (=> (not res!198282) (not e!218707))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357122 (= res!198282 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357123 () Bool)

(declare-fun res!198278 () Bool)

(assert (=> b!357123 (=> (not res!198278) (not e!218707))))

(assert (=> b!357123 (= res!198278 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9684 _keys!1456))))))

(declare-fun b!357124 () Bool)

(assert (=> b!357124 (= e!218707 (not true))))

(assert (=> b!357124 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11717 0))(
  ( (V!11718 (val!4072 Int)) )
))
(declare-fun minValue!1150 () V!11717)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11002 0))(
  ( (Unit!11003) )
))
(declare-fun lt!165998 () Unit!11002)

(declare-datatypes ((ValueCell!3684 0))(
  ( (ValueCellFull!3684 (v!6266 V!11717)) (EmptyCell!3684) )
))
(declare-datatypes ((array!19679 0))(
  ( (array!19680 (arr!9333 (Array (_ BitVec 32) ValueCell!3684)) (size!9685 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19679)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11717)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!20 (array!19677 array!19679 (_ BitVec 32) (_ BitVec 32) V!11717 V!11717 (_ BitVec 64) (_ BitVec 32)) Unit!11002)

(assert (=> b!357124 (= lt!165998 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!20 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357125 () Bool)

(declare-fun res!198283 () Bool)

(assert (=> b!357125 (=> (not res!198283) (not e!218707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19677 (_ BitVec 32)) Bool)

(assert (=> b!357125 (= res!198283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357126 () Bool)

(declare-fun res!198276 () Bool)

(assert (=> b!357126 (=> (not res!198276) (not e!218707))))

(assert (=> b!357126 (= res!198276 (and (= (size!9685 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9684 _keys!1456) (size!9685 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357127 () Bool)

(declare-fun e!218711 () Bool)

(assert (=> b!357127 (= e!218711 tp_is_empty!8055)))

(declare-fun b!357128 () Bool)

(declare-fun res!198281 () Bool)

(assert (=> b!357128 (=> (not res!198281) (not e!218707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357128 (= res!198281 (validKeyInArray!0 k0!1077))))

(declare-fun b!357129 () Bool)

(declare-fun e!218710 () Bool)

(declare-fun mapRes!13590 () Bool)

(assert (=> b!357129 (= e!218710 (and e!218708 mapRes!13590))))

(declare-fun condMapEmpty!13590 () Bool)

(declare-fun mapDefault!13590 () ValueCell!3684)

(assert (=> b!357129 (= condMapEmpty!13590 (= (arr!9333 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3684)) mapDefault!13590)))))

(declare-fun b!357130 () Bool)

(declare-fun res!198277 () Bool)

(assert (=> b!357130 (=> (not res!198277) (not e!218707))))

(assert (=> b!357130 (= res!198277 (not (= (select (arr!9332 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13590 () Bool)

(assert (=> mapIsEmpty!13590 mapRes!13590))

(declare-fun res!198279 () Bool)

(assert (=> start!35602 (=> (not res!198279) (not e!218707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35602 (= res!198279 (validMask!0 mask!1842))))

(assert (=> start!35602 e!218707))

(assert (=> start!35602 tp_is_empty!8055))

(assert (=> start!35602 true))

(declare-fun array_inv!6860 (array!19677) Bool)

(assert (=> start!35602 (array_inv!6860 _keys!1456)))

(declare-fun array_inv!6861 (array!19679) Bool)

(assert (=> start!35602 (and (array_inv!6861 _values!1208) e!218710)))

(declare-fun mapNonEmpty!13590 () Bool)

(declare-fun tp!27567 () Bool)

(assert (=> mapNonEmpty!13590 (= mapRes!13590 (and tp!27567 e!218711))))

(declare-fun mapValue!13590 () ValueCell!3684)

(declare-fun mapRest!13590 () (Array (_ BitVec 32) ValueCell!3684))

(declare-fun mapKey!13590 () (_ BitVec 32))

(assert (=> mapNonEmpty!13590 (= (arr!9333 _values!1208) (store mapRest!13590 mapKey!13590 mapValue!13590))))

(assert (= (and start!35602 res!198279) b!357126))

(assert (= (and b!357126 res!198276) b!357125))

(assert (= (and b!357125 res!198283) b!357121))

(assert (= (and b!357121 res!198280) b!357128))

(assert (= (and b!357128 res!198281) b!357123))

(assert (= (and b!357123 res!198278) b!357122))

(assert (= (and b!357122 res!198282) b!357130))

(assert (= (and b!357130 res!198277) b!357124))

(assert (= (and b!357129 condMapEmpty!13590) mapIsEmpty!13590))

(assert (= (and b!357129 (not condMapEmpty!13590)) mapNonEmpty!13590))

(get-info :version)

(assert (= (and mapNonEmpty!13590 ((_ is ValueCellFull!3684) mapValue!13590)) b!357127))

(assert (= (and b!357129 ((_ is ValueCellFull!3684) mapDefault!13590)) b!357120))

(assert (= start!35602 b!357129))

(declare-fun m!355289 () Bool)

(assert (=> mapNonEmpty!13590 m!355289))

(declare-fun m!355291 () Bool)

(assert (=> start!35602 m!355291))

(declare-fun m!355293 () Bool)

(assert (=> start!35602 m!355293))

(declare-fun m!355295 () Bool)

(assert (=> start!35602 m!355295))

(declare-fun m!355297 () Bool)

(assert (=> b!357121 m!355297))

(declare-fun m!355299 () Bool)

(assert (=> b!357124 m!355299))

(declare-fun m!355301 () Bool)

(assert (=> b!357124 m!355301))

(declare-fun m!355303 () Bool)

(assert (=> b!357130 m!355303))

(declare-fun m!355305 () Bool)

(assert (=> b!357128 m!355305))

(declare-fun m!355307 () Bool)

(assert (=> b!357122 m!355307))

(declare-fun m!355309 () Bool)

(assert (=> b!357125 m!355309))

(check-sat (not b!357128) (not b!357122) tp_is_empty!8055 (not start!35602) (not b!357124) (not b!357125) (not b!357121) (not mapNonEmpty!13590))
(check-sat)
