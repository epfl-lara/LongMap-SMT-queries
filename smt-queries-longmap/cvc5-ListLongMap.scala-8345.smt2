; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101620 () Bool)

(assert start!101620)

(declare-fun b_free!26341 () Bool)

(declare-fun b_next!26341 () Bool)

(assert (=> start!101620 (= b_free!26341 (not b_next!26341))))

(declare-fun tp!92066 () Bool)

(declare-fun b_and!43925 () Bool)

(assert (=> start!101620 (= tp!92066 b_and!43925)))

(declare-fun b!1221775 () Bool)

(declare-fun res!811678 () Bool)

(declare-fun e!693856 () Bool)

(assert (=> b!1221775 (=> (not res!811678) (not e!693856))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221775 (= res!811678 (validKeyInArray!0 k!934))))

(declare-fun b!1221776 () Bool)

(declare-fun e!693854 () Bool)

(declare-fun tp_is_empty!31045 () Bool)

(assert (=> b!1221776 (= e!693854 tp_is_empty!31045)))

(declare-fun b!1221777 () Bool)

(declare-fun e!693855 () Bool)

(assert (=> b!1221777 (= e!693855 true)))

(declare-fun lt!555764 () Bool)

(declare-datatypes ((List!26862 0))(
  ( (Nil!26859) (Cons!26858 (h!28067 (_ BitVec 64)) (t!40183 List!26862)) )
))
(declare-fun contains!7028 (List!26862 (_ BitVec 64)) Bool)

(assert (=> b!1221777 (= lt!555764 (contains!7028 Nil!26859 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!811666 () Bool)

(assert (=> start!101620 (=> (not res!811666) (not e!693856))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78873 0))(
  ( (array!78874 (arr!38064 (Array (_ BitVec 32) (_ BitVec 64))) (size!38600 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78873)

(assert (=> start!101620 (= res!811666 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38600 _keys!1208))))))

(assert (=> start!101620 e!693856))

(assert (=> start!101620 tp_is_empty!31045))

(declare-fun array_inv!28960 (array!78873) Bool)

(assert (=> start!101620 (array_inv!28960 _keys!1208)))

(assert (=> start!101620 true))

(assert (=> start!101620 tp!92066))

(declare-datatypes ((V!46521 0))(
  ( (V!46522 (val!15579 Int)) )
))
(declare-datatypes ((ValueCell!14813 0))(
  ( (ValueCellFull!14813 (v!18240 V!46521)) (EmptyCell!14813) )
))
(declare-datatypes ((array!78875 0))(
  ( (array!78876 (arr!38065 (Array (_ BitVec 32) ValueCell!14813)) (size!38601 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78875)

(declare-fun e!693859 () Bool)

(declare-fun array_inv!28961 (array!78875) Bool)

(assert (=> start!101620 (and (array_inv!28961 _values!996) e!693859)))

(declare-fun b!1221778 () Bool)

(declare-fun e!693857 () Bool)

(assert (=> b!1221778 (= e!693856 e!693857)))

(declare-fun res!811675 () Bool)

(assert (=> b!1221778 (=> (not res!811675) (not e!693857))))

(declare-fun lt!555767 () array!78873)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78873 (_ BitVec 32)) Bool)

(assert (=> b!1221778 (= res!811675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555767 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1221778 (= lt!555767 (array!78874 (store (arr!38064 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38600 _keys!1208)))))

(declare-fun b!1221779 () Bool)

(declare-fun e!693858 () Bool)

(declare-fun e!693860 () Bool)

(assert (=> b!1221779 (= e!693858 e!693860)))

(declare-fun res!811671 () Bool)

(assert (=> b!1221779 (=> res!811671 e!693860)))

(assert (=> b!1221779 (= res!811671 (not (validKeyInArray!0 (select (arr!38064 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20062 0))(
  ( (tuple2!20063 (_1!10042 (_ BitVec 64)) (_2!10042 V!46521)) )
))
(declare-datatypes ((List!26863 0))(
  ( (Nil!26860) (Cons!26859 (h!28068 tuple2!20062) (t!40184 List!26863)) )
))
(declare-datatypes ((ListLongMap!18031 0))(
  ( (ListLongMap!18032 (toList!9031 List!26863)) )
))
(declare-fun lt!555771 () ListLongMap!18031)

(declare-fun lt!555768 () ListLongMap!18031)

(assert (=> b!1221779 (= lt!555771 lt!555768)))

(declare-fun lt!555770 () ListLongMap!18031)

(declare-fun -!1936 (ListLongMap!18031 (_ BitVec 64)) ListLongMap!18031)

(assert (=> b!1221779 (= lt!555768 (-!1936 lt!555770 k!934))))

(declare-fun zeroValue!944 () V!46521)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555769 () array!78875)

(declare-fun minValue!944 () V!46521)

(declare-fun getCurrentListMapNoExtraKeys!5453 (array!78873 array!78875 (_ BitVec 32) (_ BitVec 32) V!46521 V!46521 (_ BitVec 32) Int) ListLongMap!18031)

(assert (=> b!1221779 (= lt!555771 (getCurrentListMapNoExtraKeys!5453 lt!555767 lt!555769 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221779 (= lt!555770 (getCurrentListMapNoExtraKeys!5453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40466 0))(
  ( (Unit!40467) )
))
(declare-fun lt!555761 () Unit!40466)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1143 (array!78873 array!78875 (_ BitVec 32) (_ BitVec 32) V!46521 V!46521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40466)

(assert (=> b!1221779 (= lt!555761 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1143 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221780 () Bool)

(declare-fun e!693864 () Bool)

(assert (=> b!1221780 (= e!693864 e!693855)))

(declare-fun res!811668 () Bool)

(assert (=> b!1221780 (=> res!811668 e!693855)))

(assert (=> b!1221780 (= res!811668 (or (bvsge (size!38600 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38600 _keys!1208)) (bvsge from!1455 (size!38600 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!78873 (_ BitVec 32) List!26862) Bool)

(assert (=> b!1221780 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26859)))

(declare-fun lt!555766 () Unit!40466)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78873 (_ BitVec 32) (_ BitVec 32)) Unit!40466)

(assert (=> b!1221780 (= lt!555766 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!78873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221780 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555760 () Unit!40466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78873 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40466)

(assert (=> b!1221780 (= lt!555760 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221781 () Bool)

(declare-fun res!811665 () Bool)

(assert (=> b!1221781 (=> res!811665 e!693855)))

(declare-fun noDuplicate!1632 (List!26862) Bool)

(assert (=> b!1221781 (= res!811665 (not (noDuplicate!1632 Nil!26859)))))

(declare-fun b!1221782 () Bool)

(declare-fun res!811667 () Bool)

(assert (=> b!1221782 (=> res!811667 e!693855)))

(assert (=> b!1221782 (= res!811667 (contains!7028 Nil!26859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221783 () Bool)

(declare-fun res!811673 () Bool)

(assert (=> b!1221783 (=> (not res!811673) (not e!693856))))

(assert (=> b!1221783 (= res!811673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221784 () Bool)

(declare-fun e!693861 () Bool)

(declare-fun e!693852 () Bool)

(assert (=> b!1221784 (= e!693861 e!693852)))

(declare-fun res!811670 () Bool)

(assert (=> b!1221784 (=> res!811670 e!693852)))

(assert (=> b!1221784 (= res!811670 (not (= (select (arr!38064 _keys!1208) from!1455) k!934)))))

(declare-fun b!1221785 () Bool)

(declare-fun res!811662 () Bool)

(assert (=> b!1221785 (=> (not res!811662) (not e!693857))))

(assert (=> b!1221785 (= res!811662 (arrayNoDuplicates!0 lt!555767 #b00000000000000000000000000000000 Nil!26859))))

(declare-fun b!1221786 () Bool)

(declare-fun res!811672 () Bool)

(assert (=> b!1221786 (=> (not res!811672) (not e!693856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221786 (= res!811672 (validMask!0 mask!1564))))

(declare-fun b!1221787 () Bool)

(declare-fun res!811661 () Bool)

(assert (=> b!1221787 (=> (not res!811661) (not e!693856))))

(assert (=> b!1221787 (= res!811661 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26859))))

(declare-fun b!1221788 () Bool)

(assert (=> b!1221788 (= e!693852 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1221789 () Bool)

(declare-fun e!693863 () Bool)

(assert (=> b!1221789 (= e!693857 (not e!693863))))

(declare-fun res!811669 () Bool)

(assert (=> b!1221789 (=> res!811669 e!693863)))

(assert (=> b!1221789 (= res!811669 (bvsgt from!1455 i!673))))

(assert (=> b!1221789 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!555772 () Unit!40466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78873 (_ BitVec 64) (_ BitVec 32)) Unit!40466)

(assert (=> b!1221789 (= lt!555772 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1221790 () Bool)

(assert (=> b!1221790 (= e!693860 e!693864)))

(declare-fun res!811677 () Bool)

(assert (=> b!1221790 (=> res!811677 e!693864)))

(assert (=> b!1221790 (= res!811677 (not (= (select (arr!38064 _keys!1208) from!1455) k!934)))))

(assert (=> b!1221790 e!693861))

(declare-fun res!811663 () Bool)

(assert (=> b!1221790 (=> (not res!811663) (not e!693861))))

(declare-fun lt!555765 () V!46521)

(declare-fun lt!555763 () ListLongMap!18031)

(declare-fun +!4094 (ListLongMap!18031 tuple2!20062) ListLongMap!18031)

(declare-fun get!19429 (ValueCell!14813 V!46521) V!46521)

(assert (=> b!1221790 (= res!811663 (= lt!555763 (+!4094 lt!555768 (tuple2!20063 (select (arr!38064 _keys!1208) from!1455) (get!19429 (select (arr!38065 _values!996) from!1455) lt!555765)))))))

(declare-fun b!1221791 () Bool)

(declare-fun e!693853 () Bool)

(assert (=> b!1221791 (= e!693853 tp_is_empty!31045)))

(declare-fun mapNonEmpty!48463 () Bool)

(declare-fun mapRes!48463 () Bool)

(declare-fun tp!92065 () Bool)

(assert (=> mapNonEmpty!48463 (= mapRes!48463 (and tp!92065 e!693854))))

(declare-fun mapKey!48463 () (_ BitVec 32))

(declare-fun mapRest!48463 () (Array (_ BitVec 32) ValueCell!14813))

(declare-fun mapValue!48463 () ValueCell!14813)

(assert (=> mapNonEmpty!48463 (= (arr!38065 _values!996) (store mapRest!48463 mapKey!48463 mapValue!48463))))

(declare-fun b!1221792 () Bool)

(declare-fun res!811664 () Bool)

(assert (=> b!1221792 (=> (not res!811664) (not e!693856))))

(assert (=> b!1221792 (= res!811664 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38600 _keys!1208))))))

(declare-fun b!1221793 () Bool)

(assert (=> b!1221793 (= e!693863 e!693858)))

(declare-fun res!811676 () Bool)

(assert (=> b!1221793 (=> res!811676 e!693858)))

(assert (=> b!1221793 (= res!811676 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1221793 (= lt!555763 (getCurrentListMapNoExtraKeys!5453 lt!555767 lt!555769 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1221793 (= lt!555769 (array!78876 (store (arr!38065 _values!996) i!673 (ValueCellFull!14813 lt!555765)) (size!38601 _values!996)))))

(declare-fun dynLambda!3332 (Int (_ BitVec 64)) V!46521)

(assert (=> b!1221793 (= lt!555765 (dynLambda!3332 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555762 () ListLongMap!18031)

(assert (=> b!1221793 (= lt!555762 (getCurrentListMapNoExtraKeys!5453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221794 () Bool)

(declare-fun res!811679 () Bool)

(assert (=> b!1221794 (=> (not res!811679) (not e!693856))))

(assert (=> b!1221794 (= res!811679 (and (= (size!38601 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38600 _keys!1208) (size!38601 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48463 () Bool)

(assert (=> mapIsEmpty!48463 mapRes!48463))

(declare-fun b!1221795 () Bool)

(declare-fun res!811674 () Bool)

(assert (=> b!1221795 (=> (not res!811674) (not e!693856))))

(assert (=> b!1221795 (= res!811674 (= (select (arr!38064 _keys!1208) i!673) k!934))))

(declare-fun b!1221796 () Bool)

(assert (=> b!1221796 (= e!693859 (and e!693853 mapRes!48463))))

(declare-fun condMapEmpty!48463 () Bool)

(declare-fun mapDefault!48463 () ValueCell!14813)

