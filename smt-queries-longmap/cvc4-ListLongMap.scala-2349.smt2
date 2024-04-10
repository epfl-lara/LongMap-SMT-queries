; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37560 () Bool)

(assert start!37560)

(declare-fun b_free!8687 () Bool)

(declare-fun b_next!8687 () Bool)

(assert (=> start!37560 (= b_free!8687 (not b_next!8687))))

(declare-fun tp!30776 () Bool)

(declare-fun b_and!15929 () Bool)

(assert (=> start!37560 (= tp!30776 b_and!15929)))

(declare-fun b!383704 () Bool)

(declare-fun e!233035 () Bool)

(declare-fun tp_is_empty!9335 () Bool)

(assert (=> b!383704 (= e!233035 tp_is_empty!9335)))

(declare-fun b!383705 () Bool)

(declare-fun res!218522 () Bool)

(declare-fun e!233037 () Bool)

(assert (=> b!383705 (=> (not res!218522) (not e!233037))))

(declare-datatypes ((array!22577 0))(
  ( (array!22578 (arr!10757 (Array (_ BitVec 32) (_ BitVec 64))) (size!11109 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22577)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22577 (_ BitVec 32)) Bool)

(assert (=> b!383705 (= res!218522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383707 () Bool)

(declare-fun res!218524 () Bool)

(assert (=> b!383707 (=> (not res!218524) (not e!233037))))

(declare-datatypes ((List!6175 0))(
  ( (Nil!6172) (Cons!6171 (h!7027 (_ BitVec 64)) (t!11325 List!6175)) )
))
(declare-fun arrayNoDuplicates!0 (array!22577 (_ BitVec 32) List!6175) Bool)

(assert (=> b!383707 (= res!218524 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6172))))

(declare-fun b!383708 () Bool)

(declare-fun e!233033 () Bool)

(assert (=> b!383708 (= e!233037 e!233033)))

(declare-fun res!218521 () Bool)

(assert (=> b!383708 (=> (not res!218521) (not e!233033))))

(declare-fun lt!180324 () array!22577)

(assert (=> b!383708 (= res!218521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180324 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383708 (= lt!180324 (array!22578 (store (arr!10757 _keys!658) i!548 k!778) (size!11109 _keys!658)))))

(declare-fun mapNonEmpty!15567 () Bool)

(declare-fun mapRes!15567 () Bool)

(declare-fun tp!30777 () Bool)

(declare-fun e!233036 () Bool)

(assert (=> mapNonEmpty!15567 (= mapRes!15567 (and tp!30777 e!233036))))

(declare-fun mapKey!15567 () (_ BitVec 32))

(declare-datatypes ((V!13551 0))(
  ( (V!13552 (val!4712 Int)) )
))
(declare-datatypes ((ValueCell!4324 0))(
  ( (ValueCellFull!4324 (v!6909 V!13551)) (EmptyCell!4324) )
))
(declare-datatypes ((array!22579 0))(
  ( (array!22580 (arr!10758 (Array (_ BitVec 32) ValueCell!4324)) (size!11110 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22579)

(declare-fun mapValue!15567 () ValueCell!4324)

(declare-fun mapRest!15567 () (Array (_ BitVec 32) ValueCell!4324))

(assert (=> mapNonEmpty!15567 (= (arr!10758 _values!506) (store mapRest!15567 mapKey!15567 mapValue!15567))))

(declare-fun b!383709 () Bool)

(declare-fun res!218523 () Bool)

(assert (=> b!383709 (=> (not res!218523) (not e!233037))))

(declare-fun arrayContainsKey!0 (array!22577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383709 (= res!218523 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!383710 () Bool)

(declare-fun res!218525 () Bool)

(assert (=> b!383710 (=> (not res!218525) (not e!233033))))

(assert (=> b!383710 (= res!218525 (arrayNoDuplicates!0 lt!180324 #b00000000000000000000000000000000 Nil!6172))))

(declare-fun b!383711 () Bool)

(declare-fun res!218526 () Bool)

(assert (=> b!383711 (=> (not res!218526) (not e!233037))))

(assert (=> b!383711 (= res!218526 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11109 _keys!658))))))

(declare-fun b!383712 () Bool)

(declare-fun e!233038 () Bool)

(assert (=> b!383712 (= e!233033 (not e!233038))))

(declare-fun res!218527 () Bool)

(assert (=> b!383712 (=> res!218527 e!233038)))

(declare-fun lt!180326 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383712 (= res!218527 (or (and (not lt!180326) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180326) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180326)))))

(assert (=> b!383712 (= lt!180326 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13551)

(declare-datatypes ((tuple2!6340 0))(
  ( (tuple2!6341 (_1!3181 (_ BitVec 64)) (_2!3181 V!13551)) )
))
(declare-datatypes ((List!6176 0))(
  ( (Nil!6173) (Cons!6172 (h!7028 tuple2!6340) (t!11326 List!6176)) )
))
(declare-datatypes ((ListLongMap!5253 0))(
  ( (ListLongMap!5254 (toList!2642 List!6176)) )
))
(declare-fun lt!180333 () ListLongMap!5253)

(declare-fun minValue!472 () V!13551)

(declare-fun getCurrentListMap!2046 (array!22577 array!22579 (_ BitVec 32) (_ BitVec 32) V!13551 V!13551 (_ BitVec 32) Int) ListLongMap!5253)

(assert (=> b!383712 (= lt!180333 (getCurrentListMap!2046 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180325 () array!22579)

(declare-fun lt!180329 () ListLongMap!5253)

(assert (=> b!383712 (= lt!180329 (getCurrentListMap!2046 lt!180324 lt!180325 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180327 () ListLongMap!5253)

(declare-fun lt!180331 () ListLongMap!5253)

(assert (=> b!383712 (and (= lt!180327 lt!180331) (= lt!180331 lt!180327))))

(declare-fun lt!180330 () ListLongMap!5253)

(declare-fun lt!180328 () tuple2!6340)

(declare-fun +!977 (ListLongMap!5253 tuple2!6340) ListLongMap!5253)

(assert (=> b!383712 (= lt!180331 (+!977 lt!180330 lt!180328))))

(declare-fun v!373 () V!13551)

(assert (=> b!383712 (= lt!180328 (tuple2!6341 k!778 v!373))))

(declare-datatypes ((Unit!11846 0))(
  ( (Unit!11847) )
))
(declare-fun lt!180332 () Unit!11846)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!204 (array!22577 array!22579 (_ BitVec 32) (_ BitVec 32) V!13551 V!13551 (_ BitVec 32) (_ BitVec 64) V!13551 (_ BitVec 32) Int) Unit!11846)

(assert (=> b!383712 (= lt!180332 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!204 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!880 (array!22577 array!22579 (_ BitVec 32) (_ BitVec 32) V!13551 V!13551 (_ BitVec 32) Int) ListLongMap!5253)

(assert (=> b!383712 (= lt!180327 (getCurrentListMapNoExtraKeys!880 lt!180324 lt!180325 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383712 (= lt!180325 (array!22580 (store (arr!10758 _values!506) i!548 (ValueCellFull!4324 v!373)) (size!11110 _values!506)))))

(assert (=> b!383712 (= lt!180330 (getCurrentListMapNoExtraKeys!880 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383713 () Bool)

(declare-fun res!218519 () Bool)

(assert (=> b!383713 (=> (not res!218519) (not e!233037))))

(assert (=> b!383713 (= res!218519 (and (= (size!11110 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11109 _keys!658) (size!11110 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383714 () Bool)

(assert (=> b!383714 (= e!233038 true)))

(declare-fun lt!180323 () ListLongMap!5253)

(assert (=> b!383714 (= lt!180323 (+!977 lt!180333 lt!180328))))

(assert (=> b!383714 (= lt!180329 lt!180327)))

(declare-fun mapIsEmpty!15567 () Bool)

(assert (=> mapIsEmpty!15567 mapRes!15567))

(declare-fun b!383715 () Bool)

(declare-fun res!218520 () Bool)

(assert (=> b!383715 (=> (not res!218520) (not e!233037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383715 (= res!218520 (validKeyInArray!0 k!778))))

(declare-fun res!218518 () Bool)

(assert (=> start!37560 (=> (not res!218518) (not e!233037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37560 (= res!218518 (validMask!0 mask!970))))

(assert (=> start!37560 e!233037))

(declare-fun e!233039 () Bool)

(declare-fun array_inv!7916 (array!22579) Bool)

(assert (=> start!37560 (and (array_inv!7916 _values!506) e!233039)))

(assert (=> start!37560 tp!30776))

(assert (=> start!37560 true))

(assert (=> start!37560 tp_is_empty!9335))

(declare-fun array_inv!7917 (array!22577) Bool)

(assert (=> start!37560 (array_inv!7917 _keys!658)))

(declare-fun b!383706 () Bool)

(assert (=> b!383706 (= e!233039 (and e!233035 mapRes!15567))))

(declare-fun condMapEmpty!15567 () Bool)

(declare-fun mapDefault!15567 () ValueCell!4324)

