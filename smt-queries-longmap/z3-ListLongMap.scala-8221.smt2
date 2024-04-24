; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100470 () Bool)

(assert start!100470)

(declare-fun b!1196726 () Bool)

(declare-fun e!680137 () Bool)

(assert (=> b!1196726 (= e!680137 (not true))))

(declare-datatypes ((array!77423 0))(
  ( (array!77424 (arr!37352 (Array (_ BitVec 32) (_ BitVec 64))) (size!37889 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77423)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196726 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39609 0))(
  ( (Unit!39610) )
))
(declare-fun lt!543412 () Unit!39609)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77423 (_ BitVec 64) (_ BitVec 32)) Unit!39609)

(assert (=> b!1196726 (= lt!543412 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196727 () Bool)

(declare-fun e!680138 () Bool)

(declare-fun tp_is_empty!30301 () Bool)

(assert (=> b!1196727 (= e!680138 tp_is_empty!30301)))

(declare-fun b!1196728 () Bool)

(declare-fun e!680140 () Bool)

(assert (=> b!1196728 (= e!680140 tp_is_empty!30301)))

(declare-fun b!1196729 () Bool)

(declare-fun res!795973 () Bool)

(declare-fun e!680139 () Bool)

(assert (=> b!1196729 (=> (not res!795973) (not e!680139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196729 (= res!795973 (validKeyInArray!0 k0!934))))

(declare-fun b!1196730 () Bool)

(declare-fun res!795965 () Bool)

(assert (=> b!1196730 (=> (not res!795965) (not e!680139))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77423 (_ BitVec 32)) Bool)

(assert (=> b!1196730 (= res!795965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!795966 () Bool)

(assert (=> start!100470 (=> (not res!795966) (not e!680139))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100470 (= res!795966 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37889 _keys!1208))))))

(assert (=> start!100470 e!680139))

(declare-fun array_inv!28544 (array!77423) Bool)

(assert (=> start!100470 (array_inv!28544 _keys!1208)))

(assert (=> start!100470 true))

(declare-datatypes ((V!45529 0))(
  ( (V!45530 (val!15207 Int)) )
))
(declare-datatypes ((ValueCell!14441 0))(
  ( (ValueCellFull!14441 (v!17841 V!45529)) (EmptyCell!14441) )
))
(declare-datatypes ((array!77425 0))(
  ( (array!77426 (arr!37353 (Array (_ BitVec 32) ValueCell!14441)) (size!37890 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77425)

(declare-fun e!680136 () Bool)

(declare-fun array_inv!28545 (array!77425) Bool)

(assert (=> start!100470 (and (array_inv!28545 _values!996) e!680136)))

(declare-fun b!1196731 () Bool)

(declare-fun res!795972 () Bool)

(assert (=> b!1196731 (=> (not res!795972) (not e!680139))))

(assert (=> b!1196731 (= res!795972 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37889 _keys!1208))))))

(declare-fun b!1196732 () Bool)

(assert (=> b!1196732 (= e!680139 e!680137)))

(declare-fun res!795967 () Bool)

(assert (=> b!1196732 (=> (not res!795967) (not e!680137))))

(declare-fun lt!543411 () array!77423)

(assert (=> b!1196732 (= res!795967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543411 mask!1564))))

(assert (=> b!1196732 (= lt!543411 (array!77424 (store (arr!37352 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37889 _keys!1208)))))

(declare-fun b!1196733 () Bool)

(declare-fun mapRes!47288 () Bool)

(assert (=> b!1196733 (= e!680136 (and e!680140 mapRes!47288))))

(declare-fun condMapEmpty!47288 () Bool)

(declare-fun mapDefault!47288 () ValueCell!14441)

(assert (=> b!1196733 (= condMapEmpty!47288 (= (arr!37353 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14441)) mapDefault!47288)))))

(declare-fun b!1196734 () Bool)

(declare-fun res!795968 () Bool)

(assert (=> b!1196734 (=> (not res!795968) (not e!680139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196734 (= res!795968 (validMask!0 mask!1564))))

(declare-fun b!1196735 () Bool)

(declare-fun res!795969 () Bool)

(assert (=> b!1196735 (=> (not res!795969) (not e!680137))))

(declare-datatypes ((List!26312 0))(
  ( (Nil!26309) (Cons!26308 (h!27526 (_ BitVec 64)) (t!38975 List!26312)) )
))
(declare-fun arrayNoDuplicates!0 (array!77423 (_ BitVec 32) List!26312) Bool)

(assert (=> b!1196735 (= res!795969 (arrayNoDuplicates!0 lt!543411 #b00000000000000000000000000000000 Nil!26309))))

(declare-fun mapIsEmpty!47288 () Bool)

(assert (=> mapIsEmpty!47288 mapRes!47288))

(declare-fun b!1196736 () Bool)

(declare-fun res!795974 () Bool)

(assert (=> b!1196736 (=> (not res!795974) (not e!680139))))

(assert (=> b!1196736 (= res!795974 (= (select (arr!37352 _keys!1208) i!673) k0!934))))

(declare-fun b!1196737 () Bool)

(declare-fun res!795971 () Bool)

(assert (=> b!1196737 (=> (not res!795971) (not e!680139))))

(assert (=> b!1196737 (= res!795971 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26309))))

(declare-fun mapNonEmpty!47288 () Bool)

(declare-fun tp!89898 () Bool)

(assert (=> mapNonEmpty!47288 (= mapRes!47288 (and tp!89898 e!680138))))

(declare-fun mapRest!47288 () (Array (_ BitVec 32) ValueCell!14441))

(declare-fun mapValue!47288 () ValueCell!14441)

(declare-fun mapKey!47288 () (_ BitVec 32))

(assert (=> mapNonEmpty!47288 (= (arr!37353 _values!996) (store mapRest!47288 mapKey!47288 mapValue!47288))))

(declare-fun b!1196738 () Bool)

(declare-fun res!795970 () Bool)

(assert (=> b!1196738 (=> (not res!795970) (not e!680139))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196738 (= res!795970 (and (= (size!37890 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37889 _keys!1208) (size!37890 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100470 res!795966) b!1196734))

(assert (= (and b!1196734 res!795968) b!1196738))

(assert (= (and b!1196738 res!795970) b!1196730))

(assert (= (and b!1196730 res!795965) b!1196737))

(assert (= (and b!1196737 res!795971) b!1196731))

(assert (= (and b!1196731 res!795972) b!1196729))

(assert (= (and b!1196729 res!795973) b!1196736))

(assert (= (and b!1196736 res!795974) b!1196732))

(assert (= (and b!1196732 res!795967) b!1196735))

(assert (= (and b!1196735 res!795969) b!1196726))

(assert (= (and b!1196733 condMapEmpty!47288) mapIsEmpty!47288))

(assert (= (and b!1196733 (not condMapEmpty!47288)) mapNonEmpty!47288))

(get-info :version)

(assert (= (and mapNonEmpty!47288 ((_ is ValueCellFull!14441) mapValue!47288)) b!1196727))

(assert (= (and b!1196733 ((_ is ValueCellFull!14441) mapDefault!47288)) b!1196728))

(assert (= start!100470 b!1196733))

(declare-fun m!1104579 () Bool)

(assert (=> b!1196736 m!1104579))

(declare-fun m!1104581 () Bool)

(assert (=> b!1196737 m!1104581))

(declare-fun m!1104583 () Bool)

(assert (=> start!100470 m!1104583))

(declare-fun m!1104585 () Bool)

(assert (=> start!100470 m!1104585))

(declare-fun m!1104587 () Bool)

(assert (=> b!1196729 m!1104587))

(declare-fun m!1104589 () Bool)

(assert (=> b!1196732 m!1104589))

(declare-fun m!1104591 () Bool)

(assert (=> b!1196732 m!1104591))

(declare-fun m!1104593 () Bool)

(assert (=> b!1196735 m!1104593))

(declare-fun m!1104595 () Bool)

(assert (=> b!1196730 m!1104595))

(declare-fun m!1104597 () Bool)

(assert (=> b!1196734 m!1104597))

(declare-fun m!1104599 () Bool)

(assert (=> mapNonEmpty!47288 m!1104599))

(declare-fun m!1104601 () Bool)

(assert (=> b!1196726 m!1104601))

(declare-fun m!1104603 () Bool)

(assert (=> b!1196726 m!1104603))

(check-sat (not b!1196735) (not b!1196737) (not b!1196729) (not mapNonEmpty!47288) (not b!1196726) (not start!100470) (not b!1196730) (not b!1196732) tp_is_empty!30301 (not b!1196734))
(check-sat)
