; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72838 () Bool)

(assert start!72838)

(declare-fun b!844403 () Bool)

(declare-fun e!471226 () Bool)

(declare-fun tp_is_empty!15721 () Bool)

(assert (=> b!844403 (= e!471226 tp_is_empty!15721)))

(declare-fun mapNonEmpty!25181 () Bool)

(declare-fun mapRes!25181 () Bool)

(declare-fun tp!48500 () Bool)

(assert (=> mapNonEmpty!25181 (= mapRes!25181 (and tp!48500 e!471226))))

(declare-fun mapKey!25181 () (_ BitVec 32))

(declare-datatypes ((V!26009 0))(
  ( (V!26010 (val!7908 Int)) )
))
(declare-datatypes ((ValueCell!7421 0))(
  ( (ValueCellFull!7421 (v!10333 V!26009)) (EmptyCell!7421) )
))
(declare-fun mapValue!25181 () ValueCell!7421)

(declare-datatypes ((array!47723 0))(
  ( (array!47724 (arr!22888 (Array (_ BitVec 32) ValueCell!7421)) (size!23329 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47723)

(declare-fun mapRest!25181 () (Array (_ BitVec 32) ValueCell!7421))

(assert (=> mapNonEmpty!25181 (= (arr!22888 _values!688) (store mapRest!25181 mapKey!25181 mapValue!25181))))

(declare-fun b!844404 () Bool)

(declare-fun res!573539 () Bool)

(declare-fun e!471229 () Bool)

(assert (=> b!844404 (=> (not res!573539) (not e!471229))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844404 (= res!573539 (validMask!0 mask!1196))))

(declare-fun b!844405 () Bool)

(declare-fun e!471225 () Bool)

(assert (=> b!844405 (= e!471225 tp_is_empty!15721)))

(declare-fun b!844406 () Bool)

(declare-fun res!573538 () Bool)

(assert (=> b!844406 (=> (not res!573538) (not e!471229))))

(declare-datatypes ((array!47725 0))(
  ( (array!47726 (arr!22889 (Array (_ BitVec 32) (_ BitVec 64))) (size!23330 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47725)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47725 (_ BitVec 32)) Bool)

(assert (=> b!844406 (= res!573538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844407 () Bool)

(assert (=> b!844407 (= e!471229 false)))

(declare-fun lt!381509 () Bool)

(declare-datatypes ((List!16168 0))(
  ( (Nil!16165) (Cons!16164 (h!17301 (_ BitVec 64)) (t!22531 List!16168)) )
))
(declare-fun arrayNoDuplicates!0 (array!47725 (_ BitVec 32) List!16168) Bool)

(assert (=> b!844407 (= lt!381509 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16165))))

(declare-fun mapIsEmpty!25181 () Bool)

(assert (=> mapIsEmpty!25181 mapRes!25181))

(declare-fun b!844408 () Bool)

(declare-fun res!573541 () Bool)

(assert (=> b!844408 (=> (not res!573541) (not e!471229))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844408 (= res!573541 (and (= (size!23329 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23330 _keys!868) (size!23329 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573540 () Bool)

(assert (=> start!72838 (=> (not res!573540) (not e!471229))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72838 (= res!573540 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23330 _keys!868))))))

(assert (=> start!72838 e!471229))

(assert (=> start!72838 true))

(declare-fun array_inv!18256 (array!47725) Bool)

(assert (=> start!72838 (array_inv!18256 _keys!868)))

(declare-fun e!471227 () Bool)

(declare-fun array_inv!18257 (array!47723) Bool)

(assert (=> start!72838 (and (array_inv!18257 _values!688) e!471227)))

(declare-fun b!844409 () Bool)

(assert (=> b!844409 (= e!471227 (and e!471225 mapRes!25181))))

(declare-fun condMapEmpty!25181 () Bool)

(declare-fun mapDefault!25181 () ValueCell!7421)

(assert (=> b!844409 (= condMapEmpty!25181 (= (arr!22888 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7421)) mapDefault!25181)))))

(assert (= (and start!72838 res!573540) b!844404))

(assert (= (and b!844404 res!573539) b!844408))

(assert (= (and b!844408 res!573541) b!844406))

(assert (= (and b!844406 res!573538) b!844407))

(assert (= (and b!844409 condMapEmpty!25181) mapIsEmpty!25181))

(assert (= (and b!844409 (not condMapEmpty!25181)) mapNonEmpty!25181))

(get-info :version)

(assert (= (and mapNonEmpty!25181 ((_ is ValueCellFull!7421) mapValue!25181)) b!844403))

(assert (= (and b!844409 ((_ is ValueCellFull!7421) mapDefault!25181)) b!844405))

(assert (= start!72838 b!844409))

(declare-fun m!787445 () Bool)

(assert (=> mapNonEmpty!25181 m!787445))

(declare-fun m!787447 () Bool)

(assert (=> b!844406 m!787447))

(declare-fun m!787449 () Bool)

(assert (=> start!72838 m!787449))

(declare-fun m!787451 () Bool)

(assert (=> start!72838 m!787451))

(declare-fun m!787453 () Bool)

(assert (=> b!844404 m!787453))

(declare-fun m!787455 () Bool)

(assert (=> b!844407 m!787455))

(check-sat (not mapNonEmpty!25181) (not b!844404) (not start!72838) tp_is_empty!15721 (not b!844407) (not b!844406))
(check-sat)
