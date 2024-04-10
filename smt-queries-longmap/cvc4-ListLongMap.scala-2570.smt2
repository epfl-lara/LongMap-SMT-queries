; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39242 () Bool)

(assert start!39242)

(declare-fun b_free!9509 () Bool)

(declare-fun b_next!9509 () Bool)

(assert (=> start!39242 (= b_free!9509 (not b_next!9509))))

(declare-fun tp!34055 () Bool)

(declare-fun b_and!16895 () Bool)

(assert (=> start!39242 (= tp!34055 b_and!16895)))

(declare-datatypes ((array!25179 0))(
  ( (array!25180 (arr!12039 (Array (_ BitVec 32) (_ BitVec 64))) (size!12391 (_ BitVec 32))) )
))
(declare-fun lt!189966 () array!25179)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!15319 0))(
  ( (V!15320 (val!5375 Int)) )
))
(declare-fun zeroValue!515 () V!15319)

(declare-datatypes ((ValueCell!4987 0))(
  ( (ValueCellFull!4987 (v!7622 V!15319)) (EmptyCell!4987) )
))
(declare-datatypes ((array!25181 0))(
  ( (array!25182 (arr!12040 (Array (_ BitVec 32) ValueCell!4987)) (size!12392 (_ BitVec 32))) )
))
(declare-fun lt!189965 () array!25181)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25179)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15319)

(declare-fun c!54977 () Bool)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6990 0))(
  ( (tuple2!6991 (_1!3506 (_ BitVec 64)) (_2!3506 V!15319)) )
))
(declare-datatypes ((List!7013 0))(
  ( (Nil!7010) (Cons!7009 (h!7865 tuple2!6990) (t!12187 List!7013)) )
))
(declare-datatypes ((ListLongMap!5903 0))(
  ( (ListLongMap!5904 (toList!2967 List!7013)) )
))
(declare-fun call!28706 () ListLongMap!5903)

(declare-fun bm!28702 () Bool)

(declare-fun _values!549 () array!25181)

(declare-fun getCurrentListMapNoExtraKeys!1173 (array!25179 array!25181 (_ BitVec 32) (_ BitVec 32) V!15319 V!15319 (_ BitVec 32) Int) ListLongMap!5903)

(assert (=> bm!28702 (= call!28706 (getCurrentListMapNoExtraKeys!1173 (ite c!54977 _keys!709 lt!189966) (ite c!54977 _values!549 lt!189965) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414305 () Bool)

(declare-fun e!247628 () Bool)

(declare-fun e!247623 () Bool)

(declare-fun mapRes!17613 () Bool)

(assert (=> b!414305 (= e!247628 (and e!247623 mapRes!17613))))

(declare-fun condMapEmpty!17613 () Bool)

(declare-fun mapDefault!17613 () ValueCell!4987)

