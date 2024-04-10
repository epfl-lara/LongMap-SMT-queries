; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99860 () Bool)

(assert start!99860)

(declare-fun b_free!25439 () Bool)

(declare-fun b_next!25439 () Bool)

(assert (=> start!99860 (= b_free!25439 (not b_next!25439))))

(declare-fun tp!89030 () Bool)

(declare-fun b_and!41745 () Bool)

(assert (=> start!99860 (= tp!89030 b_and!41745)))

(declare-fun b!1187895 () Bool)

(declare-datatypes ((array!76733 0))(
  ( (array!76734 (arr!37016 (Array (_ BitVec 32) (_ BitVec 64))) (size!37552 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76733)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!675435 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!76733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187895 (= e!675435 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun res!789781 () Bool)

(declare-fun e!675437 () Bool)

(assert (=> start!99860 (=> (not res!789781) (not e!675437))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99860 (= res!789781 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37552 _keys!1208))))))

(assert (=> start!99860 e!675437))

(declare-fun tp_is_empty!29969 () Bool)

(assert (=> start!99860 tp_is_empty!29969))

(declare-fun array_inv!28240 (array!76733) Bool)

(assert (=> start!99860 (array_inv!28240 _keys!1208)))

(assert (=> start!99860 true))

(assert (=> start!99860 tp!89030))

(declare-datatypes ((V!45085 0))(
  ( (V!45086 (val!15041 Int)) )
))
(declare-datatypes ((ValueCell!14275 0))(
  ( (ValueCellFull!14275 (v!17679 V!45085)) (EmptyCell!14275) )
))
(declare-datatypes ((array!76735 0))(
  ( (array!76736 (arr!37017 (Array (_ BitVec 32) ValueCell!14275)) (size!37553 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76735)

(declare-fun e!675436 () Bool)

(declare-fun array_inv!28241 (array!76735) Bool)

(assert (=> start!99860 (and (array_inv!28241 _values!996) e!675436)))

(declare-fun b!1187896 () Bool)

(declare-fun e!675432 () Bool)

(assert (=> b!1187896 (= e!675437 e!675432)))

(declare-fun res!789779 () Bool)

(assert (=> b!1187896 (=> (not res!789779) (not e!675432))))

(declare-fun lt!540275 () array!76733)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76733 (_ BitVec 32)) Bool)

(assert (=> b!1187896 (= res!789779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540275 mask!1564))))

(assert (=> b!1187896 (= lt!540275 (array!76734 (store (arr!37016 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37552 _keys!1208)))))

(declare-fun b!1187897 () Bool)

(declare-fun e!675438 () Bool)

(declare-fun e!675431 () Bool)

(assert (=> b!1187897 (= e!675438 e!675431)))

(declare-fun res!789782 () Bool)

(assert (=> b!1187897 (=> res!789782 e!675431)))

(assert (=> b!1187897 (= res!789782 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19312 0))(
  ( (tuple2!19313 (_1!9667 (_ BitVec 64)) (_2!9667 V!45085)) )
))
(declare-datatypes ((List!26052 0))(
  ( (Nil!26049) (Cons!26048 (h!27257 tuple2!19312) (t!38483 List!26052)) )
))
(declare-datatypes ((ListLongMap!17281 0))(
  ( (ListLongMap!17282 (toList!8656 List!26052)) )
))
(declare-fun lt!540274 () ListLongMap!17281)

(declare-fun minValue!944 () V!45085)

(declare-fun zeroValue!944 () V!45085)

(declare-fun lt!540266 () array!76735)

(declare-fun getCurrentListMapNoExtraKeys!5097 (array!76733 array!76735 (_ BitVec 32) (_ BitVec 32) V!45085 V!45085 (_ BitVec 32) Int) ListLongMap!17281)

(assert (=> b!1187897 (= lt!540274 (getCurrentListMapNoExtraKeys!5097 lt!540275 lt!540266 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!540268 () V!45085)

(assert (=> b!1187897 (= lt!540266 (array!76736 (store (arr!37017 _values!996) i!673 (ValueCellFull!14275 lt!540268)) (size!37553 _values!996)))))

(declare-fun dynLambda!3043 (Int (_ BitVec 64)) V!45085)

(assert (=> b!1187897 (= lt!540268 (dynLambda!3043 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!540279 () ListLongMap!17281)

(assert (=> b!1187897 (= lt!540279 (getCurrentListMapNoExtraKeys!5097 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187898 () Bool)

(declare-datatypes ((Unit!39402 0))(
  ( (Unit!39403) )
))
(declare-fun e!675434 () Unit!39402)

(declare-fun Unit!39404 () Unit!39402)

(assert (=> b!1187898 (= e!675434 Unit!39404)))

(declare-fun b!1187899 () Bool)

(declare-fun e!675441 () Bool)

(assert (=> b!1187899 (= e!675441 tp_is_empty!29969)))

(declare-fun b!1187900 () Bool)

(declare-fun res!789783 () Bool)

(assert (=> b!1187900 (=> (not res!789783) (not e!675437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187900 (= res!789783 (validMask!0 mask!1564))))

(declare-fun b!1187901 () Bool)

(declare-fun res!789786 () Bool)

(assert (=> b!1187901 (=> (not res!789786) (not e!675437))))

(assert (=> b!1187901 (= res!789786 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37552 _keys!1208))))))

(declare-fun b!1187902 () Bool)

(declare-fun res!789791 () Bool)

(assert (=> b!1187902 (=> (not res!789791) (not e!675437))))

(declare-datatypes ((List!26053 0))(
  ( (Nil!26050) (Cons!26049 (h!27258 (_ BitVec 64)) (t!38484 List!26053)) )
))
(declare-fun arrayNoDuplicates!0 (array!76733 (_ BitVec 32) List!26053) Bool)

(assert (=> b!1187902 (= res!789791 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26050))))

(declare-fun mapIsEmpty!46781 () Bool)

(declare-fun mapRes!46781 () Bool)

(assert (=> mapIsEmpty!46781 mapRes!46781))

(declare-fun b!1187903 () Bool)

(declare-fun res!789790 () Bool)

(assert (=> b!1187903 (=> (not res!789790) (not e!675432))))

(assert (=> b!1187903 (= res!789790 (arrayNoDuplicates!0 lt!540275 #b00000000000000000000000000000000 Nil!26050))))

(declare-fun b!1187904 () Bool)

(declare-fun res!789787 () Bool)

(assert (=> b!1187904 (=> (not res!789787) (not e!675437))))

(assert (=> b!1187904 (= res!789787 (and (= (size!37553 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37552 _keys!1208) (size!37553 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46781 () Bool)

(declare-fun tp!89031 () Bool)

(declare-fun e!675442 () Bool)

(assert (=> mapNonEmpty!46781 (= mapRes!46781 (and tp!89031 e!675442))))

(declare-fun mapValue!46781 () ValueCell!14275)

(declare-fun mapRest!46781 () (Array (_ BitVec 32) ValueCell!14275))

(declare-fun mapKey!46781 () (_ BitVec 32))

(assert (=> mapNonEmpty!46781 (= (arr!37017 _values!996) (store mapRest!46781 mapKey!46781 mapValue!46781))))

(declare-fun b!1187905 () Bool)

(declare-fun res!789788 () Bool)

(assert (=> b!1187905 (=> (not res!789788) (not e!675437))))

(assert (=> b!1187905 (= res!789788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187906 () Bool)

(assert (=> b!1187906 (= e!675436 (and e!675441 mapRes!46781))))

(declare-fun condMapEmpty!46781 () Bool)

(declare-fun mapDefault!46781 () ValueCell!14275)

