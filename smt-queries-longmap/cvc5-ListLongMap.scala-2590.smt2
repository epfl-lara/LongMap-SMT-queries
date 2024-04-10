; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39358 () Bool)

(assert start!39358)

(declare-fun b_free!9625 () Bool)

(declare-fun b_next!9625 () Bool)

(assert (=> start!39358 (= b_free!9625 (not b_next!9625))))

(declare-fun tp!34403 () Bool)

(declare-fun b_and!17125 () Bool)

(assert (=> start!39358 (= tp!34403 b_and!17125)))

(declare-fun b!417725 () Bool)

(declare-fun e!249195 () Bool)

(declare-fun tp_is_empty!10777 () Bool)

(assert (=> b!417725 (= e!249195 tp_is_empty!10777)))

(declare-fun b!417726 () Bool)

(declare-fun e!249187 () Bool)

(declare-fun e!249194 () Bool)

(assert (=> b!417726 (= e!249187 e!249194)))

(declare-fun res!243314 () Bool)

(assert (=> b!417726 (=> (not res!243314) (not e!249194))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417726 (= res!243314 (= from!863 i!563))))

(declare-datatypes ((V!15475 0))(
  ( (V!15476 (val!5433 Int)) )
))
(declare-datatypes ((ValueCell!5045 0))(
  ( (ValueCellFull!5045 (v!7680 V!15475)) (EmptyCell!5045) )
))
(declare-datatypes ((array!25405 0))(
  ( (array!25406 (arr!12152 (Array (_ BitVec 32) ValueCell!5045)) (size!12504 (_ BitVec 32))) )
))
(declare-fun lt!191395 () array!25405)

(declare-fun minValue!515 () V!15475)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15475)

(declare-datatypes ((array!25407 0))(
  ( (array!25408 (arr!12153 (Array (_ BitVec 32) (_ BitVec 64))) (size!12505 (_ BitVec 32))) )
))
(declare-fun lt!191390 () array!25407)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7096 0))(
  ( (tuple2!7097 (_1!3559 (_ BitVec 64)) (_2!3559 V!15475)) )
))
(declare-datatypes ((List!7112 0))(
  ( (Nil!7109) (Cons!7108 (h!7964 tuple2!7096) (t!12402 List!7112)) )
))
(declare-datatypes ((ListLongMap!6009 0))(
  ( (ListLongMap!6010 (toList!3020 List!7112)) )
))
(declare-fun lt!191387 () ListLongMap!6009)

(declare-fun getCurrentListMapNoExtraKeys!1225 (array!25407 array!25405 (_ BitVec 32) (_ BitVec 32) V!15475 V!15475 (_ BitVec 32) Int) ListLongMap!6009)

(assert (=> b!417726 (= lt!191387 (getCurrentListMapNoExtraKeys!1225 lt!191390 lt!191395 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25405)

(declare-fun v!412 () V!15475)

(assert (=> b!417726 (= lt!191395 (array!25406 (store (arr!12152 _values!549) i!563 (ValueCellFull!5045 v!412)) (size!12504 _values!549)))))

(declare-fun lt!191393 () ListLongMap!6009)

(declare-fun _keys!709 () array!25407)

(assert (=> b!417726 (= lt!191393 (getCurrentListMapNoExtraKeys!1225 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417727 () Bool)

(declare-fun res!243310 () Bool)

(declare-fun e!249192 () Bool)

(assert (=> b!417727 (=> (not res!243310) (not e!249192))))

(assert (=> b!417727 (= res!243310 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12505 _keys!709))))))

(declare-fun b!417728 () Bool)

(assert (=> b!417728 (= e!249192 e!249187)))

(declare-fun res!243312 () Bool)

(assert (=> b!417728 (=> (not res!243312) (not e!249187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25407 (_ BitVec 32)) Bool)

(assert (=> b!417728 (= res!243312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191390 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!417728 (= lt!191390 (array!25408 (store (arr!12153 _keys!709) i!563 k!794) (size!12505 _keys!709)))))

(declare-fun b!417729 () Bool)

(declare-fun e!249191 () Bool)

(assert (=> b!417729 (= e!249191 true)))

(declare-fun lt!191392 () ListLongMap!6009)

(declare-fun lt!191386 () V!15475)

(declare-fun lt!191389 () tuple2!7096)

(declare-fun +!1220 (ListLongMap!6009 tuple2!7096) ListLongMap!6009)

(assert (=> b!417729 (= (+!1220 lt!191392 lt!191389) (+!1220 (+!1220 lt!191392 (tuple2!7097 k!794 lt!191386)) lt!191389))))

(declare-fun lt!191391 () V!15475)

(assert (=> b!417729 (= lt!191389 (tuple2!7097 k!794 lt!191391))))

(declare-datatypes ((Unit!12344 0))(
  ( (Unit!12345) )
))
(declare-fun lt!191396 () Unit!12344)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!20 (ListLongMap!6009 (_ BitVec 64) V!15475 V!15475) Unit!12344)

(assert (=> b!417729 (= lt!191396 (addSameAsAddTwiceSameKeyDiffValues!20 lt!191392 k!794 lt!191386 lt!191391))))

(declare-fun lt!191388 () V!15475)

(declare-fun get!6014 (ValueCell!5045 V!15475) V!15475)

(assert (=> b!417729 (= lt!191386 (get!6014 (select (arr!12152 _values!549) from!863) lt!191388))))

(assert (=> b!417729 (= lt!191387 (+!1220 lt!191392 (tuple2!7097 (select (arr!12153 lt!191390) from!863) lt!191391)))))

(assert (=> b!417729 (= lt!191391 (get!6014 (select (store (arr!12152 _values!549) i!563 (ValueCellFull!5045 v!412)) from!863) lt!191388))))

(declare-fun dynLambda!691 (Int (_ BitVec 64)) V!15475)

(assert (=> b!417729 (= lt!191388 (dynLambda!691 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417729 (= lt!191392 (getCurrentListMapNoExtraKeys!1225 lt!191390 lt!191395 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417730 () Bool)

(declare-fun res!243318 () Bool)

(assert (=> b!417730 (=> (not res!243318) (not e!249187))))

(assert (=> b!417730 (= res!243318 (bvsle from!863 i!563))))

(declare-fun b!417731 () Bool)

(declare-fun call!29053 () ListLongMap!6009)

(declare-fun e!249193 () Bool)

(declare-fun call!29054 () ListLongMap!6009)

(assert (=> b!417731 (= e!249193 (= call!29053 (+!1220 call!29054 (tuple2!7097 k!794 v!412))))))

(declare-fun b!417732 () Bool)

(declare-fun res!243316 () Bool)

(assert (=> b!417732 (=> (not res!243316) (not e!249192))))

(assert (=> b!417732 (= res!243316 (or (= (select (arr!12153 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12153 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417733 () Bool)

(assert (=> b!417733 (= e!249193 (= call!29054 call!29053))))

(declare-fun b!417734 () Bool)

(declare-fun res!243319 () Bool)

(assert (=> b!417734 (=> (not res!243319) (not e!249187))))

(declare-datatypes ((List!7113 0))(
  ( (Nil!7110) (Cons!7109 (h!7965 (_ BitVec 64)) (t!12403 List!7113)) )
))
(declare-fun arrayNoDuplicates!0 (array!25407 (_ BitVec 32) List!7113) Bool)

(assert (=> b!417734 (= res!243319 (arrayNoDuplicates!0 lt!191390 #b00000000000000000000000000000000 Nil!7110))))

(declare-fun b!417735 () Bool)

(declare-fun e!249188 () Bool)

(declare-fun mapRes!17787 () Bool)

(assert (=> b!417735 (= e!249188 (and e!249195 mapRes!17787))))

(declare-fun condMapEmpty!17787 () Bool)

(declare-fun mapDefault!17787 () ValueCell!5045)

