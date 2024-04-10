; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111554 () Bool)

(assert start!111554)

(declare-fun b_free!30211 () Bool)

(declare-fun b_next!30211 () Bool)

(assert (=> start!111554 (= b_free!30211 (not b_next!30211))))

(declare-fun tp!106109 () Bool)

(declare-fun b_and!48581 () Bool)

(assert (=> start!111554 (= tp!106109 b_and!48581)))

(declare-fun b!1320910 () Bool)

(declare-fun res!876712 () Bool)

(declare-fun e!753422 () Bool)

(assert (=> b!1320910 (=> (not res!876712) (not e!753422))))

(declare-datatypes ((array!88992 0))(
  ( (array!88993 (arr!42970 (Array (_ BitVec 32) (_ BitVec 64))) (size!43520 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88992)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53145 0))(
  ( (V!53146 (val!18090 Int)) )
))
(declare-datatypes ((ValueCell!17117 0))(
  ( (ValueCellFull!17117 (v!20720 V!53145)) (EmptyCell!17117) )
))
(declare-datatypes ((array!88994 0))(
  ( (array!88995 (arr!42971 (Array (_ BitVec 32) ValueCell!17117)) (size!43521 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88994)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320910 (= res!876712 (and (= (size!43521 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43520 _keys!1609) (size!43521 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320911 () Bool)

(declare-fun res!876714 () Bool)

(assert (=> b!1320911 (=> (not res!876714) (not e!753422))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53145)

(declare-fun minValue!1279 () V!53145)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23296 0))(
  ( (tuple2!23297 (_1!11659 (_ BitVec 64)) (_2!11659 V!53145)) )
))
(declare-datatypes ((List!30446 0))(
  ( (Nil!30443) (Cons!30442 (h!31651 tuple2!23296) (t!44206 List!30446)) )
))
(declare-datatypes ((ListLongMap!20953 0))(
  ( (ListLongMap!20954 (toList!10492 List!30446)) )
))
(declare-fun contains!8647 (ListLongMap!20953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5495 (array!88992 array!88994 (_ BitVec 32) (_ BitVec 32) V!53145 V!53145 (_ BitVec 32) Int) ListLongMap!20953)

(assert (=> b!1320911 (= res!876714 (contains!8647 (getCurrentListMap!5495 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1320912 () Bool)

(declare-fun res!876715 () Bool)

(assert (=> b!1320912 (=> (not res!876715) (not e!753422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88992 (_ BitVec 32)) Bool)

(assert (=> b!1320912 (= res!876715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320913 () Bool)

(declare-fun e!753423 () Bool)

(declare-fun e!753421 () Bool)

(declare-fun mapRes!55694 () Bool)

(assert (=> b!1320913 (= e!753423 (and e!753421 mapRes!55694))))

(declare-fun condMapEmpty!55694 () Bool)

(declare-fun mapDefault!55694 () ValueCell!17117)

