; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100220 () Bool)

(assert start!100220)

(declare-fun b!1195164 () Bool)

(declare-fun res!795252 () Bool)

(declare-fun e!679181 () Bool)

(assert (=> b!1195164 (=> (not res!795252) (not e!679181))))

(declare-datatypes ((array!77355 0))(
  ( (array!77356 (arr!37324 (Array (_ BitVec 32) (_ BitVec 64))) (size!37860 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77355)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45509 0))(
  ( (V!45510 (val!15200 Int)) )
))
(declare-datatypes ((ValueCell!14434 0))(
  ( (ValueCellFull!14434 (v!17838 V!45509)) (EmptyCell!14434) )
))
(declare-datatypes ((array!77357 0))(
  ( (array!77358 (arr!37325 (Array (_ BitVec 32) ValueCell!14434)) (size!37861 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77357)

(assert (=> b!1195164 (= res!795252 (and (= (size!37861 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37860 _keys!1208) (size!37861 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195165 () Bool)

(declare-fun e!679179 () Bool)

(declare-fun tp_is_empty!30287 () Bool)

(assert (=> b!1195165 (= e!679179 tp_is_empty!30287)))

(declare-fun mapIsEmpty!47267 () Bool)

(declare-fun mapRes!47267 () Bool)

(assert (=> mapIsEmpty!47267 mapRes!47267))

(declare-fun b!1195166 () Bool)

(declare-fun res!795250 () Bool)

(assert (=> b!1195166 (=> (not res!795250) (not e!679181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195166 (= res!795250 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47267 () Bool)

(declare-fun tp!89877 () Bool)

(assert (=> mapNonEmpty!47267 (= mapRes!47267 (and tp!89877 e!679179))))

(declare-fun mapRest!47267 () (Array (_ BitVec 32) ValueCell!14434))

(declare-fun mapValue!47267 () ValueCell!14434)

(declare-fun mapKey!47267 () (_ BitVec 32))

(assert (=> mapNonEmpty!47267 (= (arr!37325 _values!996) (store mapRest!47267 mapKey!47267 mapValue!47267))))

(declare-fun b!1195167 () Bool)

(declare-fun e!679182 () Bool)

(assert (=> b!1195167 (= e!679182 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195167 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39622 0))(
  ( (Unit!39623) )
))
(declare-fun lt!542885 () Unit!39622)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77355 (_ BitVec 64) (_ BitVec 32)) Unit!39622)

(assert (=> b!1195167 (= lt!542885 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195168 () Bool)

(declare-fun res!795248 () Bool)

(assert (=> b!1195168 (=> (not res!795248) (not e!679181))))

(assert (=> b!1195168 (= res!795248 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37860 _keys!1208))))))

(declare-fun b!1195169 () Bool)

(assert (=> b!1195169 (= e!679181 e!679182)))

(declare-fun res!795251 () Bool)

(assert (=> b!1195169 (=> (not res!795251) (not e!679182))))

(declare-fun lt!542886 () array!77355)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77355 (_ BitVec 32)) Bool)

(assert (=> b!1195169 (= res!795251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542886 mask!1564))))

(assert (=> b!1195169 (= lt!542886 (array!77356 (store (arr!37324 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37860 _keys!1208)))))

(declare-fun b!1195171 () Bool)

(declare-fun res!795255 () Bool)

(assert (=> b!1195171 (=> (not res!795255) (not e!679181))))

(declare-datatypes ((List!26273 0))(
  ( (Nil!26270) (Cons!26269 (h!27478 (_ BitVec 64)) (t!38944 List!26273)) )
))
(declare-fun arrayNoDuplicates!0 (array!77355 (_ BitVec 32) List!26273) Bool)

(assert (=> b!1195171 (= res!795255 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26270))))

(declare-fun b!1195172 () Bool)

(declare-fun res!795249 () Bool)

(assert (=> b!1195172 (=> (not res!795249) (not e!679182))))

(assert (=> b!1195172 (= res!795249 (arrayNoDuplicates!0 lt!542886 #b00000000000000000000000000000000 Nil!26270))))

(declare-fun b!1195173 () Bool)

(declare-fun res!795247 () Bool)

(assert (=> b!1195173 (=> (not res!795247) (not e!679181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195173 (= res!795247 (validKeyInArray!0 k!934))))

(declare-fun b!1195174 () Bool)

(declare-fun e!679183 () Bool)

(declare-fun e!679178 () Bool)

(assert (=> b!1195174 (= e!679183 (and e!679178 mapRes!47267))))

(declare-fun condMapEmpty!47267 () Bool)

(declare-fun mapDefault!47267 () ValueCell!14434)

