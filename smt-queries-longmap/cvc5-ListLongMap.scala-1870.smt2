; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33654 () Bool)

(assert start!33654)

(declare-fun b_free!6889 () Bool)

(declare-fun b_next!6889 () Bool)

(assert (=> start!33654 (= b_free!6889 (not b_next!6889))))

(declare-fun tp!24171 () Bool)

(declare-fun b_and!14069 () Bool)

(assert (=> start!33654 (= tp!24171 b_and!14069)))

(declare-fun b!334173 () Bool)

(declare-fun res!184185 () Bool)

(declare-fun e!205154 () Bool)

(assert (=> b!334173 (=> (not res!184185) (not e!205154))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10099 0))(
  ( (V!10100 (val!3465 Int)) )
))
(declare-datatypes ((ValueCell!3077 0))(
  ( (ValueCellFull!3077 (v!5627 V!10099)) (EmptyCell!3077) )
))
(declare-datatypes ((array!17275 0))(
  ( (array!17276 (arr!8168 (Array (_ BitVec 32) ValueCell!3077)) (size!8520 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17275)

(declare-datatypes ((array!17277 0))(
  ( (array!17278 (arr!8169 (Array (_ BitVec 32) (_ BitVec 64))) (size!8521 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17277)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334173 (= res!184185 (and (= (size!8520 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8521 _keys!1895) (size!8520 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334174 () Bool)

(declare-fun res!184187 () Bool)

(assert (=> b!334174 (=> (not res!184187) (not e!205154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17277 (_ BitVec 32)) Bool)

(assert (=> b!334174 (= res!184187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334175 () Bool)

(declare-fun res!184184 () Bool)

(assert (=> b!334175 (=> (not res!184184) (not e!205154))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334175 (= res!184184 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!11658 () Bool)

(declare-fun mapRes!11658 () Bool)

(assert (=> mapIsEmpty!11658 mapRes!11658))

(declare-fun b!334176 () Bool)

(declare-fun e!205153 () Bool)

(declare-fun tp_is_empty!6841 () Bool)

(assert (=> b!334176 (= e!205153 tp_is_empty!6841)))

(declare-fun b!334177 () Bool)

(declare-fun res!184181 () Bool)

(assert (=> b!334177 (=> (not res!184181) (not e!205154))))

(declare-datatypes ((List!4654 0))(
  ( (Nil!4651) (Cons!4650 (h!5506 (_ BitVec 64)) (t!9742 List!4654)) )
))
(declare-fun arrayNoDuplicates!0 (array!17277 (_ BitVec 32) List!4654) Bool)

(assert (=> b!334177 (= res!184181 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4651))))

(declare-fun b!334178 () Bool)

(declare-fun e!205150 () Bool)

(assert (=> b!334178 (= e!205150 tp_is_empty!6841)))

(declare-fun mapNonEmpty!11658 () Bool)

(declare-fun tp!24170 () Bool)

(assert (=> mapNonEmpty!11658 (= mapRes!11658 (and tp!24170 e!205153))))

(declare-fun mapRest!11658 () (Array (_ BitVec 32) ValueCell!3077))

(declare-fun mapKey!11658 () (_ BitVec 32))

(declare-fun mapValue!11658 () ValueCell!3077)

(assert (=> mapNonEmpty!11658 (= (arr!8168 _values!1525) (store mapRest!11658 mapKey!11658 mapValue!11658))))

(declare-fun b!334180 () Bool)

(declare-fun res!184183 () Bool)

(declare-fun e!205155 () Bool)

(assert (=> b!334180 (=> (not res!184183) (not e!205155))))

(declare-datatypes ((SeekEntryResult!3156 0))(
  ( (MissingZero!3156 (index!14803 (_ BitVec 32))) (Found!3156 (index!14804 (_ BitVec 32))) (Intermediate!3156 (undefined!3968 Bool) (index!14805 (_ BitVec 32)) (x!33298 (_ BitVec 32))) (Undefined!3156) (MissingVacant!3156 (index!14806 (_ BitVec 32))) )
))
(declare-fun lt!159474 () SeekEntryResult!3156)

(declare-fun arrayContainsKey!0 (array!17277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334180 (= res!184183 (arrayContainsKey!0 _keys!1895 k!1348 (index!14804 lt!159474)))))

(declare-fun b!334181 () Bool)

(assert (=> b!334181 (= e!205154 e!205155)))

(declare-fun res!184186 () Bool)

(assert (=> b!334181 (=> (not res!184186) (not e!205155))))

(assert (=> b!334181 (= res!184186 (and (is-Found!3156 lt!159474) (= (select (arr!8169 _keys!1895) (index!14804 lt!159474)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17277 (_ BitVec 32)) SeekEntryResult!3156)

(assert (=> b!334181 (= lt!159474 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!184182 () Bool)

(assert (=> start!33654 (=> (not res!184182) (not e!205154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33654 (= res!184182 (validMask!0 mask!2385))))

(assert (=> start!33654 e!205154))

(assert (=> start!33654 true))

(assert (=> start!33654 tp_is_empty!6841))

(assert (=> start!33654 tp!24171))

(declare-fun e!205151 () Bool)

(declare-fun array_inv!6074 (array!17275) Bool)

(assert (=> start!33654 (and (array_inv!6074 _values!1525) e!205151)))

(declare-fun array_inv!6075 (array!17277) Bool)

(assert (=> start!33654 (array_inv!6075 _keys!1895)))

(declare-fun b!334179 () Bool)

(assert (=> b!334179 (= e!205155 (not true))))

(assert (=> b!334179 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10391 0))(
  ( (Unit!10392) )
))
(declare-fun lt!159475 () Unit!10391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17277 (_ BitVec 64) (_ BitVec 32)) Unit!10391)

(assert (=> b!334179 (= lt!159475 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14804 lt!159474)))))

(declare-fun b!334182 () Bool)

(declare-fun res!184180 () Bool)

(assert (=> b!334182 (=> (not res!184180) (not e!205154))))

(declare-fun zeroValue!1467 () V!10099)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10099)

(declare-datatypes ((tuple2!5034 0))(
  ( (tuple2!5035 (_1!2528 (_ BitVec 64)) (_2!2528 V!10099)) )
))
(declare-datatypes ((List!4655 0))(
  ( (Nil!4652) (Cons!4651 (h!5507 tuple2!5034) (t!9743 List!4655)) )
))
(declare-datatypes ((ListLongMap!3947 0))(
  ( (ListLongMap!3948 (toList!1989 List!4655)) )
))
(declare-fun contains!2033 (ListLongMap!3947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1517 (array!17277 array!17275 (_ BitVec 32) (_ BitVec 32) V!10099 V!10099 (_ BitVec 32) Int) ListLongMap!3947)

(assert (=> b!334182 (= res!184180 (not (contains!2033 (getCurrentListMap!1517 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!334183 () Bool)

(assert (=> b!334183 (= e!205151 (and e!205150 mapRes!11658))))

(declare-fun condMapEmpty!11658 () Bool)

(declare-fun mapDefault!11658 () ValueCell!3077)

