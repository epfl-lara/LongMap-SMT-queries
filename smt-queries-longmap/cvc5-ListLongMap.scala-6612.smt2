; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83556 () Bool)

(assert start!83556)

(declare-fun b_free!19543 () Bool)

(declare-fun b_next!19543 () Bool)

(assert (=> start!83556 (= b_free!19543 (not b_next!19543))))

(declare-fun tp!67916 () Bool)

(declare-fun b_and!31181 () Bool)

(assert (=> start!83556 (= tp!67916 b_and!31181)))

(declare-fun b!976398 () Bool)

(declare-fun e!550260 () Bool)

(declare-fun tp_is_empty!22447 () Bool)

(assert (=> b!976398 (= e!550260 tp_is_empty!22447)))

(declare-fun b!976399 () Bool)

(declare-fun res!653647 () Bool)

(declare-fun e!550259 () Bool)

(assert (=> b!976399 (=> (not res!653647) (not e!550259))))

(declare-datatypes ((array!60921 0))(
  ( (array!60922 (arr!29324 (Array (_ BitVec 32) (_ BitVec 64))) (size!29803 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60921)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976399 (= res!653647 (validKeyInArray!0 (select (arr!29324 _keys!1717) i!822)))))

(declare-fun b!976400 () Bool)

(declare-fun res!653646 () Bool)

(assert (=> b!976400 (=> (not res!653646) (not e!550259))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60921 (_ BitVec 32)) Bool)

(assert (=> b!976400 (= res!653646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976401 () Bool)

(declare-fun res!653648 () Bool)

(assert (=> b!976401 (=> (not res!653648) (not e!550259))))

(declare-datatypes ((V!34913 0))(
  ( (V!34914 (val!11274 Int)) )
))
(declare-datatypes ((ValueCell!10742 0))(
  ( (ValueCellFull!10742 (v!13833 V!34913)) (EmptyCell!10742) )
))
(declare-datatypes ((array!60923 0))(
  ( (array!60924 (arr!29325 (Array (_ BitVec 32) ValueCell!10742)) (size!29804 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60923)

(declare-fun zeroValue!1367 () V!34913)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34913)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14508 0))(
  ( (tuple2!14509 (_1!7265 (_ BitVec 64)) (_2!7265 V!34913)) )
))
(declare-datatypes ((List!20358 0))(
  ( (Nil!20355) (Cons!20354 (h!21516 tuple2!14508) (t!28871 List!20358)) )
))
(declare-datatypes ((ListLongMap!13205 0))(
  ( (ListLongMap!13206 (toList!6618 List!20358)) )
))
(declare-fun contains!5696 (ListLongMap!13205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3851 (array!60921 array!60923 (_ BitVec 32) (_ BitVec 32) V!34913 V!34913 (_ BitVec 32) Int) ListLongMap!13205)

(assert (=> b!976401 (= res!653648 (contains!5696 (getCurrentListMap!3851 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29324 _keys!1717) i!822)))))

(declare-fun b!976402 () Bool)

(declare-fun res!653652 () Bool)

(assert (=> b!976402 (=> (not res!653652) (not e!550259))))

(declare-datatypes ((List!20359 0))(
  ( (Nil!20356) (Cons!20355 (h!21517 (_ BitVec 64)) (t!28872 List!20359)) )
))
(declare-fun arrayNoDuplicates!0 (array!60921 (_ BitVec 32) List!20359) Bool)

(assert (=> b!976402 (= res!653652 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20356))))

(declare-fun b!976404 () Bool)

(declare-fun res!653651 () Bool)

(assert (=> b!976404 (=> (not res!653651) (not e!550259))))

(assert (=> b!976404 (= res!653651 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29803 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29803 _keys!1717))))))

(declare-fun b!976405 () Bool)

(declare-fun e!550262 () Bool)

(declare-fun mapRes!35680 () Bool)

(assert (=> b!976405 (= e!550262 (and e!550260 mapRes!35680))))

(declare-fun condMapEmpty!35680 () Bool)

(declare-fun mapDefault!35680 () ValueCell!10742)

