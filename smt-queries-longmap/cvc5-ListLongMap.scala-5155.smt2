; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69894 () Bool)

(assert start!69894)

(declare-fun res!555262 () Bool)

(declare-fun e!450138 () Bool)

(assert (=> start!69894 (=> (not res!555262) (not e!450138))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69894 (= res!555262 (validMask!0 mask!1312))))

(assert (=> start!69894 e!450138))

(declare-datatypes ((array!44314 0))(
  ( (array!44315 (arr!21219 (Array (_ BitVec 32) (_ BitVec 64))) (size!21640 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44314)

(declare-fun array_inv!16999 (array!44314) Bool)

(assert (=> start!69894 (array_inv!16999 _keys!976)))

(assert (=> start!69894 true))

(declare-datatypes ((V!23731 0))(
  ( (V!23732 (val!7071 Int)) )
))
(declare-datatypes ((ValueCell!6608 0))(
  ( (ValueCellFull!6608 (v!9498 V!23731)) (EmptyCell!6608) )
))
(declare-datatypes ((array!44316 0))(
  ( (array!44317 (arr!21220 (Array (_ BitVec 32) ValueCell!6608)) (size!21641 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44316)

(declare-fun e!450135 () Bool)

(declare-fun array_inv!17000 (array!44316) Bool)

(assert (=> start!69894 (and (array_inv!17000 _values!788) e!450135)))

(declare-fun b!812610 () Bool)

(declare-fun e!450137 () Bool)

(declare-fun tp_is_empty!14047 () Bool)

(assert (=> b!812610 (= e!450137 tp_is_empty!14047)))

(declare-fun b!812611 () Bool)

(declare-fun e!450134 () Bool)

(declare-fun mapRes!22645 () Bool)

(assert (=> b!812611 (= e!450135 (and e!450134 mapRes!22645))))

(declare-fun condMapEmpty!22645 () Bool)

(declare-fun mapDefault!22645 () ValueCell!6608)

