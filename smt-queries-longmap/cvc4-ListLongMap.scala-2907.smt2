; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41588 () Bool)

(assert start!41588)

(declare-fun b_free!11255 () Bool)

(declare-fun b_next!11255 () Bool)

(assert (=> start!41588 (= b_free!11255 (not b_next!11255))))

(declare-fun tp!39762 () Bool)

(declare-fun b_and!19595 () Bool)

(assert (=> start!41588 (= tp!39762 b_and!19595)))

(declare-fun mapIsEmpty!20701 () Bool)

(declare-fun mapRes!20701 () Bool)

(assert (=> mapIsEmpty!20701 mapRes!20701))

(declare-fun b!464524 () Bool)

(declare-fun e!271360 () Bool)

(declare-fun tp_is_empty!12683 () Bool)

(assert (=> b!464524 (= e!271360 tp_is_empty!12683)))

(declare-fun b!464525 () Bool)

(declare-fun e!271358 () Bool)

(declare-fun e!271362 () Bool)

(assert (=> b!464525 (= e!271358 (and e!271362 mapRes!20701))))

(declare-fun condMapEmpty!20701 () Bool)

(declare-datatypes ((V!18015 0))(
  ( (V!18016 (val!6386 Int)) )
))
(declare-datatypes ((ValueCell!5998 0))(
  ( (ValueCellFull!5998 (v!8673 V!18015)) (EmptyCell!5998) )
))
(declare-datatypes ((array!29153 0))(
  ( (array!29154 (arr!14008 (Array (_ BitVec 32) ValueCell!5998)) (size!14360 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29153)

(declare-fun mapDefault!20701 () ValueCell!5998)

