; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35564 () Bool)

(assert start!35564)

(declare-fun b!356493 () Bool)

(declare-fun res!197827 () Bool)

(declare-fun e!218425 () Bool)

(assert (=> b!356493 (=> (not res!197827) (not e!218425))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356493 (= res!197827 (validKeyInArray!0 k!1077))))

(declare-fun b!356494 () Bool)

(declare-fun res!197823 () Bool)

(assert (=> b!356494 (=> (not res!197823) (not e!218425))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19603 0))(
  ( (array!19604 (arr!9295 (Array (_ BitVec 32) (_ BitVec 64))) (size!9647 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19603)

(assert (=> b!356494 (= res!197823 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9647 _keys!1456))))))

(declare-fun b!356495 () Bool)

(declare-fun e!218426 () Bool)

(declare-fun tp_is_empty!8017 () Bool)

(assert (=> b!356495 (= e!218426 tp_is_empty!8017)))

(declare-fun mapNonEmpty!13533 () Bool)

(declare-fun mapRes!13533 () Bool)

(declare-fun tp!27510 () Bool)

(assert (=> mapNonEmpty!13533 (= mapRes!13533 (and tp!27510 e!218426))))

(declare-datatypes ((V!11667 0))(
  ( (V!11668 (val!4053 Int)) )
))
(declare-datatypes ((ValueCell!3665 0))(
  ( (ValueCellFull!3665 (v!6247 V!11667)) (EmptyCell!3665) )
))
(declare-fun mapRest!13533 () (Array (_ BitVec 32) ValueCell!3665))

(declare-fun mapValue!13533 () ValueCell!3665)

(declare-fun mapKey!13533 () (_ BitVec 32))

(declare-datatypes ((array!19605 0))(
  ( (array!19606 (arr!9296 (Array (_ BitVec 32) ValueCell!3665)) (size!9648 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19605)

(assert (=> mapNonEmpty!13533 (= (arr!9296 _values!1208) (store mapRest!13533 mapKey!13533 mapValue!13533))))

(declare-fun b!356496 () Bool)

(declare-fun res!197825 () Bool)

(assert (=> b!356496 (=> (not res!197825) (not e!218425))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19603 (_ BitVec 32)) Bool)

(assert (=> b!356496 (= res!197825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356497 () Bool)

(declare-fun res!197826 () Bool)

(assert (=> b!356497 (=> (not res!197826) (not e!218425))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356497 (= res!197826 (and (= (size!9648 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9647 _keys!1456) (size!9648 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356498 () Bool)

(declare-fun e!218424 () Bool)

(declare-fun e!218423 () Bool)

(assert (=> b!356498 (= e!218424 (and e!218423 mapRes!13533))))

(declare-fun condMapEmpty!13533 () Bool)

(declare-fun mapDefault!13533 () ValueCell!3665)

