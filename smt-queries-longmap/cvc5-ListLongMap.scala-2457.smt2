; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38560 () Bool)

(assert start!38560)

(declare-fun b_free!9097 () Bool)

(declare-fun b_next!9097 () Bool)

(assert (=> start!38560 (= b_free!9097 (not b_next!9097))))

(declare-fun tp!32414 () Bool)

(declare-fun b_and!16483 () Bool)

(assert (=> start!38560 (= tp!32414 b_and!16483)))

(declare-fun b!398932 () Bool)

(declare-fun e!241026 () Bool)

(declare-fun tp_is_empty!9979 () Bool)

(assert (=> b!398932 (= e!241026 tp_is_empty!9979)))

(declare-fun b!398934 () Bool)

(declare-fun res!229319 () Bool)

(declare-fun e!241020 () Bool)

(assert (=> b!398934 (=> (not res!229319) (not e!241020))))

(declare-datatypes ((array!23869 0))(
  ( (array!23870 (arr!11384 (Array (_ BitVec 32) (_ BitVec 64))) (size!11736 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23869)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398934 (= res!229319 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!398935 () Bool)

(declare-fun e!241022 () Bool)

(assert (=> b!398935 (= e!241020 e!241022)))

(declare-fun res!229322 () Bool)

(assert (=> b!398935 (=> (not res!229322) (not e!241022))))

(declare-fun lt!187516 () array!23869)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23869 (_ BitVec 32)) Bool)

(assert (=> b!398935 (= res!229322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187516 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398935 (= lt!187516 (array!23870 (store (arr!11384 _keys!709) i!563 k!794) (size!11736 _keys!709)))))

(declare-fun mapNonEmpty!16590 () Bool)

(declare-fun mapRes!16590 () Bool)

(declare-fun tp!32415 () Bool)

(assert (=> mapNonEmpty!16590 (= mapRes!16590 (and tp!32415 e!241026))))

(declare-datatypes ((V!14411 0))(
  ( (V!14412 (val!5034 Int)) )
))
(declare-datatypes ((ValueCell!4646 0))(
  ( (ValueCellFull!4646 (v!7281 V!14411)) (EmptyCell!4646) )
))
(declare-fun mapValue!16590 () ValueCell!4646)

(declare-datatypes ((array!23871 0))(
  ( (array!23872 (arr!11385 (Array (_ BitVec 32) ValueCell!4646)) (size!11737 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23871)

(declare-fun mapRest!16590 () (Array (_ BitVec 32) ValueCell!4646))

(declare-fun mapKey!16590 () (_ BitVec 32))

(assert (=> mapNonEmpty!16590 (= (arr!11385 _values!549) (store mapRest!16590 mapKey!16590 mapValue!16590))))

(declare-fun b!398936 () Bool)

(declare-fun res!229318 () Bool)

(assert (=> b!398936 (=> (not res!229318) (not e!241020))))

(assert (=> b!398936 (= res!229318 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11736 _keys!709))))))

(declare-fun b!398937 () Bool)

(declare-fun res!229329 () Bool)

(assert (=> b!398937 (=> (not res!229329) (not e!241020))))

(declare-datatypes ((List!6586 0))(
  ( (Nil!6583) (Cons!6582 (h!7438 (_ BitVec 64)) (t!11760 List!6586)) )
))
(declare-fun arrayNoDuplicates!0 (array!23869 (_ BitVec 32) List!6586) Bool)

(assert (=> b!398937 (= res!229329 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6583))))

(declare-fun b!398938 () Bool)

(declare-fun res!229325 () Bool)

(assert (=> b!398938 (=> (not res!229325) (not e!241022))))

(assert (=> b!398938 (= res!229325 (arrayNoDuplicates!0 lt!187516 #b00000000000000000000000000000000 Nil!6583))))

(declare-datatypes ((tuple2!6660 0))(
  ( (tuple2!6661 (_1!3341 (_ BitVec 64)) (_2!3341 V!14411)) )
))
(declare-datatypes ((List!6587 0))(
  ( (Nil!6584) (Cons!6583 (h!7439 tuple2!6660) (t!11761 List!6587)) )
))
(declare-datatypes ((ListLongMap!5573 0))(
  ( (ListLongMap!5574 (toList!2802 List!6587)) )
))
(declare-fun call!27955 () ListLongMap!5573)

(declare-fun minValue!515 () V!14411)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54602 () Bool)

(declare-fun zeroValue!515 () V!14411)

(declare-fun bm!27952 () Bool)

(declare-fun v!412 () V!14411)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1020 (array!23869 array!23871 (_ BitVec 32) (_ BitVec 32) V!14411 V!14411 (_ BitVec 32) Int) ListLongMap!5573)

(assert (=> bm!27952 (= call!27955 (getCurrentListMapNoExtraKeys!1020 (ite c!54602 _keys!709 lt!187516) (ite c!54602 _values!549 (array!23872 (store (arr!11385 _values!549) i!563 (ValueCellFull!4646 v!412)) (size!11737 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398939 () Bool)

(declare-fun res!229326 () Bool)

(assert (=> b!398939 (=> (not res!229326) (not e!241020))))

(assert (=> b!398939 (= res!229326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!27953 () Bool)

(declare-fun call!27956 () ListLongMap!5573)

(assert (=> bm!27953 (= call!27956 (getCurrentListMapNoExtraKeys!1020 (ite c!54602 lt!187516 _keys!709) (ite c!54602 (array!23872 (store (arr!11385 _values!549) i!563 (ValueCellFull!4646 v!412)) (size!11737 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398940 () Bool)

(declare-fun res!229328 () Bool)

(assert (=> b!398940 (=> (not res!229328) (not e!241020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398940 (= res!229328 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16590 () Bool)

(assert (=> mapIsEmpty!16590 mapRes!16590))

(declare-fun b!398941 () Bool)

(declare-fun res!229324 () Bool)

(assert (=> b!398941 (=> (not res!229324) (not e!241022))))

(assert (=> b!398941 (= res!229324 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11736 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398942 () Bool)

(declare-fun e!241021 () Bool)

(assert (=> b!398942 (= e!241021 (= call!27955 call!27956))))

(declare-fun b!398943 () Bool)

(declare-fun e!241023 () Bool)

(assert (=> b!398943 (= e!241023 tp_is_empty!9979)))

(declare-fun b!398944 () Bool)

(assert (=> b!398944 (= e!241022 (not true))))

(assert (=> b!398944 e!241021))

(assert (=> b!398944 (= c!54602 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12090 0))(
  ( (Unit!12091) )
))
(declare-fun lt!187517 () Unit!12090)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!303 (array!23869 array!23871 (_ BitVec 32) (_ BitVec 32) V!14411 V!14411 (_ BitVec 32) (_ BitVec 64) V!14411 (_ BitVec 32) Int) Unit!12090)

(assert (=> b!398944 (= lt!187517 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!303 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!229327 () Bool)

(assert (=> start!38560 (=> (not res!229327) (not e!241020))))

(assert (=> start!38560 (= res!229327 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11736 _keys!709))))))

(assert (=> start!38560 e!241020))

(assert (=> start!38560 tp_is_empty!9979))

(assert (=> start!38560 tp!32414))

(assert (=> start!38560 true))

(declare-fun e!241025 () Bool)

(declare-fun array_inv!8342 (array!23871) Bool)

(assert (=> start!38560 (and (array_inv!8342 _values!549) e!241025)))

(declare-fun array_inv!8343 (array!23869) Bool)

(assert (=> start!38560 (array_inv!8343 _keys!709)))

(declare-fun b!398933 () Bool)

(declare-fun res!229321 () Bool)

(assert (=> b!398933 (=> (not res!229321) (not e!241020))))

(assert (=> b!398933 (= res!229321 (or (= (select (arr!11384 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11384 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398945 () Bool)

(declare-fun +!1092 (ListLongMap!5573 tuple2!6660) ListLongMap!5573)

(assert (=> b!398945 (= e!241021 (= call!27956 (+!1092 call!27955 (tuple2!6661 k!794 v!412))))))

(declare-fun b!398946 () Bool)

(assert (=> b!398946 (= e!241025 (and e!241023 mapRes!16590))))

(declare-fun condMapEmpty!16590 () Bool)

(declare-fun mapDefault!16590 () ValueCell!4646)

