; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106988 () Bool)

(assert start!106988)

(declare-fun res!844328 () Bool)

(declare-fun e!722910 () Bool)

(assert (=> start!106988 (=> (not res!844328) (not e!722910))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106988 (= res!844328 (validMask!0 mask!1730))))

(assert (=> start!106988 e!722910))

(declare-datatypes ((V!48763 0))(
  ( (V!48764 (val!16413 Int)) )
))
(declare-datatypes ((ValueCell!15485 0))(
  ( (ValueCellFull!15485 (v!19050 V!48763)) (EmptyCell!15485) )
))
(declare-datatypes ((array!82626 0))(
  ( (array!82627 (arr!39850 (Array (_ BitVec 32) ValueCell!15485)) (size!40386 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82626)

(declare-fun e!722912 () Bool)

(declare-fun array_inv!30321 (array!82626) Bool)

(assert (=> start!106988 (and (array_inv!30321 _values!1134) e!722912)))

(assert (=> start!106988 true))

(declare-datatypes ((array!82628 0))(
  ( (array!82629 (arr!39851 (Array (_ BitVec 32) (_ BitVec 64))) (size!40387 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82628)

(declare-fun array_inv!30322 (array!82628) Bool)

(assert (=> start!106988 (array_inv!30322 _keys!1364)))

(declare-fun b!1268591 () Bool)

(declare-fun res!844326 () Bool)

(assert (=> b!1268591 (=> (not res!844326) (not e!722910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82628 (_ BitVec 32)) Bool)

(assert (=> b!1268591 (= res!844326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268592 () Bool)

(declare-fun e!722911 () Bool)

(declare-fun tp_is_empty!32677 () Bool)

(assert (=> b!1268592 (= e!722911 tp_is_empty!32677)))

(declare-fun b!1268593 () Bool)

(declare-fun e!722909 () Bool)

(assert (=> b!1268593 (= e!722909 tp_is_empty!32677)))

(declare-fun b!1268594 () Bool)

(declare-fun mapRes!50596 () Bool)

(assert (=> b!1268594 (= e!722912 (and e!722911 mapRes!50596))))

(declare-fun condMapEmpty!50596 () Bool)

(declare-fun mapDefault!50596 () ValueCell!15485)

