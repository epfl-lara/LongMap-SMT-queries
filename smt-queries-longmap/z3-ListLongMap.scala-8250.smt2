; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100684 () Bool)

(assert start!100684)

(declare-fun b_free!25771 () Bool)

(declare-fun b_next!25771 () Bool)

(assert (=> start!100684 (= b_free!25771 (not b_next!25771))))

(declare-fun tp!90303 () Bool)

(declare-fun b_and!42431 () Bool)

(assert (=> start!100684 (= tp!90303 b_and!42431)))

(declare-fun mapIsEmpty!47555 () Bool)

(declare-fun mapRes!47555 () Bool)

(assert (=> mapIsEmpty!47555 mapRes!47555))

(declare-fun b!1200653 () Bool)

(declare-fun e!682040 () Bool)

(declare-fun tp_is_empty!30475 () Bool)

(assert (=> b!1200653 (= e!682040 tp_is_empty!30475)))

(declare-fun b!1200654 () Bool)

(declare-fun res!798813 () Bool)

(declare-fun e!682042 () Bool)

(assert (=> b!1200654 (=> (not res!798813) (not e!682042))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77765 0))(
  ( (array!77766 (arr!37521 (Array (_ BitVec 32) (_ BitVec 64))) (size!38058 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77765)

(assert (=> b!1200654 (= res!798813 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38058 _keys!1208))))))

(declare-fun res!798807 () Bool)

(assert (=> start!100684 (=> (not res!798807) (not e!682042))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100684 (= res!798807 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38058 _keys!1208))))))

(assert (=> start!100684 e!682042))

(assert (=> start!100684 tp_is_empty!30475))

(declare-fun array_inv!28664 (array!77765) Bool)

(assert (=> start!100684 (array_inv!28664 _keys!1208)))

(assert (=> start!100684 true))

(assert (=> start!100684 tp!90303))

(declare-datatypes ((V!45761 0))(
  ( (V!45762 (val!15294 Int)) )
))
(declare-datatypes ((ValueCell!14528 0))(
  ( (ValueCellFull!14528 (v!17928 V!45761)) (EmptyCell!14528) )
))
(declare-datatypes ((array!77767 0))(
  ( (array!77768 (arr!37522 (Array (_ BitVec 32) ValueCell!14528)) (size!38059 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77767)

(declare-fun e!682044 () Bool)

(declare-fun array_inv!28665 (array!77767) Bool)

(assert (=> start!100684 (and (array_inv!28665 _values!996) e!682044)))

(declare-fun b!1200655 () Bool)

(assert (=> b!1200655 (= e!682044 (and e!682040 mapRes!47555))))

(declare-fun condMapEmpty!47555 () Bool)

(declare-fun mapDefault!47555 () ValueCell!14528)

(assert (=> b!1200655 (= condMapEmpty!47555 (= (arr!37522 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14528)) mapDefault!47555)))))

(declare-fun b!1200656 () Bool)

(declare-fun res!798816 () Bool)

(declare-fun e!682046 () Bool)

(assert (=> b!1200656 (=> (not res!798816) (not e!682046))))

(declare-fun lt!544233 () array!77765)

(declare-datatypes ((List!26411 0))(
  ( (Nil!26408) (Cons!26407 (h!27625 (_ BitVec 64)) (t!39154 List!26411)) )
))
(declare-fun arrayNoDuplicates!0 (array!77765 (_ BitVec 32) List!26411) Bool)

(assert (=> b!1200656 (= res!798816 (arrayNoDuplicates!0 lt!544233 #b00000000000000000000000000000000 Nil!26408))))

(declare-fun b!1200657 () Bool)

(declare-fun res!798814 () Bool)

(assert (=> b!1200657 (=> (not res!798814) (not e!682042))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200657 (= res!798814 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47555 () Bool)

(declare-fun tp!90302 () Bool)

(declare-fun e!682045 () Bool)

(assert (=> mapNonEmpty!47555 (= mapRes!47555 (and tp!90302 e!682045))))

(declare-fun mapValue!47555 () ValueCell!14528)

(declare-fun mapRest!47555 () (Array (_ BitVec 32) ValueCell!14528))

(declare-fun mapKey!47555 () (_ BitVec 32))

(assert (=> mapNonEmpty!47555 (= (arr!37522 _values!996) (store mapRest!47555 mapKey!47555 mapValue!47555))))

(declare-fun b!1200658 () Bool)

(declare-fun e!682041 () Bool)

(assert (=> b!1200658 (= e!682041 true)))

(declare-fun zeroValue!944 () V!45761)

(declare-datatypes ((tuple2!19594 0))(
  ( (tuple2!19595 (_1!9808 (_ BitVec 64)) (_2!9808 V!45761)) )
))
(declare-datatypes ((List!26412 0))(
  ( (Nil!26409) (Cons!26408 (h!27626 tuple2!19594) (t!39155 List!26412)) )
))
(declare-datatypes ((ListLongMap!17571 0))(
  ( (ListLongMap!17572 (toList!8801 List!26412)) )
))
(declare-fun lt!544234 () ListLongMap!17571)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45761)

(declare-fun getCurrentListMapNoExtraKeys!5268 (array!77765 array!77767 (_ BitVec 32) (_ BitVec 32) V!45761 V!45761 (_ BitVec 32) Int) ListLongMap!17571)

(declare-fun dynLambda!3212 (Int (_ BitVec 64)) V!45761)

(assert (=> b!1200658 (= lt!544234 (getCurrentListMapNoExtraKeys!5268 lt!544233 (array!77768 (store (arr!37522 _values!996) i!673 (ValueCellFull!14528 (dynLambda!3212 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38059 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544232 () ListLongMap!17571)

(assert (=> b!1200658 (= lt!544232 (getCurrentListMapNoExtraKeys!5268 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200659 () Bool)

(declare-fun res!798809 () Bool)

(assert (=> b!1200659 (=> (not res!798809) (not e!682042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77765 (_ BitVec 32)) Bool)

(assert (=> b!1200659 (= res!798809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200660 () Bool)

(declare-fun res!798811 () Bool)

(assert (=> b!1200660 (=> (not res!798811) (not e!682042))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1200660 (= res!798811 (= (select (arr!37521 _keys!1208) i!673) k0!934))))

(declare-fun b!1200661 () Bool)

(declare-fun res!798808 () Bool)

(assert (=> b!1200661 (=> (not res!798808) (not e!682042))))

(assert (=> b!1200661 (= res!798808 (and (= (size!38059 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38058 _keys!1208) (size!38059 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200662 () Bool)

(assert (=> b!1200662 (= e!682045 tp_is_empty!30475)))

(declare-fun b!1200663 () Bool)

(assert (=> b!1200663 (= e!682042 e!682046)))

(declare-fun res!798812 () Bool)

(assert (=> b!1200663 (=> (not res!798812) (not e!682046))))

(assert (=> b!1200663 (= res!798812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544233 mask!1564))))

(assert (=> b!1200663 (= lt!544233 (array!77766 (store (arr!37521 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38058 _keys!1208)))))

(declare-fun b!1200664 () Bool)

(assert (=> b!1200664 (= e!682046 (not e!682041))))

(declare-fun res!798810 () Bool)

(assert (=> b!1200664 (=> res!798810 e!682041)))

(assert (=> b!1200664 (= res!798810 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200664 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39731 0))(
  ( (Unit!39732) )
))
(declare-fun lt!544235 () Unit!39731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77765 (_ BitVec 64) (_ BitVec 32)) Unit!39731)

(assert (=> b!1200664 (= lt!544235 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200665 () Bool)

(declare-fun res!798815 () Bool)

(assert (=> b!1200665 (=> (not res!798815) (not e!682042))))

(assert (=> b!1200665 (= res!798815 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26408))))

(declare-fun b!1200666 () Bool)

(declare-fun res!798817 () Bool)

(assert (=> b!1200666 (=> (not res!798817) (not e!682042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200666 (= res!798817 (validKeyInArray!0 k0!934))))

(assert (= (and start!100684 res!798807) b!1200657))

(assert (= (and b!1200657 res!798814) b!1200661))

(assert (= (and b!1200661 res!798808) b!1200659))

(assert (= (and b!1200659 res!798809) b!1200665))

(assert (= (and b!1200665 res!798815) b!1200654))

(assert (= (and b!1200654 res!798813) b!1200666))

(assert (= (and b!1200666 res!798817) b!1200660))

(assert (= (and b!1200660 res!798811) b!1200663))

(assert (= (and b!1200663 res!798812) b!1200656))

(assert (= (and b!1200656 res!798816) b!1200664))

(assert (= (and b!1200664 (not res!798810)) b!1200658))

(assert (= (and b!1200655 condMapEmpty!47555) mapIsEmpty!47555))

(assert (= (and b!1200655 (not condMapEmpty!47555)) mapNonEmpty!47555))

(get-info :version)

(assert (= (and mapNonEmpty!47555 ((_ is ValueCellFull!14528) mapValue!47555)) b!1200662))

(assert (= (and b!1200655 ((_ is ValueCellFull!14528) mapDefault!47555)) b!1200653))

(assert (= start!100684 b!1200655))

(declare-fun b_lambda!20961 () Bool)

(assert (=> (not b_lambda!20961) (not b!1200658)))

(declare-fun t!39153 () Bool)

(declare-fun tb!10563 () Bool)

(assert (=> (and start!100684 (= defaultEntry!1004 defaultEntry!1004) t!39153) tb!10563))

(declare-fun result!21711 () Bool)

(assert (=> tb!10563 (= result!21711 tp_is_empty!30475)))

(assert (=> b!1200658 t!39153))

(declare-fun b_and!42433 () Bool)

(assert (= b_and!42431 (and (=> t!39153 result!21711) b_and!42433)))

(declare-fun m!1107491 () Bool)

(assert (=> b!1200658 m!1107491))

(declare-fun m!1107493 () Bool)

(assert (=> b!1200658 m!1107493))

(declare-fun m!1107495 () Bool)

(assert (=> b!1200658 m!1107495))

(declare-fun m!1107497 () Bool)

(assert (=> b!1200658 m!1107497))

(declare-fun m!1107499 () Bool)

(assert (=> b!1200656 m!1107499))

(declare-fun m!1107501 () Bool)

(assert (=> start!100684 m!1107501))

(declare-fun m!1107503 () Bool)

(assert (=> start!100684 m!1107503))

(declare-fun m!1107505 () Bool)

(assert (=> b!1200663 m!1107505))

(declare-fun m!1107507 () Bool)

(assert (=> b!1200663 m!1107507))

(declare-fun m!1107509 () Bool)

(assert (=> b!1200664 m!1107509))

(declare-fun m!1107511 () Bool)

(assert (=> b!1200664 m!1107511))

(declare-fun m!1107513 () Bool)

(assert (=> b!1200659 m!1107513))

(declare-fun m!1107515 () Bool)

(assert (=> b!1200666 m!1107515))

(declare-fun m!1107517 () Bool)

(assert (=> b!1200657 m!1107517))

(declare-fun m!1107519 () Bool)

(assert (=> b!1200665 m!1107519))

(declare-fun m!1107521 () Bool)

(assert (=> b!1200660 m!1107521))

(declare-fun m!1107523 () Bool)

(assert (=> mapNonEmpty!47555 m!1107523))

(check-sat (not b!1200666) (not mapNonEmpty!47555) (not b!1200664) (not b_lambda!20961) (not b!1200658) b_and!42433 (not b!1200656) (not b!1200663) (not b!1200665) (not b!1200657) (not start!100684) (not b!1200659) (not b_next!25771) tp_is_empty!30475)
(check-sat b_and!42433 (not b_next!25771))
