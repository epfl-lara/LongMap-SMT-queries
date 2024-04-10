; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72726 () Bool)

(assert start!72726)

(declare-fun b!844088 () Bool)

(declare-fun res!573532 () Bool)

(declare-fun e!471063 () Bool)

(assert (=> b!844088 (=> (not res!573532) (not e!471063))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844088 (= res!573532 (validMask!0 mask!1196))))

(declare-fun b!844090 () Bool)

(declare-fun res!573531 () Bool)

(assert (=> b!844090 (=> (not res!573531) (not e!471063))))

(declare-datatypes ((array!47792 0))(
  ( (array!47793 (arr!22927 (Array (_ BitVec 32) (_ BitVec 64))) (size!23367 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47792)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47792 (_ BitVec 32)) Bool)

(assert (=> b!844090 (= res!573531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844091 () Bool)

(declare-fun res!573533 () Bool)

(assert (=> b!844091 (=> (not res!573533) (not e!471063))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26083 0))(
  ( (V!26084 (val!7936 Int)) )
))
(declare-datatypes ((ValueCell!7449 0))(
  ( (ValueCellFull!7449 (v!10361 V!26083)) (EmptyCell!7449) )
))
(declare-datatypes ((array!47794 0))(
  ( (array!47795 (arr!22928 (Array (_ BitVec 32) ValueCell!7449)) (size!23368 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47794)

(assert (=> b!844091 (= res!573533 (and (= (size!23368 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23367 _keys!868) (size!23368 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844092 () Bool)

(declare-fun e!471064 () Bool)

(declare-fun tp_is_empty!15777 () Bool)

(assert (=> b!844092 (= e!471064 tp_is_empty!15777)))

(declare-fun b!844093 () Bool)

(declare-fun e!471065 () Bool)

(declare-fun e!471067 () Bool)

(declare-fun mapRes!25265 () Bool)

(assert (=> b!844093 (= e!471065 (and e!471067 mapRes!25265))))

(declare-fun condMapEmpty!25265 () Bool)

(declare-fun mapDefault!25265 () ValueCell!7449)

(assert (=> b!844093 (= condMapEmpty!25265 (= (arr!22928 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7449)) mapDefault!25265)))))

(declare-fun b!844089 () Bool)

(assert (=> b!844089 (= e!471063 false)))

(declare-fun lt!381232 () Bool)

(declare-datatypes ((List!16259 0))(
  ( (Nil!16256) (Cons!16255 (h!17386 (_ BitVec 64)) (t!22630 List!16259)) )
))
(declare-fun arrayNoDuplicates!0 (array!47792 (_ BitVec 32) List!16259) Bool)

(assert (=> b!844089 (= lt!381232 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16256))))

(declare-fun res!573530 () Bool)

(assert (=> start!72726 (=> (not res!573530) (not e!471063))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72726 (= res!573530 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23367 _keys!868))))))

(assert (=> start!72726 e!471063))

(assert (=> start!72726 true))

(declare-fun array_inv!18232 (array!47792) Bool)

(assert (=> start!72726 (array_inv!18232 _keys!868)))

(declare-fun array_inv!18233 (array!47794) Bool)

(assert (=> start!72726 (and (array_inv!18233 _values!688) e!471065)))

(declare-fun b!844094 () Bool)

(assert (=> b!844094 (= e!471067 tp_is_empty!15777)))

(declare-fun mapNonEmpty!25265 () Bool)

(declare-fun tp!48583 () Bool)

(assert (=> mapNonEmpty!25265 (= mapRes!25265 (and tp!48583 e!471064))))

(declare-fun mapRest!25265 () (Array (_ BitVec 32) ValueCell!7449))

(declare-fun mapValue!25265 () ValueCell!7449)

(declare-fun mapKey!25265 () (_ BitVec 32))

(assert (=> mapNonEmpty!25265 (= (arr!22928 _values!688) (store mapRest!25265 mapKey!25265 mapValue!25265))))

(declare-fun mapIsEmpty!25265 () Bool)

(assert (=> mapIsEmpty!25265 mapRes!25265))

(assert (= (and start!72726 res!573530) b!844088))

(assert (= (and b!844088 res!573532) b!844091))

(assert (= (and b!844091 res!573533) b!844090))

(assert (= (and b!844090 res!573531) b!844089))

(assert (= (and b!844093 condMapEmpty!25265) mapIsEmpty!25265))

(assert (= (and b!844093 (not condMapEmpty!25265)) mapNonEmpty!25265))

(get-info :version)

(assert (= (and mapNonEmpty!25265 ((_ is ValueCellFull!7449) mapValue!25265)) b!844092))

(assert (= (and b!844093 ((_ is ValueCellFull!7449) mapDefault!25265)) b!844094))

(assert (= start!72726 b!844093))

(declare-fun m!786489 () Bool)

(assert (=> start!72726 m!786489))

(declare-fun m!786491 () Bool)

(assert (=> start!72726 m!786491))

(declare-fun m!786493 () Bool)

(assert (=> b!844088 m!786493))

(declare-fun m!786495 () Bool)

(assert (=> mapNonEmpty!25265 m!786495))

(declare-fun m!786497 () Bool)

(assert (=> b!844090 m!786497))

(declare-fun m!786499 () Bool)

(assert (=> b!844089 m!786499))

(check-sat (not start!72726) (not mapNonEmpty!25265) (not b!844088) tp_is_empty!15777 (not b!844090) (not b!844089))
(check-sat)
