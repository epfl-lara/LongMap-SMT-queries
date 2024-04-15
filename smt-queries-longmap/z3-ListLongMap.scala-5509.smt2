; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72820 () Bool)

(assert start!72820)

(declare-fun b_free!13753 () Bool)

(declare-fun b_next!13753 () Bool)

(assert (=> start!72820 (= b_free!13753 (not b_next!13753))))

(declare-fun tp!48764 () Bool)

(declare-fun b_and!22813 () Bool)

(assert (=> start!72820 (= tp!48764 b_and!22813)))

(declare-fun b!845069 () Bool)

(declare-fun e!471758 () Bool)

(declare-fun e!471755 () Bool)

(declare-fun mapRes!25433 () Bool)

(assert (=> b!845069 (= e!471758 (and e!471755 mapRes!25433))))

(declare-fun condMapEmpty!25433 () Bool)

(declare-datatypes ((V!26233 0))(
  ( (V!26234 (val!7992 Int)) )
))
(declare-datatypes ((ValueCell!7505 0))(
  ( (ValueCellFull!7505 (v!10411 V!26233)) (EmptyCell!7505) )
))
(declare-datatypes ((array!48001 0))(
  ( (array!48002 (arr!23032 (Array (_ BitVec 32) ValueCell!7505)) (size!23474 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48001)

(declare-fun mapDefault!25433 () ValueCell!7505)

(assert (=> b!845069 (= condMapEmpty!25433 (= (arr!23032 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7505)) mapDefault!25433)))))

(declare-fun b!845070 () Bool)

(declare-fun e!471757 () Bool)

(declare-fun tp_is_empty!15889 () Bool)

(assert (=> b!845070 (= e!471757 tp_is_empty!15889)))

(declare-fun b!845071 () Bool)

(declare-fun e!471759 () Bool)

(assert (=> b!845071 (= e!471759 false)))

(declare-datatypes ((tuple2!10458 0))(
  ( (tuple2!10459 (_1!5240 (_ BitVec 64)) (_2!5240 V!26233)) )
))
(declare-datatypes ((List!16318 0))(
  ( (Nil!16315) (Cons!16314 (h!17445 tuple2!10458) (t!22680 List!16318)) )
))
(declare-datatypes ((ListLongMap!9217 0))(
  ( (ListLongMap!9218 (toList!4624 List!16318)) )
))
(declare-fun lt!381164 () ListLongMap!9217)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48003 0))(
  ( (array!48004 (arr!23033 (Array (_ BitVec 32) (_ BitVec 64))) (size!23475 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48003)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26233)

(declare-fun zeroValue!654 () V!26233)

(declare-fun getCurrentListMapNoExtraKeys!2638 (array!48003 array!48001 (_ BitVec 32) (_ BitVec 32) V!26233 V!26233 (_ BitVec 32) Int) ListLongMap!9217)

(assert (=> b!845071 (= lt!381164 (getCurrentListMapNoExtraKeys!2638 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845072 () Bool)

(assert (=> b!845072 (= e!471755 tp_is_empty!15889)))

(declare-fun b!845073 () Bool)

(declare-fun res!574140 () Bool)

(assert (=> b!845073 (=> (not res!574140) (not e!471759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48003 (_ BitVec 32)) Bool)

(assert (=> b!845073 (= res!574140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!574141 () Bool)

(assert (=> start!72820 (=> (not res!574141) (not e!471759))))

(assert (=> start!72820 (= res!574141 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23475 _keys!868))))))

(assert (=> start!72820 e!471759))

(assert (=> start!72820 true))

(assert (=> start!72820 tp!48764))

(declare-fun array_inv!18374 (array!48003) Bool)

(assert (=> start!72820 (array_inv!18374 _keys!868)))

(declare-fun array_inv!18375 (array!48001) Bool)

(assert (=> start!72820 (and (array_inv!18375 _values!688) e!471758)))

(assert (=> start!72820 tp_is_empty!15889))

(declare-fun mapNonEmpty!25433 () Bool)

(declare-fun tp!48763 () Bool)

(assert (=> mapNonEmpty!25433 (= mapRes!25433 (and tp!48763 e!471757))))

(declare-fun mapValue!25433 () ValueCell!7505)

(declare-fun mapRest!25433 () (Array (_ BitVec 32) ValueCell!7505))

(declare-fun mapKey!25433 () (_ BitVec 32))

(assert (=> mapNonEmpty!25433 (= (arr!23032 _values!688) (store mapRest!25433 mapKey!25433 mapValue!25433))))

(declare-fun b!845074 () Bool)

(declare-fun res!574136 () Bool)

(assert (=> b!845074 (=> (not res!574136) (not e!471759))))

(assert (=> b!845074 (= res!574136 (and (= (size!23474 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23475 _keys!868) (size!23474 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845075 () Bool)

(declare-fun res!574137 () Bool)

(assert (=> b!845075 (=> (not res!574137) (not e!471759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845075 (= res!574137 (validMask!0 mask!1196))))

(declare-fun b!845076 () Bool)

(declare-fun res!574138 () Bool)

(assert (=> b!845076 (=> (not res!574138) (not e!471759))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845076 (= res!574138 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23475 _keys!868))))))

(declare-fun b!845077 () Bool)

(declare-fun res!574143 () Bool)

(assert (=> b!845077 (=> (not res!574143) (not e!471759))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845077 (= res!574143 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25433 () Bool)

(assert (=> mapIsEmpty!25433 mapRes!25433))

(declare-fun b!845078 () Bool)

(declare-fun res!574142 () Bool)

(assert (=> b!845078 (=> (not res!574142) (not e!471759))))

(assert (=> b!845078 (= res!574142 (and (= (select (arr!23033 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845079 () Bool)

(declare-fun res!574139 () Bool)

(assert (=> b!845079 (=> (not res!574139) (not e!471759))))

(declare-datatypes ((List!16319 0))(
  ( (Nil!16316) (Cons!16315 (h!17446 (_ BitVec 64)) (t!22681 List!16319)) )
))
(declare-fun arrayNoDuplicates!0 (array!48003 (_ BitVec 32) List!16319) Bool)

(assert (=> b!845079 (= res!574139 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16316))))

(assert (= (and start!72820 res!574141) b!845075))

(assert (= (and b!845075 res!574137) b!845074))

(assert (= (and b!845074 res!574136) b!845073))

(assert (= (and b!845073 res!574140) b!845079))

(assert (= (and b!845079 res!574139) b!845076))

(assert (= (and b!845076 res!574138) b!845077))

(assert (= (and b!845077 res!574143) b!845078))

(assert (= (and b!845078 res!574142) b!845071))

(assert (= (and b!845069 condMapEmpty!25433) mapIsEmpty!25433))

(assert (= (and b!845069 (not condMapEmpty!25433)) mapNonEmpty!25433))

(get-info :version)

(assert (= (and mapNonEmpty!25433 ((_ is ValueCellFull!7505) mapValue!25433)) b!845070))

(assert (= (and b!845069 ((_ is ValueCellFull!7505) mapDefault!25433)) b!845072))

(assert (= start!72820 b!845069))

(declare-fun m!786425 () Bool)

(assert (=> b!845073 m!786425))

(declare-fun m!786427 () Bool)

(assert (=> mapNonEmpty!25433 m!786427))

(declare-fun m!786429 () Bool)

(assert (=> b!845078 m!786429))

(declare-fun m!786431 () Bool)

(assert (=> b!845071 m!786431))

(declare-fun m!786433 () Bool)

(assert (=> b!845077 m!786433))

(declare-fun m!786435 () Bool)

(assert (=> start!72820 m!786435))

(declare-fun m!786437 () Bool)

(assert (=> start!72820 m!786437))

(declare-fun m!786439 () Bool)

(assert (=> b!845079 m!786439))

(declare-fun m!786441 () Bool)

(assert (=> b!845075 m!786441))

(check-sat (not b!845071) (not b!845075) (not b!845079) (not b!845077) b_and!22813 (not mapNonEmpty!25433) (not b!845073) (not b_next!13753) tp_is_empty!15889 (not start!72820))
(check-sat b_and!22813 (not b_next!13753))
