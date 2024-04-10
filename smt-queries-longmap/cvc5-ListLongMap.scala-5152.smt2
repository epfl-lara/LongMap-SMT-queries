; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69876 () Bool)

(assert start!69876)

(declare-fun b!812448 () Bool)

(declare-fun e!450003 () Bool)

(declare-fun tp_is_empty!14029 () Bool)

(assert (=> b!812448 (= e!450003 tp_is_empty!14029)))

(declare-fun b!812449 () Bool)

(declare-fun res!555181 () Bool)

(declare-fun e!450001 () Bool)

(assert (=> b!812449 (=> (not res!555181) (not e!450001))))

(declare-datatypes ((array!44282 0))(
  ( (array!44283 (arr!21203 (Array (_ BitVec 32) (_ BitVec 64))) (size!21624 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44282)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44282 (_ BitVec 32)) Bool)

(assert (=> b!812449 (= res!555181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555183 () Bool)

(assert (=> start!69876 (=> (not res!555183) (not e!450001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69876 (= res!555183 (validMask!0 mask!1312))))

(assert (=> start!69876 e!450001))

(declare-fun array_inv!16987 (array!44282) Bool)

(assert (=> start!69876 (array_inv!16987 _keys!976)))

(assert (=> start!69876 true))

(declare-datatypes ((V!23707 0))(
  ( (V!23708 (val!7062 Int)) )
))
(declare-datatypes ((ValueCell!6599 0))(
  ( (ValueCellFull!6599 (v!9489 V!23707)) (EmptyCell!6599) )
))
(declare-datatypes ((array!44284 0))(
  ( (array!44285 (arr!21204 (Array (_ BitVec 32) ValueCell!6599)) (size!21625 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44284)

(declare-fun e!450000 () Bool)

(declare-fun array_inv!16988 (array!44284) Bool)

(assert (=> start!69876 (and (array_inv!16988 _values!788) e!450000)))

(declare-fun b!812450 () Bool)

(declare-fun mapRes!22618 () Bool)

(assert (=> b!812450 (= e!450000 (and e!450003 mapRes!22618))))

(declare-fun condMapEmpty!22618 () Bool)

(declare-fun mapDefault!22618 () ValueCell!6599)

