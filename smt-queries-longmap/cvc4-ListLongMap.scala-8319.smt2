; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101266 () Bool)

(assert start!101266)

(declare-fun b_free!26189 () Bool)

(declare-fun b_next!26189 () Bool)

(assert (=> start!101266 (= b_free!26189 (not b_next!26189))))

(declare-fun tp!91588 () Bool)

(declare-fun b_and!43495 () Bool)

(assert (=> start!101266 (= tp!91588 b_and!43495)))

(declare-fun b!1216440 () Bool)

(declare-fun res!807763 () Bool)

(declare-fun e!690624 () Bool)

(assert (=> b!1216440 (=> (not res!807763) (not e!690624))))

(declare-datatypes ((array!78559 0))(
  ( (array!78560 (arr!37914 (Array (_ BitVec 32) (_ BitVec 64))) (size!38450 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78559)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46317 0))(
  ( (V!46318 (val!15503 Int)) )
))
(declare-datatypes ((ValueCell!14737 0))(
  ( (ValueCellFull!14737 (v!18156 V!46317)) (EmptyCell!14737) )
))
(declare-datatypes ((array!78561 0))(
  ( (array!78562 (arr!37915 (Array (_ BitVec 32) ValueCell!14737)) (size!38451 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78561)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1216440 (= res!807763 (and (= (size!38451 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38450 _keys!1208) (size!38451 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216441 () Bool)

(declare-fun res!807762 () Bool)

(assert (=> b!1216441 (=> (not res!807762) (not e!690624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216441 (= res!807762 (validMask!0 mask!1564))))

(declare-fun b!1216442 () Bool)

(declare-fun e!690626 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1216442 (= e!690626 (bvslt from!1455 (size!38450 _keys!1208)))))

(declare-fun zeroValue!944 () V!46317)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!552904 () array!78561)

(declare-fun minValue!944 () V!46317)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!552901 () array!78559)

(declare-datatypes ((tuple2!19924 0))(
  ( (tuple2!19925 (_1!9973 (_ BitVec 64)) (_2!9973 V!46317)) )
))
(declare-datatypes ((List!26729 0))(
  ( (Nil!26726) (Cons!26725 (h!27934 tuple2!19924) (t!39898 List!26729)) )
))
(declare-datatypes ((ListLongMap!17893 0))(
  ( (ListLongMap!17894 (toList!8962 List!26729)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5389 (array!78559 array!78561 (_ BitVec 32) (_ BitVec 32) V!46317 V!46317 (_ BitVec 32) Int) ListLongMap!17893)

(declare-fun -!1881 (ListLongMap!17893 (_ BitVec 64)) ListLongMap!17893)

(assert (=> b!1216442 (= (getCurrentListMapNoExtraKeys!5389 lt!552901 lt!552904 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1881 (getCurrentListMapNoExtraKeys!5389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40332 0))(
  ( (Unit!40333) )
))
(declare-fun lt!552906 () Unit!40332)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1088 (array!78559 array!78561 (_ BitVec 32) (_ BitVec 32) V!46317 V!46317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40332)

(assert (=> b!1216442 (= lt!552906 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1088 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216443 () Bool)

(declare-fun res!807759 () Bool)

(assert (=> b!1216443 (=> (not res!807759) (not e!690624))))

(declare-datatypes ((List!26730 0))(
  ( (Nil!26727) (Cons!26726 (h!27935 (_ BitVec 64)) (t!39899 List!26730)) )
))
(declare-fun arrayNoDuplicates!0 (array!78559 (_ BitVec 32) List!26730) Bool)

(assert (=> b!1216443 (= res!807759 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26727))))

(declare-fun b!1216444 () Bool)

(declare-fun e!690625 () Bool)

(declare-fun e!690629 () Bool)

(assert (=> b!1216444 (= e!690625 (not e!690629))))

(declare-fun res!807760 () Bool)

(assert (=> b!1216444 (=> res!807760 e!690629)))

(assert (=> b!1216444 (= res!807760 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216444 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!552902 () Unit!40332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78559 (_ BitVec 64) (_ BitVec 32)) Unit!40332)

(assert (=> b!1216444 (= lt!552902 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1216445 () Bool)

(declare-fun res!807767 () Bool)

(assert (=> b!1216445 (=> (not res!807767) (not e!690625))))

(assert (=> b!1216445 (= res!807767 (arrayNoDuplicates!0 lt!552901 #b00000000000000000000000000000000 Nil!26727))))

(declare-fun b!1216446 () Bool)

(assert (=> b!1216446 (= e!690629 e!690626)))

(declare-fun res!807757 () Bool)

(assert (=> b!1216446 (=> res!807757 e!690626)))

(assert (=> b!1216446 (= res!807757 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!552905 () ListLongMap!17893)

(assert (=> b!1216446 (= lt!552905 (getCurrentListMapNoExtraKeys!5389 lt!552901 lt!552904 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3278 (Int (_ BitVec 64)) V!46317)

(assert (=> b!1216446 (= lt!552904 (array!78562 (store (arr!37915 _values!996) i!673 (ValueCellFull!14737 (dynLambda!3278 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38451 _values!996)))))

(declare-fun lt!552903 () ListLongMap!17893)

(assert (=> b!1216446 (= lt!552903 (getCurrentListMapNoExtraKeys!5389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216447 () Bool)

(declare-fun e!690630 () Bool)

(declare-fun tp_is_empty!30893 () Bool)

(assert (=> b!1216447 (= e!690630 tp_is_empty!30893)))

(declare-fun b!1216449 () Bool)

(declare-fun res!807758 () Bool)

(assert (=> b!1216449 (=> (not res!807758) (not e!690624))))

(assert (=> b!1216449 (= res!807758 (= (select (arr!37914 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!48214 () Bool)

(declare-fun mapRes!48214 () Bool)

(declare-fun tp!91589 () Bool)

(assert (=> mapNonEmpty!48214 (= mapRes!48214 (and tp!91589 e!690630))))

(declare-fun mapValue!48214 () ValueCell!14737)

(declare-fun mapRest!48214 () (Array (_ BitVec 32) ValueCell!14737))

(declare-fun mapKey!48214 () (_ BitVec 32))

(assert (=> mapNonEmpty!48214 (= (arr!37915 _values!996) (store mapRest!48214 mapKey!48214 mapValue!48214))))

(declare-fun b!1216450 () Bool)

(declare-fun res!807764 () Bool)

(assert (=> b!1216450 (=> (not res!807764) (not e!690624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216450 (= res!807764 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!48214 () Bool)

(assert (=> mapIsEmpty!48214 mapRes!48214))

(declare-fun b!1216448 () Bool)

(assert (=> b!1216448 (= e!690624 e!690625)))

(declare-fun res!807761 () Bool)

(assert (=> b!1216448 (=> (not res!807761) (not e!690625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78559 (_ BitVec 32)) Bool)

(assert (=> b!1216448 (= res!807761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552901 mask!1564))))

(assert (=> b!1216448 (= lt!552901 (array!78560 (store (arr!37914 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38450 _keys!1208)))))

(declare-fun res!807766 () Bool)

(assert (=> start!101266 (=> (not res!807766) (not e!690624))))

(assert (=> start!101266 (= res!807766 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38450 _keys!1208))))))

(assert (=> start!101266 e!690624))

(assert (=> start!101266 tp_is_empty!30893))

(declare-fun array_inv!28866 (array!78559) Bool)

(assert (=> start!101266 (array_inv!28866 _keys!1208)))

(assert (=> start!101266 true))

(assert (=> start!101266 tp!91588))

(declare-fun e!690631 () Bool)

(declare-fun array_inv!28867 (array!78561) Bool)

(assert (=> start!101266 (and (array_inv!28867 _values!996) e!690631)))

(declare-fun b!1216451 () Bool)

(declare-fun res!807756 () Bool)

(assert (=> b!1216451 (=> (not res!807756) (not e!690624))))

(assert (=> b!1216451 (= res!807756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216452 () Bool)

(declare-fun e!690628 () Bool)

(assert (=> b!1216452 (= e!690628 tp_is_empty!30893)))

(declare-fun b!1216453 () Bool)

(assert (=> b!1216453 (= e!690631 (and e!690628 mapRes!48214))))

(declare-fun condMapEmpty!48214 () Bool)

(declare-fun mapDefault!48214 () ValueCell!14737)

