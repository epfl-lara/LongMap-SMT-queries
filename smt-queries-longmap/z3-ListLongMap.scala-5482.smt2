; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72658 () Bool)

(assert start!72658)

(declare-fun res!573120 () Bool)

(declare-fun e!470540 () Bool)

(assert (=> start!72658 (=> (not res!573120) (not e!470540))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47693 0))(
  ( (array!47694 (arr!22878 (Array (_ BitVec 32) (_ BitVec 64))) (size!23320 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47693)

(assert (=> start!72658 (= res!573120 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23320 _keys!868))))))

(assert (=> start!72658 e!470540))

(assert (=> start!72658 true))

(declare-fun array_inv!18272 (array!47693) Bool)

(assert (=> start!72658 (array_inv!18272 _keys!868)))

(declare-datatypes ((V!26017 0))(
  ( (V!26018 (val!7911 Int)) )
))
(declare-datatypes ((ValueCell!7424 0))(
  ( (ValueCellFull!7424 (v!10330 V!26017)) (EmptyCell!7424) )
))
(declare-datatypes ((array!47695 0))(
  ( (array!47696 (arr!22879 (Array (_ BitVec 32) ValueCell!7424)) (size!23321 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47695)

(declare-fun e!470543 () Bool)

(declare-fun array_inv!18273 (array!47695) Bool)

(assert (=> start!72658 (and (array_inv!18273 _values!688) e!470543)))

(declare-fun b!843324 () Bool)

(declare-fun res!573121 () Bool)

(assert (=> b!843324 (=> (not res!573121) (not e!470540))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!843324 (= res!573121 (and (= (size!23321 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23320 _keys!868) (size!23321 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843325 () Bool)

(declare-fun e!470542 () Bool)

(declare-fun tp_is_empty!15727 () Bool)

(assert (=> b!843325 (= e!470542 tp_is_empty!15727)))

(declare-fun b!843326 () Bool)

(declare-fun res!573123 () Bool)

(assert (=> b!843326 (=> (not res!573123) (not e!470540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47693 (_ BitVec 32)) Bool)

(assert (=> b!843326 (= res!573123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843327 () Bool)

(declare-fun res!573122 () Bool)

(assert (=> b!843327 (=> (not res!573122) (not e!470540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843327 (= res!573122 (validMask!0 mask!1196))))

(declare-fun b!843328 () Bool)

(assert (=> b!843328 (= e!470540 false)))

(declare-fun lt!380921 () Bool)

(declare-datatypes ((List!16261 0))(
  ( (Nil!16258) (Cons!16257 (h!17388 (_ BitVec 64)) (t!22623 List!16261)) )
))
(declare-fun arrayNoDuplicates!0 (array!47693 (_ BitVec 32) List!16261) Bool)

(assert (=> b!843328 (= lt!380921 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16258))))

(declare-fun b!843329 () Bool)

(declare-fun e!470541 () Bool)

(declare-fun mapRes!25190 () Bool)

(assert (=> b!843329 (= e!470543 (and e!470541 mapRes!25190))))

(declare-fun condMapEmpty!25190 () Bool)

(declare-fun mapDefault!25190 () ValueCell!7424)

(assert (=> b!843329 (= condMapEmpty!25190 (= (arr!22879 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7424)) mapDefault!25190)))))

(declare-fun mapIsEmpty!25190 () Bool)

(assert (=> mapIsEmpty!25190 mapRes!25190))

(declare-fun b!843330 () Bool)

(assert (=> b!843330 (= e!470541 tp_is_empty!15727)))

(declare-fun mapNonEmpty!25190 () Bool)

(declare-fun tp!48509 () Bool)

(assert (=> mapNonEmpty!25190 (= mapRes!25190 (and tp!48509 e!470542))))

(declare-fun mapKey!25190 () (_ BitVec 32))

(declare-fun mapValue!25190 () ValueCell!7424)

(declare-fun mapRest!25190 () (Array (_ BitVec 32) ValueCell!7424))

(assert (=> mapNonEmpty!25190 (= (arr!22879 _values!688) (store mapRest!25190 mapKey!25190 mapValue!25190))))

(assert (= (and start!72658 res!573120) b!843327))

(assert (= (and b!843327 res!573122) b!843324))

(assert (= (and b!843324 res!573121) b!843326))

(assert (= (and b!843326 res!573123) b!843328))

(assert (= (and b!843329 condMapEmpty!25190) mapIsEmpty!25190))

(assert (= (and b!843329 (not condMapEmpty!25190)) mapNonEmpty!25190))

(get-info :version)

(assert (= (and mapNonEmpty!25190 ((_ is ValueCellFull!7424) mapValue!25190)) b!843325))

(assert (= (and b!843329 ((_ is ValueCellFull!7424) mapDefault!25190)) b!843330))

(assert (= start!72658 b!843329))

(declare-fun m!785435 () Bool)

(assert (=> start!72658 m!785435))

(declare-fun m!785437 () Bool)

(assert (=> start!72658 m!785437))

(declare-fun m!785439 () Bool)

(assert (=> mapNonEmpty!25190 m!785439))

(declare-fun m!785441 () Bool)

(assert (=> b!843327 m!785441))

(declare-fun m!785443 () Bool)

(assert (=> b!843326 m!785443))

(declare-fun m!785445 () Bool)

(assert (=> b!843328 m!785445))

(check-sat (not b!843326) (not start!72658) tp_is_empty!15727 (not mapNonEmpty!25190) (not b!843327) (not b!843328))
(check-sat)
