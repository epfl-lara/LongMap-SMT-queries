; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20692 () Bool)

(assert start!20692)

(declare-fun b_free!5351 () Bool)

(declare-fun b_next!5351 () Bool)

(assert (=> start!20692 (= b_free!5351 (not b_next!5351))))

(declare-fun tp!19085 () Bool)

(declare-fun b_and!12097 () Bool)

(assert (=> start!20692 (= tp!19085 b_and!12097)))

(declare-fun b!206876 () Bool)

(declare-fun res!100318 () Bool)

(declare-fun e!135149 () Bool)

(assert (=> b!206876 (=> (not res!100318) (not e!135149))))

(declare-datatypes ((array!9623 0))(
  ( (array!9624 (arr!4562 (Array (_ BitVec 32) (_ BitVec 64))) (size!4887 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9623)

(declare-datatypes ((List!2912 0))(
  ( (Nil!2909) (Cons!2908 (h!3550 (_ BitVec 64)) (t!7843 List!2912)) )
))
(declare-fun arrayNoDuplicates!0 (array!9623 (_ BitVec 32) List!2912) Bool)

(assert (=> b!206876 (= res!100318 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2909))))

(declare-fun mapIsEmpty!8879 () Bool)

(declare-fun mapRes!8879 () Bool)

(assert (=> mapIsEmpty!8879 mapRes!8879))

(declare-fun mapNonEmpty!8879 () Bool)

(declare-fun tp!19084 () Bool)

(declare-fun e!135148 () Bool)

(assert (=> mapNonEmpty!8879 (= mapRes!8879 (and tp!19084 e!135148))))

(declare-datatypes ((V!6589 0))(
  ( (V!6590 (val!2648 Int)) )
))
(declare-datatypes ((ValueCell!2260 0))(
  ( (ValueCellFull!2260 (v!4618 V!6589)) (EmptyCell!2260) )
))
(declare-fun mapRest!8879 () (Array (_ BitVec 32) ValueCell!2260))

(declare-datatypes ((array!9625 0))(
  ( (array!9626 (arr!4563 (Array (_ BitVec 32) ValueCell!2260)) (size!4888 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9625)

(declare-fun mapKey!8879 () (_ BitVec 32))

(declare-fun mapValue!8879 () ValueCell!2260)

(assert (=> mapNonEmpty!8879 (= (arr!4563 _values!649) (store mapRest!8879 mapKey!8879 mapValue!8879))))

(declare-fun res!100314 () Bool)

(assert (=> start!20692 (=> (not res!100314) (not e!135149))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20692 (= res!100314 (validMask!0 mask!1149))))

(assert (=> start!20692 e!135149))

(declare-fun e!135145 () Bool)

(declare-fun array_inv!3019 (array!9625) Bool)

(assert (=> start!20692 (and (array_inv!3019 _values!649) e!135145)))

(assert (=> start!20692 true))

(declare-fun tp_is_empty!5207 () Bool)

(assert (=> start!20692 tp_is_empty!5207))

(declare-fun array_inv!3020 (array!9623) Bool)

(assert (=> start!20692 (array_inv!3020 _keys!825)))

(assert (=> start!20692 tp!19085))

(declare-fun b!206877 () Bool)

(declare-fun res!100315 () Bool)

(assert (=> b!206877 (=> (not res!100315) (not e!135149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9623 (_ BitVec 32)) Bool)

(assert (=> b!206877 (= res!100315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206878 () Bool)

(declare-fun res!100316 () Bool)

(assert (=> b!206878 (=> (not res!100316) (not e!135149))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206878 (= res!100316 (validKeyInArray!0 k!843))))

(declare-fun b!206879 () Bool)

(declare-fun res!100312 () Bool)

(assert (=> b!206879 (=> (not res!100312) (not e!135149))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206879 (= res!100312 (= (select (arr!4562 _keys!825) i!601) k!843))))

(declare-fun b!206880 () Bool)

(declare-fun e!135146 () Bool)

(assert (=> b!206880 (= e!135145 (and e!135146 mapRes!8879))))

(declare-fun condMapEmpty!8879 () Bool)

(declare-fun mapDefault!8879 () ValueCell!2260)

