; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110464 () Bool)

(assert start!110464)

(declare-fun b!1306716 () Bool)

(declare-fun res!867457 () Bool)

(declare-fun e!745571 () Bool)

(assert (=> b!1306716 (=> (not res!867457) (not e!745571))))

(declare-datatypes ((array!86979 0))(
  ( (array!86980 (arr!41970 (Array (_ BitVec 32) (_ BitVec 64))) (size!42522 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86979)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51809 0))(
  ( (V!51810 (val!17589 Int)) )
))
(declare-datatypes ((ValueCell!16616 0))(
  ( (ValueCellFull!16616 (v!20215 V!51809)) (EmptyCell!16616) )
))
(declare-datatypes ((array!86981 0))(
  ( (array!86982 (arr!41971 (Array (_ BitVec 32) ValueCell!16616)) (size!42523 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86981)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306716 (= res!867457 (and (= (size!42523 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42522 _keys!1628) (size!42523 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306717 () Bool)

(declare-fun res!867455 () Bool)

(assert (=> b!1306717 (=> (not res!867455) (not e!745571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86979 (_ BitVec 32)) Bool)

(assert (=> b!1306717 (= res!867455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306718 () Bool)

(declare-fun e!745572 () Bool)

(declare-fun tp_is_empty!35029 () Bool)

(assert (=> b!1306718 (= e!745572 tp_is_empty!35029)))

(declare-fun mapNonEmpty!54172 () Bool)

(declare-fun mapRes!54172 () Bool)

(declare-fun tp!103253 () Bool)

(declare-fun e!745574 () Bool)

(assert (=> mapNonEmpty!54172 (= mapRes!54172 (and tp!103253 e!745574))))

(declare-fun mapRest!54172 () (Array (_ BitVec 32) ValueCell!16616))

(declare-fun mapValue!54172 () ValueCell!16616)

(declare-fun mapKey!54172 () (_ BitVec 32))

(assert (=> mapNonEmpty!54172 (= (arr!41971 _values!1354) (store mapRest!54172 mapKey!54172 mapValue!54172))))

(declare-fun b!1306719 () Bool)

(assert (=> b!1306719 (= e!745574 tp_is_empty!35029)))

(declare-fun b!1306720 () Bool)

(declare-fun e!745573 () Bool)

(assert (=> b!1306720 (= e!745573 (and e!745572 mapRes!54172))))

(declare-fun condMapEmpty!54172 () Bool)

(declare-fun mapDefault!54172 () ValueCell!16616)

(assert (=> b!1306720 (= condMapEmpty!54172 (= (arr!41971 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16616)) mapDefault!54172)))))

(declare-fun res!867456 () Bool)

(assert (=> start!110464 (=> (not res!867456) (not e!745571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110464 (= res!867456 (validMask!0 mask!2040))))

(assert (=> start!110464 e!745571))

(assert (=> start!110464 true))

(declare-fun array_inv!31919 (array!86981) Bool)

(assert (=> start!110464 (and (array_inv!31919 _values!1354) e!745573)))

(declare-fun array_inv!31920 (array!86979) Bool)

(assert (=> start!110464 (array_inv!31920 _keys!1628)))

(declare-fun mapIsEmpty!54172 () Bool)

(assert (=> mapIsEmpty!54172 mapRes!54172))

(declare-fun b!1306721 () Bool)

(assert (=> b!1306721 (= e!745571 false)))

(declare-fun lt!584790 () Bool)

(declare-datatypes ((List!29849 0))(
  ( (Nil!29846) (Cons!29845 (h!31054 (_ BitVec 64)) (t!43447 List!29849)) )
))
(declare-fun arrayNoDuplicates!0 (array!86979 (_ BitVec 32) List!29849) Bool)

(assert (=> b!1306721 (= lt!584790 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29846))))

(assert (= (and start!110464 res!867456) b!1306716))

(assert (= (and b!1306716 res!867457) b!1306717))

(assert (= (and b!1306717 res!867455) b!1306721))

(assert (= (and b!1306720 condMapEmpty!54172) mapIsEmpty!54172))

(assert (= (and b!1306720 (not condMapEmpty!54172)) mapNonEmpty!54172))

(get-info :version)

(assert (= (and mapNonEmpty!54172 ((_ is ValueCellFull!16616) mapValue!54172)) b!1306719))

(assert (= (and b!1306720 ((_ is ValueCellFull!16616) mapDefault!54172)) b!1306718))

(assert (= start!110464 b!1306720))

(declare-fun m!1197189 () Bool)

(assert (=> b!1306717 m!1197189))

(declare-fun m!1197191 () Bool)

(assert (=> mapNonEmpty!54172 m!1197191))

(declare-fun m!1197193 () Bool)

(assert (=> start!110464 m!1197193))

(declare-fun m!1197195 () Bool)

(assert (=> start!110464 m!1197195))

(declare-fun m!1197197 () Bool)

(assert (=> start!110464 m!1197197))

(declare-fun m!1197199 () Bool)

(assert (=> b!1306721 m!1197199))

(check-sat (not start!110464) (not b!1306717) (not mapNonEmpty!54172) (not b!1306721) tp_is_empty!35029)
(check-sat)
