; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3740 () Bool)

(assert start!3740)

(declare-fun b!26125 () Bool)

(declare-fun e!16964 () Bool)

(declare-datatypes ((List!580 0))(
  ( (Nil!577) (Cons!576 (h!1143 (_ BitVec 64)) (t!3267 List!580)) )
))
(declare-fun contains!238 (List!580 (_ BitVec 64)) Bool)

(assert (=> b!26125 (= e!16964 (contains!238 Nil!577 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26126 () Bool)

(declare-fun e!16961 () Bool)

(declare-fun tp_is_empty!1073 () Bool)

(assert (=> b!26126 (= e!16961 tp_is_empty!1073)))

(declare-fun b!26127 () Bool)

(declare-fun res!15533 () Bool)

(declare-fun e!16965 () Bool)

(assert (=> b!26127 (=> (not res!15533) (not e!16965))))

(declare-datatypes ((array!1391 0))(
  ( (array!1392 (arr!654 (Array (_ BitVec 32) (_ BitVec 64))) (size!755 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1391)

(assert (=> b!26127 (= res!15533 (and (bvsle #b00000000000000000000000000000000 (size!755 _keys!1833)) (bvslt (size!755 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!26128 () Bool)

(declare-fun e!16962 () Bool)

(assert (=> b!26128 (= e!16962 tp_is_empty!1073)))

(declare-fun b!26129 () Bool)

(declare-fun res!15538 () Bool)

(assert (=> b!26129 (=> (not res!15538) (not e!16965))))

(declare-datatypes ((V!1255 0))(
  ( (V!1256 (val!563 Int)) )
))
(declare-datatypes ((ValueCell!337 0))(
  ( (ValueCellFull!337 (v!1648 V!1255)) (EmptyCell!337) )
))
(declare-datatypes ((array!1393 0))(
  ( (array!1394 (arr!655 (Array (_ BitVec 32) ValueCell!337)) (size!756 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1393)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26129 (= res!15538 (and (= (size!756 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!755 _keys!1833) (size!756 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26130 () Bool)

(declare-fun res!15534 () Bool)

(assert (=> b!26130 (=> (not res!15534) (not e!16965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1391 (_ BitVec 32)) Bool)

(assert (=> b!26130 (= res!15534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26131 () Bool)

(declare-fun res!15536 () Bool)

(assert (=> b!26131 (=> (not res!15536) (not e!16965))))

(declare-fun noDuplicate!15 (List!580) Bool)

(assert (=> b!26131 (= res!15536 (noDuplicate!15 Nil!577))))

(declare-fun res!15537 () Bool)

(assert (=> start!3740 (=> (not res!15537) (not e!16965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3740 (= res!15537 (validMask!0 mask!2294))))

(assert (=> start!3740 e!16965))

(assert (=> start!3740 true))

(declare-fun e!16963 () Bool)

(declare-fun array_inv!443 (array!1393) Bool)

(assert (=> start!3740 (and (array_inv!443 _values!1501) e!16963)))

(declare-fun array_inv!444 (array!1391) Bool)

(assert (=> start!3740 (array_inv!444 _keys!1833)))

(declare-fun b!26132 () Bool)

(assert (=> b!26132 (= e!16965 e!16964)))

(declare-fun res!15535 () Bool)

(assert (=> b!26132 (=> res!15535 e!16964)))

(assert (=> b!26132 (= res!15535 (contains!238 Nil!577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!1123 () Bool)

(declare-fun mapRes!1123 () Bool)

(assert (=> mapIsEmpty!1123 mapRes!1123))

(declare-fun b!26133 () Bool)

(assert (=> b!26133 (= e!16963 (and e!16961 mapRes!1123))))

(declare-fun condMapEmpty!1123 () Bool)

(declare-fun mapDefault!1123 () ValueCell!337)

