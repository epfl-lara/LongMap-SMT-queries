; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82538 () Bool)

(assert start!82538)

(declare-fun b!961844 () Bool)

(declare-fun res!643691 () Bool)

(declare-fun e!542418 () Bool)

(assert (=> b!961844 (=> (not res!643691) (not e!542418))))

(declare-datatypes ((array!59043 0))(
  ( (array!59044 (arr!28390 (Array (_ BitVec 32) (_ BitVec 64))) (size!28869 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59043)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59043 (_ BitVec 32)) Bool)

(assert (=> b!961844 (= res!643691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961845 () Bool)

(declare-fun res!643692 () Bool)

(assert (=> b!961845 (=> (not res!643692) (not e!542418))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33613 0))(
  ( (V!33614 (val!10787 Int)) )
))
(declare-datatypes ((ValueCell!10255 0))(
  ( (ValueCellFull!10255 (v!13345 V!33613)) (EmptyCell!10255) )
))
(declare-datatypes ((array!59045 0))(
  ( (array!59046 (arr!28391 (Array (_ BitVec 32) ValueCell!10255)) (size!28870 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59045)

(assert (=> b!961845 (= res!643692 (and (= (size!28870 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28869 _keys!1686) (size!28870 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961846 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!961846 (= e!542418 (bvsgt from!2084 (size!28869 _keys!1686)))))

(declare-fun mapIsEmpty!34204 () Bool)

(declare-fun mapRes!34204 () Bool)

(assert (=> mapIsEmpty!34204 mapRes!34204))

(declare-fun b!961847 () Bool)

(declare-fun e!542420 () Bool)

(declare-fun tp_is_empty!21473 () Bool)

(assert (=> b!961847 (= e!542420 tp_is_empty!21473)))

(declare-fun b!961848 () Bool)

(declare-fun res!643688 () Bool)

(assert (=> b!961848 (=> (not res!643688) (not e!542418))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!961848 (= res!643688 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28869 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28869 _keys!1686))))))

(declare-fun res!643690 () Bool)

(assert (=> start!82538 (=> (not res!643690) (not e!542418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82538 (= res!643690 (validMask!0 mask!2110))))

(assert (=> start!82538 e!542418))

(assert (=> start!82538 true))

(declare-fun e!542417 () Bool)

(declare-fun array_inv!21999 (array!59045) Bool)

(assert (=> start!82538 (and (array_inv!21999 _values!1400) e!542417)))

(declare-fun array_inv!22000 (array!59043) Bool)

(assert (=> start!82538 (array_inv!22000 _keys!1686)))

(declare-fun b!961849 () Bool)

(declare-fun e!542419 () Bool)

(assert (=> b!961849 (= e!542417 (and e!542419 mapRes!34204))))

(declare-fun condMapEmpty!34204 () Bool)

(declare-fun mapDefault!34204 () ValueCell!10255)

