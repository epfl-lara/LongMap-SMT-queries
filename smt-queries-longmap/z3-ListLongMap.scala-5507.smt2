; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72994 () Bool)

(assert start!72994)

(declare-fun b!846041 () Bool)

(declare-fun res!574474 () Bool)

(declare-fun e!472396 () Bool)

(assert (=> b!846041 (=> (not res!574474) (not e!472396))))

(declare-datatypes ((array!48021 0))(
  ( (array!48022 (arr!23037 (Array (_ BitVec 32) (_ BitVec 64))) (size!23478 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48021)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48021 (_ BitVec 32)) Bool)

(assert (=> b!846041 (= res!574474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846042 () Bool)

(declare-fun e!472395 () Bool)

(declare-fun tp_is_empty!15877 () Bool)

(assert (=> b!846042 (= e!472395 tp_is_empty!15877)))

(declare-fun res!574475 () Bool)

(assert (=> start!72994 (=> (not res!574475) (not e!472396))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72994 (= res!574475 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23478 _keys!868))))))

(assert (=> start!72994 e!472396))

(assert (=> start!72994 true))

(declare-fun array_inv!18360 (array!48021) Bool)

(assert (=> start!72994 (array_inv!18360 _keys!868)))

(declare-datatypes ((V!26217 0))(
  ( (V!26218 (val!7986 Int)) )
))
(declare-datatypes ((ValueCell!7499 0))(
  ( (ValueCellFull!7499 (v!10411 V!26217)) (EmptyCell!7499) )
))
(declare-datatypes ((array!48023 0))(
  ( (array!48024 (arr!23038 (Array (_ BitVec 32) ValueCell!7499)) (size!23479 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48023)

(declare-fun e!472399 () Bool)

(declare-fun array_inv!18361 (array!48023) Bool)

(assert (=> start!72994 (and (array_inv!18361 _values!688) e!472399)))

(declare-fun b!846043 () Bool)

(declare-fun e!472398 () Bool)

(declare-fun mapRes!25415 () Bool)

(assert (=> b!846043 (= e!472399 (and e!472398 mapRes!25415))))

(declare-fun condMapEmpty!25415 () Bool)

(declare-fun mapDefault!25415 () ValueCell!7499)

(assert (=> b!846043 (= condMapEmpty!25415 (= (arr!23038 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7499)) mapDefault!25415)))))

(declare-fun b!846044 () Bool)

(declare-fun res!574476 () Bool)

(assert (=> b!846044 (=> (not res!574476) (not e!472396))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!846044 (= res!574476 (and (= (size!23479 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23478 _keys!868) (size!23479 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846045 () Bool)

(assert (=> b!846045 (= e!472396 false)))

(declare-fun lt!381743 () Bool)

(declare-datatypes ((List!16225 0))(
  ( (Nil!16222) (Cons!16221 (h!17358 (_ BitVec 64)) (t!22588 List!16225)) )
))
(declare-fun arrayNoDuplicates!0 (array!48021 (_ BitVec 32) List!16225) Bool)

(assert (=> b!846045 (= lt!381743 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16222))))

(declare-fun b!846046 () Bool)

(assert (=> b!846046 (= e!472398 tp_is_empty!15877)))

(declare-fun b!846047 () Bool)

(declare-fun res!574477 () Bool)

(assert (=> b!846047 (=> (not res!574477) (not e!472396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846047 (= res!574477 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25415 () Bool)

(declare-fun tp!48734 () Bool)

(assert (=> mapNonEmpty!25415 (= mapRes!25415 (and tp!48734 e!472395))))

(declare-fun mapValue!25415 () ValueCell!7499)

(declare-fun mapKey!25415 () (_ BitVec 32))

(declare-fun mapRest!25415 () (Array (_ BitVec 32) ValueCell!7499))

(assert (=> mapNonEmpty!25415 (= (arr!23038 _values!688) (store mapRest!25415 mapKey!25415 mapValue!25415))))

(declare-fun mapIsEmpty!25415 () Bool)

(assert (=> mapIsEmpty!25415 mapRes!25415))

(assert (= (and start!72994 res!574475) b!846047))

(assert (= (and b!846047 res!574477) b!846044))

(assert (= (and b!846044 res!574476) b!846041))

(assert (= (and b!846041 res!574474) b!846045))

(assert (= (and b!846043 condMapEmpty!25415) mapIsEmpty!25415))

(assert (= (and b!846043 (not condMapEmpty!25415)) mapNonEmpty!25415))

(get-info :version)

(assert (= (and mapNonEmpty!25415 ((_ is ValueCellFull!7499) mapValue!25415)) b!846042))

(assert (= (and b!846043 ((_ is ValueCellFull!7499) mapDefault!25415)) b!846046))

(assert (= start!72994 b!846043))

(declare-fun m!788381 () Bool)

(assert (=> b!846045 m!788381))

(declare-fun m!788383 () Bool)

(assert (=> b!846047 m!788383))

(declare-fun m!788385 () Bool)

(assert (=> mapNonEmpty!25415 m!788385))

(declare-fun m!788387 () Bool)

(assert (=> start!72994 m!788387))

(declare-fun m!788389 () Bool)

(assert (=> start!72994 m!788389))

(declare-fun m!788391 () Bool)

(assert (=> b!846041 m!788391))

(check-sat (not b!846047) (not b!846045) tp_is_empty!15877 (not mapNonEmpty!25415) (not start!72994) (not b!846041))
(check-sat)
