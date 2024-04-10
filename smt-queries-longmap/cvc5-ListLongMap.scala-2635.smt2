; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39628 () Bool)

(assert start!39628)

(declare-fun b_free!9895 () Bool)

(declare-fun b_next!9895 () Bool)

(assert (=> start!39628 (= b_free!9895 (not b_next!9895))))

(declare-fun tp!35213 () Bool)

(declare-fun b_and!17551 () Bool)

(assert (=> start!39628 (= tp!35213 b_and!17551)))

(declare-fun b!424895 () Bool)

(declare-fun res!248644 () Bool)

(declare-fun e!252325 () Bool)

(assert (=> b!424895 (=> (not res!248644) (not e!252325))))

(declare-datatypes ((array!25933 0))(
  ( (array!25934 (arr!12416 (Array (_ BitVec 32) (_ BitVec 64))) (size!12768 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25933)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424895 (= res!248644 (or (= (select (arr!12416 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12416 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424896 () Bool)

(declare-fun e!252330 () Bool)

(declare-fun tp_is_empty!11047 () Bool)

(assert (=> b!424896 (= e!252330 tp_is_empty!11047)))

(declare-fun b!424897 () Bool)

(declare-fun e!252327 () Bool)

(assert (=> b!424897 (= e!252327 tp_is_empty!11047)))

(declare-fun mapNonEmpty!18192 () Bool)

(declare-fun mapRes!18192 () Bool)

(declare-fun tp!35214 () Bool)

(assert (=> mapNonEmpty!18192 (= mapRes!18192 (and tp!35214 e!252330))))

(declare-fun mapKey!18192 () (_ BitVec 32))

(declare-datatypes ((V!15835 0))(
  ( (V!15836 (val!5568 Int)) )
))
(declare-datatypes ((ValueCell!5180 0))(
  ( (ValueCellFull!5180 (v!7815 V!15835)) (EmptyCell!5180) )
))
(declare-datatypes ((array!25935 0))(
  ( (array!25936 (arr!12417 (Array (_ BitVec 32) ValueCell!5180)) (size!12769 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25935)

(declare-fun mapRest!18192 () (Array (_ BitVec 32) ValueCell!5180))

(declare-fun mapValue!18192 () ValueCell!5180)

(assert (=> mapNonEmpty!18192 (= (arr!12417 _values!549) (store mapRest!18192 mapKey!18192 mapValue!18192))))

(declare-fun b!424898 () Bool)

(declare-fun e!252324 () Bool)

(declare-fun e!252328 () Bool)

(assert (=> b!424898 (= e!252324 e!252328)))

(declare-fun res!248645 () Bool)

(assert (=> b!424898 (=> (not res!248645) (not e!252328))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424898 (= res!248645 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194481 () array!25933)

(declare-fun minValue!515 () V!15835)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7312 0))(
  ( (tuple2!7313 (_1!3667 (_ BitVec 64)) (_2!3667 V!15835)) )
))
(declare-datatypes ((List!7322 0))(
  ( (Nil!7319) (Cons!7318 (h!8174 tuple2!7312) (t!12766 List!7322)) )
))
(declare-datatypes ((ListLongMap!6225 0))(
  ( (ListLongMap!6226 (toList!3128 List!7322)) )
))
(declare-fun lt!194479 () ListLongMap!6225)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!194482 () array!25935)

(declare-fun zeroValue!515 () V!15835)

(declare-fun getCurrentListMapNoExtraKeys!1332 (array!25933 array!25935 (_ BitVec 32) (_ BitVec 32) V!15835 V!15835 (_ BitVec 32) Int) ListLongMap!6225)

(assert (=> b!424898 (= lt!194479 (getCurrentListMapNoExtraKeys!1332 lt!194481 lt!194482 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15835)

(assert (=> b!424898 (= lt!194482 (array!25936 (store (arr!12417 _values!549) i!563 (ValueCellFull!5180 v!412)) (size!12769 _values!549)))))

(declare-fun lt!194480 () ListLongMap!6225)

(assert (=> b!424898 (= lt!194480 (getCurrentListMapNoExtraKeys!1332 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!248650 () Bool)

(assert (=> start!39628 (=> (not res!248650) (not e!252325))))

(assert (=> start!39628 (= res!248650 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12768 _keys!709))))))

(assert (=> start!39628 e!252325))

(assert (=> start!39628 tp_is_empty!11047))

(assert (=> start!39628 tp!35213))

(assert (=> start!39628 true))

(declare-fun e!252329 () Bool)

(declare-fun array_inv!9046 (array!25935) Bool)

(assert (=> start!39628 (and (array_inv!9046 _values!549) e!252329)))

(declare-fun array_inv!9047 (array!25933) Bool)

(assert (=> start!39628 (array_inv!9047 _keys!709)))

(declare-fun b!424899 () Bool)

(declare-fun res!248648 () Bool)

(assert (=> b!424899 (=> (not res!248648) (not e!252324))))

(declare-datatypes ((List!7323 0))(
  ( (Nil!7320) (Cons!7319 (h!8175 (_ BitVec 64)) (t!12767 List!7323)) )
))
(declare-fun arrayNoDuplicates!0 (array!25933 (_ BitVec 32) List!7323) Bool)

(assert (=> b!424899 (= res!248648 (arrayNoDuplicates!0 lt!194481 #b00000000000000000000000000000000 Nil!7320))))

(declare-fun b!424900 () Bool)

(declare-fun res!248652 () Bool)

(assert (=> b!424900 (=> (not res!248652) (not e!252324))))

(assert (=> b!424900 (= res!248652 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18192 () Bool)

(assert (=> mapIsEmpty!18192 mapRes!18192))

(declare-fun b!424901 () Bool)

(declare-fun res!248653 () Bool)

(assert (=> b!424901 (=> (not res!248653) (not e!252325))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424901 (= res!248653 (validKeyInArray!0 k!794))))

(declare-fun b!424902 () Bool)

(declare-fun res!248643 () Bool)

(assert (=> b!424902 (=> (not res!248643) (not e!252325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424902 (= res!248643 (validMask!0 mask!1025))))

(declare-fun b!424903 () Bool)

(declare-fun res!248655 () Bool)

(assert (=> b!424903 (=> (not res!248655) (not e!252325))))

(assert (=> b!424903 (= res!248655 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12768 _keys!709))))))

(declare-fun b!424904 () Bool)

(assert (=> b!424904 (= e!252325 e!252324)))

(declare-fun res!248649 () Bool)

(assert (=> b!424904 (=> (not res!248649) (not e!252324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25933 (_ BitVec 32)) Bool)

(assert (=> b!424904 (= res!248649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194481 mask!1025))))

(assert (=> b!424904 (= lt!194481 (array!25934 (store (arr!12416 _keys!709) i!563 k!794) (size!12768 _keys!709)))))

(declare-fun b!424905 () Bool)

(assert (=> b!424905 (= e!252329 (and e!252327 mapRes!18192))))

(declare-fun condMapEmpty!18192 () Bool)

(declare-fun mapDefault!18192 () ValueCell!5180)

