; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4044 () Bool)

(assert start!4044)

(declare-fun b_free!949 () Bool)

(declare-fun b_next!949 () Bool)

(assert (=> start!4044 (= b_free!949 (not b_next!949))))

(declare-fun tp!4267 () Bool)

(declare-fun b_and!1759 () Bool)

(assert (=> start!4044 (= tp!4267 b_and!1759)))

(declare-fun res!17794 () Bool)

(declare-fun e!19127 () Bool)

(assert (=> start!4044 (=> (not res!17794) (not e!19127))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4044 (= res!17794 (validMask!0 mask!2294))))

(assert (=> start!4044 e!19127))

(assert (=> start!4044 true))

(assert (=> start!4044 tp!4267))

(declare-datatypes ((V!1563 0))(
  ( (V!1564 (val!678 Int)) )
))
(declare-datatypes ((ValueCell!452 0))(
  ( (ValueCellFull!452 (v!1767 V!1563)) (EmptyCell!452) )
))
(declare-datatypes ((array!1837 0))(
  ( (array!1838 (arr!872 (Array (_ BitVec 32) ValueCell!452)) (size!973 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1837)

(declare-fun e!19128 () Bool)

(declare-fun array_inv!607 (array!1837) Bool)

(assert (=> start!4044 (and (array_inv!607 _values!1501) e!19128)))

(declare-datatypes ((array!1839 0))(
  ( (array!1840 (arr!873 (Array (_ BitVec 32) (_ BitVec 64))) (size!974 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1839)

(declare-fun array_inv!608 (array!1839) Bool)

(assert (=> start!4044 (array_inv!608 _keys!1833)))

(declare-fun tp_is_empty!1303 () Bool)

(assert (=> start!4044 tp_is_empty!1303))

(declare-fun b!29643 () Bool)

(declare-fun res!17796 () Bool)

(assert (=> b!29643 (=> (not res!17796) (not e!19127))))

(declare-datatypes ((List!723 0))(
  ( (Nil!720) (Cons!719 (h!1286 (_ BitVec 64)) (t!3416 List!723)) )
))
(declare-fun arrayNoDuplicates!0 (array!1839 (_ BitVec 32) List!723) Bool)

(assert (=> b!29643 (= res!17796 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!720))))

(declare-fun b!29644 () Bool)

(declare-fun res!17791 () Bool)

(assert (=> b!29644 (=> (not res!17791) (not e!19127))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29644 (= res!17791 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29645 () Bool)

(assert (=> b!29645 (= e!19127 (not (= (size!974 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun b!29646 () Bool)

(declare-fun e!19130 () Bool)

(declare-fun mapRes!1483 () Bool)

(assert (=> b!29646 (= e!19128 (and e!19130 mapRes!1483))))

(declare-fun condMapEmpty!1483 () Bool)

(declare-fun mapDefault!1483 () ValueCell!452)

