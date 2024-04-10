; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74160 () Bool)

(assert start!74160)

(declare-fun b!872383 () Bool)

(declare-fun res!592923 () Bool)

(declare-fun e!485798 () Bool)

(assert (=> b!872383 (=> (not res!592923) (not e!485798))))

(declare-datatypes ((array!50532 0))(
  ( (array!50533 (arr!24296 (Array (_ BitVec 32) (_ BitVec 64))) (size!24736 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50532)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50532 (_ BitVec 32)) Bool)

(assert (=> b!872383 (= res!592923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872384 () Bool)

(declare-fun e!485800 () Bool)

(declare-fun e!485797 () Bool)

(declare-fun mapRes!27401 () Bool)

(assert (=> b!872384 (= e!485800 (and e!485797 mapRes!27401))))

(declare-fun condMapEmpty!27401 () Bool)

(declare-datatypes ((V!27979 0))(
  ( (V!27980 (val!8647 Int)) )
))
(declare-datatypes ((ValueCell!8160 0))(
  ( (ValueCellFull!8160 (v!11072 V!27979)) (EmptyCell!8160) )
))
(declare-datatypes ((array!50534 0))(
  ( (array!50535 (arr!24297 (Array (_ BitVec 32) ValueCell!8160)) (size!24737 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50534)

(declare-fun mapDefault!27401 () ValueCell!8160)

(assert (=> b!872384 (= condMapEmpty!27401 (= (arr!24297 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8160)) mapDefault!27401)))))

(declare-fun b!872386 () Bool)

(assert (=> b!872386 (= e!485798 false)))

(declare-fun lt!395614 () Bool)

(declare-datatypes ((List!17260 0))(
  ( (Nil!17257) (Cons!17256 (h!18387 (_ BitVec 64)) (t!24297 List!17260)) )
))
(declare-fun arrayNoDuplicates!0 (array!50532 (_ BitVec 32) List!17260) Bool)

(assert (=> b!872386 (= lt!395614 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17257))))

(declare-fun b!872387 () Bool)

(declare-fun res!592925 () Bool)

(assert (=> b!872387 (=> (not res!592925) (not e!485798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872387 (= res!592925 (validMask!0 mask!1196))))

(declare-fun b!872388 () Bool)

(declare-fun res!592924 () Bool)

(assert (=> b!872388 (=> (not res!592924) (not e!485798))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872388 (= res!592924 (and (= (size!24737 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24736 _keys!868) (size!24737 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27401 () Bool)

(declare-fun tp!52600 () Bool)

(declare-fun e!485796 () Bool)

(assert (=> mapNonEmpty!27401 (= mapRes!27401 (and tp!52600 e!485796))))

(declare-fun mapValue!27401 () ValueCell!8160)

(declare-fun mapKey!27401 () (_ BitVec 32))

(declare-fun mapRest!27401 () (Array (_ BitVec 32) ValueCell!8160))

(assert (=> mapNonEmpty!27401 (= (arr!24297 _values!688) (store mapRest!27401 mapKey!27401 mapValue!27401))))

(declare-fun mapIsEmpty!27401 () Bool)

(assert (=> mapIsEmpty!27401 mapRes!27401))

(declare-fun b!872389 () Bool)

(declare-fun tp_is_empty!17199 () Bool)

(assert (=> b!872389 (= e!485796 tp_is_empty!17199)))

(declare-fun b!872385 () Bool)

(assert (=> b!872385 (= e!485797 tp_is_empty!17199)))

(declare-fun res!592922 () Bool)

(assert (=> start!74160 (=> (not res!592922) (not e!485798))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74160 (= res!592922 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24736 _keys!868))))))

(assert (=> start!74160 e!485798))

(assert (=> start!74160 true))

(declare-fun array_inv!19182 (array!50532) Bool)

(assert (=> start!74160 (array_inv!19182 _keys!868)))

(declare-fun array_inv!19183 (array!50534) Bool)

(assert (=> start!74160 (and (array_inv!19183 _values!688) e!485800)))

(assert (= (and start!74160 res!592922) b!872387))

(assert (= (and b!872387 res!592925) b!872388))

(assert (= (and b!872388 res!592924) b!872383))

(assert (= (and b!872383 res!592923) b!872386))

(assert (= (and b!872384 condMapEmpty!27401) mapIsEmpty!27401))

(assert (= (and b!872384 (not condMapEmpty!27401)) mapNonEmpty!27401))

(get-info :version)

(assert (= (and mapNonEmpty!27401 ((_ is ValueCellFull!8160) mapValue!27401)) b!872389))

(assert (= (and b!872384 ((_ is ValueCellFull!8160) mapDefault!27401)) b!872385))

(assert (= start!74160 b!872384))

(declare-fun m!813227 () Bool)

(assert (=> b!872387 m!813227))

(declare-fun m!813229 () Bool)

(assert (=> mapNonEmpty!27401 m!813229))

(declare-fun m!813231 () Bool)

(assert (=> b!872386 m!813231))

(declare-fun m!813233 () Bool)

(assert (=> start!74160 m!813233))

(declare-fun m!813235 () Bool)

(assert (=> start!74160 m!813235))

(declare-fun m!813237 () Bool)

(assert (=> b!872383 m!813237))

(check-sat tp_is_empty!17199 (not b!872387) (not b!872386) (not b!872383) (not start!74160) (not mapNonEmpty!27401))
(check-sat)
