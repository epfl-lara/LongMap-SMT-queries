; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110360 () Bool)

(assert start!110360)

(declare-fun mapIsEmpty!54067 () Bool)

(declare-fun mapRes!54067 () Bool)

(assert (=> mapIsEmpty!54067 mapRes!54067))

(declare-fun b!1306046 () Bool)

(declare-fun e!745027 () Bool)

(declare-fun tp_is_empty!34969 () Bool)

(assert (=> b!1306046 (= e!745027 tp_is_empty!34969)))

(declare-fun mapNonEmpty!54067 () Bool)

(declare-fun tp!103148 () Bool)

(declare-fun e!745025 () Bool)

(assert (=> mapNonEmpty!54067 (= mapRes!54067 (and tp!103148 e!745025))))

(declare-datatypes ((V!51729 0))(
  ( (V!51730 (val!17559 Int)) )
))
(declare-datatypes ((ValueCell!16586 0))(
  ( (ValueCellFull!16586 (v!20184 V!51729)) (EmptyCell!16586) )
))
(declare-fun mapValue!54067 () ValueCell!16586)

(declare-fun mapKey!54067 () (_ BitVec 32))

(declare-datatypes ((array!86861 0))(
  ( (array!86862 (arr!41916 (Array (_ BitVec 32) ValueCell!16586)) (size!42468 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86861)

(declare-fun mapRest!54067 () (Array (_ BitVec 32) ValueCell!16586))

(assert (=> mapNonEmpty!54067 (= (arr!41916 _values!1354) (store mapRest!54067 mapKey!54067 mapValue!54067))))

(declare-datatypes ((array!86863 0))(
  ( (array!86864 (arr!41917 (Array (_ BitVec 32) (_ BitVec 64))) (size!42469 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86863)

(declare-fun e!745029 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun b!1306047 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306047 (= e!745029 (and (= (size!42468 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42469 _keys!1628) (size!42468 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011) (= (size!42469 _keys!1628) (bvadd #b00000000000000000000000000000001 mask!2040)) (bvsgt #b00000000000000000000000000000000 (size!42469 _keys!1628))))))

(declare-fun b!1306049 () Bool)

(assert (=> b!1306049 (= e!745025 tp_is_empty!34969)))

(declare-fun res!867119 () Bool)

(assert (=> start!110360 (=> (not res!867119) (not e!745029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110360 (= res!867119 (validMask!0 mask!2040))))

(assert (=> start!110360 e!745029))

(assert (=> start!110360 true))

(declare-fun e!745028 () Bool)

(declare-fun array_inv!31879 (array!86861) Bool)

(assert (=> start!110360 (and (array_inv!31879 _values!1354) e!745028)))

(declare-fun array_inv!31880 (array!86863) Bool)

(assert (=> start!110360 (array_inv!31880 _keys!1628)))

(declare-fun b!1306048 () Bool)

(assert (=> b!1306048 (= e!745028 (and e!745027 mapRes!54067))))

(declare-fun condMapEmpty!54067 () Bool)

(declare-fun mapDefault!54067 () ValueCell!16586)

(assert (=> b!1306048 (= condMapEmpty!54067 (= (arr!41916 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16586)) mapDefault!54067)))))

(assert (= (and start!110360 res!867119) b!1306047))

(assert (= (and b!1306048 condMapEmpty!54067) mapIsEmpty!54067))

(assert (= (and b!1306048 (not condMapEmpty!54067)) mapNonEmpty!54067))

(get-info :version)

(assert (= (and mapNonEmpty!54067 ((_ is ValueCellFull!16586) mapValue!54067)) b!1306049))

(assert (= (and b!1306048 ((_ is ValueCellFull!16586) mapDefault!54067)) b!1306046))

(assert (= start!110360 b!1306048))

(declare-fun m!1196765 () Bool)

(assert (=> mapNonEmpty!54067 m!1196765))

(declare-fun m!1196767 () Bool)

(assert (=> start!110360 m!1196767))

(declare-fun m!1196769 () Bool)

(assert (=> start!110360 m!1196769))

(declare-fun m!1196771 () Bool)

(assert (=> start!110360 m!1196771))

(check-sat (not start!110360) (not mapNonEmpty!54067) tp_is_empty!34969)
(check-sat)
(get-model)

(declare-fun d!142099 () Bool)

(assert (=> d!142099 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110360 d!142099))

(declare-fun d!142101 () Bool)

(assert (=> d!142101 (= (array_inv!31879 _values!1354) (bvsge (size!42468 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110360 d!142101))

(declare-fun d!142103 () Bool)

(assert (=> d!142103 (= (array_inv!31880 _keys!1628) (bvsge (size!42469 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110360 d!142103))

(declare-fun mapNonEmpty!54076 () Bool)

(declare-fun mapRes!54076 () Bool)

(declare-fun tp!103157 () Bool)

(declare-fun e!745065 () Bool)

(assert (=> mapNonEmpty!54076 (= mapRes!54076 (and tp!103157 e!745065))))

(declare-fun mapRest!54076 () (Array (_ BitVec 32) ValueCell!16586))

(declare-fun mapValue!54076 () ValueCell!16586)

(declare-fun mapKey!54076 () (_ BitVec 32))

(assert (=> mapNonEmpty!54076 (= mapRest!54067 (store mapRest!54076 mapKey!54076 mapValue!54076))))

(declare-fun mapIsEmpty!54076 () Bool)

(assert (=> mapIsEmpty!54076 mapRes!54076))

(declare-fun condMapEmpty!54076 () Bool)

(declare-fun mapDefault!54076 () ValueCell!16586)

(assert (=> mapNonEmpty!54067 (= condMapEmpty!54076 (= mapRest!54067 ((as const (Array (_ BitVec 32) ValueCell!16586)) mapDefault!54076)))))

(declare-fun e!745064 () Bool)

(assert (=> mapNonEmpty!54067 (= tp!103148 (and e!745064 mapRes!54076))))

(declare-fun b!1306080 () Bool)

(assert (=> b!1306080 (= e!745065 tp_is_empty!34969)))

(declare-fun b!1306081 () Bool)

(assert (=> b!1306081 (= e!745064 tp_is_empty!34969)))

(assert (= (and mapNonEmpty!54067 condMapEmpty!54076) mapIsEmpty!54076))

(assert (= (and mapNonEmpty!54067 (not condMapEmpty!54076)) mapNonEmpty!54076))

(assert (= (and mapNonEmpty!54076 ((_ is ValueCellFull!16586) mapValue!54076)) b!1306080))

(assert (= (and mapNonEmpty!54067 ((_ is ValueCellFull!16586) mapDefault!54076)) b!1306081))

(declare-fun m!1196789 () Bool)

(assert (=> mapNonEmpty!54076 m!1196789))

(check-sat (not mapNonEmpty!54076) tp_is_empty!34969)
(check-sat)
