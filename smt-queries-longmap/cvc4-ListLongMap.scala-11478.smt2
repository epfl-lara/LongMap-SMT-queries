; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133670 () Bool)

(assert start!133670)

(declare-fun res!1068495 () Bool)

(declare-fun e!870987 () Bool)

(assert (=> start!133670 (=> (not res!1068495) (not e!870987))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133670 (= res!1068495 (validMask!0 mask!947))))

(assert (=> start!133670 e!870987))

(assert (=> start!133670 true))

(declare-datatypes ((V!59877 0))(
  ( (V!59878 (val!19460 Int)) )
))
(declare-datatypes ((ValueCell!18346 0))(
  ( (ValueCellFull!18346 (v!22212 V!59877)) (EmptyCell!18346) )
))
(declare-datatypes ((array!104212 0))(
  ( (array!104213 (arr!50298 (Array (_ BitVec 32) ValueCell!18346)) (size!50848 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104212)

(declare-fun e!870984 () Bool)

(declare-fun array_inv!39095 (array!104212) Bool)

(assert (=> start!133670 (and (array_inv!39095 _values!487) e!870984)))

(declare-datatypes ((array!104214 0))(
  ( (array!104215 (arr!50299 (Array (_ BitVec 32) (_ BitVec 64))) (size!50849 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104214)

(declare-fun array_inv!39096 (array!104214) Bool)

(assert (=> start!133670 (array_inv!39096 _keys!637)))

(declare-fun b!1562886 () Bool)

(declare-fun res!1068493 () Bool)

(assert (=> b!1562886 (=> (not res!1068493) (not e!870987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104214 (_ BitVec 32)) Bool)

(assert (=> b!1562886 (= res!1068493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562887 () Bool)

(declare-fun e!870985 () Bool)

(declare-fun tp_is_empty!38753 () Bool)

(assert (=> b!1562887 (= e!870985 tp_is_empty!38753)))

(declare-fun b!1562888 () Bool)

(declare-fun e!870988 () Bool)

(assert (=> b!1562888 (= e!870988 tp_is_empty!38753)))

(declare-fun b!1562889 () Bool)

(declare-fun mapRes!59505 () Bool)

(assert (=> b!1562889 (= e!870984 (and e!870985 mapRes!59505))))

(declare-fun condMapEmpty!59505 () Bool)

(declare-fun mapDefault!59505 () ValueCell!18346)

