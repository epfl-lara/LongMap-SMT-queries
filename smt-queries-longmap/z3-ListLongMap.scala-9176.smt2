; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110584 () Bool)

(assert start!110584)

(declare-fun b!1307415 () Bool)

(declare-datatypes ((array!87003 0))(
  ( (array!87004 (arr!41982 (Array (_ BitVec 32) (_ BitVec 64))) (size!42533 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87003)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun e!745904 () Bool)

(declare-datatypes ((V!51729 0))(
  ( (V!51730 (val!17559 Int)) )
))
(declare-datatypes ((ValueCell!16586 0))(
  ( (ValueCellFull!16586 (v!20180 V!51729)) (EmptyCell!16586) )
))
(declare-datatypes ((array!87005 0))(
  ( (array!87006 (arr!41983 (Array (_ BitVec 32) ValueCell!16586)) (size!42534 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87005)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307415 (= e!745904 (and (= (size!42534 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42533 _keys!1628) (size!42534 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011) (= (size!42533 _keys!1628) (bvadd #b00000000000000000000000000000001 mask!2040)) (bvsgt #b00000000000000000000000000000000 (size!42533 _keys!1628))))))

(declare-fun res!867666 () Bool)

(assert (=> start!110584 (=> (not res!867666) (not e!745904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110584 (= res!867666 (validMask!0 mask!2040))))

(assert (=> start!110584 e!745904))

(assert (=> start!110584 true))

(declare-fun e!745902 () Bool)

(declare-fun array_inv!31997 (array!87005) Bool)

(assert (=> start!110584 (and (array_inv!31997 _values!1354) e!745902)))

(declare-fun array_inv!31998 (array!87003) Bool)

(assert (=> start!110584 (array_inv!31998 _keys!1628)))

(declare-fun b!1307416 () Bool)

(declare-fun e!745903 () Bool)

(declare-fun mapRes!54067 () Bool)

(assert (=> b!1307416 (= e!745902 (and e!745903 mapRes!54067))))

(declare-fun condMapEmpty!54067 () Bool)

(declare-fun mapDefault!54067 () ValueCell!16586)

(assert (=> b!1307416 (= condMapEmpty!54067 (= (arr!41983 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16586)) mapDefault!54067)))))

(declare-fun b!1307417 () Bool)

(declare-fun tp_is_empty!34969 () Bool)

(assert (=> b!1307417 (= e!745903 tp_is_empty!34969)))

(declare-fun mapNonEmpty!54067 () Bool)

(declare-fun tp!103147 () Bool)

(declare-fun e!745901 () Bool)

(assert (=> mapNonEmpty!54067 (= mapRes!54067 (and tp!103147 e!745901))))

(declare-fun mapValue!54067 () ValueCell!16586)

(declare-fun mapRest!54067 () (Array (_ BitVec 32) ValueCell!16586))

(declare-fun mapKey!54067 () (_ BitVec 32))

(assert (=> mapNonEmpty!54067 (= (arr!41983 _values!1354) (store mapRest!54067 mapKey!54067 mapValue!54067))))

(declare-fun b!1307418 () Bool)

(assert (=> b!1307418 (= e!745901 tp_is_empty!34969)))

(declare-fun mapIsEmpty!54067 () Bool)

(assert (=> mapIsEmpty!54067 mapRes!54067))

(assert (= (and start!110584 res!867666) b!1307415))

(assert (= (and b!1307416 condMapEmpty!54067) mapIsEmpty!54067))

(assert (= (and b!1307416 (not condMapEmpty!54067)) mapNonEmpty!54067))

(get-info :version)

(assert (= (and mapNonEmpty!54067 ((_ is ValueCellFull!16586) mapValue!54067)) b!1307418))

(assert (= (and b!1307416 ((_ is ValueCellFull!16586) mapDefault!54067)) b!1307417))

(assert (= start!110584 b!1307416))

(declare-fun m!1198879 () Bool)

(assert (=> start!110584 m!1198879))

(declare-fun m!1198881 () Bool)

(assert (=> start!110584 m!1198881))

(declare-fun m!1198883 () Bool)

(assert (=> start!110584 m!1198883))

(declare-fun m!1198885 () Bool)

(assert (=> mapNonEmpty!54067 m!1198885))

(check-sat (not start!110584) (not mapNonEmpty!54067) tp_is_empty!34969)
(check-sat)
(get-model)

(declare-fun d!142659 () Bool)

(assert (=> d!142659 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110584 d!142659))

(declare-fun d!142661 () Bool)

(assert (=> d!142661 (= (array_inv!31997 _values!1354) (bvsge (size!42534 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110584 d!142661))

(declare-fun d!142663 () Bool)

(assert (=> d!142663 (= (array_inv!31998 _keys!1628) (bvsge (size!42533 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110584 d!142663))

(declare-fun mapIsEmpty!54076 () Bool)

(declare-fun mapRes!54076 () Bool)

(assert (=> mapIsEmpty!54076 mapRes!54076))

(declare-fun b!1307450 () Bool)

(declare-fun e!745940 () Bool)

(assert (=> b!1307450 (= e!745940 tp_is_empty!34969)))

(declare-fun b!1307449 () Bool)

(declare-fun e!745941 () Bool)

(assert (=> b!1307449 (= e!745941 tp_is_empty!34969)))

(declare-fun mapNonEmpty!54076 () Bool)

(declare-fun tp!103156 () Bool)

(assert (=> mapNonEmpty!54076 (= mapRes!54076 (and tp!103156 e!745941))))

(declare-fun mapRest!54076 () (Array (_ BitVec 32) ValueCell!16586))

(declare-fun mapKey!54076 () (_ BitVec 32))

(declare-fun mapValue!54076 () ValueCell!16586)

(assert (=> mapNonEmpty!54076 (= mapRest!54067 (store mapRest!54076 mapKey!54076 mapValue!54076))))

(declare-fun condMapEmpty!54076 () Bool)

(declare-fun mapDefault!54076 () ValueCell!16586)

(assert (=> mapNonEmpty!54067 (= condMapEmpty!54076 (= mapRest!54067 ((as const (Array (_ BitVec 32) ValueCell!16586)) mapDefault!54076)))))

(assert (=> mapNonEmpty!54067 (= tp!103147 (and e!745940 mapRes!54076))))

(assert (= (and mapNonEmpty!54067 condMapEmpty!54076) mapIsEmpty!54076))

(assert (= (and mapNonEmpty!54067 (not condMapEmpty!54076)) mapNonEmpty!54076))

(assert (= (and mapNonEmpty!54076 ((_ is ValueCellFull!16586) mapValue!54076)) b!1307449))

(assert (= (and mapNonEmpty!54067 ((_ is ValueCellFull!16586) mapDefault!54076)) b!1307450))

(declare-fun m!1198903 () Bool)

(assert (=> mapNonEmpty!54076 m!1198903))

(check-sat (not mapNonEmpty!54076) tp_is_empty!34969)
(check-sat)
