; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43232 () Bool)

(assert start!43232)

(declare-fun res!285789 () Bool)

(declare-fun e!281804 () Bool)

(assert (=> start!43232 (=> (not res!285789) (not e!281804))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43232 (= res!285789 (validMask!0 mask!2352))))

(assert (=> start!43232 e!281804))

(assert (=> start!43232 true))

(declare-datatypes ((V!19233 0))(
  ( (V!19234 (val!6858 Int)) )
))
(declare-datatypes ((ValueCell!6449 0))(
  ( (ValueCellFull!6449 (v!9147 V!19233)) (EmptyCell!6449) )
))
(declare-datatypes ((array!30915 0))(
  ( (array!30916 (arr!14865 (Array (_ BitVec 32) ValueCell!6449)) (size!15223 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30915)

(declare-fun e!281806 () Bool)

(declare-fun array_inv!10726 (array!30915) Bool)

(assert (=> start!43232 (and (array_inv!10726 _values!1516) e!281806)))

(declare-datatypes ((array!30917 0))(
  ( (array!30918 (arr!14866 (Array (_ BitVec 32) (_ BitVec 64))) (size!15224 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30917)

(declare-fun array_inv!10727 (array!30917) Bool)

(assert (=> start!43232 (array_inv!10727 _keys!1874)))

(declare-fun b!479076 () Bool)

(declare-fun res!285787 () Bool)

(assert (=> b!479076 (=> (not res!285787) (not e!281804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30917 (_ BitVec 32)) Bool)

(assert (=> b!479076 (= res!285787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479077 () Bool)

(declare-fun res!285788 () Bool)

(assert (=> b!479077 (=> (not res!285788) (not e!281804))))

(declare-datatypes ((List!9081 0))(
  ( (Nil!9078) (Cons!9077 (h!9933 (_ BitVec 64)) (t!15287 List!9081)) )
))
(declare-fun arrayNoDuplicates!0 (array!30917 (_ BitVec 32) List!9081) Bool)

(assert (=> b!479077 (= res!285788 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9078))))

(declare-fun b!479078 () Bool)

(declare-fun e!281805 () Bool)

(declare-fun mapRes!22126 () Bool)

(assert (=> b!479078 (= e!281806 (and e!281805 mapRes!22126))))

(declare-fun condMapEmpty!22126 () Bool)

(declare-fun mapDefault!22126 () ValueCell!6449)

