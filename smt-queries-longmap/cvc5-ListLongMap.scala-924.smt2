; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20640 () Bool)

(assert start!20640)

(declare-fun b_free!5299 () Bool)

(declare-fun b_next!5299 () Bool)

(assert (=> start!20640 (= b_free!5299 (not b_next!5299))))

(declare-fun tp!18929 () Bool)

(declare-fun b_and!12045 () Bool)

(assert (=> start!20640 (= tp!18929 b_and!12045)))

(declare-fun b!206028 () Bool)

(declare-fun res!99701 () Bool)

(declare-fun e!134693 () Bool)

(assert (=> b!206028 (=> (not res!99701) (not e!134693))))

(declare-datatypes ((array!9521 0))(
  ( (array!9522 (arr!4511 (Array (_ BitVec 32) (_ BitVec 64))) (size!4836 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9521)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9521 (_ BitVec 32)) Bool)

(assert (=> b!206028 (= res!99701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8801 () Bool)

(declare-fun mapRes!8801 () Bool)

(assert (=> mapIsEmpty!8801 mapRes!8801))

(declare-fun b!206029 () Bool)

(declare-fun e!134687 () Bool)

(declare-fun e!134691 () Bool)

(assert (=> b!206029 (= e!134687 e!134691)))

(declare-fun res!99700 () Bool)

(assert (=> b!206029 (=> res!99700 e!134691)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!206029 (= res!99700 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6521 0))(
  ( (V!6522 (val!2622 Int)) )
))
(declare-datatypes ((tuple2!3980 0))(
  ( (tuple2!3981 (_1!2001 (_ BitVec 64)) (_2!2001 V!6521)) )
))
(declare-datatypes ((List!2873 0))(
  ( (Nil!2870) (Cons!2869 (h!3511 tuple2!3980) (t!7804 List!2873)) )
))
(declare-datatypes ((ListLongMap!2893 0))(
  ( (ListLongMap!2894 (toList!1462 List!2873)) )
))
(declare-fun lt!105170 () ListLongMap!2893)

(declare-fun lt!105164 () ListLongMap!2893)

(assert (=> b!206029 (= lt!105170 lt!105164)))

(declare-fun lt!105166 () ListLongMap!2893)

(declare-fun lt!105161 () tuple2!3980)

(declare-fun +!489 (ListLongMap!2893 tuple2!3980) ListLongMap!2893)

(assert (=> b!206029 (= lt!105164 (+!489 lt!105166 lt!105161))))

(declare-fun lt!105168 () ListLongMap!2893)

(declare-fun lt!105162 () ListLongMap!2893)

(assert (=> b!206029 (= lt!105168 lt!105162)))

(declare-fun lt!105165 () ListLongMap!2893)

(assert (=> b!206029 (= lt!105162 (+!489 lt!105165 lt!105161))))

(declare-fun lt!105169 () ListLongMap!2893)

(assert (=> b!206029 (= lt!105168 (+!489 lt!105169 lt!105161))))

(declare-fun minValue!615 () V!6521)

(assert (=> b!206029 (= lt!105161 (tuple2!3981 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206030 () Bool)

(declare-fun res!99704 () Bool)

(assert (=> b!206030 (=> (not res!99704) (not e!134693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206030 (= res!99704 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8801 () Bool)

(declare-fun tp!18928 () Bool)

(declare-fun e!134689 () Bool)

(assert (=> mapNonEmpty!8801 (= mapRes!8801 (and tp!18928 e!134689))))

(declare-datatypes ((ValueCell!2234 0))(
  ( (ValueCellFull!2234 (v!4592 V!6521)) (EmptyCell!2234) )
))
(declare-fun mapValue!8801 () ValueCell!2234)

(declare-datatypes ((array!9523 0))(
  ( (array!9524 (arr!4512 (Array (_ BitVec 32) ValueCell!2234)) (size!4837 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9523)

(declare-fun mapKey!8801 () (_ BitVec 32))

(declare-fun mapRest!8801 () (Array (_ BitVec 32) ValueCell!2234))

(assert (=> mapNonEmpty!8801 (= (arr!4512 _values!649) (store mapRest!8801 mapKey!8801 mapValue!8801))))

(declare-fun b!206031 () Bool)

(declare-fun e!134688 () Bool)

(declare-fun e!134692 () Bool)

(assert (=> b!206031 (= e!134688 (and e!134692 mapRes!8801))))

(declare-fun condMapEmpty!8801 () Bool)

(declare-fun mapDefault!8801 () ValueCell!2234)

