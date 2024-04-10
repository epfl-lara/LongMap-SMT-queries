; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35646 () Bool)

(assert start!35646)

(declare-fun b_free!7901 () Bool)

(declare-fun b_next!7901 () Bool)

(assert (=> start!35646 (= b_free!7901 (not b_next!7901))))

(declare-fun tp!27687 () Bool)

(declare-fun b_and!15143 () Bool)

(assert (=> start!35646 (= tp!27687 b_and!15143)))

(declare-fun b!357899 () Bool)

(declare-fun e!219091 () Bool)

(declare-fun tp_is_empty!8099 () Bool)

(assert (=> b!357899 (= e!219091 tp_is_empty!8099)))

(declare-fun b!357900 () Bool)

(declare-fun res!198860 () Bool)

(declare-fun e!219090 () Bool)

(assert (=> b!357900 (=> (not res!198860) (not e!219090))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357900 (= res!198860 (validKeyInArray!0 k!1077))))

(declare-fun b!357901 () Bool)

(declare-fun e!219094 () Bool)

(assert (=> b!357901 (= e!219090 (not e!219094))))

(declare-fun res!198864 () Bool)

(assert (=> b!357901 (=> res!198864 e!219094)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19765 0))(
  ( (array!19766 (arr!9376 (Array (_ BitVec 32) (_ BitVec 64))) (size!9728 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19765)

(assert (=> b!357901 (= res!198864 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9728 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357901 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11775 0))(
  ( (V!11776 (val!4094 Int)) )
))
(declare-fun minValue!1150 () V!11775)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3706 0))(
  ( (ValueCellFull!3706 (v!6288 V!11775)) (EmptyCell!3706) )
))
(declare-datatypes ((array!19767 0))(
  ( (array!19768 (arr!9377 (Array (_ BitVec 32) ValueCell!3706)) (size!9729 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19767)

(declare-datatypes ((Unit!11034 0))(
  ( (Unit!11035) )
))
(declare-fun lt!166117 () Unit!11034)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11775)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!36 (array!19765 array!19767 (_ BitVec 32) (_ BitVec 32) V!11775 V!11775 (_ BitVec 64) (_ BitVec 32)) Unit!11034)

(assert (=> b!357901 (= lt!166117 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!36 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357902 () Bool)

(declare-fun e!219092 () Bool)

(declare-fun e!219095 () Bool)

(declare-fun mapRes!13656 () Bool)

(assert (=> b!357902 (= e!219092 (and e!219095 mapRes!13656))))

(declare-fun condMapEmpty!13656 () Bool)

(declare-fun mapDefault!13656 () ValueCell!3706)

