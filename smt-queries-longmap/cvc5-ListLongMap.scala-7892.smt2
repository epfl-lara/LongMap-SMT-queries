; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98096 () Bool)

(assert start!98096)

(declare-fun b_free!23797 () Bool)

(declare-fun b_next!23797 () Bool)

(assert (=> start!98096 (= b_free!23797 (not b_next!23797))))

(declare-fun tp!84094 () Bool)

(declare-fun b_and!38377 () Bool)

(assert (=> start!98096 (= tp!84094 b_and!38377)))

(declare-fun b!1126908 () Bool)

(declare-fun res!753055 () Bool)

(declare-fun e!641427 () Bool)

(assert (=> b!1126908 (=> (not res!753055) (not e!641427))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126908 (= res!753055 (validKeyInArray!0 k!934))))

(declare-fun b!1126909 () Bool)

(declare-fun res!753046 () Bool)

(assert (=> b!1126909 (=> (not res!753046) (not e!641427))))

(declare-datatypes ((array!73515 0))(
  ( (array!73516 (arr!35410 (Array (_ BitVec 32) (_ BitVec 64))) (size!35946 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73515)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126909 (= res!753046 (= (select (arr!35410 _keys!1208) i!673) k!934))))

(declare-fun b!1126910 () Bool)

(declare-fun res!753056 () Bool)

(declare-fun e!641421 () Bool)

(assert (=> b!1126910 (=> res!753056 e!641421)))

(declare-datatypes ((V!42897 0))(
  ( (V!42898 (val!14220 Int)) )
))
(declare-fun zeroValue!944 () V!42897)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13454 0))(
  ( (ValueCellFull!13454 (v!16853 V!42897)) (EmptyCell!13454) )
))
(declare-datatypes ((array!73517 0))(
  ( (array!73518 (arr!35411 (Array (_ BitVec 32) ValueCell!13454)) (size!35947 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73517)

(declare-fun minValue!944 () V!42897)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17880 0))(
  ( (tuple2!17881 (_1!8951 (_ BitVec 64)) (_2!8951 V!42897)) )
))
(declare-datatypes ((List!24655 0))(
  ( (Nil!24652) (Cons!24651 (h!25860 tuple2!17880) (t!35444 List!24655)) )
))
(declare-datatypes ((ListLongMap!15849 0))(
  ( (ListLongMap!15850 (toList!7940 List!24655)) )
))
(declare-fun contains!6472 (ListLongMap!15849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4428 (array!73515 array!73517 (_ BitVec 32) (_ BitVec 32) V!42897 V!42897 (_ BitVec 32) Int) ListLongMap!15849)

(assert (=> b!1126910 (= res!753056 (not (contains!6472 (getCurrentListMapNoExtraKeys!4428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934)))))

(declare-fun b!1126911 () Bool)

(declare-fun e!641420 () Bool)

(assert (=> b!1126911 (= e!641420 e!641421)))

(declare-fun res!753054 () Bool)

(assert (=> b!1126911 (=> res!753054 e!641421)))

(assert (=> b!1126911 (= res!753054 (not (= (select (arr!35410 _keys!1208) from!1455) k!934)))))

(declare-fun e!641422 () Bool)

(assert (=> b!1126911 e!641422))

(declare-fun c!109686 () Bool)

(assert (=> b!1126911 (= c!109686 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36926 0))(
  ( (Unit!36927) )
))
(declare-fun lt!500397 () Unit!36926)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!384 (array!73515 array!73517 (_ BitVec 32) (_ BitVec 32) V!42897 V!42897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36926)

(assert (=> b!1126911 (= lt!500397 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126912 () Bool)

(declare-fun e!641426 () Bool)

(assert (=> b!1126912 (= e!641427 e!641426)))

(declare-fun res!753058 () Bool)

(assert (=> b!1126912 (=> (not res!753058) (not e!641426))))

(declare-fun lt!500400 () array!73515)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73515 (_ BitVec 32)) Bool)

(assert (=> b!1126912 (= res!753058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500400 mask!1564))))

(assert (=> b!1126912 (= lt!500400 (array!73516 (store (arr!35410 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35946 _keys!1208)))))

(declare-fun res!753051 () Bool)

(assert (=> start!98096 (=> (not res!753051) (not e!641427))))

(assert (=> start!98096 (= res!753051 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35946 _keys!1208))))))

(assert (=> start!98096 e!641427))

(declare-fun tp_is_empty!28327 () Bool)

(assert (=> start!98096 tp_is_empty!28327))

(declare-fun array_inv!27176 (array!73515) Bool)

(assert (=> start!98096 (array_inv!27176 _keys!1208)))

(assert (=> start!98096 true))

(assert (=> start!98096 tp!84094))

(declare-fun e!641423 () Bool)

(declare-fun array_inv!27177 (array!73517) Bool)

(assert (=> start!98096 (and (array_inv!27177 _values!996) e!641423)))

(declare-fun mapNonEmpty!44308 () Bool)

(declare-fun mapRes!44308 () Bool)

(declare-fun tp!84095 () Bool)

(declare-fun e!641418 () Bool)

(assert (=> mapNonEmpty!44308 (= mapRes!44308 (and tp!84095 e!641418))))

(declare-fun mapKey!44308 () (_ BitVec 32))

(declare-fun mapValue!44308 () ValueCell!13454)

(declare-fun mapRest!44308 () (Array (_ BitVec 32) ValueCell!13454))

(assert (=> mapNonEmpty!44308 (= (arr!35411 _values!996) (store mapRest!44308 mapKey!44308 mapValue!44308))))

(declare-fun b!1126913 () Bool)

(declare-fun e!641424 () Bool)

(assert (=> b!1126913 (= e!641423 (and e!641424 mapRes!44308))))

(declare-fun condMapEmpty!44308 () Bool)

(declare-fun mapDefault!44308 () ValueCell!13454)

