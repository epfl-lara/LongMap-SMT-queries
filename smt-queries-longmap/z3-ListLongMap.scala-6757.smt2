; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84962 () Bool)

(assert start!84962)

(declare-fun mapIsEmpty!37032 () Bool)

(declare-fun mapRes!37032 () Bool)

(assert (=> mapIsEmpty!37032 mapRes!37032))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun e!559660 () Bool)

(declare-fun b!992312 () Bool)

(declare-datatypes ((V!36073 0))(
  ( (V!36074 (val!11709 Int)) )
))
(declare-datatypes ((ValueCell!11177 0))(
  ( (ValueCellFull!11177 (v!14282 V!36073)) (EmptyCell!11177) )
))
(declare-datatypes ((array!62644 0))(
  ( (array!62645 (arr!30167 (Array (_ BitVec 32) ValueCell!11177)) (size!30647 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62644)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62646 0))(
  ( (array!62647 (arr!30168 (Array (_ BitVec 32) (_ BitVec 64))) (size!30648 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62646)

(assert (=> b!992312 (= e!559660 (and (= (size!30647 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30648 _keys!1945) (size!30647 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011) (not (= (size!30648 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471)))))))

(declare-fun b!992313 () Bool)

(declare-fun e!559656 () Bool)

(declare-fun tp_is_empty!23317 () Bool)

(assert (=> b!992313 (= e!559656 tp_is_empty!23317)))

(declare-fun b!992314 () Bool)

(declare-fun e!559657 () Bool)

(assert (=> b!992314 (= e!559657 (and e!559656 mapRes!37032))))

(declare-fun condMapEmpty!37032 () Bool)

(declare-fun mapDefault!37032 () ValueCell!11177)

(assert (=> b!992314 (= condMapEmpty!37032 (= (arr!30167 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11177)) mapDefault!37032)))))

(declare-fun b!992315 () Bool)

(declare-fun e!559658 () Bool)

(assert (=> b!992315 (= e!559658 tp_is_empty!23317)))

(declare-fun mapNonEmpty!37032 () Bool)

(declare-fun tp!70104 () Bool)

(assert (=> mapNonEmpty!37032 (= mapRes!37032 (and tp!70104 e!559658))))

(declare-fun mapValue!37032 () ValueCell!11177)

(declare-fun mapKey!37032 () (_ BitVec 32))

(declare-fun mapRest!37032 () (Array (_ BitVec 32) ValueCell!11177))

(assert (=> mapNonEmpty!37032 (= (arr!30167 _values!1551) (store mapRest!37032 mapKey!37032 mapValue!37032))))

(declare-fun res!663090 () Bool)

(assert (=> start!84962 (=> (not res!663090) (not e!559660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84962 (= res!663090 (validMask!0 mask!2471))))

(assert (=> start!84962 e!559660))

(assert (=> start!84962 true))

(declare-fun array_inv!23321 (array!62644) Bool)

(assert (=> start!84962 (and (array_inv!23321 _values!1551) e!559657)))

(declare-fun array_inv!23322 (array!62646) Bool)

(assert (=> start!84962 (array_inv!23322 _keys!1945)))

(assert (= (and start!84962 res!663090) b!992312))

(assert (= (and b!992314 condMapEmpty!37032) mapIsEmpty!37032))

(assert (= (and b!992314 (not condMapEmpty!37032)) mapNonEmpty!37032))

(get-info :version)

(assert (= (and mapNonEmpty!37032 ((_ is ValueCellFull!11177) mapValue!37032)) b!992315))

(assert (= (and b!992314 ((_ is ValueCellFull!11177) mapDefault!37032)) b!992313))

(assert (= start!84962 b!992314))

(declare-fun m!920667 () Bool)

(assert (=> mapNonEmpty!37032 m!920667))

(declare-fun m!920669 () Bool)

(assert (=> start!84962 m!920669))

(declare-fun m!920671 () Bool)

(assert (=> start!84962 m!920671))

(declare-fun m!920673 () Bool)

(assert (=> start!84962 m!920673))

(check-sat (not start!84962) (not mapNonEmpty!37032) tp_is_empty!23317)
(check-sat)
