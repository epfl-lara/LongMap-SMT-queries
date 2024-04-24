; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108142 () Bool)

(assert start!108142)

(declare-fun mapIsEmpty!51365 () Bool)

(declare-fun mapRes!51365 () Bool)

(assert (=> mapIsEmpty!51365 mapRes!51365))

(declare-fun mapNonEmpty!51365 () Bool)

(declare-fun tp!98123 () Bool)

(declare-fun e!728768 () Bool)

(assert (=> mapNonEmpty!51365 (= mapRes!51365 (and tp!98123 e!728768))))

(declare-datatypes ((V!49417 0))(
  ( (V!49418 (val!16692 Int)) )
))
(declare-datatypes ((ValueCell!15719 0))(
  ( (ValueCellFull!15719 (v!19283 V!49417)) (EmptyCell!15719) )
))
(declare-fun mapValue!51365 () ValueCell!15719)

(declare-fun mapKey!51365 () (_ BitVec 32))

(declare-fun mapRest!51365 () (Array (_ BitVec 32) ValueCell!15719))

(declare-datatypes ((array!83595 0))(
  ( (array!83596 (arr!40310 (Array (_ BitVec 32) ValueCell!15719)) (size!40861 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83595)

(assert (=> mapNonEmpty!51365 (= (arr!40310 _values!1187) (store mapRest!51365 mapKey!51365 mapValue!51365))))

(declare-fun b!1276545 () Bool)

(declare-fun e!728770 () Bool)

(declare-fun tp_is_empty!33235 () Bool)

(assert (=> b!1276545 (= e!728770 tp_is_empty!33235)))

(declare-fun b!1276546 () Bool)

(declare-fun e!728769 () Bool)

(assert (=> b!1276546 (= e!728769 (and e!728770 mapRes!51365))))

(declare-fun condMapEmpty!51365 () Bool)

(declare-fun mapDefault!51365 () ValueCell!15719)

(assert (=> b!1276546 (= condMapEmpty!51365 (= (arr!40310 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15719)) mapDefault!51365)))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83597 0))(
  ( (array!83598 (arr!40311 (Array (_ BitVec 32) (_ BitVec 64))) (size!40862 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83597)

(declare-fun e!728771 () Bool)

(declare-fun b!1276547 () Bool)

(assert (=> b!1276547 (= e!728771 (and (= (size!40861 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40862 _keys!1427) (size!40861 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011) (not (= (size!40862 _keys!1427) (bvadd #b00000000000000000000000000000001 mask!1805)))))))

(declare-fun b!1276548 () Bool)

(assert (=> b!1276548 (= e!728768 tp_is_empty!33235)))

(declare-fun res!848192 () Bool)

(assert (=> start!108142 (=> (not res!848192) (not e!728771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108142 (= res!848192 (validMask!0 mask!1805))))

(assert (=> start!108142 e!728771))

(assert (=> start!108142 true))

(declare-fun array_inv!30821 (array!83595) Bool)

(assert (=> start!108142 (and (array_inv!30821 _values!1187) e!728769)))

(declare-fun array_inv!30822 (array!83597) Bool)

(assert (=> start!108142 (array_inv!30822 _keys!1427)))

(assert (= (and start!108142 res!848192) b!1276547))

(assert (= (and b!1276546 condMapEmpty!51365) mapIsEmpty!51365))

(assert (= (and b!1276546 (not condMapEmpty!51365)) mapNonEmpty!51365))

(get-info :version)

(assert (= (and mapNonEmpty!51365 ((_ is ValueCellFull!15719) mapValue!51365)) b!1276548))

(assert (= (and b!1276546 ((_ is ValueCellFull!15719) mapDefault!51365)) b!1276545))

(assert (= start!108142 b!1276546))

(declare-fun m!1173179 () Bool)

(assert (=> mapNonEmpty!51365 m!1173179))

(declare-fun m!1173181 () Bool)

(assert (=> start!108142 m!1173181))

(declare-fun m!1173183 () Bool)

(assert (=> start!108142 m!1173183))

(declare-fun m!1173185 () Bool)

(assert (=> start!108142 m!1173185))

(check-sat (not start!108142) (not mapNonEmpty!51365) tp_is_empty!33235)
(check-sat)
