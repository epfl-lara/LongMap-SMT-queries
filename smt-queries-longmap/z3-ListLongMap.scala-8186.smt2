; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99976 () Bool)

(assert start!99976)

(declare-fun b_free!25561 () Bool)

(declare-fun b_next!25561 () Bool)

(assert (=> start!99976 (= b_free!25561 (not b_next!25561))))

(declare-fun tp!89396 () Bool)

(declare-fun b_and!41967 () Bool)

(assert (=> start!99976 (= tp!89396 b_and!41967)))

(declare-fun b!1190733 () Bool)

(declare-fun res!791971 () Bool)

(declare-fun e!676899 () Bool)

(assert (=> b!1190733 (=> (not res!791971) (not e!676899))))

(declare-datatypes ((array!76906 0))(
  ( (array!76907 (arr!37103 (Array (_ BitVec 32) (_ BitVec 64))) (size!37641 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76906)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45249 0))(
  ( (V!45250 (val!15102 Int)) )
))
(declare-datatypes ((ValueCell!14336 0))(
  ( (ValueCellFull!14336 (v!17739 V!45249)) (EmptyCell!14336) )
))
(declare-datatypes ((array!76908 0))(
  ( (array!76909 (arr!37104 (Array (_ BitVec 32) ValueCell!14336)) (size!37642 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76908)

(assert (=> b!1190733 (= res!791971 (and (= (size!37642 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37641 _keys!1208) (size!37642 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190734 () Bool)

(declare-fun e!676893 () Bool)

(declare-fun e!676896 () Bool)

(assert (=> b!1190734 (= e!676893 e!676896)))

(declare-fun res!791974 () Bool)

(assert (=> b!1190734 (=> res!791974 e!676896)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190734 (= res!791974 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45249)

(declare-fun lt!541422 () array!76908)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541420 () array!76906)

(declare-fun minValue!944 () V!45249)

(declare-datatypes ((tuple2!19518 0))(
  ( (tuple2!19519 (_1!9770 (_ BitVec 64)) (_2!9770 V!45249)) )
))
(declare-datatypes ((List!26231 0))(
  ( (Nil!26228) (Cons!26227 (h!27436 tuple2!19518) (t!38775 List!26231)) )
))
(declare-datatypes ((ListLongMap!17487 0))(
  ( (ListLongMap!17488 (toList!8759 List!26231)) )
))
(declare-fun lt!541418 () ListLongMap!17487)

(declare-fun getCurrentListMapNoExtraKeys!5209 (array!76906 array!76908 (_ BitVec 32) (_ BitVec 32) V!45249 V!45249 (_ BitVec 32) Int) ListLongMap!17487)

(assert (=> b!1190734 (= lt!541418 (getCurrentListMapNoExtraKeys!5209 lt!541420 lt!541422 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3099 (Int (_ BitVec 64)) V!45249)

(assert (=> b!1190734 (= lt!541422 (array!76909 (store (arr!37104 _values!996) i!673 (ValueCellFull!14336 (dynLambda!3099 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37642 _values!996)))))

(declare-fun lt!541417 () ListLongMap!17487)

(assert (=> b!1190734 (= lt!541417 (getCurrentListMapNoExtraKeys!5209 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190735 () Bool)

(declare-fun res!791968 () Bool)

(assert (=> b!1190735 (=> (not res!791968) (not e!676899))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190735 (= res!791968 (validKeyInArray!0 k0!934))))

(declare-fun b!1190736 () Bool)

(declare-fun res!791977 () Bool)

(assert (=> b!1190736 (=> (not res!791977) (not e!676899))))

(declare-datatypes ((List!26232 0))(
  ( (Nil!26229) (Cons!26228 (h!27437 (_ BitVec 64)) (t!38776 List!26232)) )
))
(declare-fun arrayNoDuplicates!0 (array!76906 (_ BitVec 32) List!26232) Bool)

(assert (=> b!1190736 (= res!791977 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26229))))

(declare-fun b!1190737 () Bool)

(declare-fun e!676898 () Bool)

(declare-fun e!676895 () Bool)

(declare-fun mapRes!46964 () Bool)

(assert (=> b!1190737 (= e!676898 (and e!676895 mapRes!46964))))

(declare-fun condMapEmpty!46964 () Bool)

(declare-fun mapDefault!46964 () ValueCell!14336)

(assert (=> b!1190737 (= condMapEmpty!46964 (= (arr!37104 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14336)) mapDefault!46964)))))

(declare-fun mapIsEmpty!46964 () Bool)

(assert (=> mapIsEmpty!46964 mapRes!46964))

(declare-fun b!1190738 () Bool)

(declare-fun res!791973 () Bool)

(assert (=> b!1190738 (=> (not res!791973) (not e!676899))))

(assert (=> b!1190738 (= res!791973 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37641 _keys!1208))))))

(declare-fun b!1190739 () Bool)

(assert (=> b!1190739 (= e!676896 true)))

(declare-fun -!1704 (ListLongMap!17487 (_ BitVec 64)) ListLongMap!17487)

(assert (=> b!1190739 (= (getCurrentListMapNoExtraKeys!5209 lt!541420 lt!541422 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1704 (getCurrentListMapNoExtraKeys!5209 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39381 0))(
  ( (Unit!39382) )
))
(declare-fun lt!541419 () Unit!39381)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!954 (array!76906 array!76908 (_ BitVec 32) (_ BitVec 32) V!45249 V!45249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39381)

(assert (=> b!1190739 (= lt!541419 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!954 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190740 () Bool)

(declare-fun res!791976 () Bool)

(assert (=> b!1190740 (=> (not res!791976) (not e!676899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190740 (= res!791976 (validMask!0 mask!1564))))

(declare-fun b!1190742 () Bool)

(declare-fun e!676900 () Bool)

(assert (=> b!1190742 (= e!676899 e!676900)))

(declare-fun res!791972 () Bool)

(assert (=> b!1190742 (=> (not res!791972) (not e!676900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76906 (_ BitVec 32)) Bool)

(assert (=> b!1190742 (= res!791972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541420 mask!1564))))

(assert (=> b!1190742 (= lt!541420 (array!76907 (store (arr!37103 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37641 _keys!1208)))))

(declare-fun b!1190743 () Bool)

(declare-fun res!791966 () Bool)

(assert (=> b!1190743 (=> (not res!791966) (not e!676900))))

(assert (=> b!1190743 (= res!791966 (arrayNoDuplicates!0 lt!541420 #b00000000000000000000000000000000 Nil!26229))))

(declare-fun b!1190744 () Bool)

(declare-fun res!791969 () Bool)

(assert (=> b!1190744 (=> (not res!791969) (not e!676899))))

(assert (=> b!1190744 (= res!791969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190745 () Bool)

(declare-fun tp_is_empty!30091 () Bool)

(assert (=> b!1190745 (= e!676895 tp_is_empty!30091)))

(declare-fun b!1190746 () Bool)

(declare-fun e!676894 () Bool)

(assert (=> b!1190746 (= e!676894 tp_is_empty!30091)))

(declare-fun mapNonEmpty!46964 () Bool)

(declare-fun tp!89397 () Bool)

(assert (=> mapNonEmpty!46964 (= mapRes!46964 (and tp!89397 e!676894))))

(declare-fun mapRest!46964 () (Array (_ BitVec 32) ValueCell!14336))

(declare-fun mapKey!46964 () (_ BitVec 32))

(declare-fun mapValue!46964 () ValueCell!14336)

(assert (=> mapNonEmpty!46964 (= (arr!37104 _values!996) (store mapRest!46964 mapKey!46964 mapValue!46964))))

(declare-fun b!1190747 () Bool)

(declare-fun res!791967 () Bool)

(assert (=> b!1190747 (=> (not res!791967) (not e!676899))))

(assert (=> b!1190747 (= res!791967 (= (select (arr!37103 _keys!1208) i!673) k0!934))))

(declare-fun res!791975 () Bool)

(assert (=> start!99976 (=> (not res!791975) (not e!676899))))

(assert (=> start!99976 (= res!791975 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37641 _keys!1208))))))

(assert (=> start!99976 e!676899))

(assert (=> start!99976 tp_is_empty!30091))

(declare-fun array_inv!28422 (array!76906) Bool)

(assert (=> start!99976 (array_inv!28422 _keys!1208)))

(assert (=> start!99976 true))

(assert (=> start!99976 tp!89396))

(declare-fun array_inv!28423 (array!76908) Bool)

(assert (=> start!99976 (and (array_inv!28423 _values!996) e!676898)))

(declare-fun b!1190741 () Bool)

(assert (=> b!1190741 (= e!676900 (not e!676893))))

(declare-fun res!791970 () Bool)

(assert (=> b!1190741 (=> res!791970 e!676893)))

(assert (=> b!1190741 (= res!791970 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190741 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541421 () Unit!39381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76906 (_ BitVec 64) (_ BitVec 32)) Unit!39381)

(assert (=> b!1190741 (= lt!541421 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99976 res!791975) b!1190740))

(assert (= (and b!1190740 res!791976) b!1190733))

(assert (= (and b!1190733 res!791971) b!1190744))

(assert (= (and b!1190744 res!791969) b!1190736))

(assert (= (and b!1190736 res!791977) b!1190738))

(assert (= (and b!1190738 res!791973) b!1190735))

(assert (= (and b!1190735 res!791968) b!1190747))

(assert (= (and b!1190747 res!791967) b!1190742))

(assert (= (and b!1190742 res!791972) b!1190743))

(assert (= (and b!1190743 res!791966) b!1190741))

(assert (= (and b!1190741 (not res!791970)) b!1190734))

(assert (= (and b!1190734 (not res!791974)) b!1190739))

(assert (= (and b!1190737 condMapEmpty!46964) mapIsEmpty!46964))

(assert (= (and b!1190737 (not condMapEmpty!46964)) mapNonEmpty!46964))

(get-info :version)

(assert (= (and mapNonEmpty!46964 ((_ is ValueCellFull!14336) mapValue!46964)) b!1190746))

(assert (= (and b!1190737 ((_ is ValueCellFull!14336) mapDefault!46964)) b!1190745))

(assert (= start!99976 b!1190737))

(declare-fun b_lambda!20687 () Bool)

(assert (=> (not b_lambda!20687) (not b!1190734)))

(declare-fun t!38774 () Bool)

(declare-fun tb!10365 () Bool)

(assert (=> (and start!99976 (= defaultEntry!1004 defaultEntry!1004) t!38774) tb!10365))

(declare-fun result!21305 () Bool)

(assert (=> tb!10365 (= result!21305 tp_is_empty!30091)))

(assert (=> b!1190734 t!38774))

(declare-fun b_and!41969 () Bool)

(assert (= b_and!41967 (and (=> t!38774 result!21305) b_and!41969)))

(declare-fun m!1098773 () Bool)

(assert (=> start!99976 m!1098773))

(declare-fun m!1098775 () Bool)

(assert (=> start!99976 m!1098775))

(declare-fun m!1098777 () Bool)

(assert (=> b!1190740 m!1098777))

(declare-fun m!1098779 () Bool)

(assert (=> b!1190735 m!1098779))

(declare-fun m!1098781 () Bool)

(assert (=> b!1190739 m!1098781))

(declare-fun m!1098783 () Bool)

(assert (=> b!1190739 m!1098783))

(assert (=> b!1190739 m!1098783))

(declare-fun m!1098785 () Bool)

(assert (=> b!1190739 m!1098785))

(declare-fun m!1098787 () Bool)

(assert (=> b!1190739 m!1098787))

(declare-fun m!1098789 () Bool)

(assert (=> b!1190743 m!1098789))

(declare-fun m!1098791 () Bool)

(assert (=> b!1190741 m!1098791))

(declare-fun m!1098793 () Bool)

(assert (=> b!1190741 m!1098793))

(declare-fun m!1098795 () Bool)

(assert (=> b!1190747 m!1098795))

(declare-fun m!1098797 () Bool)

(assert (=> b!1190744 m!1098797))

(declare-fun m!1098799 () Bool)

(assert (=> b!1190734 m!1098799))

(declare-fun m!1098801 () Bool)

(assert (=> b!1190734 m!1098801))

(declare-fun m!1098803 () Bool)

(assert (=> b!1190734 m!1098803))

(declare-fun m!1098805 () Bool)

(assert (=> b!1190734 m!1098805))

(declare-fun m!1098807 () Bool)

(assert (=> b!1190742 m!1098807))

(declare-fun m!1098809 () Bool)

(assert (=> b!1190742 m!1098809))

(declare-fun m!1098811 () Bool)

(assert (=> mapNonEmpty!46964 m!1098811))

(declare-fun m!1098813 () Bool)

(assert (=> b!1190736 m!1098813))

(check-sat (not b!1190739) (not b!1190741) (not start!99976) tp_is_empty!30091 (not b!1190744) (not b!1190735) (not b!1190740) b_and!41969 (not b!1190734) (not b_lambda!20687) (not b!1190742) (not b!1190743) (not b_next!25561) (not b!1190736) (not mapNonEmpty!46964))
(check-sat b_and!41969 (not b_next!25561))
