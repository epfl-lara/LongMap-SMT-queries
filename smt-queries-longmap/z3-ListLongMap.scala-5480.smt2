; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72832 () Bool)

(assert start!72832)

(declare-fun mapIsEmpty!25172 () Bool)

(declare-fun mapRes!25172 () Bool)

(assert (=> mapIsEmpty!25172 mapRes!25172))

(declare-fun b!844340 () Bool)

(declare-fun e!471180 () Bool)

(declare-fun tp_is_empty!15715 () Bool)

(assert (=> b!844340 (= e!471180 tp_is_empty!15715)))

(declare-fun b!844341 () Bool)

(declare-fun e!471184 () Bool)

(assert (=> b!844341 (= e!471184 (and e!471180 mapRes!25172))))

(declare-fun condMapEmpty!25172 () Bool)

(declare-datatypes ((V!26001 0))(
  ( (V!26002 (val!7905 Int)) )
))
(declare-datatypes ((ValueCell!7418 0))(
  ( (ValueCellFull!7418 (v!10330 V!26001)) (EmptyCell!7418) )
))
(declare-datatypes ((array!47711 0))(
  ( (array!47712 (arr!22882 (Array (_ BitVec 32) ValueCell!7418)) (size!23323 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47711)

(declare-fun mapDefault!25172 () ValueCell!7418)

(assert (=> b!844341 (= condMapEmpty!25172 (= (arr!22882 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7418)) mapDefault!25172)))))

(declare-fun b!844342 () Bool)

(declare-fun res!573502 () Bool)

(declare-fun e!471182 () Bool)

(assert (=> b!844342 (=> (not res!573502) (not e!471182))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844342 (= res!573502 (validMask!0 mask!1196))))

(declare-fun b!844344 () Bool)

(declare-fun res!573505 () Bool)

(assert (=> b!844344 (=> (not res!573505) (not e!471182))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47713 0))(
  ( (array!47714 (arr!22883 (Array (_ BitVec 32) (_ BitVec 64))) (size!23324 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47713)

(assert (=> b!844344 (= res!573505 (and (= (size!23323 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23324 _keys!868) (size!23323 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844345 () Bool)

(assert (=> b!844345 (= e!471182 false)))

(declare-fun lt!381500 () Bool)

(declare-datatypes ((List!16165 0))(
  ( (Nil!16162) (Cons!16161 (h!17298 (_ BitVec 64)) (t!22528 List!16165)) )
))
(declare-fun arrayNoDuplicates!0 (array!47713 (_ BitVec 32) List!16165) Bool)

(assert (=> b!844345 (= lt!381500 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16162))))

(declare-fun b!844346 () Bool)

(declare-fun res!573503 () Bool)

(assert (=> b!844346 (=> (not res!573503) (not e!471182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47713 (_ BitVec 32)) Bool)

(assert (=> b!844346 (= res!573503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25172 () Bool)

(declare-fun tp!48491 () Bool)

(declare-fun e!471183 () Bool)

(assert (=> mapNonEmpty!25172 (= mapRes!25172 (and tp!48491 e!471183))))

(declare-fun mapValue!25172 () ValueCell!7418)

(declare-fun mapKey!25172 () (_ BitVec 32))

(declare-fun mapRest!25172 () (Array (_ BitVec 32) ValueCell!7418))

(assert (=> mapNonEmpty!25172 (= (arr!22882 _values!688) (store mapRest!25172 mapKey!25172 mapValue!25172))))

(declare-fun res!573504 () Bool)

(assert (=> start!72832 (=> (not res!573504) (not e!471182))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72832 (= res!573504 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23324 _keys!868))))))

(assert (=> start!72832 e!471182))

(assert (=> start!72832 true))

(declare-fun array_inv!18252 (array!47713) Bool)

(assert (=> start!72832 (array_inv!18252 _keys!868)))

(declare-fun array_inv!18253 (array!47711) Bool)

(assert (=> start!72832 (and (array_inv!18253 _values!688) e!471184)))

(declare-fun b!844343 () Bool)

(assert (=> b!844343 (= e!471183 tp_is_empty!15715)))

(assert (= (and start!72832 res!573504) b!844342))

(assert (= (and b!844342 res!573502) b!844344))

(assert (= (and b!844344 res!573505) b!844346))

(assert (= (and b!844346 res!573503) b!844345))

(assert (= (and b!844341 condMapEmpty!25172) mapIsEmpty!25172))

(assert (= (and b!844341 (not condMapEmpty!25172)) mapNonEmpty!25172))

(get-info :version)

(assert (= (and mapNonEmpty!25172 ((_ is ValueCellFull!7418) mapValue!25172)) b!844343))

(assert (= (and b!844341 ((_ is ValueCellFull!7418) mapDefault!25172)) b!844340))

(assert (= start!72832 b!844341))

(declare-fun m!787409 () Bool)

(assert (=> start!72832 m!787409))

(declare-fun m!787411 () Bool)

(assert (=> start!72832 m!787411))

(declare-fun m!787413 () Bool)

(assert (=> mapNonEmpty!25172 m!787413))

(declare-fun m!787415 () Bool)

(assert (=> b!844346 m!787415))

(declare-fun m!787417 () Bool)

(assert (=> b!844345 m!787417))

(declare-fun m!787419 () Bool)

(assert (=> b!844342 m!787419))

(check-sat (not b!844346) (not mapNonEmpty!25172) (not b!844342) (not b!844345) (not start!72832) tp_is_empty!15715)
(check-sat)
