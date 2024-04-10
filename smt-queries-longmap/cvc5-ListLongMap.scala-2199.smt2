; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36552 () Bool)

(assert start!36552)

(declare-fun mapIsEmpty!14184 () Bool)

(declare-fun mapRes!14184 () Bool)

(assert (=> mapIsEmpty!14184 mapRes!14184))

(declare-fun b!365158 () Bool)

(declare-fun e!223543 () Bool)

(declare-fun tp_is_empty!8431 () Bool)

(assert (=> b!365158 (= e!223543 tp_is_empty!8431)))

(declare-fun b!365159 () Bool)

(declare-fun e!223539 () Bool)

(assert (=> b!365159 (= e!223539 tp_is_empty!8431)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12347 0))(
  ( (V!12348 (val!4260 Int)) )
))
(declare-datatypes ((ValueCell!3872 0))(
  ( (ValueCellFull!3872 (v!6455 V!12347)) (EmptyCell!3872) )
))
(declare-datatypes ((array!20817 0))(
  ( (array!20818 (arr!9886 (Array (_ BitVec 32) ValueCell!3872)) (size!10238 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20817)

(declare-fun b!365160 () Bool)

(declare-fun e!223540 () Bool)

(declare-datatypes ((array!20819 0))(
  ( (array!20820 (arr!9887 (Array (_ BitVec 32) (_ BitVec 64))) (size!10239 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20819)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365160 (= e!223540 (and (= (size!10238 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10239 _keys!658) (size!10238 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (= (size!10239 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)) (bvsgt #b00000000000000000000000000000000 (size!10239 _keys!658))))))

(declare-fun b!365161 () Bool)

(declare-fun e!223542 () Bool)

(assert (=> b!365161 (= e!223542 (and e!223543 mapRes!14184))))

(declare-fun condMapEmpty!14184 () Bool)

(declare-fun mapDefault!14184 () ValueCell!3872)

