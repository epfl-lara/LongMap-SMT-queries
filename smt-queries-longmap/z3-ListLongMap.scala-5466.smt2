; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72562 () Bool)

(assert start!72562)

(declare-fun b!842316 () Bool)

(declare-fun res!572544 () Bool)

(declare-fun e!469822 () Bool)

(assert (=> b!842316 (=> (not res!572544) (not e!469822))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842316 (= res!572544 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25046 () Bool)

(declare-fun mapRes!25046 () Bool)

(declare-fun tp!48365 () Bool)

(declare-fun e!469821 () Bool)

(assert (=> mapNonEmpty!25046 (= mapRes!25046 (and tp!48365 e!469821))))

(declare-datatypes ((V!25889 0))(
  ( (V!25890 (val!7863 Int)) )
))
(declare-datatypes ((ValueCell!7376 0))(
  ( (ValueCellFull!7376 (v!10282 V!25889)) (EmptyCell!7376) )
))
(declare-fun mapRest!25046 () (Array (_ BitVec 32) ValueCell!7376))

(declare-fun mapKey!25046 () (_ BitVec 32))

(declare-fun mapValue!25046 () ValueCell!7376)

(declare-datatypes ((array!47515 0))(
  ( (array!47516 (arr!22789 (Array (_ BitVec 32) ValueCell!7376)) (size!23231 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47515)

(assert (=> mapNonEmpty!25046 (= (arr!22789 _values!688) (store mapRest!25046 mapKey!25046 mapValue!25046))))

(declare-fun b!842317 () Bool)

(declare-fun res!572547 () Bool)

(assert (=> b!842317 (=> (not res!572547) (not e!469822))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47517 0))(
  ( (array!47518 (arr!22790 (Array (_ BitVec 32) (_ BitVec 64))) (size!23232 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47517)

(assert (=> b!842317 (= res!572547 (and (= (size!23231 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23232 _keys!868) (size!23231 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842318 () Bool)

(declare-fun e!469820 () Bool)

(declare-fun e!469823 () Bool)

(assert (=> b!842318 (= e!469820 (and e!469823 mapRes!25046))))

(declare-fun condMapEmpty!25046 () Bool)

(declare-fun mapDefault!25046 () ValueCell!7376)

(assert (=> b!842318 (= condMapEmpty!25046 (= (arr!22789 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7376)) mapDefault!25046)))))

(declare-fun b!842320 () Bool)

(declare-fun tp_is_empty!15631 () Bool)

(assert (=> b!842320 (= e!469823 tp_is_empty!15631)))

(declare-fun mapIsEmpty!25046 () Bool)

(assert (=> mapIsEmpty!25046 mapRes!25046))

(declare-fun b!842321 () Bool)

(declare-fun res!572545 () Bool)

(assert (=> b!842321 (=> (not res!572545) (not e!469822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47517 (_ BitVec 32)) Bool)

(assert (=> b!842321 (= res!572545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842322 () Bool)

(assert (=> b!842322 (= e!469821 tp_is_empty!15631)))

(declare-fun res!572546 () Bool)

(assert (=> start!72562 (=> (not res!572546) (not e!469822))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72562 (= res!572546 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23232 _keys!868))))))

(assert (=> start!72562 e!469822))

(assert (=> start!72562 true))

(declare-fun array_inv!18204 (array!47517) Bool)

(assert (=> start!72562 (array_inv!18204 _keys!868)))

(declare-fun array_inv!18205 (array!47515) Bool)

(assert (=> start!72562 (and (array_inv!18205 _values!688) e!469820)))

(declare-fun b!842319 () Bool)

(assert (=> b!842319 (= e!469822 false)))

(declare-fun lt!380777 () Bool)

(declare-datatypes ((List!16227 0))(
  ( (Nil!16224) (Cons!16223 (h!17354 (_ BitVec 64)) (t!22589 List!16227)) )
))
(declare-fun arrayNoDuplicates!0 (array!47517 (_ BitVec 32) List!16227) Bool)

(assert (=> b!842319 (= lt!380777 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16224))))

(assert (= (and start!72562 res!572546) b!842316))

(assert (= (and b!842316 res!572544) b!842317))

(assert (= (and b!842317 res!572547) b!842321))

(assert (= (and b!842321 res!572545) b!842319))

(assert (= (and b!842318 condMapEmpty!25046) mapIsEmpty!25046))

(assert (= (and b!842318 (not condMapEmpty!25046)) mapNonEmpty!25046))

(get-info :version)

(assert (= (and mapNonEmpty!25046 ((_ is ValueCellFull!7376) mapValue!25046)) b!842322))

(assert (= (and b!842318 ((_ is ValueCellFull!7376) mapDefault!25046)) b!842320))

(assert (= start!72562 b!842318))

(declare-fun m!784859 () Bool)

(assert (=> b!842319 m!784859))

(declare-fun m!784861 () Bool)

(assert (=> b!842316 m!784861))

(declare-fun m!784863 () Bool)

(assert (=> mapNonEmpty!25046 m!784863))

(declare-fun m!784865 () Bool)

(assert (=> start!72562 m!784865))

(declare-fun m!784867 () Bool)

(assert (=> start!72562 m!784867))

(declare-fun m!784869 () Bool)

(assert (=> b!842321 m!784869))

(check-sat (not b!842321) (not mapNonEmpty!25046) (not b!842316) tp_is_empty!15631 (not start!72562) (not b!842319))
(check-sat)
