; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107926 () Bool)

(assert start!107926)

(declare-fun mapIsEmpty!51377 () Bool)

(declare-fun mapRes!51377 () Bool)

(assert (=> mapIsEmpty!51377 mapRes!51377))

(declare-fun b!1275288 () Bool)

(declare-fun e!727982 () Bool)

(declare-fun tp_is_empty!33243 () Bool)

(assert (=> b!1275288 (= e!727982 tp_is_empty!33243)))

(declare-fun b!1275289 () Bool)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83594 0))(
  ( (array!83595 (arr!40314 (Array (_ BitVec 32) (_ BitVec 64))) (size!40864 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83594)

(declare-fun e!727980 () Bool)

(declare-datatypes ((V!49427 0))(
  ( (V!49428 (val!16696 Int)) )
))
(declare-datatypes ((ValueCell!15723 0))(
  ( (ValueCellFull!15723 (v!19292 V!49427)) (EmptyCell!15723) )
))
(declare-datatypes ((array!83596 0))(
  ( (array!83597 (arr!40315 (Array (_ BitVec 32) ValueCell!15723)) (size!40865 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83596)

(assert (=> b!1275289 (= e!727980 (and (= (size!40865 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40864 _keys!1427) (size!40865 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011) (= (size!40864 _keys!1427) (bvadd #b00000000000000000000000000000001 mask!1805)) (bvsgt #b00000000000000000000000000000000 (size!40864 _keys!1427))))))

(declare-fun b!1275290 () Bool)

(declare-fun e!727984 () Bool)

(assert (=> b!1275290 (= e!727984 tp_is_empty!33243)))

(declare-fun b!1275291 () Bool)

(declare-fun e!727983 () Bool)

(assert (=> b!1275291 (= e!727983 (and e!727982 mapRes!51377))))

(declare-fun condMapEmpty!51377 () Bool)

(declare-fun mapDefault!51377 () ValueCell!15723)

(assert (=> b!1275291 (= condMapEmpty!51377 (= (arr!40315 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15723)) mapDefault!51377)))))

(declare-fun res!847684 () Bool)

(assert (=> start!107926 (=> (not res!847684) (not e!727980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107926 (= res!847684 (validMask!0 mask!1805))))

(assert (=> start!107926 e!727980))

(assert (=> start!107926 true))

(declare-fun array_inv!30647 (array!83596) Bool)

(assert (=> start!107926 (and (array_inv!30647 _values!1187) e!727983)))

(declare-fun array_inv!30648 (array!83594) Bool)

(assert (=> start!107926 (array_inv!30648 _keys!1427)))

(declare-fun mapNonEmpty!51377 () Bool)

(declare-fun tp!98135 () Bool)

(assert (=> mapNonEmpty!51377 (= mapRes!51377 (and tp!98135 e!727984))))

(declare-fun mapValue!51377 () ValueCell!15723)

(declare-fun mapKey!51377 () (_ BitVec 32))

(declare-fun mapRest!51377 () (Array (_ BitVec 32) ValueCell!15723))

(assert (=> mapNonEmpty!51377 (= (arr!40315 _values!1187) (store mapRest!51377 mapKey!51377 mapValue!51377))))

(assert (= (and start!107926 res!847684) b!1275289))

(assert (= (and b!1275291 condMapEmpty!51377) mapIsEmpty!51377))

(assert (= (and b!1275291 (not condMapEmpty!51377)) mapNonEmpty!51377))

(get-info :version)

(assert (= (and mapNonEmpty!51377 ((_ is ValueCellFull!15723) mapValue!51377)) b!1275290))

(assert (= (and b!1275291 ((_ is ValueCellFull!15723) mapDefault!51377)) b!1275288))

(assert (= start!107926 b!1275291))

(declare-fun m!1171599 () Bool)

(assert (=> start!107926 m!1171599))

(declare-fun m!1171601 () Bool)

(assert (=> start!107926 m!1171601))

(declare-fun m!1171603 () Bool)

(assert (=> start!107926 m!1171603))

(declare-fun m!1171605 () Bool)

(assert (=> mapNonEmpty!51377 m!1171605))

(check-sat (not start!107926) (not mapNonEmpty!51377) tp_is_empty!33243)
(check-sat)
(get-model)

(declare-fun d!140339 () Bool)

(assert (=> d!140339 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107926 d!140339))

(declare-fun d!140341 () Bool)

(assert (=> d!140341 (= (array_inv!30647 _values!1187) (bvsge (size!40865 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107926 d!140341))

(declare-fun d!140343 () Bool)

(assert (=> d!140343 (= (array_inv!30648 _keys!1427) (bvsge (size!40864 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107926 d!140343))

(declare-fun b!1275310 () Bool)

(declare-fun e!728005 () Bool)

(assert (=> b!1275310 (= e!728005 tp_is_empty!33243)))

(declare-fun mapNonEmpty!51383 () Bool)

(declare-fun mapRes!51383 () Bool)

(declare-fun tp!98141 () Bool)

(assert (=> mapNonEmpty!51383 (= mapRes!51383 (and tp!98141 e!728005))))

(declare-fun mapRest!51383 () (Array (_ BitVec 32) ValueCell!15723))

(declare-fun mapKey!51383 () (_ BitVec 32))

(declare-fun mapValue!51383 () ValueCell!15723)

(assert (=> mapNonEmpty!51383 (= mapRest!51377 (store mapRest!51383 mapKey!51383 mapValue!51383))))

(declare-fun mapIsEmpty!51383 () Bool)

(assert (=> mapIsEmpty!51383 mapRes!51383))

(declare-fun condMapEmpty!51383 () Bool)

(declare-fun mapDefault!51383 () ValueCell!15723)

(assert (=> mapNonEmpty!51377 (= condMapEmpty!51383 (= mapRest!51377 ((as const (Array (_ BitVec 32) ValueCell!15723)) mapDefault!51383)))))

(declare-fun e!728004 () Bool)

(assert (=> mapNonEmpty!51377 (= tp!98135 (and e!728004 mapRes!51383))))

(declare-fun b!1275311 () Bool)

(assert (=> b!1275311 (= e!728004 tp_is_empty!33243)))

(assert (= (and mapNonEmpty!51377 condMapEmpty!51383) mapIsEmpty!51383))

(assert (= (and mapNonEmpty!51377 (not condMapEmpty!51383)) mapNonEmpty!51383))

(assert (= (and mapNonEmpty!51383 ((_ is ValueCellFull!15723) mapValue!51383)) b!1275310))

(assert (= (and mapNonEmpty!51377 ((_ is ValueCellFull!15723) mapDefault!51383)) b!1275311))

(declare-fun m!1171615 () Bool)

(assert (=> mapNonEmpty!51383 m!1171615))

(check-sat (not mapNonEmpty!51383) tp_is_empty!33243)
(check-sat)
