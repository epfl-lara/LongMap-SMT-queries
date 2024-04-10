; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99932 () Bool)

(assert start!99932)

(declare-fun b_free!25511 () Bool)

(declare-fun b_next!25511 () Bool)

(assert (=> start!99932 (= b_free!25511 (not b_next!25511))))

(declare-fun tp!89247 () Bool)

(declare-fun b_and!41889 () Bool)

(assert (=> start!99932 (= tp!89247 b_and!41889)))

(declare-fun b!1189682 () Bool)

(declare-fun res!791142 () Bool)

(declare-fun e!676372 () Bool)

(assert (=> b!1189682 (=> (not res!791142) (not e!676372))))

(declare-datatypes ((array!76875 0))(
  ( (array!76876 (arr!37087 (Array (_ BitVec 32) (_ BitVec 64))) (size!37623 (_ BitVec 32))) )
))
(declare-fun lt!541159 () array!76875)

(declare-datatypes ((List!26109 0))(
  ( (Nil!26106) (Cons!26105 (h!27314 (_ BitVec 64)) (t!38612 List!26109)) )
))
(declare-fun arrayNoDuplicates!0 (array!76875 (_ BitVec 32) List!26109) Bool)

(assert (=> b!1189682 (= res!791142 (arrayNoDuplicates!0 lt!541159 #b00000000000000000000000000000000 Nil!26106))))

(declare-fun b!1189683 () Bool)

(declare-fun e!676371 () Bool)

(declare-fun e!676373 () Bool)

(declare-fun mapRes!46889 () Bool)

(assert (=> b!1189683 (= e!676371 (and e!676373 mapRes!46889))))

(declare-fun condMapEmpty!46889 () Bool)

(declare-datatypes ((V!45181 0))(
  ( (V!45182 (val!15077 Int)) )
))
(declare-datatypes ((ValueCell!14311 0))(
  ( (ValueCellFull!14311 (v!17715 V!45181)) (EmptyCell!14311) )
))
(declare-datatypes ((array!76877 0))(
  ( (array!76878 (arr!37088 (Array (_ BitVec 32) ValueCell!14311)) (size!37624 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76877)

(declare-fun mapDefault!46889 () ValueCell!14311)

