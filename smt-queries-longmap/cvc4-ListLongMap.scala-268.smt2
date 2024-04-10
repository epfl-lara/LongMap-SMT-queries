; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4410 () Bool)

(assert start!4410)

(declare-fun b_free!1199 () Bool)

(declare-fun b_next!1199 () Bool)

(assert (=> start!4410 (= b_free!1199 (not b_next!1199))))

(declare-fun tp!5032 () Bool)

(declare-fun b_and!2019 () Bool)

(assert (=> start!4410 (= tp!5032 b_and!2019)))

(declare-fun b!34052 () Bool)

(declare-fun res!20668 () Bool)

(declare-fun e!21623 () Bool)

(assert (=> b!34052 (=> (not res!20668) (not e!21623))))

(declare-datatypes ((array!2321 0))(
  ( (array!2322 (arr!1109 (Array (_ BitVec 32) (_ BitVec 64))) (size!1210 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2321)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2321 (_ BitVec 32)) Bool)

(assert (=> b!34052 (= res!20668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34053 () Bool)

(declare-fun res!20664 () Bool)

(assert (=> b!34053 (=> (not res!20664) (not e!21623))))

(declare-datatypes ((List!895 0))(
  ( (Nil!892) (Cons!891 (h!1458 (_ BitVec 64)) (t!3598 List!895)) )
))
(declare-fun arrayNoDuplicates!0 (array!2321 (_ BitVec 32) List!895) Bool)

(assert (=> b!34053 (= res!20664 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!892))))

(declare-fun b!34054 () Bool)

(declare-fun res!20666 () Bool)

(declare-fun e!21621 () Bool)

(assert (=> b!34054 (=> (not res!20666) (not e!21621))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34054 (= res!20666 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1873 () Bool)

(declare-fun mapRes!1873 () Bool)

(declare-fun tp!5031 () Bool)

(declare-fun e!21622 () Bool)

(assert (=> mapNonEmpty!1873 (= mapRes!1873 (and tp!5031 e!21622))))

(declare-datatypes ((V!1895 0))(
  ( (V!1896 (val!803 Int)) )
))
(declare-datatypes ((ValueCell!577 0))(
  ( (ValueCellFull!577 (v!1897 V!1895)) (EmptyCell!577) )
))
(declare-datatypes ((array!2323 0))(
  ( (array!2324 (arr!1110 (Array (_ BitVec 32) ValueCell!577)) (size!1211 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2323)

(declare-fun mapRest!1873 () (Array (_ BitVec 32) ValueCell!577))

(declare-fun mapValue!1873 () ValueCell!577)

(declare-fun mapKey!1873 () (_ BitVec 32))

(assert (=> mapNonEmpty!1873 (= (arr!1110 _values!1501) (store mapRest!1873 mapKey!1873 mapValue!1873))))

(declare-fun res!20669 () Bool)

(assert (=> start!4410 (=> (not res!20669) (not e!21623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4410 (= res!20669 (validMask!0 mask!2294))))

(assert (=> start!4410 e!21623))

(assert (=> start!4410 true))

(assert (=> start!4410 tp!5032))

(declare-fun e!21619 () Bool)

(declare-fun array_inv!779 (array!2323) Bool)

(assert (=> start!4410 (and (array_inv!779 _values!1501) e!21619)))

(declare-fun array_inv!780 (array!2321) Bool)

(assert (=> start!4410 (array_inv!780 _keys!1833)))

(declare-fun tp_is_empty!1553 () Bool)

(assert (=> start!4410 tp_is_empty!1553))

(declare-fun mapIsEmpty!1873 () Bool)

(assert (=> mapIsEmpty!1873 mapRes!1873))

(declare-fun b!34055 () Bool)

(assert (=> b!34055 (= e!21621 (not false))))

(declare-fun lt!12589 () (_ BitVec 32))

(assert (=> b!34055 (arrayForallSeekEntryOrOpenFound!0 lt!12589 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!768 0))(
  ( (Unit!769) )
))
(declare-fun lt!12588 () Unit!768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!768)

(assert (=> b!34055 (= lt!12588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12589))))

(declare-datatypes ((SeekEntryResult!137 0))(
  ( (MissingZero!137 (index!2670 (_ BitVec 32))) (Found!137 (index!2671 (_ BitVec 32))) (Intermediate!137 (undefined!949 Bool) (index!2672 (_ BitVec 32)) (x!6873 (_ BitVec 32))) (Undefined!137) (MissingVacant!137 (index!2673 (_ BitVec 32))) )
))
(declare-fun lt!12587 () SeekEntryResult!137)

(assert (=> b!34055 (and (is-Found!137 lt!12587) (= (index!2671 lt!12587) lt!12589))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2321 (_ BitVec 32)) SeekEntryResult!137)

(assert (=> b!34055 (= lt!12587 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun lt!12586 () Unit!768)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2321 (_ BitVec 32)) Unit!768)

(assert (=> b!34055 (= lt!12586 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!12589 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1306 0))(
  ( (tuple2!1307 (_1!664 (_ BitVec 64)) (_2!664 V!1895)) )
))
(declare-datatypes ((List!896 0))(
  ( (Nil!893) (Cons!892 (h!1459 tuple2!1306) (t!3599 List!896)) )
))
(declare-datatypes ((ListLongMap!883 0))(
  ( (ListLongMap!884 (toList!457 List!896)) )
))
(declare-fun lt!12585 () ListLongMap!883)

(declare-fun contains!402 (ListLongMap!883 (_ BitVec 64)) Bool)

(assert (=> b!34055 (contains!402 lt!12585 (select (arr!1109 _keys!1833) lt!12589))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!12590 () Unit!768)

(declare-fun zeroValue!1443 () V!1895)

(declare-fun minValue!1443 () V!1895)

(declare-fun lemmaValidKeyInArrayIsInListMap!69 (array!2321 array!2323 (_ BitVec 32) (_ BitVec 32) V!1895 V!1895 (_ BitVec 32) Int) Unit!768)

(assert (=> b!34055 (= lt!12590 (lemmaValidKeyInArrayIsInListMap!69 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12589 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2321 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!34055 (= lt!12589 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!34056 () Bool)

(declare-fun res!20665 () Bool)

(assert (=> b!34056 (=> (not res!20665) (not e!21623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34056 (= res!20665 (validKeyInArray!0 k!1304))))

(declare-fun b!34057 () Bool)

(declare-fun res!20670 () Bool)

(assert (=> b!34057 (=> (not res!20670) (not e!21623))))

(assert (=> b!34057 (= res!20670 (and (= (size!1211 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1210 _keys!1833) (size!1211 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34058 () Bool)

(assert (=> b!34058 (= e!21622 tp_is_empty!1553)))

(declare-fun b!34059 () Bool)

(declare-fun e!21618 () Bool)

(assert (=> b!34059 (= e!21619 (and e!21618 mapRes!1873))))

(declare-fun condMapEmpty!1873 () Bool)

(declare-fun mapDefault!1873 () ValueCell!577)

