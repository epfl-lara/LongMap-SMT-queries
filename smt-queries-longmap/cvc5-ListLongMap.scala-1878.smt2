; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33702 () Bool)

(assert start!33702)

(declare-fun b_free!6937 () Bool)

(declare-fun b_next!6937 () Bool)

(assert (=> start!33702 (= b_free!6937 (not b_next!6937))))

(declare-fun tp!24315 () Bool)

(declare-fun b_and!14117 () Bool)

(assert (=> start!33702 (= tp!24315 b_and!14117)))

(declare-fun b!334965 () Bool)

(declare-fun res!184757 () Bool)

(declare-fun e!205606 () Bool)

(assert (=> b!334965 (=> (not res!184757) (not e!205606))))

(declare-datatypes ((array!17371 0))(
  ( (array!17372 (arr!8216 (Array (_ BitVec 32) (_ BitVec 64))) (size!8568 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17371)

(declare-datatypes ((List!4688 0))(
  ( (Nil!4685) (Cons!4684 (h!5540 (_ BitVec 64)) (t!9776 List!4688)) )
))
(declare-fun arrayNoDuplicates!0 (array!17371 (_ BitVec 32) List!4688) Bool)

(assert (=> b!334965 (= res!184757 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4685))))

(declare-fun res!184760 () Bool)

(assert (=> start!33702 (=> (not res!184760) (not e!205606))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33702 (= res!184760 (validMask!0 mask!2385))))

(assert (=> start!33702 e!205606))

(assert (=> start!33702 true))

(declare-fun tp_is_empty!6889 () Bool)

(assert (=> start!33702 tp_is_empty!6889))

(assert (=> start!33702 tp!24315))

(declare-datatypes ((V!10163 0))(
  ( (V!10164 (val!3489 Int)) )
))
(declare-datatypes ((ValueCell!3101 0))(
  ( (ValueCellFull!3101 (v!5651 V!10163)) (EmptyCell!3101) )
))
(declare-datatypes ((array!17373 0))(
  ( (array!17374 (arr!8217 (Array (_ BitVec 32) ValueCell!3101)) (size!8569 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17373)

(declare-fun e!205608 () Bool)

(declare-fun array_inv!6106 (array!17373) Bool)

(assert (=> start!33702 (and (array_inv!6106 _values!1525) e!205608)))

(declare-fun array_inv!6107 (array!17371) Bool)

(assert (=> start!33702 (array_inv!6107 _keys!1895)))

(declare-fun b!334966 () Bool)

(declare-fun res!184761 () Bool)

(declare-fun e!205604 () Bool)

(assert (=> b!334966 (=> (not res!184761) (not e!205604))))

(declare-datatypes ((SeekEntryResult!3175 0))(
  ( (MissingZero!3175 (index!14879 (_ BitVec 32))) (Found!3175 (index!14880 (_ BitVec 32))) (Intermediate!3175 (undefined!3987 Bool) (index!14881 (_ BitVec 32)) (x!33381 (_ BitVec 32))) (Undefined!3175) (MissingVacant!3175 (index!14882 (_ BitVec 32))) )
))
(declare-fun lt!159659 () SeekEntryResult!3175)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334966 (= res!184761 (arrayContainsKey!0 _keys!1895 k!1348 (index!14880 lt!159659)))))

(declare-fun mapNonEmpty!11730 () Bool)

(declare-fun mapRes!11730 () Bool)

(declare-fun tp!24314 () Bool)

(declare-fun e!205605 () Bool)

(assert (=> mapNonEmpty!11730 (= mapRes!11730 (and tp!24314 e!205605))))

(declare-fun mapValue!11730 () ValueCell!3101)

(declare-fun mapRest!11730 () (Array (_ BitVec 32) ValueCell!3101))

(declare-fun mapKey!11730 () (_ BitVec 32))

(assert (=> mapNonEmpty!11730 (= (arr!8217 _values!1525) (store mapRest!11730 mapKey!11730 mapValue!11730))))

(declare-fun b!334967 () Bool)

(declare-fun res!184759 () Bool)

(assert (=> b!334967 (=> (not res!184759) (not e!205606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334967 (= res!184759 (validKeyInArray!0 k!1348))))

(declare-fun b!334968 () Bool)

(assert (=> b!334968 (= e!205605 tp_is_empty!6889)))

(declare-fun b!334969 () Bool)

(declare-fun e!205602 () Bool)

(assert (=> b!334969 (= e!205602 e!205604)))

(declare-fun res!184758 () Bool)

(assert (=> b!334969 (=> (not res!184758) (not e!205604))))

(assert (=> b!334969 (= res!184758 (and (is-Found!3175 lt!159659) (= (select (arr!8216 _keys!1895) (index!14880 lt!159659)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17371 (_ BitVec 32)) SeekEntryResult!3175)

(assert (=> b!334969 (= lt!159659 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334970 () Bool)

(assert (=> b!334970 (= e!205604 (not true))))

(declare-datatypes ((tuple2!5064 0))(
  ( (tuple2!5065 (_1!2543 (_ BitVec 64)) (_2!2543 V!10163)) )
))
(declare-datatypes ((List!4689 0))(
  ( (Nil!4686) (Cons!4685 (h!5541 tuple2!5064) (t!9777 List!4689)) )
))
(declare-datatypes ((ListLongMap!3977 0))(
  ( (ListLongMap!3978 (toList!2004 List!4689)) )
))
(declare-fun lt!159658 () ListLongMap!3977)

(declare-fun contains!2048 (ListLongMap!3977 (_ BitVec 64)) Bool)

(assert (=> b!334970 (contains!2048 lt!159658 (select (arr!8216 _keys!1895) (index!14880 lt!159659)))))

(declare-fun zeroValue!1467 () V!10163)

(declare-datatypes ((Unit!10419 0))(
  ( (Unit!10420) )
))
(declare-fun lt!159661 () Unit!10419)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10163)

(declare-fun lemmaValidKeyInArrayIsInListMap!156 (array!17371 array!17373 (_ BitVec 32) (_ BitVec 32) V!10163 V!10163 (_ BitVec 32) Int) Unit!10419)

(assert (=> b!334970 (= lt!159661 (lemmaValidKeyInArrayIsInListMap!156 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14880 lt!159659) defaultEntry!1528))))

(assert (=> b!334970 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159660 () Unit!10419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17371 (_ BitVec 64) (_ BitVec 32)) Unit!10419)

(assert (=> b!334970 (= lt!159660 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14880 lt!159659)))))

(declare-fun b!334971 () Bool)

(declare-fun e!205603 () Bool)

(assert (=> b!334971 (= e!205608 (and e!205603 mapRes!11730))))

(declare-fun condMapEmpty!11730 () Bool)

(declare-fun mapDefault!11730 () ValueCell!3101)

