; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37254 () Bool)

(assert start!37254)

(declare-fun b_free!8381 () Bool)

(declare-fun b_next!8381 () Bool)

(assert (=> start!37254 (= b_free!8381 (not b_next!8381))))

(declare-fun tp!29859 () Bool)

(declare-fun b_and!15623 () Bool)

(assert (=> start!37254 (= tp!29859 b_and!15623)))

(declare-fun b!377016 () Bool)

(declare-fun e!229574 () Bool)

(declare-datatypes ((array!21987 0))(
  ( (array!21988 (arr!10462 (Array (_ BitVec 32) (_ BitVec 64))) (size!10814 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21987)

(assert (=> b!377016 (= e!229574 (bvsle #b00000000000000000000000000000000 (size!10814 _keys!658)))))

(declare-datatypes ((V!13143 0))(
  ( (V!13144 (val!4559 Int)) )
))
(declare-datatypes ((tuple2!6074 0))(
  ( (tuple2!6075 (_1!3048 (_ BitVec 64)) (_2!3048 V!13143)) )
))
(declare-datatypes ((List!5916 0))(
  ( (Nil!5913) (Cons!5912 (h!6768 tuple2!6074) (t!11066 List!5916)) )
))
(declare-datatypes ((ListLongMap!4987 0))(
  ( (ListLongMap!4988 (toList!2509 List!5916)) )
))
(declare-fun lt!175130 () ListLongMap!4987)

(declare-fun lt!175131 () ListLongMap!4987)

(declare-fun lt!175138 () tuple2!6074)

(declare-fun +!855 (ListLongMap!4987 tuple2!6074) ListLongMap!4987)

(assert (=> b!377016 (= lt!175130 (+!855 lt!175131 lt!175138))))

(declare-fun v!373 () V!13143)

(declare-fun lt!175135 () ListLongMap!4987)

(declare-datatypes ((Unit!11614 0))(
  ( (Unit!11615) )
))
(declare-fun lt!175140 () Unit!11614)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13143)

(declare-fun addCommutativeForDiffKeys!265 (ListLongMap!4987 (_ BitVec 64) V!13143 (_ BitVec 64) V!13143) Unit!11614)

(assert (=> b!377016 (= lt!175140 (addCommutativeForDiffKeys!265 lt!175135 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!213210 () Bool)

(declare-fun e!229567 () Bool)

(assert (=> start!37254 (=> (not res!213210) (not e!229567))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37254 (= res!213210 (validMask!0 mask!970))))

(assert (=> start!37254 e!229567))

(declare-datatypes ((ValueCell!4171 0))(
  ( (ValueCellFull!4171 (v!6756 V!13143)) (EmptyCell!4171) )
))
(declare-datatypes ((array!21989 0))(
  ( (array!21990 (arr!10463 (Array (_ BitVec 32) ValueCell!4171)) (size!10815 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21989)

(declare-fun e!229573 () Bool)

(declare-fun array_inv!7710 (array!21989) Bool)

(assert (=> start!37254 (and (array_inv!7710 _values!506) e!229573)))

(assert (=> start!37254 tp!29859))

(assert (=> start!37254 true))

(declare-fun tp_is_empty!9029 () Bool)

(assert (=> start!37254 tp_is_empty!9029))

(declare-fun array_inv!7711 (array!21987) Bool)

(assert (=> start!37254 (array_inv!7711 _keys!658)))

(declare-fun mapNonEmpty!15108 () Bool)

(declare-fun mapRes!15108 () Bool)

(declare-fun tp!29858 () Bool)

(declare-fun e!229569 () Bool)

(assert (=> mapNonEmpty!15108 (= mapRes!15108 (and tp!29858 e!229569))))

(declare-fun mapValue!15108 () ValueCell!4171)

(declare-fun mapKey!15108 () (_ BitVec 32))

(declare-fun mapRest!15108 () (Array (_ BitVec 32) ValueCell!4171))

(assert (=> mapNonEmpty!15108 (= (arr!10463 _values!506) (store mapRest!15108 mapKey!15108 mapValue!15108))))

(declare-fun mapIsEmpty!15108 () Bool)

(assert (=> mapIsEmpty!15108 mapRes!15108))

(declare-fun b!377017 () Bool)

(declare-fun res!213208 () Bool)

(assert (=> b!377017 (=> (not res!213208) (not e!229567))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377017 (= res!213208 (or (= (select (arr!10462 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10462 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377018 () Bool)

(declare-fun res!213215 () Bool)

(assert (=> b!377018 (=> (not res!213215) (not e!229567))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377018 (= res!213215 (and (= (size!10815 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10814 _keys!658) (size!10815 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377019 () Bool)

(declare-fun e!229570 () Bool)

(assert (=> b!377019 (= e!229567 e!229570)))

(declare-fun res!213218 () Bool)

(assert (=> b!377019 (=> (not res!213218) (not e!229570))))

(declare-fun lt!175132 () array!21987)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21987 (_ BitVec 32)) Bool)

(assert (=> b!377019 (= res!213218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175132 mask!970))))

(assert (=> b!377019 (= lt!175132 (array!21988 (store (arr!10462 _keys!658) i!548 k!778) (size!10814 _keys!658)))))

(declare-fun b!377020 () Bool)

(declare-fun e!229568 () Bool)

(assert (=> b!377020 (= e!229573 (and e!229568 mapRes!15108))))

(declare-fun condMapEmpty!15108 () Bool)

(declare-fun mapDefault!15108 () ValueCell!4171)

