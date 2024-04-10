; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97786 () Bool)

(assert start!97786)

(declare-fun b_free!23487 () Bool)

(declare-fun b_next!23487 () Bool)

(assert (=> start!97786 (= b_free!23487 (not b_next!23487))))

(declare-fun tp!83164 () Bool)

(declare-fun b_and!37761 () Bool)

(assert (=> start!97786 (= tp!83164 b_and!37761)))

(declare-fun b!1118642 () Bool)

(declare-fun res!747156 () Bool)

(declare-fun e!637150 () Bool)

(assert (=> b!1118642 (=> (not res!747156) (not e!637150))))

(declare-datatypes ((array!72925 0))(
  ( (array!72926 (arr!35115 (Array (_ BitVec 32) (_ BitVec 64))) (size!35651 (_ BitVec 32))) )
))
(declare-fun lt!497539 () array!72925)

(declare-datatypes ((List!24430 0))(
  ( (Nil!24427) (Cons!24426 (h!25635 (_ BitVec 64)) (t!34911 List!24430)) )
))
(declare-fun arrayNoDuplicates!0 (array!72925 (_ BitVec 32) List!24430) Bool)

(assert (=> b!1118642 (= res!747156 (arrayNoDuplicates!0 lt!497539 #b00000000000000000000000000000000 Nil!24427))))

(declare-fun b!1118643 () Bool)

(declare-fun res!747150 () Bool)

(declare-fun e!637154 () Bool)

(assert (=> b!1118643 (=> (not res!747150) (not e!637154))))

(declare-fun _keys!1208 () array!72925)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42483 0))(
  ( (V!42484 (val!14065 Int)) )
))
(declare-datatypes ((ValueCell!13299 0))(
  ( (ValueCellFull!13299 (v!16698 V!42483)) (EmptyCell!13299) )
))
(declare-datatypes ((array!72927 0))(
  ( (array!72928 (arr!35116 (Array (_ BitVec 32) ValueCell!13299)) (size!35652 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72927)

(assert (=> b!1118643 (= res!747150 (and (= (size!35652 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35651 _keys!1208) (size!35652 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!747158 () Bool)

(assert (=> start!97786 (=> (not res!747158) (not e!637154))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97786 (= res!747158 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35651 _keys!1208))))))

(assert (=> start!97786 e!637154))

(declare-fun tp_is_empty!28017 () Bool)

(assert (=> start!97786 tp_is_empty!28017))

(declare-fun array_inv!26982 (array!72925) Bool)

(assert (=> start!97786 (array_inv!26982 _keys!1208)))

(assert (=> start!97786 true))

(assert (=> start!97786 tp!83164))

(declare-fun e!637152 () Bool)

(declare-fun array_inv!26983 (array!72927) Bool)

(assert (=> start!97786 (and (array_inv!26983 _values!996) e!637152)))

(declare-fun b!1118644 () Bool)

(declare-fun e!637151 () Bool)

(assert (=> b!1118644 (= e!637151 tp_is_empty!28017)))

(declare-fun b!1118645 () Bool)

(declare-fun res!747160 () Bool)

(assert (=> b!1118645 (=> (not res!747160) (not e!637154))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118645 (= res!747160 (validKeyInArray!0 k0!934))))

(declare-fun b!1118646 () Bool)

(declare-fun res!747159 () Bool)

(assert (=> b!1118646 (=> (not res!747159) (not e!637154))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118646 (= res!747159 (= (select (arr!35115 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43843 () Bool)

(declare-fun mapRes!43843 () Bool)

(assert (=> mapIsEmpty!43843 mapRes!43843))

(declare-fun b!1118647 () Bool)

(declare-fun e!637155 () Bool)

(assert (=> b!1118647 (= e!637155 true)))

(declare-fun zeroValue!944 () V!42483)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17644 0))(
  ( (tuple2!17645 (_1!8833 (_ BitVec 64)) (_2!8833 V!42483)) )
))
(declare-datatypes ((List!24431 0))(
  ( (Nil!24428) (Cons!24427 (h!25636 tuple2!17644) (t!34912 List!24431)) )
))
(declare-datatypes ((ListLongMap!15613 0))(
  ( (ListLongMap!15614 (toList!7822 List!24431)) )
))
(declare-fun lt!497540 () ListLongMap!15613)

(declare-fun minValue!944 () V!42483)

(declare-fun getCurrentListMapNoExtraKeys!4312 (array!72925 array!72927 (_ BitVec 32) (_ BitVec 32) V!42483 V!42483 (_ BitVec 32) Int) ListLongMap!15613)

(assert (=> b!1118647 (= lt!497540 (getCurrentListMapNoExtraKeys!4312 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118648 () Bool)

(assert (=> b!1118648 (= e!637150 (not e!637155))))

(declare-fun res!747152 () Bool)

(assert (=> b!1118648 (=> res!747152 e!637155)))

(assert (=> b!1118648 (= res!747152 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118648 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36714 0))(
  ( (Unit!36715) )
))
(declare-fun lt!497538 () Unit!36714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72925 (_ BitVec 64) (_ BitVec 32)) Unit!36714)

(assert (=> b!1118648 (= lt!497538 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43843 () Bool)

(declare-fun tp!83165 () Bool)

(assert (=> mapNonEmpty!43843 (= mapRes!43843 (and tp!83165 e!637151))))

(declare-fun mapKey!43843 () (_ BitVec 32))

(declare-fun mapValue!43843 () ValueCell!13299)

(declare-fun mapRest!43843 () (Array (_ BitVec 32) ValueCell!13299))

(assert (=> mapNonEmpty!43843 (= (arr!35116 _values!996) (store mapRest!43843 mapKey!43843 mapValue!43843))))

(declare-fun b!1118649 () Bool)

(declare-fun res!747154 () Bool)

(assert (=> b!1118649 (=> (not res!747154) (not e!637154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72925 (_ BitVec 32)) Bool)

(assert (=> b!1118649 (= res!747154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118650 () Bool)

(assert (=> b!1118650 (= e!637154 e!637150)))

(declare-fun res!747151 () Bool)

(assert (=> b!1118650 (=> (not res!747151) (not e!637150))))

(assert (=> b!1118650 (= res!747151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497539 mask!1564))))

(assert (=> b!1118650 (= lt!497539 (array!72926 (store (arr!35115 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35651 _keys!1208)))))

(declare-fun b!1118651 () Bool)

(declare-fun e!637149 () Bool)

(assert (=> b!1118651 (= e!637152 (and e!637149 mapRes!43843))))

(declare-fun condMapEmpty!43843 () Bool)

(declare-fun mapDefault!43843 () ValueCell!13299)

(assert (=> b!1118651 (= condMapEmpty!43843 (= (arr!35116 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13299)) mapDefault!43843)))))

(declare-fun b!1118652 () Bool)

(declare-fun res!747153 () Bool)

(assert (=> b!1118652 (=> (not res!747153) (not e!637154))))

(assert (=> b!1118652 (= res!747153 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35651 _keys!1208))))))

(declare-fun b!1118653 () Bool)

(declare-fun res!747157 () Bool)

(assert (=> b!1118653 (=> (not res!747157) (not e!637154))))

(assert (=> b!1118653 (= res!747157 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24427))))

(declare-fun b!1118654 () Bool)

(assert (=> b!1118654 (= e!637149 tp_is_empty!28017)))

(declare-fun b!1118655 () Bool)

(declare-fun res!747155 () Bool)

(assert (=> b!1118655 (=> (not res!747155) (not e!637154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118655 (= res!747155 (validMask!0 mask!1564))))

(assert (= (and start!97786 res!747158) b!1118655))

(assert (= (and b!1118655 res!747155) b!1118643))

(assert (= (and b!1118643 res!747150) b!1118649))

(assert (= (and b!1118649 res!747154) b!1118653))

(assert (= (and b!1118653 res!747157) b!1118652))

(assert (= (and b!1118652 res!747153) b!1118645))

(assert (= (and b!1118645 res!747160) b!1118646))

(assert (= (and b!1118646 res!747159) b!1118650))

(assert (= (and b!1118650 res!747151) b!1118642))

(assert (= (and b!1118642 res!747156) b!1118648))

(assert (= (and b!1118648 (not res!747152)) b!1118647))

(assert (= (and b!1118651 condMapEmpty!43843) mapIsEmpty!43843))

(assert (= (and b!1118651 (not condMapEmpty!43843)) mapNonEmpty!43843))

(get-info :version)

(assert (= (and mapNonEmpty!43843 ((_ is ValueCellFull!13299) mapValue!43843)) b!1118644))

(assert (= (and b!1118651 ((_ is ValueCellFull!13299) mapDefault!43843)) b!1118654))

(assert (= start!97786 b!1118651))

(declare-fun m!1034115 () Bool)

(assert (=> start!97786 m!1034115))

(declare-fun m!1034117 () Bool)

(assert (=> start!97786 m!1034117))

(declare-fun m!1034119 () Bool)

(assert (=> b!1118655 m!1034119))

(declare-fun m!1034121 () Bool)

(assert (=> b!1118650 m!1034121))

(declare-fun m!1034123 () Bool)

(assert (=> b!1118650 m!1034123))

(declare-fun m!1034125 () Bool)

(assert (=> b!1118648 m!1034125))

(declare-fun m!1034127 () Bool)

(assert (=> b!1118648 m!1034127))

(declare-fun m!1034129 () Bool)

(assert (=> mapNonEmpty!43843 m!1034129))

(declare-fun m!1034131 () Bool)

(assert (=> b!1118642 m!1034131))

(declare-fun m!1034133 () Bool)

(assert (=> b!1118647 m!1034133))

(declare-fun m!1034135 () Bool)

(assert (=> b!1118653 m!1034135))

(declare-fun m!1034137 () Bool)

(assert (=> b!1118646 m!1034137))

(declare-fun m!1034139 () Bool)

(assert (=> b!1118649 m!1034139))

(declare-fun m!1034141 () Bool)

(assert (=> b!1118645 m!1034141))

(check-sat (not b!1118642) (not mapNonEmpty!43843) b_and!37761 (not b_next!23487) (not b!1118653) (not b!1118645) (not b!1118647) tp_is_empty!28017 (not b!1118648) (not b!1118655) (not b!1118650) (not start!97786) (not b!1118649))
(check-sat b_and!37761 (not b_next!23487))
