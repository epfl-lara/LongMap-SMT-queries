; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37996 () Bool)

(assert start!37996)

(declare-fun b_free!8965 () Bool)

(declare-fun b_next!8965 () Bool)

(assert (=> start!37996 (= b_free!8965 (not b_next!8965))))

(declare-fun tp!31664 () Bool)

(declare-fun b_and!16279 () Bool)

(assert (=> start!37996 (= tp!31664 b_and!16279)))

(declare-fun b!390908 () Bool)

(declare-fun res!223691 () Bool)

(declare-fun e!236788 () Bool)

(assert (=> b!390908 (=> (not res!223691) (not e!236788))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23175 0))(
  ( (array!23176 (arr!11050 (Array (_ BitVec 32) (_ BitVec 64))) (size!11402 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23175)

(assert (=> b!390908 (= res!223691 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11402 _keys!658))))))

(declare-fun b!390910 () Bool)

(declare-fun e!236791 () Bool)

(assert (=> b!390910 (= e!236788 e!236791)))

(declare-fun res!223693 () Bool)

(assert (=> b!390910 (=> (not res!223693) (not e!236791))))

(declare-fun lt!184344 () array!23175)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23175 (_ BitVec 32)) Bool)

(assert (=> b!390910 (= res!223693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184344 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!390910 (= lt!184344 (array!23176 (store (arr!11050 _keys!658) i!548 k!778) (size!11402 _keys!658)))))

(declare-fun mapNonEmpty!16038 () Bool)

(declare-fun mapRes!16038 () Bool)

(declare-fun tp!31665 () Bool)

(declare-fun e!236786 () Bool)

(assert (=> mapNonEmpty!16038 (= mapRes!16038 (and tp!31665 e!236786))))

(declare-datatypes ((V!13955 0))(
  ( (V!13956 (val!4863 Int)) )
))
(declare-datatypes ((ValueCell!4475 0))(
  ( (ValueCellFull!4475 (v!7084 V!13955)) (EmptyCell!4475) )
))
(declare-datatypes ((array!23177 0))(
  ( (array!23178 (arr!11051 (Array (_ BitVec 32) ValueCell!4475)) (size!11403 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23177)

(declare-fun mapValue!16038 () ValueCell!4475)

(declare-fun mapKey!16038 () (_ BitVec 32))

(declare-fun mapRest!16038 () (Array (_ BitVec 32) ValueCell!4475))

(assert (=> mapNonEmpty!16038 (= (arr!11051 _values!506) (store mapRest!16038 mapKey!16038 mapValue!16038))))

(declare-fun b!390911 () Bool)

(declare-fun res!223696 () Bool)

(assert (=> b!390911 (=> (not res!223696) (not e!236791))))

(declare-datatypes ((List!6401 0))(
  ( (Nil!6398) (Cons!6397 (h!7253 (_ BitVec 64)) (t!11563 List!6401)) )
))
(declare-fun arrayNoDuplicates!0 (array!23175 (_ BitVec 32) List!6401) Bool)

(assert (=> b!390911 (= res!223696 (arrayNoDuplicates!0 lt!184344 #b00000000000000000000000000000000 Nil!6398))))

(declare-fun b!390912 () Bool)

(declare-fun res!223697 () Bool)

(assert (=> b!390912 (=> (not res!223697) (not e!236788))))

(declare-fun arrayContainsKey!0 (array!23175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390912 (= res!223697 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!390913 () Bool)

(declare-fun res!223692 () Bool)

(assert (=> b!390913 (=> (not res!223692) (not e!236788))))

(assert (=> b!390913 (= res!223692 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6398))))

(declare-fun b!390914 () Bool)

(declare-fun res!223698 () Bool)

(assert (=> b!390914 (=> (not res!223698) (not e!236788))))

(assert (=> b!390914 (= res!223698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390915 () Bool)

(declare-fun res!223700 () Bool)

(assert (=> b!390915 (=> (not res!223700) (not e!236788))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390915 (= res!223700 (and (= (size!11403 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11402 _keys!658) (size!11403 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16038 () Bool)

(assert (=> mapIsEmpty!16038 mapRes!16038))

(declare-fun b!390916 () Bool)

(declare-fun e!236789 () Bool)

(declare-fun tp_is_empty!9637 () Bool)

(assert (=> b!390916 (= e!236789 tp_is_empty!9637)))

(declare-fun e!236787 () Bool)

(declare-datatypes ((tuple2!6546 0))(
  ( (tuple2!6547 (_1!3284 (_ BitVec 64)) (_2!3284 V!13955)) )
))
(declare-fun lt!184348 () tuple2!6546)

(declare-fun b!390917 () Bool)

(declare-datatypes ((List!6402 0))(
  ( (Nil!6399) (Cons!6398 (h!7254 tuple2!6546) (t!11564 List!6402)) )
))
(declare-datatypes ((ListLongMap!5459 0))(
  ( (ListLongMap!5460 (toList!2745 List!6402)) )
))
(declare-fun lt!184345 () ListLongMap!5459)

(declare-fun lt!184347 () ListLongMap!5459)

(declare-fun +!1040 (ListLongMap!5459 tuple2!6546) ListLongMap!5459)

(assert (=> b!390917 (= e!236787 (= lt!184347 (+!1040 lt!184345 lt!184348)))))

(declare-fun b!390918 () Bool)

(declare-fun e!236793 () Bool)

(assert (=> b!390918 (= e!236793 (and e!236789 mapRes!16038))))

(declare-fun condMapEmpty!16038 () Bool)

(declare-fun mapDefault!16038 () ValueCell!4475)

