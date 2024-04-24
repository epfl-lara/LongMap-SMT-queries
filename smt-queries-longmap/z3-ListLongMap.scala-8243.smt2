; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100642 () Bool)

(assert start!100642)

(declare-fun b_free!25729 () Bool)

(declare-fun b_next!25729 () Bool)

(assert (=> start!100642 (= b_free!25729 (not b_next!25729))))

(declare-fun tp!90176 () Bool)

(declare-fun b_and!42347 () Bool)

(assert (=> start!100642 (= tp!90176 b_and!42347)))

(declare-fun b!1199729 () Bool)

(declare-fun e!681599 () Bool)

(declare-fun e!681600 () Bool)

(declare-fun mapRes!47492 () Bool)

(assert (=> b!1199729 (= e!681599 (and e!681600 mapRes!47492))))

(declare-fun condMapEmpty!47492 () Bool)

(declare-datatypes ((V!45705 0))(
  ( (V!45706 (val!15273 Int)) )
))
(declare-datatypes ((ValueCell!14507 0))(
  ( (ValueCellFull!14507 (v!17907 V!45705)) (EmptyCell!14507) )
))
(declare-datatypes ((array!77681 0))(
  ( (array!77682 (arr!37479 (Array (_ BitVec 32) ValueCell!14507)) (size!38016 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77681)

(declare-fun mapDefault!47492 () ValueCell!14507)

(assert (=> b!1199729 (= condMapEmpty!47492 (= (arr!37479 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14507)) mapDefault!47492)))))

(declare-fun b!1199730 () Bool)

(declare-fun res!798123 () Bool)

(declare-fun e!681605 () Bool)

(assert (=> b!1199730 (=> (not res!798123) (not e!681605))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199730 (= res!798123 (validMask!0 mask!1564))))

(declare-fun b!1199731 () Bool)

(declare-fun res!798116 () Bool)

(declare-fun e!681601 () Bool)

(assert (=> b!1199731 (=> (not res!798116) (not e!681601))))

(declare-datatypes ((array!77683 0))(
  ( (array!77684 (arr!37480 (Array (_ BitVec 32) (_ BitVec 64))) (size!38017 (_ BitVec 32))) )
))
(declare-fun lt!543980 () array!77683)

(declare-datatypes ((List!26380 0))(
  ( (Nil!26377) (Cons!26376 (h!27594 (_ BitVec 64)) (t!39081 List!26380)) )
))
(declare-fun arrayNoDuplicates!0 (array!77683 (_ BitVec 32) List!26380) Bool)

(assert (=> b!1199731 (= res!798116 (arrayNoDuplicates!0 lt!543980 #b00000000000000000000000000000000 Nil!26377))))

(declare-fun b!1199732 () Bool)

(declare-fun res!798117 () Bool)

(assert (=> b!1199732 (=> (not res!798117) (not e!681605))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199732 (= res!798117 (validKeyInArray!0 k0!934))))

(declare-fun b!1199733 () Bool)

(declare-fun res!798121 () Bool)

(assert (=> b!1199733 (=> (not res!798121) (not e!681605))))

(declare-fun _keys!1208 () array!77683)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77683 (_ BitVec 32)) Bool)

(assert (=> b!1199733 (= res!798121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199734 () Bool)

(assert (=> b!1199734 (= e!681605 e!681601)))

(declare-fun res!798120 () Bool)

(assert (=> b!1199734 (=> (not res!798120) (not e!681601))))

(assert (=> b!1199734 (= res!798120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543980 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199734 (= lt!543980 (array!77684 (store (arr!37480 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38017 _keys!1208)))))

(declare-fun mapIsEmpty!47492 () Bool)

(assert (=> mapIsEmpty!47492 mapRes!47492))

(declare-fun b!1199735 () Bool)

(declare-fun res!798122 () Bool)

(assert (=> b!1199735 (=> (not res!798122) (not e!681605))))

(assert (=> b!1199735 (= res!798122 (= (select (arr!37480 _keys!1208) i!673) k0!934))))

(declare-fun b!1199736 () Bool)

(declare-fun res!798118 () Bool)

(assert (=> b!1199736 (=> (not res!798118) (not e!681605))))

(assert (=> b!1199736 (= res!798118 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26377))))

(declare-fun b!1199737 () Bool)

(declare-fun tp_is_empty!30433 () Bool)

(assert (=> b!1199737 (= e!681600 tp_is_empty!30433)))

(declare-fun res!798114 () Bool)

(assert (=> start!100642 (=> (not res!798114) (not e!681605))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100642 (= res!798114 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38017 _keys!1208))))))

(assert (=> start!100642 e!681605))

(assert (=> start!100642 tp_is_empty!30433))

(declare-fun array_inv!28636 (array!77683) Bool)

(assert (=> start!100642 (array_inv!28636 _keys!1208)))

(assert (=> start!100642 true))

(assert (=> start!100642 tp!90176))

(declare-fun array_inv!28637 (array!77681) Bool)

(assert (=> start!100642 (and (array_inv!28637 _values!996) e!681599)))

(declare-fun b!1199738 () Bool)

(declare-fun e!681602 () Bool)

(assert (=> b!1199738 (= e!681602 (or (not (= from!1455 i!673)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38017 _keys!1208)))))))

(declare-fun zeroValue!944 () V!45705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19568 0))(
  ( (tuple2!19569 (_1!9795 (_ BitVec 64)) (_2!9795 V!45705)) )
))
(declare-datatypes ((List!26381 0))(
  ( (Nil!26378) (Cons!26377 (h!27595 tuple2!19568) (t!39082 List!26381)) )
))
(declare-datatypes ((ListLongMap!17545 0))(
  ( (ListLongMap!17546 (toList!8788 List!26381)) )
))
(declare-fun lt!543982 () ListLongMap!17545)

(declare-fun minValue!944 () V!45705)

(declare-fun getCurrentListMapNoExtraKeys!5255 (array!77683 array!77681 (_ BitVec 32) (_ BitVec 32) V!45705 V!45705 (_ BitVec 32) Int) ListLongMap!17545)

(declare-fun dynLambda!3199 (Int (_ BitVec 64)) V!45705)

(assert (=> b!1199738 (= lt!543982 (getCurrentListMapNoExtraKeys!5255 lt!543980 (array!77682 (store (arr!37479 _values!996) i!673 (ValueCellFull!14507 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38016 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543981 () ListLongMap!17545)

(assert (=> b!1199738 (= lt!543981 (getCurrentListMapNoExtraKeys!5255 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199739 () Bool)

(declare-fun res!798119 () Bool)

(assert (=> b!1199739 (=> (not res!798119) (not e!681605))))

(assert (=> b!1199739 (= res!798119 (and (= (size!38016 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38017 _keys!1208) (size!38016 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199740 () Bool)

(declare-fun res!798124 () Bool)

(assert (=> b!1199740 (=> (not res!798124) (not e!681605))))

(assert (=> b!1199740 (= res!798124 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38017 _keys!1208))))))

(declare-fun b!1199741 () Bool)

(declare-fun e!681603 () Bool)

(assert (=> b!1199741 (= e!681603 tp_is_empty!30433)))

(declare-fun mapNonEmpty!47492 () Bool)

(declare-fun tp!90177 () Bool)

(assert (=> mapNonEmpty!47492 (= mapRes!47492 (and tp!90177 e!681603))))

(declare-fun mapKey!47492 () (_ BitVec 32))

(declare-fun mapValue!47492 () ValueCell!14507)

(declare-fun mapRest!47492 () (Array (_ BitVec 32) ValueCell!14507))

(assert (=> mapNonEmpty!47492 (= (arr!37479 _values!996) (store mapRest!47492 mapKey!47492 mapValue!47492))))

(declare-fun b!1199742 () Bool)

(assert (=> b!1199742 (= e!681601 (not e!681602))))

(declare-fun res!798115 () Bool)

(assert (=> b!1199742 (=> res!798115 e!681602)))

(assert (=> b!1199742 (= res!798115 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199742 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39701 0))(
  ( (Unit!39702) )
))
(declare-fun lt!543983 () Unit!39701)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77683 (_ BitVec 64) (_ BitVec 32)) Unit!39701)

(assert (=> b!1199742 (= lt!543983 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100642 res!798114) b!1199730))

(assert (= (and b!1199730 res!798123) b!1199739))

(assert (= (and b!1199739 res!798119) b!1199733))

(assert (= (and b!1199733 res!798121) b!1199736))

(assert (= (and b!1199736 res!798118) b!1199740))

(assert (= (and b!1199740 res!798124) b!1199732))

(assert (= (and b!1199732 res!798117) b!1199735))

(assert (= (and b!1199735 res!798122) b!1199734))

(assert (= (and b!1199734 res!798120) b!1199731))

(assert (= (and b!1199731 res!798116) b!1199742))

(assert (= (and b!1199742 (not res!798115)) b!1199738))

(assert (= (and b!1199729 condMapEmpty!47492) mapIsEmpty!47492))

(assert (= (and b!1199729 (not condMapEmpty!47492)) mapNonEmpty!47492))

(get-info :version)

(assert (= (and mapNonEmpty!47492 ((_ is ValueCellFull!14507) mapValue!47492)) b!1199741))

(assert (= (and b!1199729 ((_ is ValueCellFull!14507) mapDefault!47492)) b!1199737))

(assert (= start!100642 b!1199729))

(declare-fun b_lambda!20919 () Bool)

(assert (=> (not b_lambda!20919) (not b!1199738)))

(declare-fun t!39080 () Bool)

(declare-fun tb!10521 () Bool)

(assert (=> (and start!100642 (= defaultEntry!1004 defaultEntry!1004) t!39080) tb!10521))

(declare-fun result!21627 () Bool)

(assert (=> tb!10521 (= result!21627 tp_is_empty!30433)))

(assert (=> b!1199738 t!39080))

(declare-fun b_and!42349 () Bool)

(assert (= b_and!42347 (and (=> t!39080 result!21627) b_and!42349)))

(declare-fun m!1106777 () Bool)

(assert (=> b!1199733 m!1106777))

(declare-fun m!1106779 () Bool)

(assert (=> b!1199734 m!1106779))

(declare-fun m!1106781 () Bool)

(assert (=> b!1199734 m!1106781))

(declare-fun m!1106783 () Bool)

(assert (=> b!1199730 m!1106783))

(declare-fun m!1106785 () Bool)

(assert (=> b!1199738 m!1106785))

(declare-fun m!1106787 () Bool)

(assert (=> b!1199738 m!1106787))

(declare-fun m!1106789 () Bool)

(assert (=> b!1199738 m!1106789))

(declare-fun m!1106791 () Bool)

(assert (=> b!1199738 m!1106791))

(declare-fun m!1106793 () Bool)

(assert (=> b!1199735 m!1106793))

(declare-fun m!1106795 () Bool)

(assert (=> b!1199732 m!1106795))

(declare-fun m!1106797 () Bool)

(assert (=> b!1199742 m!1106797))

(declare-fun m!1106799 () Bool)

(assert (=> b!1199742 m!1106799))

(declare-fun m!1106801 () Bool)

(assert (=> start!100642 m!1106801))

(declare-fun m!1106803 () Bool)

(assert (=> start!100642 m!1106803))

(declare-fun m!1106805 () Bool)

(assert (=> mapNonEmpty!47492 m!1106805))

(declare-fun m!1106807 () Bool)

(assert (=> b!1199731 m!1106807))

(declare-fun m!1106809 () Bool)

(assert (=> b!1199736 m!1106809))

(check-sat (not b!1199730) (not start!100642) (not b!1199732) (not b!1199742) (not b!1199734) (not b!1199733) (not mapNonEmpty!47492) tp_is_empty!30433 b_and!42349 (not b!1199738) (not b_lambda!20919) (not b!1199731) (not b_next!25729) (not b!1199736))
(check-sat b_and!42349 (not b_next!25729))
