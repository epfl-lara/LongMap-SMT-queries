; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37682 () Bool)

(assert start!37682)

(declare-fun b_free!8785 () Bool)

(declare-fun b_next!8785 () Bool)

(assert (=> start!37682 (= b_free!8785 (not b_next!8785))))

(declare-fun tp!31106 () Bool)

(declare-fun b_and!16027 () Bool)

(assert (=> start!37682 (= tp!31106 b_and!16027)))

(declare-fun b!386012 () Bool)

(declare-fun res!220278 () Bool)

(declare-fun e!234233 () Bool)

(assert (=> b!386012 (=> (not res!220278) (not e!234233))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22813 0))(
  ( (array!22814 (arr!10875 (Array (_ BitVec 32) (_ BitVec 64))) (size!11227 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22813)

(assert (=> b!386012 (= res!220278 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11227 _keys!658))))))

(declare-fun b!386013 () Bool)

(declare-fun res!220279 () Bool)

(assert (=> b!386013 (=> (not res!220279) (not e!234233))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13715 0))(
  ( (V!13716 (val!4773 Int)) )
))
(declare-datatypes ((ValueCell!4385 0))(
  ( (ValueCellFull!4385 (v!6970 V!13715)) (EmptyCell!4385) )
))
(declare-datatypes ((array!22815 0))(
  ( (array!22816 (arr!10876 (Array (_ BitVec 32) ValueCell!4385)) (size!11228 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22815)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!386013 (= res!220279 (and (= (size!11228 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11227 _keys!658) (size!11228 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15750 () Bool)

(declare-fun mapRes!15750 () Bool)

(assert (=> mapIsEmpty!15750 mapRes!15750))

(declare-fun b!386014 () Bool)

(declare-fun res!220284 () Bool)

(assert (=> b!386014 (=> (not res!220284) (not e!234233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22813 (_ BitVec 32)) Bool)

(assert (=> b!386014 (= res!220284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386015 () Bool)

(declare-fun res!220282 () Bool)

(assert (=> b!386015 (=> (not res!220282) (not e!234233))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386015 (= res!220282 (validKeyInArray!0 k!778))))

(declare-fun b!386016 () Bool)

(declare-fun e!234232 () Bool)

(declare-fun tp_is_empty!9457 () Bool)

(assert (=> b!386016 (= e!234232 tp_is_empty!9457)))

(declare-fun b!386017 () Bool)

(declare-fun res!220285 () Bool)

(assert (=> b!386017 (=> (not res!220285) (not e!234233))))

(assert (=> b!386017 (= res!220285 (or (= (select (arr!10875 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10875 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!220277 () Bool)

(assert (=> start!37682 (=> (not res!220277) (not e!234233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37682 (= res!220277 (validMask!0 mask!970))))

(assert (=> start!37682 e!234233))

(declare-fun e!234235 () Bool)

(declare-fun array_inv!8004 (array!22815) Bool)

(assert (=> start!37682 (and (array_inv!8004 _values!506) e!234235)))

(assert (=> start!37682 tp!31106))

(assert (=> start!37682 true))

(assert (=> start!37682 tp_is_empty!9457))

(declare-fun array_inv!8005 (array!22813) Bool)

(assert (=> start!37682 (array_inv!8005 _keys!658)))

(declare-fun b!386018 () Bool)

(declare-fun e!234236 () Bool)

(assert (=> b!386018 (= e!234236 tp_is_empty!9457)))

(declare-fun b!386019 () Bool)

(declare-fun res!220281 () Bool)

(assert (=> b!386019 (=> (not res!220281) (not e!234233))))

(declare-datatypes ((List!6262 0))(
  ( (Nil!6259) (Cons!6258 (h!7114 (_ BitVec 64)) (t!11412 List!6262)) )
))
(declare-fun arrayNoDuplicates!0 (array!22813 (_ BitVec 32) List!6262) Bool)

(assert (=> b!386019 (= res!220281 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6259))))

(declare-fun b!386020 () Bool)

(declare-fun e!234231 () Bool)

(assert (=> b!386020 (= e!234231 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13715)

(declare-fun v!373 () V!13715)

(declare-fun lt!181710 () array!22813)

(declare-datatypes ((tuple2!6416 0))(
  ( (tuple2!6417 (_1!3219 (_ BitVec 64)) (_2!3219 V!13715)) )
))
(declare-datatypes ((List!6263 0))(
  ( (Nil!6260) (Cons!6259 (h!7115 tuple2!6416) (t!11413 List!6263)) )
))
(declare-datatypes ((ListLongMap!5329 0))(
  ( (ListLongMap!5330 (toList!2680 List!6263)) )
))
(declare-fun lt!181709 () ListLongMap!5329)

(declare-fun minValue!472 () V!13715)

(declare-fun getCurrentListMapNoExtraKeys!909 (array!22813 array!22815 (_ BitVec 32) (_ BitVec 32) V!13715 V!13715 (_ BitVec 32) Int) ListLongMap!5329)

(assert (=> b!386020 (= lt!181709 (getCurrentListMapNoExtraKeys!909 lt!181710 (array!22816 (store (arr!10876 _values!506) i!548 (ValueCellFull!4385 v!373)) (size!11228 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181708 () ListLongMap!5329)

(assert (=> b!386020 (= lt!181708 (getCurrentListMapNoExtraKeys!909 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15750 () Bool)

(declare-fun tp!31107 () Bool)

(assert (=> mapNonEmpty!15750 (= mapRes!15750 (and tp!31107 e!234232))))

(declare-fun mapRest!15750 () (Array (_ BitVec 32) ValueCell!4385))

(declare-fun mapKey!15750 () (_ BitVec 32))

(declare-fun mapValue!15750 () ValueCell!4385)

(assert (=> mapNonEmpty!15750 (= (arr!10876 _values!506) (store mapRest!15750 mapKey!15750 mapValue!15750))))

(declare-fun b!386021 () Bool)

(assert (=> b!386021 (= e!234233 e!234231)))

(declare-fun res!220283 () Bool)

(assert (=> b!386021 (=> (not res!220283) (not e!234231))))

(assert (=> b!386021 (= res!220283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181710 mask!970))))

(assert (=> b!386021 (= lt!181710 (array!22814 (store (arr!10875 _keys!658) i!548 k!778) (size!11227 _keys!658)))))

(declare-fun b!386022 () Bool)

(declare-fun res!220286 () Bool)

(assert (=> b!386022 (=> (not res!220286) (not e!234233))))

(declare-fun arrayContainsKey!0 (array!22813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386022 (= res!220286 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386023 () Bool)

(declare-fun res!220280 () Bool)

(assert (=> b!386023 (=> (not res!220280) (not e!234231))))

(assert (=> b!386023 (= res!220280 (arrayNoDuplicates!0 lt!181710 #b00000000000000000000000000000000 Nil!6259))))

(declare-fun b!386024 () Bool)

(assert (=> b!386024 (= e!234235 (and e!234236 mapRes!15750))))

(declare-fun condMapEmpty!15750 () Bool)

(declare-fun mapDefault!15750 () ValueCell!4385)

