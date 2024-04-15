; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72574 () Bool)

(assert start!72574)

(declare-fun b!842442 () Bool)

(declare-fun e!469910 () Bool)

(declare-fun tp_is_empty!15643 () Bool)

(assert (=> b!842442 (= e!469910 tp_is_empty!15643)))

(declare-fun res!572618 () Bool)

(declare-fun e!469911 () Bool)

(assert (=> start!72574 (=> (not res!572618) (not e!469911))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47537 0))(
  ( (array!47538 (arr!22800 (Array (_ BitVec 32) (_ BitVec 64))) (size!23242 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47537)

(assert (=> start!72574 (= res!572618 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23242 _keys!868))))))

(assert (=> start!72574 e!469911))

(assert (=> start!72574 true))

(declare-fun array_inv!18210 (array!47537) Bool)

(assert (=> start!72574 (array_inv!18210 _keys!868)))

(declare-datatypes ((V!25905 0))(
  ( (V!25906 (val!7869 Int)) )
))
(declare-datatypes ((ValueCell!7382 0))(
  ( (ValueCellFull!7382 (v!10288 V!25905)) (EmptyCell!7382) )
))
(declare-datatypes ((array!47539 0))(
  ( (array!47540 (arr!22801 (Array (_ BitVec 32) ValueCell!7382)) (size!23243 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47539)

(declare-fun e!469914 () Bool)

(declare-fun array_inv!18211 (array!47539) Bool)

(assert (=> start!72574 (and (array_inv!18211 _values!688) e!469914)))

(declare-fun b!842443 () Bool)

(declare-fun e!469913 () Bool)

(declare-fun mapRes!25064 () Bool)

(assert (=> b!842443 (= e!469914 (and e!469913 mapRes!25064))))

(declare-fun condMapEmpty!25064 () Bool)

(declare-fun mapDefault!25064 () ValueCell!7382)

(assert (=> b!842443 (= condMapEmpty!25064 (= (arr!22801 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7382)) mapDefault!25064)))))

(declare-fun b!842444 () Bool)

(declare-fun res!572617 () Bool)

(assert (=> b!842444 (=> (not res!572617) (not e!469911))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!842444 (= res!572617 (and (= (size!23243 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23242 _keys!868) (size!23243 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842445 () Bool)

(declare-fun res!572619 () Bool)

(assert (=> b!842445 (=> (not res!572619) (not e!469911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842445 (= res!572619 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25064 () Bool)

(declare-fun tp!48383 () Bool)

(assert (=> mapNonEmpty!25064 (= mapRes!25064 (and tp!48383 e!469910))))

(declare-fun mapValue!25064 () ValueCell!7382)

(declare-fun mapKey!25064 () (_ BitVec 32))

(declare-fun mapRest!25064 () (Array (_ BitVec 32) ValueCell!7382))

(assert (=> mapNonEmpty!25064 (= (arr!22801 _values!688) (store mapRest!25064 mapKey!25064 mapValue!25064))))

(declare-fun b!842446 () Bool)

(assert (=> b!842446 (= e!469911 false)))

(declare-fun lt!380795 () Bool)

(declare-datatypes ((List!16230 0))(
  ( (Nil!16227) (Cons!16226 (h!17357 (_ BitVec 64)) (t!22592 List!16230)) )
))
(declare-fun arrayNoDuplicates!0 (array!47537 (_ BitVec 32) List!16230) Bool)

(assert (=> b!842446 (= lt!380795 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16227))))

(declare-fun mapIsEmpty!25064 () Bool)

(assert (=> mapIsEmpty!25064 mapRes!25064))

(declare-fun b!842447 () Bool)

(assert (=> b!842447 (= e!469913 tp_is_empty!15643)))

(declare-fun b!842448 () Bool)

(declare-fun res!572616 () Bool)

(assert (=> b!842448 (=> (not res!572616) (not e!469911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47537 (_ BitVec 32)) Bool)

(assert (=> b!842448 (= res!572616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72574 res!572618) b!842445))

(assert (= (and b!842445 res!572619) b!842444))

(assert (= (and b!842444 res!572617) b!842448))

(assert (= (and b!842448 res!572616) b!842446))

(assert (= (and b!842443 condMapEmpty!25064) mapIsEmpty!25064))

(assert (= (and b!842443 (not condMapEmpty!25064)) mapNonEmpty!25064))

(get-info :version)

(assert (= (and mapNonEmpty!25064 ((_ is ValueCellFull!7382) mapValue!25064)) b!842442))

(assert (= (and b!842443 ((_ is ValueCellFull!7382) mapDefault!25064)) b!842447))

(assert (= start!72574 b!842443))

(declare-fun m!784931 () Bool)

(assert (=> mapNonEmpty!25064 m!784931))

(declare-fun m!784933 () Bool)

(assert (=> b!842446 m!784933))

(declare-fun m!784935 () Bool)

(assert (=> b!842448 m!784935))

(declare-fun m!784937 () Bool)

(assert (=> b!842445 m!784937))

(declare-fun m!784939 () Bool)

(assert (=> start!72574 m!784939))

(declare-fun m!784941 () Bool)

(assert (=> start!72574 m!784941))

(check-sat (not b!842448) (not b!842446) tp_is_empty!15643 (not b!842445) (not start!72574) (not mapNonEmpty!25064))
(check-sat)
