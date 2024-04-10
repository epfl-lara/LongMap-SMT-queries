; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100488 () Bool)

(assert start!100488)

(declare-fun b_free!25811 () Bool)

(declare-fun b_next!25811 () Bool)

(assert (=> start!100488 (= b_free!25811 (not b_next!25811))))

(declare-fun tp!90422 () Bool)

(declare-fun b_and!42509 () Bool)

(assert (=> start!100488 (= tp!90422 b_and!42509)))

(declare-fun b!1200244 () Bool)

(declare-fun e!681632 () Bool)

(declare-fun tp_is_empty!30515 () Bool)

(assert (=> b!1200244 (= e!681632 tp_is_empty!30515)))

(declare-fun b!1200245 () Bool)

(declare-fun e!681633 () Bool)

(declare-fun e!681634 () Bool)

(assert (=> b!1200245 (= e!681633 (not e!681634))))

(declare-fun res!798961 () Bool)

(assert (=> b!1200245 (=> res!798961 e!681634)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200245 (= res!798961 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77803 0))(
  ( (array!77804 (arr!37546 (Array (_ BitVec 32) (_ BitVec 64))) (size!38082 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77803)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200245 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39794 0))(
  ( (Unit!39795) )
))
(declare-fun lt!543989 () Unit!39794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77803 (_ BitVec 64) (_ BitVec 32)) Unit!39794)

(assert (=> b!1200245 (= lt!543989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1200246 () Bool)

(declare-fun res!798967 () Bool)

(declare-fun e!681631 () Bool)

(assert (=> b!1200246 (=> (not res!798967) (not e!681631))))

(declare-datatypes ((List!26423 0))(
  ( (Nil!26420) (Cons!26419 (h!27628 (_ BitVec 64)) (t!39214 List!26423)) )
))
(declare-fun arrayNoDuplicates!0 (array!77803 (_ BitVec 32) List!26423) Bool)

(assert (=> b!1200246 (= res!798967 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26420))))

(declare-fun b!1200247 () Bool)

(assert (=> b!1200247 (= e!681631 e!681633)))

(declare-fun res!798960 () Bool)

(assert (=> b!1200247 (=> (not res!798960) (not e!681633))))

(declare-fun lt!543988 () array!77803)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77803 (_ BitVec 32)) Bool)

(assert (=> b!1200247 (= res!798960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543988 mask!1564))))

(assert (=> b!1200247 (= lt!543988 (array!77804 (store (arr!37546 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38082 _keys!1208)))))

(declare-fun res!798965 () Bool)

(assert (=> start!100488 (=> (not res!798965) (not e!681631))))

(assert (=> start!100488 (= res!798965 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38082 _keys!1208))))))

(assert (=> start!100488 e!681631))

(assert (=> start!100488 tp_is_empty!30515))

(declare-fun array_inv!28614 (array!77803) Bool)

(assert (=> start!100488 (array_inv!28614 _keys!1208)))

(assert (=> start!100488 true))

(assert (=> start!100488 tp!90422))

(declare-datatypes ((V!45813 0))(
  ( (V!45814 (val!15314 Int)) )
))
(declare-datatypes ((ValueCell!14548 0))(
  ( (ValueCellFull!14548 (v!17952 V!45813)) (EmptyCell!14548) )
))
(declare-datatypes ((array!77805 0))(
  ( (array!77806 (arr!37547 (Array (_ BitVec 32) ValueCell!14548)) (size!38083 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77805)

(declare-fun e!681629 () Bool)

(declare-fun array_inv!28615 (array!77805) Bool)

(assert (=> start!100488 (and (array_inv!28615 _values!996) e!681629)))

(declare-fun b!1200248 () Bool)

(declare-fun e!681628 () Bool)

(assert (=> b!1200248 (= e!681628 tp_is_empty!30515)))

(declare-fun b!1200249 () Bool)

(declare-fun res!798959 () Bool)

(assert (=> b!1200249 (=> (not res!798959) (not e!681631))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1200249 (= res!798959 (and (= (size!38083 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38082 _keys!1208) (size!38083 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200250 () Bool)

(declare-fun mapRes!47615 () Bool)

(assert (=> b!1200250 (= e!681629 (and e!681628 mapRes!47615))))

(declare-fun condMapEmpty!47615 () Bool)

(declare-fun mapDefault!47615 () ValueCell!14548)

