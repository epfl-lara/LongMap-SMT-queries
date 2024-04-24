; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108246 () Bool)

(assert start!108246)

(declare-fun mapIsEmpty!51470 () Bool)

(declare-fun mapRes!51470 () Bool)

(assert (=> mapIsEmpty!51470 mapRes!51470))

(declare-fun b!1277197 () Bool)

(declare-fun res!848511 () Bool)

(declare-fun e!729316 () Bool)

(assert (=> b!1277197 (=> (not res!848511) (not e!729316))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83715 0))(
  ( (array!83716 (arr!40365 (Array (_ BitVec 32) (_ BitVec 64))) (size!40916 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83715)

(declare-datatypes ((V!49497 0))(
  ( (V!49498 (val!16722 Int)) )
))
(declare-datatypes ((ValueCell!15749 0))(
  ( (ValueCellFull!15749 (v!19314 V!49497)) (EmptyCell!15749) )
))
(declare-datatypes ((array!83717 0))(
  ( (array!83718 (arr!40366 (Array (_ BitVec 32) ValueCell!15749)) (size!40917 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83717)

(assert (=> b!1277197 (= res!848511 (and (= (size!40917 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40916 _keys!1427) (size!40917 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277198 () Bool)

(declare-fun e!729313 () Bool)

(declare-fun e!729312 () Bool)

(assert (=> b!1277198 (= e!729313 (and e!729312 mapRes!51470))))

(declare-fun condMapEmpty!51470 () Bool)

(declare-fun mapDefault!51470 () ValueCell!15749)

(assert (=> b!1277198 (= condMapEmpty!51470 (= (arr!40366 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15749)) mapDefault!51470)))))

(declare-fun b!1277199 () Bool)

(declare-fun res!848512 () Bool)

(assert (=> b!1277199 (=> (not res!848512) (not e!729316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83715 (_ BitVec 32)) Bool)

(assert (=> b!1277199 (= res!848512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277200 () Bool)

(declare-fun tp_is_empty!33295 () Bool)

(assert (=> b!1277200 (= e!729312 tp_is_empty!33295)))

(declare-fun b!1277201 () Bool)

(declare-fun e!729315 () Bool)

(assert (=> b!1277201 (= e!729315 tp_is_empty!33295)))

(declare-fun b!1277202 () Bool)

(assert (=> b!1277202 (= e!729316 false)))

(declare-fun lt!575894 () Bool)

(declare-datatypes ((List!28657 0))(
  ( (Nil!28654) (Cons!28653 (h!29871 (_ BitVec 64)) (t!42185 List!28657)) )
))
(declare-fun arrayNoDuplicates!0 (array!83715 (_ BitVec 32) List!28657) Bool)

(assert (=> b!1277202 (= lt!575894 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28654))))

(declare-fun mapNonEmpty!51470 () Bool)

(declare-fun tp!98228 () Bool)

(assert (=> mapNonEmpty!51470 (= mapRes!51470 (and tp!98228 e!729315))))

(declare-fun mapValue!51470 () ValueCell!15749)

(declare-fun mapKey!51470 () (_ BitVec 32))

(declare-fun mapRest!51470 () (Array (_ BitVec 32) ValueCell!15749))

(assert (=> mapNonEmpty!51470 (= (arr!40366 _values!1187) (store mapRest!51470 mapKey!51470 mapValue!51470))))

(declare-fun res!848510 () Bool)

(assert (=> start!108246 (=> (not res!848510) (not e!729316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108246 (= res!848510 (validMask!0 mask!1805))))

(assert (=> start!108246 e!729316))

(assert (=> start!108246 true))

(declare-fun array_inv!30869 (array!83717) Bool)

(assert (=> start!108246 (and (array_inv!30869 _values!1187) e!729313)))

(declare-fun array_inv!30870 (array!83715) Bool)

(assert (=> start!108246 (array_inv!30870 _keys!1427)))

(assert (= (and start!108246 res!848510) b!1277197))

(assert (= (and b!1277197 res!848511) b!1277199))

(assert (= (and b!1277199 res!848512) b!1277202))

(assert (= (and b!1277198 condMapEmpty!51470) mapIsEmpty!51470))

(assert (= (and b!1277198 (not condMapEmpty!51470)) mapNonEmpty!51470))

(get-info :version)

(assert (= (and mapNonEmpty!51470 ((_ is ValueCellFull!15749) mapValue!51470)) b!1277201))

(assert (= (and b!1277198 ((_ is ValueCellFull!15749) mapDefault!51470)) b!1277200))

(assert (= start!108246 b!1277198))

(declare-fun m!1173591 () Bool)

(assert (=> b!1277199 m!1173591))

(declare-fun m!1173593 () Bool)

(assert (=> b!1277202 m!1173593))

(declare-fun m!1173595 () Bool)

(assert (=> mapNonEmpty!51470 m!1173595))

(declare-fun m!1173597 () Bool)

(assert (=> start!108246 m!1173597))

(declare-fun m!1173599 () Bool)

(assert (=> start!108246 m!1173599))

(declare-fun m!1173601 () Bool)

(assert (=> start!108246 m!1173601))

(check-sat (not b!1277199) (not b!1277202) (not mapNonEmpty!51470) tp_is_empty!33295 (not start!108246))
(check-sat)
