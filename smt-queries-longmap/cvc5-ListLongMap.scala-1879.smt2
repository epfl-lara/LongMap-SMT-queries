; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33708 () Bool)

(assert start!33708)

(declare-fun b_free!6943 () Bool)

(declare-fun b_next!6943 () Bool)

(assert (=> start!33708 (= b_free!6943 (not b_next!6943))))

(declare-fun tp!24333 () Bool)

(declare-fun b_and!14123 () Bool)

(assert (=> start!33708 (= tp!24333 b_and!14123)))

(declare-fun b!335065 () Bool)

(declare-fun e!205667 () Bool)

(declare-fun e!205666 () Bool)

(assert (=> b!335065 (= e!205667 e!205666)))

(declare-fun res!184832 () Bool)

(assert (=> b!335065 (=> (not res!184832) (not e!205666))))

(declare-datatypes ((V!10171 0))(
  ( (V!10172 (val!3492 Int)) )
))
(declare-datatypes ((tuple2!5070 0))(
  ( (tuple2!5071 (_1!2546 (_ BitVec 64)) (_2!2546 V!10171)) )
))
(declare-datatypes ((List!4693 0))(
  ( (Nil!4690) (Cons!4689 (h!5545 tuple2!5070) (t!9781 List!4693)) )
))
(declare-datatypes ((ListLongMap!3983 0))(
  ( (ListLongMap!3984 (toList!2007 List!4693)) )
))
(declare-fun lt!159695 () ListLongMap!3983)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun contains!2051 (ListLongMap!3983 (_ BitVec 64)) Bool)

(assert (=> b!335065 (= res!184832 (not (contains!2051 lt!159695 k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10171)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3104 0))(
  ( (ValueCellFull!3104 (v!5654 V!10171)) (EmptyCell!3104) )
))
(declare-datatypes ((array!17383 0))(
  ( (array!17384 (arr!8222 (Array (_ BitVec 32) ValueCell!3104)) (size!8574 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17383)

(declare-datatypes ((array!17385 0))(
  ( (array!17386 (arr!8223 (Array (_ BitVec 32) (_ BitVec 64))) (size!8575 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17385)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10171)

(declare-fun getCurrentListMap!1533 (array!17385 array!17383 (_ BitVec 32) (_ BitVec 32) V!10171 V!10171 (_ BitVec 32) Int) ListLongMap!3983)

(assert (=> b!335065 (= lt!159695 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun mapNonEmpty!11739 () Bool)

(declare-fun mapRes!11739 () Bool)

(declare-fun tp!24332 () Bool)

(declare-fun e!205671 () Bool)

(assert (=> mapNonEmpty!11739 (= mapRes!11739 (and tp!24332 e!205671))))

(declare-fun mapRest!11739 () (Array (_ BitVec 32) ValueCell!3104))

(declare-fun mapKey!11739 () (_ BitVec 32))

(declare-fun mapValue!11739 () ValueCell!3104)

(assert (=> mapNonEmpty!11739 (= (arr!8222 _values!1525) (store mapRest!11739 mapKey!11739 mapValue!11739))))

(declare-fun b!335066 () Bool)

(declare-fun tp_is_empty!6895 () Bool)

(assert (=> b!335066 (= e!205671 tp_is_empty!6895)))

(declare-fun b!335067 () Bool)

(declare-fun e!205669 () Bool)

(assert (=> b!335067 (= e!205669 (not true))))

(declare-datatypes ((SeekEntryResult!3178 0))(
  ( (MissingZero!3178 (index!14891 (_ BitVec 32))) (Found!3178 (index!14892 (_ BitVec 32))) (Intermediate!3178 (undefined!3990 Bool) (index!14893 (_ BitVec 32)) (x!33392 (_ BitVec 32))) (Undefined!3178) (MissingVacant!3178 (index!14894 (_ BitVec 32))) )
))
(declare-fun lt!159697 () SeekEntryResult!3178)

(assert (=> b!335067 (contains!2051 lt!159695 (select (arr!8223 _keys!1895) (index!14892 lt!159697)))))

(declare-datatypes ((Unit!10425 0))(
  ( (Unit!10426) )
))
(declare-fun lt!159696 () Unit!10425)

(declare-fun lemmaValidKeyInArrayIsInListMap!159 (array!17385 array!17383 (_ BitVec 32) (_ BitVec 32) V!10171 V!10171 (_ BitVec 32) Int) Unit!10425)

(assert (=> b!335067 (= lt!159696 (lemmaValidKeyInArrayIsInListMap!159 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14892 lt!159697) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335067 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159694 () Unit!10425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17385 (_ BitVec 64) (_ BitVec 32)) Unit!10425)

(assert (=> b!335067 (= lt!159694 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14892 lt!159697)))))

(declare-fun b!335068 () Bool)

(declare-fun res!184831 () Bool)

(assert (=> b!335068 (=> (not res!184831) (not e!205667))))

(assert (=> b!335068 (= res!184831 (and (= (size!8574 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8575 _keys!1895) (size!8574 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335069 () Bool)

(assert (=> b!335069 (= e!205666 e!205669)))

(declare-fun res!184834 () Bool)

(assert (=> b!335069 (=> (not res!184834) (not e!205669))))

(assert (=> b!335069 (= res!184834 (and (is-Found!3178 lt!159697) (= (select (arr!8223 _keys!1895) (index!14892 lt!159697)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17385 (_ BitVec 32)) SeekEntryResult!3178)

(assert (=> b!335069 (= lt!159697 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335070 () Bool)

(declare-fun res!184830 () Bool)

(assert (=> b!335070 (=> (not res!184830) (not e!205669))))

(assert (=> b!335070 (= res!184830 (arrayContainsKey!0 _keys!1895 k!1348 (index!14892 lt!159697)))))

(declare-fun b!335071 () Bool)

(declare-fun res!184829 () Bool)

(assert (=> b!335071 (=> (not res!184829) (not e!205667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17385 (_ BitVec 32)) Bool)

(assert (=> b!335071 (= res!184829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!184828 () Bool)

(assert (=> start!33708 (=> (not res!184828) (not e!205667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33708 (= res!184828 (validMask!0 mask!2385))))

(assert (=> start!33708 e!205667))

(assert (=> start!33708 true))

(assert (=> start!33708 tp_is_empty!6895))

(assert (=> start!33708 tp!24333))

(declare-fun e!205670 () Bool)

(declare-fun array_inv!6110 (array!17383) Bool)

(assert (=> start!33708 (and (array_inv!6110 _values!1525) e!205670)))

(declare-fun array_inv!6111 (array!17385) Bool)

(assert (=> start!33708 (array_inv!6111 _keys!1895)))

(declare-fun b!335064 () Bool)

(declare-fun res!184835 () Bool)

(assert (=> b!335064 (=> (not res!184835) (not e!205667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335064 (= res!184835 (validKeyInArray!0 k!1348))))

(declare-fun b!335072 () Bool)

(declare-fun e!205668 () Bool)

(assert (=> b!335072 (= e!205670 (and e!205668 mapRes!11739))))

(declare-fun condMapEmpty!11739 () Bool)

(declare-fun mapDefault!11739 () ValueCell!3104)

