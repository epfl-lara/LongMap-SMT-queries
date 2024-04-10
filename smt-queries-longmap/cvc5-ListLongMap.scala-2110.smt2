; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35828 () Bool)

(assert start!35828)

(declare-fun b!359985 () Bool)

(declare-fun res!200126 () Bool)

(declare-fun e!220486 () Bool)

(assert (=> b!359985 (=> (not res!200126) (not e!220486))))

(declare-datatypes ((array!20115 0))(
  ( (array!20116 (arr!9551 (Array (_ BitVec 32) (_ BitVec 64))) (size!9903 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20115)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20115 (_ BitVec 32)) Bool)

(assert (=> b!359985 (= res!200126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!200129 () Bool)

(assert (=> start!35828 (=> (not res!200129) (not e!220486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35828 (= res!200129 (validMask!0 mask!1842))))

(assert (=> start!35828 e!220486))

(declare-fun tp_is_empty!8281 () Bool)

(assert (=> start!35828 tp_is_empty!8281))

(assert (=> start!35828 true))

(declare-fun array_inv!7028 (array!20115) Bool)

(assert (=> start!35828 (array_inv!7028 _keys!1456)))

(declare-datatypes ((V!12019 0))(
  ( (V!12020 (val!4185 Int)) )
))
(declare-datatypes ((ValueCell!3797 0))(
  ( (ValueCellFull!3797 (v!6379 V!12019)) (EmptyCell!3797) )
))
(declare-datatypes ((array!20117 0))(
  ( (array!20118 (arr!9552 (Array (_ BitVec 32) ValueCell!3797)) (size!9904 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20117)

(declare-fun e!220483 () Bool)

(declare-fun array_inv!7029 (array!20117) Bool)

(assert (=> start!35828 (and (array_inv!7029 _values!1208) e!220483)))

(declare-fun b!359986 () Bool)

(declare-fun res!200130 () Bool)

(assert (=> b!359986 (=> (not res!200130) (not e!220486))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359986 (= res!200130 (and (= (size!9904 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9903 _keys!1456) (size!9904 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359987 () Bool)

(declare-fun res!200131 () Bool)

(assert (=> b!359987 (=> (not res!200131) (not e!220486))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359987 (= res!200131 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!359988 () Bool)

(declare-fun res!200125 () Bool)

(assert (=> b!359988 (=> (not res!200125) (not e!220486))))

(assert (=> b!359988 (= res!200125 (not (= (select (arr!9551 _keys!1456) from!1805) k!1077)))))

(declare-fun b!359989 () Bool)

(declare-fun e!220487 () Bool)

(assert (=> b!359989 (= e!220487 tp_is_empty!8281)))

(declare-fun b!359990 () Bool)

(declare-fun e!220485 () Bool)

(assert (=> b!359990 (= e!220485 tp_is_empty!8281)))

(declare-fun b!359991 () Bool)

(declare-fun mapRes!13929 () Bool)

(assert (=> b!359991 (= e!220483 (and e!220485 mapRes!13929))))

(declare-fun condMapEmpty!13929 () Bool)

(declare-fun mapDefault!13929 () ValueCell!3797)

