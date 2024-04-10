; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20584 () Bool)

(assert start!20584)

(declare-fun b_free!5243 () Bool)

(declare-fun b_next!5243 () Bool)

(assert (=> start!20584 (= b_free!5243 (not b_next!5243))))

(declare-fun tp!18761 () Bool)

(declare-fun b_and!11989 () Bool)

(assert (=> start!20584 (= tp!18761 b_and!11989)))

(declare-fun b!205020 () Bool)

(declare-fun res!98948 () Bool)

(declare-fun e!134100 () Bool)

(assert (=> b!205020 (=> (not res!98948) (not e!134100))))

(declare-datatypes ((array!9411 0))(
  ( (array!9412 (arr!4456 (Array (_ BitVec 32) (_ BitVec 64))) (size!4781 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9411)

(declare-datatypes ((List!2831 0))(
  ( (Nil!2828) (Cons!2827 (h!3469 (_ BitVec 64)) (t!7762 List!2831)) )
))
(declare-fun arrayNoDuplicates!0 (array!9411 (_ BitVec 32) List!2831) Bool)

(assert (=> b!205020 (= res!98948 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2828))))

(declare-fun b!205021 () Bool)

(declare-fun e!134101 () Bool)

(declare-fun tp_is_empty!5099 () Bool)

(assert (=> b!205021 (= e!134101 tp_is_empty!5099)))

(declare-fun res!98949 () Bool)

(assert (=> start!20584 (=> (not res!98949) (not e!134100))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20584 (= res!98949 (validMask!0 mask!1149))))

(assert (=> start!20584 e!134100))

(declare-datatypes ((V!6445 0))(
  ( (V!6446 (val!2594 Int)) )
))
(declare-datatypes ((ValueCell!2206 0))(
  ( (ValueCellFull!2206 (v!4564 V!6445)) (EmptyCell!2206) )
))
(declare-datatypes ((array!9413 0))(
  ( (array!9414 (arr!4457 (Array (_ BitVec 32) ValueCell!2206)) (size!4782 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9413)

(declare-fun e!134105 () Bool)

(declare-fun array_inv!2943 (array!9413) Bool)

(assert (=> start!20584 (and (array_inv!2943 _values!649) e!134105)))

(assert (=> start!20584 true))

(assert (=> start!20584 tp_is_empty!5099))

(declare-fun array_inv!2944 (array!9411) Bool)

(assert (=> start!20584 (array_inv!2944 _keys!825)))

(assert (=> start!20584 tp!18761))

(declare-fun b!205022 () Bool)

(declare-fun e!134103 () Bool)

(declare-fun mapRes!8717 () Bool)

(assert (=> b!205022 (= e!134105 (and e!134103 mapRes!8717))))

(declare-fun condMapEmpty!8717 () Bool)

(declare-fun mapDefault!8717 () ValueCell!2206)

