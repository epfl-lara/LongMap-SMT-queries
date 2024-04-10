; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39908 () Bool)

(assert start!39908)

(declare-fun b_free!10175 () Bool)

(declare-fun b_next!10175 () Bool)

(assert (=> start!39908 (= b_free!10175 (not b_next!10175))))

(declare-fun tp!36053 () Bool)

(declare-fun b_and!18009 () Bool)

(assert (=> start!39908 (= tp!36053 b_and!18009)))

(declare-fun b!432627 () Bool)

(declare-fun e!255885 () Bool)

(declare-fun e!255882 () Bool)

(assert (=> b!432627 (= e!255885 e!255882)))

(declare-fun res!254506 () Bool)

(assert (=> b!432627 (=> res!254506 e!255882)))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26487 0))(
  ( (array!26488 (arr!12693 (Array (_ BitVec 32) (_ BitVec 64))) (size!13045 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26487)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!432627 (= res!254506 (= k!794 (select (arr!12693 _keys!709) from!863)))))

(assert (=> b!432627 (not (= (select (arr!12693 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12783 0))(
  ( (Unit!12784) )
))
(declare-fun lt!198446 () Unit!12783)

(declare-fun e!255889 () Unit!12783)

(assert (=> b!432627 (= lt!198446 e!255889)))

(declare-fun c!55598 () Bool)

(assert (=> b!432627 (= c!55598 (= (select (arr!12693 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16207 0))(
  ( (V!16208 (val!5708 Int)) )
))
(declare-datatypes ((tuple2!7534 0))(
  ( (tuple2!7535 (_1!3778 (_ BitVec 64)) (_2!3778 V!16207)) )
))
(declare-datatypes ((List!7549 0))(
  ( (Nil!7546) (Cons!7545 (h!8401 tuple2!7534) (t!13173 List!7549)) )
))
(declare-datatypes ((ListLongMap!6447 0))(
  ( (ListLongMap!6448 (toList!3239 List!7549)) )
))
(declare-fun lt!198448 () ListLongMap!6447)

(declare-fun lt!198452 () ListLongMap!6447)

(assert (=> b!432627 (= lt!198448 lt!198452)))

(declare-fun lt!198442 () ListLongMap!6447)

(declare-fun lt!198453 () tuple2!7534)

(declare-fun +!1387 (ListLongMap!6447 tuple2!7534) ListLongMap!6447)

(assert (=> b!432627 (= lt!198452 (+!1387 lt!198442 lt!198453))))

(declare-fun lt!198443 () V!16207)

(assert (=> b!432627 (= lt!198453 (tuple2!7535 (select (arr!12693 _keys!709) from!863) lt!198443))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5320 0))(
  ( (ValueCellFull!5320 (v!7955 V!16207)) (EmptyCell!5320) )
))
(declare-datatypes ((array!26489 0))(
  ( (array!26490 (arr!12694 (Array (_ BitVec 32) ValueCell!5320)) (size!13046 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26489)

(declare-fun get!6310 (ValueCell!5320 V!16207) V!16207)

(declare-fun dynLambda!805 (Int (_ BitVec 64)) V!16207)

(assert (=> b!432627 (= lt!198443 (get!6310 (select (arr!12694 _values!549) from!863) (dynLambda!805 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432628 () Bool)

(declare-fun e!255887 () Bool)

(declare-fun e!255890 () Bool)

(assert (=> b!432628 (= e!255887 e!255890)))

(declare-fun res!254513 () Bool)

(assert (=> b!432628 (=> (not res!254513) (not e!255890))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432628 (= res!254513 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16207)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198447 () array!26489)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!198441 () array!26487)

(declare-fun zeroValue!515 () V!16207)

(declare-fun getCurrentListMapNoExtraKeys!1437 (array!26487 array!26489 (_ BitVec 32) (_ BitVec 32) V!16207 V!16207 (_ BitVec 32) Int) ListLongMap!6447)

(assert (=> b!432628 (= lt!198448 (getCurrentListMapNoExtraKeys!1437 lt!198441 lt!198447 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16207)

(assert (=> b!432628 (= lt!198447 (array!26490 (store (arr!12694 _values!549) i!563 (ValueCellFull!5320 v!412)) (size!13046 _values!549)))))

(declare-fun lt!198454 () ListLongMap!6447)

(assert (=> b!432628 (= lt!198454 (getCurrentListMapNoExtraKeys!1437 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432629 () Bool)

(declare-fun Unit!12785 () Unit!12783)

(assert (=> b!432629 (= e!255889 Unit!12785)))

(declare-fun mapIsEmpty!18612 () Bool)

(declare-fun mapRes!18612 () Bool)

(assert (=> mapIsEmpty!18612 mapRes!18612))

(declare-fun b!432630 () Bool)

(declare-fun res!254518 () Bool)

(declare-fun e!255886 () Bool)

(assert (=> b!432630 (=> (not res!254518) (not e!255886))))

(assert (=> b!432630 (= res!254518 (or (= (select (arr!12693 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12693 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432631 () Bool)

(declare-fun e!255891 () Bool)

(declare-fun e!255884 () Bool)

(assert (=> b!432631 (= e!255891 (and e!255884 mapRes!18612))))

(declare-fun condMapEmpty!18612 () Bool)

(declare-fun mapDefault!18612 () ValueCell!5320)

