; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33694 () Bool)

(assert start!33694)

(declare-fun b_free!6929 () Bool)

(declare-fun b_next!6929 () Bool)

(assert (=> start!33694 (= b_free!6929 (not b_next!6929))))

(declare-fun tp!24291 () Bool)

(declare-fun b_and!14109 () Bool)

(assert (=> start!33694 (= tp!24291 b_and!14109)))

(declare-fun b!334833 () Bool)

(declare-fun e!205518 () Bool)

(declare-fun e!205524 () Bool)

(assert (=> b!334833 (= e!205518 e!205524)))

(declare-fun res!184661 () Bool)

(assert (=> b!334833 (=> (not res!184661) (not e!205524))))

(declare-datatypes ((V!10151 0))(
  ( (V!10152 (val!3485 Int)) )
))
(declare-datatypes ((tuple2!5056 0))(
  ( (tuple2!5057 (_1!2539 (_ BitVec 64)) (_2!2539 V!10151)) )
))
(declare-datatypes ((List!4681 0))(
  ( (Nil!4678) (Cons!4677 (h!5533 tuple2!5056) (t!9769 List!4681)) )
))
(declare-datatypes ((ListLongMap!3969 0))(
  ( (ListLongMap!3970 (toList!2000 List!4681)) )
))
(declare-fun lt!159611 () ListLongMap!3969)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun contains!2044 (ListLongMap!3969 (_ BitVec 64)) Bool)

(assert (=> b!334833 (= res!184661 (not (contains!2044 lt!159611 k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10151)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3097 0))(
  ( (ValueCellFull!3097 (v!5647 V!10151)) (EmptyCell!3097) )
))
(declare-datatypes ((array!17355 0))(
  ( (array!17356 (arr!8208 (Array (_ BitVec 32) ValueCell!3097)) (size!8560 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17355)

(declare-datatypes ((array!17357 0))(
  ( (array!17358 (arr!8209 (Array (_ BitVec 32) (_ BitVec 64))) (size!8561 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17357)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10151)

(declare-fun getCurrentListMap!1528 (array!17357 array!17355 (_ BitVec 32) (_ BitVec 32) V!10151 V!10151 (_ BitVec 32) Int) ListLongMap!3969)

(assert (=> b!334833 (= lt!159611 (getCurrentListMap!1528 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334834 () Bool)

(declare-fun res!184667 () Bool)

(assert (=> b!334834 (=> (not res!184667) (not e!205518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334834 (= res!184667 (validKeyInArray!0 k!1348))))

(declare-fun b!334835 () Bool)

(declare-fun e!205521 () Bool)

(assert (=> b!334835 (= e!205524 e!205521)))

(declare-fun res!184663 () Bool)

(assert (=> b!334835 (=> (not res!184663) (not e!205521))))

(declare-datatypes ((SeekEntryResult!3171 0))(
  ( (MissingZero!3171 (index!14863 (_ BitVec 32))) (Found!3171 (index!14864 (_ BitVec 32))) (Intermediate!3171 (undefined!3983 Bool) (index!14865 (_ BitVec 32)) (x!33361 (_ BitVec 32))) (Undefined!3171) (MissingVacant!3171 (index!14866 (_ BitVec 32))) )
))
(declare-fun lt!159610 () SeekEntryResult!3171)

(assert (=> b!334835 (= res!184663 (and (is-Found!3171 lt!159610) (= (select (arr!8209 _keys!1895) (index!14864 lt!159610)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17357 (_ BitVec 32)) SeekEntryResult!3171)

(assert (=> b!334835 (= lt!159610 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334836 () Bool)

(declare-fun e!205522 () Bool)

(declare-fun e!205523 () Bool)

(declare-fun mapRes!11718 () Bool)

(assert (=> b!334836 (= e!205522 (and e!205523 mapRes!11718))))

(declare-fun condMapEmpty!11718 () Bool)

(declare-fun mapDefault!11718 () ValueCell!3097)

