; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82314 () Bool)

(assert start!82314)

(declare-fun b!959668 () Bool)

(declare-fun res!642388 () Bool)

(declare-fun e!540973 () Bool)

(assert (=> b!959668 (=> (not res!642388) (not e!540973))))

(declare-datatypes ((array!58677 0))(
  ( (array!58678 (arr!28212 (Array (_ BitVec 32) (_ BitVec 64))) (size!28691 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58677)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58677 (_ BitVec 32)) Bool)

(assert (=> b!959668 (= res!642388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33919 () Bool)

(declare-fun mapRes!33919 () Bool)

(declare-fun tp!64713 () Bool)

(declare-fun e!540971 () Bool)

(assert (=> mapNonEmpty!33919 (= mapRes!33919 (and tp!64713 e!540971))))

(declare-datatypes ((V!33373 0))(
  ( (V!33374 (val!10697 Int)) )
))
(declare-datatypes ((ValueCell!10165 0))(
  ( (ValueCellFull!10165 (v!13254 V!33373)) (EmptyCell!10165) )
))
(declare-fun mapValue!33919 () ValueCell!10165)

(declare-datatypes ((array!58679 0))(
  ( (array!58680 (arr!28213 (Array (_ BitVec 32) ValueCell!10165)) (size!28692 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58679)

(declare-fun mapKey!33919 () (_ BitVec 32))

(declare-fun mapRest!33919 () (Array (_ BitVec 32) ValueCell!10165))

(assert (=> mapNonEmpty!33919 (= (arr!28213 _values!1386) (store mapRest!33919 mapKey!33919 mapValue!33919))))

(declare-fun b!959669 () Bool)

(declare-fun e!540974 () Bool)

(declare-fun tp_is_empty!21293 () Bool)

(assert (=> b!959669 (= e!540974 tp_is_empty!21293)))

(declare-fun b!959670 () Bool)

(declare-fun res!642387 () Bool)

(assert (=> b!959670 (=> (not res!642387) (not e!540973))))

(declare-datatypes ((List!19617 0))(
  ( (Nil!19614) (Cons!19613 (h!20775 (_ BitVec 64)) (t!27980 List!19617)) )
))
(declare-fun arrayNoDuplicates!0 (array!58677 (_ BitVec 32) List!19617) Bool)

(assert (=> b!959670 (= res!642387 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19614))))

(declare-fun b!959671 () Bool)

(declare-fun e!540975 () Bool)

(assert (=> b!959671 (= e!540975 (and e!540974 mapRes!33919))))

(declare-fun condMapEmpty!33919 () Bool)

(declare-fun mapDefault!33919 () ValueCell!10165)

