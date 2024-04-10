; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78010 () Bool)

(assert start!78010)

(declare-fun b_free!16537 () Bool)

(declare-fun b_next!16537 () Bool)

(assert (=> start!78010 (= b_free!16537 (not b_next!16537))))

(declare-fun tp!57882 () Bool)

(declare-fun b_and!27109 () Bool)

(assert (=> start!78010 (= tp!57882 b_and!27109)))

(declare-fun mapIsEmpty!30154 () Bool)

(declare-fun mapRes!30154 () Bool)

(assert (=> mapIsEmpty!30154 mapRes!30154))

(declare-fun b!910653 () Bool)

(declare-fun res!614485 () Bool)

(declare-fun e!510612 () Bool)

(assert (=> b!910653 (=> (not res!614485) (not e!510612))))

(declare-datatypes ((V!30239 0))(
  ( (V!30240 (val!9528 Int)) )
))
(declare-datatypes ((ValueCell!8996 0))(
  ( (ValueCellFull!8996 (v!12037 V!30239)) (EmptyCell!8996) )
))
(declare-datatypes ((array!53926 0))(
  ( (array!53927 (arr!25919 (Array (_ BitVec 32) ValueCell!8996)) (size!26378 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53926)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53928 0))(
  ( (array!53929 (arr!25920 (Array (_ BitVec 32) (_ BitVec 64))) (size!26379 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53928)

(assert (=> b!910653 (= res!614485 (and (= (size!26378 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26379 _keys!1386) (size!26378 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910654 () Bool)

(declare-fun e!510613 () Bool)

(declare-fun tp_is_empty!18955 () Bool)

(assert (=> b!910654 (= e!510613 tp_is_empty!18955)))

(declare-fun b!910655 () Bool)

(declare-fun e!510615 () Bool)

(assert (=> b!910655 (= e!510615 (and e!510613 mapRes!30154))))

(declare-fun condMapEmpty!30154 () Bool)

(declare-fun mapDefault!30154 () ValueCell!8996)

