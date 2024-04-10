; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37834 () Bool)

(assert start!37834)

(declare-fun b_free!8915 () Bool)

(declare-fun b_next!8915 () Bool)

(assert (=> start!37834 (= b_free!8915 (not b_next!8915))))

(declare-fun tp!31499 () Bool)

(declare-fun b_and!16169 () Bool)

(assert (=> start!37834 (= tp!31499 b_and!16169)))

(declare-fun b!388767 () Bool)

(declare-fun res!222344 () Bool)

(declare-fun e!235552 () Bool)

(assert (=> b!388767 (=> (not res!222344) (not e!235552))))

(declare-datatypes ((array!23067 0))(
  ( (array!23068 (arr!11001 (Array (_ BitVec 32) (_ BitVec 64))) (size!11353 (_ BitVec 32))) )
))
(declare-fun lt!182606 () array!23067)

(declare-datatypes ((List!6359 0))(
  ( (Nil!6356) (Cons!6355 (h!7211 (_ BitVec 64)) (t!11511 List!6359)) )
))
(declare-fun arrayNoDuplicates!0 (array!23067 (_ BitVec 32) List!6359) Bool)

(assert (=> b!388767 (= res!222344 (arrayNoDuplicates!0 lt!182606 #b00000000000000000000000000000000 Nil!6356))))

(declare-fun mapNonEmpty!15948 () Bool)

(declare-fun mapRes!15948 () Bool)

(declare-fun tp!31500 () Bool)

(declare-fun e!235553 () Bool)

(assert (=> mapNonEmpty!15948 (= mapRes!15948 (and tp!31500 e!235553))))

(declare-datatypes ((V!13887 0))(
  ( (V!13888 (val!4838 Int)) )
))
(declare-datatypes ((ValueCell!4450 0))(
  ( (ValueCellFull!4450 (v!7039 V!13887)) (EmptyCell!4450) )
))
(declare-fun mapValue!15948 () ValueCell!4450)

(declare-datatypes ((array!23069 0))(
  ( (array!23070 (arr!11002 (Array (_ BitVec 32) ValueCell!4450)) (size!11354 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23069)

(declare-fun mapRest!15948 () (Array (_ BitVec 32) ValueCell!4450))

(declare-fun mapKey!15948 () (_ BitVec 32))

(assert (=> mapNonEmpty!15948 (= (arr!11002 _values!506) (store mapRest!15948 mapKey!15948 mapValue!15948))))

(declare-fun b!388769 () Bool)

(declare-fun res!222343 () Bool)

(declare-fun e!235551 () Bool)

(assert (=> b!388769 (=> (not res!222343) (not e!235551))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!23067)

(assert (=> b!388769 (= res!222343 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11353 _keys!658))))))

(declare-fun b!388770 () Bool)

(declare-fun e!235555 () Bool)

(declare-fun tp_is_empty!9587 () Bool)

(assert (=> b!388770 (= e!235555 tp_is_empty!9587)))

(declare-fun b!388771 () Bool)

(declare-fun res!222335 () Bool)

(assert (=> b!388771 (=> (not res!222335) (not e!235551))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388771 (= res!222335 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!388772 () Bool)

(assert (=> b!388772 (= e!235551 e!235552)))

(declare-fun res!222336 () Bool)

(assert (=> b!388772 (=> (not res!222336) (not e!235552))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23067 (_ BitVec 32)) Bool)

(assert (=> b!388772 (= res!222336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182606 mask!970))))

(assert (=> b!388772 (= lt!182606 (array!23068 (store (arr!11001 _keys!658) i!548 k!778) (size!11353 _keys!658)))))

(declare-fun b!388773 () Bool)

(assert (=> b!388773 (= e!235553 tp_is_empty!9587)))

(declare-fun b!388774 () Bool)

(declare-fun e!235554 () Bool)

(assert (=> b!388774 (= e!235552 (not e!235554))))

(declare-fun res!222340 () Bool)

(assert (=> b!388774 (=> res!222340 e!235554)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388774 (= res!222340 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6506 0))(
  ( (tuple2!6507 (_1!3264 (_ BitVec 64)) (_2!3264 V!13887)) )
))
(declare-datatypes ((List!6360 0))(
  ( (Nil!6357) (Cons!6356 (h!7212 tuple2!6506) (t!11512 List!6360)) )
))
(declare-datatypes ((ListLongMap!5419 0))(
  ( (ListLongMap!5420 (toList!2725 List!6360)) )
))
(declare-fun lt!182602 () ListLongMap!5419)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13887)

(declare-fun minValue!472 () V!13887)

(declare-fun getCurrentListMap!2074 (array!23067 array!23069 (_ BitVec 32) (_ BitVec 32) V!13887 V!13887 (_ BitVec 32) Int) ListLongMap!5419)

(assert (=> b!388774 (= lt!182602 (getCurrentListMap!2074 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182603 () array!23069)

(declare-fun lt!182601 () ListLongMap!5419)

(assert (=> b!388774 (= lt!182601 (getCurrentListMap!2074 lt!182606 lt!182603 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182599 () ListLongMap!5419)

(declare-fun lt!182600 () ListLongMap!5419)

(assert (=> b!388774 (and (= lt!182599 lt!182600) (= lt!182600 lt!182599))))

(declare-fun lt!182608 () ListLongMap!5419)

(declare-fun v!373 () V!13887)

(declare-fun +!1020 (ListLongMap!5419 tuple2!6506) ListLongMap!5419)

(assert (=> b!388774 (= lt!182600 (+!1020 lt!182608 (tuple2!6507 k!778 v!373)))))

(declare-datatypes ((Unit!11916 0))(
  ( (Unit!11917) )
))
(declare-fun lt!182604 () Unit!11916)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!238 (array!23067 array!23069 (_ BitVec 32) (_ BitVec 32) V!13887 V!13887 (_ BitVec 32) (_ BitVec 64) V!13887 (_ BitVec 32) Int) Unit!11916)

(assert (=> b!388774 (= lt!182604 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!238 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!954 (array!23067 array!23069 (_ BitVec 32) (_ BitVec 32) V!13887 V!13887 (_ BitVec 32) Int) ListLongMap!5419)

(assert (=> b!388774 (= lt!182599 (getCurrentListMapNoExtraKeys!954 lt!182606 lt!182603 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388774 (= lt!182603 (array!23070 (store (arr!11002 _values!506) i!548 (ValueCellFull!4450 v!373)) (size!11354 _values!506)))))

(assert (=> b!388774 (= lt!182608 (getCurrentListMapNoExtraKeys!954 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388775 () Bool)

(declare-fun res!222345 () Bool)

(assert (=> b!388775 (=> (not res!222345) (not e!235551))))

(assert (=> b!388775 (= res!222345 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6356))))

(declare-fun b!388776 () Bool)

(declare-fun res!222338 () Bool)

(assert (=> b!388776 (=> (not res!222338) (not e!235551))))

(assert (=> b!388776 (= res!222338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15948 () Bool)

(assert (=> mapIsEmpty!15948 mapRes!15948))

(declare-fun b!388777 () Bool)

(declare-fun res!222341 () Bool)

(assert (=> b!388777 (=> (not res!222341) (not e!235551))))

(assert (=> b!388777 (= res!222341 (and (= (size!11354 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11353 _keys!658) (size!11354 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388778 () Bool)

(declare-fun res!222337 () Bool)

(assert (=> b!388778 (=> (not res!222337) (not e!235551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388778 (= res!222337 (validKeyInArray!0 k!778))))

(declare-fun res!222339 () Bool)

(assert (=> start!37834 (=> (not res!222339) (not e!235551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37834 (= res!222339 (validMask!0 mask!970))))

(assert (=> start!37834 e!235551))

(declare-fun e!235549 () Bool)

(declare-fun array_inv!8088 (array!23069) Bool)

(assert (=> start!37834 (and (array_inv!8088 _values!506) e!235549)))

(assert (=> start!37834 tp!31499))

(assert (=> start!37834 true))

(assert (=> start!37834 tp_is_empty!9587))

(declare-fun array_inv!8089 (array!23067) Bool)

(assert (=> start!37834 (array_inv!8089 _keys!658)))

(declare-fun b!388768 () Bool)

(assert (=> b!388768 (= e!235549 (and e!235555 mapRes!15948))))

(declare-fun condMapEmpty!15948 () Bool)

(declare-fun mapDefault!15948 () ValueCell!4450)

