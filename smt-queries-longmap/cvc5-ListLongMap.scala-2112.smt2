; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35840 () Bool)

(assert start!35840)

(declare-fun b!360183 () Bool)

(declare-fun e!220573 () Bool)

(assert (=> b!360183 (= e!220573 (not true))))

(declare-datatypes ((array!20137 0))(
  ( (array!20138 (arr!9562 (Array (_ BitVec 32) (_ BitVec 64))) (size!9914 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20137)

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360183 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12035 0))(
  ( (V!12036 (val!4191 Int)) )
))
(declare-fun minValue!1150 () V!12035)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3803 0))(
  ( (ValueCellFull!3803 (v!6385 V!12035)) (EmptyCell!3803) )
))
(declare-datatypes ((array!20139 0))(
  ( (array!20140 (arr!9563 (Array (_ BitVec 32) ValueCell!3803)) (size!9915 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20139)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12035)

(declare-datatypes ((Unit!11074 0))(
  ( (Unit!11075) )
))
(declare-fun lt!166427 () Unit!11074)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!52 (array!20137 array!20139 (_ BitVec 32) (_ BitVec 32) V!12035 V!12035 (_ BitVec 64) (_ BitVec 32)) Unit!11074)

(assert (=> b!360183 (= lt!166427 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!52 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!360184 () Bool)

(declare-fun e!220575 () Bool)

(declare-fun tp_is_empty!8293 () Bool)

(assert (=> b!360184 (= e!220575 tp_is_empty!8293)))

(declare-fun b!360185 () Bool)

(declare-fun res!200268 () Bool)

(assert (=> b!360185 (=> (not res!200268) (not e!220573))))

(assert (=> b!360185 (= res!200268 (not (= (select (arr!9562 _keys!1456) from!1805) k!1077)))))

(declare-fun b!360186 () Bool)

(declare-fun res!200275 () Bool)

(assert (=> b!360186 (=> (not res!200275) (not e!220573))))

(assert (=> b!360186 (= res!200275 (and (= (size!9915 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9914 _keys!1456) (size!9915 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360187 () Bool)

(declare-fun res!200273 () Bool)

(assert (=> b!360187 (=> (not res!200273) (not e!220573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360187 (= res!200273 (validKeyInArray!0 k!1077))))

(declare-fun b!360188 () Bool)

(declare-fun e!220577 () Bool)

(declare-fun e!220574 () Bool)

(declare-fun mapRes!13947 () Bool)

(assert (=> b!360188 (= e!220577 (and e!220574 mapRes!13947))))

(declare-fun condMapEmpty!13947 () Bool)

(declare-fun mapDefault!13947 () ValueCell!3803)

