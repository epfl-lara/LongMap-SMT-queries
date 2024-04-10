; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4450 () Bool)

(assert start!4450)

(declare-fun b_free!1211 () Bool)

(declare-fun b_next!1211 () Bool)

(assert (=> start!4450 (= b_free!1211 (not b_next!1211))))

(declare-fun tp!5070 () Bool)

(declare-fun b_and!2033 () Bool)

(assert (=> start!4450 (= tp!5070 b_and!2033)))

(declare-fun b!34381 () Bool)

(declare-fun res!20849 () Bool)

(declare-fun e!21820 () Bool)

(assert (=> b!34381 (=> (not res!20849) (not e!21820))))

(declare-datatypes ((array!2347 0))(
  ( (array!2348 (arr!1121 (Array (_ BitVec 32) (_ BitVec 64))) (size!1222 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2347)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34381 (= res!20849 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34382 () Bool)

(declare-fun e!21818 () Bool)

(declare-fun tp_is_empty!1565 () Bool)

(assert (=> b!34382 (= e!21818 tp_is_empty!1565)))

(declare-fun b!34383 () Bool)

(declare-fun e!21816 () Bool)

(assert (=> b!34383 (= e!21816 tp_is_empty!1565)))

(declare-fun b!34384 () Bool)

(assert (=> b!34384 (= e!21820 false)))

(declare-datatypes ((SeekEntryResult!142 0))(
  ( (MissingZero!142 (index!2690 (_ BitVec 32))) (Found!142 (index!2691 (_ BitVec 32))) (Intermediate!142 (undefined!954 Bool) (index!2692 (_ BitVec 32)) (x!6904 (_ BitVec 32))) (Undefined!142) (MissingVacant!142 (index!2693 (_ BitVec 32))) )
))
(declare-fun lt!12774 () SeekEntryResult!142)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2347 (_ BitVec 32)) SeekEntryResult!142)

(assert (=> b!34384 (= lt!12774 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun res!20848 () Bool)

(assert (=> start!4450 (=> (not res!20848) (not e!21820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4450 (= res!20848 (validMask!0 mask!2294))))

(assert (=> start!4450 e!21820))

(assert (=> start!4450 true))

(assert (=> start!4450 tp!5070))

(declare-datatypes ((V!1911 0))(
  ( (V!1912 (val!809 Int)) )
))
(declare-datatypes ((ValueCell!583 0))(
  ( (ValueCellFull!583 (v!1904 V!1911)) (EmptyCell!583) )
))
(declare-datatypes ((array!2349 0))(
  ( (array!2350 (arr!1122 (Array (_ BitVec 32) ValueCell!583)) (size!1223 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2349)

(declare-fun e!21817 () Bool)

(declare-fun array_inv!791 (array!2349) Bool)

(assert (=> start!4450 (and (array_inv!791 _values!1501) e!21817)))

(declare-fun array_inv!792 (array!2347) Bool)

(assert (=> start!4450 (array_inv!792 _keys!1833)))

(assert (=> start!4450 tp_is_empty!1565))

(declare-fun b!34385 () Bool)

(declare-fun res!20851 () Bool)

(assert (=> b!34385 (=> (not res!20851) (not e!21820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2347 (_ BitVec 32)) Bool)

(assert (=> b!34385 (= res!20851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1894 () Bool)

(declare-fun mapRes!1894 () Bool)

(declare-fun tp!5071 () Bool)

(assert (=> mapNonEmpty!1894 (= mapRes!1894 (and tp!5071 e!21816))))

(declare-fun mapValue!1894 () ValueCell!583)

(declare-fun mapKey!1894 () (_ BitVec 32))

(declare-fun mapRest!1894 () (Array (_ BitVec 32) ValueCell!583))

(assert (=> mapNonEmpty!1894 (= (arr!1122 _values!1501) (store mapRest!1894 mapKey!1894 mapValue!1894))))

(declare-fun b!34386 () Bool)

(assert (=> b!34386 (= e!21817 (and e!21818 mapRes!1894))))

(declare-fun condMapEmpty!1894 () Bool)

(declare-fun mapDefault!1894 () ValueCell!583)

