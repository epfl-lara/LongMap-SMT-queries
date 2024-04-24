; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97852 () Bool)

(assert start!97852)

(declare-fun b!1116577 () Bool)

(declare-fun e!636398 () Bool)

(declare-fun tp_is_empty!27847 () Bool)

(assert (=> b!1116577 (= e!636398 tp_is_empty!27847)))

(declare-fun b!1116578 () Bool)

(declare-fun e!636402 () Bool)

(assert (=> b!1116578 (= e!636402 tp_is_empty!27847)))

(declare-fun b!1116579 () Bool)

(declare-fun res!745050 () Bool)

(declare-fun e!636399 () Bool)

(assert (=> b!1116579 (=> (not res!745050) (not e!636399))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116579 (= res!745050 (validMask!0 mask!1564))))

(declare-fun b!1116580 () Bool)

(declare-fun res!745051 () Bool)

(assert (=> b!1116580 (=> (not res!745051) (not e!636399))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72633 0))(
  ( (array!72634 (arr!34963 (Array (_ BitVec 32) (_ BitVec 64))) (size!35500 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72633)

(assert (=> b!1116580 (= res!745051 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35500 _keys!1208))))))

(declare-fun b!1116581 () Bool)

(declare-fun res!745046 () Bool)

(declare-fun e!636397 () Bool)

(assert (=> b!1116581 (=> (not res!745046) (not e!636397))))

(declare-fun lt!497466 () array!72633)

(declare-datatypes ((List!24362 0))(
  ( (Nil!24359) (Cons!24358 (h!25576 (_ BitVec 64)) (t!34835 List!24362)) )
))
(declare-fun arrayNoDuplicates!0 (array!72633 (_ BitVec 32) List!24362) Bool)

(assert (=> b!1116581 (= res!745046 (arrayNoDuplicates!0 lt!497466 #b00000000000000000000000000000000 Nil!24359))))

(declare-fun b!1116582 () Bool)

(declare-fun res!745053 () Bool)

(assert (=> b!1116582 (=> (not res!745053) (not e!636399))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116582 (= res!745053 (validKeyInArray!0 k0!934))))

(declare-fun b!1116583 () Bool)

(declare-fun res!745045 () Bool)

(assert (=> b!1116583 (=> (not res!745045) (not e!636399))))

(assert (=> b!1116583 (= res!745045 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24359))))

(declare-fun res!745048 () Bool)

(assert (=> start!97852 (=> (not res!745048) (not e!636399))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97852 (= res!745048 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35500 _keys!1208))))))

(assert (=> start!97852 e!636399))

(declare-fun array_inv!26938 (array!72633) Bool)

(assert (=> start!97852 (array_inv!26938 _keys!1208)))

(assert (=> start!97852 true))

(declare-datatypes ((V!42257 0))(
  ( (V!42258 (val!13980 Int)) )
))
(declare-datatypes ((ValueCell!13214 0))(
  ( (ValueCellFull!13214 (v!16609 V!42257)) (EmptyCell!13214) )
))
(declare-datatypes ((array!72635 0))(
  ( (array!72636 (arr!34964 (Array (_ BitVec 32) ValueCell!13214)) (size!35501 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72635)

(declare-fun e!636401 () Bool)

(declare-fun array_inv!26939 (array!72635) Bool)

(assert (=> start!97852 (and (array_inv!26939 _values!996) e!636401)))

(declare-fun b!1116584 () Bool)

(assert (=> b!1116584 (= e!636399 e!636397)))

(declare-fun res!745052 () Bool)

(assert (=> b!1116584 (=> (not res!745052) (not e!636397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72633 (_ BitVec 32)) Bool)

(assert (=> b!1116584 (= res!745052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497466 mask!1564))))

(assert (=> b!1116584 (= lt!497466 (array!72634 (store (arr!34963 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35500 _keys!1208)))))

(declare-fun b!1116585 () Bool)

(declare-fun res!745049 () Bool)

(assert (=> b!1116585 (=> (not res!745049) (not e!636399))))

(assert (=> b!1116585 (= res!745049 (= (select (arr!34963 _keys!1208) i!673) k0!934))))

(declare-fun b!1116586 () Bool)

(declare-fun res!745047 () Bool)

(assert (=> b!1116586 (=> (not res!745047) (not e!636399))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116586 (= res!745047 (and (= (size!35501 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35500 _keys!1208) (size!35501 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43588 () Bool)

(declare-fun mapRes!43588 () Bool)

(declare-fun tp!82832 () Bool)

(assert (=> mapNonEmpty!43588 (= mapRes!43588 (and tp!82832 e!636402))))

(declare-fun mapValue!43588 () ValueCell!13214)

(declare-fun mapRest!43588 () (Array (_ BitVec 32) ValueCell!13214))

(declare-fun mapKey!43588 () (_ BitVec 32))

(assert (=> mapNonEmpty!43588 (= (arr!34964 _values!996) (store mapRest!43588 mapKey!43588 mapValue!43588))))

(declare-fun mapIsEmpty!43588 () Bool)

(assert (=> mapIsEmpty!43588 mapRes!43588))

(declare-fun b!1116587 () Bool)

(assert (=> b!1116587 (= e!636397 (not true))))

(declare-fun arrayContainsKey!0 (array!72633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116587 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36569 0))(
  ( (Unit!36570) )
))
(declare-fun lt!497467 () Unit!36569)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72633 (_ BitVec 64) (_ BitVec 32)) Unit!36569)

(assert (=> b!1116587 (= lt!497467 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116588 () Bool)

(assert (=> b!1116588 (= e!636401 (and e!636398 mapRes!43588))))

(declare-fun condMapEmpty!43588 () Bool)

(declare-fun mapDefault!43588 () ValueCell!13214)

(assert (=> b!1116588 (= condMapEmpty!43588 (= (arr!34964 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13214)) mapDefault!43588)))))

(declare-fun b!1116589 () Bool)

(declare-fun res!745054 () Bool)

(assert (=> b!1116589 (=> (not res!745054) (not e!636399))))

(assert (=> b!1116589 (= res!745054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97852 res!745048) b!1116579))

(assert (= (and b!1116579 res!745050) b!1116586))

(assert (= (and b!1116586 res!745047) b!1116589))

(assert (= (and b!1116589 res!745054) b!1116583))

(assert (= (and b!1116583 res!745045) b!1116580))

(assert (= (and b!1116580 res!745051) b!1116582))

(assert (= (and b!1116582 res!745053) b!1116585))

(assert (= (and b!1116585 res!745049) b!1116584))

(assert (= (and b!1116584 res!745052) b!1116581))

(assert (= (and b!1116581 res!745046) b!1116587))

(assert (= (and b!1116588 condMapEmpty!43588) mapIsEmpty!43588))

(assert (= (and b!1116588 (not condMapEmpty!43588)) mapNonEmpty!43588))

(get-info :version)

(assert (= (and mapNonEmpty!43588 ((_ is ValueCellFull!13214) mapValue!43588)) b!1116578))

(assert (= (and b!1116588 ((_ is ValueCellFull!13214) mapDefault!43588)) b!1116577))

(assert (= start!97852 b!1116588))

(declare-fun m!1033527 () Bool)

(assert (=> b!1116582 m!1033527))

(declare-fun m!1033529 () Bool)

(assert (=> b!1116589 m!1033529))

(declare-fun m!1033531 () Bool)

(assert (=> b!1116579 m!1033531))

(declare-fun m!1033533 () Bool)

(assert (=> b!1116587 m!1033533))

(declare-fun m!1033535 () Bool)

(assert (=> b!1116587 m!1033535))

(declare-fun m!1033537 () Bool)

(assert (=> b!1116583 m!1033537))

(declare-fun m!1033539 () Bool)

(assert (=> mapNonEmpty!43588 m!1033539))

(declare-fun m!1033541 () Bool)

(assert (=> b!1116584 m!1033541))

(declare-fun m!1033543 () Bool)

(assert (=> b!1116584 m!1033543))

(declare-fun m!1033545 () Bool)

(assert (=> b!1116585 m!1033545))

(declare-fun m!1033547 () Bool)

(assert (=> b!1116581 m!1033547))

(declare-fun m!1033549 () Bool)

(assert (=> start!97852 m!1033549))

(declare-fun m!1033551 () Bool)

(assert (=> start!97852 m!1033551))

(check-sat (not b!1116581) (not b!1116587) (not b!1116582) (not b!1116579) (not start!97852) (not mapNonEmpty!43588) (not b!1116584) (not b!1116583) tp_is_empty!27847 (not b!1116589))
(check-sat)
