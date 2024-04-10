; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36822 () Bool)

(assert start!36822)

(declare-fun b_free!7949 () Bool)

(declare-fun b_next!7949 () Bool)

(assert (=> start!36822 (= b_free!7949 (not b_next!7949))))

(declare-fun tp!28562 () Bool)

(declare-fun b_and!15191 () Bool)

(assert (=> start!36822 (= tp!28562 b_and!15191)))

(declare-fun b!368045 () Bool)

(declare-fun res!206181 () Bool)

(declare-fun e!225155 () Bool)

(assert (=> b!368045 (=> (not res!206181) (not e!225155))))

(declare-datatypes ((array!21151 0))(
  ( (array!21152 (arr!10044 (Array (_ BitVec 32) (_ BitVec 64))) (size!10396 (_ BitVec 32))) )
))
(declare-fun lt!169470 () array!21151)

(declare-datatypes ((List!5584 0))(
  ( (Nil!5581) (Cons!5580 (h!6436 (_ BitVec 64)) (t!10734 List!5584)) )
))
(declare-fun arrayNoDuplicates!0 (array!21151 (_ BitVec 32) List!5584) Bool)

(assert (=> b!368045 (= res!206181 (arrayNoDuplicates!0 lt!169470 #b00000000000000000000000000000000 Nil!5581))))

(declare-fun b!368046 () Bool)

(declare-fun res!206182 () Bool)

(declare-fun e!225150 () Bool)

(assert (=> b!368046 (=> (not res!206182) (not e!225150))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!21151)

(assert (=> b!368046 (= res!206182 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10396 _keys!658))))))

(declare-fun b!368047 () Bool)

(declare-fun e!225154 () Bool)

(declare-fun tp_is_empty!8597 () Bool)

(assert (=> b!368047 (= e!225154 tp_is_empty!8597)))

(declare-fun b!368048 () Bool)

(declare-fun res!206185 () Bool)

(assert (=> b!368048 (=> (not res!206185) (not e!225150))))

(assert (=> b!368048 (= res!206185 (or (= (select (arr!10044 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10044 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368049 () Bool)

(declare-fun e!225152 () Bool)

(declare-fun e!225151 () Bool)

(declare-fun mapRes!14460 () Bool)

(assert (=> b!368049 (= e!225152 (and e!225151 mapRes!14460))))

(declare-fun condMapEmpty!14460 () Bool)

(declare-datatypes ((V!12567 0))(
  ( (V!12568 (val!4343 Int)) )
))
(declare-datatypes ((ValueCell!3955 0))(
  ( (ValueCellFull!3955 (v!6540 V!12567)) (EmptyCell!3955) )
))
(declare-datatypes ((array!21153 0))(
  ( (array!21154 (arr!10045 (Array (_ BitVec 32) ValueCell!3955)) (size!10397 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21153)

(declare-fun mapDefault!14460 () ValueCell!3955)

