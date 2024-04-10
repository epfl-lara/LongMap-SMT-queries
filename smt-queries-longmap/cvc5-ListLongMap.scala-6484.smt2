; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82744 () Bool)

(assert start!82744)

(declare-fun b_free!18877 () Bool)

(declare-fun b_next!18877 () Bool)

(assert (=> start!82744 (= b_free!18877 (not b_next!18877))))

(declare-fun tp!65751 () Bool)

(declare-fun b_and!30365 () Bool)

(assert (=> start!82744 (= tp!65751 b_and!30365)))

(declare-fun res!646005 () Bool)

(declare-fun e!544043 () Bool)

(assert (=> start!82744 (=> (not res!646005) (not e!544043))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82744 (= res!646005 (validMask!0 mask!2110))))

(assert (=> start!82744 e!544043))

(assert (=> start!82744 true))

(declare-datatypes ((V!33889 0))(
  ( (V!33890 (val!10890 Int)) )
))
(declare-datatypes ((ValueCell!10358 0))(
  ( (ValueCellFull!10358 (v!13448 V!33889)) (EmptyCell!10358) )
))
(declare-datatypes ((array!59443 0))(
  ( (array!59444 (arr!28590 (Array (_ BitVec 32) ValueCell!10358)) (size!29069 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59443)

(declare-fun e!544044 () Bool)

(declare-fun array_inv!22139 (array!59443) Bool)

(assert (=> start!82744 (and (array_inv!22139 _values!1400) e!544044)))

(declare-datatypes ((array!59445 0))(
  ( (array!59446 (arr!28591 (Array (_ BitVec 32) (_ BitVec 64))) (size!29070 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59445)

(declare-fun array_inv!22140 (array!59445) Bool)

(assert (=> start!82744 (array_inv!22140 _keys!1686)))

(assert (=> start!82744 tp!65751))

(declare-fun tp_is_empty!21679 () Bool)

(assert (=> start!82744 tp_is_empty!21679))

(declare-fun mapIsEmpty!34513 () Bool)

(declare-fun mapRes!34513 () Bool)

(assert (=> mapIsEmpty!34513 mapRes!34513))

(declare-fun b!965084 () Bool)

(declare-fun e!544046 () Bool)

(assert (=> b!965084 (= e!544046 tp_is_empty!21679)))

(declare-fun b!965085 () Bool)

(assert (=> b!965085 (= e!544044 (and e!544046 mapRes!34513))))

(declare-fun condMapEmpty!34513 () Bool)

(declare-fun mapDefault!34513 () ValueCell!10358)

