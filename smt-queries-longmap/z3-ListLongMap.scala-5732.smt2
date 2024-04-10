; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74190 () Bool)

(assert start!74190)

(declare-fun mapIsEmpty!27446 () Bool)

(declare-fun mapRes!27446 () Bool)

(assert (=> mapIsEmpty!27446 mapRes!27446))

(declare-fun b!872713 () Bool)

(declare-fun res!593119 () Bool)

(declare-fun e!486024 () Bool)

(assert (=> b!872713 (=> (not res!593119) (not e!486024))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50586 0))(
  ( (array!50587 (arr!24323 (Array (_ BitVec 32) (_ BitVec 64))) (size!24763 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50586)

(assert (=> b!872713 (= res!593119 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24763 _keys!868))))))

(declare-fun res!593117 () Bool)

(assert (=> start!74190 (=> (not res!593117) (not e!486024))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74190 (= res!593117 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24763 _keys!868))))))

(assert (=> start!74190 e!486024))

(assert (=> start!74190 true))

(declare-fun array_inv!19194 (array!50586) Bool)

(assert (=> start!74190 (array_inv!19194 _keys!868)))

(declare-datatypes ((V!28019 0))(
  ( (V!28020 (val!8662 Int)) )
))
(declare-datatypes ((ValueCell!8175 0))(
  ( (ValueCellFull!8175 (v!11087 V!28019)) (EmptyCell!8175) )
))
(declare-datatypes ((array!50588 0))(
  ( (array!50589 (arr!24324 (Array (_ BitVec 32) ValueCell!8175)) (size!24764 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50588)

(declare-fun e!486021 () Bool)

(declare-fun array_inv!19195 (array!50588) Bool)

(assert (=> start!74190 (and (array_inv!19195 _values!688) e!486021)))

(declare-fun b!872714 () Bool)

(declare-fun res!593122 () Bool)

(assert (=> b!872714 (=> (not res!593122) (not e!486024))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50586 (_ BitVec 32)) Bool)

(assert (=> b!872714 (= res!593122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27446 () Bool)

(declare-fun tp!52645 () Bool)

(declare-fun e!486025 () Bool)

(assert (=> mapNonEmpty!27446 (= mapRes!27446 (and tp!52645 e!486025))))

(declare-fun mapKey!27446 () (_ BitVec 32))

(declare-fun mapRest!27446 () (Array (_ BitVec 32) ValueCell!8175))

(declare-fun mapValue!27446 () ValueCell!8175)

(assert (=> mapNonEmpty!27446 (= (arr!24324 _values!688) (store mapRest!27446 mapKey!27446 mapValue!27446))))

(declare-fun b!872715 () Bool)

(declare-fun e!486023 () Bool)

(declare-fun tp_is_empty!17229 () Bool)

(assert (=> b!872715 (= e!486023 tp_is_empty!17229)))

(declare-fun b!872716 () Bool)

(declare-fun res!593121 () Bool)

(assert (=> b!872716 (=> (not res!593121) (not e!486024))))

(declare-datatypes ((List!17270 0))(
  ( (Nil!17267) (Cons!17266 (h!18397 (_ BitVec 64)) (t!24307 List!17270)) )
))
(declare-fun arrayNoDuplicates!0 (array!50586 (_ BitVec 32) List!17270) Bool)

(assert (=> b!872716 (= res!593121 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17267))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!872717 () Bool)

(assert (=> b!872717 (= e!486024 (and (= (select (arr!24323 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24763 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsge (bvsub (size!24763 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!24763 _keys!868) from!1053))))))

(declare-fun b!872718 () Bool)

(declare-fun res!593118 () Bool)

(assert (=> b!872718 (=> (not res!593118) (not e!486024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872718 (= res!593118 (validMask!0 mask!1196))))

(declare-fun b!872719 () Bool)

(declare-fun res!593123 () Bool)

(assert (=> b!872719 (=> (not res!593123) (not e!486024))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872719 (= res!593123 (and (= (size!24764 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24763 _keys!868) (size!24764 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872720 () Bool)

(assert (=> b!872720 (= e!486021 (and e!486023 mapRes!27446))))

(declare-fun condMapEmpty!27446 () Bool)

(declare-fun mapDefault!27446 () ValueCell!8175)

(assert (=> b!872720 (= condMapEmpty!27446 (= (arr!24324 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8175)) mapDefault!27446)))))

(declare-fun b!872721 () Bool)

(declare-fun res!593120 () Bool)

(assert (=> b!872721 (=> (not res!593120) (not e!486024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872721 (= res!593120 (validKeyInArray!0 k0!854))))

(declare-fun b!872722 () Bool)

(assert (=> b!872722 (= e!486025 tp_is_empty!17229)))

(assert (= (and start!74190 res!593117) b!872718))

(assert (= (and b!872718 res!593118) b!872719))

(assert (= (and b!872719 res!593123) b!872714))

(assert (= (and b!872714 res!593122) b!872716))

(assert (= (and b!872716 res!593121) b!872713))

(assert (= (and b!872713 res!593119) b!872721))

(assert (= (and b!872721 res!593120) b!872717))

(assert (= (and b!872720 condMapEmpty!27446) mapIsEmpty!27446))

(assert (= (and b!872720 (not condMapEmpty!27446)) mapNonEmpty!27446))

(get-info :version)

(assert (= (and mapNonEmpty!27446 ((_ is ValueCellFull!8175) mapValue!27446)) b!872722))

(assert (= (and b!872720 ((_ is ValueCellFull!8175) mapDefault!27446)) b!872715))

(assert (= start!74190 b!872720))

(declare-fun m!813411 () Bool)

(assert (=> b!872721 m!813411))

(declare-fun m!813413 () Bool)

(assert (=> b!872717 m!813413))

(declare-fun m!813415 () Bool)

(assert (=> start!74190 m!813415))

(declare-fun m!813417 () Bool)

(assert (=> start!74190 m!813417))

(declare-fun m!813419 () Bool)

(assert (=> b!872716 m!813419))

(declare-fun m!813421 () Bool)

(assert (=> b!872714 m!813421))

(declare-fun m!813423 () Bool)

(assert (=> mapNonEmpty!27446 m!813423))

(declare-fun m!813425 () Bool)

(assert (=> b!872718 m!813425))

(check-sat tp_is_empty!17229 (not mapNonEmpty!27446) (not b!872714) (not b!872721) (not b!872716) (not start!74190) (not b!872718))
(check-sat)
