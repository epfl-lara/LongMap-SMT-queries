; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35810 () Bool)

(assert start!35810)

(declare-fun mapNonEmpty!13902 () Bool)

(declare-fun mapRes!13902 () Bool)

(declare-fun tp!27969 () Bool)

(declare-fun e!220351 () Bool)

(assert (=> mapNonEmpty!13902 (= mapRes!13902 (and tp!27969 e!220351))))

(declare-fun mapKey!13902 () (_ BitVec 32))

(declare-datatypes ((V!11995 0))(
  ( (V!11996 (val!4176 Int)) )
))
(declare-datatypes ((ValueCell!3788 0))(
  ( (ValueCellFull!3788 (v!6370 V!11995)) (EmptyCell!3788) )
))
(declare-datatypes ((array!20079 0))(
  ( (array!20080 (arr!9533 (Array (_ BitVec 32) ValueCell!3788)) (size!9885 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20079)

(declare-fun mapRest!13902 () (Array (_ BitVec 32) ValueCell!3788))

(declare-fun mapValue!13902 () ValueCell!3788)

(assert (=> mapNonEmpty!13902 (= (arr!9533 _values!1208) (store mapRest!13902 mapKey!13902 mapValue!13902))))

(declare-fun b!359688 () Bool)

(declare-fun res!199914 () Bool)

(declare-fun e!220352 () Bool)

(assert (=> b!359688 (=> (not res!199914) (not e!220352))))

(declare-datatypes ((array!20081 0))(
  ( (array!20082 (arr!9534 (Array (_ BitVec 32) (_ BitVec 64))) (size!9886 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20081)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359688 (= res!199914 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!359689 () Bool)

(assert (=> b!359689 (= e!220352 (not true))))

(assert (=> b!359689 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11995)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11054 0))(
  ( (Unit!11055) )
))
(declare-fun lt!166382 () Unit!11054)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11995)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!42 (array!20081 array!20079 (_ BitVec 32) (_ BitVec 32) V!11995 V!11995 (_ BitVec 64) (_ BitVec 32)) Unit!11054)

(assert (=> b!359689 (= lt!166382 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!42 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!359691 () Bool)

(declare-fun res!199915 () Bool)

(assert (=> b!359691 (=> (not res!199915) (not e!220352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20081 (_ BitVec 32)) Bool)

(assert (=> b!359691 (= res!199915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359692 () Bool)

(declare-fun res!199909 () Bool)

(assert (=> b!359692 (=> (not res!199909) (not e!220352))))

(declare-datatypes ((List!5476 0))(
  ( (Nil!5473) (Cons!5472 (h!6328 (_ BitVec 64)) (t!10626 List!5476)) )
))
(declare-fun arrayNoDuplicates!0 (array!20081 (_ BitVec 32) List!5476) Bool)

(assert (=> b!359692 (= res!199909 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5473))))

(declare-fun b!359693 () Bool)

(declare-fun res!199910 () Bool)

(assert (=> b!359693 (=> (not res!199910) (not e!220352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359693 (= res!199910 (validKeyInArray!0 k!1077))))

(declare-fun b!359694 () Bool)

(declare-fun e!220350 () Bool)

(declare-fun e!220349 () Bool)

(assert (=> b!359694 (= e!220350 (and e!220349 mapRes!13902))))

(declare-fun condMapEmpty!13902 () Bool)

(declare-fun mapDefault!13902 () ValueCell!3788)

