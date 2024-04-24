; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97900 () Bool)

(assert start!97900)

(declare-fun b!1117513 () Bool)

(declare-fun res!745766 () Bool)

(declare-fun e!636832 () Bool)

(assert (=> b!1117513 (=> (not res!745766) (not e!636832))))

(declare-datatypes ((array!72729 0))(
  ( (array!72730 (arr!35011 (Array (_ BitVec 32) (_ BitVec 64))) (size!35548 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72729)

(declare-datatypes ((List!24383 0))(
  ( (Nil!24380) (Cons!24379 (h!25597 (_ BitVec 64)) (t!34856 List!24383)) )
))
(declare-fun arrayNoDuplicates!0 (array!72729 (_ BitVec 32) List!24383) Bool)

(assert (=> b!1117513 (= res!745766 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24380))))

(declare-fun b!1117514 () Bool)

(declare-fun res!745768 () Bool)

(assert (=> b!1117514 (=> (not res!745768) (not e!636832))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117514 (= res!745768 (= (select (arr!35011 _keys!1208) i!673) k0!934))))

(declare-fun b!1117515 () Bool)

(declare-fun e!636834 () Bool)

(assert (=> b!1117515 (= e!636832 e!636834)))

(declare-fun res!745770 () Bool)

(assert (=> b!1117515 (=> (not res!745770) (not e!636834))))

(declare-fun lt!497611 () array!72729)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72729 (_ BitVec 32)) Bool)

(assert (=> b!1117515 (= res!745770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497611 mask!1564))))

(assert (=> b!1117515 (= lt!497611 (array!72730 (store (arr!35011 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35548 _keys!1208)))))

(declare-fun res!745774 () Bool)

(assert (=> start!97900 (=> (not res!745774) (not e!636832))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97900 (= res!745774 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35548 _keys!1208))))))

(assert (=> start!97900 e!636832))

(declare-fun array_inv!26974 (array!72729) Bool)

(assert (=> start!97900 (array_inv!26974 _keys!1208)))

(assert (=> start!97900 true))

(declare-datatypes ((V!42321 0))(
  ( (V!42322 (val!14004 Int)) )
))
(declare-datatypes ((ValueCell!13238 0))(
  ( (ValueCellFull!13238 (v!16633 V!42321)) (EmptyCell!13238) )
))
(declare-datatypes ((array!72731 0))(
  ( (array!72732 (arr!35012 (Array (_ BitVec 32) ValueCell!13238)) (size!35549 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72731)

(declare-fun e!636830 () Bool)

(declare-fun array_inv!26975 (array!72731) Bool)

(assert (=> start!97900 (and (array_inv!26975 _values!996) e!636830)))

(declare-fun b!1117516 () Bool)

(declare-fun res!745765 () Bool)

(assert (=> b!1117516 (=> (not res!745765) (not e!636832))))

(assert (=> b!1117516 (= res!745765 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35548 _keys!1208))))))

(declare-fun b!1117517 () Bool)

(declare-fun e!636833 () Bool)

(declare-fun mapRes!43660 () Bool)

(assert (=> b!1117517 (= e!636830 (and e!636833 mapRes!43660))))

(declare-fun condMapEmpty!43660 () Bool)

(declare-fun mapDefault!43660 () ValueCell!13238)

(assert (=> b!1117517 (= condMapEmpty!43660 (= (arr!35012 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13238)) mapDefault!43660)))))

(declare-fun b!1117518 () Bool)

(declare-fun e!636831 () Bool)

(declare-fun tp_is_empty!27895 () Bool)

(assert (=> b!1117518 (= e!636831 tp_is_empty!27895)))

(declare-fun b!1117519 () Bool)

(declare-fun res!745771 () Bool)

(assert (=> b!1117519 (=> (not res!745771) (not e!636832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117519 (= res!745771 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43660 () Bool)

(assert (=> mapIsEmpty!43660 mapRes!43660))

(declare-fun b!1117520 () Bool)

(assert (=> b!1117520 (= e!636833 tp_is_empty!27895)))

(declare-fun b!1117521 () Bool)

(declare-fun res!745769 () Bool)

(assert (=> b!1117521 (=> (not res!745769) (not e!636832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117521 (= res!745769 (validMask!0 mask!1564))))

(declare-fun b!1117522 () Bool)

(assert (=> b!1117522 (= e!636834 (not true))))

(declare-fun arrayContainsKey!0 (array!72729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117522 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36601 0))(
  ( (Unit!36602) )
))
(declare-fun lt!497610 () Unit!36601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72729 (_ BitVec 64) (_ BitVec 32)) Unit!36601)

(assert (=> b!1117522 (= lt!497610 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117523 () Bool)

(declare-fun res!745772 () Bool)

(assert (=> b!1117523 (=> (not res!745772) (not e!636832))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117523 (= res!745772 (and (= (size!35549 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35548 _keys!1208) (size!35549 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117524 () Bool)

(declare-fun res!745773 () Bool)

(assert (=> b!1117524 (=> (not res!745773) (not e!636834))))

(assert (=> b!1117524 (= res!745773 (arrayNoDuplicates!0 lt!497611 #b00000000000000000000000000000000 Nil!24380))))

(declare-fun mapNonEmpty!43660 () Bool)

(declare-fun tp!82904 () Bool)

(assert (=> mapNonEmpty!43660 (= mapRes!43660 (and tp!82904 e!636831))))

(declare-fun mapValue!43660 () ValueCell!13238)

(declare-fun mapKey!43660 () (_ BitVec 32))

(declare-fun mapRest!43660 () (Array (_ BitVec 32) ValueCell!13238))

(assert (=> mapNonEmpty!43660 (= (arr!35012 _values!996) (store mapRest!43660 mapKey!43660 mapValue!43660))))

(declare-fun b!1117525 () Bool)

(declare-fun res!745767 () Bool)

(assert (=> b!1117525 (=> (not res!745767) (not e!636832))))

(assert (=> b!1117525 (= res!745767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97900 res!745774) b!1117521))

(assert (= (and b!1117521 res!745769) b!1117523))

(assert (= (and b!1117523 res!745772) b!1117525))

(assert (= (and b!1117525 res!745767) b!1117513))

(assert (= (and b!1117513 res!745766) b!1117516))

(assert (= (and b!1117516 res!745765) b!1117519))

(assert (= (and b!1117519 res!745771) b!1117514))

(assert (= (and b!1117514 res!745768) b!1117515))

(assert (= (and b!1117515 res!745770) b!1117524))

(assert (= (and b!1117524 res!745773) b!1117522))

(assert (= (and b!1117517 condMapEmpty!43660) mapIsEmpty!43660))

(assert (= (and b!1117517 (not condMapEmpty!43660)) mapNonEmpty!43660))

(get-info :version)

(assert (= (and mapNonEmpty!43660 ((_ is ValueCellFull!13238) mapValue!43660)) b!1117518))

(assert (= (and b!1117517 ((_ is ValueCellFull!13238) mapDefault!43660)) b!1117520))

(assert (= start!97900 b!1117517))

(declare-fun m!1034151 () Bool)

(assert (=> mapNonEmpty!43660 m!1034151))

(declare-fun m!1034153 () Bool)

(assert (=> b!1117519 m!1034153))

(declare-fun m!1034155 () Bool)

(assert (=> b!1117513 m!1034155))

(declare-fun m!1034157 () Bool)

(assert (=> b!1117524 m!1034157))

(declare-fun m!1034159 () Bool)

(assert (=> b!1117515 m!1034159))

(declare-fun m!1034161 () Bool)

(assert (=> b!1117515 m!1034161))

(declare-fun m!1034163 () Bool)

(assert (=> b!1117525 m!1034163))

(declare-fun m!1034165 () Bool)

(assert (=> start!97900 m!1034165))

(declare-fun m!1034167 () Bool)

(assert (=> start!97900 m!1034167))

(declare-fun m!1034169 () Bool)

(assert (=> b!1117522 m!1034169))

(declare-fun m!1034171 () Bool)

(assert (=> b!1117522 m!1034171))

(declare-fun m!1034173 () Bool)

(assert (=> b!1117521 m!1034173))

(declare-fun m!1034175 () Bool)

(assert (=> b!1117514 m!1034175))

(check-sat (not b!1117515) (not b!1117521) tp_is_empty!27895 (not start!97900) (not b!1117513) (not b!1117522) (not b!1117524) (not b!1117519) (not b!1117525) (not mapNonEmpty!43660))
(check-sat)
