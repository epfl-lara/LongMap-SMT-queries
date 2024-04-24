; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113254 () Bool)

(assert start!113254)

(declare-fun b_free!31081 () Bool)

(declare-fun b_next!31081 () Bool)

(assert (=> start!113254 (= b_free!31081 (not b_next!31081))))

(declare-fun tp!109048 () Bool)

(declare-fun b_and!50113 () Bool)

(assert (=> start!113254 (= tp!109048 b_and!50113)))

(declare-fun b!1340991 () Bool)

(declare-fun e!763930 () Bool)

(declare-fun tp_is_empty!37081 () Bool)

(assert (=> b!1340991 (= e!763930 tp_is_empty!37081)))

(declare-fun b!1340992 () Bool)

(declare-fun e!763927 () Bool)

(assert (=> b!1340992 (= e!763927 false)))

(declare-datatypes ((V!54545 0))(
  ( (V!54546 (val!18615 Int)) )
))
(declare-fun minValue!1245 () V!54545)

(declare-fun lt!594392 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91139 0))(
  ( (array!91140 (arr!44021 (Array (_ BitVec 32) (_ BitVec 64))) (size!44572 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91139)

(declare-fun zeroValue!1245 () V!54545)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17642 0))(
  ( (ValueCellFull!17642 (v!21258 V!54545)) (EmptyCell!17642) )
))
(declare-datatypes ((array!91141 0))(
  ( (array!91142 (arr!44022 (Array (_ BitVec 32) ValueCell!17642)) (size!44573 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91141)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((tuple2!24012 0))(
  ( (tuple2!24013 (_1!12017 (_ BitVec 64)) (_2!12017 V!54545)) )
))
(declare-datatypes ((List!31168 0))(
  ( (Nil!31165) (Cons!31164 (h!32382 tuple2!24012) (t!45492 List!31168)) )
))
(declare-datatypes ((ListLongMap!21677 0))(
  ( (ListLongMap!21678 (toList!10854 List!31168)) )
))
(declare-fun contains!9042 (ListLongMap!21677 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5807 (array!91139 array!91141 (_ BitVec 32) (_ BitVec 32) V!54545 V!54545 (_ BitVec 32) Int) ListLongMap!21677)

(assert (=> b!1340992 (= lt!594392 (contains!9042 (getCurrentListMap!5807 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57328 () Bool)

(declare-fun mapRes!57328 () Bool)

(assert (=> mapIsEmpty!57328 mapRes!57328))

(declare-fun b!1340994 () Bool)

(declare-fun res!889225 () Bool)

(assert (=> b!1340994 (=> (not res!889225) (not e!763927))))

(assert (=> b!1340994 (= res!889225 (and (= (size!44573 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44572 _keys!1571) (size!44573 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340995 () Bool)

(declare-fun e!763929 () Bool)

(assert (=> b!1340995 (= e!763929 tp_is_empty!37081)))

(declare-fun b!1340996 () Bool)

(declare-fun e!763931 () Bool)

(assert (=> b!1340996 (= e!763931 (and e!763929 mapRes!57328))))

(declare-fun condMapEmpty!57328 () Bool)

(declare-fun mapDefault!57328 () ValueCell!17642)

(assert (=> b!1340996 (= condMapEmpty!57328 (= (arr!44022 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17642)) mapDefault!57328)))))

(declare-fun mapNonEmpty!57328 () Bool)

(declare-fun tp!109047 () Bool)

(assert (=> mapNonEmpty!57328 (= mapRes!57328 (and tp!109047 e!763930))))

(declare-fun mapRest!57328 () (Array (_ BitVec 32) ValueCell!17642))

(declare-fun mapKey!57328 () (_ BitVec 32))

(declare-fun mapValue!57328 () ValueCell!17642)

(assert (=> mapNonEmpty!57328 (= (arr!44022 _values!1303) (store mapRest!57328 mapKey!57328 mapValue!57328))))

(declare-fun b!1340993 () Bool)

(declare-fun res!889226 () Bool)

(assert (=> b!1340993 (=> (not res!889226) (not e!763927))))

(assert (=> b!1340993 (= res!889226 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44572 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!889229 () Bool)

(assert (=> start!113254 (=> (not res!889229) (not e!763927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113254 (= res!889229 (validMask!0 mask!1977))))

(assert (=> start!113254 e!763927))

(assert (=> start!113254 tp_is_empty!37081))

(assert (=> start!113254 true))

(declare-fun array_inv!33459 (array!91139) Bool)

(assert (=> start!113254 (array_inv!33459 _keys!1571)))

(declare-fun array_inv!33460 (array!91141) Bool)

(assert (=> start!113254 (and (array_inv!33460 _values!1303) e!763931)))

(assert (=> start!113254 tp!109048))

(declare-fun b!1340997 () Bool)

(declare-fun res!889228 () Bool)

(assert (=> b!1340997 (=> (not res!889228) (not e!763927))))

(declare-datatypes ((List!31169 0))(
  ( (Nil!31166) (Cons!31165 (h!32383 (_ BitVec 64)) (t!45493 List!31169)) )
))
(declare-fun arrayNoDuplicates!0 (array!91139 (_ BitVec 32) List!31169) Bool)

(assert (=> b!1340997 (= res!889228 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31166))))

(declare-fun b!1340998 () Bool)

(declare-fun res!889227 () Bool)

(assert (=> b!1340998 (=> (not res!889227) (not e!763927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91139 (_ BitVec 32)) Bool)

(assert (=> b!1340998 (= res!889227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113254 res!889229) b!1340994))

(assert (= (and b!1340994 res!889225) b!1340998))

(assert (= (and b!1340998 res!889227) b!1340997))

(assert (= (and b!1340997 res!889228) b!1340993))

(assert (= (and b!1340993 res!889226) b!1340992))

(assert (= (and b!1340996 condMapEmpty!57328) mapIsEmpty!57328))

(assert (= (and b!1340996 (not condMapEmpty!57328)) mapNonEmpty!57328))

(get-info :version)

(assert (= (and mapNonEmpty!57328 ((_ is ValueCellFull!17642) mapValue!57328)) b!1340991))

(assert (= (and b!1340996 ((_ is ValueCellFull!17642) mapDefault!57328)) b!1340995))

(assert (= start!113254 b!1340996))

(declare-fun m!1229259 () Bool)

(assert (=> b!1340998 m!1229259))

(declare-fun m!1229261 () Bool)

(assert (=> b!1340997 m!1229261))

(declare-fun m!1229263 () Bool)

(assert (=> mapNonEmpty!57328 m!1229263))

(declare-fun m!1229265 () Bool)

(assert (=> b!1340992 m!1229265))

(assert (=> b!1340992 m!1229265))

(declare-fun m!1229267 () Bool)

(assert (=> b!1340992 m!1229267))

(declare-fun m!1229269 () Bool)

(assert (=> start!113254 m!1229269))

(declare-fun m!1229271 () Bool)

(assert (=> start!113254 m!1229271))

(declare-fun m!1229273 () Bool)

(assert (=> start!113254 m!1229273))

(check-sat (not b!1340992) (not b!1340997) tp_is_empty!37081 (not mapNonEmpty!57328) b_and!50113 (not b_next!31081) (not start!113254) (not b!1340998))
(check-sat b_and!50113 (not b_next!31081))
