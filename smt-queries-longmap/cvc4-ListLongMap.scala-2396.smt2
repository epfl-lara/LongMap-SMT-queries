; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37932 () Bool)

(assert start!37932)

(declare-fun b_free!8945 () Bool)

(declare-fun b_next!8945 () Bool)

(assert (=> start!37932 (= b_free!8945 (not b_next!8945))))

(declare-fun tp!31599 () Bool)

(declare-fun b_and!16235 () Bool)

(assert (=> start!37932 (= tp!31599 b_and!16235)))

(declare-fun b!390072 () Bool)

(declare-fun e!236310 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((V!13927 0))(
  ( (V!13928 (val!4853 Int)) )
))
(declare-datatypes ((ValueCell!4465 0))(
  ( (ValueCellFull!4465 (v!7066 V!13927)) (EmptyCell!4465) )
))
(declare-datatypes ((array!23131 0))(
  ( (array!23132 (arr!11030 (Array (_ BitVec 32) ValueCell!4465)) (size!11382 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23131)

(assert (=> b!390072 (= e!236310 (bvslt i!548 (size!11382 _values!506)))))

(declare-datatypes ((tuple2!6528 0))(
  ( (tuple2!6529 (_1!3275 (_ BitVec 64)) (_2!3275 V!13927)) )
))
(declare-datatypes ((List!6382 0))(
  ( (Nil!6379) (Cons!6378 (h!7234 tuple2!6528) (t!11540 List!6382)) )
))
(declare-datatypes ((ListLongMap!5441 0))(
  ( (ListLongMap!5442 (toList!2736 List!6382)) )
))
(declare-fun lt!183705 () ListLongMap!5441)

(declare-fun lt!183713 () tuple2!6528)

(declare-fun lt!183719 () ListLongMap!5441)

(declare-fun lt!183711 () tuple2!6528)

(declare-fun +!1031 (ListLongMap!5441 tuple2!6528) ListLongMap!5441)

(assert (=> b!390072 (= (+!1031 lt!183719 lt!183711) (+!1031 lt!183705 lt!183713))))

(declare-fun v!373 () V!13927)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!13927)

(declare-fun lt!183712 () ListLongMap!5441)

(declare-datatypes ((Unit!11944 0))(
  ( (Unit!11945) )
))
(declare-fun lt!183707 () Unit!11944)

(declare-fun addCommutativeForDiffKeys!334 (ListLongMap!5441 (_ BitVec 64) V!13927 (_ BitVec 64) V!13927) Unit!11944)

(assert (=> b!390072 (= lt!183707 (addCommutativeForDiffKeys!334 lt!183712 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!390073 () Bool)

(declare-fun res!223176 () Bool)

(declare-fun e!236309 () Bool)

(assert (=> b!390073 (=> (not res!223176) (not e!236309))))

(declare-datatypes ((array!23133 0))(
  ( (array!23134 (arr!11031 (Array (_ BitVec 32) (_ BitVec 64))) (size!11383 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23133)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23133 (_ BitVec 32)) Bool)

(assert (=> b!390073 (= res!223176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390074 () Bool)

(declare-fun res!223180 () Bool)

(assert (=> b!390074 (=> (not res!223180) (not e!236309))))

(assert (=> b!390074 (= res!223180 (or (= (select (arr!11031 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11031 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390075 () Bool)

(declare-fun res!223177 () Bool)

(assert (=> b!390075 (=> (not res!223177) (not e!236309))))

(assert (=> b!390075 (= res!223177 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11383 _keys!658))))))

(declare-fun mapIsEmpty!16002 () Bool)

(declare-fun mapRes!16002 () Bool)

(assert (=> mapIsEmpty!16002 mapRes!16002))

(declare-fun b!390076 () Bool)

(declare-fun res!223179 () Bool)

(assert (=> b!390076 (=> (not res!223179) (not e!236309))))

(declare-fun arrayContainsKey!0 (array!23133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390076 (= res!223179 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!390077 () Bool)

(declare-fun res!223171 () Bool)

(assert (=> b!390077 (=> (not res!223171) (not e!236309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390077 (= res!223171 (validKeyInArray!0 k!778))))

(declare-fun b!390078 () Bool)

(declare-fun res!223175 () Bool)

(assert (=> b!390078 (=> (not res!223175) (not e!236309))))

(declare-datatypes ((List!6383 0))(
  ( (Nil!6380) (Cons!6379 (h!7235 (_ BitVec 64)) (t!11541 List!6383)) )
))
(declare-fun arrayNoDuplicates!0 (array!23133 (_ BitVec 32) List!6383) Bool)

(assert (=> b!390078 (= res!223175 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6380))))

(declare-fun b!390079 () Bool)

(declare-fun e!236303 () Bool)

(declare-fun tp_is_empty!9617 () Bool)

(assert (=> b!390079 (= e!236303 tp_is_empty!9617)))

(declare-fun b!390081 () Bool)

(declare-fun res!223173 () Bool)

(assert (=> b!390081 (=> (not res!223173) (not e!236309))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390081 (= res!223173 (and (= (size!11382 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11383 _keys!658) (size!11382 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390082 () Bool)

(declare-fun res!223169 () Bool)

(declare-fun e!236307 () Bool)

(assert (=> b!390082 (=> (not res!223169) (not e!236307))))

(declare-fun lt!183704 () array!23133)

(assert (=> b!390082 (= res!223169 (arrayNoDuplicates!0 lt!183704 #b00000000000000000000000000000000 Nil!6380))))

(declare-fun b!390083 () Bool)

(declare-fun e!236304 () Bool)

(assert (=> b!390083 (= e!236304 e!236310)))

(declare-fun res!223178 () Bool)

(assert (=> b!390083 (=> res!223178 e!236310)))

(assert (=> b!390083 (= res!223178 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183714 () ListLongMap!5441)

(assert (=> b!390083 (= lt!183714 lt!183719)))

(assert (=> b!390083 (= lt!183719 (+!1031 lt!183712 lt!183713))))

(declare-fun zeroValue!472 () V!13927)

(declare-fun lt!183708 () Unit!11944)

(declare-fun lt!183720 () ListLongMap!5441)

(assert (=> b!390083 (= lt!183708 (addCommutativeForDiffKeys!334 lt!183720 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183716 () ListLongMap!5441)

(assert (=> b!390083 (= lt!183716 (+!1031 lt!183714 lt!183711))))

(declare-fun lt!183706 () ListLongMap!5441)

(declare-fun lt!183718 () tuple2!6528)

(assert (=> b!390083 (= lt!183714 (+!1031 lt!183706 lt!183718))))

(declare-fun lt!183717 () ListLongMap!5441)

(assert (=> b!390083 (= lt!183717 lt!183705)))

(assert (=> b!390083 (= lt!183705 (+!1031 lt!183712 lt!183711))))

(assert (=> b!390083 (= lt!183712 (+!1031 lt!183720 lt!183718))))

(declare-fun lt!183715 () ListLongMap!5441)

(assert (=> b!390083 (= lt!183716 (+!1031 (+!1031 lt!183715 lt!183718) lt!183711))))

(assert (=> b!390083 (= lt!183711 (tuple2!6529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!390083 (= lt!183718 (tuple2!6529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!16002 () Bool)

(declare-fun tp!31598 () Bool)

(declare-fun e!236305 () Bool)

(assert (=> mapNonEmpty!16002 (= mapRes!16002 (and tp!31598 e!236305))))

(declare-fun mapKey!16002 () (_ BitVec 32))

(declare-fun mapValue!16002 () ValueCell!4465)

(declare-fun mapRest!16002 () (Array (_ BitVec 32) ValueCell!4465))

(assert (=> mapNonEmpty!16002 (= (arr!11030 _values!506) (store mapRest!16002 mapKey!16002 mapValue!16002))))

(declare-fun b!390084 () Bool)

(assert (=> b!390084 (= e!236309 e!236307)))

(declare-fun res!223174 () Bool)

(assert (=> b!390084 (=> (not res!223174) (not e!236307))))

(assert (=> b!390084 (= res!223174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183704 mask!970))))

(assert (=> b!390084 (= lt!183704 (array!23134 (store (arr!11031 _keys!658) i!548 k!778) (size!11383 _keys!658)))))

(declare-fun b!390085 () Bool)

(assert (=> b!390085 (= e!236305 tp_is_empty!9617)))

(declare-fun b!390086 () Bool)

(declare-fun e!236306 () Bool)

(assert (=> b!390086 (= e!236306 (and e!236303 mapRes!16002))))

(declare-fun condMapEmpty!16002 () Bool)

(declare-fun mapDefault!16002 () ValueCell!4465)

