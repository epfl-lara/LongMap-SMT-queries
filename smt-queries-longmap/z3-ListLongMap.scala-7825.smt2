; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97688 () Bool)

(assert start!97688)

(declare-fun mapIsEmpty!43705 () Bool)

(declare-fun mapRes!43705 () Bool)

(assert (=> mapIsEmpty!43705 mapRes!43705))

(declare-fun b!1116642 () Bool)

(declare-fun e!636165 () Bool)

(assert (=> b!1116642 (= e!636165 (not true))))

(declare-datatypes ((array!72648 0))(
  ( (array!72649 (arr!34977 (Array (_ BitVec 32) (_ BitVec 64))) (size!35515 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72648)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116642 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36473 0))(
  ( (Unit!36474) )
))
(declare-fun lt!496986 () Unit!36473)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72648 (_ BitVec 64) (_ BitVec 32)) Unit!36473)

(assert (=> b!1116642 (= lt!496986 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116643 () Bool)

(declare-fun res!745632 () Bool)

(declare-fun e!636166 () Bool)

(assert (=> b!1116643 (=> (not res!745632) (not e!636166))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72648 (_ BitVec 32)) Bool)

(assert (=> b!1116643 (= res!745632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116644 () Bool)

(declare-fun res!745630 () Bool)

(assert (=> b!1116644 (=> (not res!745630) (not e!636166))))

(assert (=> b!1116644 (= res!745630 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35515 _keys!1208))))))

(declare-fun b!1116645 () Bool)

(declare-fun res!745627 () Bool)

(assert (=> b!1116645 (=> (not res!745627) (not e!636166))))

(declare-datatypes ((List!24410 0))(
  ( (Nil!24407) (Cons!24406 (h!25615 (_ BitVec 64)) (t!34882 List!24410)) )
))
(declare-fun arrayNoDuplicates!0 (array!72648 (_ BitVec 32) List!24410) Bool)

(assert (=> b!1116645 (= res!745627 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24407))))

(declare-fun b!1116646 () Bool)

(assert (=> b!1116646 (= e!636166 e!636165)))

(declare-fun res!745626 () Bool)

(assert (=> b!1116646 (=> (not res!745626) (not e!636165))))

(declare-fun lt!496985 () array!72648)

(assert (=> b!1116646 (= res!745626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496985 mask!1564))))

(assert (=> b!1116646 (= lt!496985 (array!72649 (store (arr!34977 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35515 _keys!1208)))))

(declare-fun b!1116647 () Bool)

(declare-fun res!745629 () Bool)

(assert (=> b!1116647 (=> (not res!745629) (not e!636165))))

(assert (=> b!1116647 (= res!745629 (arrayNoDuplicates!0 lt!496985 #b00000000000000000000000000000000 Nil!24407))))

(declare-fun mapNonEmpty!43705 () Bool)

(declare-fun tp!82949 () Bool)

(declare-fun e!636163 () Bool)

(assert (=> mapNonEmpty!43705 (= mapRes!43705 (and tp!82949 e!636163))))

(declare-datatypes ((V!42361 0))(
  ( (V!42362 (val!14019 Int)) )
))
(declare-datatypes ((ValueCell!13253 0))(
  ( (ValueCellFull!13253 (v!16651 V!42361)) (EmptyCell!13253) )
))
(declare-fun mapRest!43705 () (Array (_ BitVec 32) ValueCell!13253))

(declare-fun mapKey!43705 () (_ BitVec 32))

(declare-datatypes ((array!72650 0))(
  ( (array!72651 (arr!34978 (Array (_ BitVec 32) ValueCell!13253)) (size!35516 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72650)

(declare-fun mapValue!43705 () ValueCell!13253)

(assert (=> mapNonEmpty!43705 (= (arr!34978 _values!996) (store mapRest!43705 mapKey!43705 mapValue!43705))))

(declare-fun b!1116648 () Bool)

(declare-fun tp_is_empty!27925 () Bool)

(assert (=> b!1116648 (= e!636163 tp_is_empty!27925)))

(declare-fun b!1116649 () Bool)

(declare-fun res!745631 () Bool)

(assert (=> b!1116649 (=> (not res!745631) (not e!636166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116649 (= res!745631 (validMask!0 mask!1564))))

(declare-fun b!1116650 () Bool)

(declare-fun res!745624 () Bool)

(assert (=> b!1116650 (=> (not res!745624) (not e!636166))))

(assert (=> b!1116650 (= res!745624 (= (select (arr!34977 _keys!1208) i!673) k0!934))))

(declare-fun b!1116651 () Bool)

(declare-fun e!636167 () Bool)

(declare-fun e!636168 () Bool)

(assert (=> b!1116651 (= e!636167 (and e!636168 mapRes!43705))))

(declare-fun condMapEmpty!43705 () Bool)

(declare-fun mapDefault!43705 () ValueCell!13253)

(assert (=> b!1116651 (= condMapEmpty!43705 (= (arr!34978 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13253)) mapDefault!43705)))))

(declare-fun b!1116652 () Bool)

(assert (=> b!1116652 (= e!636168 tp_is_empty!27925)))

(declare-fun res!745633 () Bool)

(assert (=> start!97688 (=> (not res!745633) (not e!636166))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97688 (= res!745633 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35515 _keys!1208))))))

(assert (=> start!97688 e!636166))

(declare-fun array_inv!26954 (array!72648) Bool)

(assert (=> start!97688 (array_inv!26954 _keys!1208)))

(assert (=> start!97688 true))

(declare-fun array_inv!26955 (array!72650) Bool)

(assert (=> start!97688 (and (array_inv!26955 _values!996) e!636167)))

(declare-fun b!1116653 () Bool)

(declare-fun res!745625 () Bool)

(assert (=> b!1116653 (=> (not res!745625) (not e!636166))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116653 (= res!745625 (and (= (size!35516 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35515 _keys!1208) (size!35516 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116654 () Bool)

(declare-fun res!745628 () Bool)

(assert (=> b!1116654 (=> (not res!745628) (not e!636166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116654 (= res!745628 (validKeyInArray!0 k0!934))))

(assert (= (and start!97688 res!745633) b!1116649))

(assert (= (and b!1116649 res!745631) b!1116653))

(assert (= (and b!1116653 res!745625) b!1116643))

(assert (= (and b!1116643 res!745632) b!1116645))

(assert (= (and b!1116645 res!745627) b!1116644))

(assert (= (and b!1116644 res!745630) b!1116654))

(assert (= (and b!1116654 res!745628) b!1116650))

(assert (= (and b!1116650 res!745624) b!1116646))

(assert (= (and b!1116646 res!745626) b!1116647))

(assert (= (and b!1116647 res!745629) b!1116642))

(assert (= (and b!1116651 condMapEmpty!43705) mapIsEmpty!43705))

(assert (= (and b!1116651 (not condMapEmpty!43705)) mapNonEmpty!43705))

(get-info :version)

(assert (= (and mapNonEmpty!43705 ((_ is ValueCellFull!13253) mapValue!43705)) b!1116648))

(assert (= (and b!1116651 ((_ is ValueCellFull!13253) mapDefault!43705)) b!1116652))

(assert (= start!97688 b!1116651))

(declare-fun m!1032243 () Bool)

(assert (=> b!1116643 m!1032243))

(declare-fun m!1032245 () Bool)

(assert (=> b!1116642 m!1032245))

(declare-fun m!1032247 () Bool)

(assert (=> b!1116642 m!1032247))

(declare-fun m!1032249 () Bool)

(assert (=> b!1116647 m!1032249))

(declare-fun m!1032251 () Bool)

(assert (=> b!1116645 m!1032251))

(declare-fun m!1032253 () Bool)

(assert (=> b!1116649 m!1032253))

(declare-fun m!1032255 () Bool)

(assert (=> mapNonEmpty!43705 m!1032255))

(declare-fun m!1032257 () Bool)

(assert (=> b!1116646 m!1032257))

(declare-fun m!1032259 () Bool)

(assert (=> b!1116646 m!1032259))

(declare-fun m!1032261 () Bool)

(assert (=> b!1116650 m!1032261))

(declare-fun m!1032263 () Bool)

(assert (=> start!97688 m!1032263))

(declare-fun m!1032265 () Bool)

(assert (=> start!97688 m!1032265))

(declare-fun m!1032267 () Bool)

(assert (=> b!1116654 m!1032267))

(check-sat (not b!1116643) (not mapNonEmpty!43705) (not b!1116654) (not b!1116645) (not start!97688) tp_is_empty!27925 (not b!1116649) (not b!1116647) (not b!1116642) (not b!1116646))
(check-sat)
