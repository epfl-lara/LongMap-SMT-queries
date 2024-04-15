; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101262 () Bool)

(assert start!101262)

(declare-fun b_free!26191 () Bool)

(declare-fun b_next!26191 () Bool)

(assert (=> start!101262 (= b_free!26191 (not b_next!26191))))

(declare-fun tp!91595 () Bool)

(declare-fun b_and!43481 () Bool)

(assert (=> start!101262 (= tp!91595 b_and!43481)))

(declare-fun mapIsEmpty!48217 () Bool)

(declare-fun mapRes!48217 () Bool)

(assert (=> mapIsEmpty!48217 mapRes!48217))

(declare-fun mapNonEmpty!48217 () Bool)

(declare-fun tp!91594 () Bool)

(declare-fun e!690580 () Bool)

(assert (=> mapNonEmpty!48217 (= mapRes!48217 (and tp!91594 e!690580))))

(declare-datatypes ((V!46321 0))(
  ( (V!46322 (val!15504 Int)) )
))
(declare-datatypes ((ValueCell!14738 0))(
  ( (ValueCellFull!14738 (v!18156 V!46321)) (EmptyCell!14738) )
))
(declare-fun mapRest!48217 () (Array (_ BitVec 32) ValueCell!14738))

(declare-fun mapKey!48217 () (_ BitVec 32))

(declare-fun mapValue!48217 () ValueCell!14738)

(declare-datatypes ((array!78484 0))(
  ( (array!78485 (arr!37877 (Array (_ BitVec 32) ValueCell!14738)) (size!38415 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78484)

(assert (=> mapNonEmpty!48217 (= (arr!37877 _values!996) (store mapRest!48217 mapKey!48217 mapValue!48217))))

(declare-fun b!1216378 () Bool)

(declare-fun res!807740 () Bool)

(declare-fun e!690579 () Bool)

(assert (=> b!1216378 (=> (not res!807740) (not e!690579))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216378 (= res!807740 (validKeyInArray!0 k0!934))))

(declare-fun b!1216379 () Bool)

(declare-fun e!690584 () Bool)

(assert (=> b!1216379 (= e!690584 true)))

(declare-fun zeroValue!944 () V!46321)

(declare-datatypes ((array!78486 0))(
  ( (array!78487 (arr!37878 (Array (_ BitVec 32) (_ BitVec 64))) (size!38416 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78486)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!552742 () array!78484)

(declare-fun lt!552738 () array!78486)

(declare-fun minValue!944 () V!46321)

(declare-datatypes ((tuple2!20022 0))(
  ( (tuple2!20023 (_1!10022 (_ BitVec 64)) (_2!10022 V!46321)) )
))
(declare-datatypes ((List!26799 0))(
  ( (Nil!26796) (Cons!26795 (h!28004 tuple2!20022) (t!39961 List!26799)) )
))
(declare-datatypes ((ListLongMap!17991 0))(
  ( (ListLongMap!17992 (toList!9011 List!26799)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5450 (array!78486 array!78484 (_ BitVec 32) (_ BitVec 32) V!46321 V!46321 (_ BitVec 32) Int) ListLongMap!17991)

(declare-fun -!1850 (ListLongMap!17991 (_ BitVec 64)) ListLongMap!17991)

(assert (=> b!1216379 (= (getCurrentListMapNoExtraKeys!5450 lt!552738 lt!552742 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1850 (getCurrentListMapNoExtraKeys!5450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40193 0))(
  ( (Unit!40194) )
))
(declare-fun lt!552741 () Unit!40193)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1085 (array!78486 array!78484 (_ BitVec 32) (_ BitVec 32) V!46321 V!46321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40193)

(assert (=> b!1216379 (= lt!552741 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1085 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216380 () Bool)

(declare-fun tp_is_empty!30895 () Bool)

(assert (=> b!1216380 (= e!690580 tp_is_empty!30895)))

(declare-fun res!807736 () Bool)

(assert (=> start!101262 (=> (not res!807736) (not e!690579))))

(assert (=> start!101262 (= res!807736 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38416 _keys!1208))))))

(assert (=> start!101262 e!690579))

(assert (=> start!101262 tp_is_empty!30895))

(declare-fun array_inv!28954 (array!78486) Bool)

(assert (=> start!101262 (array_inv!28954 _keys!1208)))

(assert (=> start!101262 true))

(assert (=> start!101262 tp!91595))

(declare-fun e!690586 () Bool)

(declare-fun array_inv!28955 (array!78484) Bool)

(assert (=> start!101262 (and (array_inv!28955 _values!996) e!690586)))

(declare-fun b!1216381 () Bool)

(declare-fun res!807734 () Bool)

(declare-fun e!690581 () Bool)

(assert (=> b!1216381 (=> (not res!807734) (not e!690581))))

(declare-datatypes ((List!26800 0))(
  ( (Nil!26797) (Cons!26796 (h!28005 (_ BitVec 64)) (t!39962 List!26800)) )
))
(declare-fun arrayNoDuplicates!0 (array!78486 (_ BitVec 32) List!26800) Bool)

(assert (=> b!1216381 (= res!807734 (arrayNoDuplicates!0 lt!552738 #b00000000000000000000000000000000 Nil!26797))))

(declare-fun b!1216382 () Bool)

(declare-fun e!690585 () Bool)

(assert (=> b!1216382 (= e!690586 (and e!690585 mapRes!48217))))

(declare-fun condMapEmpty!48217 () Bool)

(declare-fun mapDefault!48217 () ValueCell!14738)

(assert (=> b!1216382 (= condMapEmpty!48217 (= (arr!37877 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14738)) mapDefault!48217)))))

(declare-fun b!1216383 () Bool)

(declare-fun res!807733 () Bool)

(assert (=> b!1216383 (=> (not res!807733) (not e!690579))))

(assert (=> b!1216383 (= res!807733 (= (select (arr!37878 _keys!1208) i!673) k0!934))))

(declare-fun b!1216384 () Bool)

(declare-fun res!807735 () Bool)

(assert (=> b!1216384 (=> (not res!807735) (not e!690579))))

(assert (=> b!1216384 (= res!807735 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26797))))

(declare-fun b!1216385 () Bool)

(declare-fun res!807738 () Bool)

(assert (=> b!1216385 (=> (not res!807738) (not e!690579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78486 (_ BitVec 32)) Bool)

(assert (=> b!1216385 (= res!807738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216386 () Bool)

(declare-fun res!807739 () Bool)

(assert (=> b!1216386 (=> (not res!807739) (not e!690579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216386 (= res!807739 (validMask!0 mask!1564))))

(declare-fun b!1216387 () Bool)

(declare-fun res!807732 () Bool)

(assert (=> b!1216387 (=> (not res!807732) (not e!690579))))

(assert (=> b!1216387 (= res!807732 (and (= (size!38415 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38416 _keys!1208) (size!38415 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216388 () Bool)

(assert (=> b!1216388 (= e!690579 e!690581)))

(declare-fun res!807731 () Bool)

(assert (=> b!1216388 (=> (not res!807731) (not e!690581))))

(assert (=> b!1216388 (= res!807731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552738 mask!1564))))

(assert (=> b!1216388 (= lt!552738 (array!78487 (store (arr!37878 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38416 _keys!1208)))))

(declare-fun b!1216389 () Bool)

(declare-fun res!807737 () Bool)

(assert (=> b!1216389 (=> (not res!807737) (not e!690579))))

(assert (=> b!1216389 (= res!807737 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38416 _keys!1208))))))

(declare-fun b!1216390 () Bool)

(declare-fun e!690582 () Bool)

(assert (=> b!1216390 (= e!690581 (not e!690582))))

(declare-fun res!807742 () Bool)

(assert (=> b!1216390 (=> res!807742 e!690582)))

(assert (=> b!1216390 (= res!807742 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216390 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552743 () Unit!40193)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78486 (_ BitVec 64) (_ BitVec 32)) Unit!40193)

(assert (=> b!1216390 (= lt!552743 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216391 () Bool)

(assert (=> b!1216391 (= e!690585 tp_is_empty!30895)))

(declare-fun b!1216392 () Bool)

(assert (=> b!1216392 (= e!690582 e!690584)))

(declare-fun res!807741 () Bool)

(assert (=> b!1216392 (=> res!807741 e!690584)))

(assert (=> b!1216392 (= res!807741 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!552740 () ListLongMap!17991)

(assert (=> b!1216392 (= lt!552740 (getCurrentListMapNoExtraKeys!5450 lt!552738 lt!552742 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3301 (Int (_ BitVec 64)) V!46321)

(assert (=> b!1216392 (= lt!552742 (array!78485 (store (arr!37877 _values!996) i!673 (ValueCellFull!14738 (dynLambda!3301 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38415 _values!996)))))

(declare-fun lt!552739 () ListLongMap!17991)

(assert (=> b!1216392 (= lt!552739 (getCurrentListMapNoExtraKeys!5450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101262 res!807736) b!1216386))

(assert (= (and b!1216386 res!807739) b!1216387))

(assert (= (and b!1216387 res!807732) b!1216385))

(assert (= (and b!1216385 res!807738) b!1216384))

(assert (= (and b!1216384 res!807735) b!1216389))

(assert (= (and b!1216389 res!807737) b!1216378))

(assert (= (and b!1216378 res!807740) b!1216383))

(assert (= (and b!1216383 res!807733) b!1216388))

(assert (= (and b!1216388 res!807731) b!1216381))

(assert (= (and b!1216381 res!807734) b!1216390))

(assert (= (and b!1216390 (not res!807742)) b!1216392))

(assert (= (and b!1216392 (not res!807741)) b!1216379))

(assert (= (and b!1216382 condMapEmpty!48217) mapIsEmpty!48217))

(assert (= (and b!1216382 (not condMapEmpty!48217)) mapNonEmpty!48217))

(get-info :version)

(assert (= (and mapNonEmpty!48217 ((_ is ValueCellFull!14738) mapValue!48217)) b!1216380))

(assert (= (and b!1216382 ((_ is ValueCellFull!14738) mapDefault!48217)) b!1216391))

(assert (= start!101262 b!1216382))

(declare-fun b_lambda!21857 () Bool)

(assert (=> (not b_lambda!21857) (not b!1216392)))

(declare-fun t!39960 () Bool)

(declare-fun tb!10983 () Bool)

(assert (=> (and start!101262 (= defaultEntry!1004 defaultEntry!1004) t!39960) tb!10983))

(declare-fun result!22571 () Bool)

(assert (=> tb!10983 (= result!22571 tp_is_empty!30895)))

(assert (=> b!1216392 t!39960))

(declare-fun b_and!43483 () Bool)

(assert (= b_and!43481 (and (=> t!39960 result!22571) b_and!43483)))

(declare-fun m!1120671 () Bool)

(assert (=> b!1216385 m!1120671))

(declare-fun m!1120673 () Bool)

(assert (=> mapNonEmpty!48217 m!1120673))

(declare-fun m!1120675 () Bool)

(assert (=> b!1216381 m!1120675))

(declare-fun m!1120677 () Bool)

(assert (=> b!1216378 m!1120677))

(declare-fun m!1120679 () Bool)

(assert (=> b!1216388 m!1120679))

(declare-fun m!1120681 () Bool)

(assert (=> b!1216388 m!1120681))

(declare-fun m!1120683 () Bool)

(assert (=> b!1216383 m!1120683))

(declare-fun m!1120685 () Bool)

(assert (=> b!1216384 m!1120685))

(declare-fun m!1120687 () Bool)

(assert (=> b!1216392 m!1120687))

(declare-fun m!1120689 () Bool)

(assert (=> b!1216392 m!1120689))

(declare-fun m!1120691 () Bool)

(assert (=> b!1216392 m!1120691))

(declare-fun m!1120693 () Bool)

(assert (=> b!1216392 m!1120693))

(declare-fun m!1120695 () Bool)

(assert (=> b!1216386 m!1120695))

(declare-fun m!1120697 () Bool)

(assert (=> b!1216390 m!1120697))

(declare-fun m!1120699 () Bool)

(assert (=> b!1216390 m!1120699))

(declare-fun m!1120701 () Bool)

(assert (=> start!101262 m!1120701))

(declare-fun m!1120703 () Bool)

(assert (=> start!101262 m!1120703))

(declare-fun m!1120705 () Bool)

(assert (=> b!1216379 m!1120705))

(declare-fun m!1120707 () Bool)

(assert (=> b!1216379 m!1120707))

(assert (=> b!1216379 m!1120707))

(declare-fun m!1120709 () Bool)

(assert (=> b!1216379 m!1120709))

(declare-fun m!1120711 () Bool)

(assert (=> b!1216379 m!1120711))

(check-sat (not b!1216385) b_and!43483 tp_is_empty!30895 (not b!1216392) (not b_lambda!21857) (not b!1216381) (not b!1216390) (not start!101262) (not b!1216379) (not b_next!26191) (not b!1216384) (not b!1216378) (not b!1216388) (not mapNonEmpty!48217) (not b!1216386))
(check-sat b_and!43483 (not b_next!26191))
