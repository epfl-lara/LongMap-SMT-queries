; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39518 () Bool)

(assert start!39518)

(declare-fun b_free!9785 () Bool)

(declare-fun b_next!9785 () Bool)

(assert (=> start!39518 (= b_free!9785 (not b_next!9785))))

(declare-fun tp!34883 () Bool)

(declare-fun b_and!17441 () Bool)

(assert (=> start!39518 (= tp!34883 b_and!17441)))

(declare-fun b!422409 () Bool)

(declare-fun e!251328 () Bool)

(declare-fun e!251324 () Bool)

(assert (=> b!422409 (= e!251328 e!251324)))

(declare-fun res!246661 () Bool)

(assert (=> b!422409 (=> (not res!246661) (not e!251324))))

(declare-datatypes ((array!25721 0))(
  ( (array!25722 (arr!12310 (Array (_ BitVec 32) (_ BitVec 64))) (size!12662 (_ BitVec 32))) )
))
(declare-fun lt!193963 () array!25721)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25721 (_ BitVec 32)) Bool)

(assert (=> b!422409 (= res!246661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193963 mask!1025))))

(declare-fun _keys!709 () array!25721)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422409 (= lt!193963 (array!25722 (store (arr!12310 _keys!709) i!563 k!794) (size!12662 _keys!709)))))

(declare-fun b!422410 () Bool)

(declare-fun res!246652 () Bool)

(assert (=> b!422410 (=> (not res!246652) (not e!251328))))

(assert (=> b!422410 (= res!246652 (or (= (select (arr!12310 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12310 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422411 () Bool)

(declare-fun res!246663 () Bool)

(assert (=> b!422411 (=> (not res!246663) (not e!251328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422411 (= res!246663 (validKeyInArray!0 k!794))))

(declare-fun b!422412 () Bool)

(assert (=> b!422412 (= e!251324 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15687 0))(
  ( (V!15688 (val!5513 Int)) )
))
(declare-fun minValue!515 () V!15687)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5125 0))(
  ( (ValueCellFull!5125 (v!7760 V!15687)) (EmptyCell!5125) )
))
(declare-datatypes ((array!25723 0))(
  ( (array!25724 (arr!12311 (Array (_ BitVec 32) ValueCell!5125)) (size!12663 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25723)

(declare-fun zeroValue!515 () V!15687)

(declare-datatypes ((tuple2!7240 0))(
  ( (tuple2!7241 (_1!3631 (_ BitVec 64)) (_2!3631 V!15687)) )
))
(declare-datatypes ((List!7245 0))(
  ( (Nil!7242) (Cons!7241 (h!8097 tuple2!7240) (t!12689 List!7245)) )
))
(declare-datatypes ((ListLongMap!6153 0))(
  ( (ListLongMap!6154 (toList!3092 List!7245)) )
))
(declare-fun lt!193962 () ListLongMap!6153)

(declare-fun v!412 () V!15687)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1296 (array!25721 array!25723 (_ BitVec 32) (_ BitVec 32) V!15687 V!15687 (_ BitVec 32) Int) ListLongMap!6153)

(assert (=> b!422412 (= lt!193962 (getCurrentListMapNoExtraKeys!1296 lt!193963 (array!25724 (store (arr!12311 _values!549) i!563 (ValueCellFull!5125 v!412)) (size!12663 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193964 () ListLongMap!6153)

(assert (=> b!422412 (= lt!193964 (getCurrentListMapNoExtraKeys!1296 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422413 () Bool)

(declare-fun res!246658 () Bool)

(assert (=> b!422413 (=> (not res!246658) (not e!251328))))

(declare-datatypes ((List!7246 0))(
  ( (Nil!7243) (Cons!7242 (h!8098 (_ BitVec 64)) (t!12690 List!7246)) )
))
(declare-fun arrayNoDuplicates!0 (array!25721 (_ BitVec 32) List!7246) Bool)

(assert (=> b!422413 (= res!246658 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7243))))

(declare-fun b!422414 () Bool)

(declare-fun res!246662 () Bool)

(assert (=> b!422414 (=> (not res!246662) (not e!251324))))

(assert (=> b!422414 (= res!246662 (bvsle from!863 i!563))))

(declare-fun b!422415 () Bool)

(declare-fun res!246660 () Bool)

(assert (=> b!422415 (=> (not res!246660) (not e!251328))))

(assert (=> b!422415 (= res!246660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18027 () Bool)

(declare-fun mapRes!18027 () Bool)

(assert (=> mapIsEmpty!18027 mapRes!18027))

(declare-fun b!422416 () Bool)

(declare-fun res!246659 () Bool)

(assert (=> b!422416 (=> (not res!246659) (not e!251324))))

(assert (=> b!422416 (= res!246659 (arrayNoDuplicates!0 lt!193963 #b00000000000000000000000000000000 Nil!7243))))

(declare-fun b!422417 () Bool)

(declare-fun e!251325 () Bool)

(declare-fun tp_is_empty!10937 () Bool)

(assert (=> b!422417 (= e!251325 tp_is_empty!10937)))

(declare-fun mapNonEmpty!18027 () Bool)

(declare-fun tp!34884 () Bool)

(assert (=> mapNonEmpty!18027 (= mapRes!18027 (and tp!34884 e!251325))))

(declare-fun mapKey!18027 () (_ BitVec 32))

(declare-fun mapValue!18027 () ValueCell!5125)

(declare-fun mapRest!18027 () (Array (_ BitVec 32) ValueCell!5125))

(assert (=> mapNonEmpty!18027 (= (arr!12311 _values!549) (store mapRest!18027 mapKey!18027 mapValue!18027))))

(declare-fun b!422418 () Bool)

(declare-fun res!246654 () Bool)

(assert (=> b!422418 (=> (not res!246654) (not e!251328))))

(declare-fun arrayContainsKey!0 (array!25721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422418 (= res!246654 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!422419 () Bool)

(declare-fun e!251327 () Bool)

(assert (=> b!422419 (= e!251327 tp_is_empty!10937)))

(declare-fun res!246656 () Bool)

(assert (=> start!39518 (=> (not res!246656) (not e!251328))))

(assert (=> start!39518 (= res!246656 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12662 _keys!709))))))

(assert (=> start!39518 e!251328))

(assert (=> start!39518 tp_is_empty!10937))

(assert (=> start!39518 tp!34883))

(assert (=> start!39518 true))

(declare-fun e!251326 () Bool)

(declare-fun array_inv!8970 (array!25723) Bool)

(assert (=> start!39518 (and (array_inv!8970 _values!549) e!251326)))

(declare-fun array_inv!8971 (array!25721) Bool)

(assert (=> start!39518 (array_inv!8971 _keys!709)))

(declare-fun b!422420 () Bool)

(assert (=> b!422420 (= e!251326 (and e!251327 mapRes!18027))))

(declare-fun condMapEmpty!18027 () Bool)

(declare-fun mapDefault!18027 () ValueCell!5125)

