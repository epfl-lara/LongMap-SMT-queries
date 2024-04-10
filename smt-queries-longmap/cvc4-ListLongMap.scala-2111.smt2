; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35838 () Bool)

(assert start!35838)

(declare-fun b!360150 () Bool)

(declare-fun e!220561 () Bool)

(declare-fun tp_is_empty!8291 () Bool)

(assert (=> b!360150 (= e!220561 tp_is_empty!8291)))

(declare-fun b!360151 () Bool)

(declare-fun e!220562 () Bool)

(assert (=> b!360151 (= e!220562 tp_is_empty!8291)))

(declare-fun b!360153 () Bool)

(declare-fun res!200250 () Bool)

(declare-fun e!220559 () Bool)

(assert (=> b!360153 (=> (not res!200250) (not e!220559))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360153 (= res!200250 (validKeyInArray!0 k!1077))))

(declare-fun b!360154 () Bool)

(assert (=> b!360154 (= e!220559 (not true))))

(declare-datatypes ((array!20133 0))(
  ( (array!20134 (arr!9560 (Array (_ BitVec 32) (_ BitVec 64))) (size!9912 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20133)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360154 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12031 0))(
  ( (V!12032 (val!4190 Int)) )
))
(declare-fun minValue!1150 () V!12031)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3802 0))(
  ( (ValueCellFull!3802 (v!6384 V!12031)) (EmptyCell!3802) )
))
(declare-datatypes ((array!20135 0))(
  ( (array!20136 (arr!9561 (Array (_ BitVec 32) ValueCell!3802)) (size!9913 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20135)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12031)

(declare-datatypes ((Unit!11072 0))(
  ( (Unit!11073) )
))
(declare-fun lt!166424 () Unit!11072)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!51 (array!20133 array!20135 (_ BitVec 32) (_ BitVec 32) V!12031 V!12031 (_ BitVec 64) (_ BitVec 32)) Unit!11072)

(assert (=> b!360154 (= lt!166424 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!51 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!360155 () Bool)

(declare-fun e!220560 () Bool)

(declare-fun mapRes!13944 () Bool)

(assert (=> b!360155 (= e!220560 (and e!220561 mapRes!13944))))

(declare-fun condMapEmpty!13944 () Bool)

(declare-fun mapDefault!13944 () ValueCell!3802)

