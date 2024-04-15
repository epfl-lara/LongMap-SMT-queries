; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107918 () Bool)

(assert start!107918)

(declare-fun b!1275176 () Bool)

(declare-fun e!727891 () Bool)

(declare-fun e!727892 () Bool)

(declare-fun mapRes!51365 () Bool)

(assert (=> b!1275176 (= e!727891 (and e!727892 mapRes!51365))))

(declare-fun condMapEmpty!51365 () Bool)

(declare-datatypes ((V!49417 0))(
  ( (V!49418 (val!16692 Int)) )
))
(declare-datatypes ((ValueCell!15719 0))(
  ( (ValueCellFull!15719 (v!19287 V!49417)) (EmptyCell!15719) )
))
(declare-datatypes ((array!83477 0))(
  ( (array!83478 (arr!40256 (Array (_ BitVec 32) ValueCell!15719)) (size!40808 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83477)

(declare-fun mapDefault!51365 () ValueCell!15719)

(assert (=> b!1275176 (= condMapEmpty!51365 (= (arr!40256 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15719)) mapDefault!51365)))))

(declare-fun mapIsEmpty!51365 () Bool)

(assert (=> mapIsEmpty!51365 mapRes!51365))

(declare-fun mapNonEmpty!51365 () Bool)

(declare-fun tp!98124 () Bool)

(declare-fun e!727895 () Bool)

(assert (=> mapNonEmpty!51365 (= mapRes!51365 (and tp!98124 e!727895))))

(declare-fun mapKey!51365 () (_ BitVec 32))

(declare-fun mapValue!51365 () ValueCell!15719)

(declare-fun mapRest!51365 () (Array (_ BitVec 32) ValueCell!15719))

(assert (=> mapNonEmpty!51365 (= (arr!40256 _values!1187) (store mapRest!51365 mapKey!51365 mapValue!51365))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83479 0))(
  ( (array!83480 (arr!40257 (Array (_ BitVec 32) (_ BitVec 64))) (size!40809 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83479)

(declare-fun b!1275177 () Bool)

(declare-fun e!727894 () Bool)

(assert (=> b!1275177 (= e!727894 (and (= (size!40808 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40809 _keys!1427) (size!40808 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011) (not (= (size!40809 _keys!1427) (bvadd #b00000000000000000000000000000001 mask!1805)))))))

(declare-fun res!847645 () Bool)

(assert (=> start!107918 (=> (not res!847645) (not e!727894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107918 (= res!847645 (validMask!0 mask!1805))))

(assert (=> start!107918 e!727894))

(assert (=> start!107918 true))

(declare-fun array_inv!30753 (array!83477) Bool)

(assert (=> start!107918 (and (array_inv!30753 _values!1187) e!727891)))

(declare-fun array_inv!30754 (array!83479) Bool)

(assert (=> start!107918 (array_inv!30754 _keys!1427)))

(declare-fun b!1275178 () Bool)

(declare-fun tp_is_empty!33235 () Bool)

(assert (=> b!1275178 (= e!727892 tp_is_empty!33235)))

(declare-fun b!1275179 () Bool)

(assert (=> b!1275179 (= e!727895 tp_is_empty!33235)))

(assert (= (and start!107918 res!847645) b!1275177))

(assert (= (and b!1275176 condMapEmpty!51365) mapIsEmpty!51365))

(assert (= (and b!1275176 (not condMapEmpty!51365)) mapNonEmpty!51365))

(get-info :version)

(assert (= (and mapNonEmpty!51365 ((_ is ValueCellFull!15719) mapValue!51365)) b!1275179))

(assert (= (and b!1275176 ((_ is ValueCellFull!15719) mapDefault!51365)) b!1275178))

(assert (= start!107918 b!1275176))

(declare-fun m!1171067 () Bool)

(assert (=> mapNonEmpty!51365 m!1171067))

(declare-fun m!1171069 () Bool)

(assert (=> start!107918 m!1171069))

(declare-fun m!1171071 () Bool)

(assert (=> start!107918 m!1171071))

(declare-fun m!1171073 () Bool)

(assert (=> start!107918 m!1171073))

(check-sat (not start!107918) (not mapNonEmpty!51365) tp_is_empty!33235)
(check-sat)
