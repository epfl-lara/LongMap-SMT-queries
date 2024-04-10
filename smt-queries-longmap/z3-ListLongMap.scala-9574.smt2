; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113308 () Bool)

(assert start!113308)

(declare-fun b_free!31359 () Bool)

(declare-fun b_next!31359 () Bool)

(assert (=> start!113308 (= b_free!31359 (not b_next!31359))))

(declare-fun tp!109881 () Bool)

(declare-fun b_and!50581 () Bool)

(assert (=> start!113308 (= tp!109881 b_and!50581)))

(declare-fun b!1344399 () Bool)

(declare-fun res!891975 () Bool)

(declare-fun e!765172 () Bool)

(assert (=> b!1344399 (=> (not res!891975) (not e!765172))))

(declare-datatypes ((array!91560 0))(
  ( (array!91561 (arr!44236 (Array (_ BitVec 32) (_ BitVec 64))) (size!44786 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91560)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91560 (_ BitVec 32)) Bool)

(assert (=> b!1344399 (= res!891975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344400 () Bool)

(declare-fun e!765173 () Bool)

(declare-fun e!765171 () Bool)

(declare-fun mapRes!57745 () Bool)

(assert (=> b!1344400 (= e!765173 (and e!765171 mapRes!57745))))

(declare-fun condMapEmpty!57745 () Bool)

(declare-datatypes ((V!54915 0))(
  ( (V!54916 (val!18754 Int)) )
))
(declare-datatypes ((ValueCell!17781 0))(
  ( (ValueCellFull!17781 (v!21402 V!54915)) (EmptyCell!17781) )
))
(declare-datatypes ((array!91562 0))(
  ( (array!91563 (arr!44237 (Array (_ BitVec 32) ValueCell!17781)) (size!44787 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91562)

(declare-fun mapDefault!57745 () ValueCell!17781)

(assert (=> b!1344400 (= condMapEmpty!57745 (= (arr!44237 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17781)) mapDefault!57745)))))

(declare-fun b!1344401 () Bool)

(declare-fun res!891974 () Bool)

(assert (=> b!1344401 (=> (not res!891974) (not e!765172))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344401 (= res!891974 (and (= (size!44787 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44786 _keys!1571) (size!44787 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344402 () Bool)

(declare-fun res!891972 () Bool)

(assert (=> b!1344402 (=> (not res!891972) (not e!765172))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344402 (= res!891972 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44786 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344403 () Bool)

(assert (=> b!1344403 (= e!765172 false)))

(declare-fun minValue!1245 () V!54915)

(declare-fun zeroValue!1245 () V!54915)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!595188 () Bool)

(declare-datatypes ((tuple2!24168 0))(
  ( (tuple2!24169 (_1!12095 (_ BitVec 64)) (_2!12095 V!54915)) )
))
(declare-datatypes ((List!31323 0))(
  ( (Nil!31320) (Cons!31319 (h!32528 tuple2!24168) (t!45847 List!31323)) )
))
(declare-datatypes ((ListLongMap!21825 0))(
  ( (ListLongMap!21826 (toList!10928 List!31323)) )
))
(declare-fun contains!9104 (ListLongMap!21825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5884 (array!91560 array!91562 (_ BitVec 32) (_ BitVec 32) V!54915 V!54915 (_ BitVec 32) Int) ListLongMap!21825)

(assert (=> b!1344403 (= lt!595188 (contains!9104 (getCurrentListMap!5884 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!891973 () Bool)

(assert (=> start!113308 (=> (not res!891973) (not e!765172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113308 (= res!891973 (validMask!0 mask!1977))))

(assert (=> start!113308 e!765172))

(declare-fun tp_is_empty!37359 () Bool)

(assert (=> start!113308 tp_is_empty!37359))

(assert (=> start!113308 true))

(declare-fun array_inv!33337 (array!91560) Bool)

(assert (=> start!113308 (array_inv!33337 _keys!1571)))

(declare-fun array_inv!33338 (array!91562) Bool)

(assert (=> start!113308 (and (array_inv!33338 _values!1303) e!765173)))

(assert (=> start!113308 tp!109881))

(declare-fun b!1344404 () Bool)

(declare-fun res!891971 () Bool)

(assert (=> b!1344404 (=> (not res!891971) (not e!765172))))

(declare-datatypes ((List!31324 0))(
  ( (Nil!31321) (Cons!31320 (h!32529 (_ BitVec 64)) (t!45848 List!31324)) )
))
(declare-fun arrayNoDuplicates!0 (array!91560 (_ BitVec 32) List!31324) Bool)

(assert (=> b!1344404 (= res!891971 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31321))))

(declare-fun b!1344405 () Bool)

(assert (=> b!1344405 (= e!765171 tp_is_empty!37359)))

(declare-fun mapIsEmpty!57745 () Bool)

(assert (=> mapIsEmpty!57745 mapRes!57745))

(declare-fun mapNonEmpty!57745 () Bool)

(declare-fun tp!109882 () Bool)

(declare-fun e!765170 () Bool)

(assert (=> mapNonEmpty!57745 (= mapRes!57745 (and tp!109882 e!765170))))

(declare-fun mapKey!57745 () (_ BitVec 32))

(declare-fun mapValue!57745 () ValueCell!17781)

(declare-fun mapRest!57745 () (Array (_ BitVec 32) ValueCell!17781))

(assert (=> mapNonEmpty!57745 (= (arr!44237 _values!1303) (store mapRest!57745 mapKey!57745 mapValue!57745))))

(declare-fun b!1344406 () Bool)

(assert (=> b!1344406 (= e!765170 tp_is_empty!37359)))

(assert (= (and start!113308 res!891973) b!1344401))

(assert (= (and b!1344401 res!891974) b!1344399))

(assert (= (and b!1344399 res!891975) b!1344404))

(assert (= (and b!1344404 res!891971) b!1344402))

(assert (= (and b!1344402 res!891972) b!1344403))

(assert (= (and b!1344400 condMapEmpty!57745) mapIsEmpty!57745))

(assert (= (and b!1344400 (not condMapEmpty!57745)) mapNonEmpty!57745))

(get-info :version)

(assert (= (and mapNonEmpty!57745 ((_ is ValueCellFull!17781) mapValue!57745)) b!1344406))

(assert (= (and b!1344400 ((_ is ValueCellFull!17781) mapDefault!57745)) b!1344405))

(assert (= start!113308 b!1344400))

(declare-fun m!1232015 () Bool)

(assert (=> mapNonEmpty!57745 m!1232015))

(declare-fun m!1232017 () Bool)

(assert (=> start!113308 m!1232017))

(declare-fun m!1232019 () Bool)

(assert (=> start!113308 m!1232019))

(declare-fun m!1232021 () Bool)

(assert (=> start!113308 m!1232021))

(declare-fun m!1232023 () Bool)

(assert (=> b!1344399 m!1232023))

(declare-fun m!1232025 () Bool)

(assert (=> b!1344403 m!1232025))

(assert (=> b!1344403 m!1232025))

(declare-fun m!1232027 () Bool)

(assert (=> b!1344403 m!1232027))

(declare-fun m!1232029 () Bool)

(assert (=> b!1344404 m!1232029))

(check-sat (not b!1344399) (not b!1344404) (not b!1344403) tp_is_empty!37359 b_and!50581 (not start!113308) (not b_next!31359) (not mapNonEmpty!57745))
(check-sat b_and!50581 (not b_next!31359))
