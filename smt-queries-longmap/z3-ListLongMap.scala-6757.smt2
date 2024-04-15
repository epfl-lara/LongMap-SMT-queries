; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84776 () Bool)

(assert start!84776)

(declare-fun b!991170 () Bool)

(declare-fun e!558928 () Bool)

(declare-fun tp_is_empty!23317 () Bool)

(assert (=> b!991170 (= e!558928 tp_is_empty!23317)))

(declare-fun mapNonEmpty!37032 () Bool)

(declare-fun mapRes!37032 () Bool)

(declare-fun tp!70104 () Bool)

(declare-fun e!558929 () Bool)

(assert (=> mapNonEmpty!37032 (= mapRes!37032 (and tp!70104 e!558929))))

(declare-fun mapKey!37032 () (_ BitVec 32))

(declare-datatypes ((V!36073 0))(
  ( (V!36074 (val!11709 Int)) )
))
(declare-datatypes ((ValueCell!11177 0))(
  ( (ValueCellFull!11177 (v!14284 V!36073)) (EmptyCell!11177) )
))
(declare-fun mapRest!37032 () (Array (_ BitVec 32) ValueCell!11177))

(declare-datatypes ((array!62528 0))(
  ( (array!62529 (arr!30114 (Array (_ BitVec 32) ValueCell!11177)) (size!30595 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62528)

(declare-fun mapValue!37032 () ValueCell!11177)

(assert (=> mapNonEmpty!37032 (= (arr!30114 _values!1551) (store mapRest!37032 mapKey!37032 mapValue!37032))))

(declare-fun res!662636 () Bool)

(declare-fun e!558927 () Bool)

(assert (=> start!84776 (=> (not res!662636) (not e!558927))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84776 (= res!662636 (validMask!0 mask!2471))))

(assert (=> start!84776 e!558927))

(assert (=> start!84776 true))

(declare-fun e!558926 () Bool)

(declare-fun array_inv!23271 (array!62528) Bool)

(assert (=> start!84776 (and (array_inv!23271 _values!1551) e!558926)))

(declare-datatypes ((array!62530 0))(
  ( (array!62531 (arr!30115 (Array (_ BitVec 32) (_ BitVec 64))) (size!30596 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62530)

(declare-fun array_inv!23272 (array!62530) Bool)

(assert (=> start!84776 (array_inv!23272 _keys!1945)))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun b!991171 () Bool)

(assert (=> b!991171 (= e!558927 (and (= (size!30595 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30596 _keys!1945) (size!30595 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011) (not (= (size!30596 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471)))))))

(declare-fun b!991172 () Bool)

(assert (=> b!991172 (= e!558926 (and e!558928 mapRes!37032))))

(declare-fun condMapEmpty!37032 () Bool)

(declare-fun mapDefault!37032 () ValueCell!11177)

(assert (=> b!991172 (= condMapEmpty!37032 (= (arr!30114 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11177)) mapDefault!37032)))))

(declare-fun mapIsEmpty!37032 () Bool)

(assert (=> mapIsEmpty!37032 mapRes!37032))

(declare-fun b!991173 () Bool)

(assert (=> b!991173 (= e!558929 tp_is_empty!23317)))

(assert (= (and start!84776 res!662636) b!991171))

(assert (= (and b!991172 condMapEmpty!37032) mapIsEmpty!37032))

(assert (= (and b!991172 (not condMapEmpty!37032)) mapNonEmpty!37032))

(get-info :version)

(assert (= (and mapNonEmpty!37032 ((_ is ValueCellFull!11177) mapValue!37032)) b!991173))

(assert (= (and b!991172 ((_ is ValueCellFull!11177) mapDefault!37032)) b!991170))

(assert (= start!84776 b!991172))

(declare-fun m!918615 () Bool)

(assert (=> mapNonEmpty!37032 m!918615))

(declare-fun m!918617 () Bool)

(assert (=> start!84776 m!918617))

(declare-fun m!918619 () Bool)

(assert (=> start!84776 m!918619))

(declare-fun m!918621 () Bool)

(assert (=> start!84776 m!918621))

(check-sat (not start!84776) (not mapNonEmpty!37032) tp_is_empty!23317)
(check-sat)
