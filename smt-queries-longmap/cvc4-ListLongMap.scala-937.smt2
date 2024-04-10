; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20722 () Bool)

(assert start!20722)

(declare-fun b_free!5381 () Bool)

(declare-fun b_next!5381 () Bool)

(assert (=> start!20722 (= b_free!5381 (not b_next!5381))))

(declare-fun tp!19175 () Bool)

(declare-fun b_and!12127 () Bool)

(assert (=> start!20722 (= tp!19175 b_and!12127)))

(declare-fun b!207326 () Bool)

(declare-fun e!135370 () Bool)

(declare-fun tp_is_empty!5237 () Bool)

(assert (=> b!207326 (= e!135370 tp_is_empty!5237)))

(declare-fun mapIsEmpty!8924 () Bool)

(declare-fun mapRes!8924 () Bool)

(assert (=> mapIsEmpty!8924 mapRes!8924))

(declare-fun b!207327 () Bool)

(declare-fun res!100632 () Bool)

(declare-fun e!135373 () Bool)

(assert (=> b!207327 (=> (not res!100632) (not e!135373))))

(declare-datatypes ((array!9683 0))(
  ( (array!9684 (arr!4592 (Array (_ BitVec 32) (_ BitVec 64))) (size!4917 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9683)

(declare-datatypes ((List!2934 0))(
  ( (Nil!2931) (Cons!2930 (h!3572 (_ BitVec 64)) (t!7865 List!2934)) )
))
(declare-fun arrayNoDuplicates!0 (array!9683 (_ BitVec 32) List!2934) Bool)

(assert (=> b!207327 (= res!100632 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2931))))

(declare-fun b!207328 () Bool)

(declare-fun res!100627 () Bool)

(assert (=> b!207328 (=> (not res!100627) (not e!135373))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6629 0))(
  ( (V!6630 (val!2663 Int)) )
))
(declare-datatypes ((ValueCell!2275 0))(
  ( (ValueCellFull!2275 (v!4633 V!6629)) (EmptyCell!2275) )
))
(declare-datatypes ((array!9685 0))(
  ( (array!9686 (arr!4593 (Array (_ BitVec 32) ValueCell!2275)) (size!4918 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9685)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207328 (= res!100627 (and (= (size!4918 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4917 _keys!825) (size!4918 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8924 () Bool)

(declare-fun tp!19174 () Bool)

(declare-fun e!135372 () Bool)

(assert (=> mapNonEmpty!8924 (= mapRes!8924 (and tp!19174 e!135372))))

(declare-fun mapValue!8924 () ValueCell!2275)

(declare-fun mapRest!8924 () (Array (_ BitVec 32) ValueCell!2275))

(declare-fun mapKey!8924 () (_ BitVec 32))

(assert (=> mapNonEmpty!8924 (= (arr!4593 _values!649) (store mapRest!8924 mapKey!8924 mapValue!8924))))

(declare-fun b!207330 () Bool)

(declare-fun e!135371 () Bool)

(assert (=> b!207330 (= e!135371 (and e!135370 mapRes!8924))))

(declare-fun condMapEmpty!8924 () Bool)

(declare-fun mapDefault!8924 () ValueCell!2275)

