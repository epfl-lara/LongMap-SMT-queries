; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99406 () Bool)

(assert start!99406)

(declare-fun b_free!24985 () Bool)

(declare-fun b_next!24985 () Bool)

(assert (=> start!99406 (= b_free!24985 (not b_next!24985))))

(declare-fun tp!87669 () Bool)

(declare-fun b_and!40837 () Bool)

(assert (=> start!99406 (= tp!87669 b_and!40837)))

(declare-fun b!1173479 () Bool)

(declare-fun e!667013 () Bool)

(declare-fun tp_is_empty!29515 () Bool)

(assert (=> b!1173479 (= e!667013 tp_is_empty!29515)))

(declare-fun b!1173480 () Bool)

(declare-fun e!667017 () Bool)

(declare-fun e!667007 () Bool)

(assert (=> b!1173480 (= e!667017 (not e!667007))))

(declare-fun res!779224 () Bool)

(assert (=> b!1173480 (=> res!779224 e!667007)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173480 (= res!779224 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75841 0))(
  ( (array!75842 (arr!36570 (Array (_ BitVec 32) (_ BitVec 64))) (size!37106 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75841)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173480 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38700 0))(
  ( (Unit!38701) )
))
(declare-fun lt!528953 () Unit!38700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75841 (_ BitVec 64) (_ BitVec 32)) Unit!38700)

(assert (=> b!1173480 (= lt!528953 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173481 () Bool)

(declare-fun res!779232 () Bool)

(declare-fun e!667014 () Bool)

(assert (=> b!1173481 (=> (not res!779232) (not e!667014))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44481 0))(
  ( (V!44482 (val!14814 Int)) )
))
(declare-datatypes ((ValueCell!14048 0))(
  ( (ValueCellFull!14048 (v!17452 V!44481)) (EmptyCell!14048) )
))
(declare-datatypes ((array!75843 0))(
  ( (array!75844 (arr!36571 (Array (_ BitVec 32) ValueCell!14048)) (size!37107 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75843)

(assert (=> b!1173481 (= res!779232 (and (= (size!37107 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37106 _keys!1208) (size!37107 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173482 () Bool)

(declare-fun e!667010 () Bool)

(assert (=> b!1173482 (= e!667010 tp_is_empty!29515)))

(declare-fun b!1173483 () Bool)

(declare-fun e!667009 () Bool)

(assert (=> b!1173483 (= e!667009 true)))

(assert (=> b!1173483 (not (= (select (arr!36570 _keys!1208) from!1455) k!934))))

(declare-fun lt!528962 () Unit!38700)

(declare-fun e!667015 () Unit!38700)

(assert (=> b!1173483 (= lt!528962 e!667015)))

(declare-fun c!116601 () Bool)

(assert (=> b!1173483 (= c!116601 (= (select (arr!36570 _keys!1208) from!1455) k!934))))

(declare-fun e!667012 () Bool)

(assert (=> b!1173483 e!667012))

(declare-fun res!779229 () Bool)

(assert (=> b!1173483 (=> (not res!779229) (not e!667012))))

(declare-datatypes ((tuple2!18930 0))(
  ( (tuple2!18931 (_1!9476 (_ BitVec 64)) (_2!9476 V!44481)) )
))
(declare-datatypes ((List!25669 0))(
  ( (Nil!25666) (Cons!25665 (h!26874 tuple2!18930) (t!37646 List!25669)) )
))
(declare-datatypes ((ListLongMap!16899 0))(
  ( (ListLongMap!16900 (toList!8465 List!25669)) )
))
(declare-fun lt!528957 () ListLongMap!16899)

(declare-fun lt!528954 () V!44481)

(declare-fun lt!528966 () ListLongMap!16899)

(declare-fun +!3784 (ListLongMap!16899 tuple2!18930) ListLongMap!16899)

(declare-fun get!18660 (ValueCell!14048 V!44481) V!44481)

(assert (=> b!1173483 (= res!779229 (= lt!528966 (+!3784 lt!528957 (tuple2!18931 (select (arr!36570 _keys!1208) from!1455) (get!18660 (select (arr!36571 _values!996) from!1455) lt!528954)))))))

(declare-fun b!1173484 () Bool)

(declare-fun res!779235 () Bool)

(assert (=> b!1173484 (=> (not res!779235) (not e!667014))))

(declare-datatypes ((List!25670 0))(
  ( (Nil!25667) (Cons!25666 (h!26875 (_ BitVec 64)) (t!37647 List!25670)) )
))
(declare-fun arrayNoDuplicates!0 (array!75841 (_ BitVec 32) List!25670) Bool)

(assert (=> b!1173484 (= res!779235 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25667))))

(declare-fun b!1173485 () Bool)

(declare-fun res!779234 () Bool)

(assert (=> b!1173485 (=> (not res!779234) (not e!667014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75841 (_ BitVec 32)) Bool)

(assert (=> b!1173485 (= res!779234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173486 () Bool)

(declare-fun res!779223 () Bool)

(assert (=> b!1173486 (=> (not res!779223) (not e!667014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173486 (= res!779223 (validMask!0 mask!1564))))

(declare-fun res!779226 () Bool)

(assert (=> start!99406 (=> (not res!779226) (not e!667014))))

(assert (=> start!99406 (= res!779226 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37106 _keys!1208))))))

(assert (=> start!99406 e!667014))

(assert (=> start!99406 tp_is_empty!29515))

(declare-fun array_inv!27940 (array!75841) Bool)

(assert (=> start!99406 (array_inv!27940 _keys!1208)))

(assert (=> start!99406 true))

(assert (=> start!99406 tp!87669))

(declare-fun e!667016 () Bool)

(declare-fun array_inv!27941 (array!75843) Bool)

(assert (=> start!99406 (and (array_inv!27941 _values!996) e!667016)))

(declare-fun e!667011 () Bool)

(declare-fun b!1173487 () Bool)

(assert (=> b!1173487 (= e!667011 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173488 () Bool)

(declare-fun mapRes!46100 () Bool)

(assert (=> b!1173488 (= e!667016 (and e!667010 mapRes!46100))))

(declare-fun condMapEmpty!46100 () Bool)

(declare-fun mapDefault!46100 () ValueCell!14048)

