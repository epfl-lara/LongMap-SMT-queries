; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82678 () Bool)

(assert start!82678)

(declare-fun b_free!18811 () Bool)

(declare-fun b_next!18811 () Bool)

(assert (=> start!82678 (= b_free!18811 (not b_next!18811))))

(declare-fun tp!65553 () Bool)

(declare-fun b_and!30299 () Bool)

(assert (=> start!82678 (= tp!65553 b_and!30299)))

(declare-fun b!963956 () Bool)

(declare-fun res!645171 () Bool)

(declare-fun e!543468 () Bool)

(assert (=> b!963956 (=> (not res!645171) (not e!543468))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963956 (= res!645171 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963957 () Bool)

(declare-fun res!645176 () Bool)

(assert (=> b!963957 (=> (not res!645176) (not e!543468))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33801 0))(
  ( (V!33802 (val!10857 Int)) )
))
(declare-datatypes ((ValueCell!10325 0))(
  ( (ValueCellFull!10325 (v!13415 V!33801)) (EmptyCell!10325) )
))
(declare-datatypes ((array!59315 0))(
  ( (array!59316 (arr!28526 (Array (_ BitVec 32) ValueCell!10325)) (size!29005 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59315)

(declare-datatypes ((array!59317 0))(
  ( (array!59318 (arr!28527 (Array (_ BitVec 32) (_ BitVec 64))) (size!29006 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59317)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963957 (= res!645176 (and (= (size!29005 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29006 _keys!1686) (size!29005 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963958 () Bool)

(declare-fun e!543471 () Bool)

(declare-fun tp_is_empty!21613 () Bool)

(assert (=> b!963958 (= e!543471 tp_is_empty!21613)))

(declare-fun mapNonEmpty!34414 () Bool)

(declare-fun mapRes!34414 () Bool)

(declare-fun tp!65552 () Bool)

(declare-fun e!543472 () Bool)

(assert (=> mapNonEmpty!34414 (= mapRes!34414 (and tp!65552 e!543472))))

(declare-fun mapKey!34414 () (_ BitVec 32))

(declare-fun mapRest!34414 () (Array (_ BitVec 32) ValueCell!10325))

(declare-fun mapValue!34414 () ValueCell!10325)

(assert (=> mapNonEmpty!34414 (= (arr!28526 _values!1400) (store mapRest!34414 mapKey!34414 mapValue!34414))))

(declare-fun res!645178 () Bool)

(assert (=> start!82678 (=> (not res!645178) (not e!543468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82678 (= res!645178 (validMask!0 mask!2110))))

(assert (=> start!82678 e!543468))

(assert (=> start!82678 true))

(declare-fun e!543469 () Bool)

(declare-fun array_inv!22093 (array!59315) Bool)

(assert (=> start!82678 (and (array_inv!22093 _values!1400) e!543469)))

(declare-fun array_inv!22094 (array!59317) Bool)

(assert (=> start!82678 (array_inv!22094 _keys!1686)))

(assert (=> start!82678 tp!65553))

(assert (=> start!82678 tp_is_empty!21613))

(declare-fun b!963959 () Bool)

(declare-fun e!543470 () Bool)

(assert (=> b!963959 (= e!543468 (not e!543470))))

(declare-fun res!645174 () Bool)

(assert (=> b!963959 (=> res!645174 e!543470)))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963959 (= res!645174 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29006 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!33801)

(declare-fun zeroValue!1342 () V!33801)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!13948 0))(
  ( (tuple2!13949 (_1!6985 (_ BitVec 64)) (_2!6985 V!33801)) )
))
(declare-datatypes ((List!19798 0))(
  ( (Nil!19795) (Cons!19794 (h!20956 tuple2!13948) (t!28161 List!19798)) )
))
(declare-datatypes ((ListLongMap!12645 0))(
  ( (ListLongMap!12646 (toList!6338 List!19798)) )
))
(declare-fun contains!5441 (ListLongMap!12645 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3571 (array!59317 array!59315 (_ BitVec 32) (_ BitVec 32) V!33801 V!33801 (_ BitVec 32) Int) ListLongMap!12645)

(assert (=> b!963959 (contains!5441 (getCurrentListMap!3571 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28527 _keys!1686) i!803))))

(declare-datatypes ((Unit!32259 0))(
  ( (Unit!32260) )
))
(declare-fun lt!431022 () Unit!32259)

(declare-fun lemmaInListMapFromThenInFromMinusOne!24 (array!59317 array!59315 (_ BitVec 32) (_ BitVec 32) V!33801 V!33801 (_ BitVec 32) (_ BitVec 32) Int) Unit!32259)

(assert (=> b!963959 (= lt!431022 (lemmaInListMapFromThenInFromMinusOne!24 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34414 () Bool)

(assert (=> mapIsEmpty!34414 mapRes!34414))

(declare-fun b!963960 () Bool)

(declare-fun res!645175 () Bool)

(assert (=> b!963960 (=> (not res!645175) (not e!543468))))

(assert (=> b!963960 (= res!645175 (contains!5441 (getCurrentListMap!3571 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28527 _keys!1686) i!803)))))

(declare-fun b!963961 () Bool)

(assert (=> b!963961 (= e!543469 (and e!543471 mapRes!34414))))

(declare-fun condMapEmpty!34414 () Bool)

(declare-fun mapDefault!34414 () ValueCell!10325)

