; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110454 () Bool)

(assert start!110454)

(declare-fun b!1306696 () Bool)

(declare-fun e!745530 () Bool)

(assert (=> b!1306696 (= e!745530 false)))

(declare-fun lt!584961 () Bool)

(declare-datatypes ((array!87052 0))(
  ( (array!87053 (arr!42006 (Array (_ BitVec 32) (_ BitVec 64))) (size!42556 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87052)

(declare-datatypes ((List!29797 0))(
  ( (Nil!29794) (Cons!29793 (h!31002 (_ BitVec 64)) (t!43403 List!29797)) )
))
(declare-fun arrayNoDuplicates!0 (array!87052 (_ BitVec 32) List!29797) Bool)

(assert (=> b!1306696 (= lt!584961 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29794))))

(declare-fun b!1306697 () Bool)

(declare-fun e!745529 () Bool)

(declare-fun e!745531 () Bool)

(declare-fun mapRes!54157 () Bool)

(assert (=> b!1306697 (= e!745529 (and e!745531 mapRes!54157))))

(declare-fun condMapEmpty!54157 () Bool)

(declare-datatypes ((V!51795 0))(
  ( (V!51796 (val!17584 Int)) )
))
(declare-datatypes ((ValueCell!16611 0))(
  ( (ValueCellFull!16611 (v!20211 V!51795)) (EmptyCell!16611) )
))
(declare-datatypes ((array!87054 0))(
  ( (array!87055 (arr!42007 (Array (_ BitVec 32) ValueCell!16611)) (size!42557 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87054)

(declare-fun mapDefault!54157 () ValueCell!16611)

(assert (=> b!1306697 (= condMapEmpty!54157 (= (arr!42007 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16611)) mapDefault!54157)))))

(declare-fun b!1306698 () Bool)

(declare-fun res!867439 () Bool)

(assert (=> b!1306698 (=> (not res!867439) (not e!745530))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306698 (= res!867439 (and (= (size!42557 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42556 _keys!1628) (size!42557 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54157 () Bool)

(declare-fun tp!103237 () Bool)

(declare-fun e!745528 () Bool)

(assert (=> mapNonEmpty!54157 (= mapRes!54157 (and tp!103237 e!745528))))

(declare-fun mapKey!54157 () (_ BitVec 32))

(declare-fun mapRest!54157 () (Array (_ BitVec 32) ValueCell!16611))

(declare-fun mapValue!54157 () ValueCell!16611)

(assert (=> mapNonEmpty!54157 (= (arr!42007 _values!1354) (store mapRest!54157 mapKey!54157 mapValue!54157))))

(declare-fun b!1306700 () Bool)

(declare-fun tp_is_empty!35019 () Bool)

(assert (=> b!1306700 (= e!745528 tp_is_empty!35019)))

(declare-fun b!1306699 () Bool)

(assert (=> b!1306699 (= e!745531 tp_is_empty!35019)))

(declare-fun res!867441 () Bool)

(assert (=> start!110454 (=> (not res!867441) (not e!745530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110454 (= res!867441 (validMask!0 mask!2040))))

(assert (=> start!110454 e!745530))

(assert (=> start!110454 true))

(declare-fun array_inv!31759 (array!87054) Bool)

(assert (=> start!110454 (and (array_inv!31759 _values!1354) e!745529)))

(declare-fun array_inv!31760 (array!87052) Bool)

(assert (=> start!110454 (array_inv!31760 _keys!1628)))

(declare-fun b!1306701 () Bool)

(declare-fun res!867440 () Bool)

(assert (=> b!1306701 (=> (not res!867440) (not e!745530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87052 (_ BitVec 32)) Bool)

(assert (=> b!1306701 (= res!867440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54157 () Bool)

(assert (=> mapIsEmpty!54157 mapRes!54157))

(assert (= (and start!110454 res!867441) b!1306698))

(assert (= (and b!1306698 res!867439) b!1306701))

(assert (= (and b!1306701 res!867440) b!1306696))

(assert (= (and b!1306697 condMapEmpty!54157) mapIsEmpty!54157))

(assert (= (and b!1306697 (not condMapEmpty!54157)) mapNonEmpty!54157))

(get-info :version)

(assert (= (and mapNonEmpty!54157 ((_ is ValueCellFull!16611) mapValue!54157)) b!1306700))

(assert (= (and b!1306697 ((_ is ValueCellFull!16611) mapDefault!54157)) b!1306699))

(assert (= start!110454 b!1306697))

(declare-fun m!1197645 () Bool)

(assert (=> b!1306696 m!1197645))

(declare-fun m!1197647 () Bool)

(assert (=> mapNonEmpty!54157 m!1197647))

(declare-fun m!1197649 () Bool)

(assert (=> start!110454 m!1197649))

(declare-fun m!1197651 () Bool)

(assert (=> start!110454 m!1197651))

(declare-fun m!1197653 () Bool)

(assert (=> start!110454 m!1197653))

(declare-fun m!1197655 () Bool)

(assert (=> b!1306701 m!1197655))

(check-sat tp_is_empty!35019 (not b!1306701) (not b!1306696) (not mapNonEmpty!54157) (not start!110454))
(check-sat)
