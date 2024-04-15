; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74134 () Bool)

(assert start!74134)

(declare-fun b!872060 () Bool)

(declare-fun res!592767 () Bool)

(declare-fun e!485591 () Bool)

(assert (=> b!872060 (=> (not res!592767) (not e!485591))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50505 0))(
  ( (array!50506 (arr!24283 (Array (_ BitVec 32) (_ BitVec 64))) (size!24725 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50505)

(declare-datatypes ((V!27969 0))(
  ( (V!27970 (val!8643 Int)) )
))
(declare-datatypes ((ValueCell!8156 0))(
  ( (ValueCellFull!8156 (v!11062 V!27969)) (EmptyCell!8156) )
))
(declare-datatypes ((array!50507 0))(
  ( (array!50508 (arr!24284 (Array (_ BitVec 32) ValueCell!8156)) (size!24726 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50507)

(assert (=> b!872060 (= res!592767 (and (= (size!24726 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24725 _keys!868) (size!24726 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27389 () Bool)

(declare-fun mapRes!27389 () Bool)

(assert (=> mapIsEmpty!27389 mapRes!27389))

(declare-fun b!872061 () Bool)

(declare-fun e!485588 () Bool)

(declare-fun e!485589 () Bool)

(assert (=> b!872061 (= e!485588 (and e!485589 mapRes!27389))))

(declare-fun condMapEmpty!27389 () Bool)

(declare-fun mapDefault!27389 () ValueCell!8156)

(assert (=> b!872061 (= condMapEmpty!27389 (= (arr!24284 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8156)) mapDefault!27389)))))

(declare-fun b!872062 () Bool)

(assert (=> b!872062 (= e!485591 false)))

(declare-fun lt!395366 () Bool)

(declare-datatypes ((List!17264 0))(
  ( (Nil!17261) (Cons!17260 (h!18391 (_ BitVec 64)) (t!24292 List!17264)) )
))
(declare-fun arrayNoDuplicates!0 (array!50505 (_ BitVec 32) List!17264) Bool)

(assert (=> b!872062 (= lt!395366 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17261))))

(declare-fun res!592766 () Bool)

(assert (=> start!74134 (=> (not res!592766) (not e!485591))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74134 (= res!592766 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24725 _keys!868))))))

(assert (=> start!74134 e!485591))

(assert (=> start!74134 true))

(declare-fun array_inv!19234 (array!50505) Bool)

(assert (=> start!74134 (array_inv!19234 _keys!868)))

(declare-fun array_inv!19235 (array!50507) Bool)

(assert (=> start!74134 (and (array_inv!19235 _values!688) e!485588)))

(declare-fun b!872063 () Bool)

(declare-fun e!485592 () Bool)

(declare-fun tp_is_empty!17191 () Bool)

(assert (=> b!872063 (= e!485592 tp_is_empty!17191)))

(declare-fun b!872064 () Bool)

(declare-fun res!592765 () Bool)

(assert (=> b!872064 (=> (not res!592765) (not e!485591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50505 (_ BitVec 32)) Bool)

(assert (=> b!872064 (= res!592765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872065 () Bool)

(assert (=> b!872065 (= e!485589 tp_is_empty!17191)))

(declare-fun mapNonEmpty!27389 () Bool)

(declare-fun tp!52589 () Bool)

(assert (=> mapNonEmpty!27389 (= mapRes!27389 (and tp!52589 e!485592))))

(declare-fun mapKey!27389 () (_ BitVec 32))

(declare-fun mapValue!27389 () ValueCell!8156)

(declare-fun mapRest!27389 () (Array (_ BitVec 32) ValueCell!8156))

(assert (=> mapNonEmpty!27389 (= (arr!24284 _values!688) (store mapRest!27389 mapKey!27389 mapValue!27389))))

(declare-fun b!872066 () Bool)

(declare-fun res!592764 () Bool)

(assert (=> b!872066 (=> (not res!592764) (not e!485591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872066 (= res!592764 (validMask!0 mask!1196))))

(assert (= (and start!74134 res!592766) b!872066))

(assert (= (and b!872066 res!592764) b!872060))

(assert (= (and b!872060 res!592767) b!872064))

(assert (= (and b!872064 res!592765) b!872062))

(assert (= (and b!872061 condMapEmpty!27389) mapIsEmpty!27389))

(assert (= (and b!872061 (not condMapEmpty!27389)) mapNonEmpty!27389))

(get-info :version)

(assert (= (and mapNonEmpty!27389 ((_ is ValueCellFull!8156) mapValue!27389)) b!872063))

(assert (= (and b!872061 ((_ is ValueCellFull!8156) mapDefault!27389)) b!872065))

(assert (= start!74134 b!872061))

(declare-fun m!812421 () Bool)

(assert (=> b!872062 m!812421))

(declare-fun m!812423 () Bool)

(assert (=> mapNonEmpty!27389 m!812423))

(declare-fun m!812425 () Bool)

(assert (=> b!872064 m!812425))

(declare-fun m!812427 () Bool)

(assert (=> b!872066 m!812427))

(declare-fun m!812429 () Bool)

(assert (=> start!74134 m!812429))

(declare-fun m!812431 () Bool)

(assert (=> start!74134 m!812431))

(check-sat (not mapNonEmpty!27389) (not b!872066) (not start!74134) (not b!872062) (not b!872064) tp_is_empty!17191)
(check-sat)
