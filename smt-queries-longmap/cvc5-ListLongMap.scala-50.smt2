; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!812 () Bool)

(assert start!812)

(declare-fun b_free!205 () Bool)

(declare-fun b_next!205 () Bool)

(assert (=> start!812 (= b_free!205 (not b_next!205))))

(declare-fun tp!844 () Bool)

(declare-fun b_and!351 () Bool)

(assert (=> start!812 (= tp!844 b_and!351)))

(declare-fun b!6158 () Bool)

(declare-fun res!6650 () Bool)

(declare-fun e!3369 () Bool)

(assert (=> b!6158 (=> (not res!6650) (not e!3369))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6158 (= res!6650 (validKeyInArray!0 k!1278))))

(declare-fun res!6648 () Bool)

(assert (=> start!812 (=> (not res!6648) (not e!3369))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!812 (= res!6648 (validMask!0 mask!2250))))

(assert (=> start!812 e!3369))

(assert (=> start!812 tp!844))

(assert (=> start!812 true))

(declare-datatypes ((V!555 0))(
  ( (V!556 (val!147 Int)) )
))
(declare-datatypes ((ValueCell!125 0))(
  ( (ValueCellFull!125 (v!1238 V!555)) (EmptyCell!125) )
))
(declare-datatypes ((array!499 0))(
  ( (array!500 (arr!238 (Array (_ BitVec 32) ValueCell!125)) (size!300 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!499)

(declare-fun e!3366 () Bool)

(declare-fun array_inv!171 (array!499) Bool)

(assert (=> start!812 (and (array_inv!171 _values!1492) e!3366)))

(declare-fun tp_is_empty!283 () Bool)

(assert (=> start!812 tp_is_empty!283))

(declare-datatypes ((array!501 0))(
  ( (array!502 (arr!239 (Array (_ BitVec 32) (_ BitVec 64))) (size!301 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!501)

(declare-fun array_inv!172 (array!501) Bool)

(assert (=> start!812 (array_inv!172 _keys!1806)))

(declare-fun b!6159 () Bool)

(declare-fun e!3364 () Bool)

(assert (=> b!6159 (= e!3364 tp_is_empty!283)))

(declare-fun b!6160 () Bool)

(declare-fun res!6651 () Bool)

(assert (=> b!6160 (=> (not res!6651) (not e!3369))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!555)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!555)

(declare-datatypes ((tuple2!150 0))(
  ( (tuple2!151 (_1!75 (_ BitVec 64)) (_2!75 V!555)) )
))
(declare-datatypes ((List!159 0))(
  ( (Nil!156) (Cons!155 (h!721 tuple2!150) (t!2294 List!159)) )
))
(declare-datatypes ((ListLongMap!155 0))(
  ( (ListLongMap!156 (toList!93 List!159)) )
))
(declare-fun contains!67 (ListLongMap!155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!52 (array!501 array!499 (_ BitVec 32) (_ BitVec 32) V!555 V!555 (_ BitVec 32) Int) ListLongMap!155)

(assert (=> b!6160 (= res!6651 (contains!67 (getCurrentListMap!52 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!6161 () Bool)

(declare-fun e!3367 () Bool)

(declare-fun arrayContainsKey!0 (array!501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6161 (= e!3367 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6162 () Bool)

(declare-fun e!3368 () Bool)

(assert (=> b!6162 (= e!3368 true)))

(declare-datatypes ((SeekEntryResult!14 0))(
  ( (MissingZero!14 (index!2175 (_ BitVec 32))) (Found!14 (index!2176 (_ BitVec 32))) (Intermediate!14 (undefined!826 Bool) (index!2177 (_ BitVec 32)) (x!2504 (_ BitVec 32))) (Undefined!14) (MissingVacant!14 (index!2178 (_ BitVec 32))) )
))
(declare-fun lt!1122 () SeekEntryResult!14)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!501 (_ BitVec 32)) SeekEntryResult!14)

(assert (=> b!6162 (= lt!1122 (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250))))

(declare-fun b!6163 () Bool)

(declare-fun e!3370 () Bool)

(assert (=> b!6163 (= e!3370 tp_is_empty!283)))

(declare-fun mapNonEmpty!395 () Bool)

(declare-fun mapRes!395 () Bool)

(declare-fun tp!845 () Bool)

(assert (=> mapNonEmpty!395 (= mapRes!395 (and tp!845 e!3364))))

(declare-fun mapKey!395 () (_ BitVec 32))

(declare-fun mapRest!395 () (Array (_ BitVec 32) ValueCell!125))

(declare-fun mapValue!395 () ValueCell!125)

(assert (=> mapNonEmpty!395 (= (arr!238 _values!1492) (store mapRest!395 mapKey!395 mapValue!395))))

(declare-fun mapIsEmpty!395 () Bool)

(assert (=> mapIsEmpty!395 mapRes!395))

(declare-fun b!6164 () Bool)

(assert (=> b!6164 (= e!3366 (and e!3370 mapRes!395))))

(declare-fun condMapEmpty!395 () Bool)

(declare-fun mapDefault!395 () ValueCell!125)

