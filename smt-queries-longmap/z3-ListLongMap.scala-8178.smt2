; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99928 () Bool)

(assert start!99928)

(declare-fun b_free!25513 () Bool)

(declare-fun b_next!25513 () Bool)

(assert (=> start!99928 (= b_free!25513 (not b_next!25513))))

(declare-fun tp!89253 () Bool)

(declare-fun b_and!41871 () Bool)

(assert (=> start!99928 (= tp!89253 b_and!41871)))

(declare-fun mapIsEmpty!46892 () Bool)

(declare-fun mapRes!46892 () Bool)

(assert (=> mapIsEmpty!46892 mapRes!46892))

(declare-fun b!1189605 () Bool)

(declare-fun e!676324 () Bool)

(declare-fun tp_is_empty!30043 () Bool)

(assert (=> b!1189605 (= e!676324 tp_is_empty!30043)))

(declare-fun b!1189606 () Bool)

(declare-fun res!791104 () Bool)

(declare-fun e!676319 () Bool)

(assert (=> b!1189606 (=> (not res!791104) (not e!676319))))

(declare-datatypes ((array!76814 0))(
  ( (array!76815 (arr!37057 (Array (_ BitVec 32) (_ BitVec 64))) (size!37595 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76814)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1189606 (= res!791104 (= (select (arr!37057 _keys!1208) i!673) k0!934))))

(declare-fun b!1189607 () Bool)

(declare-fun e!676317 () Bool)

(declare-fun e!676322 () Bool)

(assert (=> b!1189607 (= e!676317 (not e!676322))))

(declare-fun res!791112 () Bool)

(assert (=> b!1189607 (=> res!791112 e!676322)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189607 (= res!791112 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189607 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39347 0))(
  ( (Unit!39348) )
))
(declare-fun lt!540989 () Unit!39347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76814 (_ BitVec 64) (_ BitVec 32)) Unit!39347)

(assert (=> b!1189607 (= lt!540989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189608 () Bool)

(declare-fun res!791102 () Bool)

(assert (=> b!1189608 (=> (not res!791102) (not e!676319))))

(assert (=> b!1189608 (= res!791102 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37595 _keys!1208))))))

(declare-fun b!1189609 () Bool)

(declare-fun res!791107 () Bool)

(assert (=> b!1189609 (=> (not res!791107) (not e!676317))))

(declare-fun lt!540985 () array!76814)

(declare-datatypes ((List!26197 0))(
  ( (Nil!26194) (Cons!26193 (h!27402 (_ BitVec 64)) (t!38693 List!26197)) )
))
(declare-fun arrayNoDuplicates!0 (array!76814 (_ BitVec 32) List!26197) Bool)

(assert (=> b!1189609 (= res!791107 (arrayNoDuplicates!0 lt!540985 #b00000000000000000000000000000000 Nil!26194))))

(declare-fun b!1189610 () Bool)

(declare-fun res!791111 () Bool)

(assert (=> b!1189610 (=> (not res!791111) (not e!676319))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45185 0))(
  ( (V!45186 (val!15078 Int)) )
))
(declare-datatypes ((ValueCell!14312 0))(
  ( (ValueCellFull!14312 (v!17715 V!45185)) (EmptyCell!14312) )
))
(declare-datatypes ((array!76816 0))(
  ( (array!76817 (arr!37058 (Array (_ BitVec 32) ValueCell!14312)) (size!37596 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76816)

(assert (=> b!1189610 (= res!791111 (and (= (size!37596 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37595 _keys!1208) (size!37596 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189611 () Bool)

(declare-fun res!791106 () Bool)

(assert (=> b!1189611 (=> (not res!791106) (not e!676319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189611 (= res!791106 (validKeyInArray!0 k0!934))))

(declare-fun res!791105 () Bool)

(assert (=> start!99928 (=> (not res!791105) (not e!676319))))

(assert (=> start!99928 (= res!791105 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37595 _keys!1208))))))

(assert (=> start!99928 e!676319))

(assert (=> start!99928 tp_is_empty!30043))

(declare-fun array_inv!28388 (array!76814) Bool)

(assert (=> start!99928 (array_inv!28388 _keys!1208)))

(assert (=> start!99928 true))

(assert (=> start!99928 tp!89253))

(declare-fun e!676321 () Bool)

(declare-fun array_inv!28389 (array!76816) Bool)

(assert (=> start!99928 (and (array_inv!28389 _values!996) e!676321)))

(declare-fun b!1189612 () Bool)

(assert (=> b!1189612 (= e!676319 e!676317)))

(declare-fun res!791110 () Bool)

(assert (=> b!1189612 (=> (not res!791110) (not e!676317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76814 (_ BitVec 32)) Bool)

(assert (=> b!1189612 (= res!791110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540985 mask!1564))))

(assert (=> b!1189612 (= lt!540985 (array!76815 (store (arr!37057 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37595 _keys!1208)))))

(declare-fun b!1189613 () Bool)

(declare-fun res!791109 () Bool)

(assert (=> b!1189613 (=> (not res!791109) (not e!676319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189613 (= res!791109 (validMask!0 mask!1564))))

(declare-fun b!1189614 () Bool)

(declare-fun e!676320 () Bool)

(assert (=> b!1189614 (= e!676321 (and e!676320 mapRes!46892))))

(declare-fun condMapEmpty!46892 () Bool)

(declare-fun mapDefault!46892 () ValueCell!14312)

(assert (=> b!1189614 (= condMapEmpty!46892 (= (arr!37058 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14312)) mapDefault!46892)))))

(declare-fun b!1189615 () Bool)

(assert (=> b!1189615 (= e!676320 tp_is_empty!30043)))

(declare-fun b!1189616 () Bool)

(declare-fun e!676318 () Bool)

(assert (=> b!1189616 (= e!676322 e!676318)))

(declare-fun res!791108 () Bool)

(assert (=> b!1189616 (=> res!791108 e!676318)))

(assert (=> b!1189616 (= res!791108 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45185)

(declare-datatypes ((tuple2!19486 0))(
  ( (tuple2!19487 (_1!9754 (_ BitVec 64)) (_2!9754 V!45185)) )
))
(declare-datatypes ((List!26198 0))(
  ( (Nil!26195) (Cons!26194 (h!27403 tuple2!19486) (t!38694 List!26198)) )
))
(declare-datatypes ((ListLongMap!17455 0))(
  ( (ListLongMap!17456 (toList!8743 List!26198)) )
))
(declare-fun lt!540987 () ListLongMap!17455)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540988 () array!76816)

(declare-fun minValue!944 () V!45185)

(declare-fun getCurrentListMapNoExtraKeys!5193 (array!76814 array!76816 (_ BitVec 32) (_ BitVec 32) V!45185 V!45185 (_ BitVec 32) Int) ListLongMap!17455)

(assert (=> b!1189616 (= lt!540987 (getCurrentListMapNoExtraKeys!5193 lt!540985 lt!540988 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3087 (Int (_ BitVec 64)) V!45185)

(assert (=> b!1189616 (= lt!540988 (array!76817 (store (arr!37058 _values!996) i!673 (ValueCellFull!14312 (dynLambda!3087 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37596 _values!996)))))

(declare-fun lt!540990 () ListLongMap!17455)

(assert (=> b!1189616 (= lt!540990 (getCurrentListMapNoExtraKeys!5193 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189617 () Bool)

(declare-fun res!791103 () Bool)

(assert (=> b!1189617 (=> (not res!791103) (not e!676319))))

(assert (=> b!1189617 (= res!791103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46892 () Bool)

(declare-fun tp!89252 () Bool)

(assert (=> mapNonEmpty!46892 (= mapRes!46892 (and tp!89252 e!676324))))

(declare-fun mapRest!46892 () (Array (_ BitVec 32) ValueCell!14312))

(declare-fun mapValue!46892 () ValueCell!14312)

(declare-fun mapKey!46892 () (_ BitVec 32))

(assert (=> mapNonEmpty!46892 (= (arr!37058 _values!996) (store mapRest!46892 mapKey!46892 mapValue!46892))))

(declare-fun b!1189618 () Bool)

(assert (=> b!1189618 (= e!676318 true)))

(declare-fun -!1689 (ListLongMap!17455 (_ BitVec 64)) ListLongMap!17455)

(assert (=> b!1189618 (= (getCurrentListMapNoExtraKeys!5193 lt!540985 lt!540988 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1689 (getCurrentListMapNoExtraKeys!5193 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540986 () Unit!39347)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!939 (array!76814 array!76816 (_ BitVec 32) (_ BitVec 32) V!45185 V!45185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39347)

(assert (=> b!1189618 (= lt!540986 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189619 () Bool)

(declare-fun res!791113 () Bool)

(assert (=> b!1189619 (=> (not res!791113) (not e!676319))))

(assert (=> b!1189619 (= res!791113 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26194))))

(assert (= (and start!99928 res!791105) b!1189613))

(assert (= (and b!1189613 res!791109) b!1189610))

(assert (= (and b!1189610 res!791111) b!1189617))

(assert (= (and b!1189617 res!791103) b!1189619))

(assert (= (and b!1189619 res!791113) b!1189608))

(assert (= (and b!1189608 res!791102) b!1189611))

(assert (= (and b!1189611 res!791106) b!1189606))

(assert (= (and b!1189606 res!791104) b!1189612))

(assert (= (and b!1189612 res!791110) b!1189609))

(assert (= (and b!1189609 res!791107) b!1189607))

(assert (= (and b!1189607 (not res!791112)) b!1189616))

(assert (= (and b!1189616 (not res!791108)) b!1189618))

(assert (= (and b!1189614 condMapEmpty!46892) mapIsEmpty!46892))

(assert (= (and b!1189614 (not condMapEmpty!46892)) mapNonEmpty!46892))

(get-info :version)

(assert (= (and mapNonEmpty!46892 ((_ is ValueCellFull!14312) mapValue!46892)) b!1189605))

(assert (= (and b!1189614 ((_ is ValueCellFull!14312) mapDefault!46892)) b!1189615))

(assert (= start!99928 b!1189614))

(declare-fun b_lambda!20639 () Bool)

(assert (=> (not b_lambda!20639) (not b!1189616)))

(declare-fun t!38692 () Bool)

(declare-fun tb!10317 () Bool)

(assert (=> (and start!99928 (= defaultEntry!1004 defaultEntry!1004) t!38692) tb!10317))

(declare-fun result!21209 () Bool)

(assert (=> tb!10317 (= result!21209 tp_is_empty!30043)))

(assert (=> b!1189616 t!38692))

(declare-fun b_and!41873 () Bool)

(assert (= b_and!41871 (and (=> t!38692 result!21209) b_and!41873)))

(declare-fun m!1097765 () Bool)

(assert (=> b!1189612 m!1097765))

(declare-fun m!1097767 () Bool)

(assert (=> b!1189612 m!1097767))

(declare-fun m!1097769 () Bool)

(assert (=> b!1189606 m!1097769))

(declare-fun m!1097771 () Bool)

(assert (=> mapNonEmpty!46892 m!1097771))

(declare-fun m!1097773 () Bool)

(assert (=> start!99928 m!1097773))

(declare-fun m!1097775 () Bool)

(assert (=> start!99928 m!1097775))

(declare-fun m!1097777 () Bool)

(assert (=> b!1189609 m!1097777))

(declare-fun m!1097779 () Bool)

(assert (=> b!1189618 m!1097779))

(declare-fun m!1097781 () Bool)

(assert (=> b!1189618 m!1097781))

(assert (=> b!1189618 m!1097781))

(declare-fun m!1097783 () Bool)

(assert (=> b!1189618 m!1097783))

(declare-fun m!1097785 () Bool)

(assert (=> b!1189618 m!1097785))

(declare-fun m!1097787 () Bool)

(assert (=> b!1189617 m!1097787))

(declare-fun m!1097789 () Bool)

(assert (=> b!1189611 m!1097789))

(declare-fun m!1097791 () Bool)

(assert (=> b!1189616 m!1097791))

(declare-fun m!1097793 () Bool)

(assert (=> b!1189616 m!1097793))

(declare-fun m!1097795 () Bool)

(assert (=> b!1189616 m!1097795))

(declare-fun m!1097797 () Bool)

(assert (=> b!1189616 m!1097797))

(declare-fun m!1097799 () Bool)

(assert (=> b!1189607 m!1097799))

(declare-fun m!1097801 () Bool)

(assert (=> b!1189607 m!1097801))

(declare-fun m!1097803 () Bool)

(assert (=> b!1189619 m!1097803))

(declare-fun m!1097805 () Bool)

(assert (=> b!1189613 m!1097805))

(check-sat (not b_next!25513) (not b!1189618) (not b!1189609) tp_is_empty!30043 (not start!99928) b_and!41873 (not b!1189613) (not b_lambda!20639) (not b!1189617) (not b!1189612) (not b!1189619) (not b!1189607) (not b!1189616) (not b!1189611) (not mapNonEmpty!46892))
(check-sat b_and!41873 (not b_next!25513))
