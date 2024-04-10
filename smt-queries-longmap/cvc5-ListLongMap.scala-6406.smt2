; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82232 () Bool)

(assert start!82232)

(declare-fun b_free!18505 () Bool)

(declare-fun b_next!18505 () Bool)

(assert (=> start!82232 (= b_free!18505 (not b_next!18505))))

(declare-fun tp!64475 () Bool)

(declare-fun b_and!29993 () Bool)

(assert (=> start!82232 (= tp!64475 b_and!29993)))

(declare-fun b!958496 () Bool)

(declare-fun res!641584 () Bool)

(declare-fun e!540357 () Bool)

(assert (=> b!958496 (=> (not res!641584) (not e!540357))))

(declare-datatypes ((array!58521 0))(
  ( (array!58522 (arr!28134 (Array (_ BitVec 32) (_ BitVec 64))) (size!28613 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58521)

(declare-datatypes ((List!19558 0))(
  ( (Nil!19555) (Cons!19554 (h!20716 (_ BitVec 64)) (t!27921 List!19558)) )
))
(declare-fun arrayNoDuplicates!0 (array!58521 (_ BitVec 32) List!19558) Bool)

(assert (=> b!958496 (= res!641584 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19555))))

(declare-fun b!958497 () Bool)

(declare-fun e!540358 () Bool)

(declare-fun e!540360 () Bool)

(declare-fun mapRes!33796 () Bool)

(assert (=> b!958497 (= e!540358 (and e!540360 mapRes!33796))))

(declare-fun condMapEmpty!33796 () Bool)

(declare-datatypes ((V!33265 0))(
  ( (V!33266 (val!10656 Int)) )
))
(declare-datatypes ((ValueCell!10124 0))(
  ( (ValueCellFull!10124 (v!13213 V!33265)) (EmptyCell!10124) )
))
(declare-datatypes ((array!58523 0))(
  ( (array!58524 (arr!28135 (Array (_ BitVec 32) ValueCell!10124)) (size!28614 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58523)

(declare-fun mapDefault!33796 () ValueCell!10124)

