; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97660 () Bool)

(assert start!97660)

(declare-fun b!1116108 () Bool)

(declare-fun e!635938 () Bool)

(declare-fun e!635942 () Bool)

(assert (=> b!1116108 (= e!635938 e!635942)))

(declare-fun res!745184 () Bool)

(assert (=> b!1116108 (=> (not res!745184) (not e!635942))))

(declare-datatypes ((array!72679 0))(
  ( (array!72680 (arr!34992 (Array (_ BitVec 32) (_ BitVec 64))) (size!35528 (_ BitVec 32))) )
))
(declare-fun lt!497083 () array!72679)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72679 (_ BitVec 32)) Bool)

(assert (=> b!1116108 (= res!745184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497083 mask!1564))))

(declare-fun _keys!1208 () array!72679)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116108 (= lt!497083 (array!72680 (store (arr!34992 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35528 _keys!1208)))))

(declare-fun mapIsEmpty!43654 () Bool)

(declare-fun mapRes!43654 () Bool)

(assert (=> mapIsEmpty!43654 mapRes!43654))

(declare-fun b!1116109 () Bool)

(declare-fun e!635939 () Bool)

(declare-fun tp_is_empty!27891 () Bool)

(assert (=> b!1116109 (= e!635939 tp_is_empty!27891)))

(declare-fun b!1116110 () Bool)

(declare-fun res!745185 () Bool)

(assert (=> b!1116110 (=> (not res!745185) (not e!635938))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116110 (= res!745185 (validKeyInArray!0 k0!934))))

(declare-fun res!745191 () Bool)

(assert (=> start!97660 (=> (not res!745191) (not e!635938))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97660 (= res!745191 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35528 _keys!1208))))))

(assert (=> start!97660 e!635938))

(declare-fun array_inv!26898 (array!72679) Bool)

(assert (=> start!97660 (array_inv!26898 _keys!1208)))

(assert (=> start!97660 true))

(declare-datatypes ((V!42315 0))(
  ( (V!42316 (val!14002 Int)) )
))
(declare-datatypes ((ValueCell!13236 0))(
  ( (ValueCellFull!13236 (v!16635 V!42315)) (EmptyCell!13236) )
))
(declare-datatypes ((array!72681 0))(
  ( (array!72682 (arr!34993 (Array (_ BitVec 32) ValueCell!13236)) (size!35529 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72681)

(declare-fun e!635940 () Bool)

(declare-fun array_inv!26899 (array!72681) Bool)

(assert (=> start!97660 (and (array_inv!26899 _values!996) e!635940)))

(declare-fun mapNonEmpty!43654 () Bool)

(declare-fun tp!82898 () Bool)

(assert (=> mapNonEmpty!43654 (= mapRes!43654 (and tp!82898 e!635939))))

(declare-fun mapKey!43654 () (_ BitVec 32))

(declare-fun mapRest!43654 () (Array (_ BitVec 32) ValueCell!13236))

(declare-fun mapValue!43654 () ValueCell!13236)

(assert (=> mapNonEmpty!43654 (= (arr!34993 _values!996) (store mapRest!43654 mapKey!43654 mapValue!43654))))

(declare-fun b!1116111 () Bool)

(declare-fun res!745183 () Bool)

(assert (=> b!1116111 (=> (not res!745183) (not e!635938))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116111 (= res!745183 (and (= (size!35529 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35528 _keys!1208) (size!35529 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116112 () Bool)

(assert (=> b!1116112 (= e!635942 (not true))))

(declare-fun arrayContainsKey!0 (array!72679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116112 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36632 0))(
  ( (Unit!36633) )
))
(declare-fun lt!497084 () Unit!36632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72679 (_ BitVec 64) (_ BitVec 32)) Unit!36632)

(assert (=> b!1116112 (= lt!497084 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116113 () Bool)

(declare-fun res!745186 () Bool)

(assert (=> b!1116113 (=> (not res!745186) (not e!635938))))

(assert (=> b!1116113 (= res!745186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116114 () Bool)

(declare-fun e!635943 () Bool)

(assert (=> b!1116114 (= e!635943 tp_is_empty!27891)))

(declare-fun b!1116115 () Bool)

(declare-fun res!745188 () Bool)

(assert (=> b!1116115 (=> (not res!745188) (not e!635938))))

(assert (=> b!1116115 (= res!745188 (= (select (arr!34992 _keys!1208) i!673) k0!934))))

(declare-fun b!1116116 () Bool)

(declare-fun res!745187 () Bool)

(assert (=> b!1116116 (=> (not res!745187) (not e!635942))))

(declare-datatypes ((List!24361 0))(
  ( (Nil!24358) (Cons!24357 (h!25566 (_ BitVec 64)) (t!34842 List!24361)) )
))
(declare-fun arrayNoDuplicates!0 (array!72679 (_ BitVec 32) List!24361) Bool)

(assert (=> b!1116116 (= res!745187 (arrayNoDuplicates!0 lt!497083 #b00000000000000000000000000000000 Nil!24358))))

(declare-fun b!1116117 () Bool)

(declare-fun res!745192 () Bool)

(assert (=> b!1116117 (=> (not res!745192) (not e!635938))))

(assert (=> b!1116117 (= res!745192 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35528 _keys!1208))))))

(declare-fun b!1116118 () Bool)

(declare-fun res!745190 () Bool)

(assert (=> b!1116118 (=> (not res!745190) (not e!635938))))

(assert (=> b!1116118 (= res!745190 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24358))))

(declare-fun b!1116119 () Bool)

(assert (=> b!1116119 (= e!635940 (and e!635943 mapRes!43654))))

(declare-fun condMapEmpty!43654 () Bool)

(declare-fun mapDefault!43654 () ValueCell!13236)

(assert (=> b!1116119 (= condMapEmpty!43654 (= (arr!34993 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13236)) mapDefault!43654)))))

(declare-fun b!1116120 () Bool)

(declare-fun res!745189 () Bool)

(assert (=> b!1116120 (=> (not res!745189) (not e!635938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116120 (= res!745189 (validMask!0 mask!1564))))

(assert (= (and start!97660 res!745191) b!1116120))

(assert (= (and b!1116120 res!745189) b!1116111))

(assert (= (and b!1116111 res!745183) b!1116113))

(assert (= (and b!1116113 res!745186) b!1116118))

(assert (= (and b!1116118 res!745190) b!1116117))

(assert (= (and b!1116117 res!745192) b!1116110))

(assert (= (and b!1116110 res!745185) b!1116115))

(assert (= (and b!1116115 res!745188) b!1116108))

(assert (= (and b!1116108 res!745184) b!1116116))

(assert (= (and b!1116116 res!745187) b!1116112))

(assert (= (and b!1116119 condMapEmpty!43654) mapIsEmpty!43654))

(assert (= (and b!1116119 (not condMapEmpty!43654)) mapNonEmpty!43654))

(get-info :version)

(assert (= (and mapNonEmpty!43654 ((_ is ValueCellFull!13236) mapValue!43654)) b!1116109))

(assert (= (and b!1116119 ((_ is ValueCellFull!13236) mapDefault!43654)) b!1116114))

(assert (= start!97660 b!1116119))

(declare-fun m!1032427 () Bool)

(assert (=> b!1116116 m!1032427))

(declare-fun m!1032429 () Bool)

(assert (=> b!1116110 m!1032429))

(declare-fun m!1032431 () Bool)

(assert (=> b!1116113 m!1032431))

(declare-fun m!1032433 () Bool)

(assert (=> mapNonEmpty!43654 m!1032433))

(declare-fun m!1032435 () Bool)

(assert (=> b!1116108 m!1032435))

(declare-fun m!1032437 () Bool)

(assert (=> b!1116108 m!1032437))

(declare-fun m!1032439 () Bool)

(assert (=> b!1116120 m!1032439))

(declare-fun m!1032441 () Bool)

(assert (=> b!1116118 m!1032441))

(declare-fun m!1032443 () Bool)

(assert (=> b!1116112 m!1032443))

(declare-fun m!1032445 () Bool)

(assert (=> b!1116112 m!1032445))

(declare-fun m!1032447 () Bool)

(assert (=> b!1116115 m!1032447))

(declare-fun m!1032449 () Bool)

(assert (=> start!97660 m!1032449))

(declare-fun m!1032451 () Bool)

(assert (=> start!97660 m!1032451))

(check-sat (not b!1116113) (not start!97660) (not b!1116108) (not mapNonEmpty!43654) (not b!1116112) (not b!1116120) tp_is_empty!27891 (not b!1116118) (not b!1116110) (not b!1116116))
(check-sat)
