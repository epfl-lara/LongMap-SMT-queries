; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20868 () Bool)

(assert start!20868)

(declare-fun b_free!5521 () Bool)

(declare-fun b_next!5521 () Bool)

(assert (=> start!20868 (= b_free!5521 (not b_next!5521))))

(declare-fun tp!19603 () Bool)

(declare-fun b_and!12267 () Bool)

(assert (=> start!20868 (= tp!19603 b_and!12267)))

(declare-fun mapNonEmpty!9143 () Bool)

(declare-fun mapRes!9143 () Bool)

(declare-fun tp!19604 () Bool)

(declare-fun e!136469 () Bool)

(assert (=> mapNonEmpty!9143 (= mapRes!9143 (and tp!19604 e!136469))))

(declare-fun mapKey!9143 () (_ BitVec 32))

(declare-datatypes ((V!6825 0))(
  ( (V!6826 (val!2736 Int)) )
))
(declare-datatypes ((ValueCell!2348 0))(
  ( (ValueCellFull!2348 (v!4706 V!6825)) (EmptyCell!2348) )
))
(declare-datatypes ((array!9963 0))(
  ( (array!9964 (arr!4732 (Array (_ BitVec 32) ValueCell!2348)) (size!5057 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9963)

(declare-fun mapValue!9143 () ValueCell!2348)

(declare-fun mapRest!9143 () (Array (_ BitVec 32) ValueCell!2348))

(assert (=> mapNonEmpty!9143 (= (arr!4732 _values!649) (store mapRest!9143 mapKey!9143 mapValue!9143))))

(declare-fun b!209482 () Bool)

(declare-fun res!102128 () Bool)

(declare-fun e!136470 () Bool)

(assert (=> b!209482 (=> (not res!102128) (not e!136470))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9965 0))(
  ( (array!9966 (arr!4733 (Array (_ BitVec 32) (_ BitVec 64))) (size!5058 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9965)

(assert (=> b!209482 (= res!102128 (= (select (arr!4733 _keys!825) i!601) k!843))))

(declare-fun res!102126 () Bool)

(assert (=> start!20868 (=> (not res!102126) (not e!136470))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20868 (= res!102126 (validMask!0 mask!1149))))

(assert (=> start!20868 e!136470))

(declare-fun e!136472 () Bool)

(declare-fun array_inv!3135 (array!9963) Bool)

(assert (=> start!20868 (and (array_inv!3135 _values!649) e!136472)))

(assert (=> start!20868 true))

(declare-fun tp_is_empty!5383 () Bool)

(assert (=> start!20868 tp_is_empty!5383))

(declare-fun array_inv!3136 (array!9965) Bool)

(assert (=> start!20868 (array_inv!3136 _keys!825)))

(assert (=> start!20868 tp!19603))

(declare-fun minValue!615 () V!6825)

(declare-fun b!209483 () Bool)

(declare-datatypes ((tuple2!4134 0))(
  ( (tuple2!4135 (_1!2078 (_ BitVec 64)) (_2!2078 V!6825)) )
))
(declare-datatypes ((List!3030 0))(
  ( (Nil!3027) (Cons!3026 (h!3668 tuple2!4134) (t!7961 List!3030)) )
))
(declare-datatypes ((ListLongMap!3047 0))(
  ( (ListLongMap!3048 (toList!1539 List!3030)) )
))
(declare-fun lt!107045 () ListLongMap!3047)

(declare-fun zeroValue!615 () V!6825)

(declare-fun lt!107041 () ListLongMap!3047)

(declare-fun e!136471 () Bool)

(declare-fun +!542 (ListLongMap!3047 tuple2!4134) ListLongMap!3047)

(assert (=> b!209483 (= e!136471 (= lt!107045 (+!542 (+!542 lt!107041 (tuple2!4135 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4135 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!209484 () Bool)

(declare-fun res!102130 () Bool)

(assert (=> b!209484 (=> (not res!102130) (not e!136470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9965 (_ BitVec 32)) Bool)

(assert (=> b!209484 (= res!102130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209485 () Bool)

(declare-fun res!102129 () Bool)

(assert (=> b!209485 (=> (not res!102129) (not e!136470))))

(assert (=> b!209485 (= res!102129 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5058 _keys!825))))))

(declare-fun b!209486 () Bool)

(declare-fun res!102127 () Bool)

(assert (=> b!209486 (=> (not res!102127) (not e!136470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209486 (= res!102127 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!9143 () Bool)

(assert (=> mapIsEmpty!9143 mapRes!9143))

(declare-fun b!209487 () Bool)

(declare-fun res!102132 () Bool)

(assert (=> b!209487 (=> (not res!102132) (not e!136470))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209487 (= res!102132 (and (= (size!5057 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5058 _keys!825) (size!5057 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209488 () Bool)

(declare-fun res!102133 () Bool)

(assert (=> b!209488 (=> (not res!102133) (not e!136470))))

(declare-datatypes ((List!3031 0))(
  ( (Nil!3028) (Cons!3027 (h!3669 (_ BitVec 64)) (t!7962 List!3031)) )
))
(declare-fun arrayNoDuplicates!0 (array!9965 (_ BitVec 32) List!3031) Bool)

(assert (=> b!209488 (= res!102133 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3028))))

(declare-fun b!209489 () Bool)

(declare-fun e!136467 () Bool)

(assert (=> b!209489 (= e!136472 (and e!136467 mapRes!9143))))

(declare-fun condMapEmpty!9143 () Bool)

(declare-fun mapDefault!9143 () ValueCell!2348)

