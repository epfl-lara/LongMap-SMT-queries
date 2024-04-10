; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72324 () Bool)

(assert start!72324)

(declare-fun b!837923 () Bool)

(declare-fun res!569825 () Bool)

(declare-fun e!467725 () Bool)

(assert (=> b!837923 (=> (not res!569825) (not e!467725))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47044 0))(
  ( (array!47045 (arr!22553 (Array (_ BitVec 32) (_ BitVec 64))) (size!22993 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47044)

(declare-datatypes ((V!25547 0))(
  ( (V!25548 (val!7735 Int)) )
))
(declare-datatypes ((ValueCell!7248 0))(
  ( (ValueCellFull!7248 (v!10160 V!25547)) (EmptyCell!7248) )
))
(declare-datatypes ((array!47046 0))(
  ( (array!47047 (arr!22554 (Array (_ BitVec 32) ValueCell!7248)) (size!22994 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47046)

(assert (=> b!837923 (= res!569825 (and (= (size!22994 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22993 _keys!868) (size!22994 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837924 () Bool)

(declare-fun res!569824 () Bool)

(assert (=> b!837924 (=> (not res!569824) (not e!467725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837924 (= res!569824 (validMask!0 mask!1196))))

(declare-fun b!837925 () Bool)

(declare-fun e!467728 () Bool)

(declare-fun e!467724 () Bool)

(declare-fun mapRes!24662 () Bool)

(assert (=> b!837925 (= e!467728 (and e!467724 mapRes!24662))))

(declare-fun condMapEmpty!24662 () Bool)

(declare-fun mapDefault!24662 () ValueCell!7248)

(assert (=> b!837925 (= condMapEmpty!24662 (= (arr!22554 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7248)) mapDefault!24662)))))

(declare-fun mapIsEmpty!24662 () Bool)

(assert (=> mapIsEmpty!24662 mapRes!24662))

(declare-fun b!837926 () Bool)

(declare-fun res!569822 () Bool)

(assert (=> b!837926 (=> (not res!569822) (not e!467725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47044 (_ BitVec 32)) Bool)

(assert (=> b!837926 (= res!569822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837927 () Bool)

(declare-fun e!467727 () Bool)

(declare-fun tp_is_empty!15375 () Bool)

(assert (=> b!837927 (= e!467727 tp_is_empty!15375)))

(declare-fun b!837928 () Bool)

(assert (=> b!837928 (= e!467724 tp_is_empty!15375)))

(declare-fun b!837929 () Bool)

(assert (=> b!837929 (= e!467725 false)))

(declare-fun lt!380629 () Bool)

(declare-datatypes ((List!16042 0))(
  ( (Nil!16039) (Cons!16038 (h!17169 (_ BitVec 64)) (t!22413 List!16042)) )
))
(declare-fun arrayNoDuplicates!0 (array!47044 (_ BitVec 32) List!16042) Bool)

(assert (=> b!837929 (= lt!380629 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16039))))

(declare-fun res!569823 () Bool)

(assert (=> start!72324 (=> (not res!569823) (not e!467725))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72324 (= res!569823 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22993 _keys!868))))))

(assert (=> start!72324 e!467725))

(assert (=> start!72324 true))

(declare-fun array_inv!17972 (array!47044) Bool)

(assert (=> start!72324 (array_inv!17972 _keys!868)))

(declare-fun array_inv!17973 (array!47046) Bool)

(assert (=> start!72324 (and (array_inv!17973 _values!688) e!467728)))

(declare-fun mapNonEmpty!24662 () Bool)

(declare-fun tp!47656 () Bool)

(assert (=> mapNonEmpty!24662 (= mapRes!24662 (and tp!47656 e!467727))))

(declare-fun mapRest!24662 () (Array (_ BitVec 32) ValueCell!7248))

(declare-fun mapKey!24662 () (_ BitVec 32))

(declare-fun mapValue!24662 () ValueCell!7248)

(assert (=> mapNonEmpty!24662 (= (arr!22554 _values!688) (store mapRest!24662 mapKey!24662 mapValue!24662))))

(assert (= (and start!72324 res!569823) b!837924))

(assert (= (and b!837924 res!569824) b!837923))

(assert (= (and b!837923 res!569825) b!837926))

(assert (= (and b!837926 res!569822) b!837929))

(assert (= (and b!837925 condMapEmpty!24662) mapIsEmpty!24662))

(assert (= (and b!837925 (not condMapEmpty!24662)) mapNonEmpty!24662))

(get-info :version)

(assert (= (and mapNonEmpty!24662 ((_ is ValueCellFull!7248) mapValue!24662)) b!837927))

(assert (= (and b!837925 ((_ is ValueCellFull!7248) mapDefault!24662)) b!837928))

(assert (= start!72324 b!837925))

(declare-fun m!782565 () Bool)

(assert (=> b!837924 m!782565))

(declare-fun m!782567 () Bool)

(assert (=> start!72324 m!782567))

(declare-fun m!782569 () Bool)

(assert (=> start!72324 m!782569))

(declare-fun m!782571 () Bool)

(assert (=> b!837926 m!782571))

(declare-fun m!782573 () Bool)

(assert (=> b!837929 m!782573))

(declare-fun m!782575 () Bool)

(assert (=> mapNonEmpty!24662 m!782575))

(check-sat (not start!72324) tp_is_empty!15375 (not b!837926) (not mapNonEmpty!24662) (not b!837929) (not b!837924))
(check-sat)
