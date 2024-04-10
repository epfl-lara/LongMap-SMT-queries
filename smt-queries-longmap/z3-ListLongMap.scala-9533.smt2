; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113062 () Bool)

(assert start!113062)

(declare-fun b_free!31113 () Bool)

(declare-fun b_next!31113 () Bool)

(assert (=> start!113062 (= b_free!31113 (not b_next!31113))))

(declare-fun tp!109143 () Bool)

(declare-fun b_and!50143 () Bool)

(assert (=> start!113062 (= tp!109143 b_and!50143)))

(declare-fun b!1340076 () Bool)

(declare-fun e!763328 () Bool)

(declare-fun e!763327 () Bool)

(declare-fun mapRes!57376 () Bool)

(assert (=> b!1340076 (= e!763328 (and e!763327 mapRes!57376))))

(declare-fun condMapEmpty!57376 () Bool)

(declare-datatypes ((V!54587 0))(
  ( (V!54588 (val!18631 Int)) )
))
(declare-datatypes ((ValueCell!17658 0))(
  ( (ValueCellFull!17658 (v!21279 V!54587)) (EmptyCell!17658) )
))
(declare-datatypes ((array!91080 0))(
  ( (array!91081 (arr!43996 (Array (_ BitVec 32) ValueCell!17658)) (size!44546 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91080)

(declare-fun mapDefault!57376 () ValueCell!17658)

(assert (=> b!1340076 (= condMapEmpty!57376 (= (arr!43996 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17658)) mapDefault!57376)))))

(declare-fun b!1340077 () Bool)

(declare-fun res!888948 () Bool)

(declare-fun e!763326 () Bool)

(assert (=> b!1340077 (=> (not res!888948) (not e!763326))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91082 0))(
  ( (array!91083 (arr!43997 (Array (_ BitVec 32) (_ BitVec 64))) (size!44547 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91082)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340077 (= res!888948 (and (= (size!44546 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44547 _keys!1571) (size!44546 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340078 () Bool)

(declare-fun res!888947 () Bool)

(assert (=> b!1340078 (=> (not res!888947) (not e!763326))))

(declare-datatypes ((List!31142 0))(
  ( (Nil!31139) (Cons!31138 (h!32347 (_ BitVec 64)) (t!45474 List!31142)) )
))
(declare-fun arrayNoDuplicates!0 (array!91082 (_ BitVec 32) List!31142) Bool)

(assert (=> b!1340078 (= res!888947 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31139))))

(declare-fun mapIsEmpty!57376 () Bool)

(assert (=> mapIsEmpty!57376 mapRes!57376))

(declare-fun b!1340079 () Bool)

(declare-fun res!888950 () Bool)

(assert (=> b!1340079 (=> (not res!888950) (not e!763326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91082 (_ BitVec 32)) Bool)

(assert (=> b!1340079 (= res!888950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340080 () Bool)

(declare-fun res!888949 () Bool)

(assert (=> b!1340080 (=> (not res!888949) (not e!763326))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340080 (= res!888949 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44547 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340081 () Bool)

(declare-fun e!763325 () Bool)

(declare-fun tp_is_empty!37113 () Bool)

(assert (=> b!1340081 (= e!763325 tp_is_empty!37113)))

(declare-fun b!1340082 () Bool)

(assert (=> b!1340082 (= e!763326 false)))

(declare-fun minValue!1245 () V!54587)

(declare-fun lt!593964 () Bool)

(declare-fun zeroValue!1245 () V!54587)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!23976 0))(
  ( (tuple2!23977 (_1!11999 (_ BitVec 64)) (_2!11999 V!54587)) )
))
(declare-datatypes ((List!31143 0))(
  ( (Nil!31140) (Cons!31139 (h!32348 tuple2!23976) (t!45475 List!31143)) )
))
(declare-datatypes ((ListLongMap!21633 0))(
  ( (ListLongMap!21634 (toList!10832 List!31143)) )
))
(declare-fun contains!9008 (ListLongMap!21633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5801 (array!91082 array!91080 (_ BitVec 32) (_ BitVec 32) V!54587 V!54587 (_ BitVec 32) Int) ListLongMap!21633)

(assert (=> b!1340082 (= lt!593964 (contains!9008 (getCurrentListMap!5801 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!888951 () Bool)

(assert (=> start!113062 (=> (not res!888951) (not e!763326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113062 (= res!888951 (validMask!0 mask!1977))))

(assert (=> start!113062 e!763326))

(assert (=> start!113062 tp_is_empty!37113))

(assert (=> start!113062 true))

(declare-fun array_inv!33173 (array!91082) Bool)

(assert (=> start!113062 (array_inv!33173 _keys!1571)))

(declare-fun array_inv!33174 (array!91080) Bool)

(assert (=> start!113062 (and (array_inv!33174 _values!1303) e!763328)))

(assert (=> start!113062 tp!109143))

(declare-fun b!1340083 () Bool)

(assert (=> b!1340083 (= e!763327 tp_is_empty!37113)))

(declare-fun mapNonEmpty!57376 () Bool)

(declare-fun tp!109144 () Bool)

(assert (=> mapNonEmpty!57376 (= mapRes!57376 (and tp!109144 e!763325))))

(declare-fun mapKey!57376 () (_ BitVec 32))

(declare-fun mapValue!57376 () ValueCell!17658)

(declare-fun mapRest!57376 () (Array (_ BitVec 32) ValueCell!17658))

(assert (=> mapNonEmpty!57376 (= (arr!43996 _values!1303) (store mapRest!57376 mapKey!57376 mapValue!57376))))

(assert (= (and start!113062 res!888951) b!1340077))

(assert (= (and b!1340077 res!888948) b!1340079))

(assert (= (and b!1340079 res!888950) b!1340078))

(assert (= (and b!1340078 res!888947) b!1340080))

(assert (= (and b!1340080 res!888949) b!1340082))

(assert (= (and b!1340076 condMapEmpty!57376) mapIsEmpty!57376))

(assert (= (and b!1340076 (not condMapEmpty!57376)) mapNonEmpty!57376))

(get-info :version)

(assert (= (and mapNonEmpty!57376 ((_ is ValueCellFull!17658) mapValue!57376)) b!1340081))

(assert (= (and b!1340076 ((_ is ValueCellFull!17658) mapDefault!57376)) b!1340083))

(assert (= start!113062 b!1340076))

(declare-fun m!1227917 () Bool)

(assert (=> b!1340078 m!1227917))

(declare-fun m!1227919 () Bool)

(assert (=> b!1340079 m!1227919))

(declare-fun m!1227921 () Bool)

(assert (=> start!113062 m!1227921))

(declare-fun m!1227923 () Bool)

(assert (=> start!113062 m!1227923))

(declare-fun m!1227925 () Bool)

(assert (=> start!113062 m!1227925))

(declare-fun m!1227927 () Bool)

(assert (=> b!1340082 m!1227927))

(assert (=> b!1340082 m!1227927))

(declare-fun m!1227929 () Bool)

(assert (=> b!1340082 m!1227929))

(declare-fun m!1227931 () Bool)

(assert (=> mapNonEmpty!57376 m!1227931))

(check-sat (not b!1340082) (not b!1340079) (not mapNonEmpty!57376) (not start!113062) (not b_next!31113) tp_is_empty!37113 b_and!50143 (not b!1340078))
(check-sat b_and!50143 (not b_next!31113))
