; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39430 () Bool)

(assert start!39430)

(declare-fun b_free!9697 () Bool)

(declare-fun b_next!9697 () Bool)

(assert (=> start!39430 (= b_free!9697 (not b_next!9697))))

(declare-fun tp!34619 () Bool)

(declare-fun b_and!17269 () Bool)

(assert (=> start!39430 (= tp!34619 b_and!17269)))

(declare-fun b!419849 () Bool)

(declare-fun res!244826 () Bool)

(declare-fun e!250159 () Bool)

(assert (=> b!419849 (=> (not res!244826) (not e!250159))))

(declare-datatypes ((array!25547 0))(
  ( (array!25548 (arr!12223 (Array (_ BitVec 32) (_ BitVec 64))) (size!12575 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25547)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15571 0))(
  ( (V!15572 (val!5469 Int)) )
))
(declare-datatypes ((ValueCell!5081 0))(
  ( (ValueCellFull!5081 (v!7716 V!15571)) (EmptyCell!5081) )
))
(declare-datatypes ((array!25549 0))(
  ( (array!25550 (arr!12224 (Array (_ BitVec 32) ValueCell!5081)) (size!12576 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25549)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!419849 (= res!244826 (and (= (size!12576 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12575 _keys!709) (size!12576 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17895 () Bool)

(declare-fun mapRes!17895 () Bool)

(assert (=> mapIsEmpty!17895 mapRes!17895))

(declare-fun b!419850 () Bool)

(declare-fun res!244832 () Bool)

(assert (=> b!419850 (=> (not res!244832) (not e!250159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25547 (_ BitVec 32)) Bool)

(assert (=> b!419850 (= res!244832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun minValue!515 () V!15571)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!192577 () array!25547)

(declare-datatypes ((tuple2!7162 0))(
  ( (tuple2!7163 (_1!3592 (_ BitVec 64)) (_2!3592 V!15571)) )
))
(declare-datatypes ((List!7170 0))(
  ( (Nil!7167) (Cons!7166 (h!8022 tuple2!7162) (t!12532 List!7170)) )
))
(declare-datatypes ((ListLongMap!6075 0))(
  ( (ListLongMap!6076 (toList!3053 List!7170)) )
))
(declare-fun call!29269 () ListLongMap!6075)

(declare-fun zeroValue!515 () V!15571)

(declare-fun c!55259 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!29266 () Bool)

(declare-fun lt!192584 () array!25549)

(declare-fun getCurrentListMapNoExtraKeys!1258 (array!25547 array!25549 (_ BitVec 32) (_ BitVec 32) V!15571 V!15571 (_ BitVec 32) Int) ListLongMap!6075)

(assert (=> bm!29266 (= call!29269 (getCurrentListMapNoExtraKeys!1258 (ite c!55259 _keys!709 lt!192577) (ite c!55259 _values!549 lt!192584) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419851 () Bool)

(declare-fun res!244823 () Bool)

(assert (=> b!419851 (=> (not res!244823) (not e!250159))))

(declare-datatypes ((List!7171 0))(
  ( (Nil!7168) (Cons!7167 (h!8023 (_ BitVec 64)) (t!12533 List!7171)) )
))
(declare-fun arrayNoDuplicates!0 (array!25547 (_ BitVec 32) List!7171) Bool)

(assert (=> b!419851 (= res!244823 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7168))))

(declare-fun b!419852 () Bool)

(declare-fun res!244820 () Bool)

(assert (=> b!419852 (=> (not res!244820) (not e!250159))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419852 (= res!244820 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12575 _keys!709))))))

(declare-fun b!419853 () Bool)

(declare-fun e!250166 () Bool)

(declare-fun tp_is_empty!10849 () Bool)

(assert (=> b!419853 (= e!250166 tp_is_empty!10849)))

(declare-fun b!419854 () Bool)

(declare-fun e!250167 () Bool)

(declare-fun call!29270 () ListLongMap!6075)

(assert (=> b!419854 (= e!250167 (= call!29269 call!29270))))

(declare-fun b!419856 () Bool)

(declare-fun e!250163 () Bool)

(assert (=> b!419856 (= e!250163 tp_is_empty!10849)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15571)

(declare-fun b!419857 () Bool)

(declare-fun +!1250 (ListLongMap!6075 tuple2!7162) ListLongMap!6075)

(assert (=> b!419857 (= e!250167 (= call!29270 (+!1250 call!29269 (tuple2!7163 k!794 v!412))))))

(declare-fun b!419858 () Bool)

(declare-fun e!250161 () Bool)

(assert (=> b!419858 (= e!250161 (and e!250163 mapRes!17895))))

(declare-fun condMapEmpty!17895 () Bool)

(declare-fun mapDefault!17895 () ValueCell!5081)

