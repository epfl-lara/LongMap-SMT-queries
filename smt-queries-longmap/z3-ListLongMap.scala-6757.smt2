; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84796 () Bool)

(assert start!84796)

(declare-fun mapNonEmpty!37035 () Bool)

(declare-fun mapRes!37035 () Bool)

(declare-fun tp!70106 () Bool)

(declare-fun e!559092 () Bool)

(assert (=> mapNonEmpty!37035 (= mapRes!37035 (and tp!70106 e!559092))))

(declare-fun mapKey!37035 () (_ BitVec 32))

(declare-datatypes ((V!36075 0))(
  ( (V!36076 (val!11710 Int)) )
))
(declare-datatypes ((ValueCell!11178 0))(
  ( (ValueCellFull!11178 (v!14286 V!36075)) (EmptyCell!11178) )
))
(declare-fun mapValue!37035 () ValueCell!11178)

(declare-fun mapRest!37035 () (Array (_ BitVec 32) ValueCell!11178))

(declare-datatypes ((array!62601 0))(
  ( (array!62602 (arr!30150 (Array (_ BitVec 32) ValueCell!11178)) (size!30629 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62601)

(assert (=> mapNonEmpty!37035 (= (arr!30150 _values!1551) (store mapRest!37035 mapKey!37035 mapValue!37035))))

(declare-fun b!991421 () Bool)

(declare-fun e!559091 () Bool)

(declare-fun e!559090 () Bool)

(assert (=> b!991421 (= e!559091 (and e!559090 mapRes!37035))))

(declare-fun condMapEmpty!37035 () Bool)

(declare-fun mapDefault!37035 () ValueCell!11178)

(assert (=> b!991421 (= condMapEmpty!37035 (= (arr!30150 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11178)) mapDefault!37035)))))

(declare-fun res!662749 () Bool)

(declare-fun e!559093 () Bool)

(assert (=> start!84796 (=> (not res!662749) (not e!559093))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84796 (= res!662749 (validMask!0 mask!2471))))

(assert (=> start!84796 e!559093))

(assert (=> start!84796 true))

(declare-fun array_inv!23283 (array!62601) Bool)

(assert (=> start!84796 (and (array_inv!23283 _values!1551) e!559091)))

(declare-datatypes ((array!62603 0))(
  ( (array!62604 (arr!30151 (Array (_ BitVec 32) (_ BitVec 64))) (size!30630 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62603)

(declare-fun array_inv!23284 (array!62603) Bool)

(assert (=> start!84796 (array_inv!23284 _keys!1945)))

(declare-fun b!991422 () Bool)

(declare-fun tp_is_empty!23319 () Bool)

(assert (=> b!991422 (= e!559090 tp_is_empty!23319)))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun b!991423 () Bool)

(assert (=> b!991423 (= e!559093 (and (= (size!30629 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30630 _keys!1945) (size!30629 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011) (not (= (size!30630 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471)))))))

(declare-fun b!991424 () Bool)

(assert (=> b!991424 (= e!559092 tp_is_empty!23319)))

(declare-fun mapIsEmpty!37035 () Bool)

(assert (=> mapIsEmpty!37035 mapRes!37035))

(assert (= (and start!84796 res!662749) b!991423))

(assert (= (and b!991421 condMapEmpty!37035) mapIsEmpty!37035))

(assert (= (and b!991421 (not condMapEmpty!37035)) mapNonEmpty!37035))

(get-info :version)

(assert (= (and mapNonEmpty!37035 ((_ is ValueCellFull!11178) mapValue!37035)) b!991424))

(assert (= (and b!991421 ((_ is ValueCellFull!11178) mapDefault!37035)) b!991422))

(assert (= start!84796 b!991421))

(declare-fun m!919381 () Bool)

(assert (=> mapNonEmpty!37035 m!919381))

(declare-fun m!919383 () Bool)

(assert (=> start!84796 m!919383))

(declare-fun m!919385 () Bool)

(assert (=> start!84796 m!919385))

(declare-fun m!919387 () Bool)

(assert (=> start!84796 m!919387))

(check-sat (not start!84796) (not mapNonEmpty!37035) tp_is_empty!23319)
(check-sat)