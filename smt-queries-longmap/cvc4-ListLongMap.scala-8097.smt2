; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99452 () Bool)

(assert start!99452)

(declare-fun b_free!25031 () Bool)

(declare-fun b_next!25031 () Bool)

(assert (=> start!99452 (= b_free!25031 (not b_next!25031))))

(declare-fun tp!87806 () Bool)

(declare-fun b_and!40929 () Bool)

(assert (=> start!99452 (= tp!87806 b_and!40929)))

(declare-fun b!1174905 () Bool)

(declare-fun res!780266 () Bool)

(declare-fun e!667843 () Bool)

(assert (=> b!1174905 (=> (not res!780266) (not e!667843))))

(declare-datatypes ((array!75933 0))(
  ( (array!75934 (arr!36616 (Array (_ BitVec 32) (_ BitVec 64))) (size!37152 (_ BitVec 32))) )
))
(declare-fun lt!529922 () array!75933)

(declare-datatypes ((List!25709 0))(
  ( (Nil!25706) (Cons!25705 (h!26914 (_ BitVec 64)) (t!37732 List!25709)) )
))
(declare-fun arrayNoDuplicates!0 (array!75933 (_ BitVec 32) List!25709) Bool)

(assert (=> b!1174905 (= res!780266 (arrayNoDuplicates!0 lt!529922 #b00000000000000000000000000000000 Nil!25706))))

(declare-fun b!1174906 () Bool)

(declare-fun res!780264 () Bool)

(declare-fun e!667837 () Bool)

(assert (=> b!1174906 (=> (not res!780264) (not e!667837))))

(declare-fun _keys!1208 () array!75933)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75933 (_ BitVec 32)) Bool)

(assert (=> b!1174906 (= res!780264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!667841 () Bool)

(declare-fun b!1174907 () Bool)

(declare-fun arrayContainsKey!0 (array!75933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174907 (= e!667841 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174908 () Bool)

(declare-fun e!667846 () Bool)

(assert (=> b!1174908 (= e!667846 e!667841)))

(declare-fun res!780257 () Bool)

(assert (=> b!1174908 (=> res!780257 e!667841)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174908 (= res!780257 (not (= (select (arr!36616 _keys!1208) from!1455) k!934)))))

(declare-fun mapIsEmpty!46169 () Bool)

(declare-fun mapRes!46169 () Bool)

(assert (=> mapIsEmpty!46169 mapRes!46169))

(declare-fun b!1174910 () Bool)

(declare-fun res!780271 () Bool)

(assert (=> b!1174910 (=> (not res!780271) (not e!667837))))

(assert (=> b!1174910 (= res!780271 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25706))))

(declare-fun b!1174911 () Bool)

(declare-fun e!667839 () Bool)

(declare-fun tp_is_empty!29561 () Bool)

(assert (=> b!1174911 (= e!667839 tp_is_empty!29561)))

(declare-fun mapNonEmpty!46169 () Bool)

(declare-fun tp!87807 () Bool)

(declare-fun e!667842 () Bool)

(assert (=> mapNonEmpty!46169 (= mapRes!46169 (and tp!87807 e!667842))))

(declare-datatypes ((V!44541 0))(
  ( (V!44542 (val!14837 Int)) )
))
(declare-datatypes ((ValueCell!14071 0))(
  ( (ValueCellFull!14071 (v!17475 V!44541)) (EmptyCell!14071) )
))
(declare-fun mapRest!46169 () (Array (_ BitVec 32) ValueCell!14071))

(declare-fun mapKey!46169 () (_ BitVec 32))

(declare-datatypes ((array!75935 0))(
  ( (array!75936 (arr!36617 (Array (_ BitVec 32) ValueCell!14071)) (size!37153 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75935)

(declare-fun mapValue!46169 () ValueCell!14071)

(assert (=> mapNonEmpty!46169 (= (arr!36617 _values!996) (store mapRest!46169 mapKey!46169 mapValue!46169))))

(declare-fun b!1174912 () Bool)

(declare-fun res!780269 () Bool)

(assert (=> b!1174912 (=> (not res!780269) (not e!667837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174912 (= res!780269 (validMask!0 mask!1564))))

(declare-fun b!1174913 () Bool)

(assert (=> b!1174913 (= e!667842 tp_is_empty!29561)))

(declare-fun b!1174914 () Bool)

(declare-fun res!780268 () Bool)

(assert (=> b!1174914 (=> (not res!780268) (not e!667837))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1174914 (= res!780268 (and (= (size!37153 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37152 _keys!1208) (size!37153 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174915 () Bool)

(declare-fun e!667836 () Bool)

(assert (=> b!1174915 (= e!667836 (and e!667839 mapRes!46169))))

(declare-fun condMapEmpty!46169 () Bool)

(declare-fun mapDefault!46169 () ValueCell!14071)

