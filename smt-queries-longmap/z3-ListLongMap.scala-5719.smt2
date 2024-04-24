; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74266 () Bool)

(assert start!74266)

(declare-fun mapIsEmpty!27323 () Bool)

(declare-fun mapRes!27323 () Bool)

(assert (=> mapIsEmpty!27323 mapRes!27323))

(declare-fun b!872699 () Bool)

(declare-fun e!485978 () Bool)

(declare-fun tp_is_empty!17149 () Bool)

(assert (=> b!872699 (= e!485978 tp_is_empty!17149)))

(declare-fun b!872700 () Bool)

(declare-fun res!592926 () Bool)

(declare-fun e!485977 () Bool)

(assert (=> b!872700 (=> (not res!592926) (not e!485977))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50495 0))(
  ( (array!50496 (arr!24274 (Array (_ BitVec 32) (_ BitVec 64))) (size!24715 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50495)

(declare-datatypes ((V!27913 0))(
  ( (V!27914 (val!8622 Int)) )
))
(declare-datatypes ((ValueCell!8135 0))(
  ( (ValueCellFull!8135 (v!11047 V!27913)) (EmptyCell!8135) )
))
(declare-datatypes ((array!50497 0))(
  ( (array!50498 (arr!24275 (Array (_ BitVec 32) ValueCell!8135)) (size!24716 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50497)

(assert (=> b!872700 (= res!592926 (and (= (size!24716 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24715 _keys!868) (size!24716 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872701 () Bool)

(declare-fun e!485980 () Bool)

(assert (=> b!872701 (= e!485980 tp_is_empty!17149)))

(declare-fun b!872702 () Bool)

(declare-fun res!592924 () Bool)

(assert (=> b!872702 (=> (not res!592924) (not e!485977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50495 (_ BitVec 32)) Bool)

(assert (=> b!872702 (= res!592924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872703 () Bool)

(declare-fun e!485979 () Bool)

(assert (=> b!872703 (= e!485979 (and e!485980 mapRes!27323))))

(declare-fun condMapEmpty!27323 () Bool)

(declare-fun mapDefault!27323 () ValueCell!8135)

(assert (=> b!872703 (= condMapEmpty!27323 (= (arr!24275 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8135)) mapDefault!27323)))))

(declare-fun b!872704 () Bool)

(assert (=> b!872704 (= e!485977 false)))

(declare-fun lt!395900 () Bool)

(declare-datatypes ((List!17199 0))(
  ( (Nil!17196) (Cons!17195 (h!18332 (_ BitVec 64)) (t!24228 List!17199)) )
))
(declare-fun arrayNoDuplicates!0 (array!50495 (_ BitVec 32) List!17199) Bool)

(assert (=> b!872704 (= lt!395900 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17196))))

(declare-fun mapNonEmpty!27323 () Bool)

(declare-fun tp!52523 () Bool)

(assert (=> mapNonEmpty!27323 (= mapRes!27323 (and tp!52523 e!485978))))

(declare-fun mapRest!27323 () (Array (_ BitVec 32) ValueCell!8135))

(declare-fun mapKey!27323 () (_ BitVec 32))

(declare-fun mapValue!27323 () ValueCell!8135)

(assert (=> mapNonEmpty!27323 (= (arr!24275 _values!688) (store mapRest!27323 mapKey!27323 mapValue!27323))))

(declare-fun b!872705 () Bool)

(declare-fun res!592927 () Bool)

(assert (=> b!872705 (=> (not res!592927) (not e!485977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872705 (= res!592927 (validMask!0 mask!1196))))

(declare-fun res!592925 () Bool)

(assert (=> start!74266 (=> (not res!592925) (not e!485977))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74266 (= res!592925 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24715 _keys!868))))))

(assert (=> start!74266 e!485977))

(assert (=> start!74266 true))

(declare-fun array_inv!19218 (array!50495) Bool)

(assert (=> start!74266 (array_inv!19218 _keys!868)))

(declare-fun array_inv!19219 (array!50497) Bool)

(assert (=> start!74266 (and (array_inv!19219 _values!688) e!485979)))

(assert (= (and start!74266 res!592925) b!872705))

(assert (= (and b!872705 res!592927) b!872700))

(assert (= (and b!872700 res!592926) b!872702))

(assert (= (and b!872702 res!592924) b!872704))

(assert (= (and b!872703 condMapEmpty!27323) mapIsEmpty!27323))

(assert (= (and b!872703 (not condMapEmpty!27323)) mapNonEmpty!27323))

(get-info :version)

(assert (= (and mapNonEmpty!27323 ((_ is ValueCellFull!8135) mapValue!27323)) b!872699))

(assert (= (and b!872703 ((_ is ValueCellFull!8135) mapDefault!27323)) b!872701))

(assert (= start!74266 b!872703))

(declare-fun m!814187 () Bool)

(assert (=> b!872702 m!814187))

(declare-fun m!814189 () Bool)

(assert (=> b!872705 m!814189))

(declare-fun m!814191 () Bool)

(assert (=> b!872704 m!814191))

(declare-fun m!814193 () Bool)

(assert (=> mapNonEmpty!27323 m!814193))

(declare-fun m!814195 () Bool)

(assert (=> start!74266 m!814195))

(declare-fun m!814197 () Bool)

(assert (=> start!74266 m!814197))

(check-sat (not b!872705) (not mapNonEmpty!27323) tp_is_empty!17149 (not b!872702) (not b!872704) (not start!74266))
(check-sat)
