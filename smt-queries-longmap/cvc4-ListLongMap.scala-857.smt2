; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20242 () Bool)

(assert start!20242)

(declare-fun b_free!4901 () Bool)

(declare-fun b_next!4901 () Bool)

(assert (=> start!20242 (= b_free!4901 (not b_next!4901))))

(declare-fun tp!17735 () Bool)

(declare-fun b_and!11647 () Bool)

(assert (=> start!20242 (= tp!17735 b_and!11647)))

(declare-fun b!199064 () Bool)

(declare-fun res!94531 () Bool)

(declare-fun e!130738 () Bool)

(assert (=> b!199064 (=> (not res!94531) (not e!130738))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8755 0))(
  ( (array!8756 (arr!4128 (Array (_ BitVec 32) (_ BitVec 64))) (size!4453 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8755)

(assert (=> b!199064 (= res!94531 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4453 _keys!825))))))

(declare-fun b!199065 () Bool)

(declare-fun e!130739 () Bool)

(declare-fun tp_is_empty!4757 () Bool)

(assert (=> b!199065 (= e!130739 tp_is_empty!4757)))

(declare-fun b!199066 () Bool)

(declare-fun e!130736 () Bool)

(assert (=> b!199066 (= e!130736 tp_is_empty!4757)))

(declare-fun b!199067 () Bool)

(declare-fun res!94527 () Bool)

(assert (=> b!199067 (=> (not res!94527) (not e!130738))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199067 (= res!94527 (validKeyInArray!0 k!843))))

(declare-fun b!199068 () Bool)

(declare-fun res!94530 () Bool)

(assert (=> b!199068 (=> (not res!94530) (not e!130738))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8755 (_ BitVec 32)) Bool)

(assert (=> b!199068 (= res!94530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!94529 () Bool)

(assert (=> start!20242 (=> (not res!94529) (not e!130738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20242 (= res!94529 (validMask!0 mask!1149))))

(assert (=> start!20242 e!130738))

(declare-datatypes ((V!5989 0))(
  ( (V!5990 (val!2423 Int)) )
))
(declare-datatypes ((ValueCell!2035 0))(
  ( (ValueCellFull!2035 (v!4393 V!5989)) (EmptyCell!2035) )
))
(declare-datatypes ((array!8757 0))(
  ( (array!8758 (arr!4129 (Array (_ BitVec 32) ValueCell!2035)) (size!4454 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8757)

(declare-fun e!130737 () Bool)

(declare-fun array_inv!2705 (array!8757) Bool)

(assert (=> start!20242 (and (array_inv!2705 _values!649) e!130737)))

(assert (=> start!20242 true))

(assert (=> start!20242 tp_is_empty!4757))

(declare-fun array_inv!2706 (array!8755) Bool)

(assert (=> start!20242 (array_inv!2706 _keys!825)))

(assert (=> start!20242 tp!17735))

(declare-fun b!199069 () Bool)

(declare-fun mapRes!8204 () Bool)

(assert (=> b!199069 (= e!130737 (and e!130739 mapRes!8204))))

(declare-fun condMapEmpty!8204 () Bool)

(declare-fun mapDefault!8204 () ValueCell!2035)

