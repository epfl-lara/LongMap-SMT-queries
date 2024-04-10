; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20850 () Bool)

(assert start!20850)

(declare-fun b_free!5503 () Bool)

(declare-fun b_next!5503 () Bool)

(assert (=> start!20850 (= b_free!5503 (not b_next!5503))))

(declare-fun tp!19549 () Bool)

(declare-fun b_and!12249 () Bool)

(assert (=> start!20850 (= tp!19549 b_and!12249)))

(declare-fun mapIsEmpty!9116 () Bool)

(declare-fun mapRes!9116 () Bool)

(assert (=> mapIsEmpty!9116 mapRes!9116))

(declare-fun mapNonEmpty!9116 () Bool)

(declare-fun tp!19550 () Bool)

(declare-fun e!136333 () Bool)

(assert (=> mapNonEmpty!9116 (= mapRes!9116 (and tp!19550 e!136333))))

(declare-datatypes ((V!6801 0))(
  ( (V!6802 (val!2727 Int)) )
))
(declare-datatypes ((ValueCell!2339 0))(
  ( (ValueCellFull!2339 (v!4697 V!6801)) (EmptyCell!2339) )
))
(declare-fun mapRest!9116 () (Array (_ BitVec 32) ValueCell!2339))

(declare-fun mapKey!9116 () (_ BitVec 32))

(declare-datatypes ((array!9929 0))(
  ( (array!9930 (arr!4715 (Array (_ BitVec 32) ValueCell!2339)) (size!5040 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9929)

(declare-fun mapValue!9116 () ValueCell!2339)

(assert (=> mapNonEmpty!9116 (= (arr!4715 _values!649) (store mapRest!9116 mapKey!9116 mapValue!9116))))

(declare-fun b!209210 () Bool)

(declare-fun res!101935 () Bool)

(declare-fun e!136331 () Bool)

(assert (=> b!209210 (=> (not res!101935) (not e!136331))))

(declare-datatypes ((array!9931 0))(
  ( (array!9932 (arr!4716 (Array (_ BitVec 32) (_ BitVec 64))) (size!5041 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9931)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209210 (= res!101935 (and (= (size!5040 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5041 _keys!825) (size!5040 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209211 () Bool)

(declare-fun tp_is_empty!5365 () Bool)

(assert (=> b!209211 (= e!136333 tp_is_empty!5365)))

(declare-fun b!209213 () Bool)

(declare-fun res!101938 () Bool)

(assert (=> b!209213 (=> (not res!101938) (not e!136331))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209213 (= res!101938 (validKeyInArray!0 k!843))))

(declare-fun b!209214 () Bool)

(declare-fun e!136332 () Bool)

(assert (=> b!209214 (= e!136332 tp_is_empty!5365)))

(declare-fun b!209215 () Bool)

(declare-fun e!136334 () Bool)

(assert (=> b!209215 (= e!136334 (and e!136332 mapRes!9116))))

(declare-fun condMapEmpty!9116 () Bool)

(declare-fun mapDefault!9116 () ValueCell!2339)

