; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110434 () Bool)

(assert start!110434)

(declare-fun b!1306446 () Bool)

(declare-fun res!867322 () Bool)

(declare-fun e!745348 () Bool)

(assert (=> b!1306446 (=> (not res!867322) (not e!745348))))

(declare-datatypes ((array!86927 0))(
  ( (array!86928 (arr!41944 (Array (_ BitVec 32) (_ BitVec 64))) (size!42496 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86927)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86927 (_ BitVec 32)) Bool)

(assert (=> b!1306446 (= res!867322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306447 () Bool)

(declare-fun e!745346 () Bool)

(declare-fun tp_is_empty!34999 () Bool)

(assert (=> b!1306447 (= e!745346 tp_is_empty!34999)))

(declare-fun b!1306448 () Bool)

(assert (=> b!1306448 (= e!745348 false)))

(declare-fun lt!584745 () Bool)

(declare-datatypes ((List!29840 0))(
  ( (Nil!29837) (Cons!29836 (h!31045 (_ BitVec 64)) (t!43438 List!29840)) )
))
(declare-fun arrayNoDuplicates!0 (array!86927 (_ BitVec 32) List!29840) Bool)

(assert (=> b!1306448 (= lt!584745 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29837))))

(declare-fun b!1306449 () Bool)

(declare-fun e!745347 () Bool)

(assert (=> b!1306449 (= e!745347 tp_is_empty!34999)))

(declare-fun mapNonEmpty!54127 () Bool)

(declare-fun mapRes!54127 () Bool)

(declare-fun tp!103208 () Bool)

(assert (=> mapNonEmpty!54127 (= mapRes!54127 (and tp!103208 e!745346))))

(declare-datatypes ((V!51769 0))(
  ( (V!51770 (val!17574 Int)) )
))
(declare-datatypes ((ValueCell!16601 0))(
  ( (ValueCellFull!16601 (v!20200 V!51769)) (EmptyCell!16601) )
))
(declare-fun mapValue!54127 () ValueCell!16601)

(declare-datatypes ((array!86929 0))(
  ( (array!86930 (arr!41945 (Array (_ BitVec 32) ValueCell!16601)) (size!42497 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86929)

(declare-fun mapRest!54127 () (Array (_ BitVec 32) ValueCell!16601))

(declare-fun mapKey!54127 () (_ BitVec 32))

(assert (=> mapNonEmpty!54127 (= (arr!41945 _values!1354) (store mapRest!54127 mapKey!54127 mapValue!54127))))

(declare-fun res!867321 () Bool)

(assert (=> start!110434 (=> (not res!867321) (not e!745348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110434 (= res!867321 (validMask!0 mask!2040))))

(assert (=> start!110434 e!745348))

(assert (=> start!110434 true))

(declare-fun e!745345 () Bool)

(declare-fun array_inv!31899 (array!86929) Bool)

(assert (=> start!110434 (and (array_inv!31899 _values!1354) e!745345)))

(declare-fun array_inv!31900 (array!86927) Bool)

(assert (=> start!110434 (array_inv!31900 _keys!1628)))

(declare-fun b!1306450 () Bool)

(declare-fun res!867320 () Bool)

(assert (=> b!1306450 (=> (not res!867320) (not e!745348))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306450 (= res!867320 (and (= (size!42497 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42496 _keys!1628) (size!42497 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306451 () Bool)

(assert (=> b!1306451 (= e!745345 (and e!745347 mapRes!54127))))

(declare-fun condMapEmpty!54127 () Bool)

(declare-fun mapDefault!54127 () ValueCell!16601)

(assert (=> b!1306451 (= condMapEmpty!54127 (= (arr!41945 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16601)) mapDefault!54127)))))

(declare-fun mapIsEmpty!54127 () Bool)

(assert (=> mapIsEmpty!54127 mapRes!54127))

(assert (= (and start!110434 res!867321) b!1306450))

(assert (= (and b!1306450 res!867320) b!1306446))

(assert (= (and b!1306446 res!867322) b!1306448))

(assert (= (and b!1306451 condMapEmpty!54127) mapIsEmpty!54127))

(assert (= (and b!1306451 (not condMapEmpty!54127)) mapNonEmpty!54127))

(get-info :version)

(assert (= (and mapNonEmpty!54127 ((_ is ValueCellFull!16601) mapValue!54127)) b!1306447))

(assert (= (and b!1306451 ((_ is ValueCellFull!16601) mapDefault!54127)) b!1306449))

(assert (= start!110434 b!1306451))

(declare-fun m!1197009 () Bool)

(assert (=> b!1306446 m!1197009))

(declare-fun m!1197011 () Bool)

(assert (=> b!1306448 m!1197011))

(declare-fun m!1197013 () Bool)

(assert (=> mapNonEmpty!54127 m!1197013))

(declare-fun m!1197015 () Bool)

(assert (=> start!110434 m!1197015))

(declare-fun m!1197017 () Bool)

(assert (=> start!110434 m!1197017))

(declare-fun m!1197019 () Bool)

(assert (=> start!110434 m!1197019))

(check-sat (not b!1306448) (not mapNonEmpty!54127) (not b!1306446) tp_is_empty!34999 (not start!110434))
(check-sat)
