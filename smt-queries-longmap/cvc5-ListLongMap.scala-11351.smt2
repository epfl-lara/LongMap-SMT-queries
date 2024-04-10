; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132010 () Bool)

(assert start!132010)

(declare-fun b_free!31723 () Bool)

(declare-fun b_next!31723 () Bool)

(assert (=> start!132010 (= b_free!31723 (not b_next!31723))))

(declare-fun tp!111420 () Bool)

(declare-fun b_and!51133 () Bool)

(assert (=> start!132010 (= tp!111420 b_and!51133)))

(declare-fun b!1546793 () Bool)

(declare-datatypes ((V!59109 0))(
  ( (V!59110 (val!19077 Int)) )
))
(declare-datatypes ((tuple2!24534 0))(
  ( (tuple2!24535 (_1!12278 (_ BitVec 64)) (_2!12278 V!59109)) )
))
(declare-datatypes ((List!36037 0))(
  ( (Nil!36034) (Cons!36033 (h!37478 tuple2!24534) (t!50731 List!36037)) )
))
(declare-datatypes ((ListLongMap!22143 0))(
  ( (ListLongMap!22144 (toList!11087 List!36037)) )
))
(declare-fun e!860987 () ListLongMap!22143)

(declare-fun call!69652 () ListLongMap!22143)

(assert (=> b!1546793 (= e!860987 call!69652)))

(declare-fun b!1546794 () Bool)

(declare-fun e!860985 () ListLongMap!22143)

(declare-fun call!69654 () ListLongMap!22143)

(assert (=> b!1546794 (= e!860985 call!69654)))

(declare-fun mapNonEmpty!58702 () Bool)

(declare-fun mapRes!58702 () Bool)

(declare-fun tp!111421 () Bool)

(declare-fun e!860989 () Bool)

(assert (=> mapNonEmpty!58702 (= mapRes!58702 (and tp!111421 e!860989))))

(declare-datatypes ((ValueCell!18089 0))(
  ( (ValueCellFull!18089 (v!21878 V!59109)) (EmptyCell!18089) )
))
(declare-fun mapValue!58702 () ValueCell!18089)

(declare-datatypes ((array!103200 0))(
  ( (array!103201 (arr!49802 (Array (_ BitVec 32) ValueCell!18089)) (size!50352 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103200)

(declare-fun mapRest!58702 () (Array (_ BitVec 32) ValueCell!18089))

(declare-fun mapKey!58702 () (_ BitVec 32))

(assert (=> mapNonEmpty!58702 (= (arr!49802 _values!470) (store mapRest!58702 mapKey!58702 mapValue!58702))))

(declare-fun b!1546795 () Bool)

(declare-fun tp_is_empty!37999 () Bool)

(assert (=> b!1546795 (= e!860989 tp_is_empty!37999)))

(declare-fun b!1546796 () Bool)

(declare-fun e!860983 () Bool)

(declare-fun e!860991 () Bool)

(assert (=> b!1546796 (= e!860983 (and e!860991 mapRes!58702))))

(declare-fun condMapEmpty!58702 () Bool)

(declare-fun mapDefault!58702 () ValueCell!18089)

