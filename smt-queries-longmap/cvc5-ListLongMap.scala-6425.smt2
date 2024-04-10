; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82346 () Bool)

(assert start!82346)

(declare-fun b_free!18613 () Bool)

(declare-fun b_next!18613 () Bool)

(assert (=> start!82346 (= b_free!18613 (not b_next!18613))))

(declare-fun tp!64809 () Bool)

(declare-fun b_and!30101 () Bool)

(assert (=> start!82346 (= tp!64809 b_and!30101)))

(declare-fun b!960098 () Bool)

(declare-fun res!642677 () Bool)

(declare-fun e!541213 () Bool)

(assert (=> b!960098 (=> (not res!642677) (not e!541213))))

(declare-datatypes ((array!58741 0))(
  ( (array!58742 (arr!28244 (Array (_ BitVec 32) (_ BitVec 64))) (size!28723 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58741)

(declare-datatypes ((List!19639 0))(
  ( (Nil!19636) (Cons!19635 (h!20797 (_ BitVec 64)) (t!28002 List!19639)) )
))
(declare-fun arrayNoDuplicates!0 (array!58741 (_ BitVec 32) List!19639) Bool)

(assert (=> b!960098 (= res!642677 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19636))))

(declare-fun res!642674 () Bool)

(assert (=> start!82346 (=> (not res!642674) (not e!541213))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82346 (= res!642674 (validMask!0 mask!2088))))

(assert (=> start!82346 e!541213))

(assert (=> start!82346 true))

(declare-fun tp_is_empty!21325 () Bool)

(assert (=> start!82346 tp_is_empty!21325))

(declare-fun array_inv!21885 (array!58741) Bool)

(assert (=> start!82346 (array_inv!21885 _keys!1668)))

(declare-datatypes ((V!33417 0))(
  ( (V!33418 (val!10713 Int)) )
))
(declare-datatypes ((ValueCell!10181 0))(
  ( (ValueCellFull!10181 (v!13270 V!33417)) (EmptyCell!10181) )
))
(declare-datatypes ((array!58743 0))(
  ( (array!58744 (arr!28245 (Array (_ BitVec 32) ValueCell!10181)) (size!28724 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58743)

(declare-fun e!541212 () Bool)

(declare-fun array_inv!21886 (array!58743) Bool)

(assert (=> start!82346 (and (array_inv!21886 _values!1386) e!541212)))

(assert (=> start!82346 tp!64809))

(declare-fun b!960099 () Bool)

(declare-fun res!642676 () Bool)

(assert (=> b!960099 (=> (not res!642676) (not e!541213))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960099 (= res!642676 (validKeyInArray!0 (select (arr!28244 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33967 () Bool)

(declare-fun mapRes!33967 () Bool)

(declare-fun tp!64808 () Bool)

(declare-fun e!541211 () Bool)

(assert (=> mapNonEmpty!33967 (= mapRes!33967 (and tp!64808 e!541211))))

(declare-fun mapKey!33967 () (_ BitVec 32))

(declare-fun mapRest!33967 () (Array (_ BitVec 32) ValueCell!10181))

(declare-fun mapValue!33967 () ValueCell!10181)

(assert (=> mapNonEmpty!33967 (= (arr!28245 _values!1386) (store mapRest!33967 mapKey!33967 mapValue!33967))))

(declare-fun b!960100 () Bool)

(assert (=> b!960100 (= e!541211 tp_is_empty!21325)))

(declare-fun b!960101 () Bool)

(declare-fun e!541214 () Bool)

(assert (=> b!960101 (= e!541214 tp_is_empty!21325)))

(declare-fun b!960102 () Bool)

(assert (=> b!960102 (= e!541212 (and e!541214 mapRes!33967))))

(declare-fun condMapEmpty!33967 () Bool)

(declare-fun mapDefault!33967 () ValueCell!10181)

