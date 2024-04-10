; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36656 () Bool)

(assert start!36656)

(declare-fun mapIsEmpty!14274 () Bool)

(declare-fun mapRes!14274 () Bool)

(assert (=> mapIsEmpty!14274 mapRes!14274))

(declare-fun mapNonEmpty!14274 () Bool)

(declare-fun tp!28350 () Bool)

(declare-fun e!224022 () Bool)

(assert (=> mapNonEmpty!14274 (= mapRes!14274 (and tp!28350 e!224022))))

(declare-datatypes ((V!12411 0))(
  ( (V!12412 (val!4284 Int)) )
))
(declare-datatypes ((ValueCell!3896 0))(
  ( (ValueCellFull!3896 (v!6480 V!12411)) (EmptyCell!3896) )
))
(declare-datatypes ((array!20915 0))(
  ( (array!20916 (arr!9929 (Array (_ BitVec 32) ValueCell!3896)) (size!10281 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20915)

(declare-fun mapValue!14274 () ValueCell!3896)

(declare-fun mapKey!14274 () (_ BitVec 32))

(declare-fun mapRest!14274 () (Array (_ BitVec 32) ValueCell!3896))

(assert (=> mapNonEmpty!14274 (= (arr!9929 _values!506) (store mapRest!14274 mapKey!14274 mapValue!14274))))

(declare-fun b!365809 () Bool)

(declare-fun e!224025 () Bool)

(declare-fun e!224023 () Bool)

(assert (=> b!365809 (= e!224025 (and e!224023 mapRes!14274))))

(declare-fun condMapEmpty!14274 () Bool)

(declare-fun mapDefault!14274 () ValueCell!3896)

