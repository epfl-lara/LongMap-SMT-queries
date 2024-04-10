; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36550 () Bool)

(assert start!36550)

(declare-fun b!365146 () Bool)

(declare-fun e!223527 () Bool)

(declare-fun tp_is_empty!8429 () Bool)

(assert (=> b!365146 (= e!223527 tp_is_empty!8429)))

(declare-fun b!365147 () Bool)

(declare-fun e!223528 () Bool)

(assert (=> b!365147 (= e!223528 tp_is_empty!8429)))

(declare-fun res!204187 () Bool)

(declare-fun e!223524 () Bool)

(assert (=> start!36550 (=> (not res!204187) (not e!223524))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36550 (= res!204187 (validMask!0 mask!970))))

(assert (=> start!36550 e!223524))

(assert (=> start!36550 true))

(declare-datatypes ((V!12343 0))(
  ( (V!12344 (val!4259 Int)) )
))
(declare-datatypes ((ValueCell!3871 0))(
  ( (ValueCellFull!3871 (v!6454 V!12343)) (EmptyCell!3871) )
))
(declare-datatypes ((array!20813 0))(
  ( (array!20814 (arr!9884 (Array (_ BitVec 32) ValueCell!3871)) (size!10236 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20813)

(declare-fun e!223525 () Bool)

(declare-fun array_inv!7326 (array!20813) Bool)

(assert (=> start!36550 (and (array_inv!7326 _values!506) e!223525)))

(declare-datatypes ((array!20815 0))(
  ( (array!20816 (arr!9885 (Array (_ BitVec 32) (_ BitVec 64))) (size!10237 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20815)

(declare-fun array_inv!7327 (array!20815) Bool)

(assert (=> start!36550 (array_inv!7327 _keys!658)))

(declare-fun mapNonEmpty!14181 () Bool)

(declare-fun mapRes!14181 () Bool)

(declare-fun tp!28257 () Bool)

(assert (=> mapNonEmpty!14181 (= mapRes!14181 (and tp!28257 e!223528))))

(declare-fun mapKey!14181 () (_ BitVec 32))

(declare-fun mapRest!14181 () (Array (_ BitVec 32) ValueCell!3871))

(declare-fun mapValue!14181 () ValueCell!3871)

(assert (=> mapNonEmpty!14181 (= (arr!9884 _values!506) (store mapRest!14181 mapKey!14181 mapValue!14181))))

(declare-fun b!365148 () Bool)

(assert (=> b!365148 (= e!223525 (and e!223527 mapRes!14181))))

(declare-fun condMapEmpty!14181 () Bool)

(declare-fun mapDefault!14181 () ValueCell!3871)

