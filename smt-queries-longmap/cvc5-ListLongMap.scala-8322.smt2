; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101280 () Bool)

(assert start!101280)

(declare-fun b_free!26203 () Bool)

(declare-fun b_next!26203 () Bool)

(assert (=> start!101280 (= b_free!26203 (not b_next!26203))))

(declare-fun tp!91630 () Bool)

(declare-fun b_and!43523 () Bool)

(assert (=> start!101280 (= tp!91630 b_and!43523)))

(declare-fun b!1216780 () Bool)

(declare-fun res!808029 () Bool)

(declare-fun e!690811 () Bool)

(assert (=> b!1216780 (=> (not res!808029) (not e!690811))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216780 (= res!808029 (validMask!0 mask!1564))))

(declare-fun b!1216781 () Bool)

(declare-fun res!808031 () Bool)

(assert (=> b!1216781 (=> (not res!808031) (not e!690811))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78585 0))(
  ( (array!78586 (arr!37927 (Array (_ BitVec 32) (_ BitVec 64))) (size!38463 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78585)

(assert (=> b!1216781 (= res!808031 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38463 _keys!1208))))))

(declare-fun b!1216782 () Bool)

(declare-fun e!690808 () Bool)

(assert (=> b!1216782 (= e!690811 e!690808)))

(declare-fun res!808026 () Bool)

(assert (=> b!1216782 (=> (not res!808026) (not e!690808))))

(declare-fun lt!553030 () array!78585)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78585 (_ BitVec 32)) Bool)

(assert (=> b!1216782 (= res!808026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553030 mask!1564))))

(assert (=> b!1216782 (= lt!553030 (array!78586 (store (arr!37927 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38463 _keys!1208)))))

(declare-fun b!1216783 () Bool)

(declare-fun res!808024 () Bool)

(assert (=> b!1216783 (=> (not res!808024) (not e!690811))))

(assert (=> b!1216783 (= res!808024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216784 () Bool)

(declare-fun e!690805 () Bool)

(declare-fun tp_is_empty!30907 () Bool)

(assert (=> b!1216784 (= e!690805 tp_is_empty!30907)))

(declare-fun b!1216785 () Bool)

(declare-fun res!808025 () Bool)

(assert (=> b!1216785 (=> (not res!808025) (not e!690811))))

(declare-datatypes ((V!46337 0))(
  ( (V!46338 (val!15510 Int)) )
))
(declare-datatypes ((ValueCell!14744 0))(
  ( (ValueCellFull!14744 (v!18163 V!46337)) (EmptyCell!14744) )
))
(declare-datatypes ((array!78587 0))(
  ( (array!78588 (arr!37928 (Array (_ BitVec 32) ValueCell!14744)) (size!38464 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78587)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1216785 (= res!808025 (and (= (size!38464 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38463 _keys!1208) (size!38464 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216786 () Bool)

(declare-fun e!690803 () Bool)

(assert (=> b!1216786 (= e!690808 (not e!690803))))

(declare-fun res!808021 () Bool)

(assert (=> b!1216786 (=> res!808021 e!690803)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1216786 (= res!808021 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216786 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40342 0))(
  ( (Unit!40343) )
))
(declare-fun lt!553028 () Unit!40342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78585 (_ BitVec 64) (_ BitVec 32)) Unit!40342)

(assert (=> b!1216786 (= lt!553028 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1216787 () Bool)

(declare-fun res!808019 () Bool)

(assert (=> b!1216787 (=> (not res!808019) (not e!690808))))

(declare-datatypes ((List!26740 0))(
  ( (Nil!26737) (Cons!26736 (h!27945 (_ BitVec 64)) (t!39923 List!26740)) )
))
(declare-fun arrayNoDuplicates!0 (array!78585 (_ BitVec 32) List!26740) Bool)

(assert (=> b!1216787 (= res!808019 (arrayNoDuplicates!0 lt!553030 #b00000000000000000000000000000000 Nil!26737))))

(declare-fun mapIsEmpty!48235 () Bool)

(declare-fun mapRes!48235 () Bool)

(assert (=> mapIsEmpty!48235 mapRes!48235))

(declare-fun res!808028 () Bool)

(assert (=> start!101280 (=> (not res!808028) (not e!690811))))

(assert (=> start!101280 (= res!808028 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38463 _keys!1208))))))

(assert (=> start!101280 e!690811))

(assert (=> start!101280 tp_is_empty!30907))

(declare-fun array_inv!28874 (array!78585) Bool)

(assert (=> start!101280 (array_inv!28874 _keys!1208)))

(assert (=> start!101280 true))

(assert (=> start!101280 tp!91630))

(declare-fun e!690810 () Bool)

(declare-fun array_inv!28875 (array!78587) Bool)

(assert (=> start!101280 (and (array_inv!28875 _values!996) e!690810)))

(declare-fun b!1216788 () Bool)

(declare-fun res!808030 () Bool)

(assert (=> b!1216788 (=> (not res!808030) (not e!690811))))

(assert (=> b!1216788 (= res!808030 (= (select (arr!37927 _keys!1208) i!673) k!934))))

(declare-fun b!1216789 () Bool)

(declare-fun e!690806 () Bool)

(assert (=> b!1216789 (= e!690803 e!690806)))

(declare-fun res!808027 () Bool)

(assert (=> b!1216789 (=> res!808027 e!690806)))

(assert (=> b!1216789 (= res!808027 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46337)

(declare-fun lt!553027 () array!78587)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19936 0))(
  ( (tuple2!19937 (_1!9979 (_ BitVec 64)) (_2!9979 V!46337)) )
))
(declare-datatypes ((List!26741 0))(
  ( (Nil!26738) (Cons!26737 (h!27946 tuple2!19936) (t!39924 List!26741)) )
))
(declare-datatypes ((ListLongMap!17905 0))(
  ( (ListLongMap!17906 (toList!8968 List!26741)) )
))
(declare-fun lt!553032 () ListLongMap!17905)

(declare-fun minValue!944 () V!46337)

(declare-fun getCurrentListMapNoExtraKeys!5395 (array!78585 array!78587 (_ BitVec 32) (_ BitVec 32) V!46337 V!46337 (_ BitVec 32) Int) ListLongMap!17905)

(assert (=> b!1216789 (= lt!553032 (getCurrentListMapNoExtraKeys!5395 lt!553030 lt!553027 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3284 (Int (_ BitVec 64)) V!46337)

(assert (=> b!1216789 (= lt!553027 (array!78588 (store (arr!37928 _values!996) i!673 (ValueCellFull!14744 (dynLambda!3284 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38464 _values!996)))))

(declare-fun lt!553029 () ListLongMap!17905)

(assert (=> b!1216789 (= lt!553029 (getCurrentListMapNoExtraKeys!5395 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48235 () Bool)

(declare-fun tp!91631 () Bool)

(declare-fun e!690809 () Bool)

(assert (=> mapNonEmpty!48235 (= mapRes!48235 (and tp!91631 e!690809))))

(declare-fun mapValue!48235 () ValueCell!14744)

(declare-fun mapKey!48235 () (_ BitVec 32))

(declare-fun mapRest!48235 () (Array (_ BitVec 32) ValueCell!14744))

(assert (=> mapNonEmpty!48235 (= (arr!37928 _values!996) (store mapRest!48235 mapKey!48235 mapValue!48235))))

(declare-fun b!1216790 () Bool)

(declare-fun e!690804 () Bool)

(assert (=> b!1216790 (= e!690804 (bvslt from!1455 (size!38463 _keys!1208)))))

(declare-fun b!1216791 () Bool)

(assert (=> b!1216791 (= e!690810 (and e!690805 mapRes!48235))))

(declare-fun condMapEmpty!48235 () Bool)

(declare-fun mapDefault!48235 () ValueCell!14744)

