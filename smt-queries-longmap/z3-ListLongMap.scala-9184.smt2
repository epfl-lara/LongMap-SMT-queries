; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110452 () Bool)

(assert start!110452)

(declare-fun b!1306608 () Bool)

(declare-fun res!867402 () Bool)

(declare-fun e!745480 () Bool)

(assert (=> b!1306608 (=> (not res!867402) (not e!745480))))

(declare-datatypes ((array!86959 0))(
  ( (array!86960 (arr!41960 (Array (_ BitVec 32) (_ BitVec 64))) (size!42512 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86959)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86959 (_ BitVec 32)) Bool)

(assert (=> b!1306608 (= res!867402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54154 () Bool)

(declare-fun mapRes!54154 () Bool)

(assert (=> mapIsEmpty!54154 mapRes!54154))

(declare-fun b!1306609 () Bool)

(assert (=> b!1306609 (= e!745480 false)))

(declare-fun lt!584772 () Bool)

(declare-datatypes ((List!29845 0))(
  ( (Nil!29842) (Cons!29841 (h!31050 (_ BitVec 64)) (t!43443 List!29845)) )
))
(declare-fun arrayNoDuplicates!0 (array!86959 (_ BitVec 32) List!29845) Bool)

(assert (=> b!1306609 (= lt!584772 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29842))))

(declare-fun b!1306610 () Bool)

(declare-fun e!745484 () Bool)

(declare-fun e!745483 () Bool)

(assert (=> b!1306610 (= e!745484 (and e!745483 mapRes!54154))))

(declare-fun condMapEmpty!54154 () Bool)

(declare-datatypes ((V!51793 0))(
  ( (V!51794 (val!17583 Int)) )
))
(declare-datatypes ((ValueCell!16610 0))(
  ( (ValueCellFull!16610 (v!20209 V!51793)) (EmptyCell!16610) )
))
(declare-datatypes ((array!86961 0))(
  ( (array!86962 (arr!41961 (Array (_ BitVec 32) ValueCell!16610)) (size!42513 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86961)

(declare-fun mapDefault!54154 () ValueCell!16610)

(assert (=> b!1306610 (= condMapEmpty!54154 (= (arr!41961 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16610)) mapDefault!54154)))))

(declare-fun res!867403 () Bool)

(assert (=> start!110452 (=> (not res!867403) (not e!745480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110452 (= res!867403 (validMask!0 mask!2040))))

(assert (=> start!110452 e!745480))

(assert (=> start!110452 true))

(declare-fun array_inv!31913 (array!86961) Bool)

(assert (=> start!110452 (and (array_inv!31913 _values!1354) e!745484)))

(declare-fun array_inv!31914 (array!86959) Bool)

(assert (=> start!110452 (array_inv!31914 _keys!1628)))

(declare-fun b!1306611 () Bool)

(declare-fun res!867401 () Bool)

(assert (=> b!1306611 (=> (not res!867401) (not e!745480))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306611 (= res!867401 (and (= (size!42513 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42512 _keys!1628) (size!42513 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54154 () Bool)

(declare-fun tp!103235 () Bool)

(declare-fun e!745482 () Bool)

(assert (=> mapNonEmpty!54154 (= mapRes!54154 (and tp!103235 e!745482))))

(declare-fun mapValue!54154 () ValueCell!16610)

(declare-fun mapRest!54154 () (Array (_ BitVec 32) ValueCell!16610))

(declare-fun mapKey!54154 () (_ BitVec 32))

(assert (=> mapNonEmpty!54154 (= (arr!41961 _values!1354) (store mapRest!54154 mapKey!54154 mapValue!54154))))

(declare-fun b!1306612 () Bool)

(declare-fun tp_is_empty!35017 () Bool)

(assert (=> b!1306612 (= e!745482 tp_is_empty!35017)))

(declare-fun b!1306613 () Bool)

(assert (=> b!1306613 (= e!745483 tp_is_empty!35017)))

(assert (= (and start!110452 res!867403) b!1306611))

(assert (= (and b!1306611 res!867401) b!1306608))

(assert (= (and b!1306608 res!867402) b!1306609))

(assert (= (and b!1306610 condMapEmpty!54154) mapIsEmpty!54154))

(assert (= (and b!1306610 (not condMapEmpty!54154)) mapNonEmpty!54154))

(get-info :version)

(assert (= (and mapNonEmpty!54154 ((_ is ValueCellFull!16610) mapValue!54154)) b!1306612))

(assert (= (and b!1306610 ((_ is ValueCellFull!16610) mapDefault!54154)) b!1306613))

(assert (= start!110452 b!1306610))

(declare-fun m!1197117 () Bool)

(assert (=> b!1306608 m!1197117))

(declare-fun m!1197119 () Bool)

(assert (=> b!1306609 m!1197119))

(declare-fun m!1197121 () Bool)

(assert (=> start!110452 m!1197121))

(declare-fun m!1197123 () Bool)

(assert (=> start!110452 m!1197123))

(declare-fun m!1197125 () Bool)

(assert (=> start!110452 m!1197125))

(declare-fun m!1197127 () Bool)

(assert (=> mapNonEmpty!54154 m!1197127))

(check-sat (not mapNonEmpty!54154) tp_is_empty!35017 (not b!1306608) (not b!1306609) (not start!110452))
(check-sat)
