; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97768 () Bool)

(assert start!97768)

(declare-fun mapNonEmpty!43462 () Bool)

(declare-fun mapRes!43462 () Bool)

(declare-fun tp!82706 () Bool)

(declare-fun e!635641 () Bool)

(assert (=> mapNonEmpty!43462 (= mapRes!43462 (and tp!82706 e!635641))))

(declare-fun mapKey!43462 () (_ BitVec 32))

(declare-datatypes ((V!42145 0))(
  ( (V!42146 (val!13938 Int)) )
))
(declare-datatypes ((ValueCell!13172 0))(
  ( (ValueCellFull!13172 (v!16567 V!42145)) (EmptyCell!13172) )
))
(declare-fun mapRest!43462 () (Array (_ BitVec 32) ValueCell!13172))

(declare-fun mapValue!43462 () ValueCell!13172)

(declare-datatypes ((array!72471 0))(
  ( (array!72472 (arr!34882 (Array (_ BitVec 32) ValueCell!13172)) (size!35419 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72471)

(assert (=> mapNonEmpty!43462 (= (arr!34882 _values!996) (store mapRest!43462 mapKey!43462 mapValue!43462))))

(declare-fun b!1114939 () Bool)

(declare-fun tp_is_empty!27763 () Bool)

(assert (=> b!1114939 (= e!635641 tp_is_empty!27763)))

(declare-fun res!743786 () Bool)

(declare-fun e!635645 () Bool)

(assert (=> start!97768 (=> (not res!743786) (not e!635645))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72473 0))(
  ( (array!72474 (arr!34883 (Array (_ BitVec 32) (_ BitVec 64))) (size!35420 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72473)

(assert (=> start!97768 (= res!743786 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35420 _keys!1208))))))

(assert (=> start!97768 e!635645))

(declare-fun array_inv!26878 (array!72473) Bool)

(assert (=> start!97768 (array_inv!26878 _keys!1208)))

(assert (=> start!97768 true))

(declare-fun e!635642 () Bool)

(declare-fun array_inv!26879 (array!72471) Bool)

(assert (=> start!97768 (and (array_inv!26879 _values!996) e!635642)))

(declare-fun b!1114940 () Bool)

(declare-fun res!743792 () Bool)

(assert (=> b!1114940 (=> (not res!743792) (not e!635645))))

(declare-datatypes ((List!24331 0))(
  ( (Nil!24328) (Cons!24327 (h!25545 (_ BitVec 64)) (t!34804 List!24331)) )
))
(declare-fun arrayNoDuplicates!0 (array!72473 (_ BitVec 32) List!24331) Bool)

(assert (=> b!1114940 (= res!743792 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24328))))

(declare-fun b!1114941 () Bool)

(declare-fun res!743789 () Bool)

(assert (=> b!1114941 (=> (not res!743789) (not e!635645))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114941 (= res!743789 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43462 () Bool)

(assert (=> mapIsEmpty!43462 mapRes!43462))

(declare-fun b!1114942 () Bool)

(declare-fun res!743788 () Bool)

(assert (=> b!1114942 (=> (not res!743788) (not e!635645))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114942 (= res!743788 (= (select (arr!34883 _keys!1208) i!673) k0!934))))

(declare-fun b!1114943 () Bool)

(declare-fun e!635644 () Bool)

(assert (=> b!1114943 (= e!635644 tp_is_empty!27763)))

(declare-fun b!1114944 () Bool)

(declare-fun e!635643 () Bool)

(assert (=> b!1114944 (= e!635645 e!635643)))

(declare-fun res!743790 () Bool)

(assert (=> b!1114944 (=> (not res!743790) (not e!635643))))

(declare-fun lt!497214 () array!72473)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72473 (_ BitVec 32)) Bool)

(assert (=> b!1114944 (= res!743790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497214 mask!1564))))

(assert (=> b!1114944 (= lt!497214 (array!72474 (store (arr!34883 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35420 _keys!1208)))))

(declare-fun b!1114945 () Bool)

(declare-fun res!743794 () Bool)

(assert (=> b!1114945 (=> (not res!743794) (not e!635645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114945 (= res!743794 (validMask!0 mask!1564))))

(declare-fun b!1114946 () Bool)

(declare-fun res!743793 () Bool)

(assert (=> b!1114946 (=> (not res!743793) (not e!635645))))

(assert (=> b!1114946 (= res!743793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114947 () Bool)

(declare-fun res!743787 () Bool)

(assert (=> b!1114947 (=> (not res!743787) (not e!635645))))

(assert (=> b!1114947 (= res!743787 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35420 _keys!1208))))))

(declare-fun b!1114948 () Bool)

(declare-fun res!743791 () Bool)

(assert (=> b!1114948 (=> (not res!743791) (not e!635643))))

(assert (=> b!1114948 (= res!743791 (arrayNoDuplicates!0 lt!497214 #b00000000000000000000000000000000 Nil!24328))))

(declare-fun b!1114949 () Bool)

(assert (=> b!1114949 (= e!635643 (not true))))

(declare-fun arrayContainsKey!0 (array!72473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114949 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36523 0))(
  ( (Unit!36524) )
))
(declare-fun lt!497215 () Unit!36523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72473 (_ BitVec 64) (_ BitVec 32)) Unit!36523)

(assert (=> b!1114949 (= lt!497215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114950 () Bool)

(declare-fun res!743785 () Bool)

(assert (=> b!1114950 (=> (not res!743785) (not e!635645))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114950 (= res!743785 (and (= (size!35419 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35420 _keys!1208) (size!35419 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114951 () Bool)

(assert (=> b!1114951 (= e!635642 (and e!635644 mapRes!43462))))

(declare-fun condMapEmpty!43462 () Bool)

(declare-fun mapDefault!43462 () ValueCell!13172)

(assert (=> b!1114951 (= condMapEmpty!43462 (= (arr!34882 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13172)) mapDefault!43462)))))

(assert (= (and start!97768 res!743786) b!1114945))

(assert (= (and b!1114945 res!743794) b!1114950))

(assert (= (and b!1114950 res!743785) b!1114946))

(assert (= (and b!1114946 res!743793) b!1114940))

(assert (= (and b!1114940 res!743792) b!1114947))

(assert (= (and b!1114947 res!743787) b!1114941))

(assert (= (and b!1114941 res!743789) b!1114942))

(assert (= (and b!1114942 res!743788) b!1114944))

(assert (= (and b!1114944 res!743790) b!1114948))

(assert (= (and b!1114948 res!743791) b!1114949))

(assert (= (and b!1114951 condMapEmpty!43462) mapIsEmpty!43462))

(assert (= (and b!1114951 (not condMapEmpty!43462)) mapNonEmpty!43462))

(get-info :version)

(assert (= (and mapNonEmpty!43462 ((_ is ValueCellFull!13172) mapValue!43462)) b!1114939))

(assert (= (and b!1114951 ((_ is ValueCellFull!13172) mapDefault!43462)) b!1114943))

(assert (= start!97768 b!1114951))

(declare-fun m!1032435 () Bool)

(assert (=> b!1114949 m!1032435))

(declare-fun m!1032437 () Bool)

(assert (=> b!1114949 m!1032437))

(declare-fun m!1032439 () Bool)

(assert (=> b!1114945 m!1032439))

(declare-fun m!1032441 () Bool)

(assert (=> mapNonEmpty!43462 m!1032441))

(declare-fun m!1032443 () Bool)

(assert (=> b!1114941 m!1032443))

(declare-fun m!1032445 () Bool)

(assert (=> b!1114940 m!1032445))

(declare-fun m!1032447 () Bool)

(assert (=> start!97768 m!1032447))

(declare-fun m!1032449 () Bool)

(assert (=> start!97768 m!1032449))

(declare-fun m!1032451 () Bool)

(assert (=> b!1114948 m!1032451))

(declare-fun m!1032453 () Bool)

(assert (=> b!1114944 m!1032453))

(declare-fun m!1032455 () Bool)

(assert (=> b!1114944 m!1032455))

(declare-fun m!1032457 () Bool)

(assert (=> b!1114946 m!1032457))

(declare-fun m!1032459 () Bool)

(assert (=> b!1114942 m!1032459))

(check-sat (not b!1114946) (not start!97768) (not b!1114941) (not b!1114944) (not b!1114945) (not b!1114940) (not b!1114949) (not b!1114948) (not mapNonEmpty!43462) tp_is_empty!27763)
(check-sat)
