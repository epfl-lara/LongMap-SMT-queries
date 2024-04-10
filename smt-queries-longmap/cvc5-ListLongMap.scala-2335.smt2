; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37472 () Bool)

(assert start!37472)

(declare-fun b_free!8599 () Bool)

(declare-fun b_next!8599 () Bool)

(assert (=> start!37472 (= b_free!8599 (not b_next!8599))))

(declare-fun tp!30512 () Bool)

(declare-fun b_and!15841 () Bool)

(assert (=> start!37472 (= tp!30512 b_and!15841)))

(declare-fun b!381856 () Bool)

(declare-fun e!232110 () Bool)

(declare-datatypes ((array!22407 0))(
  ( (array!22408 (arr!10672 (Array (_ BitVec 32) (_ BitVec 64))) (size!11024 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22407)

(assert (=> b!381856 (= e!232110 (bvsle #b00000000000000000000000000000000 (size!11024 _keys!658)))))

(declare-datatypes ((V!13435 0))(
  ( (V!13436 (val!4668 Int)) )
))
(declare-datatypes ((tuple2!6274 0))(
  ( (tuple2!6275 (_1!3148 (_ BitVec 64)) (_2!3148 V!13435)) )
))
(declare-datatypes ((List!6104 0))(
  ( (Nil!6101) (Cons!6100 (h!6956 tuple2!6274) (t!11254 List!6104)) )
))
(declare-datatypes ((ListLongMap!5187 0))(
  ( (ListLongMap!5188 (toList!2609 List!6104)) )
))
(declare-fun lt!179049 () ListLongMap!5187)

(declare-fun lt!179050 () ListLongMap!5187)

(assert (=> b!381856 (= lt!179049 lt!179050)))

(declare-fun b!381857 () Bool)

(declare-fun res!217075 () Bool)

(declare-fun e!232109 () Bool)

(assert (=> b!381857 (=> (not res!217075) (not e!232109))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381857 (= res!217075 (validKeyInArray!0 k!778))))

(declare-fun b!381858 () Bool)

(declare-fun e!232114 () Bool)

(declare-fun tp_is_empty!9247 () Bool)

(assert (=> b!381858 (= e!232114 tp_is_empty!9247)))

(declare-fun b!381859 () Bool)

(declare-fun res!217074 () Bool)

(assert (=> b!381859 (=> (not res!217074) (not e!232109))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4280 0))(
  ( (ValueCellFull!4280 (v!6865 V!13435)) (EmptyCell!4280) )
))
(declare-datatypes ((array!22409 0))(
  ( (array!22410 (arr!10673 (Array (_ BitVec 32) ValueCell!4280)) (size!11025 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22409)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!381859 (= res!217074 (and (= (size!11025 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11024 _keys!658) (size!11025 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381860 () Bool)

(declare-fun res!217067 () Bool)

(assert (=> b!381860 (=> (not res!217067) (not e!232109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22407 (_ BitVec 32)) Bool)

(assert (=> b!381860 (= res!217067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15435 () Bool)

(declare-fun mapRes!15435 () Bool)

(assert (=> mapIsEmpty!15435 mapRes!15435))

(declare-fun b!381861 () Bool)

(declare-fun res!217071 () Bool)

(assert (=> b!381861 (=> (not res!217071) (not e!232109))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381861 (= res!217071 (or (= (select (arr!10672 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10672 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15435 () Bool)

(declare-fun tp!30513 () Bool)

(declare-fun e!232115 () Bool)

(assert (=> mapNonEmpty!15435 (= mapRes!15435 (and tp!30513 e!232115))))

(declare-fun mapRest!15435 () (Array (_ BitVec 32) ValueCell!4280))

(declare-fun mapValue!15435 () ValueCell!4280)

(declare-fun mapKey!15435 () (_ BitVec 32))

(assert (=> mapNonEmpty!15435 (= (arr!10673 _values!506) (store mapRest!15435 mapKey!15435 mapValue!15435))))

(declare-fun b!381862 () Bool)

(declare-fun e!232111 () Bool)

(assert (=> b!381862 (= e!232109 e!232111)))

(declare-fun res!217073 () Bool)

(assert (=> b!381862 (=> (not res!217073) (not e!232111))))

(declare-fun lt!179053 () array!22407)

(assert (=> b!381862 (= res!217073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179053 mask!970))))

(assert (=> b!381862 (= lt!179053 (array!22408 (store (arr!10672 _keys!658) i!548 k!778) (size!11024 _keys!658)))))

(declare-fun res!217069 () Bool)

(assert (=> start!37472 (=> (not res!217069) (not e!232109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37472 (= res!217069 (validMask!0 mask!970))))

(assert (=> start!37472 e!232109))

(declare-fun e!232113 () Bool)

(declare-fun array_inv!7858 (array!22409) Bool)

(assert (=> start!37472 (and (array_inv!7858 _values!506) e!232113)))

(assert (=> start!37472 tp!30512))

(assert (=> start!37472 true))

(assert (=> start!37472 tp_is_empty!9247))

(declare-fun array_inv!7859 (array!22407) Bool)

(assert (=> start!37472 (array_inv!7859 _keys!658)))

(declare-fun b!381863 () Bool)

(declare-fun res!217072 () Bool)

(assert (=> b!381863 (=> (not res!217072) (not e!232109))))

(declare-datatypes ((List!6105 0))(
  ( (Nil!6102) (Cons!6101 (h!6957 (_ BitVec 64)) (t!11255 List!6105)) )
))
(declare-fun arrayNoDuplicates!0 (array!22407 (_ BitVec 32) List!6105) Bool)

(assert (=> b!381863 (= res!217072 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6102))))

(declare-fun b!381864 () Bool)

(declare-fun res!217070 () Bool)

(assert (=> b!381864 (=> (not res!217070) (not e!232109))))

(assert (=> b!381864 (= res!217070 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11024 _keys!658))))))

(declare-fun b!381865 () Bool)

(assert (=> b!381865 (= e!232115 tp_is_empty!9247)))

(declare-fun b!381866 () Bool)

(assert (=> b!381866 (= e!232113 (and e!232114 mapRes!15435))))

(declare-fun condMapEmpty!15435 () Bool)

(declare-fun mapDefault!15435 () ValueCell!4280)

