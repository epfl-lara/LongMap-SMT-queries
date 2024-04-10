; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100486 () Bool)

(assert start!100486)

(declare-fun b_free!25809 () Bool)

(declare-fun b_next!25809 () Bool)

(assert (=> start!100486 (= b_free!25809 (not b_next!25809))))

(declare-fun tp!90417 () Bool)

(declare-fun b_and!42505 () Bool)

(assert (=> start!100486 (= tp!90417 b_and!42505)))

(declare-fun b!1200200 () Bool)

(declare-fun res!798927 () Bool)

(declare-fun e!681608 () Bool)

(assert (=> b!1200200 (=> (not res!798927) (not e!681608))))

(declare-datatypes ((array!77799 0))(
  ( (array!77800 (arr!37544 (Array (_ BitVec 32) (_ BitVec 64))) (size!38080 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77799)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1200200 (= res!798927 (= (select (arr!37544 _keys!1208) i!673) k0!934))))

(declare-fun b!1200201 () Bool)

(declare-fun res!798932 () Bool)

(assert (=> b!1200201 (=> (not res!798932) (not e!681608))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45811 0))(
  ( (V!45812 (val!15313 Int)) )
))
(declare-datatypes ((ValueCell!14547 0))(
  ( (ValueCellFull!14547 (v!17951 V!45811)) (EmptyCell!14547) )
))
(declare-datatypes ((array!77801 0))(
  ( (array!77802 (arr!37545 (Array (_ BitVec 32) ValueCell!14547)) (size!38081 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77801)

(assert (=> b!1200201 (= res!798932 (and (= (size!38081 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38080 _keys!1208) (size!38081 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200202 () Bool)

(declare-fun res!798936 () Bool)

(assert (=> b!1200202 (=> (not res!798936) (not e!681608))))

(assert (=> b!1200202 (= res!798936 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38080 _keys!1208))))))

(declare-fun b!1200203 () Bool)

(declare-fun e!681609 () Bool)

(declare-fun e!681611 () Bool)

(assert (=> b!1200203 (= e!681609 (not e!681611))))

(declare-fun res!798931 () Bool)

(assert (=> b!1200203 (=> res!798931 e!681611)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1200203 (= res!798931 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200203 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39792 0))(
  ( (Unit!39793) )
))
(declare-fun lt!543979 () Unit!39792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77799 (_ BitVec 64) (_ BitVec 32)) Unit!39792)

(assert (=> b!1200203 (= lt!543979 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200204 () Bool)

(declare-fun res!798930 () Bool)

(assert (=> b!1200204 (=> (not res!798930) (not e!681608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77799 (_ BitVec 32)) Bool)

(assert (=> b!1200204 (= res!798930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200205 () Bool)

(assert (=> b!1200205 (= e!681611 true)))

(declare-fun zeroValue!944 () V!45811)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19602 0))(
  ( (tuple2!19603 (_1!9812 (_ BitVec 64)) (_2!9812 V!45811)) )
))
(declare-datatypes ((List!26421 0))(
  ( (Nil!26418) (Cons!26417 (h!27626 tuple2!19602) (t!39210 List!26421)) )
))
(declare-datatypes ((ListLongMap!17571 0))(
  ( (ListLongMap!17572 (toList!8801 List!26421)) )
))
(declare-fun lt!543976 () ListLongMap!17571)

(declare-fun lt!543977 () array!77799)

(declare-fun minValue!944 () V!45811)

(declare-fun getCurrentListMapNoExtraKeys!5240 (array!77799 array!77801 (_ BitVec 32) (_ BitVec 32) V!45811 V!45811 (_ BitVec 32) Int) ListLongMap!17571)

(declare-fun dynLambda!3160 (Int (_ BitVec 64)) V!45811)

(assert (=> b!1200205 (= lt!543976 (getCurrentListMapNoExtraKeys!5240 lt!543977 (array!77802 (store (arr!37545 _values!996) i!673 (ValueCellFull!14547 (dynLambda!3160 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38081 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543978 () ListLongMap!17571)

(assert (=> b!1200205 (= lt!543978 (getCurrentListMapNoExtraKeys!5240 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200206 () Bool)

(assert (=> b!1200206 (= e!681608 e!681609)))

(declare-fun res!798933 () Bool)

(assert (=> b!1200206 (=> (not res!798933) (not e!681609))))

(assert (=> b!1200206 (= res!798933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543977 mask!1564))))

(assert (=> b!1200206 (= lt!543977 (array!77800 (store (arr!37544 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38080 _keys!1208)))))

(declare-fun b!1200207 () Bool)

(declare-fun e!681607 () Bool)

(declare-fun tp_is_empty!30513 () Bool)

(assert (=> b!1200207 (= e!681607 tp_is_empty!30513)))

(declare-fun b!1200208 () Bool)

(declare-fun res!798929 () Bool)

(assert (=> b!1200208 (=> (not res!798929) (not e!681608))))

(declare-datatypes ((List!26422 0))(
  ( (Nil!26419) (Cons!26418 (h!27627 (_ BitVec 64)) (t!39211 List!26422)) )
))
(declare-fun arrayNoDuplicates!0 (array!77799 (_ BitVec 32) List!26422) Bool)

(assert (=> b!1200208 (= res!798929 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26419))))

(declare-fun b!1200209 () Bool)

(declare-fun res!798934 () Bool)

(assert (=> b!1200209 (=> (not res!798934) (not e!681608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200209 (= res!798934 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47612 () Bool)

(declare-fun mapRes!47612 () Bool)

(assert (=> mapIsEmpty!47612 mapRes!47612))

(declare-fun res!798926 () Bool)

(assert (=> start!100486 (=> (not res!798926) (not e!681608))))

(assert (=> start!100486 (= res!798926 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38080 _keys!1208))))))

(assert (=> start!100486 e!681608))

(assert (=> start!100486 tp_is_empty!30513))

(declare-fun array_inv!28612 (array!77799) Bool)

(assert (=> start!100486 (array_inv!28612 _keys!1208)))

(assert (=> start!100486 true))

(assert (=> start!100486 tp!90417))

(declare-fun e!681610 () Bool)

(declare-fun array_inv!28613 (array!77801) Bool)

(assert (=> start!100486 (and (array_inv!28613 _values!996) e!681610)))

(declare-fun mapNonEmpty!47612 () Bool)

(declare-fun tp!90416 () Bool)

(declare-fun e!681612 () Bool)

(assert (=> mapNonEmpty!47612 (= mapRes!47612 (and tp!90416 e!681612))))

(declare-fun mapRest!47612 () (Array (_ BitVec 32) ValueCell!14547))

(declare-fun mapValue!47612 () ValueCell!14547)

(declare-fun mapKey!47612 () (_ BitVec 32))

(assert (=> mapNonEmpty!47612 (= (arr!37545 _values!996) (store mapRest!47612 mapKey!47612 mapValue!47612))))

(declare-fun b!1200210 () Bool)

(assert (=> b!1200210 (= e!681612 tp_is_empty!30513)))

(declare-fun b!1200211 () Bool)

(assert (=> b!1200211 (= e!681610 (and e!681607 mapRes!47612))))

(declare-fun condMapEmpty!47612 () Bool)

(declare-fun mapDefault!47612 () ValueCell!14547)

(assert (=> b!1200211 (= condMapEmpty!47612 (= (arr!37545 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14547)) mapDefault!47612)))))

(declare-fun b!1200212 () Bool)

(declare-fun res!798935 () Bool)

(assert (=> b!1200212 (=> (not res!798935) (not e!681609))))

(assert (=> b!1200212 (= res!798935 (arrayNoDuplicates!0 lt!543977 #b00000000000000000000000000000000 Nil!26419))))

(declare-fun b!1200213 () Bool)

(declare-fun res!798928 () Bool)

(assert (=> b!1200213 (=> (not res!798928) (not e!681608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200213 (= res!798928 (validMask!0 mask!1564))))

(assert (= (and start!100486 res!798926) b!1200213))

(assert (= (and b!1200213 res!798928) b!1200201))

(assert (= (and b!1200201 res!798932) b!1200204))

(assert (= (and b!1200204 res!798930) b!1200208))

(assert (= (and b!1200208 res!798929) b!1200202))

(assert (= (and b!1200202 res!798936) b!1200209))

(assert (= (and b!1200209 res!798934) b!1200200))

(assert (= (and b!1200200 res!798927) b!1200206))

(assert (= (and b!1200206 res!798933) b!1200212))

(assert (= (and b!1200212 res!798935) b!1200203))

(assert (= (and b!1200203 (not res!798931)) b!1200205))

(assert (= (and b!1200211 condMapEmpty!47612) mapIsEmpty!47612))

(assert (= (and b!1200211 (not condMapEmpty!47612)) mapNonEmpty!47612))

(get-info :version)

(assert (= (and mapNonEmpty!47612 ((_ is ValueCellFull!14547) mapValue!47612)) b!1200210))

(assert (= (and b!1200211 ((_ is ValueCellFull!14547) mapDefault!47612)) b!1200207))

(assert (= start!100486 b!1200211))

(declare-fun b_lambda!21005 () Bool)

(assert (=> (not b_lambda!21005) (not b!1200205)))

(declare-fun t!39209 () Bool)

(declare-fun tb!10609 () Bool)

(assert (=> (and start!100486 (= defaultEntry!1004 defaultEntry!1004) t!39209) tb!10609))

(declare-fun result!21795 () Bool)

(assert (=> tb!10609 (= result!21795 tp_is_empty!30513)))

(assert (=> b!1200205 t!39209))

(declare-fun b_and!42507 () Bool)

(assert (= b_and!42505 (and (=> t!39209 result!21795) b_and!42507)))

(declare-fun m!1106565 () Bool)

(assert (=> b!1200209 m!1106565))

(declare-fun m!1106567 () Bool)

(assert (=> b!1200206 m!1106567))

(declare-fun m!1106569 () Bool)

(assert (=> b!1200206 m!1106569))

(declare-fun m!1106571 () Bool)

(assert (=> b!1200208 m!1106571))

(declare-fun m!1106573 () Bool)

(assert (=> start!100486 m!1106573))

(declare-fun m!1106575 () Bool)

(assert (=> start!100486 m!1106575))

(declare-fun m!1106577 () Bool)

(assert (=> b!1200212 m!1106577))

(declare-fun m!1106579 () Bool)

(assert (=> b!1200200 m!1106579))

(declare-fun m!1106581 () Bool)

(assert (=> b!1200204 m!1106581))

(declare-fun m!1106583 () Bool)

(assert (=> mapNonEmpty!47612 m!1106583))

(declare-fun m!1106585 () Bool)

(assert (=> b!1200213 m!1106585))

(declare-fun m!1106587 () Bool)

(assert (=> b!1200203 m!1106587))

(declare-fun m!1106589 () Bool)

(assert (=> b!1200203 m!1106589))

(declare-fun m!1106591 () Bool)

(assert (=> b!1200205 m!1106591))

(declare-fun m!1106593 () Bool)

(assert (=> b!1200205 m!1106593))

(declare-fun m!1106595 () Bool)

(assert (=> b!1200205 m!1106595))

(declare-fun m!1106597 () Bool)

(assert (=> b!1200205 m!1106597))

(check-sat b_and!42507 tp_is_empty!30513 (not b!1200208) (not b!1200209) (not start!100486) (not b!1200206) (not b!1200213) (not b!1200212) (not mapNonEmpty!47612) (not b!1200205) (not b!1200204) (not b_lambda!21005) (not b!1200203) (not b_next!25809))
(check-sat b_and!42507 (not b_next!25809))
