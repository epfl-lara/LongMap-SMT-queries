; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99994 () Bool)

(assert start!99994)

(declare-fun b_free!25573 () Bool)

(declare-fun b_next!25573 () Bool)

(assert (=> start!99994 (= b_free!25573 (not b_next!25573))))

(declare-fun tp!89433 () Bool)

(declare-fun b_and!42013 () Bool)

(assert (=> start!99994 (= tp!89433 b_and!42013)))

(declare-fun res!792257 () Bool)

(declare-fun e!677116 () Bool)

(assert (=> start!99994 (=> (not res!792257) (not e!677116))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76997 0))(
  ( (array!76998 (arr!37148 (Array (_ BitVec 32) (_ BitVec 64))) (size!37684 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76997)

(assert (=> start!99994 (= res!792257 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37684 _keys!1208))))))

(assert (=> start!99994 e!677116))

(declare-fun tp_is_empty!30103 () Bool)

(assert (=> start!99994 tp_is_empty!30103))

(declare-fun array_inv!28328 (array!76997) Bool)

(assert (=> start!99994 (array_inv!28328 _keys!1208)))

(assert (=> start!99994 true))

(assert (=> start!99994 tp!89433))

(declare-datatypes ((V!45265 0))(
  ( (V!45266 (val!15108 Int)) )
))
(declare-datatypes ((ValueCell!14342 0))(
  ( (ValueCellFull!14342 (v!17746 V!45265)) (EmptyCell!14342) )
))
(declare-datatypes ((array!76999 0))(
  ( (array!77000 (arr!37149 (Array (_ BitVec 32) ValueCell!14342)) (size!37685 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76999)

(declare-fun e!677119 () Bool)

(declare-fun array_inv!28329 (array!76999) Bool)

(assert (=> start!99994 (and (array_inv!28329 _values!996) e!677119)))

(declare-fun b!1191139 () Bool)

(declare-fun e!677118 () Bool)

(assert (=> b!1191139 (= e!677116 e!677118)))

(declare-fun res!792254 () Bool)

(assert (=> b!1191139 (=> (not res!792254) (not e!677118))))

(declare-fun lt!541719 () array!76997)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76997 (_ BitVec 32)) Bool)

(assert (=> b!1191139 (= res!792254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541719 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191139 (= lt!541719 (array!76998 (store (arr!37148 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37684 _keys!1208)))))

(declare-fun b!1191140 () Bool)

(declare-fun e!677115 () Bool)

(declare-fun e!677121 () Bool)

(assert (=> b!1191140 (= e!677115 e!677121)))

(declare-fun res!792248 () Bool)

(assert (=> b!1191140 (=> res!792248 e!677121)))

(assert (=> b!1191140 (= res!792248 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45265)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!45265)

(declare-datatypes ((tuple2!19414 0))(
  ( (tuple2!19415 (_1!9718 (_ BitVec 64)) (_2!9718 V!45265)) )
))
(declare-datatypes ((List!26159 0))(
  ( (Nil!26156) (Cons!26155 (h!27364 tuple2!19414) (t!38724 List!26159)) )
))
(declare-datatypes ((ListLongMap!17383 0))(
  ( (ListLongMap!17384 (toList!8707 List!26159)) )
))
(declare-fun lt!541722 () ListLongMap!17383)

(declare-fun lt!541720 () array!76999)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5148 (array!76997 array!76999 (_ BitVec 32) (_ BitVec 32) V!45265 V!45265 (_ BitVec 32) Int) ListLongMap!17383)

(assert (=> b!1191140 (= lt!541722 (getCurrentListMapNoExtraKeys!5148 lt!541719 lt!541720 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3083 (Int (_ BitVec 64)) V!45265)

(assert (=> b!1191140 (= lt!541720 (array!77000 (store (arr!37149 _values!996) i!673 (ValueCellFull!14342 (dynLambda!3083 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37685 _values!996)))))

(declare-fun lt!541717 () ListLongMap!17383)

(assert (=> b!1191140 (= lt!541717 (getCurrentListMapNoExtraKeys!5148 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191141 () Bool)

(declare-fun e!677122 () Bool)

(assert (=> b!1191141 (= e!677122 tp_is_empty!30103)))

(declare-fun b!1191142 () Bool)

(declare-fun res!792259 () Bool)

(assert (=> b!1191142 (=> (not res!792259) (not e!677118))))

(declare-datatypes ((List!26160 0))(
  ( (Nil!26157) (Cons!26156 (h!27365 (_ BitVec 64)) (t!38725 List!26160)) )
))
(declare-fun arrayNoDuplicates!0 (array!76997 (_ BitVec 32) List!26160) Bool)

(assert (=> b!1191142 (= res!792259 (arrayNoDuplicates!0 lt!541719 #b00000000000000000000000000000000 Nil!26157))))

(declare-fun b!1191143 () Bool)

(declare-fun mapRes!46982 () Bool)

(assert (=> b!1191143 (= e!677119 (and e!677122 mapRes!46982))))

(declare-fun condMapEmpty!46982 () Bool)

(declare-fun mapDefault!46982 () ValueCell!14342)

