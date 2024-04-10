; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39208 () Bool)

(assert start!39208)

(declare-fun b_free!9475 () Bool)

(declare-fun b_next!9475 () Bool)

(assert (=> start!39208 (= b_free!9475 (not b_next!9475))))

(declare-fun tp!33954 () Bool)

(declare-fun b_and!16861 () Bool)

(assert (=> start!39208 (= tp!33954 b_and!16861)))

(declare-fun b!413379 () Bool)

(declare-fun res!240213 () Bool)

(declare-fun e!247212 () Bool)

(assert (=> b!413379 (=> (not res!240213) (not e!247212))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413379 (= res!240213 (bvsle from!863 i!563))))

(declare-fun b!413380 () Bool)

(declare-fun e!247211 () Bool)

(declare-fun tp_is_empty!10627 () Bool)

(assert (=> b!413380 (= e!247211 tp_is_empty!10627)))

(declare-fun b!413381 () Bool)

(declare-fun res!240207 () Bool)

(declare-fun e!247208 () Bool)

(assert (=> b!413381 (=> (not res!240207) (not e!247208))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413381 (= res!240207 (validKeyInArray!0 k!794))))

(declare-fun b!413382 () Bool)

(declare-fun res!240206 () Bool)

(assert (=> b!413382 (=> (not res!240206) (not e!247208))))

(declare-datatypes ((array!25111 0))(
  ( (array!25112 (arr!12005 (Array (_ BitVec 32) (_ BitVec 64))) (size!12357 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25111)

(declare-datatypes ((List!6985 0))(
  ( (Nil!6982) (Cons!6981 (h!7837 (_ BitVec 64)) (t!12159 List!6985)) )
))
(declare-fun arrayNoDuplicates!0 (array!25111 (_ BitVec 32) List!6985) Bool)

(assert (=> b!413382 (= res!240206 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6982))))

(declare-fun mapIsEmpty!17562 () Bool)

(declare-fun mapRes!17562 () Bool)

(assert (=> mapIsEmpty!17562 mapRes!17562))

(declare-fun b!413383 () Bool)

(declare-fun res!240208 () Bool)

(assert (=> b!413383 (=> (not res!240208) (not e!247212))))

(declare-fun lt!189710 () array!25111)

(assert (=> b!413383 (= res!240208 (arrayNoDuplicates!0 lt!189710 #b00000000000000000000000000000000 Nil!6982))))

(declare-fun b!413384 () Bool)

(declare-fun res!240202 () Bool)

(assert (=> b!413384 (=> (not res!240202) (not e!247208))))

(declare-fun arrayContainsKey!0 (array!25111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413384 (= res!240202 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413385 () Bool)

(declare-fun res!240201 () Bool)

(assert (=> b!413385 (=> (not res!240201) (not e!247208))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25111 (_ BitVec 32)) Bool)

(assert (=> b!413385 (= res!240201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413386 () Bool)

(declare-fun res!240211 () Bool)

(assert (=> b!413386 (=> (not res!240211) (not e!247208))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15275 0))(
  ( (V!15276 (val!5358 Int)) )
))
(declare-datatypes ((ValueCell!4970 0))(
  ( (ValueCellFull!4970 (v!7605 V!15275)) (EmptyCell!4970) )
))
(declare-datatypes ((array!25113 0))(
  ( (array!25114 (arr!12006 (Array (_ BitVec 32) ValueCell!4970)) (size!12358 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25113)

(assert (=> b!413386 (= res!240211 (and (= (size!12358 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12357 _keys!709) (size!12358 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!6960 0))(
  ( (tuple2!6961 (_1!3491 (_ BitVec 64)) (_2!3491 V!15275)) )
))
(declare-datatypes ((List!6986 0))(
  ( (Nil!6983) (Cons!6982 (h!7838 tuple2!6960) (t!12160 List!6986)) )
))
(declare-datatypes ((ListLongMap!5873 0))(
  ( (ListLongMap!5874 (toList!2952 List!6986)) )
))
(declare-fun call!28603 () ListLongMap!5873)

(declare-fun minValue!515 () V!15275)

(declare-fun zeroValue!515 () V!15275)

(declare-fun c!54926 () Bool)

(declare-fun bm!28600 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!189709 () array!25113)

(declare-fun getCurrentListMapNoExtraKeys!1160 (array!25111 array!25113 (_ BitVec 32) (_ BitVec 32) V!15275 V!15275 (_ BitVec 32) Int) ListLongMap!5873)

(assert (=> bm!28600 (= call!28603 (getCurrentListMapNoExtraKeys!1160 (ite c!54926 _keys!709 lt!189710) (ite c!54926 _values!549 lt!189709) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413387 () Bool)

(declare-fun res!240203 () Bool)

(assert (=> b!413387 (=> (not res!240203) (not e!247208))))

(assert (=> b!413387 (= res!240203 (or (= (select (arr!12005 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12005 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!240210 () Bool)

(assert (=> start!39208 (=> (not res!240210) (not e!247208))))

(assert (=> start!39208 (= res!240210 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12357 _keys!709))))))

(assert (=> start!39208 e!247208))

(assert (=> start!39208 tp_is_empty!10627))

(assert (=> start!39208 tp!33954))

(assert (=> start!39208 true))

(declare-fun e!247205 () Bool)

(declare-fun array_inv!8756 (array!25113) Bool)

(assert (=> start!39208 (and (array_inv!8756 _values!549) e!247205)))

(declare-fun array_inv!8757 (array!25111) Bool)

(assert (=> start!39208 (array_inv!8757 _keys!709)))

(declare-fun b!413388 () Bool)

(declare-fun res!240204 () Bool)

(assert (=> b!413388 (=> (not res!240204) (not e!247208))))

(assert (=> b!413388 (= res!240204 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12357 _keys!709))))))

(declare-fun b!413389 () Bool)

(declare-fun e!247206 () Bool)

(assert (=> b!413389 (= e!247212 e!247206)))

(declare-fun res!240209 () Bool)

(assert (=> b!413389 (=> (not res!240209) (not e!247206))))

(assert (=> b!413389 (= res!240209 (= from!863 i!563))))

(declare-fun lt!189713 () ListLongMap!5873)

(assert (=> b!413389 (= lt!189713 (getCurrentListMapNoExtraKeys!1160 lt!189710 lt!189709 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15275)

(assert (=> b!413389 (= lt!189709 (array!25114 (store (arr!12006 _values!549) i!563 (ValueCellFull!4970 v!412)) (size!12358 _values!549)))))

(declare-fun lt!189711 () ListLongMap!5873)

(assert (=> b!413389 (= lt!189711 (getCurrentListMapNoExtraKeys!1160 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413390 () Bool)

(declare-fun e!247209 () Bool)

(declare-fun call!28604 () ListLongMap!5873)

(assert (=> b!413390 (= e!247209 (= call!28603 call!28604))))

(declare-fun mapNonEmpty!17562 () Bool)

(declare-fun tp!33953 () Bool)

(declare-fun e!247210 () Bool)

(assert (=> mapNonEmpty!17562 (= mapRes!17562 (and tp!33953 e!247210))))

(declare-fun mapRest!17562 () (Array (_ BitVec 32) ValueCell!4970))

(declare-fun mapKey!17562 () (_ BitVec 32))

(declare-fun mapValue!17562 () ValueCell!4970)

(assert (=> mapNonEmpty!17562 (= (arr!12006 _values!549) (store mapRest!17562 mapKey!17562 mapValue!17562))))

(declare-fun bm!28601 () Bool)

(assert (=> bm!28601 (= call!28604 (getCurrentListMapNoExtraKeys!1160 (ite c!54926 lt!189710 _keys!709) (ite c!54926 lt!189709 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413391 () Bool)

(declare-fun res!240205 () Bool)

(assert (=> b!413391 (=> (not res!240205) (not e!247208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413391 (= res!240205 (validMask!0 mask!1025))))

(declare-fun b!413392 () Bool)

(assert (=> b!413392 (= e!247205 (and e!247211 mapRes!17562))))

(declare-fun condMapEmpty!17562 () Bool)

(declare-fun mapDefault!17562 () ValueCell!4970)

