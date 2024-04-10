; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83562 () Bool)

(assert start!83562)

(declare-fun b_free!19549 () Bool)

(declare-fun b_next!19549 () Bool)

(assert (=> start!83562 (= b_free!19549 (not b_next!19549))))

(declare-fun tp!67934 () Bool)

(declare-fun b_and!31187 () Bool)

(assert (=> start!83562 (= tp!67934 b_and!31187)))

(declare-fun b!976497 () Bool)

(declare-fun e!550313 () Bool)

(declare-fun tp_is_empty!22453 () Bool)

(assert (=> b!976497 (= e!550313 tp_is_empty!22453)))

(declare-fun e!550314 () Bool)

(declare-fun b!976498 () Bool)

(declare-datatypes ((array!60931 0))(
  ( (array!60932 (arr!29329 (Array (_ BitVec 32) (_ BitVec 64))) (size!29808 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60931)

(declare-datatypes ((V!34921 0))(
  ( (V!34922 (val!11277 Int)) )
))
(declare-datatypes ((tuple2!14512 0))(
  ( (tuple2!14513 (_1!7267 (_ BitVec 64)) (_2!7267 V!34921)) )
))
(declare-datatypes ((List!20362 0))(
  ( (Nil!20359) (Cons!20358 (h!21520 tuple2!14512) (t!28875 List!20362)) )
))
(declare-datatypes ((ListLongMap!13209 0))(
  ( (ListLongMap!13210 (toList!6620 List!20362)) )
))
(declare-fun lt!433139 () ListLongMap!13209)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5698 (ListLongMap!13209 (_ BitVec 64)) Bool)

(assert (=> b!976498 (= e!550314 (not (contains!5698 lt!433139 (select (arr!29329 _keys!1717) i!822))))))

(declare-fun b!976499 () Bool)

(declare-fun res!653722 () Bool)

(declare-fun e!550315 () Bool)

(assert (=> b!976499 (=> (not res!653722) (not e!550315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976499 (= res!653722 (validKeyInArray!0 (select (arr!29329 _keys!1717) i!822)))))

(declare-fun b!976500 () Bool)

(declare-fun res!653719 () Bool)

(assert (=> b!976500 (=> (not res!653719) (not e!550315))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60931 (_ BitVec 32)) Bool)

(assert (=> b!976500 (= res!653719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976501 () Bool)

(declare-fun e!550316 () Bool)

(assert (=> b!976501 (= e!550316 tp_is_empty!22453)))

(declare-fun b!976502 () Bool)

(declare-fun res!653721 () Bool)

(assert (=> b!976502 (=> (not res!653721) (not e!550315))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976502 (= res!653721 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29808 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29808 _keys!1717))))))

(declare-fun b!976503 () Bool)

(declare-fun e!550317 () Bool)

(declare-fun mapRes!35689 () Bool)

(assert (=> b!976503 (= e!550317 (and e!550313 mapRes!35689))))

(declare-fun condMapEmpty!35689 () Bool)

(declare-datatypes ((ValueCell!10745 0))(
  ( (ValueCellFull!10745 (v!13836 V!34921)) (EmptyCell!10745) )
))
(declare-datatypes ((array!60933 0))(
  ( (array!60934 (arr!29330 (Array (_ BitVec 32) ValueCell!10745)) (size!29809 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60933)

(declare-fun mapDefault!35689 () ValueCell!10745)

