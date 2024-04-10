; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39520 () Bool)

(assert start!39520)

(declare-fun b_free!9787 () Bool)

(declare-fun b_next!9787 () Bool)

(assert (=> start!39520 (= b_free!9787 (not b_next!9787))))

(declare-fun tp!34889 () Bool)

(declare-fun b_and!17443 () Bool)

(assert (=> start!39520 (= tp!34889 b_and!17443)))

(declare-fun b!422454 () Bool)

(declare-fun e!251341 () Bool)

(assert (=> b!422454 (= e!251341 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25725 0))(
  ( (array!25726 (arr!12312 (Array (_ BitVec 32) (_ BitVec 64))) (size!12664 (_ BitVec 32))) )
))
(declare-fun lt!193973 () array!25725)

(declare-datatypes ((V!15691 0))(
  ( (V!15692 (val!5514 Int)) )
))
(declare-fun minValue!515 () V!15691)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7242 0))(
  ( (tuple2!7243 (_1!3632 (_ BitVec 64)) (_2!3632 V!15691)) )
))
(declare-datatypes ((List!7247 0))(
  ( (Nil!7244) (Cons!7243 (h!8099 tuple2!7242) (t!12691 List!7247)) )
))
(declare-datatypes ((ListLongMap!6155 0))(
  ( (ListLongMap!6156 (toList!3093 List!7247)) )
))
(declare-fun lt!193971 () ListLongMap!6155)

(declare-datatypes ((ValueCell!5126 0))(
  ( (ValueCellFull!5126 (v!7761 V!15691)) (EmptyCell!5126) )
))
(declare-datatypes ((array!25727 0))(
  ( (array!25728 (arr!12313 (Array (_ BitVec 32) ValueCell!5126)) (size!12665 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25727)

(declare-fun zeroValue!515 () V!15691)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15691)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1297 (array!25725 array!25727 (_ BitVec 32) (_ BitVec 32) V!15691 V!15691 (_ BitVec 32) Int) ListLongMap!6155)

(assert (=> b!422454 (= lt!193971 (getCurrentListMapNoExtraKeys!1297 lt!193973 (array!25728 (store (arr!12313 _values!549) i!563 (ValueCellFull!5126 v!412)) (size!12665 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193972 () ListLongMap!6155)

(declare-fun _keys!709 () array!25725)

(assert (=> b!422454 (= lt!193972 (getCurrentListMapNoExtraKeys!1297 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422455 () Bool)

(declare-fun e!251346 () Bool)

(declare-fun tp_is_empty!10939 () Bool)

(assert (=> b!422455 (= e!251346 tp_is_empty!10939)))

(declare-fun b!422456 () Bool)

(declare-fun res!246694 () Bool)

(declare-fun e!251345 () Bool)

(assert (=> b!422456 (=> (not res!246694) (not e!251345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422456 (= res!246694 (validMask!0 mask!1025))))

(declare-fun b!422457 () Bool)

(declare-fun res!246699 () Bool)

(assert (=> b!422457 (=> (not res!246699) (not e!251345))))

(assert (=> b!422457 (= res!246699 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12664 _keys!709))))))

(declare-fun res!246692 () Bool)

(assert (=> start!39520 (=> (not res!246692) (not e!251345))))

(assert (=> start!39520 (= res!246692 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12664 _keys!709))))))

(assert (=> start!39520 e!251345))

(assert (=> start!39520 tp_is_empty!10939))

(assert (=> start!39520 tp!34889))

(assert (=> start!39520 true))

(declare-fun e!251343 () Bool)

(declare-fun array_inv!8972 (array!25727) Bool)

(assert (=> start!39520 (and (array_inv!8972 _values!549) e!251343)))

(declare-fun array_inv!8973 (array!25725) Bool)

(assert (=> start!39520 (array_inv!8973 _keys!709)))

(declare-fun b!422458 () Bool)

(declare-fun res!246698 () Bool)

(assert (=> b!422458 (=> (not res!246698) (not e!251341))))

(declare-datatypes ((List!7248 0))(
  ( (Nil!7245) (Cons!7244 (h!8100 (_ BitVec 64)) (t!12692 List!7248)) )
))
(declare-fun arrayNoDuplicates!0 (array!25725 (_ BitVec 32) List!7248) Bool)

(assert (=> b!422458 (= res!246698 (arrayNoDuplicates!0 lt!193973 #b00000000000000000000000000000000 Nil!7245))))

(declare-fun b!422459 () Bool)

(declare-fun res!246689 () Bool)

(assert (=> b!422459 (=> (not res!246689) (not e!251345))))

(assert (=> b!422459 (= res!246689 (or (= (select (arr!12312 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12312 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422460 () Bool)

(assert (=> b!422460 (= e!251345 e!251341)))

(declare-fun res!246696 () Bool)

(assert (=> b!422460 (=> (not res!246696) (not e!251341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25725 (_ BitVec 32)) Bool)

(assert (=> b!422460 (= res!246696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193973 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!422460 (= lt!193973 (array!25726 (store (arr!12312 _keys!709) i!563 k!794) (size!12664 _keys!709)))))

(declare-fun b!422461 () Bool)

(declare-fun e!251342 () Bool)

(assert (=> b!422461 (= e!251342 tp_is_empty!10939)))

(declare-fun b!422462 () Bool)

(declare-fun res!246691 () Bool)

(assert (=> b!422462 (=> (not res!246691) (not e!251345))))

(declare-fun arrayContainsKey!0 (array!25725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422462 (= res!246691 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!422463 () Bool)

(declare-fun res!246697 () Bool)

(assert (=> b!422463 (=> (not res!246697) (not e!251345))))

(assert (=> b!422463 (= res!246697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422464 () Bool)

(declare-fun res!246690 () Bool)

(assert (=> b!422464 (=> (not res!246690) (not e!251345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422464 (= res!246690 (validKeyInArray!0 k!794))))

(declare-fun b!422465 () Bool)

(declare-fun res!246693 () Bool)

(assert (=> b!422465 (=> (not res!246693) (not e!251345))))

(assert (=> b!422465 (= res!246693 (and (= (size!12665 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12664 _keys!709) (size!12665 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18030 () Bool)

(declare-fun mapRes!18030 () Bool)

(declare-fun tp!34890 () Bool)

(assert (=> mapNonEmpty!18030 (= mapRes!18030 (and tp!34890 e!251346))))

(declare-fun mapRest!18030 () (Array (_ BitVec 32) ValueCell!5126))

(declare-fun mapKey!18030 () (_ BitVec 32))

(declare-fun mapValue!18030 () ValueCell!5126)

(assert (=> mapNonEmpty!18030 (= (arr!12313 _values!549) (store mapRest!18030 mapKey!18030 mapValue!18030))))

(declare-fun b!422466 () Bool)

(assert (=> b!422466 (= e!251343 (and e!251342 mapRes!18030))))

(declare-fun condMapEmpty!18030 () Bool)

(declare-fun mapDefault!18030 () ValueCell!5126)

