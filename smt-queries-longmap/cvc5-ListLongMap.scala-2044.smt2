; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35432 () Bool)

(assert start!35432)

(declare-fun b_free!7819 () Bool)

(declare-fun b_next!7819 () Bool)

(assert (=> start!35432 (= b_free!7819 (not b_next!7819))))

(declare-fun tp!27243 () Bool)

(declare-fun b_and!15061 () Bool)

(assert (=> start!35432 (= tp!27243 b_and!15061)))

(declare-fun b!354740 () Bool)

(declare-fun e!217434 () Bool)

(assert (=> b!354740 (= e!217434 (not true))))

(declare-datatypes ((V!11491 0))(
  ( (V!11492 (val!3987 Int)) )
))
(declare-fun minValue!1150 () V!11491)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19351 0))(
  ( (array!19352 (arr!9169 (Array (_ BitVec 32) (_ BitVec 64))) (size!9521 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19351)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3599 0))(
  ( (ValueCellFull!3599 (v!6181 V!11491)) (EmptyCell!3599) )
))
(declare-datatypes ((array!19353 0))(
  ( (array!19354 (arr!9170 (Array (_ BitVec 32) ValueCell!3599)) (size!9522 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19353)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11491)

(declare-datatypes ((tuple2!5664 0))(
  ( (tuple2!5665 (_1!2843 (_ BitVec 64)) (_2!2843 V!11491)) )
))
(declare-datatypes ((List!5308 0))(
  ( (Nil!5305) (Cons!5304 (h!6160 tuple2!5664) (t!10458 List!5308)) )
))
(declare-datatypes ((ListLongMap!4577 0))(
  ( (ListLongMap!4578 (toList!2304 List!5308)) )
))
(declare-fun contains!2384 (ListLongMap!4577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1825 (array!19351 array!19353 (_ BitVec 32) (_ BitVec 32) V!11491 V!11491 (_ BitVec 32) Int) ListLongMap!4577)

(assert (=> b!354740 (contains!2384 (getCurrentListMap!1825 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9169 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10930 0))(
  ( (Unit!10931) )
))
(declare-fun lt!165743 () Unit!10930)

(declare-fun lemmaValidKeyInArrayIsInListMap!182 (array!19351 array!19353 (_ BitVec 32) (_ BitVec 32) V!11491 V!11491 (_ BitVec 32) Int) Unit!10930)

(assert (=> b!354740 (= lt!165743 (lemmaValidKeyInArrayIsInListMap!182 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapNonEmpty!13335 () Bool)

(declare-fun mapRes!13335 () Bool)

(declare-fun tp!27242 () Bool)

(declare-fun e!217433 () Bool)

(assert (=> mapNonEmpty!13335 (= mapRes!13335 (and tp!27242 e!217433))))

(declare-fun mapKey!13335 () (_ BitVec 32))

(declare-fun mapRest!13335 () (Array (_ BitVec 32) ValueCell!3599))

(declare-fun mapValue!13335 () ValueCell!3599)

(assert (=> mapNonEmpty!13335 (= (arr!9170 _values!1208) (store mapRest!13335 mapKey!13335 mapValue!13335))))

(declare-fun b!354741 () Bool)

(declare-fun e!217432 () Bool)

(declare-fun e!217436 () Bool)

(assert (=> b!354741 (= e!217432 (and e!217436 mapRes!13335))))

(declare-fun condMapEmpty!13335 () Bool)

(declare-fun mapDefault!13335 () ValueCell!3599)

