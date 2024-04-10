; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100104 () Bool)

(assert start!100104)

(declare-fun b_free!25677 () Bool)

(declare-fun b_next!25677 () Bool)

(assert (=> start!100104 (= b_free!25677 (not b_next!25677))))

(declare-fun tp!89754 () Bool)

(declare-fun b_and!42221 () Bool)

(assert (=> start!100104 (= tp!89754 b_and!42221)))

(declare-fun b!1193713 () Bool)

(declare-fun res!794213 () Bool)

(declare-fun e!678426 () Bool)

(assert (=> b!1193713 (=> (not res!794213) (not e!678426))))

(declare-datatypes ((array!77205 0))(
  ( (array!77206 (arr!37252 (Array (_ BitVec 32) (_ BitVec 64))) (size!37788 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77205)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77205 (_ BitVec 32)) Bool)

(assert (=> b!1193713 (= res!794213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193714 () Bool)

(declare-fun e!678425 () Bool)

(declare-fun tp_is_empty!30213 () Bool)

(assert (=> b!1193714 (= e!678425 tp_is_empty!30213)))

(declare-fun b!1193715 () Bool)

(declare-fun res!794215 () Bool)

(assert (=> b!1193715 (=> (not res!794215) (not e!678426))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193715 (= res!794215 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37788 _keys!1208))))))

(declare-fun res!794211 () Bool)

(assert (=> start!100104 (=> (not res!794211) (not e!678426))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100104 (= res!794211 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37788 _keys!1208))))))

(assert (=> start!100104 e!678426))

(assert (=> start!100104 tp_is_empty!30213))

(declare-fun array_inv!28402 (array!77205) Bool)

(assert (=> start!100104 (array_inv!28402 _keys!1208)))

(assert (=> start!100104 true))

(assert (=> start!100104 tp!89754))

(declare-datatypes ((V!45411 0))(
  ( (V!45412 (val!15163 Int)) )
))
(declare-datatypes ((ValueCell!14397 0))(
  ( (ValueCellFull!14397 (v!17801 V!45411)) (EmptyCell!14397) )
))
(declare-datatypes ((array!77207 0))(
  ( (array!77208 (arr!37253 (Array (_ BitVec 32) ValueCell!14397)) (size!37789 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77207)

(declare-fun e!678422 () Bool)

(declare-fun array_inv!28403 (array!77207) Bool)

(assert (=> start!100104 (and (array_inv!28403 _values!996) e!678422)))

(declare-fun mapIsEmpty!47147 () Bool)

(declare-fun mapRes!47147 () Bool)

(assert (=> mapIsEmpty!47147 mapRes!47147))

(declare-fun b!1193716 () Bool)

(declare-fun res!794205 () Bool)

(assert (=> b!1193716 (=> (not res!794205) (not e!678426))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193716 (= res!794205 (validKeyInArray!0 k0!934))))

(declare-fun b!1193717 () Bool)

(declare-fun res!794214 () Bool)

(declare-fun e!678427 () Bool)

(assert (=> b!1193717 (=> (not res!794214) (not e!678427))))

(declare-fun lt!542664 () array!77205)

(declare-datatypes ((List!26240 0))(
  ( (Nil!26237) (Cons!26236 (h!27445 (_ BitVec 64)) (t!38909 List!26240)) )
))
(declare-fun arrayNoDuplicates!0 (array!77205 (_ BitVec 32) List!26240) Bool)

(assert (=> b!1193717 (= res!794214 (arrayNoDuplicates!0 lt!542664 #b00000000000000000000000000000000 Nil!26237))))

(declare-fun b!1193718 () Bool)

(declare-fun e!678421 () Bool)

(assert (=> b!1193718 (= e!678427 (not e!678421))))

(declare-fun res!794210 () Bool)

(assert (=> b!1193718 (=> res!794210 e!678421)))

(assert (=> b!1193718 (= res!794210 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193718 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39600 0))(
  ( (Unit!39601) )
))
(declare-fun lt!542661 () Unit!39600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77205 (_ BitVec 64) (_ BitVec 32)) Unit!39600)

(assert (=> b!1193718 (= lt!542661 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47147 () Bool)

(declare-fun tp!89753 () Bool)

(assert (=> mapNonEmpty!47147 (= mapRes!47147 (and tp!89753 e!678425))))

(declare-fun mapRest!47147 () (Array (_ BitVec 32) ValueCell!14397))

(declare-fun mapValue!47147 () ValueCell!14397)

(declare-fun mapKey!47147 () (_ BitVec 32))

(assert (=> mapNonEmpty!47147 (= (arr!37253 _values!996) (store mapRest!47147 mapKey!47147 mapValue!47147))))

(declare-fun b!1193719 () Bool)

(declare-fun res!794212 () Bool)

(assert (=> b!1193719 (=> (not res!794212) (not e!678426))))

(assert (=> b!1193719 (= res!794212 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26237))))

(declare-fun b!1193720 () Bool)

(assert (=> b!1193720 (= e!678426 e!678427)))

(declare-fun res!794206 () Bool)

(assert (=> b!1193720 (=> (not res!794206) (not e!678427))))

(assert (=> b!1193720 (= res!794206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542664 mask!1564))))

(assert (=> b!1193720 (= lt!542664 (array!77206 (store (arr!37252 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37788 _keys!1208)))))

(declare-fun b!1193721 () Bool)

(declare-fun e!678423 () Bool)

(assert (=> b!1193721 (= e!678423 tp_is_empty!30213)))

(declare-fun b!1193722 () Bool)

(assert (=> b!1193722 (= e!678422 (and e!678423 mapRes!47147))))

(declare-fun condMapEmpty!47147 () Bool)

(declare-fun mapDefault!47147 () ValueCell!14397)

(assert (=> b!1193722 (= condMapEmpty!47147 (= (arr!37253 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14397)) mapDefault!47147)))))

(declare-fun b!1193723 () Bool)

(assert (=> b!1193723 (= e!678421 (or (= from!1455 i!673) (bvslt from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45411)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19492 0))(
  ( (tuple2!19493 (_1!9757 (_ BitVec 64)) (_2!9757 V!45411)) )
))
(declare-datatypes ((List!26241 0))(
  ( (Nil!26238) (Cons!26237 (h!27446 tuple2!19492) (t!38910 List!26241)) )
))
(declare-datatypes ((ListLongMap!17461 0))(
  ( (ListLongMap!17462 (toList!8746 List!26241)) )
))
(declare-fun lt!542663 () ListLongMap!17461)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45411)

(declare-fun getCurrentListMapNoExtraKeys!5187 (array!77205 array!77207 (_ BitVec 32) (_ BitVec 32) V!45411 V!45411 (_ BitVec 32) Int) ListLongMap!17461)

(declare-fun dynLambda!3114 (Int (_ BitVec 64)) V!45411)

(assert (=> b!1193723 (= lt!542663 (getCurrentListMapNoExtraKeys!5187 lt!542664 (array!77208 (store (arr!37253 _values!996) i!673 (ValueCellFull!14397 (dynLambda!3114 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37789 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!542662 () ListLongMap!17461)

(assert (=> b!1193723 (= lt!542662 (getCurrentListMapNoExtraKeys!5187 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193724 () Bool)

(declare-fun res!794209 () Bool)

(assert (=> b!1193724 (=> (not res!794209) (not e!678426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193724 (= res!794209 (validMask!0 mask!1564))))

(declare-fun b!1193725 () Bool)

(declare-fun res!794208 () Bool)

(assert (=> b!1193725 (=> (not res!794208) (not e!678426))))

(assert (=> b!1193725 (= res!794208 (and (= (size!37789 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37788 _keys!1208) (size!37789 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193726 () Bool)

(declare-fun res!794207 () Bool)

(assert (=> b!1193726 (=> (not res!794207) (not e!678426))))

(assert (=> b!1193726 (= res!794207 (= (select (arr!37252 _keys!1208) i!673) k0!934))))

(assert (= (and start!100104 res!794211) b!1193724))

(assert (= (and b!1193724 res!794209) b!1193725))

(assert (= (and b!1193725 res!794208) b!1193713))

(assert (= (and b!1193713 res!794213) b!1193719))

(assert (= (and b!1193719 res!794212) b!1193715))

(assert (= (and b!1193715 res!794215) b!1193716))

(assert (= (and b!1193716 res!794205) b!1193726))

(assert (= (and b!1193726 res!794207) b!1193720))

(assert (= (and b!1193720 res!794206) b!1193717))

(assert (= (and b!1193717 res!794214) b!1193718))

(assert (= (and b!1193718 (not res!794210)) b!1193723))

(assert (= (and b!1193722 condMapEmpty!47147) mapIsEmpty!47147))

(assert (= (and b!1193722 (not condMapEmpty!47147)) mapNonEmpty!47147))

(get-info :version)

(assert (= (and mapNonEmpty!47147 ((_ is ValueCellFull!14397) mapValue!47147)) b!1193714))

(assert (= (and b!1193722 ((_ is ValueCellFull!14397) mapDefault!47147)) b!1193721))

(assert (= start!100104 b!1193722))

(declare-fun b_lambda!20821 () Bool)

(assert (=> (not b_lambda!20821) (not b!1193723)))

(declare-fun t!38908 () Bool)

(declare-fun tb!10489 () Bool)

(assert (=> (and start!100104 (= defaultEntry!1004 defaultEntry!1004) t!38908) tb!10489))

(declare-fun result!21545 () Bool)

(assert (=> tb!10489 (= result!21545 tp_is_empty!30213)))

(assert (=> b!1193723 t!38908))

(declare-fun b_and!42223 () Bool)

(assert (= b_and!42221 (and (=> t!38908 result!21545) b_and!42223)))

(declare-fun m!1101895 () Bool)

(assert (=> b!1193716 m!1101895))

(declare-fun m!1101897 () Bool)

(assert (=> mapNonEmpty!47147 m!1101897))

(declare-fun m!1101899 () Bool)

(assert (=> b!1193719 m!1101899))

(declare-fun m!1101901 () Bool)

(assert (=> b!1193724 m!1101901))

(declare-fun m!1101903 () Bool)

(assert (=> b!1193717 m!1101903))

(declare-fun m!1101905 () Bool)

(assert (=> b!1193720 m!1101905))

(declare-fun m!1101907 () Bool)

(assert (=> b!1193720 m!1101907))

(declare-fun m!1101909 () Bool)

(assert (=> b!1193713 m!1101909))

(declare-fun m!1101911 () Bool)

(assert (=> b!1193718 m!1101911))

(declare-fun m!1101913 () Bool)

(assert (=> b!1193718 m!1101913))

(declare-fun m!1101915 () Bool)

(assert (=> b!1193726 m!1101915))

(declare-fun m!1101917 () Bool)

(assert (=> b!1193723 m!1101917))

(declare-fun m!1101919 () Bool)

(assert (=> b!1193723 m!1101919))

(declare-fun m!1101921 () Bool)

(assert (=> b!1193723 m!1101921))

(declare-fun m!1101923 () Bool)

(assert (=> b!1193723 m!1101923))

(declare-fun m!1101925 () Bool)

(assert (=> start!100104 m!1101925))

(declare-fun m!1101927 () Bool)

(assert (=> start!100104 m!1101927))

(check-sat tp_is_empty!30213 (not b!1193716) b_and!42223 (not b_next!25677) (not b!1193717) (not b!1193723) (not mapNonEmpty!47147) (not b!1193713) (not b!1193720) (not b!1193719) (not b_lambda!20821) (not start!100104) (not b!1193718) (not b!1193724))
(check-sat b_and!42223 (not b_next!25677))
