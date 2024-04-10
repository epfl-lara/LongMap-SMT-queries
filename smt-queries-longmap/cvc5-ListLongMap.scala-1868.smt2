; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33642 () Bool)

(assert start!33642)

(declare-fun b_free!6877 () Bool)

(declare-fun b_next!6877 () Bool)

(assert (=> start!33642 (= b_free!6877 (not b_next!6877))))

(declare-fun tp!24135 () Bool)

(declare-fun b_and!14057 () Bool)

(assert (=> start!33642 (= tp!24135 b_and!14057)))

(declare-fun b!333975 () Bool)

(declare-fun res!184036 () Bool)

(declare-fun e!205042 () Bool)

(assert (=> b!333975 (=> (not res!184036) (not e!205042))))

(declare-datatypes ((array!17251 0))(
  ( (array!17252 (arr!8156 (Array (_ BitVec 32) (_ BitVec 64))) (size!8508 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17251)

(declare-datatypes ((List!4645 0))(
  ( (Nil!4642) (Cons!4641 (h!5497 (_ BitVec 64)) (t!9733 List!4645)) )
))
(declare-fun arrayNoDuplicates!0 (array!17251 (_ BitVec 32) List!4645) Bool)

(assert (=> b!333975 (= res!184036 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4642))))

(declare-fun mapNonEmpty!11640 () Bool)

(declare-fun mapRes!11640 () Bool)

(declare-fun tp!24134 () Bool)

(declare-fun e!205043 () Bool)

(assert (=> mapNonEmpty!11640 (= mapRes!11640 (and tp!24134 e!205043))))

(declare-datatypes ((V!10083 0))(
  ( (V!10084 (val!3459 Int)) )
))
(declare-datatypes ((ValueCell!3071 0))(
  ( (ValueCellFull!3071 (v!5621 V!10083)) (EmptyCell!3071) )
))
(declare-fun mapRest!11640 () (Array (_ BitVec 32) ValueCell!3071))

(declare-datatypes ((array!17253 0))(
  ( (array!17254 (arr!8157 (Array (_ BitVec 32) ValueCell!3071)) (size!8509 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17253)

(declare-fun mapValue!11640 () ValueCell!3071)

(declare-fun mapKey!11640 () (_ BitVec 32))

(assert (=> mapNonEmpty!11640 (= (arr!8157 _values!1525) (store mapRest!11640 mapKey!11640 mapValue!11640))))

(declare-fun mapIsEmpty!11640 () Bool)

(assert (=> mapIsEmpty!11640 mapRes!11640))

(declare-fun b!333976 () Bool)

(declare-fun tp_is_empty!6829 () Bool)

(assert (=> b!333976 (= e!205043 tp_is_empty!6829)))

(declare-fun b!333977 () Bool)

(declare-fun e!205047 () Bool)

(assert (=> b!333977 (= e!205047 (not true))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333977 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3150 0))(
  ( (MissingZero!3150 (index!14779 (_ BitVec 32))) (Found!3150 (index!14780 (_ BitVec 32))) (Intermediate!3150 (undefined!3962 Bool) (index!14781 (_ BitVec 32)) (x!33276 (_ BitVec 32))) (Undefined!3150) (MissingVacant!3150 (index!14782 (_ BitVec 32))) )
))
(declare-fun lt!159439 () SeekEntryResult!3150)

(declare-datatypes ((Unit!10381 0))(
  ( (Unit!10382) )
))
(declare-fun lt!159438 () Unit!10381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17251 (_ BitVec 64) (_ BitVec 32)) Unit!10381)

(assert (=> b!333977 (= lt!159438 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14780 lt!159439)))))

(declare-fun b!333978 () Bool)

(declare-fun res!184041 () Bool)

(assert (=> b!333978 (=> (not res!184041) (not e!205047))))

(assert (=> b!333978 (= res!184041 (arrayContainsKey!0 _keys!1895 k!1348 (index!14780 lt!159439)))))

(declare-fun b!333979 () Bool)

(assert (=> b!333979 (= e!205042 e!205047)))

(declare-fun res!184042 () Bool)

(assert (=> b!333979 (=> (not res!184042) (not e!205047))))

(assert (=> b!333979 (= res!184042 (and (is-Found!3150 lt!159439) (= (select (arr!8156 _keys!1895) (index!14780 lt!159439)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17251 (_ BitVec 32)) SeekEntryResult!3150)

(assert (=> b!333979 (= lt!159439 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!333980 () Bool)

(declare-fun res!184039 () Bool)

(assert (=> b!333980 (=> (not res!184039) (not e!205042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17251 (_ BitVec 32)) Bool)

(assert (=> b!333980 (= res!184039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333981 () Bool)

(declare-fun res!184037 () Bool)

(assert (=> b!333981 (=> (not res!184037) (not e!205042))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10083)

(declare-fun zeroValue!1467 () V!10083)

(declare-datatypes ((tuple2!5026 0))(
  ( (tuple2!5027 (_1!2524 (_ BitVec 64)) (_2!2524 V!10083)) )
))
(declare-datatypes ((List!4646 0))(
  ( (Nil!4643) (Cons!4642 (h!5498 tuple2!5026) (t!9734 List!4646)) )
))
(declare-datatypes ((ListLongMap!3939 0))(
  ( (ListLongMap!3940 (toList!1985 List!4646)) )
))
(declare-fun contains!2029 (ListLongMap!3939 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1513 (array!17251 array!17253 (_ BitVec 32) (_ BitVec 32) V!10083 V!10083 (_ BitVec 32) Int) ListLongMap!3939)

(assert (=> b!333981 (= res!184037 (not (contains!2029 (getCurrentListMap!1513 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!184043 () Bool)

(assert (=> start!33642 (=> (not res!184043) (not e!205042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33642 (= res!184043 (validMask!0 mask!2385))))

(assert (=> start!33642 e!205042))

(assert (=> start!33642 true))

(assert (=> start!33642 tp_is_empty!6829))

(assert (=> start!33642 tp!24135))

(declare-fun e!205044 () Bool)

(declare-fun array_inv!6066 (array!17253) Bool)

(assert (=> start!33642 (and (array_inv!6066 _values!1525) e!205044)))

(declare-fun array_inv!6067 (array!17251) Bool)

(assert (=> start!33642 (array_inv!6067 _keys!1895)))

(declare-fun b!333982 () Bool)

(declare-fun res!184038 () Bool)

(assert (=> b!333982 (=> (not res!184038) (not e!205042))))

(assert (=> b!333982 (= res!184038 (and (= (size!8509 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8508 _keys!1895) (size!8509 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333983 () Bool)

(declare-fun res!184040 () Bool)

(assert (=> b!333983 (=> (not res!184040) (not e!205042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333983 (= res!184040 (validKeyInArray!0 k!1348))))

(declare-fun b!333984 () Bool)

(declare-fun e!205045 () Bool)

(assert (=> b!333984 (= e!205045 tp_is_empty!6829)))

(declare-fun b!333985 () Bool)

(assert (=> b!333985 (= e!205044 (and e!205045 mapRes!11640))))

(declare-fun condMapEmpty!11640 () Bool)

(declare-fun mapDefault!11640 () ValueCell!3071)

