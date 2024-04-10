; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74130 () Bool)

(assert start!74130)

(declare-fun res!592745 () Bool)

(declare-fun e!485575 () Bool)

(assert (=> start!74130 (=> (not res!592745) (not e!485575))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50472 0))(
  ( (array!50473 (arr!24266 (Array (_ BitVec 32) (_ BitVec 64))) (size!24706 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50472)

(assert (=> start!74130 (= res!592745 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24706 _keys!868))))))

(assert (=> start!74130 e!485575))

(assert (=> start!74130 true))

(declare-fun array_inv!19158 (array!50472) Bool)

(assert (=> start!74130 (array_inv!19158 _keys!868)))

(declare-datatypes ((V!27939 0))(
  ( (V!27940 (val!8632 Int)) )
))
(declare-datatypes ((ValueCell!8145 0))(
  ( (ValueCellFull!8145 (v!11057 V!27939)) (EmptyCell!8145) )
))
(declare-datatypes ((array!50474 0))(
  ( (array!50475 (arr!24267 (Array (_ BitVec 32) ValueCell!8145)) (size!24707 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50474)

(declare-fun e!485574 () Bool)

(declare-fun array_inv!19159 (array!50474) Bool)

(assert (=> start!74130 (and (array_inv!19159 _values!688) e!485574)))

(declare-fun b!872068 () Bool)

(assert (=> b!872068 (= e!485575 false)))

(declare-fun lt!395569 () Bool)

(declare-datatypes ((List!17250 0))(
  ( (Nil!17247) (Cons!17246 (h!18377 (_ BitVec 64)) (t!24287 List!17250)) )
))
(declare-fun arrayNoDuplicates!0 (array!50472 (_ BitVec 32) List!17250) Bool)

(assert (=> b!872068 (= lt!395569 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17247))))

(declare-fun b!872069 () Bool)

(declare-fun res!592742 () Bool)

(assert (=> b!872069 (=> (not res!592742) (not e!485575))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50472 (_ BitVec 32)) Bool)

(assert (=> b!872069 (= res!592742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872070 () Bool)

(declare-fun res!592744 () Bool)

(assert (=> b!872070 (=> (not res!592744) (not e!485575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872070 (= res!592744 (validMask!0 mask!1196))))

(declare-fun b!872071 () Bool)

(declare-fun e!485571 () Bool)

(declare-fun tp_is_empty!17169 () Bool)

(assert (=> b!872071 (= e!485571 tp_is_empty!17169)))

(declare-fun mapNonEmpty!27356 () Bool)

(declare-fun mapRes!27356 () Bool)

(declare-fun tp!52555 () Bool)

(declare-fun e!485573 () Bool)

(assert (=> mapNonEmpty!27356 (= mapRes!27356 (and tp!52555 e!485573))))

(declare-fun mapValue!27356 () ValueCell!8145)

(declare-fun mapKey!27356 () (_ BitVec 32))

(declare-fun mapRest!27356 () (Array (_ BitVec 32) ValueCell!8145))

(assert (=> mapNonEmpty!27356 (= (arr!24267 _values!688) (store mapRest!27356 mapKey!27356 mapValue!27356))))

(declare-fun b!872072 () Bool)

(assert (=> b!872072 (= e!485574 (and e!485571 mapRes!27356))))

(declare-fun condMapEmpty!27356 () Bool)

(declare-fun mapDefault!27356 () ValueCell!8145)

(assert (=> b!872072 (= condMapEmpty!27356 (= (arr!24267 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8145)) mapDefault!27356)))))

(declare-fun b!872073 () Bool)

(assert (=> b!872073 (= e!485573 tp_is_empty!17169)))

(declare-fun mapIsEmpty!27356 () Bool)

(assert (=> mapIsEmpty!27356 mapRes!27356))

(declare-fun b!872074 () Bool)

(declare-fun res!592743 () Bool)

(assert (=> b!872074 (=> (not res!592743) (not e!485575))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872074 (= res!592743 (and (= (size!24707 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24706 _keys!868) (size!24707 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74130 res!592745) b!872070))

(assert (= (and b!872070 res!592744) b!872074))

(assert (= (and b!872074 res!592743) b!872069))

(assert (= (and b!872069 res!592742) b!872068))

(assert (= (and b!872072 condMapEmpty!27356) mapIsEmpty!27356))

(assert (= (and b!872072 (not condMapEmpty!27356)) mapNonEmpty!27356))

(get-info :version)

(assert (= (and mapNonEmpty!27356 ((_ is ValueCellFull!8145) mapValue!27356)) b!872073))

(assert (= (and b!872072 ((_ is ValueCellFull!8145) mapDefault!27356)) b!872071))

(assert (= start!74130 b!872072))

(declare-fun m!813047 () Bool)

(assert (=> b!872070 m!813047))

(declare-fun m!813049 () Bool)

(assert (=> mapNonEmpty!27356 m!813049))

(declare-fun m!813051 () Bool)

(assert (=> b!872069 m!813051))

(declare-fun m!813053 () Bool)

(assert (=> b!872068 m!813053))

(declare-fun m!813055 () Bool)

(assert (=> start!74130 m!813055))

(declare-fun m!813057 () Bool)

(assert (=> start!74130 m!813057))

(check-sat (not b!872070) tp_is_empty!17169 (not mapNonEmpty!27356) (not b!872068) (not b!872069) (not start!74130))
(check-sat)
