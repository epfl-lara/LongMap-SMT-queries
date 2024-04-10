; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39436 () Bool)

(assert start!39436)

(declare-fun b_free!9703 () Bool)

(declare-fun b_next!9703 () Bool)

(assert (=> start!39436 (= b_free!9703 (not b_next!9703))))

(declare-fun tp!34638 () Bool)

(declare-fun b_and!17281 () Bool)

(assert (=> start!39436 (= tp!34638 b_and!17281)))

(declare-fun b!420026 () Bool)

(declare-fun e!250243 () Bool)

(assert (=> b!420026 (= e!250243 true)))

(declare-datatypes ((V!15579 0))(
  ( (V!15580 (val!5472 Int)) )
))
(declare-fun lt!192675 () V!15579)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!7166 0))(
  ( (tuple2!7167 (_1!3594 (_ BitVec 64)) (_2!3594 V!15579)) )
))
(declare-datatypes ((List!7174 0))(
  ( (Nil!7171) (Cons!7170 (h!8026 tuple2!7166) (t!12542 List!7174)) )
))
(declare-datatypes ((ListLongMap!6079 0))(
  ( (ListLongMap!6080 (toList!3055 List!7174)) )
))
(declare-fun lt!192682 () ListLongMap!6079)

(declare-fun lt!192679 () tuple2!7166)

(declare-fun +!1252 (ListLongMap!6079 tuple2!7166) ListLongMap!6079)

(assert (=> b!420026 (= (+!1252 lt!192682 lt!192679) (+!1252 (+!1252 lt!192682 (tuple2!7167 k!794 lt!192675)) lt!192679))))

(declare-fun lt!192677 () V!15579)

(assert (=> b!420026 (= lt!192679 (tuple2!7167 k!794 lt!192677))))

(declare-datatypes ((Unit!12408 0))(
  ( (Unit!12409) )
))
(declare-fun lt!192676 () Unit!12408)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!49 (ListLongMap!6079 (_ BitVec 64) V!15579 V!15579) Unit!12408)

(assert (=> b!420026 (= lt!192676 (addSameAsAddTwiceSameKeyDiffValues!49 lt!192682 k!794 lt!192675 lt!192677))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5084 0))(
  ( (ValueCellFull!5084 (v!7719 V!15579)) (EmptyCell!5084) )
))
(declare-datatypes ((array!25559 0))(
  ( (array!25560 (arr!12229 (Array (_ BitVec 32) ValueCell!5084)) (size!12581 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25559)

(declare-fun lt!192673 () V!15579)

(declare-fun get!6069 (ValueCell!5084 V!15579) V!15579)

(assert (=> b!420026 (= lt!192675 (get!6069 (select (arr!12229 _values!549) from!863) lt!192673))))

(declare-datatypes ((array!25561 0))(
  ( (array!25562 (arr!12230 (Array (_ BitVec 32) (_ BitVec 64))) (size!12582 (_ BitVec 32))) )
))
(declare-fun lt!192680 () array!25561)

(declare-fun lt!192678 () ListLongMap!6079)

(assert (=> b!420026 (= lt!192678 (+!1252 lt!192682 (tuple2!7167 (select (arr!12230 lt!192680) from!863) lt!192677)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15579)

(assert (=> b!420026 (= lt!192677 (get!6069 (select (store (arr!12229 _values!549) i!563 (ValueCellFull!5084 v!412)) from!863) lt!192673))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!720 (Int (_ BitVec 64)) V!15579)

(assert (=> b!420026 (= lt!192673 (dynLambda!720 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15579)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!192681 () array!25559)

(declare-fun zeroValue!515 () V!15579)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1260 (array!25561 array!25559 (_ BitVec 32) (_ BitVec 32) V!15579 V!15579 (_ BitVec 32) Int) ListLongMap!6079)

(assert (=> b!420026 (= lt!192682 (getCurrentListMapNoExtraKeys!1260 lt!192680 lt!192681 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29287 () ListLongMap!6079)

(declare-fun b!420027 () Bool)

(declare-fun call!29288 () ListLongMap!6079)

(declare-fun e!250240 () Bool)

(assert (=> b!420027 (= e!250240 (= call!29287 (+!1252 call!29288 (tuple2!7167 k!794 v!412))))))

(declare-fun b!420028 () Bool)

(declare-fun res!244954 () Bool)

(declare-fun e!250241 () Bool)

(assert (=> b!420028 (=> (not res!244954) (not e!250241))))

(declare-fun _keys!709 () array!25561)

(declare-datatypes ((List!7175 0))(
  ( (Nil!7172) (Cons!7171 (h!8027 (_ BitVec 64)) (t!12543 List!7175)) )
))
(declare-fun arrayNoDuplicates!0 (array!25561 (_ BitVec 32) List!7175) Bool)

(assert (=> b!420028 (= res!244954 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7172))))

(declare-fun b!420029 () Bool)

(declare-fun e!250244 () Bool)

(assert (=> b!420029 (= e!250241 e!250244)))

(declare-fun res!244948 () Bool)

(assert (=> b!420029 (=> (not res!244948) (not e!250244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25561 (_ BitVec 32)) Bool)

(assert (=> b!420029 (= res!244948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192680 mask!1025))))

(assert (=> b!420029 (= lt!192680 (array!25562 (store (arr!12230 _keys!709) i!563 k!794) (size!12582 _keys!709)))))

(declare-fun b!420030 () Bool)

(declare-fun res!244946 () Bool)

(assert (=> b!420030 (=> (not res!244946) (not e!250241))))

(assert (=> b!420030 (= res!244946 (and (= (size!12581 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12582 _keys!709) (size!12581 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420031 () Bool)

(declare-fun res!244959 () Bool)

(assert (=> b!420031 (=> (not res!244959) (not e!250244))))

(assert (=> b!420031 (= res!244959 (arrayNoDuplicates!0 lt!192680 #b00000000000000000000000000000000 Nil!7172))))

(declare-fun b!420032 () Bool)

(assert (=> b!420032 (= e!250240 (= call!29288 call!29287))))

(declare-fun b!420033 () Bool)

(declare-fun e!250242 () Bool)

(declare-fun e!250248 () Bool)

(declare-fun mapRes!17904 () Bool)

(assert (=> b!420033 (= e!250242 (and e!250248 mapRes!17904))))

(declare-fun condMapEmpty!17904 () Bool)

(declare-fun mapDefault!17904 () ValueCell!5084)

