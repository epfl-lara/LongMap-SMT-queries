; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36626 () Bool)

(assert start!36626)

(declare-fun b!365558 () Bool)

(declare-fun e!223860 () Bool)

(assert (=> b!365558 (= e!223860 false)))

(declare-fun lt!169190 () Bool)

(declare-datatypes ((array!20881 0))(
  ( (array!20882 (arr!9913 (Array (_ BitVec 32) (_ BitVec 64))) (size!10265 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20881)

(declare-datatypes ((List!5528 0))(
  ( (Nil!5525) (Cons!5524 (h!6380 (_ BitVec 64)) (t!10678 List!5528)) )
))
(declare-fun arrayNoDuplicates!0 (array!20881 (_ BitVec 32) List!5528) Bool)

(assert (=> b!365558 (= lt!169190 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5525))))

(declare-fun mapNonEmpty!14244 () Bool)

(declare-fun mapRes!14244 () Bool)

(declare-fun tp!28320 () Bool)

(declare-fun e!223863 () Bool)

(assert (=> mapNonEmpty!14244 (= mapRes!14244 (and tp!28320 e!223863))))

(declare-datatypes ((V!12387 0))(
  ( (V!12388 (val!4275 Int)) )
))
(declare-datatypes ((ValueCell!3887 0))(
  ( (ValueCellFull!3887 (v!6471 V!12387)) (EmptyCell!3887) )
))
(declare-datatypes ((array!20883 0))(
  ( (array!20884 (arr!9914 (Array (_ BitVec 32) ValueCell!3887)) (size!10266 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20883)

(declare-fun mapKey!14244 () (_ BitVec 32))

(declare-fun mapValue!14244 () ValueCell!3887)

(declare-fun mapRest!14244 () (Array (_ BitVec 32) ValueCell!3887))

(assert (=> mapNonEmpty!14244 (= (arr!9914 _values!506) (store mapRest!14244 mapKey!14244 mapValue!14244))))

(declare-fun b!365559 () Bool)

(declare-fun tp_is_empty!8461 () Bool)

(assert (=> b!365559 (= e!223863 tp_is_empty!8461)))

(declare-fun b!365560 () Bool)

(declare-fun e!223859 () Bool)

(declare-fun e!223861 () Bool)

(assert (=> b!365560 (= e!223859 (and e!223861 mapRes!14244))))

(declare-fun condMapEmpty!14244 () Bool)

(declare-fun mapDefault!14244 () ValueCell!3887)

