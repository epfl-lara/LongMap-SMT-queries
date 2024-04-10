; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3894 () Bool)

(assert start!3894)

(declare-fun b_free!799 () Bool)

(declare-fun b_next!799 () Bool)

(assert (=> start!3894 (= b_free!799 (not b_next!799))))

(declare-fun tp!3816 () Bool)

(declare-fun b_and!1609 () Bool)

(assert (=> start!3894 (= tp!3816 b_and!1609)))

(declare-fun mapIsEmpty!1258 () Bool)

(declare-fun mapRes!1258 () Bool)

(assert (=> mapIsEmpty!1258 mapRes!1258))

(declare-fun res!16203 () Bool)

(declare-fun e!17842 () Bool)

(assert (=> start!3894 (=> (not res!16203) (not e!17842))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3894 (= res!16203 (validMask!0 mask!2294))))

(assert (=> start!3894 e!17842))

(assert (=> start!3894 true))

(assert (=> start!3894 tp!3816))

(declare-datatypes ((V!1363 0))(
  ( (V!1364 (val!603 Int)) )
))
(declare-datatypes ((ValueCell!377 0))(
  ( (ValueCellFull!377 (v!1692 V!1363)) (EmptyCell!377) )
))
(declare-datatypes ((array!1549 0))(
  ( (array!1550 (arr!728 (Array (_ BitVec 32) ValueCell!377)) (size!829 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1549)

(declare-fun e!17839 () Bool)

(declare-fun array_inv!501 (array!1549) Bool)

(assert (=> start!3894 (and (array_inv!501 _values!1501) e!17839)))

(declare-datatypes ((array!1551 0))(
  ( (array!1552 (arr!729 (Array (_ BitVec 32) (_ BitVec 64))) (size!830 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1551)

(declare-fun array_inv!502 (array!1551) Bool)

(assert (=> start!3894 (array_inv!502 _keys!1833)))

(declare-fun tp_is_empty!1153 () Bool)

(assert (=> start!3894 tp_is_empty!1153))

(declare-fun b!27380 () Bool)

(declare-fun res!16205 () Bool)

(assert (=> b!27380 (=> (not res!16205) (not e!17842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1551 (_ BitVec 32)) Bool)

(assert (=> b!27380 (= res!16205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27381 () Bool)

(declare-fun e!17843 () Bool)

(assert (=> b!27381 (= e!17839 (and e!17843 mapRes!1258))))

(declare-fun condMapEmpty!1258 () Bool)

(declare-fun mapDefault!1258 () ValueCell!377)

