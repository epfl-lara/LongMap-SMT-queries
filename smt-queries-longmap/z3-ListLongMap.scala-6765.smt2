; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84888 () Bool)

(assert start!84888)

(declare-fun b!991989 () Bool)

(declare-fun e!559546 () Bool)

(assert (=> b!991989 (= e!559546 false)))

(declare-fun lt!440038 () Bool)

(declare-datatypes ((array!62703 0))(
  ( (array!62704 (arr!30196 (Array (_ BitVec 32) (_ BitVec 64))) (size!30675 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62703)

(declare-datatypes ((List!20869 0))(
  ( (Nil!20866) (Cons!20865 (h!22027 (_ BitVec 64)) (t!29852 List!20869)) )
))
(declare-fun arrayNoDuplicates!0 (array!62703 (_ BitVec 32) List!20869) Bool)

(assert (=> b!991989 (= lt!440038 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20866))))

(declare-fun b!991990 () Bool)

(declare-fun e!559548 () Bool)

(declare-fun tp_is_empty!23367 () Bool)

(assert (=> b!991990 (= e!559548 tp_is_empty!23367)))

(declare-fun b!991992 () Bool)

(declare-fun e!559545 () Bool)

(assert (=> b!991992 (= e!559545 tp_is_empty!23367)))

(declare-fun mapIsEmpty!37122 () Bool)

(declare-fun mapRes!37122 () Bool)

(assert (=> mapIsEmpty!37122 mapRes!37122))

(declare-fun mapNonEmpty!37122 () Bool)

(declare-fun tp!70193 () Bool)

(assert (=> mapNonEmpty!37122 (= mapRes!37122 (and tp!70193 e!559545))))

(declare-fun mapKey!37122 () (_ BitVec 32))

(declare-datatypes ((V!36139 0))(
  ( (V!36140 (val!11734 Int)) )
))
(declare-datatypes ((ValueCell!11202 0))(
  ( (ValueCellFull!11202 (v!14311 V!36139)) (EmptyCell!11202) )
))
(declare-fun mapValue!37122 () ValueCell!11202)

(declare-fun mapRest!37122 () (Array (_ BitVec 32) ValueCell!11202))

(declare-datatypes ((array!62705 0))(
  ( (array!62706 (arr!30197 (Array (_ BitVec 32) ValueCell!11202)) (size!30676 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62705)

(assert (=> mapNonEmpty!37122 (= (arr!30197 _values!1551) (store mapRest!37122 mapKey!37122 mapValue!37122))))

(declare-fun b!991993 () Bool)

(declare-fun res!663037 () Bool)

(assert (=> b!991993 (=> (not res!663037) (not e!559546))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun mask!2471 () (_ BitVec 32))

(assert (=> b!991993 (= res!663037 (and (= (size!30676 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30675 _keys!1945) (size!30676 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991994 () Bool)

(declare-fun res!663039 () Bool)

(assert (=> b!991994 (=> (not res!663039) (not e!559546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62703 (_ BitVec 32)) Bool)

(assert (=> b!991994 (= res!663039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991991 () Bool)

(declare-fun e!559547 () Bool)

(assert (=> b!991991 (= e!559547 (and e!559548 mapRes!37122))))

(declare-fun condMapEmpty!37122 () Bool)

(declare-fun mapDefault!37122 () ValueCell!11202)

(assert (=> b!991991 (= condMapEmpty!37122 (= (arr!30197 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11202)) mapDefault!37122)))))

(declare-fun res!663038 () Bool)

(assert (=> start!84888 (=> (not res!663038) (not e!559546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84888 (= res!663038 (validMask!0 mask!2471))))

(assert (=> start!84888 e!559546))

(assert (=> start!84888 true))

(declare-fun array_inv!23323 (array!62705) Bool)

(assert (=> start!84888 (and (array_inv!23323 _values!1551) e!559547)))

(declare-fun array_inv!23324 (array!62703) Bool)

(assert (=> start!84888 (array_inv!23324 _keys!1945)))

(assert (= (and start!84888 res!663038) b!991993))

(assert (= (and b!991993 res!663037) b!991994))

(assert (= (and b!991994 res!663039) b!991989))

(assert (= (and b!991991 condMapEmpty!37122) mapIsEmpty!37122))

(assert (= (and b!991991 (not condMapEmpty!37122)) mapNonEmpty!37122))

(get-info :version)

(assert (= (and mapNonEmpty!37122 ((_ is ValueCellFull!11202) mapValue!37122)) b!991992))

(assert (= (and b!991991 ((_ is ValueCellFull!11202) mapDefault!37122)) b!991990))

(assert (= start!84888 b!991991))

(declare-fun m!919731 () Bool)

(assert (=> b!991989 m!919731))

(declare-fun m!919733 () Bool)

(assert (=> mapNonEmpty!37122 m!919733))

(declare-fun m!919735 () Bool)

(assert (=> b!991994 m!919735))

(declare-fun m!919737 () Bool)

(assert (=> start!84888 m!919737))

(declare-fun m!919739 () Bool)

(assert (=> start!84888 m!919739))

(declare-fun m!919741 () Bool)

(assert (=> start!84888 m!919741))

(check-sat (not start!84888) tp_is_empty!23367 (not mapNonEmpty!37122) (not b!991994) (not b!991989))
(check-sat)
