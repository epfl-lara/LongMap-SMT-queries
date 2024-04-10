; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72630 () Bool)

(assert start!72630)

(declare-fun b!843080 () Bool)

(declare-fun e!470343 () Bool)

(declare-fun tp_is_empty!15681 () Bool)

(assert (=> b!843080 (= e!470343 tp_is_empty!15681)))

(declare-fun b!843081 () Bool)

(declare-fun res!572955 () Bool)

(declare-fun e!470347 () Bool)

(assert (=> b!843081 (=> (not res!572955) (not e!470347))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843081 (= res!572955 (validMask!0 mask!1196))))

(declare-fun res!572956 () Bool)

(assert (=> start!72630 (=> (not res!572956) (not e!470347))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47622 0))(
  ( (array!47623 (arr!22842 (Array (_ BitVec 32) (_ BitVec 64))) (size!23282 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47622)

(assert (=> start!72630 (= res!572956 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23282 _keys!868))))))

(assert (=> start!72630 e!470347))

(assert (=> start!72630 true))

(declare-fun array_inv!18172 (array!47622) Bool)

(assert (=> start!72630 (array_inv!18172 _keys!868)))

(declare-datatypes ((V!25955 0))(
  ( (V!25956 (val!7888 Int)) )
))
(declare-datatypes ((ValueCell!7401 0))(
  ( (ValueCellFull!7401 (v!10313 V!25955)) (EmptyCell!7401) )
))
(declare-datatypes ((array!47624 0))(
  ( (array!47625 (arr!22843 (Array (_ BitVec 32) ValueCell!7401)) (size!23283 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47624)

(declare-fun e!470344 () Bool)

(declare-fun array_inv!18173 (array!47624) Bool)

(assert (=> start!72630 (and (array_inv!18173 _values!688) e!470344)))

(declare-fun b!843082 () Bool)

(declare-fun e!470345 () Bool)

(declare-fun mapRes!25121 () Bool)

(assert (=> b!843082 (= e!470344 (and e!470345 mapRes!25121))))

(declare-fun condMapEmpty!25121 () Bool)

(declare-fun mapDefault!25121 () ValueCell!7401)

(assert (=> b!843082 (= condMapEmpty!25121 (= (arr!22843 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7401)) mapDefault!25121)))))

(declare-fun mapIsEmpty!25121 () Bool)

(assert (=> mapIsEmpty!25121 mapRes!25121))

(declare-fun b!843083 () Bool)

(assert (=> b!843083 (= e!470345 tp_is_empty!15681)))

(declare-fun b!843084 () Bool)

(assert (=> b!843084 (= e!470347 false)))

(declare-fun lt!381088 () Bool)

(declare-datatypes ((List!16228 0))(
  ( (Nil!16225) (Cons!16224 (h!17355 (_ BitVec 64)) (t!22599 List!16228)) )
))
(declare-fun arrayNoDuplicates!0 (array!47622 (_ BitVec 32) List!16228) Bool)

(assert (=> b!843084 (= lt!381088 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16225))))

(declare-fun b!843085 () Bool)

(declare-fun res!572957 () Bool)

(assert (=> b!843085 (=> (not res!572957) (not e!470347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47622 (_ BitVec 32)) Bool)

(assert (=> b!843085 (= res!572957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843086 () Bool)

(declare-fun res!572954 () Bool)

(assert (=> b!843086 (=> (not res!572954) (not e!470347))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843086 (= res!572954 (and (= (size!23283 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23282 _keys!868) (size!23283 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25121 () Bool)

(declare-fun tp!48439 () Bool)

(assert (=> mapNonEmpty!25121 (= mapRes!25121 (and tp!48439 e!470343))))

(declare-fun mapKey!25121 () (_ BitVec 32))

(declare-fun mapRest!25121 () (Array (_ BitVec 32) ValueCell!7401))

(declare-fun mapValue!25121 () ValueCell!7401)

(assert (=> mapNonEmpty!25121 (= (arr!22843 _values!688) (store mapRest!25121 mapKey!25121 mapValue!25121))))

(assert (= (and start!72630 res!572956) b!843081))

(assert (= (and b!843081 res!572955) b!843086))

(assert (= (and b!843086 res!572954) b!843085))

(assert (= (and b!843085 res!572957) b!843084))

(assert (= (and b!843082 condMapEmpty!25121) mapIsEmpty!25121))

(assert (= (and b!843082 (not condMapEmpty!25121)) mapNonEmpty!25121))

(get-info :version)

(assert (= (and mapNonEmpty!25121 ((_ is ValueCellFull!7401) mapValue!25121)) b!843080))

(assert (= (and b!843082 ((_ is ValueCellFull!7401) mapDefault!25121)) b!843083))

(assert (= start!72630 b!843082))

(declare-fun m!785913 () Bool)

(assert (=> b!843084 m!785913))

(declare-fun m!785915 () Bool)

(assert (=> mapNonEmpty!25121 m!785915))

(declare-fun m!785917 () Bool)

(assert (=> start!72630 m!785917))

(declare-fun m!785919 () Bool)

(assert (=> start!72630 m!785919))

(declare-fun m!785921 () Bool)

(assert (=> b!843085 m!785921))

(declare-fun m!785923 () Bool)

(assert (=> b!843081 m!785923))

(check-sat tp_is_empty!15681 (not b!843084) (not start!72630) (not b!843081) (not b!843085) (not mapNonEmpty!25121))
(check-sat)
