; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39496 () Bool)

(assert start!39496)

(declare-fun b_free!9763 () Bool)

(declare-fun b_next!9763 () Bool)

(assert (=> start!39496 (= b_free!9763 (not b_next!9763))))

(declare-fun tp!34818 () Bool)

(declare-fun b_and!17401 () Bool)

(assert (=> start!39496 (= tp!34818 b_and!17401)))

(declare-fun b!421797 () Bool)

(declare-fun res!246210 () Bool)

(declare-fun e!251051 () Bool)

(assert (=> b!421797 (=> (not res!246210) (not e!251051))))

(declare-datatypes ((array!25677 0))(
  ( (array!25678 (arr!12288 (Array (_ BitVec 32) (_ BitVec 64))) (size!12640 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25677)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!15659 0))(
  ( (V!15660 (val!5502 Int)) )
))
(declare-datatypes ((ValueCell!5114 0))(
  ( (ValueCellFull!5114 (v!7749 V!15659)) (EmptyCell!5114) )
))
(declare-datatypes ((array!25679 0))(
  ( (array!25680 (arr!12289 (Array (_ BitVec 32) ValueCell!5114)) (size!12641 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25679)

(assert (=> b!421797 (= res!246210 (and (= (size!12641 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12640 _keys!709) (size!12641 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17994 () Bool)

(declare-fun mapRes!17994 () Bool)

(assert (=> mapIsEmpty!17994 mapRes!17994))

(declare-fun b!421798 () Bool)

(declare-fun e!251054 () Bool)

(assert (=> b!421798 (= e!251054 true)))

(declare-datatypes ((tuple2!7218 0))(
  ( (tuple2!7219 (_1!3620 (_ BitVec 64)) (_2!3620 V!15659)) )
))
(declare-fun lt!193665 () tuple2!7218)

(declare-datatypes ((List!7224 0))(
  ( (Nil!7221) (Cons!7220 (h!8076 tuple2!7218) (t!12652 List!7224)) )
))
(declare-datatypes ((ListLongMap!6131 0))(
  ( (ListLongMap!6132 (toList!3081 List!7224)) )
))
(declare-fun lt!193669 () ListLongMap!6131)

(declare-fun lt!193670 () V!15659)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1276 (ListLongMap!6131 tuple2!7218) ListLongMap!6131)

(assert (=> b!421798 (= (+!1276 lt!193669 lt!193665) (+!1276 (+!1276 lt!193669 (tuple2!7219 k!794 lt!193670)) lt!193665))))

(declare-fun lt!193668 () V!15659)

(assert (=> b!421798 (= lt!193665 (tuple2!7219 k!794 lt!193668))))

(declare-datatypes ((Unit!12454 0))(
  ( (Unit!12455) )
))
(declare-fun lt!193671 () Unit!12454)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!70 (ListLongMap!6131 (_ BitVec 64) V!15659 V!15659) Unit!12454)

(assert (=> b!421798 (= lt!193671 (addSameAsAddTwiceSameKeyDiffValues!70 lt!193669 k!794 lt!193670 lt!193668))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!193664 () V!15659)

(declare-fun get!6110 (ValueCell!5114 V!15659) V!15659)

(assert (=> b!421798 (= lt!193670 (get!6110 (select (arr!12289 _values!549) from!863) lt!193664))))

(declare-fun lt!193667 () ListLongMap!6131)

(declare-fun lt!193672 () array!25677)

(assert (=> b!421798 (= lt!193667 (+!1276 lt!193669 (tuple2!7219 (select (arr!12288 lt!193672) from!863) lt!193668)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15659)

(assert (=> b!421798 (= lt!193668 (get!6110 (select (store (arr!12289 _values!549) i!563 (ValueCellFull!5114 v!412)) from!863) lt!193664))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!741 (Int (_ BitVec 64)) V!15659)

(assert (=> b!421798 (= lt!193664 (dynLambda!741 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15659)

(declare-fun zeroValue!515 () V!15659)

(declare-fun lt!193666 () array!25679)

(declare-fun getCurrentListMapNoExtraKeys!1285 (array!25677 array!25679 (_ BitVec 32) (_ BitVec 32) V!15659 V!15659 (_ BitVec 32) Int) ListLongMap!6131)

(assert (=> b!421798 (= lt!193669 (getCurrentListMapNoExtraKeys!1285 lt!193672 lt!193666 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421799 () Bool)

(declare-fun e!251052 () Bool)

(declare-fun e!251058 () Bool)

(assert (=> b!421799 (= e!251052 (and e!251058 mapRes!17994))))

(declare-fun condMapEmpty!17994 () Bool)

(declare-fun mapDefault!17994 () ValueCell!5114)

