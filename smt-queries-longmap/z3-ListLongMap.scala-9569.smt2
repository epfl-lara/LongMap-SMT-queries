; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113276 () Bool)

(assert start!113276)

(declare-fun b_free!31327 () Bool)

(declare-fun b_next!31327 () Bool)

(assert (=> start!113276 (= b_free!31327 (not b_next!31327))))

(declare-fun tp!109786 () Bool)

(declare-fun b_and!50531 () Bool)

(assert (=> start!113276 (= tp!109786 b_and!50531)))

(declare-fun b!1343945 () Bool)

(declare-fun res!891706 () Bool)

(declare-fun e!764899 () Bool)

(assert (=> b!1343945 (=> (not res!891706) (not e!764899))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91441 0))(
  ( (array!91442 (arr!44177 (Array (_ BitVec 32) (_ BitVec 64))) (size!44729 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91441)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54873 0))(
  ( (V!54874 (val!18738 Int)) )
))
(declare-datatypes ((ValueCell!17765 0))(
  ( (ValueCellFull!17765 (v!21385 V!54873)) (EmptyCell!17765) )
))
(declare-datatypes ((array!91443 0))(
  ( (array!91444 (arr!44178 (Array (_ BitVec 32) ValueCell!17765)) (size!44730 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91443)

(assert (=> b!1343945 (= res!891706 (and (= (size!44730 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44729 _keys!1571) (size!44730 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343946 () Bool)

(declare-fun res!891705 () Bool)

(assert (=> b!1343946 (=> (not res!891705) (not e!764899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91441 (_ BitVec 32)) Bool)

(assert (=> b!1343946 (= res!891705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!891703 () Bool)

(assert (=> start!113276 (=> (not res!891703) (not e!764899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113276 (= res!891703 (validMask!0 mask!1977))))

(assert (=> start!113276 e!764899))

(declare-fun tp_is_empty!37327 () Bool)

(assert (=> start!113276 tp_is_empty!37327))

(assert (=> start!113276 true))

(declare-fun array_inv!33485 (array!91441) Bool)

(assert (=> start!113276 (array_inv!33485 _keys!1571)))

(declare-fun e!764897 () Bool)

(declare-fun array_inv!33486 (array!91443) Bool)

(assert (=> start!113276 (and (array_inv!33486 _values!1303) e!764897)))

(assert (=> start!113276 tp!109786))

(declare-fun b!1343947 () Bool)

(declare-fun res!891704 () Bool)

(assert (=> b!1343947 (=> (not res!891704) (not e!764899))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343947 (= res!891704 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44729 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343948 () Bool)

(declare-fun res!891702 () Bool)

(assert (=> b!1343948 (=> (not res!891702) (not e!764899))))

(declare-datatypes ((List!31350 0))(
  ( (Nil!31347) (Cons!31346 (h!32555 (_ BitVec 64)) (t!45866 List!31350)) )
))
(declare-fun arrayNoDuplicates!0 (array!91441 (_ BitVec 32) List!31350) Bool)

(assert (=> b!1343948 (= res!891702 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31347))))

(declare-fun b!1343949 () Bool)

(assert (=> b!1343949 (= e!764899 false)))

(declare-fun lt!594954 () Bool)

(declare-fun minValue!1245 () V!54873)

(declare-fun zeroValue!1245 () V!54873)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24210 0))(
  ( (tuple2!24211 (_1!12116 (_ BitVec 64)) (_2!12116 V!54873)) )
))
(declare-datatypes ((List!31351 0))(
  ( (Nil!31348) (Cons!31347 (h!32556 tuple2!24210) (t!45867 List!31351)) )
))
(declare-datatypes ((ListLongMap!21867 0))(
  ( (ListLongMap!21868 (toList!10949 List!31351)) )
))
(declare-fun contains!9054 (ListLongMap!21867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5795 (array!91441 array!91443 (_ BitVec 32) (_ BitVec 32) V!54873 V!54873 (_ BitVec 32) Int) ListLongMap!21867)

(assert (=> b!1343949 (= lt!594954 (contains!9054 (getCurrentListMap!5795 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343950 () Bool)

(declare-fun e!764896 () Bool)

(declare-fun mapRes!57697 () Bool)

(assert (=> b!1343950 (= e!764897 (and e!764896 mapRes!57697))))

(declare-fun condMapEmpty!57697 () Bool)

(declare-fun mapDefault!57697 () ValueCell!17765)

(assert (=> b!1343950 (= condMapEmpty!57697 (= (arr!44178 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17765)) mapDefault!57697)))))

(declare-fun mapIsEmpty!57697 () Bool)

(assert (=> mapIsEmpty!57697 mapRes!57697))

(declare-fun b!1343951 () Bool)

(declare-fun e!764900 () Bool)

(assert (=> b!1343951 (= e!764900 tp_is_empty!37327)))

(declare-fun b!1343952 () Bool)

(assert (=> b!1343952 (= e!764896 tp_is_empty!37327)))

(declare-fun mapNonEmpty!57697 () Bool)

(declare-fun tp!109787 () Bool)

(assert (=> mapNonEmpty!57697 (= mapRes!57697 (and tp!109787 e!764900))))

(declare-fun mapRest!57697 () (Array (_ BitVec 32) ValueCell!17765))

(declare-fun mapKey!57697 () (_ BitVec 32))

(declare-fun mapValue!57697 () ValueCell!17765)

(assert (=> mapNonEmpty!57697 (= (arr!44178 _values!1303) (store mapRest!57697 mapKey!57697 mapValue!57697))))

(assert (= (and start!113276 res!891703) b!1343945))

(assert (= (and b!1343945 res!891706) b!1343946))

(assert (= (and b!1343946 res!891705) b!1343948))

(assert (= (and b!1343948 res!891702) b!1343947))

(assert (= (and b!1343947 res!891704) b!1343949))

(assert (= (and b!1343950 condMapEmpty!57697) mapIsEmpty!57697))

(assert (= (and b!1343950 (not condMapEmpty!57697)) mapNonEmpty!57697))

(get-info :version)

(assert (= (and mapNonEmpty!57697 ((_ is ValueCellFull!17765) mapValue!57697)) b!1343951))

(assert (= (and b!1343950 ((_ is ValueCellFull!17765) mapDefault!57697)) b!1343952))

(assert (= start!113276 b!1343950))

(declare-fun m!1231243 () Bool)

(assert (=> b!1343948 m!1231243))

(declare-fun m!1231245 () Bool)

(assert (=> b!1343946 m!1231245))

(declare-fun m!1231247 () Bool)

(assert (=> b!1343949 m!1231247))

(assert (=> b!1343949 m!1231247))

(declare-fun m!1231249 () Bool)

(assert (=> b!1343949 m!1231249))

(declare-fun m!1231251 () Bool)

(assert (=> mapNonEmpty!57697 m!1231251))

(declare-fun m!1231253 () Bool)

(assert (=> start!113276 m!1231253))

(declare-fun m!1231255 () Bool)

(assert (=> start!113276 m!1231255))

(declare-fun m!1231257 () Bool)

(assert (=> start!113276 m!1231257))

(check-sat (not mapNonEmpty!57697) (not b!1343948) (not b!1343949) (not b_next!31327) (not start!113276) b_and!50531 tp_is_empty!37327 (not b!1343946))
(check-sat b_and!50531 (not b_next!31327))
