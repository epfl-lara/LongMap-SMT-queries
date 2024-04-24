; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110700 () Bool)

(assert start!110700)

(declare-fun b!1308193 () Bool)

(declare-fun e!746538 () Bool)

(declare-fun e!746540 () Bool)

(declare-fun mapRes!54190 () Bool)

(assert (=> b!1308193 (= e!746538 (and e!746540 mapRes!54190))))

(declare-fun condMapEmpty!54190 () Bool)

(declare-datatypes ((V!51825 0))(
  ( (V!51826 (val!17595 Int)) )
))
(declare-datatypes ((ValueCell!16622 0))(
  ( (ValueCellFull!16622 (v!20217 V!51825)) (EmptyCell!16622) )
))
(declare-datatypes ((array!87151 0))(
  ( (array!87152 (arr!42051 (Array (_ BitVec 32) ValueCell!16622)) (size!42602 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87151)

(declare-fun mapDefault!54190 () ValueCell!16622)

(assert (=> b!1308193 (= condMapEmpty!54190 (= (arr!42051 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16622)) mapDefault!54190)))))

(declare-fun b!1308194 () Bool)

(declare-fun e!746536 () Bool)

(assert (=> b!1308194 (= e!746536 false)))

(declare-fun lt!585470 () Bool)

(declare-datatypes ((array!87153 0))(
  ( (array!87154 (arr!42052 (Array (_ BitVec 32) (_ BitVec 64))) (size!42603 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87153)

(declare-datatypes ((List!29855 0))(
  ( (Nil!29852) (Cons!29851 (h!31069 (_ BitVec 64)) (t!43453 List!29855)) )
))
(declare-fun arrayNoDuplicates!0 (array!87153 (_ BitVec 32) List!29855) Bool)

(assert (=> b!1308194 (= lt!585470 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29852))))

(declare-fun res!868058 () Bool)

(assert (=> start!110700 (=> (not res!868058) (not e!746536))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110700 (= res!868058 (validMask!0 mask!2040))))

(assert (=> start!110700 e!746536))

(assert (=> start!110700 true))

(declare-fun array_inv!32045 (array!87151) Bool)

(assert (=> start!110700 (and (array_inv!32045 _values!1354) e!746538)))

(declare-fun array_inv!32046 (array!87153) Bool)

(assert (=> start!110700 (array_inv!32046 _keys!1628)))

(declare-fun mapNonEmpty!54190 () Bool)

(declare-fun tp!103270 () Bool)

(declare-fun e!746537 () Bool)

(assert (=> mapNonEmpty!54190 (= mapRes!54190 (and tp!103270 e!746537))))

(declare-fun mapRest!54190 () (Array (_ BitVec 32) ValueCell!16622))

(declare-fun mapKey!54190 () (_ BitVec 32))

(declare-fun mapValue!54190 () ValueCell!16622)

(assert (=> mapNonEmpty!54190 (= (arr!42051 _values!1354) (store mapRest!54190 mapKey!54190 mapValue!54190))))

(declare-fun b!1308195 () Bool)

(declare-fun tp_is_empty!35041 () Bool)

(assert (=> b!1308195 (= e!746540 tp_is_empty!35041)))

(declare-fun mapIsEmpty!54190 () Bool)

(assert (=> mapIsEmpty!54190 mapRes!54190))

(declare-fun b!1308196 () Bool)

(declare-fun res!868056 () Bool)

(assert (=> b!1308196 (=> (not res!868056) (not e!746536))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308196 (= res!868056 (and (= (size!42602 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42603 _keys!1628) (size!42602 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308197 () Bool)

(assert (=> b!1308197 (= e!746537 tp_is_empty!35041)))

(declare-fun b!1308198 () Bool)

(declare-fun res!868057 () Bool)

(assert (=> b!1308198 (=> (not res!868057) (not e!746536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87153 (_ BitVec 32)) Bool)

(assert (=> b!1308198 (= res!868057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110700 res!868058) b!1308196))

(assert (= (and b!1308196 res!868056) b!1308198))

(assert (= (and b!1308198 res!868057) b!1308194))

(assert (= (and b!1308193 condMapEmpty!54190) mapIsEmpty!54190))

(assert (= (and b!1308193 (not condMapEmpty!54190)) mapNonEmpty!54190))

(get-info :version)

(assert (= (and mapNonEmpty!54190 ((_ is ValueCellFull!16622) mapValue!54190)) b!1308197))

(assert (= (and b!1308193 ((_ is ValueCellFull!16622) mapDefault!54190)) b!1308195))

(assert (= start!110700 b!1308193))

(declare-fun m!1199375 () Bool)

(assert (=> b!1308194 m!1199375))

(declare-fun m!1199377 () Bool)

(assert (=> start!110700 m!1199377))

(declare-fun m!1199379 () Bool)

(assert (=> start!110700 m!1199379))

(declare-fun m!1199381 () Bool)

(assert (=> start!110700 m!1199381))

(declare-fun m!1199383 () Bool)

(assert (=> mapNonEmpty!54190 m!1199383))

(declare-fun m!1199385 () Bool)

(assert (=> b!1308198 m!1199385))

(check-sat (not b!1308194) (not mapNonEmpty!54190) (not b!1308198) tp_is_empty!35041 (not start!110700))
(check-sat)
