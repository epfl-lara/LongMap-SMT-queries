; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35862 () Bool)

(assert start!35862)

(declare-fun b!360546 () Bool)

(declare-fun res!200538 () Bool)

(declare-fun e!220739 () Bool)

(assert (=> b!360546 (=> (not res!200538) (not e!220739))))

(declare-datatypes ((array!20181 0))(
  ( (array!20182 (arr!9584 (Array (_ BitVec 32) (_ BitVec 64))) (size!9936 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20181)

(declare-datatypes ((List!5491 0))(
  ( (Nil!5488) (Cons!5487 (h!6343 (_ BitVec 64)) (t!10641 List!5491)) )
))
(declare-fun arrayNoDuplicates!0 (array!20181 (_ BitVec 32) List!5491) Bool)

(assert (=> b!360546 (= res!200538 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5488))))

(declare-fun b!360547 () Bool)

(declare-fun res!200532 () Bool)

(assert (=> b!360547 (=> (not res!200532) (not e!220739))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!360547 (= res!200532 (not (= (select (arr!9584 _keys!1456) from!1805) k!1077)))))

(declare-fun b!360548 () Bool)

(assert (=> b!360548 (= e!220739 (not true))))

(declare-fun arrayContainsKey!0 (array!20181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360548 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12063 0))(
  ( (V!12064 (val!4202 Int)) )
))
(declare-fun minValue!1150 () V!12063)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11092 0))(
  ( (Unit!11093) )
))
(declare-fun lt!166460 () Unit!11092)

(declare-datatypes ((ValueCell!3814 0))(
  ( (ValueCellFull!3814 (v!6396 V!12063)) (EmptyCell!3814) )
))
(declare-datatypes ((array!20183 0))(
  ( (array!20184 (arr!9585 (Array (_ BitVec 32) ValueCell!3814)) (size!9937 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20183)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12063)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!61 (array!20181 array!20183 (_ BitVec 32) (_ BitVec 32) V!12063 V!12063 (_ BitVec 64) (_ BitVec 32)) Unit!11092)

(assert (=> b!360548 (= lt!166460 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!61 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!360549 () Bool)

(declare-fun e!220738 () Bool)

(declare-fun tp_is_empty!8315 () Bool)

(assert (=> b!360549 (= e!220738 tp_is_empty!8315)))

(declare-fun b!360550 () Bool)

(declare-fun e!220740 () Bool)

(declare-fun mapRes!13980 () Bool)

(assert (=> b!360550 (= e!220740 (and e!220738 mapRes!13980))))

(declare-fun condMapEmpty!13980 () Bool)

(declare-fun mapDefault!13980 () ValueCell!3814)

