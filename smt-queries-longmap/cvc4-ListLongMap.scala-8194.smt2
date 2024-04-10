; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100034 () Bool)

(assert start!100034)

(declare-fun b_free!25613 () Bool)

(declare-fun b_next!25613 () Bool)

(assert (=> start!100034 (= b_free!25613 (not b_next!25613))))

(declare-fun tp!89553 () Bool)

(declare-fun b_and!42093 () Bool)

(assert (=> start!100034 (= tp!89553 b_and!42093)))

(declare-fun mapNonEmpty!47042 () Bool)

(declare-fun mapRes!47042 () Bool)

(declare-fun tp!89552 () Bool)

(declare-fun e!677598 () Bool)

(assert (=> mapNonEmpty!47042 (= mapRes!47042 (and tp!89552 e!677598))))

(declare-datatypes ((V!45317 0))(
  ( (V!45318 (val!15128 Int)) )
))
(declare-datatypes ((ValueCell!14362 0))(
  ( (ValueCellFull!14362 (v!17766 V!45317)) (EmptyCell!14362) )
))
(declare-fun mapRest!47042 () (Array (_ BitVec 32) ValueCell!14362))

(declare-datatypes ((array!77075 0))(
  ( (array!77076 (arr!37187 (Array (_ BitVec 32) ValueCell!14362)) (size!37723 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77075)

(declare-fun mapValue!47042 () ValueCell!14362)

(declare-fun mapKey!47042 () (_ BitVec 32))

(assert (=> mapNonEmpty!47042 (= (arr!37187 _values!996) (store mapRest!47042 mapKey!47042 mapValue!47042))))

(declare-fun b!1192079 () Bool)

(declare-fun e!677600 () Bool)

(declare-fun e!677597 () Bool)

(assert (=> b!1192079 (= e!677600 e!677597)))

(declare-fun res!792979 () Bool)

(assert (=> b!1192079 (=> (not res!792979) (not e!677597))))

(declare-datatypes ((array!77077 0))(
  ( (array!77078 (arr!37188 (Array (_ BitVec 32) (_ BitVec 64))) (size!37724 (_ BitVec 32))) )
))
(declare-fun lt!542081 () array!77077)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77077 (_ BitVec 32)) Bool)

(assert (=> b!1192079 (= res!792979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542081 mask!1564))))

(declare-fun _keys!1208 () array!77077)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192079 (= lt!542081 (array!77078 (store (arr!37188 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37724 _keys!1208)))))

(declare-fun b!1192080 () Bool)

(declare-fun e!677602 () Bool)

(assert (=> b!1192080 (= e!677597 (not e!677602))))

(declare-fun res!792977 () Bool)

(assert (=> b!1192080 (=> res!792977 e!677602)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192080 (= res!792977 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192080 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39546 0))(
  ( (Unit!39547) )
))
(declare-fun lt!542077 () Unit!39546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77077 (_ BitVec 64) (_ BitVec 32)) Unit!39546)

(assert (=> b!1192080 (= lt!542077 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1192081 () Bool)

(declare-fun e!677599 () Bool)

(declare-fun tp_is_empty!30143 () Bool)

(assert (=> b!1192081 (= e!677599 tp_is_empty!30143)))

(declare-fun b!1192082 () Bool)

(declare-fun res!792978 () Bool)

(assert (=> b!1192082 (=> (not res!792978) (not e!677600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192082 (= res!792978 (validMask!0 mask!1564))))

(declare-fun b!1192083 () Bool)

(declare-fun e!677596 () Bool)

(assert (=> b!1192083 (= e!677596 (and e!677599 mapRes!47042))))

(declare-fun condMapEmpty!47042 () Bool)

(declare-fun mapDefault!47042 () ValueCell!14362)

