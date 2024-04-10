; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100420 () Bool)

(assert start!100420)

(declare-fun b_free!25743 () Bool)

(declare-fun b_next!25743 () Bool)

(assert (=> start!100420 (= b_free!25743 (not b_next!25743))))

(declare-fun tp!90219 () Bool)

(declare-fun b_and!42373 () Bool)

(assert (=> start!100420 (= tp!90219 b_and!42373)))

(declare-fun b!1198748 () Bool)

(declare-fun res!797843 () Bool)

(declare-fun e!680914 () Bool)

(assert (=> b!1198748 (=> (not res!797843) (not e!680914))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198748 (= res!797843 (validKeyInArray!0 k0!934))))

(declare-fun b!1198749 () Bool)

(declare-fun e!680915 () Bool)

(assert (=> b!1198749 (= e!680914 e!680915)))

(declare-fun res!797842 () Bool)

(assert (=> b!1198749 (=> (not res!797842) (not e!680915))))

(declare-datatypes ((array!77671 0))(
  ( (array!77672 (arr!37480 (Array (_ BitVec 32) (_ BitVec 64))) (size!38016 (_ BitVec 32))) )
))
(declare-fun lt!543581 () array!77671)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77671 (_ BitVec 32)) Bool)

(assert (=> b!1198749 (= res!797842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543581 mask!1564))))

(declare-fun _keys!1208 () array!77671)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198749 (= lt!543581 (array!77672 (store (arr!37480 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38016 _keys!1208)))))

(declare-fun b!1198750 () Bool)

(declare-fun res!797841 () Bool)

(assert (=> b!1198750 (=> (not res!797841) (not e!680914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198750 (= res!797841 (validMask!0 mask!1564))))

(declare-fun b!1198751 () Bool)

(declare-fun e!680920 () Bool)

(declare-fun tp_is_empty!30447 () Bool)

(assert (=> b!1198751 (= e!680920 tp_is_empty!30447)))

(declare-fun b!1198752 () Bool)

(declare-fun e!680917 () Bool)

(assert (=> b!1198752 (= e!680915 (not e!680917))))

(declare-fun res!797840 () Bool)

(assert (=> b!1198752 (=> res!797840 e!680917)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198752 (= res!797840 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198752 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39746 0))(
  ( (Unit!39747) )
))
(declare-fun lt!543582 () Unit!39746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77671 (_ BitVec 64) (_ BitVec 32)) Unit!39746)

(assert (=> b!1198752 (= lt!543582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!797838 () Bool)

(assert (=> start!100420 (=> (not res!797838) (not e!680914))))

(assert (=> start!100420 (= res!797838 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38016 _keys!1208))))))

(assert (=> start!100420 e!680914))

(assert (=> start!100420 tp_is_empty!30447))

(declare-fun array_inv!28564 (array!77671) Bool)

(assert (=> start!100420 (array_inv!28564 _keys!1208)))

(assert (=> start!100420 true))

(assert (=> start!100420 tp!90219))

(declare-datatypes ((V!45723 0))(
  ( (V!45724 (val!15280 Int)) )
))
(declare-datatypes ((ValueCell!14514 0))(
  ( (ValueCellFull!14514 (v!17918 V!45723)) (EmptyCell!14514) )
))
(declare-datatypes ((array!77673 0))(
  ( (array!77674 (arr!37481 (Array (_ BitVec 32) ValueCell!14514)) (size!38017 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77673)

(declare-fun e!680916 () Bool)

(declare-fun array_inv!28565 (array!77673) Bool)

(assert (=> start!100420 (and (array_inv!28565 _values!996) e!680916)))

(declare-fun mapNonEmpty!47513 () Bool)

(declare-fun mapRes!47513 () Bool)

(declare-fun tp!90218 () Bool)

(declare-fun e!680918 () Bool)

(assert (=> mapNonEmpty!47513 (= mapRes!47513 (and tp!90218 e!680918))))

(declare-fun mapValue!47513 () ValueCell!14514)

(declare-fun mapRest!47513 () (Array (_ BitVec 32) ValueCell!14514))

(declare-fun mapKey!47513 () (_ BitVec 32))

(assert (=> mapNonEmpty!47513 (= (arr!37481 _values!996) (store mapRest!47513 mapKey!47513 mapValue!47513))))

(declare-fun b!1198753 () Bool)

(declare-fun res!797839 () Bool)

(assert (=> b!1198753 (=> (not res!797839) (not e!680914))))

(assert (=> b!1198753 (= res!797839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198754 () Bool)

(declare-fun res!797847 () Bool)

(assert (=> b!1198754 (=> (not res!797847) (not e!680914))))

(declare-datatypes ((List!26369 0))(
  ( (Nil!26366) (Cons!26365 (h!27574 (_ BitVec 64)) (t!39092 List!26369)) )
))
(declare-fun arrayNoDuplicates!0 (array!77671 (_ BitVec 32) List!26369) Bool)

(assert (=> b!1198754 (= res!797847 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26366))))

(declare-fun b!1198755 () Bool)

(declare-fun res!797846 () Bool)

(assert (=> b!1198755 (=> (not res!797846) (not e!680914))))

(assert (=> b!1198755 (= res!797846 (= (select (arr!37480 _keys!1208) i!673) k0!934))))

(declare-fun b!1198756 () Bool)

(declare-fun res!797845 () Bool)

(assert (=> b!1198756 (=> (not res!797845) (not e!680914))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1198756 (= res!797845 (and (= (size!38017 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38016 _keys!1208) (size!38017 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198757 () Bool)

(assert (=> b!1198757 (= e!680917 true)))

(declare-fun zeroValue!944 () V!45723)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19552 0))(
  ( (tuple2!19553 (_1!9787 (_ BitVec 64)) (_2!9787 V!45723)) )
))
(declare-datatypes ((List!26370 0))(
  ( (Nil!26367) (Cons!26366 (h!27575 tuple2!19552) (t!39093 List!26370)) )
))
(declare-datatypes ((ListLongMap!17521 0))(
  ( (ListLongMap!17522 (toList!8776 List!26370)) )
))
(declare-fun lt!543583 () ListLongMap!17521)

(declare-fun minValue!944 () V!45723)

(declare-fun getCurrentListMapNoExtraKeys!5215 (array!77671 array!77673 (_ BitVec 32) (_ BitVec 32) V!45723 V!45723 (_ BitVec 32) Int) ListLongMap!17521)

(declare-fun dynLambda!3135 (Int (_ BitVec 64)) V!45723)

(assert (=> b!1198757 (= lt!543583 (getCurrentListMapNoExtraKeys!5215 lt!543581 (array!77674 (store (arr!37481 _values!996) i!673 (ValueCellFull!14514 (dynLambda!3135 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38017 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543580 () ListLongMap!17521)

(assert (=> b!1198757 (= lt!543580 (getCurrentListMapNoExtraKeys!5215 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198758 () Bool)

(declare-fun res!797837 () Bool)

(assert (=> b!1198758 (=> (not res!797837) (not e!680914))))

(assert (=> b!1198758 (= res!797837 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38016 _keys!1208))))))

(declare-fun b!1198759 () Bool)

(assert (=> b!1198759 (= e!680918 tp_is_empty!30447)))

(declare-fun mapIsEmpty!47513 () Bool)

(assert (=> mapIsEmpty!47513 mapRes!47513))

(declare-fun b!1198760 () Bool)

(declare-fun res!797844 () Bool)

(assert (=> b!1198760 (=> (not res!797844) (not e!680915))))

(assert (=> b!1198760 (= res!797844 (arrayNoDuplicates!0 lt!543581 #b00000000000000000000000000000000 Nil!26366))))

(declare-fun b!1198761 () Bool)

(assert (=> b!1198761 (= e!680916 (and e!680920 mapRes!47513))))

(declare-fun condMapEmpty!47513 () Bool)

(declare-fun mapDefault!47513 () ValueCell!14514)

(assert (=> b!1198761 (= condMapEmpty!47513 (= (arr!37481 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14514)) mapDefault!47513)))))

(assert (= (and start!100420 res!797838) b!1198750))

(assert (= (and b!1198750 res!797841) b!1198756))

(assert (= (and b!1198756 res!797845) b!1198753))

(assert (= (and b!1198753 res!797839) b!1198754))

(assert (= (and b!1198754 res!797847) b!1198758))

(assert (= (and b!1198758 res!797837) b!1198748))

(assert (= (and b!1198748 res!797843) b!1198755))

(assert (= (and b!1198755 res!797846) b!1198749))

(assert (= (and b!1198749 res!797842) b!1198760))

(assert (= (and b!1198760 res!797844) b!1198752))

(assert (= (and b!1198752 (not res!797840)) b!1198757))

(assert (= (and b!1198761 condMapEmpty!47513) mapIsEmpty!47513))

(assert (= (and b!1198761 (not condMapEmpty!47513)) mapNonEmpty!47513))

(get-info :version)

(assert (= (and mapNonEmpty!47513 ((_ is ValueCellFull!14514) mapValue!47513)) b!1198759))

(assert (= (and b!1198761 ((_ is ValueCellFull!14514) mapDefault!47513)) b!1198751))

(assert (= start!100420 b!1198761))

(declare-fun b_lambda!20939 () Bool)

(assert (=> (not b_lambda!20939) (not b!1198757)))

(declare-fun t!39091 () Bool)

(declare-fun tb!10543 () Bool)

(assert (=> (and start!100420 (= defaultEntry!1004 defaultEntry!1004) t!39091) tb!10543))

(declare-fun result!21663 () Bool)

(assert (=> tb!10543 (= result!21663 tp_is_empty!30447)))

(assert (=> b!1198757 t!39091))

(declare-fun b_and!42375 () Bool)

(assert (= b_and!42373 (and (=> t!39091 result!21663) b_and!42375)))

(declare-fun m!1105443 () Bool)

(assert (=> b!1198757 m!1105443))

(declare-fun m!1105445 () Bool)

(assert (=> b!1198757 m!1105445))

(declare-fun m!1105447 () Bool)

(assert (=> b!1198757 m!1105447))

(declare-fun m!1105449 () Bool)

(assert (=> b!1198757 m!1105449))

(declare-fun m!1105451 () Bool)

(assert (=> b!1198760 m!1105451))

(declare-fun m!1105453 () Bool)

(assert (=> b!1198755 m!1105453))

(declare-fun m!1105455 () Bool)

(assert (=> b!1198749 m!1105455))

(declare-fun m!1105457 () Bool)

(assert (=> b!1198749 m!1105457))

(declare-fun m!1105459 () Bool)

(assert (=> b!1198752 m!1105459))

(declare-fun m!1105461 () Bool)

(assert (=> b!1198752 m!1105461))

(declare-fun m!1105463 () Bool)

(assert (=> b!1198754 m!1105463))

(declare-fun m!1105465 () Bool)

(assert (=> mapNonEmpty!47513 m!1105465))

(declare-fun m!1105467 () Bool)

(assert (=> start!100420 m!1105467))

(declare-fun m!1105469 () Bool)

(assert (=> start!100420 m!1105469))

(declare-fun m!1105471 () Bool)

(assert (=> b!1198748 m!1105471))

(declare-fun m!1105473 () Bool)

(assert (=> b!1198750 m!1105473))

(declare-fun m!1105475 () Bool)

(assert (=> b!1198753 m!1105475))

(check-sat (not b_next!25743) (not b!1198753) (not b!1198750) (not b!1198754) (not b!1198757) (not mapNonEmpty!47513) tp_is_empty!30447 (not b!1198748) (not b!1198760) (not b_lambda!20939) b_and!42375 (not b!1198752) (not start!100420) (not b!1198749))
(check-sat b_and!42375 (not b_next!25743))
