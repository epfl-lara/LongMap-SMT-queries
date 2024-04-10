; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41338 () Bool)

(assert start!41338)

(declare-fun b!462184 () Bool)

(declare-fun e!269634 () Bool)

(declare-fun tp_is_empty!12467 () Bool)

(assert (=> b!462184 (= e!269634 tp_is_empty!12467)))

(declare-fun mapNonEmpty!20368 () Bool)

(declare-fun mapRes!20368 () Bool)

(declare-fun tp!39187 () Bool)

(declare-fun e!269633 () Bool)

(assert (=> mapNonEmpty!20368 (= mapRes!20368 (and tp!39187 e!269633))))

(declare-fun mapKey!20368 () (_ BitVec 32))

(declare-datatypes ((V!17727 0))(
  ( (V!17728 (val!6278 Int)) )
))
(declare-datatypes ((ValueCell!5890 0))(
  ( (ValueCellFull!5890 (v!8564 V!17727)) (EmptyCell!5890) )
))
(declare-fun mapValue!20368 () ValueCell!5890)

(declare-datatypes ((array!28735 0))(
  ( (array!28736 (arr!13802 (Array (_ BitVec 32) ValueCell!5890)) (size!14154 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28735)

(declare-fun mapRest!20368 () (Array (_ BitVec 32) ValueCell!5890))

(assert (=> mapNonEmpty!20368 (= (arr!13802 _values!833) (store mapRest!20368 mapKey!20368 mapValue!20368))))

(declare-fun res!276435 () Bool)

(declare-fun e!269637 () Bool)

(assert (=> start!41338 (=> (not res!276435) (not e!269637))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41338 (= res!276435 (validMask!0 mask!1365))))

(assert (=> start!41338 e!269637))

(assert (=> start!41338 true))

(declare-datatypes ((array!28737 0))(
  ( (array!28738 (arr!13803 (Array (_ BitVec 32) (_ BitVec 64))) (size!14155 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28737)

(declare-fun array_inv!9980 (array!28737) Bool)

(assert (=> start!41338 (array_inv!9980 _keys!1025)))

(declare-fun e!269638 () Bool)

(declare-fun array_inv!9981 (array!28735) Bool)

(assert (=> start!41338 (and (array_inv!9981 _values!833) e!269638)))

(declare-fun mapIsEmpty!20368 () Bool)

(assert (=> mapIsEmpty!20368 mapRes!20368))

(declare-fun b!462185 () Bool)

(assert (=> b!462185 (= e!269633 tp_is_empty!12467)))

(declare-fun b!462186 () Bool)

(assert (=> b!462186 (= e!269638 (and e!269634 mapRes!20368))))

(declare-fun condMapEmpty!20368 () Bool)

(declare-fun mapDefault!20368 () ValueCell!5890)

