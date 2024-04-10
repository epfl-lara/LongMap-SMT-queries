; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71068 () Bool)

(assert start!71068)

(declare-fun b_free!13255 () Bool)

(declare-fun b_next!13255 () Bool)

(assert (=> start!71068 (= b_free!13255 (not b_next!13255))))

(declare-fun tp!46521 () Bool)

(declare-fun b_and!22169 () Bool)

(assert (=> start!71068 (= tp!46521 b_and!22169)))

(declare-fun b!825288 () Bool)

(declare-fun e!459319 () Bool)

(declare-fun tp_is_empty!14965 () Bool)

(assert (=> b!825288 (= e!459319 tp_is_empty!14965)))

(declare-fun mapIsEmpty!24070 () Bool)

(declare-fun mapRes!24070 () Bool)

(assert (=> mapIsEmpty!24070 mapRes!24070))

(declare-fun mapNonEmpty!24070 () Bool)

(declare-fun tp!46522 () Bool)

(assert (=> mapNonEmpty!24070 (= mapRes!24070 (and tp!46522 e!459319))))

(declare-datatypes ((V!24955 0))(
  ( (V!24956 (val!7530 Int)) )
))
(declare-datatypes ((ValueCell!7067 0))(
  ( (ValueCellFull!7067 (v!9963 V!24955)) (EmptyCell!7067) )
))
(declare-datatypes ((array!46116 0))(
  ( (array!46117 (arr!22104 (Array (_ BitVec 32) ValueCell!7067)) (size!22525 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46116)

(declare-fun mapValue!24070 () ValueCell!7067)

(declare-fun mapRest!24070 () (Array (_ BitVec 32) ValueCell!7067))

(declare-fun mapKey!24070 () (_ BitVec 32))

(assert (=> mapNonEmpty!24070 (= (arr!22104 _values!788) (store mapRest!24070 mapKey!24070 mapValue!24070))))

(declare-fun b!825289 () Bool)

(declare-fun e!459317 () Bool)

(declare-fun e!459320 () Bool)

(assert (=> b!825289 (= e!459317 (and e!459320 mapRes!24070))))

(declare-fun condMapEmpty!24070 () Bool)

(declare-fun mapDefault!24070 () ValueCell!7067)

