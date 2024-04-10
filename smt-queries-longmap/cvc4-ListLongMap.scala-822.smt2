; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20032 () Bool)

(assert start!20032)

(declare-fun b!196179 () Bool)

(declare-fun e!129161 () Bool)

(assert (=> b!196179 (= e!129161 false)))

(declare-fun lt!97575 () Bool)

(declare-datatypes ((array!8357 0))(
  ( (array!8358 (arr!3929 (Array (_ BitVec 32) (_ BitVec 64))) (size!4254 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8357)

(declare-datatypes ((List!2462 0))(
  ( (Nil!2459) (Cons!2458 (h!3100 (_ BitVec 64)) (t!7393 List!2462)) )
))
(declare-fun arrayNoDuplicates!0 (array!8357 (_ BitVec 32) List!2462) Bool)

(assert (=> b!196179 (= lt!97575 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2459))))

(declare-fun b!196180 () Bool)

(declare-fun e!129162 () Bool)

(declare-fun tp_is_empty!4547 () Bool)

(assert (=> b!196180 (= e!129162 tp_is_empty!4547)))

(declare-fun mapNonEmpty!7889 () Bool)

(declare-fun mapRes!7889 () Bool)

(declare-fun tp!17177 () Bool)

(declare-fun e!129164 () Bool)

(assert (=> mapNonEmpty!7889 (= mapRes!7889 (and tp!17177 e!129164))))

(declare-datatypes ((V!5709 0))(
  ( (V!5710 (val!2318 Int)) )
))
(declare-datatypes ((ValueCell!1930 0))(
  ( (ValueCellFull!1930 (v!4288 V!5709)) (EmptyCell!1930) )
))
(declare-fun mapRest!7889 () (Array (_ BitVec 32) ValueCell!1930))

(declare-fun mapKey!7889 () (_ BitVec 32))

(declare-datatypes ((array!8359 0))(
  ( (array!8360 (arr!3930 (Array (_ BitVec 32) ValueCell!1930)) (size!4255 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8359)

(declare-fun mapValue!7889 () ValueCell!1930)

(assert (=> mapNonEmpty!7889 (= (arr!3930 _values!649) (store mapRest!7889 mapKey!7889 mapValue!7889))))

(declare-fun b!196181 () Bool)

(declare-fun e!129160 () Bool)

(assert (=> b!196181 (= e!129160 (and e!129162 mapRes!7889))))

(declare-fun condMapEmpty!7889 () Bool)

(declare-fun mapDefault!7889 () ValueCell!1930)

