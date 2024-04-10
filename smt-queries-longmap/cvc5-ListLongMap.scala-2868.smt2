; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41290 () Bool)

(assert start!41290)

(declare-fun b!461887 () Bool)

(declare-fun e!269411 () Bool)

(declare-fun tp_is_empty!12445 () Bool)

(assert (=> b!461887 (= e!269411 tp_is_empty!12445)))

(declare-fun mapNonEmpty!20326 () Bool)

(declare-fun mapRes!20326 () Bool)

(declare-fun tp!39145 () Bool)

(declare-fun e!269409 () Bool)

(assert (=> mapNonEmpty!20326 (= mapRes!20326 (and tp!39145 e!269409))))

(declare-datatypes ((V!17699 0))(
  ( (V!17700 (val!6267 Int)) )
))
(declare-datatypes ((ValueCell!5879 0))(
  ( (ValueCellFull!5879 (v!8553 V!17699)) (EmptyCell!5879) )
))
(declare-fun mapValue!20326 () ValueCell!5879)

(declare-datatypes ((array!28687 0))(
  ( (array!28688 (arr!13781 (Array (_ BitVec 32) ValueCell!5879)) (size!14133 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28687)

(declare-fun mapRest!20326 () (Array (_ BitVec 32) ValueCell!5879))

(declare-fun mapKey!20326 () (_ BitVec 32))

(assert (=> mapNonEmpty!20326 (= (arr!13781 _values!833) (store mapRest!20326 mapKey!20326 mapValue!20326))))

(declare-fun b!461888 () Bool)

(assert (=> b!461888 (= e!269409 tp_is_empty!12445)))

(declare-fun b!461889 () Bool)

(declare-fun e!269412 () Bool)

(declare-datatypes ((array!28689 0))(
  ( (array!28690 (arr!13782 (Array (_ BitVec 32) (_ BitVec 64))) (size!14134 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28689)

(assert (=> b!461889 (= e!269412 (bvsgt #b00000000000000000000000000000000 (size!14134 _keys!1025)))))

(declare-fun b!461890 () Bool)

(declare-fun e!269413 () Bool)

(assert (=> b!461890 (= e!269413 (and e!269411 mapRes!20326))))

(declare-fun condMapEmpty!20326 () Bool)

(declare-fun mapDefault!20326 () ValueCell!5879)

