; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34170 () Bool)

(assert start!34170)

(declare-fun b_free!7193 () Bool)

(declare-fun b_next!7193 () Bool)

(assert (=> start!34170 (= b_free!7193 (not b_next!7193))))

(declare-fun tp!25113 () Bool)

(declare-fun b_and!14393 () Bool)

(assert (=> start!34170 (= tp!25113 b_and!14393)))

(declare-fun mapNonEmpty!12144 () Bool)

(declare-fun mapRes!12144 () Bool)

(declare-fun tp!25112 () Bool)

(declare-fun e!208898 () Bool)

(assert (=> mapNonEmpty!12144 (= mapRes!12144 (and tp!25112 e!208898))))

(declare-datatypes ((V!10503 0))(
  ( (V!10504 (val!3617 Int)) )
))
(declare-datatypes ((ValueCell!3229 0))(
  ( (ValueCellFull!3229 (v!5789 V!10503)) (EmptyCell!3229) )
))
(declare-fun mapValue!12144 () ValueCell!3229)

(declare-datatypes ((array!17895 0))(
  ( (array!17896 (arr!8468 (Array (_ BitVec 32) ValueCell!3229)) (size!8820 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17895)

(declare-fun mapKey!12144 () (_ BitVec 32))

(declare-fun mapRest!12144 () (Array (_ BitVec 32) ValueCell!3229))

(assert (=> mapNonEmpty!12144 (= (arr!8468 _values!1525) (store mapRest!12144 mapKey!12144 mapValue!12144))))

(declare-fun b!340528 () Bool)

(declare-fun e!208897 () Bool)

(declare-fun e!208899 () Bool)

(assert (=> b!340528 (= e!208897 (and e!208899 mapRes!12144))))

(declare-fun condMapEmpty!12144 () Bool)

(declare-fun mapDefault!12144 () ValueCell!3229)

