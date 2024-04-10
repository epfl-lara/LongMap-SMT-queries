; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74154 () Bool)

(assert start!74154)

(declare-fun res!592887 () Bool)

(declare-fun e!485751 () Bool)

(assert (=> start!74154 (=> (not res!592887) (not e!485751))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50520 0))(
  ( (array!50521 (arr!24290 (Array (_ BitVec 32) (_ BitVec 64))) (size!24730 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50520)

(assert (=> start!74154 (= res!592887 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24730 _keys!868))))))

(assert (=> start!74154 e!485751))

(assert (=> start!74154 true))

(declare-fun array_inv!19178 (array!50520) Bool)

(assert (=> start!74154 (array_inv!19178 _keys!868)))

(declare-datatypes ((V!27971 0))(
  ( (V!27972 (val!8644 Int)) )
))
(declare-datatypes ((ValueCell!8157 0))(
  ( (ValueCellFull!8157 (v!11069 V!27971)) (EmptyCell!8157) )
))
(declare-datatypes ((array!50522 0))(
  ( (array!50523 (arr!24291 (Array (_ BitVec 32) ValueCell!8157)) (size!24731 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50522)

(declare-fun e!485752 () Bool)

(declare-fun array_inv!19179 (array!50522) Bool)

(assert (=> start!74154 (and (array_inv!19179 _values!688) e!485752)))

(declare-fun b!872320 () Bool)

(declare-fun res!592886 () Bool)

(assert (=> b!872320 (=> (not res!592886) (not e!485751))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!872320 (= res!592886 (and (= (size!24731 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24730 _keys!868) (size!24731 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27392 () Bool)

(declare-fun mapRes!27392 () Bool)

(declare-fun tp!52591 () Bool)

(declare-fun e!485755 () Bool)

(assert (=> mapNonEmpty!27392 (= mapRes!27392 (and tp!52591 e!485755))))

(declare-fun mapValue!27392 () ValueCell!8157)

(declare-fun mapRest!27392 () (Array (_ BitVec 32) ValueCell!8157))

(declare-fun mapKey!27392 () (_ BitVec 32))

(assert (=> mapNonEmpty!27392 (= (arr!24291 _values!688) (store mapRest!27392 mapKey!27392 mapValue!27392))))

(declare-fun b!872321 () Bool)

(declare-fun res!592888 () Bool)

(assert (=> b!872321 (=> (not res!592888) (not e!485751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50520 (_ BitVec 32)) Bool)

(assert (=> b!872321 (= res!592888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27392 () Bool)

(assert (=> mapIsEmpty!27392 mapRes!27392))

(declare-fun b!872322 () Bool)

(declare-fun e!485754 () Bool)

(assert (=> b!872322 (= e!485752 (and e!485754 mapRes!27392))))

(declare-fun condMapEmpty!27392 () Bool)

(declare-fun mapDefault!27392 () ValueCell!8157)

(assert (=> b!872322 (= condMapEmpty!27392 (= (arr!24291 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8157)) mapDefault!27392)))))

(declare-fun b!872323 () Bool)

(declare-fun tp_is_empty!17193 () Bool)

(assert (=> b!872323 (= e!485755 tp_is_empty!17193)))

(declare-fun b!872324 () Bool)

(assert (=> b!872324 (= e!485754 tp_is_empty!17193)))

(declare-fun b!872325 () Bool)

(assert (=> b!872325 (= e!485751 false)))

(declare-fun lt!395605 () Bool)

(declare-datatypes ((List!17258 0))(
  ( (Nil!17255) (Cons!17254 (h!18385 (_ BitVec 64)) (t!24295 List!17258)) )
))
(declare-fun arrayNoDuplicates!0 (array!50520 (_ BitVec 32) List!17258) Bool)

(assert (=> b!872325 (= lt!395605 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17255))))

(declare-fun b!872326 () Bool)

(declare-fun res!592889 () Bool)

(assert (=> b!872326 (=> (not res!592889) (not e!485751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872326 (= res!592889 (validMask!0 mask!1196))))

(assert (= (and start!74154 res!592887) b!872326))

(assert (= (and b!872326 res!592889) b!872320))

(assert (= (and b!872320 res!592886) b!872321))

(assert (= (and b!872321 res!592888) b!872325))

(assert (= (and b!872322 condMapEmpty!27392) mapIsEmpty!27392))

(assert (= (and b!872322 (not condMapEmpty!27392)) mapNonEmpty!27392))

(get-info :version)

(assert (= (and mapNonEmpty!27392 ((_ is ValueCellFull!8157) mapValue!27392)) b!872323))

(assert (= (and b!872322 ((_ is ValueCellFull!8157) mapDefault!27392)) b!872324))

(assert (= start!74154 b!872322))

(declare-fun m!813191 () Bool)

(assert (=> b!872321 m!813191))

(declare-fun m!813193 () Bool)

(assert (=> start!74154 m!813193))

(declare-fun m!813195 () Bool)

(assert (=> start!74154 m!813195))

(declare-fun m!813197 () Bool)

(assert (=> b!872325 m!813197))

(declare-fun m!813199 () Bool)

(assert (=> b!872326 m!813199))

(declare-fun m!813201 () Bool)

(assert (=> mapNonEmpty!27392 m!813201))

(check-sat tp_is_empty!17193 (not mapNonEmpty!27392) (not b!872321) (not start!74154) (not b!872325) (not b!872326))
(check-sat)
