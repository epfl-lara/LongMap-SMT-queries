; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35832 () Bool)

(assert start!35832)

(declare-fun b!360051 () Bool)

(declare-fun res!200173 () Bool)

(declare-fun e!220517 () Bool)

(assert (=> b!360051 (=> (not res!200173) (not e!220517))))

(declare-datatypes ((array!20123 0))(
  ( (array!20124 (arr!9555 (Array (_ BitVec 32) (_ BitVec 64))) (size!9907 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20123)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20123 (_ BitVec 32)) Bool)

(assert (=> b!360051 (= res!200173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360052 () Bool)

(declare-fun res!200177 () Bool)

(assert (=> b!360052 (=> (not res!200177) (not e!220517))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!12023 0))(
  ( (V!12024 (val!4187 Int)) )
))
(declare-datatypes ((ValueCell!3799 0))(
  ( (ValueCellFull!3799 (v!6381 V!12023)) (EmptyCell!3799) )
))
(declare-datatypes ((array!20125 0))(
  ( (array!20126 (arr!9556 (Array (_ BitVec 32) ValueCell!3799)) (size!9908 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20125)

(assert (=> b!360052 (= res!200177 (and (= (size!9908 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9907 _keys!1456) (size!9908 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360053 () Bool)

(assert (=> b!360053 (= e!220517 (not true))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360053 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12023)

(declare-fun zeroValue!1150 () V!12023)

(declare-datatypes ((Unit!11068 0))(
  ( (Unit!11069) )
))
(declare-fun lt!166415 () Unit!11068)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!49 (array!20123 array!20125 (_ BitVec 32) (_ BitVec 32) V!12023 V!12023 (_ BitVec 64) (_ BitVec 32)) Unit!11068)

(assert (=> b!360053 (= lt!166415 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!49 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!360054 () Bool)

(declare-fun e!220516 () Bool)

(declare-fun e!220514 () Bool)

(declare-fun mapRes!13935 () Bool)

(assert (=> b!360054 (= e!220516 (and e!220514 mapRes!13935))))

(declare-fun condMapEmpty!13935 () Bool)

(declare-fun mapDefault!13935 () ValueCell!3799)

