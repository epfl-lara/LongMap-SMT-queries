; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72808 () Bool)

(assert start!72808)

(declare-fun b!844088 () Bool)

(declare-fun res!573360 () Bool)

(declare-fun e!471003 () Bool)

(assert (=> b!844088 (=> (not res!573360) (not e!471003))))

(declare-datatypes ((array!47665 0))(
  ( (array!47666 (arr!22859 (Array (_ BitVec 32) (_ BitVec 64))) (size!23300 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47665)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47665 (_ BitVec 32)) Bool)

(assert (=> b!844088 (= res!573360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844089 () Bool)

(assert (=> b!844089 (= e!471003 false)))

(declare-fun lt!381464 () Bool)

(declare-datatypes ((List!16158 0))(
  ( (Nil!16155) (Cons!16154 (h!17291 (_ BitVec 64)) (t!22521 List!16158)) )
))
(declare-fun arrayNoDuplicates!0 (array!47665 (_ BitVec 32) List!16158) Bool)

(assert (=> b!844089 (= lt!381464 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16155))))

(declare-fun b!844090 () Bool)

(declare-fun res!573358 () Bool)

(assert (=> b!844090 (=> (not res!573358) (not e!471003))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25969 0))(
  ( (V!25970 (val!7893 Int)) )
))
(declare-datatypes ((ValueCell!7406 0))(
  ( (ValueCellFull!7406 (v!10318 V!25969)) (EmptyCell!7406) )
))
(declare-datatypes ((array!47667 0))(
  ( (array!47668 (arr!22860 (Array (_ BitVec 32) ValueCell!7406)) (size!23301 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47667)

(assert (=> b!844090 (= res!573358 (and (= (size!23301 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23300 _keys!868) (size!23301 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844091 () Bool)

(declare-fun res!573361 () Bool)

(assert (=> b!844091 (=> (not res!573361) (not e!471003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844091 (= res!573361 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25136 () Bool)

(declare-fun mapRes!25136 () Bool)

(assert (=> mapIsEmpty!25136 mapRes!25136))

(declare-fun b!844092 () Bool)

(declare-fun e!471004 () Bool)

(declare-fun tp_is_empty!15691 () Bool)

(assert (=> b!844092 (= e!471004 tp_is_empty!15691)))

(declare-fun b!844093 () Bool)

(declare-fun e!471000 () Bool)

(assert (=> b!844093 (= e!471000 tp_is_empty!15691)))

(declare-fun res!573359 () Bool)

(assert (=> start!72808 (=> (not res!573359) (not e!471003))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72808 (= res!573359 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23300 _keys!868))))))

(assert (=> start!72808 e!471003))

(assert (=> start!72808 true))

(declare-fun array_inv!18234 (array!47665) Bool)

(assert (=> start!72808 (array_inv!18234 _keys!868)))

(declare-fun e!471002 () Bool)

(declare-fun array_inv!18235 (array!47667) Bool)

(assert (=> start!72808 (and (array_inv!18235 _values!688) e!471002)))

(declare-fun b!844094 () Bool)

(assert (=> b!844094 (= e!471002 (and e!471000 mapRes!25136))))

(declare-fun condMapEmpty!25136 () Bool)

(declare-fun mapDefault!25136 () ValueCell!7406)

(assert (=> b!844094 (= condMapEmpty!25136 (= (arr!22860 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7406)) mapDefault!25136)))))

(declare-fun mapNonEmpty!25136 () Bool)

(declare-fun tp!48455 () Bool)

(assert (=> mapNonEmpty!25136 (= mapRes!25136 (and tp!48455 e!471004))))

(declare-fun mapValue!25136 () ValueCell!7406)

(declare-fun mapKey!25136 () (_ BitVec 32))

(declare-fun mapRest!25136 () (Array (_ BitVec 32) ValueCell!7406))

(assert (=> mapNonEmpty!25136 (= (arr!22860 _values!688) (store mapRest!25136 mapKey!25136 mapValue!25136))))

(assert (= (and start!72808 res!573359) b!844091))

(assert (= (and b!844091 res!573361) b!844090))

(assert (= (and b!844090 res!573358) b!844088))

(assert (= (and b!844088 res!573360) b!844089))

(assert (= (and b!844094 condMapEmpty!25136) mapIsEmpty!25136))

(assert (= (and b!844094 (not condMapEmpty!25136)) mapNonEmpty!25136))

(get-info :version)

(assert (= (and mapNonEmpty!25136 ((_ is ValueCellFull!7406) mapValue!25136)) b!844092))

(assert (= (and b!844094 ((_ is ValueCellFull!7406) mapDefault!25136)) b!844093))

(assert (= start!72808 b!844094))

(declare-fun m!787265 () Bool)

(assert (=> start!72808 m!787265))

(declare-fun m!787267 () Bool)

(assert (=> start!72808 m!787267))

(declare-fun m!787269 () Bool)

(assert (=> b!844089 m!787269))

(declare-fun m!787271 () Bool)

(assert (=> b!844088 m!787271))

(declare-fun m!787273 () Bool)

(assert (=> mapNonEmpty!25136 m!787273))

(declare-fun m!787275 () Bool)

(assert (=> b!844091 m!787275))

(check-sat (not b!844091) (not mapNonEmpty!25136) (not start!72808) (not b!844088) (not b!844089) tp_is_empty!15691)
(check-sat)
