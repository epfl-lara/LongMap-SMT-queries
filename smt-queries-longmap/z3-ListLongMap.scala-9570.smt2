; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113284 () Bool)

(assert start!113284)

(declare-fun b_free!31335 () Bool)

(declare-fun b_next!31335 () Bool)

(assert (=> start!113284 (= b_free!31335 (not b_next!31335))))

(declare-fun tp!109809 () Bool)

(declare-fun b_and!50557 () Bool)

(assert (=> start!113284 (= tp!109809 b_and!50557)))

(declare-fun b!1344111 () Bool)

(declare-fun res!891795 () Bool)

(declare-fun e!764990 () Bool)

(assert (=> b!1344111 (=> (not res!891795) (not e!764990))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91514 0))(
  ( (array!91515 (arr!44213 (Array (_ BitVec 32) (_ BitVec 64))) (size!44763 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91514)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344111 (= res!891795 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44763 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344112 () Bool)

(assert (=> b!1344112 (= e!764990 false)))

(declare-datatypes ((V!54883 0))(
  ( (V!54884 (val!18742 Int)) )
))
(declare-fun minValue!1245 () V!54883)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54883)

(declare-fun lt!595152 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17769 0))(
  ( (ValueCellFull!17769 (v!21390 V!54883)) (EmptyCell!17769) )
))
(declare-datatypes ((array!91516 0))(
  ( (array!91517 (arr!44214 (Array (_ BitVec 32) ValueCell!17769)) (size!44764 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91516)

(declare-datatypes ((tuple2!24150 0))(
  ( (tuple2!24151 (_1!12086 (_ BitVec 64)) (_2!12086 V!54883)) )
))
(declare-datatypes ((List!31305 0))(
  ( (Nil!31302) (Cons!31301 (h!32510 tuple2!24150) (t!45829 List!31305)) )
))
(declare-datatypes ((ListLongMap!21807 0))(
  ( (ListLongMap!21808 (toList!10919 List!31305)) )
))
(declare-fun contains!9095 (ListLongMap!21807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5875 (array!91514 array!91516 (_ BitVec 32) (_ BitVec 32) V!54883 V!54883 (_ BitVec 32) Int) ListLongMap!21807)

(assert (=> b!1344112 (= lt!595152 (contains!9095 (getCurrentListMap!5875 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344113 () Bool)

(declare-fun res!891793 () Bool)

(assert (=> b!1344113 (=> (not res!891793) (not e!764990))))

(assert (=> b!1344113 (= res!891793 (and (= (size!44764 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44763 _keys!1571) (size!44764 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57709 () Bool)

(declare-fun mapRes!57709 () Bool)

(assert (=> mapIsEmpty!57709 mapRes!57709))

(declare-fun b!1344114 () Bool)

(declare-fun e!764989 () Bool)

(declare-fun tp_is_empty!37335 () Bool)

(assert (=> b!1344114 (= e!764989 tp_is_empty!37335)))

(declare-fun res!891791 () Bool)

(assert (=> start!113284 (=> (not res!891791) (not e!764990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113284 (= res!891791 (validMask!0 mask!1977))))

(assert (=> start!113284 e!764990))

(assert (=> start!113284 tp_is_empty!37335))

(assert (=> start!113284 true))

(declare-fun array_inv!33321 (array!91514) Bool)

(assert (=> start!113284 (array_inv!33321 _keys!1571)))

(declare-fun e!764991 () Bool)

(declare-fun array_inv!33322 (array!91516) Bool)

(assert (=> start!113284 (and (array_inv!33322 _values!1303) e!764991)))

(assert (=> start!113284 tp!109809))

(declare-fun b!1344115 () Bool)

(declare-fun e!764992 () Bool)

(assert (=> b!1344115 (= e!764991 (and e!764992 mapRes!57709))))

(declare-fun condMapEmpty!57709 () Bool)

(declare-fun mapDefault!57709 () ValueCell!17769)

(assert (=> b!1344115 (= condMapEmpty!57709 (= (arr!44214 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17769)) mapDefault!57709)))))

(declare-fun mapNonEmpty!57709 () Bool)

(declare-fun tp!109810 () Bool)

(assert (=> mapNonEmpty!57709 (= mapRes!57709 (and tp!109810 e!764989))))

(declare-fun mapRest!57709 () (Array (_ BitVec 32) ValueCell!17769))

(declare-fun mapValue!57709 () ValueCell!17769)

(declare-fun mapKey!57709 () (_ BitVec 32))

(assert (=> mapNonEmpty!57709 (= (arr!44214 _values!1303) (store mapRest!57709 mapKey!57709 mapValue!57709))))

(declare-fun b!1344116 () Bool)

(declare-fun res!891792 () Bool)

(assert (=> b!1344116 (=> (not res!891792) (not e!764990))))

(declare-datatypes ((List!31306 0))(
  ( (Nil!31303) (Cons!31302 (h!32511 (_ BitVec 64)) (t!45830 List!31306)) )
))
(declare-fun arrayNoDuplicates!0 (array!91514 (_ BitVec 32) List!31306) Bool)

(assert (=> b!1344116 (= res!891792 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31303))))

(declare-fun b!1344117 () Bool)

(declare-fun res!891794 () Bool)

(assert (=> b!1344117 (=> (not res!891794) (not e!764990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91514 (_ BitVec 32)) Bool)

(assert (=> b!1344117 (= res!891794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344118 () Bool)

(assert (=> b!1344118 (= e!764992 tp_is_empty!37335)))

(assert (= (and start!113284 res!891791) b!1344113))

(assert (= (and b!1344113 res!891793) b!1344117))

(assert (= (and b!1344117 res!891794) b!1344116))

(assert (= (and b!1344116 res!891792) b!1344111))

(assert (= (and b!1344111 res!891795) b!1344112))

(assert (= (and b!1344115 condMapEmpty!57709) mapIsEmpty!57709))

(assert (= (and b!1344115 (not condMapEmpty!57709)) mapNonEmpty!57709))

(get-info :version)

(assert (= (and mapNonEmpty!57709 ((_ is ValueCellFull!17769) mapValue!57709)) b!1344114))

(assert (= (and b!1344115 ((_ is ValueCellFull!17769) mapDefault!57709)) b!1344118))

(assert (= start!113284 b!1344115))

(declare-fun m!1231823 () Bool)

(assert (=> mapNonEmpty!57709 m!1231823))

(declare-fun m!1231825 () Bool)

(assert (=> start!113284 m!1231825))

(declare-fun m!1231827 () Bool)

(assert (=> start!113284 m!1231827))

(declare-fun m!1231829 () Bool)

(assert (=> start!113284 m!1231829))

(declare-fun m!1231831 () Bool)

(assert (=> b!1344117 m!1231831))

(declare-fun m!1231833 () Bool)

(assert (=> b!1344116 m!1231833))

(declare-fun m!1231835 () Bool)

(assert (=> b!1344112 m!1231835))

(assert (=> b!1344112 m!1231835))

(declare-fun m!1231837 () Bool)

(assert (=> b!1344112 m!1231837))

(check-sat (not b_next!31335) (not b!1344116) b_and!50557 tp_is_empty!37335 (not b!1344117) (not mapNonEmpty!57709) (not start!113284) (not b!1344112))
(check-sat b_and!50557 (not b_next!31335))
