; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74296 () Bool)

(assert start!74296)

(declare-fun mapIsEmpty!27353 () Bool)

(declare-fun mapRes!27353 () Bool)

(assert (=> mapIsEmpty!27353 mapRes!27353))

(declare-fun mapNonEmpty!27353 () Bool)

(declare-fun tp!52553 () Bool)

(declare-fun e!486138 () Bool)

(assert (=> mapNonEmpty!27353 (= mapRes!27353 (and tp!52553 e!486138))))

(declare-datatypes ((V!27937 0))(
  ( (V!27938 (val!8631 Int)) )
))
(declare-datatypes ((ValueCell!8144 0))(
  ( (ValueCellFull!8144 (v!11056 V!27937)) (EmptyCell!8144) )
))
(declare-fun mapValue!27353 () ValueCell!8144)

(declare-fun mapKey!27353 () (_ BitVec 32))

(declare-datatypes ((array!50531 0))(
  ( (array!50532 (arr!24291 (Array (_ BitVec 32) ValueCell!8144)) (size!24732 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50531)

(declare-fun mapRest!27353 () (Array (_ BitVec 32) ValueCell!8144))

(assert (=> mapNonEmpty!27353 (= (arr!24291 _values!688) (store mapRest!27353 mapKey!27353 mapValue!27353))))

(declare-fun b!872950 () Bool)

(declare-fun tp_is_empty!17167 () Bool)

(assert (=> b!872950 (= e!486138 tp_is_empty!17167)))

(declare-fun b!872951 () Bool)

(declare-fun e!486141 () Bool)

(declare-fun e!486140 () Bool)

(assert (=> b!872951 (= e!486141 (and e!486140 mapRes!27353))))

(declare-fun condMapEmpty!27353 () Bool)

(declare-fun mapDefault!27353 () ValueCell!8144)

(assert (=> b!872951 (= condMapEmpty!27353 (= (arr!24291 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8144)) mapDefault!27353)))))

(declare-fun res!593075 () Bool)

(declare-fun e!486139 () Bool)

(assert (=> start!74296 (=> (not res!593075) (not e!486139))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50533 0))(
  ( (array!50534 (arr!24292 (Array (_ BitVec 32) (_ BitVec 64))) (size!24733 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50533)

(assert (=> start!74296 (= res!593075 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24733 _keys!868))))))

(assert (=> start!74296 e!486139))

(assert (=> start!74296 true))

(declare-fun array_inv!19228 (array!50533) Bool)

(assert (=> start!74296 (array_inv!19228 _keys!868)))

(declare-fun array_inv!19229 (array!50531) Bool)

(assert (=> start!74296 (and (array_inv!19229 _values!688) e!486141)))

(declare-fun b!872952 () Bool)

(declare-fun res!593074 () Bool)

(assert (=> b!872952 (=> (not res!593074) (not e!486139))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!872952 (= res!593074 (and (= (size!24732 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24733 _keys!868) (size!24732 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872953 () Bool)

(assert (=> b!872953 (= e!486140 tp_is_empty!17167)))

(declare-fun b!872954 () Bool)

(declare-fun res!593077 () Bool)

(assert (=> b!872954 (=> (not res!593077) (not e!486139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50533 (_ BitVec 32)) Bool)

(assert (=> b!872954 (= res!593077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872955 () Bool)

(declare-fun res!593076 () Bool)

(assert (=> b!872955 (=> (not res!593076) (not e!486139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872955 (= res!593076 (validMask!0 mask!1196))))

(declare-fun b!872956 () Bool)

(assert (=> b!872956 (= e!486139 false)))

(declare-fun lt!395927 () Bool)

(declare-datatypes ((List!17204 0))(
  ( (Nil!17201) (Cons!17200 (h!18337 (_ BitVec 64)) (t!24233 List!17204)) )
))
(declare-fun arrayNoDuplicates!0 (array!50533 (_ BitVec 32) List!17204) Bool)

(assert (=> b!872956 (= lt!395927 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17201))))

(assert (= (and start!74296 res!593075) b!872955))

(assert (= (and b!872955 res!593076) b!872952))

(assert (= (and b!872952 res!593074) b!872954))

(assert (= (and b!872954 res!593077) b!872956))

(assert (= (and b!872951 condMapEmpty!27353) mapIsEmpty!27353))

(assert (= (and b!872951 (not condMapEmpty!27353)) mapNonEmpty!27353))

(get-info :version)

(assert (= (and mapNonEmpty!27353 ((_ is ValueCellFull!8144) mapValue!27353)) b!872950))

(assert (= (and b!872951 ((_ is ValueCellFull!8144) mapDefault!27353)) b!872953))

(assert (= start!74296 b!872951))

(declare-fun m!814325 () Bool)

(assert (=> b!872956 m!814325))

(declare-fun m!814327 () Bool)

(assert (=> b!872955 m!814327))

(declare-fun m!814329 () Bool)

(assert (=> b!872954 m!814329))

(declare-fun m!814331 () Bool)

(assert (=> start!74296 m!814331))

(declare-fun m!814333 () Bool)

(assert (=> start!74296 m!814333))

(declare-fun m!814335 () Bool)

(assert (=> mapNonEmpty!27353 m!814335))

(check-sat (not b!872955) (not start!74296) (not b!872954) tp_is_empty!17167 (not mapNonEmpty!27353) (not b!872956))
(check-sat)
