; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97402 () Bool)

(assert start!97402)

(declare-fun b!1106578 () Bool)

(declare-fun res!737976 () Bool)

(declare-fun e!631686 () Bool)

(assert (=> b!1106578 (=> (not res!737976) (not e!631686))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71751 0))(
  ( (array!71752 (arr!34522 (Array (_ BitVec 32) (_ BitVec 64))) (size!35059 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71751)

(assert (=> b!1106578 (= res!737976 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35059 _keys!1208))))))

(declare-fun b!1106579 () Bool)

(declare-fun e!631685 () Bool)

(declare-fun tp_is_empty!27397 () Bool)

(assert (=> b!1106579 (= e!631685 tp_is_empty!27397)))

(declare-fun b!1106580 () Bool)

(declare-fun e!631684 () Bool)

(assert (=> b!1106580 (= e!631686 e!631684)))

(declare-fun res!737974 () Bool)

(assert (=> b!1106580 (=> (not res!737974) (not e!631684))))

(declare-fun lt!495792 () array!71751)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71751 (_ BitVec 32)) Bool)

(assert (=> b!1106580 (= res!737974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495792 mask!1564))))

(assert (=> b!1106580 (= lt!495792 (array!71752 (store (arr!34522 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35059 _keys!1208)))))

(declare-fun b!1106581 () Bool)

(declare-fun res!737977 () Bool)

(assert (=> b!1106581 (=> (not res!737977) (not e!631686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106581 (= res!737977 (validMask!0 mask!1564))))

(declare-fun res!737978 () Bool)

(assert (=> start!97402 (=> (not res!737978) (not e!631686))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97402 (= res!737978 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35059 _keys!1208))))))

(assert (=> start!97402 e!631686))

(declare-fun array_inv!26614 (array!71751) Bool)

(assert (=> start!97402 (array_inv!26614 _keys!1208)))

(assert (=> start!97402 true))

(declare-datatypes ((V!41657 0))(
  ( (V!41658 (val!13755 Int)) )
))
(declare-datatypes ((ValueCell!12989 0))(
  ( (ValueCellFull!12989 (v!16384 V!41657)) (EmptyCell!12989) )
))
(declare-datatypes ((array!71753 0))(
  ( (array!71754 (arr!34523 (Array (_ BitVec 32) ValueCell!12989)) (size!35060 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71753)

(declare-fun e!631681 () Bool)

(declare-fun array_inv!26615 (array!71753) Bool)

(assert (=> start!97402 (and (array_inv!26615 _values!996) e!631681)))

(declare-fun mapNonEmpty!42913 () Bool)

(declare-fun mapRes!42913 () Bool)

(declare-fun tp!81833 () Bool)

(assert (=> mapNonEmpty!42913 (= mapRes!42913 (and tp!81833 e!631685))))

(declare-fun mapKey!42913 () (_ BitVec 32))

(declare-fun mapValue!42913 () ValueCell!12989)

(declare-fun mapRest!42913 () (Array (_ BitVec 32) ValueCell!12989))

(assert (=> mapNonEmpty!42913 (= (arr!34523 _values!996) (store mapRest!42913 mapKey!42913 mapValue!42913))))

(declare-fun b!1106582 () Bool)

(assert (=> b!1106582 (= e!631684 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106582 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36255 0))(
  ( (Unit!36256) )
))
(declare-fun lt!495793 () Unit!36255)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71751 (_ BitVec 64) (_ BitVec 32)) Unit!36255)

(assert (=> b!1106582 (= lt!495793 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106583 () Bool)

(declare-fun res!737980 () Bool)

(assert (=> b!1106583 (=> (not res!737980) (not e!631686))))

(declare-datatypes ((List!24094 0))(
  ( (Nil!24091) (Cons!24090 (h!25308 (_ BitVec 64)) (t!34351 List!24094)) )
))
(declare-fun arrayNoDuplicates!0 (array!71751 (_ BitVec 32) List!24094) Bool)

(assert (=> b!1106583 (= res!737980 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24091))))

(declare-fun b!1106584 () Bool)

(declare-fun e!631683 () Bool)

(assert (=> b!1106584 (= e!631681 (and e!631683 mapRes!42913))))

(declare-fun condMapEmpty!42913 () Bool)

(declare-fun mapDefault!42913 () ValueCell!12989)

(assert (=> b!1106584 (= condMapEmpty!42913 (= (arr!34523 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12989)) mapDefault!42913)))))

(declare-fun b!1106585 () Bool)

(assert (=> b!1106585 (= e!631683 tp_is_empty!27397)))

(declare-fun b!1106586 () Bool)

(declare-fun res!737971 () Bool)

(assert (=> b!1106586 (=> (not res!737971) (not e!631686))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106586 (= res!737971 (and (= (size!35060 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35059 _keys!1208) (size!35060 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106587 () Bool)

(declare-fun res!737975 () Bool)

(assert (=> b!1106587 (=> (not res!737975) (not e!631686))))

(assert (=> b!1106587 (= res!737975 (= (select (arr!34522 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!42913 () Bool)

(assert (=> mapIsEmpty!42913 mapRes!42913))

(declare-fun b!1106588 () Bool)

(declare-fun res!737972 () Bool)

(assert (=> b!1106588 (=> (not res!737972) (not e!631684))))

(assert (=> b!1106588 (= res!737972 (arrayNoDuplicates!0 lt!495792 #b00000000000000000000000000000000 Nil!24091))))

(declare-fun b!1106589 () Bool)

(declare-fun res!737979 () Bool)

(assert (=> b!1106589 (=> (not res!737979) (not e!631686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106589 (= res!737979 (validKeyInArray!0 k0!934))))

(declare-fun b!1106590 () Bool)

(declare-fun res!737973 () Bool)

(assert (=> b!1106590 (=> (not res!737973) (not e!631686))))

(assert (=> b!1106590 (= res!737973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97402 res!737978) b!1106581))

(assert (= (and b!1106581 res!737977) b!1106586))

(assert (= (and b!1106586 res!737971) b!1106590))

(assert (= (and b!1106590 res!737973) b!1106583))

(assert (= (and b!1106583 res!737980) b!1106578))

(assert (= (and b!1106578 res!737976) b!1106589))

(assert (= (and b!1106589 res!737979) b!1106587))

(assert (= (and b!1106587 res!737975) b!1106580))

(assert (= (and b!1106580 res!737974) b!1106588))

(assert (= (and b!1106588 res!737972) b!1106582))

(assert (= (and b!1106584 condMapEmpty!42913) mapIsEmpty!42913))

(assert (= (and b!1106584 (not condMapEmpty!42913)) mapNonEmpty!42913))

(get-info :version)

(assert (= (and mapNonEmpty!42913 ((_ is ValueCellFull!12989) mapValue!42913)) b!1106579))

(assert (= (and b!1106584 ((_ is ValueCellFull!12989) mapDefault!42913)) b!1106585))

(assert (= start!97402 b!1106584))

(declare-fun m!1026381 () Bool)

(assert (=> start!97402 m!1026381))

(declare-fun m!1026383 () Bool)

(assert (=> start!97402 m!1026383))

(declare-fun m!1026385 () Bool)

(assert (=> b!1106589 m!1026385))

(declare-fun m!1026387 () Bool)

(assert (=> b!1106588 m!1026387))

(declare-fun m!1026389 () Bool)

(assert (=> b!1106580 m!1026389))

(declare-fun m!1026391 () Bool)

(assert (=> b!1106580 m!1026391))

(declare-fun m!1026393 () Bool)

(assert (=> b!1106587 m!1026393))

(declare-fun m!1026395 () Bool)

(assert (=> b!1106583 m!1026395))

(declare-fun m!1026397 () Bool)

(assert (=> b!1106581 m!1026397))

(declare-fun m!1026399 () Bool)

(assert (=> b!1106590 m!1026399))

(declare-fun m!1026401 () Bool)

(assert (=> b!1106582 m!1026401))

(declare-fun m!1026403 () Bool)

(assert (=> b!1106582 m!1026403))

(declare-fun m!1026405 () Bool)

(assert (=> mapNonEmpty!42913 m!1026405))

(check-sat tp_is_empty!27397 (not b!1106588) (not b!1106581) (not b!1106583) (not b!1106589) (not b!1106580) (not mapNonEmpty!42913) (not b!1106590) (not b!1106582) (not start!97402))
(check-sat)
