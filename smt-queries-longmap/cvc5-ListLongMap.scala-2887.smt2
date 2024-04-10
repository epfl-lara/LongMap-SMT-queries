; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41452 () Bool)

(assert start!41452)

(declare-fun b_free!11131 () Bool)

(declare-fun b_next!11131 () Bool)

(assert (=> start!41452 (= b_free!11131 (not b_next!11131))))

(declare-fun tp!39388 () Bool)

(declare-fun b_and!19467 () Bool)

(assert (=> start!41452 (= tp!39388 b_and!19467)))

(declare-fun res!276952 () Bool)

(declare-fun e!270381 () Bool)

(assert (=> start!41452 (=> (not res!276952) (not e!270381))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41452 (= res!276952 (validMask!0 mask!1365))))

(assert (=> start!41452 e!270381))

(declare-fun tp_is_empty!12559 () Bool)

(assert (=> start!41452 tp_is_empty!12559))

(assert (=> start!41452 tp!39388))

(assert (=> start!41452 true))

(declare-datatypes ((array!28913 0))(
  ( (array!28914 (arr!13889 (Array (_ BitVec 32) (_ BitVec 64))) (size!14241 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28913)

(declare-fun array_inv!10040 (array!28913) Bool)

(assert (=> start!41452 (array_inv!10040 _keys!1025)))

(declare-datatypes ((V!17851 0))(
  ( (V!17852 (val!6324 Int)) )
))
(declare-datatypes ((ValueCell!5936 0))(
  ( (ValueCellFull!5936 (v!8611 V!17851)) (EmptyCell!5936) )
))
(declare-datatypes ((array!28915 0))(
  ( (array!28916 (arr!13890 (Array (_ BitVec 32) ValueCell!5936)) (size!14242 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28915)

(declare-fun e!270384 () Bool)

(declare-fun array_inv!10041 (array!28915) Bool)

(assert (=> start!41452 (and (array_inv!10041 _values!833) e!270384)))

(declare-fun b!463149 () Bool)

(declare-fun e!270382 () Bool)

(declare-fun mapRes!20512 () Bool)

(assert (=> b!463149 (= e!270384 (and e!270382 mapRes!20512))))

(declare-fun condMapEmpty!20512 () Bool)

(declare-fun mapDefault!20512 () ValueCell!5936)

