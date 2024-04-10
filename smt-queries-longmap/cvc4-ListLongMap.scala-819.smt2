; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19984 () Bool)

(assert start!19984)

(declare-fun mapNonEmpty!7853 () Bool)

(declare-fun mapRes!7853 () Bool)

(declare-fun tp!17141 () Bool)

(declare-fun e!128954 () Bool)

(assert (=> mapNonEmpty!7853 (= mapRes!7853 (and tp!17141 e!128954))))

(declare-fun mapKey!7853 () (_ BitVec 32))

(declare-datatypes ((V!5685 0))(
  ( (V!5686 (val!2309 Int)) )
))
(declare-datatypes ((ValueCell!1921 0))(
  ( (ValueCellFull!1921 (v!4278 V!5685)) (EmptyCell!1921) )
))
(declare-fun mapRest!7853 () (Array (_ BitVec 32) ValueCell!1921))

(declare-datatypes ((array!8315 0))(
  ( (array!8316 (arr!3911 (Array (_ BitVec 32) ValueCell!1921)) (size!4236 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8315)

(declare-fun mapValue!7853 () ValueCell!1921)

(assert (=> mapNonEmpty!7853 (= (arr!3911 _values!649) (store mapRest!7853 mapKey!7853 mapValue!7853))))

(declare-fun b!195901 () Bool)

(declare-fun res!92430 () Bool)

(declare-fun e!128953 () Bool)

(assert (=> b!195901 (=> (not res!92430) (not e!128953))))

(declare-datatypes ((array!8317 0))(
  ( (array!8318 (arr!3912 (Array (_ BitVec 32) (_ BitVec 64))) (size!4237 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8317)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!195901 (= res!92430 (and (= (size!4236 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4237 _keys!825) (size!4236 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7853 () Bool)

(assert (=> mapIsEmpty!7853 mapRes!7853))

(declare-fun b!195902 () Bool)

(assert (=> b!195902 (= e!128953 (and (bvsle #b00000000000000000000000000000000 (size!4237 _keys!825)) (bvsge (size!4237 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun b!195903 () Bool)

(declare-fun e!128955 () Bool)

(declare-fun e!128951 () Bool)

(assert (=> b!195903 (= e!128955 (and e!128951 mapRes!7853))))

(declare-fun condMapEmpty!7853 () Bool)

(declare-fun mapDefault!7853 () ValueCell!1921)

