; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33712 () Bool)

(assert start!33712)

(declare-fun b_free!6947 () Bool)

(declare-fun b_next!6947 () Bool)

(assert (=> start!33712 (= b_free!6947 (not b_next!6947))))

(declare-fun tp!24344 () Bool)

(declare-fun b_and!14127 () Bool)

(assert (=> start!33712 (= tp!24344 b_and!14127)))

(declare-fun b!335130 () Bool)

(declare-fun res!184882 () Bool)

(declare-fun e!205710 () Bool)

(assert (=> b!335130 (=> (not res!184882) (not e!205710))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335130 (= res!184882 (validKeyInArray!0 k!1348))))

(declare-fun b!335131 () Bool)

(declare-fun e!205712 () Bool)

(declare-fun tp_is_empty!6899 () Bool)

(assert (=> b!335131 (= e!205712 tp_is_empty!6899)))

(declare-fun b!335132 () Bool)

(declare-fun e!205708 () Bool)

(declare-fun e!205709 () Bool)

(assert (=> b!335132 (= e!205708 e!205709)))

(declare-fun res!184876 () Bool)

(assert (=> b!335132 (=> (not res!184876) (not e!205709))))

(declare-datatypes ((array!17391 0))(
  ( (array!17392 (arr!8226 (Array (_ BitVec 32) (_ BitVec 64))) (size!8578 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17391)

(declare-datatypes ((SeekEntryResult!3180 0))(
  ( (MissingZero!3180 (index!14899 (_ BitVec 32))) (Found!3180 (index!14900 (_ BitVec 32))) (Intermediate!3180 (undefined!3992 Bool) (index!14901 (_ BitVec 32)) (x!33394 (_ BitVec 32))) (Undefined!3180) (MissingVacant!3180 (index!14902 (_ BitVec 32))) )
))
(declare-fun lt!159721 () SeekEntryResult!3180)

(assert (=> b!335132 (= res!184876 (and (is-Found!3180 lt!159721) (= (select (arr!8226 _keys!1895) (index!14900 lt!159721)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17391 (_ BitVec 32)) SeekEntryResult!3180)

(assert (=> b!335132 (= lt!159721 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335133 () Bool)

(declare-fun res!184883 () Bool)

(assert (=> b!335133 (=> (not res!184883) (not e!205710))))

(declare-datatypes ((List!4696 0))(
  ( (Nil!4693) (Cons!4692 (h!5548 (_ BitVec 64)) (t!9784 List!4696)) )
))
(declare-fun arrayNoDuplicates!0 (array!17391 (_ BitVec 32) List!4696) Bool)

(assert (=> b!335133 (= res!184883 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4693))))

(declare-fun res!184881 () Bool)

(assert (=> start!33712 (=> (not res!184881) (not e!205710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33712 (= res!184881 (validMask!0 mask!2385))))

(assert (=> start!33712 e!205710))

(assert (=> start!33712 true))

(assert (=> start!33712 tp_is_empty!6899))

(assert (=> start!33712 tp!24344))

(declare-datatypes ((V!10175 0))(
  ( (V!10176 (val!3494 Int)) )
))
(declare-datatypes ((ValueCell!3106 0))(
  ( (ValueCellFull!3106 (v!5656 V!10175)) (EmptyCell!3106) )
))
(declare-datatypes ((array!17393 0))(
  ( (array!17394 (arr!8227 (Array (_ BitVec 32) ValueCell!3106)) (size!8579 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17393)

(declare-fun e!205711 () Bool)

(declare-fun array_inv!6114 (array!17393) Bool)

(assert (=> start!33712 (and (array_inv!6114 _values!1525) e!205711)))

(declare-fun array_inv!6115 (array!17391) Bool)

(assert (=> start!33712 (array_inv!6115 _keys!1895)))

(declare-fun b!335134 () Bool)

(assert (=> b!335134 (= e!205709 (not true))))

(declare-datatypes ((tuple2!5074 0))(
  ( (tuple2!5075 (_1!2548 (_ BitVec 64)) (_2!2548 V!10175)) )
))
(declare-datatypes ((List!4697 0))(
  ( (Nil!4694) (Cons!4693 (h!5549 tuple2!5074) (t!9785 List!4697)) )
))
(declare-datatypes ((ListLongMap!3987 0))(
  ( (ListLongMap!3988 (toList!2009 List!4697)) )
))
(declare-fun lt!159720 () ListLongMap!3987)

(declare-fun contains!2053 (ListLongMap!3987 (_ BitVec 64)) Bool)

(assert (=> b!335134 (contains!2053 lt!159720 (select (arr!8226 _keys!1895) (index!14900 lt!159721)))))

(declare-datatypes ((Unit!10429 0))(
  ( (Unit!10430) )
))
(declare-fun lt!159719 () Unit!10429)

(declare-fun zeroValue!1467 () V!10175)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10175)

(declare-fun lemmaValidKeyInArrayIsInListMap!161 (array!17391 array!17393 (_ BitVec 32) (_ BitVec 32) V!10175 V!10175 (_ BitVec 32) Int) Unit!10429)

(assert (=> b!335134 (= lt!159719 (lemmaValidKeyInArrayIsInListMap!161 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14900 lt!159721) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335134 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159718 () Unit!10429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17391 (_ BitVec 64) (_ BitVec 32)) Unit!10429)

(assert (=> b!335134 (= lt!159718 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14900 lt!159721)))))

(declare-fun b!335135 () Bool)

(declare-fun res!184879 () Bool)

(assert (=> b!335135 (=> (not res!184879) (not e!205710))))

(assert (=> b!335135 (= res!184879 (and (= (size!8579 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8578 _keys!1895) (size!8579 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335136 () Bool)

(declare-fun mapRes!11745 () Bool)

(assert (=> b!335136 (= e!205711 (and e!205712 mapRes!11745))))

(declare-fun condMapEmpty!11745 () Bool)

(declare-fun mapDefault!11745 () ValueCell!3106)

