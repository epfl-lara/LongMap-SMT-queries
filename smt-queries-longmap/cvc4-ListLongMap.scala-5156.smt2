; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69904 () Bool)

(assert start!69904)

(declare-fun res!555309 () Bool)

(declare-fun e!450211 () Bool)

(assert (=> start!69904 (=> (not res!555309) (not e!450211))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69904 (= res!555309 (validMask!0 mask!1312))))

(assert (=> start!69904 e!450211))

(declare-datatypes ((array!44332 0))(
  ( (array!44333 (arr!21228 (Array (_ BitVec 32) (_ BitVec 64))) (size!21649 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44332)

(declare-fun array_inv!17007 (array!44332) Bool)

(assert (=> start!69904 (array_inv!17007 _keys!976)))

(assert (=> start!69904 true))

(declare-datatypes ((V!23743 0))(
  ( (V!23744 (val!7076 Int)) )
))
(declare-datatypes ((ValueCell!6613 0))(
  ( (ValueCellFull!6613 (v!9503 V!23743)) (EmptyCell!6613) )
))
(declare-datatypes ((array!44334 0))(
  ( (array!44335 (arr!21229 (Array (_ BitVec 32) ValueCell!6613)) (size!21650 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44334)

(declare-fun e!450210 () Bool)

(declare-fun array_inv!17008 (array!44334) Bool)

(assert (=> start!69904 (and (array_inv!17008 _values!788) e!450210)))

(declare-fun b!812700 () Bool)

(declare-fun e!450209 () Bool)

(declare-fun tp_is_empty!14057 () Bool)

(assert (=> b!812700 (= e!450209 tp_is_empty!14057)))

(declare-fun b!812701 () Bool)

(declare-fun res!555308 () Bool)

(assert (=> b!812701 (=> (not res!555308) (not e!450211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44332 (_ BitVec 32)) Bool)

(assert (=> b!812701 (= res!555308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812702 () Bool)

(declare-fun mapRes!22660 () Bool)

(assert (=> b!812702 (= e!450210 (and e!450209 mapRes!22660))))

(declare-fun condMapEmpty!22660 () Bool)

(declare-fun mapDefault!22660 () ValueCell!6613)

