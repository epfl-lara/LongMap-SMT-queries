; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20838 () Bool)

(assert start!20838)

(declare-fun b_free!5491 () Bool)

(declare-fun b_next!5491 () Bool)

(assert (=> start!20838 (= b_free!5491 (not b_next!5491))))

(declare-fun tp!19513 () Bool)

(declare-fun b_and!12237 () Bool)

(assert (=> start!20838 (= tp!19513 b_and!12237)))

(declare-fun b!209030 () Bool)

(declare-fun res!101813 () Bool)

(declare-fun e!136242 () Bool)

(assert (=> b!209030 (=> (not res!101813) (not e!136242))))

(declare-datatypes ((array!9907 0))(
  ( (array!9908 (arr!4704 (Array (_ BitVec 32) (_ BitVec 64))) (size!5029 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9907)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6785 0))(
  ( (V!6786 (val!2721 Int)) )
))
(declare-datatypes ((ValueCell!2333 0))(
  ( (ValueCellFull!2333 (v!4691 V!6785)) (EmptyCell!2333) )
))
(declare-datatypes ((array!9909 0))(
  ( (array!9910 (arr!4705 (Array (_ BitVec 32) ValueCell!2333)) (size!5030 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9909)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!209030 (= res!101813 (and (= (size!5030 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5029 _keys!825) (size!5030 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9098 () Bool)

(declare-fun mapRes!9098 () Bool)

(assert (=> mapIsEmpty!9098 mapRes!9098))

(declare-fun b!209031 () Bool)

(declare-fun e!136244 () Bool)

(declare-fun tp_is_empty!5353 () Bool)

(assert (=> b!209031 (= e!136244 tp_is_empty!5353)))

(declare-fun b!209032 () Bool)

(declare-fun res!101809 () Bool)

(assert (=> b!209032 (=> (not res!101809) (not e!136242))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209032 (= res!101809 (= (select (arr!4704 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!9098 () Bool)

(declare-fun tp!19514 () Bool)

(assert (=> mapNonEmpty!9098 (= mapRes!9098 (and tp!19514 e!136244))))

(declare-fun mapValue!9098 () ValueCell!2333)

(declare-fun mapRest!9098 () (Array (_ BitVec 32) ValueCell!2333))

(declare-fun mapKey!9098 () (_ BitVec 32))

(assert (=> mapNonEmpty!9098 (= (arr!4705 _values!649) (store mapRest!9098 mapKey!9098 mapValue!9098))))

(declare-fun b!209033 () Bool)

(declare-fun res!101814 () Bool)

(assert (=> b!209033 (=> (not res!101814) (not e!136242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9907 (_ BitVec 32)) Bool)

(assert (=> b!209033 (= res!101814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209035 () Bool)

(declare-fun e!136241 () Bool)

(assert (=> b!209035 (= e!136241 tp_is_empty!5353)))

(declare-fun b!209036 () Bool)

(declare-fun e!136240 () Bool)

(assert (=> b!209036 (= e!136240 (and e!136241 mapRes!9098))))

(declare-fun condMapEmpty!9098 () Bool)

(declare-fun mapDefault!9098 () ValueCell!2333)

