; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39944 () Bool)

(assert start!39944)

(declare-fun b_free!10211 () Bool)

(declare-fun b_next!10211 () Bool)

(assert (=> start!39944 (= b_free!10211 (not b_next!10211))))

(declare-fun tp!36161 () Bool)

(declare-fun b_and!18081 () Bool)

(assert (=> start!39944 (= tp!36161 b_and!18081)))

(declare-fun b!433742 () Bool)

(declare-fun e!256424 () Bool)

(declare-fun e!256430 () Bool)

(assert (=> b!433742 (= e!256424 e!256430)))

(declare-fun res!255319 () Bool)

(assert (=> b!433742 (=> (not res!255319) (not e!256430))))

(declare-datatypes ((array!26559 0))(
  ( (array!26560 (arr!12729 (Array (_ BitVec 32) (_ BitVec 64))) (size!13081 (_ BitVec 32))) )
))
(declare-fun lt!199262 () array!26559)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26559 (_ BitVec 32)) Bool)

(assert (=> b!433742 (= res!255319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199262 mask!1025))))

(declare-fun _keys!709 () array!26559)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433742 (= lt!199262 (array!26560 (store (arr!12729 _keys!709) i!563 k!794) (size!13081 _keys!709)))))

(declare-fun b!433743 () Bool)

(declare-fun res!255322 () Bool)

(assert (=> b!433743 (=> (not res!255322) (not e!256424))))

(assert (=> b!433743 (= res!255322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433745 () Bool)

(declare-fun res!255329 () Bool)

(assert (=> b!433745 (=> (not res!255329) (not e!256424))))

(declare-fun arrayContainsKey!0 (array!26559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433745 (= res!255329 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433746 () Bool)

(declare-fun res!255325 () Bool)

(assert (=> b!433746 (=> (not res!255325) (not e!256424))))

(assert (=> b!433746 (= res!255325 (or (= (select (arr!12729 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12729 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433747 () Bool)

(declare-fun e!256428 () Bool)

(declare-fun e!256425 () Bool)

(assert (=> b!433747 (= e!256428 e!256425)))

(declare-fun res!255318 () Bool)

(assert (=> b!433747 (=> res!255318 e!256425)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433747 (= res!255318 (= k!794 (select (arr!12729 _keys!709) from!863)))))

(assert (=> b!433747 (not (= (select (arr!12729 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12847 0))(
  ( (Unit!12848) )
))
(declare-fun lt!199257 () Unit!12847)

(declare-fun e!256429 () Unit!12847)

(assert (=> b!433747 (= lt!199257 e!256429)))

(declare-fun c!55652 () Bool)

(assert (=> b!433747 (= c!55652 (= (select (arr!12729 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16255 0))(
  ( (V!16256 (val!5726 Int)) )
))
(declare-datatypes ((tuple2!7570 0))(
  ( (tuple2!7571 (_1!3796 (_ BitVec 64)) (_2!3796 V!16255)) )
))
(declare-datatypes ((List!7578 0))(
  ( (Nil!7575) (Cons!7574 (h!8430 tuple2!7570) (t!13238 List!7578)) )
))
(declare-datatypes ((ListLongMap!6483 0))(
  ( (ListLongMap!6484 (toList!3257 List!7578)) )
))
(declare-fun lt!199253 () ListLongMap!6483)

(declare-fun lt!199265 () ListLongMap!6483)

(assert (=> b!433747 (= lt!199253 lt!199265)))

(declare-fun lt!199263 () ListLongMap!6483)

(declare-fun lt!199252 () tuple2!7570)

(declare-fun +!1405 (ListLongMap!6483 tuple2!7570) ListLongMap!6483)

(assert (=> b!433747 (= lt!199265 (+!1405 lt!199263 lt!199252))))

(declare-fun lt!199261 () V!16255)

(assert (=> b!433747 (= lt!199252 (tuple2!7571 (select (arr!12729 _keys!709) from!863) lt!199261))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5338 0))(
  ( (ValueCellFull!5338 (v!7973 V!16255)) (EmptyCell!5338) )
))
(declare-datatypes ((array!26561 0))(
  ( (array!26562 (arr!12730 (Array (_ BitVec 32) ValueCell!5338)) (size!13082 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26561)

(declare-fun get!6334 (ValueCell!5338 V!16255) V!16255)

(declare-fun dynLambda!817 (Int (_ BitVec 64)) V!16255)

(assert (=> b!433747 (= lt!199261 (get!6334 (select (arr!12730 _values!549) from!863) (dynLambda!817 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433748 () Bool)

(declare-fun res!255328 () Bool)

(assert (=> b!433748 (=> (not res!255328) (not e!256430))))

(assert (=> b!433748 (= res!255328 (bvsle from!863 i!563))))

(declare-fun b!433749 () Bool)

(assert (=> b!433749 (= e!256425 true)))

(declare-fun lt!199254 () ListLongMap!6483)

(declare-fun lt!199255 () tuple2!7570)

(assert (=> b!433749 (= lt!199265 (+!1405 (+!1405 lt!199254 lt!199252) lt!199255))))

(declare-fun lt!199264 () Unit!12847)

(declare-fun v!412 () V!16255)

(declare-fun addCommutativeForDiffKeys!393 (ListLongMap!6483 (_ BitVec 64) V!16255 (_ BitVec 64) V!16255) Unit!12847)

(assert (=> b!433749 (= lt!199264 (addCommutativeForDiffKeys!393 lt!199254 k!794 v!412 (select (arr!12729 _keys!709) from!863) lt!199261))))

(declare-fun b!433750 () Bool)

(declare-fun e!256426 () Bool)

(declare-fun e!256423 () Bool)

(declare-fun mapRes!18666 () Bool)

(assert (=> b!433750 (= e!256426 (and e!256423 mapRes!18666))))

(declare-fun condMapEmpty!18666 () Bool)

(declare-fun mapDefault!18666 () ValueCell!5338)

