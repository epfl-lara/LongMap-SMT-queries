; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101248 () Bool)

(assert start!101248)

(declare-fun b_free!26011 () Bool)

(declare-fun b_next!26011 () Bool)

(assert (=> start!101248 (= b_free!26011 (not b_next!26011))))

(declare-fun tp!91049 () Bool)

(declare-fun b_and!43105 () Bool)

(assert (=> start!101248 (= tp!91049 b_and!43105)))

(declare-fun e!688153 () Bool)

(declare-datatypes ((array!78249 0))(
  ( (array!78250 (arr!37755 (Array (_ BitVec 32) (_ BitVec 64))) (size!38292 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78249)

(declare-fun b!1211501 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211501 (= e!688153 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211502 () Bool)

(declare-fun e!688157 () Bool)

(declare-datatypes ((V!46081 0))(
  ( (V!46082 (val!15414 Int)) )
))
(declare-datatypes ((tuple2!19808 0))(
  ( (tuple2!19809 (_1!9915 (_ BitVec 64)) (_2!9915 V!46081)) )
))
(declare-datatypes ((List!26613 0))(
  ( (Nil!26610) (Cons!26609 (h!27827 tuple2!19808) (t!39596 List!26613)) )
))
(declare-datatypes ((ListLongMap!17785 0))(
  ( (ListLongMap!17786 (toList!8908 List!26613)) )
))
(declare-fun call!59638 () ListLongMap!17785)

(declare-fun call!59640 () ListLongMap!17785)

(declare-fun -!1837 (ListLongMap!17785 (_ BitVec 64)) ListLongMap!17785)

(assert (=> b!1211502 (= e!688157 (= call!59640 (-!1837 call!59638 k0!934)))))

(declare-fun b!1211504 () Bool)

(declare-fun call!59639 () Bool)

(assert (=> b!1211504 call!59639))

(declare-datatypes ((Unit!40066 0))(
  ( (Unit!40067) )
))
(declare-fun lt!549923 () Unit!40066)

(declare-fun call!59642 () Unit!40066)

(assert (=> b!1211504 (= lt!549923 call!59642)))

(declare-fun e!688145 () Unit!40066)

(assert (=> b!1211504 (= e!688145 lt!549923)))

(declare-fun b!1211505 () Bool)

(declare-fun e!688146 () Bool)

(declare-fun e!688155 () Bool)

(assert (=> b!1211505 (= e!688146 e!688155)))

(declare-fun res!804716 () Bool)

(assert (=> b!1211505 (=> (not res!804716) (not e!688155))))

(declare-fun lt!549922 () array!78249)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78249 (_ BitVec 32)) Bool)

(assert (=> b!1211505 (= res!804716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549922 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211505 (= lt!549922 (array!78250 (store (arr!37755 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38292 _keys!1208)))))

(declare-fun b!1211506 () Bool)

(declare-fun e!688152 () Bool)

(assert (=> b!1211506 (= e!688152 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59635 () Bool)

(declare-fun call!59641 () Bool)

(assert (=> bm!59635 (= call!59639 call!59641)))

(declare-fun b!1211507 () Bool)

(declare-fun e!688151 () Unit!40066)

(declare-fun lt!549919 () Unit!40066)

(assert (=> b!1211507 (= e!688151 lt!549919)))

(assert (=> b!1211507 (= lt!549919 call!59642)))

(assert (=> b!1211507 call!59639))

(declare-fun b!1211508 () Bool)

(declare-fun res!804720 () Bool)

(assert (=> b!1211508 (=> (not res!804720) (not e!688146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211508 (= res!804720 (validKeyInArray!0 k0!934))))

(declare-fun b!1211509 () Bool)

(declare-fun res!804712 () Bool)

(assert (=> b!1211509 (=> (not res!804712) (not e!688146))))

(assert (=> b!1211509 (= res!804712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211510 () Bool)

(declare-fun call!59643 () ListLongMap!17785)

(declare-fun contains!7001 (ListLongMap!17785 (_ BitVec 64)) Bool)

(assert (=> b!1211510 (contains!7001 call!59643 k0!934)))

(declare-fun lt!549926 () ListLongMap!17785)

(declare-fun lt!549925 () Unit!40066)

(declare-fun minValue!944 () V!46081)

(declare-fun addStillContains!1052 (ListLongMap!17785 (_ BitVec 64) V!46081 (_ BitVec 64)) Unit!40066)

(assert (=> b!1211510 (= lt!549925 (addStillContains!1052 lt!549926 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1211510 call!59641))

(declare-fun lt!549917 () ListLongMap!17785)

(declare-fun zeroValue!944 () V!46081)

(declare-fun +!4069 (ListLongMap!17785 tuple2!19808) ListLongMap!17785)

(assert (=> b!1211510 (= lt!549926 (+!4069 lt!549917 (tuple2!19809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549916 () Unit!40066)

(declare-fun call!59644 () Unit!40066)

(assert (=> b!1211510 (= lt!549916 call!59644)))

(declare-fun e!688154 () Unit!40066)

(assert (=> b!1211510 (= e!688154 lt!549925)))

(declare-fun b!1211511 () Bool)

(assert (=> b!1211511 (= e!688157 (= call!59640 call!59638))))

(declare-fun mapIsEmpty!47941 () Bool)

(declare-fun mapRes!47941 () Bool)

(assert (=> mapIsEmpty!47941 mapRes!47941))

(declare-fun b!1211512 () Bool)

(declare-fun res!804714 () Bool)

(assert (=> b!1211512 (=> (not res!804714) (not e!688146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211512 (= res!804714 (validMask!0 mask!1564))))

(declare-fun b!1211513 () Bool)

(declare-fun e!688149 () Unit!40066)

(declare-fun Unit!40068 () Unit!40066)

(assert (=> b!1211513 (= e!688149 Unit!40068)))

(declare-fun lt!549930 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1211513 (= lt!549930 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119610 () Bool)

(assert (=> b!1211513 (= c!119610 (and (not lt!549930) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549924 () Unit!40066)

(assert (=> b!1211513 (= lt!549924 e!688154)))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14648 0))(
  ( (ValueCellFull!14648 (v!18061 V!46081)) (EmptyCell!14648) )
))
(declare-datatypes ((array!78251 0))(
  ( (array!78252 (arr!37756 (Array (_ BitVec 32) ValueCell!14648)) (size!38293 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78251)

(declare-fun lt!549914 () Unit!40066)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!601 (array!78249 array!78251 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 64) (_ BitVec 32) Int) Unit!40066)

(assert (=> b!1211513 (= lt!549914 (lemmaListMapContainsThenArrayContainsFrom!601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119609 () Bool)

(assert (=> b!1211513 (= c!119609 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804710 () Bool)

(assert (=> b!1211513 (= res!804710 e!688152)))

(assert (=> b!1211513 (=> (not res!804710) (not e!688153))))

(assert (=> b!1211513 e!688153))

(declare-fun lt!549921 () Unit!40066)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78249 (_ BitVec 32) (_ BitVec 32)) Unit!40066)

(assert (=> b!1211513 (= lt!549921 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26614 0))(
  ( (Nil!26611) (Cons!26610 (h!27828 (_ BitVec 64)) (t!39597 List!26614)) )
))
(declare-fun arrayNoDuplicates!0 (array!78249 (_ BitVec 32) List!26614) Bool)

(assert (=> b!1211513 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26611)))

(declare-fun lt!549920 () Unit!40066)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78249 (_ BitVec 64) (_ BitVec 32) List!26614) Unit!40066)

(assert (=> b!1211513 (= lt!549920 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26611))))

(assert (=> b!1211513 false))

(declare-fun b!1211503 () Bool)

(declare-fun res!804718 () Bool)

(assert (=> b!1211503 (=> (not res!804718) (not e!688146))))

(assert (=> b!1211503 (= res!804718 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38292 _keys!1208))))))

(declare-fun res!804715 () Bool)

(assert (=> start!101248 (=> (not res!804715) (not e!688146))))

(assert (=> start!101248 (= res!804715 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38292 _keys!1208))))))

(assert (=> start!101248 e!688146))

(declare-fun tp_is_empty!30715 () Bool)

(assert (=> start!101248 tp_is_empty!30715))

(declare-fun array_inv!28820 (array!78249) Bool)

(assert (=> start!101248 (array_inv!28820 _keys!1208)))

(assert (=> start!101248 true))

(assert (=> start!101248 tp!91049))

(declare-fun e!688142 () Bool)

(declare-fun array_inv!28821 (array!78251) Bool)

(assert (=> start!101248 (and (array_inv!28821 _values!996) e!688142)))

(declare-fun bm!59636 () Bool)

(declare-fun c!119614 () Bool)

(assert (=> bm!59636 (= call!59643 (+!4069 (ite c!119610 lt!549926 lt!549917) (ite c!119610 (tuple2!19809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119614 (tuple2!19809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1211514 () Bool)

(declare-fun res!804717 () Bool)

(assert (=> b!1211514 (=> (not res!804717) (not e!688146))))

(assert (=> b!1211514 (= res!804717 (= (select (arr!37755 _keys!1208) i!673) k0!934))))

(declare-fun bm!59637 () Bool)

(declare-fun call!59645 () ListLongMap!17785)

(assert (=> bm!59637 (= call!59645 call!59643)))

(declare-fun bm!59638 () Bool)

(assert (=> bm!59638 (= call!59644 (addStillContains!1052 lt!549917 (ite (or c!119610 c!119614) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119610 c!119614) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1211515 () Bool)

(declare-fun e!688150 () Bool)

(assert (=> b!1211515 (= e!688150 tp_is_empty!30715)))

(declare-fun b!1211516 () Bool)

(declare-fun e!688148 () Bool)

(assert (=> b!1211516 (= e!688155 (not e!688148))))

(declare-fun res!804722 () Bool)

(assert (=> b!1211516 (=> res!804722 e!688148)))

(assert (=> b!1211516 (= res!804722 (bvsgt from!1455 i!673))))

(assert (=> b!1211516 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549929 () Unit!40066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78249 (_ BitVec 64) (_ BitVec 32)) Unit!40066)

(assert (=> b!1211516 (= lt!549929 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1211517 () Bool)

(declare-fun e!688156 () Bool)

(assert (=> b!1211517 (= e!688148 e!688156)))

(declare-fun res!804713 () Bool)

(assert (=> b!1211517 (=> res!804713 e!688156)))

(assert (=> b!1211517 (= res!804713 (not (= from!1455 i!673)))))

(declare-fun lt!549927 () ListLongMap!17785)

(declare-fun lt!549918 () array!78251)

(declare-fun getCurrentListMapNoExtraKeys!5368 (array!78249 array!78251 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 32) Int) ListLongMap!17785)

(assert (=> b!1211517 (= lt!549927 (getCurrentListMapNoExtraKeys!5368 lt!549922 lt!549918 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3285 (Int (_ BitVec 64)) V!46081)

(assert (=> b!1211517 (= lt!549918 (array!78252 (store (arr!37756 _values!996) i!673 (ValueCellFull!14648 (dynLambda!3285 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38293 _values!996)))))

(declare-fun lt!549928 () ListLongMap!17785)

(assert (=> b!1211517 (= lt!549928 (getCurrentListMapNoExtraKeys!5368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1211518 () Bool)

(assert (=> b!1211518 (= e!688142 (and e!688150 mapRes!47941))))

(declare-fun condMapEmpty!47941 () Bool)

(declare-fun mapDefault!47941 () ValueCell!14648)

(assert (=> b!1211518 (= condMapEmpty!47941 (= (arr!37756 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14648)) mapDefault!47941)))))

(declare-fun bm!59639 () Bool)

(assert (=> bm!59639 (= call!59642 call!59644)))

(declare-fun b!1211519 () Bool)

(declare-fun res!804709 () Bool)

(assert (=> b!1211519 (=> (not res!804709) (not e!688146))))

(assert (=> b!1211519 (= res!804709 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26611))))

(declare-fun bm!59640 () Bool)

(assert (=> bm!59640 (= call!59641 (contains!7001 (ite c!119610 lt!549926 call!59645) k0!934))))

(declare-fun b!1211520 () Bool)

(declare-fun e!688144 () Bool)

(assert (=> b!1211520 (= e!688144 tp_is_empty!30715)))

(declare-fun b!1211521 () Bool)

(assert (=> b!1211521 (= e!688152 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549930) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211522 () Bool)

(declare-fun e!688147 () Bool)

(assert (=> b!1211522 (= e!688147 (bvslt from!1455 (size!38293 _values!996)))))

(declare-fun lt!549931 () Unit!40066)

(assert (=> b!1211522 (= lt!549931 e!688149)))

(declare-fun c!119611 () Bool)

(assert (=> b!1211522 (= c!119611 (contains!7001 lt!549917 k0!934))))

(assert (=> b!1211522 (= lt!549917 (getCurrentListMapNoExtraKeys!5368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211523 () Bool)

(declare-fun res!804721 () Bool)

(assert (=> b!1211523 (=> (not res!804721) (not e!688146))))

(assert (=> b!1211523 (= res!804721 (and (= (size!38293 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38292 _keys!1208) (size!38293 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211524 () Bool)

(assert (=> b!1211524 (= e!688156 e!688147)))

(declare-fun res!804711 () Bool)

(assert (=> b!1211524 (=> res!804711 e!688147)))

(assert (=> b!1211524 (= res!804711 (not (= (select (arr!37755 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1211524 e!688157))

(declare-fun c!119612 () Bool)

(assert (=> b!1211524 (= c!119612 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549915 () Unit!40066)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1053 (array!78249 array!78251 (_ BitVec 32) (_ BitVec 32) V!46081 V!46081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40066)

(assert (=> b!1211524 (= lt!549915 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1053 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211525 () Bool)

(declare-fun Unit!40069 () Unit!40066)

(assert (=> b!1211525 (= e!688149 Unit!40069)))

(declare-fun bm!59641 () Bool)

(assert (=> bm!59641 (= call!59640 (getCurrentListMapNoExtraKeys!5368 lt!549922 lt!549918 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59642 () Bool)

(assert (=> bm!59642 (= call!59638 (getCurrentListMapNoExtraKeys!5368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211526 () Bool)

(declare-fun res!804719 () Bool)

(assert (=> b!1211526 (=> (not res!804719) (not e!688155))))

(assert (=> b!1211526 (= res!804719 (arrayNoDuplicates!0 lt!549922 #b00000000000000000000000000000000 Nil!26611))))

(declare-fun b!1211527 () Bool)

(assert (=> b!1211527 (= e!688151 e!688145)))

(declare-fun c!119613 () Bool)

(assert (=> b!1211527 (= c!119613 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549930))))

(declare-fun mapNonEmpty!47941 () Bool)

(declare-fun tp!91048 () Bool)

(assert (=> mapNonEmpty!47941 (= mapRes!47941 (and tp!91048 e!688144))))

(declare-fun mapValue!47941 () ValueCell!14648)

(declare-fun mapRest!47941 () (Array (_ BitVec 32) ValueCell!14648))

(declare-fun mapKey!47941 () (_ BitVec 32))

(assert (=> mapNonEmpty!47941 (= (arr!37756 _values!996) (store mapRest!47941 mapKey!47941 mapValue!47941))))

(declare-fun b!1211528 () Bool)

(declare-fun Unit!40070 () Unit!40066)

(assert (=> b!1211528 (= e!688145 Unit!40070)))

(declare-fun b!1211529 () Bool)

(assert (=> b!1211529 (= c!119614 (and (not lt!549930) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1211529 (= e!688154 e!688151)))

(assert (= (and start!101248 res!804715) b!1211512))

(assert (= (and b!1211512 res!804714) b!1211523))

(assert (= (and b!1211523 res!804721) b!1211509))

(assert (= (and b!1211509 res!804712) b!1211519))

(assert (= (and b!1211519 res!804709) b!1211503))

(assert (= (and b!1211503 res!804718) b!1211508))

(assert (= (and b!1211508 res!804720) b!1211514))

(assert (= (and b!1211514 res!804717) b!1211505))

(assert (= (and b!1211505 res!804716) b!1211526))

(assert (= (and b!1211526 res!804719) b!1211516))

(assert (= (and b!1211516 (not res!804722)) b!1211517))

(assert (= (and b!1211517 (not res!804713)) b!1211524))

(assert (= (and b!1211524 c!119612) b!1211502))

(assert (= (and b!1211524 (not c!119612)) b!1211511))

(assert (= (or b!1211502 b!1211511) bm!59641))

(assert (= (or b!1211502 b!1211511) bm!59642))

(assert (= (and b!1211524 (not res!804711)) b!1211522))

(assert (= (and b!1211522 c!119611) b!1211513))

(assert (= (and b!1211522 (not c!119611)) b!1211525))

(assert (= (and b!1211513 c!119610) b!1211510))

(assert (= (and b!1211513 (not c!119610)) b!1211529))

(assert (= (and b!1211529 c!119614) b!1211507))

(assert (= (and b!1211529 (not c!119614)) b!1211527))

(assert (= (and b!1211527 c!119613) b!1211504))

(assert (= (and b!1211527 (not c!119613)) b!1211528))

(assert (= (or b!1211507 b!1211504) bm!59639))

(assert (= (or b!1211507 b!1211504) bm!59637))

(assert (= (or b!1211507 b!1211504) bm!59635))

(assert (= (or b!1211510 bm!59635) bm!59640))

(assert (= (or b!1211510 bm!59639) bm!59638))

(assert (= (or b!1211510 bm!59637) bm!59636))

(assert (= (and b!1211513 c!119609) b!1211506))

(assert (= (and b!1211513 (not c!119609)) b!1211521))

(assert (= (and b!1211513 res!804710) b!1211501))

(assert (= (and b!1211518 condMapEmpty!47941) mapIsEmpty!47941))

(assert (= (and b!1211518 (not condMapEmpty!47941)) mapNonEmpty!47941))

(get-info :version)

(assert (= (and mapNonEmpty!47941 ((_ is ValueCellFull!14648) mapValue!47941)) b!1211520))

(assert (= (and b!1211518 ((_ is ValueCellFull!14648) mapDefault!47941)) b!1211515))

(assert (= start!101248 b!1211518))

(declare-fun b_lambda!21605 () Bool)

(assert (=> (not b_lambda!21605) (not b!1211517)))

(declare-fun t!39595 () Bool)

(declare-fun tb!10803 () Bool)

(assert (=> (and start!101248 (= defaultEntry!1004 defaultEntry!1004) t!39595) tb!10803))

(declare-fun result!22207 () Bool)

(assert (=> tb!10803 (= result!22207 tp_is_empty!30715)))

(assert (=> b!1211517 t!39595))

(declare-fun b_and!43107 () Bool)

(assert (= b_and!43105 (and (=> t!39595 result!22207) b_and!43107)))

(declare-fun m!1117341 () Bool)

(assert (=> b!1211501 m!1117341))

(declare-fun m!1117343 () Bool)

(assert (=> b!1211526 m!1117343))

(declare-fun m!1117345 () Bool)

(assert (=> b!1211522 m!1117345))

(declare-fun m!1117347 () Bool)

(assert (=> b!1211522 m!1117347))

(declare-fun m!1117349 () Bool)

(assert (=> bm!59636 m!1117349))

(declare-fun m!1117351 () Bool)

(assert (=> bm!59640 m!1117351))

(declare-fun m!1117353 () Bool)

(assert (=> start!101248 m!1117353))

(declare-fun m!1117355 () Bool)

(assert (=> start!101248 m!1117355))

(declare-fun m!1117357 () Bool)

(assert (=> b!1211502 m!1117357))

(declare-fun m!1117359 () Bool)

(assert (=> b!1211524 m!1117359))

(declare-fun m!1117361 () Bool)

(assert (=> b!1211524 m!1117361))

(declare-fun m!1117363 () Bool)

(assert (=> bm!59638 m!1117363))

(declare-fun m!1117365 () Bool)

(assert (=> b!1211513 m!1117365))

(declare-fun m!1117367 () Bool)

(assert (=> b!1211513 m!1117367))

(declare-fun m!1117369 () Bool)

(assert (=> b!1211513 m!1117369))

(declare-fun m!1117371 () Bool)

(assert (=> b!1211513 m!1117371))

(declare-fun m!1117373 () Bool)

(assert (=> b!1211510 m!1117373))

(declare-fun m!1117375 () Bool)

(assert (=> b!1211510 m!1117375))

(declare-fun m!1117377 () Bool)

(assert (=> b!1211510 m!1117377))

(declare-fun m!1117379 () Bool)

(assert (=> b!1211514 m!1117379))

(assert (=> bm!59642 m!1117347))

(declare-fun m!1117381 () Bool)

(assert (=> b!1211512 m!1117381))

(declare-fun m!1117383 () Bool)

(assert (=> b!1211516 m!1117383))

(declare-fun m!1117385 () Bool)

(assert (=> b!1211516 m!1117385))

(declare-fun m!1117387 () Bool)

(assert (=> bm!59641 m!1117387))

(declare-fun m!1117389 () Bool)

(assert (=> b!1211519 m!1117389))

(declare-fun m!1117391 () Bool)

(assert (=> b!1211508 m!1117391))

(assert (=> b!1211506 m!1117341))

(declare-fun m!1117393 () Bool)

(assert (=> b!1211509 m!1117393))

(declare-fun m!1117395 () Bool)

(assert (=> b!1211505 m!1117395))

(declare-fun m!1117397 () Bool)

(assert (=> b!1211505 m!1117397))

(declare-fun m!1117399 () Bool)

(assert (=> mapNonEmpty!47941 m!1117399))

(declare-fun m!1117401 () Bool)

(assert (=> b!1211517 m!1117401))

(declare-fun m!1117403 () Bool)

(assert (=> b!1211517 m!1117403))

(declare-fun m!1117405 () Bool)

(assert (=> b!1211517 m!1117405))

(declare-fun m!1117407 () Bool)

(assert (=> b!1211517 m!1117407))

(check-sat (not b!1211509) (not b!1211526) (not b_next!26011) (not bm!59636) (not start!101248) (not b!1211501) (not b!1211508) (not b!1211512) b_and!43107 (not mapNonEmpty!47941) (not b!1211524) (not b!1211505) (not bm!59638) (not bm!59640) tp_is_empty!30715 (not b!1211513) (not b!1211506) (not b!1211519) (not b!1211516) (not b!1211502) (not b!1211517) (not b_lambda!21605) (not b!1211510) (not bm!59641) (not bm!59642) (not b!1211522))
(check-sat b_and!43107 (not b_next!26011))
