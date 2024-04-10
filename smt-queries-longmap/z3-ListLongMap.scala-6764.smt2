; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84882 () Bool)

(assert start!84882)

(declare-fun res!663006 () Bool)

(declare-fun e!559501 () Bool)

(assert (=> start!84882 (=> (not res!663006) (not e!559501))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84882 (= res!663006 (validMask!0 mask!2471))))

(assert (=> start!84882 e!559501))

(assert (=> start!84882 true))

(declare-datatypes ((V!36131 0))(
  ( (V!36132 (val!11731 Int)) )
))
(declare-datatypes ((ValueCell!11199 0))(
  ( (ValueCellFull!11199 (v!14308 V!36131)) (EmptyCell!11199) )
))
(declare-datatypes ((array!62691 0))(
  ( (array!62692 (arr!30190 (Array (_ BitVec 32) ValueCell!11199)) (size!30669 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62691)

(declare-fun e!559500 () Bool)

(declare-fun array_inv!23317 (array!62691) Bool)

(assert (=> start!84882 (and (array_inv!23317 _values!1551) e!559500)))

(declare-datatypes ((array!62693 0))(
  ( (array!62694 (arr!30191 (Array (_ BitVec 32) (_ BitVec 64))) (size!30670 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62693)

(declare-fun array_inv!23318 (array!62693) Bool)

(assert (=> start!84882 (array_inv!23318 _keys!1945)))

(declare-fun mapIsEmpty!37113 () Bool)

(declare-fun mapRes!37113 () Bool)

(assert (=> mapIsEmpty!37113 mapRes!37113))

(declare-fun b!991927 () Bool)

(declare-fun e!559503 () Bool)

(declare-fun tp_is_empty!23361 () Bool)

(assert (=> b!991927 (= e!559503 tp_is_empty!23361)))

(declare-fun b!991928 () Bool)

(assert (=> b!991928 (= e!559501 (not (= (size!30670 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471))))))

(declare-fun b!991929 () Bool)

(declare-fun res!663003 () Bool)

(assert (=> b!991929 (=> (not res!663003) (not e!559501))))

(declare-datatypes ((List!20867 0))(
  ( (Nil!20864) (Cons!20863 (h!22025 (_ BitVec 64)) (t!29850 List!20867)) )
))
(declare-fun arrayNoDuplicates!0 (array!62693 (_ BitVec 32) List!20867) Bool)

(assert (=> b!991929 (= res!663003 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20864))))

(declare-fun b!991930 () Bool)

(declare-fun e!559499 () Bool)

(assert (=> b!991930 (= e!559499 tp_is_empty!23361)))

(declare-fun b!991931 () Bool)

(assert (=> b!991931 (= e!559500 (and e!559503 mapRes!37113))))

(declare-fun condMapEmpty!37113 () Bool)

(declare-fun mapDefault!37113 () ValueCell!11199)

(assert (=> b!991931 (= condMapEmpty!37113 (= (arr!30190 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11199)) mapDefault!37113)))))

(declare-fun b!991932 () Bool)

(declare-fun res!663004 () Bool)

(assert (=> b!991932 (=> (not res!663004) (not e!559501))))

(declare-fun k0!1425 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991932 (= res!663004 (validKeyInArray!0 k0!1425))))

(declare-fun b!991933 () Bool)

(declare-fun res!663005 () Bool)

(assert (=> b!991933 (=> (not res!663005) (not e!559501))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991933 (= res!663005 (and (= (size!30669 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30670 _keys!1945) (size!30669 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991934 () Bool)

(declare-fun res!663002 () Bool)

(assert (=> b!991934 (=> (not res!663002) (not e!559501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62693 (_ BitVec 32)) Bool)

(assert (=> b!991934 (= res!663002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun mapNonEmpty!37113 () Bool)

(declare-fun tp!70184 () Bool)

(assert (=> mapNonEmpty!37113 (= mapRes!37113 (and tp!70184 e!559499))))

(declare-fun mapKey!37113 () (_ BitVec 32))

(declare-fun mapValue!37113 () ValueCell!11199)

(declare-fun mapRest!37113 () (Array (_ BitVec 32) ValueCell!11199))

(assert (=> mapNonEmpty!37113 (= (arr!30190 _values!1551) (store mapRest!37113 mapKey!37113 mapValue!37113))))

(assert (= (and start!84882 res!663006) b!991933))

(assert (= (and b!991933 res!663005) b!991934))

(assert (= (and b!991934 res!663002) b!991929))

(assert (= (and b!991929 res!663003) b!991932))

(assert (= (and b!991932 res!663004) b!991928))

(assert (= (and b!991931 condMapEmpty!37113) mapIsEmpty!37113))

(assert (= (and b!991931 (not condMapEmpty!37113)) mapNonEmpty!37113))

(get-info :version)

(assert (= (and mapNonEmpty!37113 ((_ is ValueCellFull!11199) mapValue!37113)) b!991930))

(assert (= (and b!991931 ((_ is ValueCellFull!11199) mapDefault!37113)) b!991927))

(assert (= start!84882 b!991931))

(declare-fun m!919691 () Bool)

(assert (=> b!991932 m!919691))

(declare-fun m!919693 () Bool)

(assert (=> start!84882 m!919693))

(declare-fun m!919695 () Bool)

(assert (=> start!84882 m!919695))

(declare-fun m!919697 () Bool)

(assert (=> start!84882 m!919697))

(declare-fun m!919699 () Bool)

(assert (=> mapNonEmpty!37113 m!919699))

(declare-fun m!919701 () Bool)

(assert (=> b!991929 m!919701))

(declare-fun m!919703 () Bool)

(assert (=> b!991934 m!919703))

(check-sat (not b!991929) (not start!84882) (not b!991934) (not mapNonEmpty!37113) tp_is_empty!23361 (not b!991932))
(check-sat)
