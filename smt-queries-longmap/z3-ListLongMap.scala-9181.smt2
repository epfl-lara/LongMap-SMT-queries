; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110436 () Bool)

(assert start!110436)

(declare-fun b!1306534 () Bool)

(declare-fun e!745397 () Bool)

(assert (=> b!1306534 (= e!745397 false)))

(declare-fun lt!584934 () Bool)

(declare-datatypes ((array!87018 0))(
  ( (array!87019 (arr!41989 (Array (_ BitVec 32) (_ BitVec 64))) (size!42539 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87018)

(declare-datatypes ((List!29791 0))(
  ( (Nil!29788) (Cons!29787 (h!30996 (_ BitVec 64)) (t!43397 List!29791)) )
))
(declare-fun arrayNoDuplicates!0 (array!87018 (_ BitVec 32) List!29791) Bool)

(assert (=> b!1306534 (= lt!584934 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29788))))

(declare-fun mapIsEmpty!54130 () Bool)

(declare-fun mapRes!54130 () Bool)

(assert (=> mapIsEmpty!54130 mapRes!54130))

(declare-fun b!1306535 () Bool)

(declare-fun e!745395 () Bool)

(declare-fun tp_is_empty!35001 () Bool)

(assert (=> b!1306535 (= e!745395 tp_is_empty!35001)))

(declare-fun b!1306536 () Bool)

(declare-fun e!745396 () Bool)

(declare-fun e!745393 () Bool)

(assert (=> b!1306536 (= e!745396 (and e!745393 mapRes!54130))))

(declare-fun condMapEmpty!54130 () Bool)

(declare-datatypes ((V!51771 0))(
  ( (V!51772 (val!17575 Int)) )
))
(declare-datatypes ((ValueCell!16602 0))(
  ( (ValueCellFull!16602 (v!20202 V!51771)) (EmptyCell!16602) )
))
(declare-datatypes ((array!87020 0))(
  ( (array!87021 (arr!41990 (Array (_ BitVec 32) ValueCell!16602)) (size!42540 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87020)

(declare-fun mapDefault!54130 () ValueCell!16602)

(assert (=> b!1306536 (= condMapEmpty!54130 (= (arr!41990 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16602)) mapDefault!54130)))))

(declare-fun b!1306537 () Bool)

(declare-fun res!867360 () Bool)

(assert (=> b!1306537 (=> (not res!867360) (not e!745397))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87018 (_ BitVec 32)) Bool)

(assert (=> b!1306537 (= res!867360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306538 () Bool)

(assert (=> b!1306538 (= e!745393 tp_is_empty!35001)))

(declare-fun res!867359 () Bool)

(assert (=> start!110436 (=> (not res!867359) (not e!745397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110436 (= res!867359 (validMask!0 mask!2040))))

(assert (=> start!110436 e!745397))

(assert (=> start!110436 true))

(declare-fun array_inv!31745 (array!87020) Bool)

(assert (=> start!110436 (and (array_inv!31745 _values!1354) e!745396)))

(declare-fun array_inv!31746 (array!87018) Bool)

(assert (=> start!110436 (array_inv!31746 _keys!1628)))

(declare-fun b!1306539 () Bool)

(declare-fun res!867358 () Bool)

(assert (=> b!1306539 (=> (not res!867358) (not e!745397))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306539 (= res!867358 (and (= (size!42540 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42539 _keys!1628) (size!42540 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54130 () Bool)

(declare-fun tp!103210 () Bool)

(assert (=> mapNonEmpty!54130 (= mapRes!54130 (and tp!103210 e!745395))))

(declare-fun mapRest!54130 () (Array (_ BitVec 32) ValueCell!16602))

(declare-fun mapValue!54130 () ValueCell!16602)

(declare-fun mapKey!54130 () (_ BitVec 32))

(assert (=> mapNonEmpty!54130 (= (arr!41990 _values!1354) (store mapRest!54130 mapKey!54130 mapValue!54130))))

(assert (= (and start!110436 res!867359) b!1306539))

(assert (= (and b!1306539 res!867358) b!1306537))

(assert (= (and b!1306537 res!867360) b!1306534))

(assert (= (and b!1306536 condMapEmpty!54130) mapIsEmpty!54130))

(assert (= (and b!1306536 (not condMapEmpty!54130)) mapNonEmpty!54130))

(get-info :version)

(assert (= (and mapNonEmpty!54130 ((_ is ValueCellFull!16602) mapValue!54130)) b!1306535))

(assert (= (and b!1306536 ((_ is ValueCellFull!16602) mapDefault!54130)) b!1306538))

(assert (= start!110436 b!1306536))

(declare-fun m!1197537 () Bool)

(assert (=> b!1306534 m!1197537))

(declare-fun m!1197539 () Bool)

(assert (=> b!1306537 m!1197539))

(declare-fun m!1197541 () Bool)

(assert (=> start!110436 m!1197541))

(declare-fun m!1197543 () Bool)

(assert (=> start!110436 m!1197543))

(declare-fun m!1197545 () Bool)

(assert (=> start!110436 m!1197545))

(declare-fun m!1197547 () Bool)

(assert (=> mapNonEmpty!54130 m!1197547))

(check-sat tp_is_empty!35001 (not b!1306537) (not b!1306534) (not mapNonEmpty!54130) (not start!110436))
(check-sat)
