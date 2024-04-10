; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35598 () Bool)

(assert start!35598)

(declare-fun b!357054 () Bool)

(declare-fun res!198230 () Bool)

(declare-fun e!218680 () Bool)

(assert (=> b!357054 (=> (not res!198230) (not e!218680))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357054 (= res!198230 (validKeyInArray!0 k!1077))))

(declare-fun res!198229 () Bool)

(assert (=> start!35598 (=> (not res!198229) (not e!218680))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35598 (= res!198229 (validMask!0 mask!1842))))

(assert (=> start!35598 e!218680))

(declare-fun tp_is_empty!8051 () Bool)

(assert (=> start!35598 tp_is_empty!8051))

(assert (=> start!35598 true))

(declare-datatypes ((array!19669 0))(
  ( (array!19670 (arr!9328 (Array (_ BitVec 32) (_ BitVec 64))) (size!9680 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19669)

(declare-fun array_inv!6858 (array!19669) Bool)

(assert (=> start!35598 (array_inv!6858 _keys!1456)))

(declare-datatypes ((V!11711 0))(
  ( (V!11712 (val!4070 Int)) )
))
(declare-datatypes ((ValueCell!3682 0))(
  ( (ValueCellFull!3682 (v!6264 V!11711)) (EmptyCell!3682) )
))
(declare-datatypes ((array!19671 0))(
  ( (array!19672 (arr!9329 (Array (_ BitVec 32) ValueCell!3682)) (size!9681 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19671)

(declare-fun e!218678 () Bool)

(declare-fun array_inv!6859 (array!19671) Bool)

(assert (=> start!35598 (and (array_inv!6859 _values!1208) e!218678)))

(declare-fun b!357055 () Bool)

(assert (=> b!357055 (= e!218680 (not true))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357055 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11711)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11711)

(declare-datatypes ((Unit!10998 0))(
  ( (Unit!10999) )
))
(declare-fun lt!165992 () Unit!10998)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!18 (array!19669 array!19671 (_ BitVec 32) (_ BitVec 32) V!11711 V!11711 (_ BitVec 64) (_ BitVec 32)) Unit!10998)

(assert (=> b!357055 (= lt!165992 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!18 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357056 () Bool)

(declare-fun res!198235 () Bool)

(assert (=> b!357056 (=> (not res!198235) (not e!218680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19669 (_ BitVec 32)) Bool)

(assert (=> b!357056 (= res!198235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357057 () Bool)

(declare-fun res!198234 () Bool)

(assert (=> b!357057 (=> (not res!198234) (not e!218680))))

(assert (=> b!357057 (= res!198234 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun mapIsEmpty!13584 () Bool)

(declare-fun mapRes!13584 () Bool)

(assert (=> mapIsEmpty!13584 mapRes!13584))

(declare-fun b!357058 () Bool)

(declare-fun res!198228 () Bool)

(assert (=> b!357058 (=> (not res!198228) (not e!218680))))

(assert (=> b!357058 (= res!198228 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9680 _keys!1456))))))

(declare-fun b!357059 () Bool)

(declare-fun e!218681 () Bool)

(assert (=> b!357059 (= e!218678 (and e!218681 mapRes!13584))))

(declare-fun condMapEmpty!13584 () Bool)

(declare-fun mapDefault!13584 () ValueCell!3682)

