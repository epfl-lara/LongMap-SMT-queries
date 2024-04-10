; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36564 () Bool)

(assert start!36564)

(declare-fun b!365206 () Bool)

(declare-fun e!223592 () Bool)

(declare-fun tp_is_empty!8437 () Bool)

(assert (=> b!365206 (= e!223592 tp_is_empty!8437)))

(declare-fun b!365207 () Bool)

(declare-fun e!223591 () Bool)

(declare-datatypes ((array!20831 0))(
  ( (array!20832 (arr!9892 (Array (_ BitVec 32) (_ BitVec 64))) (size!10244 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20831)

(assert (=> b!365207 (= e!223591 (bvsgt #b00000000000000000000000000000000 (size!10244 _keys!658)))))

(declare-fun b!365208 () Bool)

(declare-fun res!204204 () Bool)

(assert (=> b!365208 (=> (not res!204204) (not e!223591))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20831 (_ BitVec 32)) Bool)

(assert (=> b!365208 (= res!204204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365209 () Bool)

(declare-fun e!223594 () Bool)

(declare-fun mapRes!14196 () Bool)

(assert (=> b!365209 (= e!223594 (and e!223592 mapRes!14196))))

(declare-fun condMapEmpty!14196 () Bool)

(declare-datatypes ((V!12355 0))(
  ( (V!12356 (val!4263 Int)) )
))
(declare-datatypes ((ValueCell!3875 0))(
  ( (ValueCellFull!3875 (v!6458 V!12355)) (EmptyCell!3875) )
))
(declare-datatypes ((array!20833 0))(
  ( (array!20834 (arr!9893 (Array (_ BitVec 32) ValueCell!3875)) (size!10245 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20833)

(declare-fun mapDefault!14196 () ValueCell!3875)

