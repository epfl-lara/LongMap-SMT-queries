; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74142 () Bool)

(assert start!74142)

(declare-fun b!872194 () Bool)

(declare-fun e!485662 () Bool)

(assert (=> b!872194 (= e!485662 false)))

(declare-fun lt!395587 () Bool)

(declare-datatypes ((array!50496 0))(
  ( (array!50497 (arr!24278 (Array (_ BitVec 32) (_ BitVec 64))) (size!24718 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50496)

(declare-datatypes ((List!17255 0))(
  ( (Nil!17252) (Cons!17251 (h!18382 (_ BitVec 64)) (t!24292 List!17255)) )
))
(declare-fun arrayNoDuplicates!0 (array!50496 (_ BitVec 32) List!17255) Bool)

(assert (=> b!872194 (= lt!395587 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17252))))

(declare-fun mapNonEmpty!27374 () Bool)

(declare-fun mapRes!27374 () Bool)

(declare-fun tp!52573 () Bool)

(declare-fun e!485665 () Bool)

(assert (=> mapNonEmpty!27374 (= mapRes!27374 (and tp!52573 e!485665))))

(declare-fun mapKey!27374 () (_ BitVec 32))

(declare-datatypes ((V!27955 0))(
  ( (V!27956 (val!8638 Int)) )
))
(declare-datatypes ((ValueCell!8151 0))(
  ( (ValueCellFull!8151 (v!11063 V!27955)) (EmptyCell!8151) )
))
(declare-datatypes ((array!50498 0))(
  ( (array!50499 (arr!24279 (Array (_ BitVec 32) ValueCell!8151)) (size!24719 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50498)

(declare-fun mapValue!27374 () ValueCell!8151)

(declare-fun mapRest!27374 () (Array (_ BitVec 32) ValueCell!8151))

(assert (=> mapNonEmpty!27374 (= (arr!24279 _values!688) (store mapRest!27374 mapKey!27374 mapValue!27374))))

(declare-fun mapIsEmpty!27374 () Bool)

(assert (=> mapIsEmpty!27374 mapRes!27374))

(declare-fun b!872195 () Bool)

(declare-fun res!592815 () Bool)

(assert (=> b!872195 (=> (not res!592815) (not e!485662))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50496 (_ BitVec 32)) Bool)

(assert (=> b!872195 (= res!592815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872196 () Bool)

(declare-fun e!485661 () Bool)

(declare-fun tp_is_empty!17181 () Bool)

(assert (=> b!872196 (= e!485661 tp_is_empty!17181)))

(declare-fun b!872197 () Bool)

(declare-fun e!485663 () Bool)

(assert (=> b!872197 (= e!485663 (and e!485661 mapRes!27374))))

(declare-fun condMapEmpty!27374 () Bool)

(declare-fun mapDefault!27374 () ValueCell!8151)

(assert (=> b!872197 (= condMapEmpty!27374 (= (arr!24279 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8151)) mapDefault!27374)))))

(declare-fun b!872198 () Bool)

(assert (=> b!872198 (= e!485665 tp_is_empty!17181)))

(declare-fun b!872200 () Bool)

(declare-fun res!592814 () Bool)

(assert (=> b!872200 (=> (not res!592814) (not e!485662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872200 (= res!592814 (validMask!0 mask!1196))))

(declare-fun res!592817 () Bool)

(assert (=> start!74142 (=> (not res!592817) (not e!485662))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74142 (= res!592817 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24718 _keys!868))))))

(assert (=> start!74142 e!485662))

(assert (=> start!74142 true))

(declare-fun array_inv!19168 (array!50496) Bool)

(assert (=> start!74142 (array_inv!19168 _keys!868)))

(declare-fun array_inv!19169 (array!50498) Bool)

(assert (=> start!74142 (and (array_inv!19169 _values!688) e!485663)))

(declare-fun b!872199 () Bool)

(declare-fun res!592816 () Bool)

(assert (=> b!872199 (=> (not res!592816) (not e!485662))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872199 (= res!592816 (and (= (size!24719 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24718 _keys!868) (size!24719 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74142 res!592817) b!872200))

(assert (= (and b!872200 res!592814) b!872199))

(assert (= (and b!872199 res!592816) b!872195))

(assert (= (and b!872195 res!592815) b!872194))

(assert (= (and b!872197 condMapEmpty!27374) mapIsEmpty!27374))

(assert (= (and b!872197 (not condMapEmpty!27374)) mapNonEmpty!27374))

(get-info :version)

(assert (= (and mapNonEmpty!27374 ((_ is ValueCellFull!8151) mapValue!27374)) b!872198))

(assert (= (and b!872197 ((_ is ValueCellFull!8151) mapDefault!27374)) b!872196))

(assert (= start!74142 b!872197))

(declare-fun m!813119 () Bool)

(assert (=> start!74142 m!813119))

(declare-fun m!813121 () Bool)

(assert (=> start!74142 m!813121))

(declare-fun m!813123 () Bool)

(assert (=> b!872200 m!813123))

(declare-fun m!813125 () Bool)

(assert (=> mapNonEmpty!27374 m!813125))

(declare-fun m!813127 () Bool)

(assert (=> b!872195 m!813127))

(declare-fun m!813129 () Bool)

(assert (=> b!872194 m!813129))

(check-sat (not b!872194) (not mapNonEmpty!27374) (not start!74142) (not b!872200) tp_is_empty!17181 (not b!872195))
(check-sat)
