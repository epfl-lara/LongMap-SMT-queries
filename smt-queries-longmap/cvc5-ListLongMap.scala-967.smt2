; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20980 () Bool)

(assert start!20980)

(declare-fun b_free!5551 () Bool)

(declare-fun b_next!5551 () Bool)

(assert (=> start!20980 (= b_free!5551 (not b_next!5551))))

(declare-fun tp!19706 () Bool)

(declare-fun b_and!12345 () Bool)

(assert (=> start!20980 (= tp!19706 b_and!12345)))

(declare-fun res!102859 () Bool)

(declare-fun e!137242 () Bool)

(assert (=> start!20980 (=> (not res!102859) (not e!137242))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20980 (= res!102859 (validMask!0 mask!1149))))

(assert (=> start!20980 e!137242))

(declare-datatypes ((V!6865 0))(
  ( (V!6866 (val!2751 Int)) )
))
(declare-datatypes ((ValueCell!2363 0))(
  ( (ValueCellFull!2363 (v!4737 V!6865)) (EmptyCell!2363) )
))
(declare-datatypes ((array!10027 0))(
  ( (array!10028 (arr!4760 (Array (_ BitVec 32) ValueCell!2363)) (size!5085 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10027)

(declare-fun e!137241 () Bool)

(declare-fun array_inv!3151 (array!10027) Bool)

(assert (=> start!20980 (and (array_inv!3151 _values!649) e!137241)))

(assert (=> start!20980 true))

(declare-fun tp_is_empty!5413 () Bool)

(assert (=> start!20980 tp_is_empty!5413))

(declare-datatypes ((array!10029 0))(
  ( (array!10030 (arr!4761 (Array (_ BitVec 32) (_ BitVec 64))) (size!5086 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10029)

(declare-fun array_inv!3152 (array!10029) Bool)

(assert (=> start!20980 (array_inv!3152 _keys!825)))

(assert (=> start!20980 tp!19706))

(declare-fun b!210780 () Bool)

(declare-fun res!102861 () Bool)

(assert (=> b!210780 (=> (not res!102861) (not e!137242))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210780 (= res!102861 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5086 _keys!825))))))

(declare-fun b!210781 () Bool)

(declare-fun e!137243 () Bool)

(assert (=> b!210781 (= e!137243 tp_is_empty!5413)))

(declare-fun b!210782 () Bool)

(declare-fun e!137246 () Bool)

(assert (=> b!210782 (= e!137246 tp_is_empty!5413)))

(declare-fun mapIsEmpty!9200 () Bool)

(declare-fun mapRes!9200 () Bool)

(assert (=> mapIsEmpty!9200 mapRes!9200))

(declare-fun b!210783 () Bool)

(declare-fun res!102860 () Bool)

(assert (=> b!210783 (=> (not res!102860) (not e!137242))))

(declare-datatypes ((List!3051 0))(
  ( (Nil!3048) (Cons!3047 (h!3689 (_ BitVec 64)) (t!7990 List!3051)) )
))
(declare-fun arrayNoDuplicates!0 (array!10029 (_ BitVec 32) List!3051) Bool)

(assert (=> b!210783 (= res!102860 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3048))))

(declare-fun b!210784 () Bool)

(assert (=> b!210784 (= e!137241 (and e!137243 mapRes!9200))))

(declare-fun condMapEmpty!9200 () Bool)

(declare-fun mapDefault!9200 () ValueCell!2363)

