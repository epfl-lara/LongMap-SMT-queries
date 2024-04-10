; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39964 () Bool)

(assert start!39964)

(declare-fun b_free!10231 () Bool)

(declare-fun b_next!10231 () Bool)

(assert (=> start!39964 (= b_free!10231 (not b_next!10231))))

(declare-fun tp!36222 () Bool)

(declare-fun b_and!18121 () Bool)

(assert (=> start!39964 (= tp!36222 b_and!18121)))

(declare-fun res!255771 () Bool)

(declare-fun e!256726 () Bool)

(assert (=> start!39964 (=> (not res!255771) (not e!256726))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26599 0))(
  ( (array!26600 (arr!12749 (Array (_ BitVec 32) (_ BitVec 64))) (size!13101 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26599)

(assert (=> start!39964 (= res!255771 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13101 _keys!709))))))

(assert (=> start!39964 e!256726))

(declare-fun tp_is_empty!11383 () Bool)

(assert (=> start!39964 tp_is_empty!11383))

(assert (=> start!39964 tp!36222))

(assert (=> start!39964 true))

(declare-datatypes ((V!16283 0))(
  ( (V!16284 (val!5736 Int)) )
))
(declare-datatypes ((ValueCell!5348 0))(
  ( (ValueCellFull!5348 (v!7983 V!16283)) (EmptyCell!5348) )
))
(declare-datatypes ((array!26601 0))(
  ( (array!26602 (arr!12750 (Array (_ BitVec 32) ValueCell!5348)) (size!13102 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26601)

(declare-fun e!256723 () Bool)

(declare-fun array_inv!9274 (array!26601) Bool)

(assert (=> start!39964 (and (array_inv!9274 _values!549) e!256723)))

(declare-fun array_inv!9275 (array!26599) Bool)

(assert (=> start!39964 (array_inv!9275 _keys!709)))

(declare-fun b!434362 () Bool)

(declare-fun res!255779 () Bool)

(assert (=> b!434362 (=> (not res!255779) (not e!256726))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!434362 (= res!255779 (and (= (size!13102 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13101 _keys!709) (size!13102 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434363 () Bool)

(declare-fun e!256722 () Bool)

(assert (=> b!434363 (= e!256726 e!256722)))

(declare-fun res!255768 () Bool)

(assert (=> b!434363 (=> (not res!255768) (not e!256722))))

(declare-fun lt!199702 () array!26599)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26599 (_ BitVec 32)) Bool)

(assert (=> b!434363 (= res!255768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199702 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!434363 (= lt!199702 (array!26600 (store (arr!12749 _keys!709) i!563 k!794) (size!13101 _keys!709)))))

(declare-fun mapIsEmpty!18696 () Bool)

(declare-fun mapRes!18696 () Bool)

(assert (=> mapIsEmpty!18696 mapRes!18696))

(declare-fun b!434364 () Bool)

(declare-fun res!255766 () Bool)

(assert (=> b!434364 (=> (not res!255766) (not e!256726))))

(declare-fun arrayContainsKey!0 (array!26599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434364 (= res!255766 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!434365 () Bool)

(declare-fun res!255775 () Bool)

(assert (=> b!434365 (=> (not res!255775) (not e!256726))))

(assert (=> b!434365 (= res!255775 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13101 _keys!709))))))

(declare-fun b!434366 () Bool)

(declare-fun res!255772 () Bool)

(assert (=> b!434366 (=> (not res!255772) (not e!256726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434366 (= res!255772 (validMask!0 mask!1025))))

(declare-fun b!434367 () Bool)

(declare-datatypes ((Unit!12880 0))(
  ( (Unit!12881) )
))
(declare-fun e!256727 () Unit!12880)

(declare-fun Unit!12882 () Unit!12880)

(assert (=> b!434367 (= e!256727 Unit!12882)))

(declare-fun b!434368 () Bool)

(declare-fun e!256725 () Bool)

(declare-fun e!256731 () Bool)

(assert (=> b!434368 (= e!256725 e!256731)))

(declare-fun res!255773 () Bool)

(assert (=> b!434368 (=> res!255773 e!256731)))

(assert (=> b!434368 (= res!255773 (= k!794 (select (arr!12749 _keys!709) from!863)))))

(assert (=> b!434368 (not (= (select (arr!12749 _keys!709) from!863) k!794))))

(declare-fun lt!199714 () Unit!12880)

(assert (=> b!434368 (= lt!199714 e!256727)))

(declare-fun c!55682 () Bool)

(assert (=> b!434368 (= c!55682 (= (select (arr!12749 _keys!709) from!863) k!794))))

(declare-datatypes ((tuple2!7590 0))(
  ( (tuple2!7591 (_1!3806 (_ BitVec 64)) (_2!3806 V!16283)) )
))
(declare-datatypes ((List!7594 0))(
  ( (Nil!7591) (Cons!7590 (h!8446 tuple2!7590) (t!13274 List!7594)) )
))
(declare-datatypes ((ListLongMap!6503 0))(
  ( (ListLongMap!6504 (toList!3267 List!7594)) )
))
(declare-fun lt!199711 () ListLongMap!6503)

(declare-fun lt!199708 () ListLongMap!6503)

(assert (=> b!434368 (= lt!199711 lt!199708)))

(declare-fun lt!199704 () ListLongMap!6503)

(declare-fun lt!199715 () tuple2!7590)

(declare-fun +!1415 (ListLongMap!6503 tuple2!7590) ListLongMap!6503)

(assert (=> b!434368 (= lt!199708 (+!1415 lt!199704 lt!199715))))

(declare-fun lt!199703 () V!16283)

(assert (=> b!434368 (= lt!199715 (tuple2!7591 (select (arr!12749 _keys!709) from!863) lt!199703))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6350 (ValueCell!5348 V!16283) V!16283)

(declare-fun dynLambda!825 (Int (_ BitVec 64)) V!16283)

(assert (=> b!434368 (= lt!199703 (get!6350 (select (arr!12750 _values!549) from!863) (dynLambda!825 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434369 () Bool)

(declare-fun res!255767 () Bool)

(assert (=> b!434369 (=> (not res!255767) (not e!256726))))

(assert (=> b!434369 (= res!255767 (or (= (select (arr!12749 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12749 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434370 () Bool)

(declare-fun e!256724 () Bool)

(assert (=> b!434370 (= e!256724 tp_is_empty!11383)))

(declare-fun b!434371 () Bool)

(declare-fun res!255776 () Bool)

(assert (=> b!434371 (=> (not res!255776) (not e!256722))))

(assert (=> b!434371 (= res!255776 (bvsle from!863 i!563))))

(declare-fun b!434372 () Bool)

(declare-fun res!255777 () Bool)

(assert (=> b!434372 (=> (not res!255777) (not e!256726))))

(declare-datatypes ((List!7595 0))(
  ( (Nil!7592) (Cons!7591 (h!8447 (_ BitVec 64)) (t!13275 List!7595)) )
))
(declare-fun arrayNoDuplicates!0 (array!26599 (_ BitVec 32) List!7595) Bool)

(assert (=> b!434372 (= res!255777 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7592))))

(declare-fun b!434373 () Bool)

(declare-fun e!256729 () Bool)

(assert (=> b!434373 (= e!256729 (not e!256725))))

(declare-fun res!255770 () Bool)

(assert (=> b!434373 (=> res!255770 e!256725)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434373 (= res!255770 (not (validKeyInArray!0 (select (arr!12749 _keys!709) from!863))))))

(declare-fun lt!199713 () ListLongMap!6503)

(assert (=> b!434373 (= lt!199713 lt!199704)))

(declare-fun lt!199712 () ListLongMap!6503)

(declare-fun lt!199706 () tuple2!7590)

(assert (=> b!434373 (= lt!199704 (+!1415 lt!199712 lt!199706))))

(declare-fun minValue!515 () V!16283)

(declare-fun lt!199705 () array!26601)

(declare-fun zeroValue!515 () V!16283)

(declare-fun getCurrentListMapNoExtraKeys!1460 (array!26599 array!26601 (_ BitVec 32) (_ BitVec 32) V!16283 V!16283 (_ BitVec 32) Int) ListLongMap!6503)

(assert (=> b!434373 (= lt!199713 (getCurrentListMapNoExtraKeys!1460 lt!199702 lt!199705 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16283)

(assert (=> b!434373 (= lt!199706 (tuple2!7591 k!794 v!412))))

(assert (=> b!434373 (= lt!199712 (getCurrentListMapNoExtraKeys!1460 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199710 () Unit!12880)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!591 (array!26599 array!26601 (_ BitVec 32) (_ BitVec 32) V!16283 V!16283 (_ BitVec 32) (_ BitVec 64) V!16283 (_ BitVec 32) Int) Unit!12880)

(assert (=> b!434373 (= lt!199710 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!591 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434374 () Bool)

(assert (=> b!434374 (= e!256723 (and e!256724 mapRes!18696))))

(declare-fun condMapEmpty!18696 () Bool)

(declare-fun mapDefault!18696 () ValueCell!5348)

