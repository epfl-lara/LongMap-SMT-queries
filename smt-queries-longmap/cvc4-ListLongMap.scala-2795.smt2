; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40662 () Bool)

(assert start!40662)

(declare-fun b_free!10673 () Bool)

(declare-fun b_next!10673 () Bool)

(assert (=> start!40662 (= b_free!10673 (not b_next!10673))))

(declare-fun tp!37839 () Bool)

(declare-fun b_and!18681 () Bool)

(assert (=> start!40662 (= tp!37839 b_and!18681)))

(declare-fun b!449312 () Bool)

(declare-fun res!267235 () Bool)

(declare-fun e!263480 () Bool)

(assert (=> b!449312 (=> (not res!267235) (not e!263480))))

(declare-datatypes ((array!27829 0))(
  ( (array!27830 (arr!13360 (Array (_ BitVec 32) (_ BitVec 64))) (size!13712 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27829)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449312 (= res!267235 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!449313 () Bool)

(declare-fun res!267237 () Bool)

(assert (=> b!449313 (=> (not res!267237) (not e!263480))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449313 (= res!267237 (or (= (select (arr!13360 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13360 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449314 () Bool)

(declare-fun res!267240 () Bool)

(assert (=> b!449314 (=> (not res!267240) (not e!263480))))

(declare-datatypes ((List!8009 0))(
  ( (Nil!8006) (Cons!8005 (h!8861 (_ BitVec 64)) (t!13771 List!8009)) )
))
(declare-fun arrayNoDuplicates!0 (array!27829 (_ BitVec 32) List!8009) Bool)

(assert (=> b!449314 (= res!267240 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8006))))

(declare-fun b!449315 () Bool)

(declare-fun e!263476 () Bool)

(assert (=> b!449315 (= e!263480 e!263476)))

(declare-fun res!267243 () Bool)

(assert (=> b!449315 (=> (not res!267243) (not e!263476))))

(declare-fun lt!204341 () array!27829)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27829 (_ BitVec 32)) Bool)

(assert (=> b!449315 (= res!267243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204341 mask!1025))))

(assert (=> b!449315 (= lt!204341 (array!27830 (store (arr!13360 _keys!709) i!563 k!794) (size!13712 _keys!709)))))

(declare-fun b!449316 () Bool)

(declare-fun res!267234 () Bool)

(assert (=> b!449316 (=> (not res!267234) (not e!263480))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17119 0))(
  ( (V!17120 (val!6050 Int)) )
))
(declare-datatypes ((ValueCell!5662 0))(
  ( (ValueCellFull!5662 (v!8305 V!17119)) (EmptyCell!5662) )
))
(declare-datatypes ((array!27831 0))(
  ( (array!27832 (arr!13361 (Array (_ BitVec 32) ValueCell!5662)) (size!13713 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27831)

(assert (=> b!449316 (= res!267234 (and (= (size!13713 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13712 _keys!709) (size!13713 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19650 () Bool)

(declare-fun mapRes!19650 () Bool)

(assert (=> mapIsEmpty!19650 mapRes!19650))

(declare-fun b!449317 () Bool)

(declare-fun e!263475 () Bool)

(declare-fun tp_is_empty!12011 () Bool)

(assert (=> b!449317 (= e!263475 tp_is_empty!12011)))

(declare-fun b!449318 () Bool)

(declare-fun res!267238 () Bool)

(assert (=> b!449318 (=> (not res!267238) (not e!263476))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!449318 (= res!267238 (bvsle from!863 i!563))))

(declare-fun b!449319 () Bool)

(declare-fun res!267236 () Bool)

(assert (=> b!449319 (=> (not res!267236) (not e!263480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449319 (= res!267236 (validMask!0 mask!1025))))

(declare-fun b!449320 () Bool)

(assert (=> b!449320 (= e!263476 false)))

(declare-fun minValue!515 () V!17119)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17119)

(declare-datatypes ((tuple2!7944 0))(
  ( (tuple2!7945 (_1!3983 (_ BitVec 64)) (_2!3983 V!17119)) )
))
(declare-datatypes ((List!8010 0))(
  ( (Nil!8007) (Cons!8006 (h!8862 tuple2!7944) (t!13772 List!8010)) )
))
(declare-datatypes ((ListLongMap!6857 0))(
  ( (ListLongMap!6858 (toList!3444 List!8010)) )
))
(declare-fun lt!204342 () ListLongMap!6857)

(declare-fun v!412 () V!17119)

(declare-fun getCurrentListMapNoExtraKeys!1630 (array!27829 array!27831 (_ BitVec 32) (_ BitVec 32) V!17119 V!17119 (_ BitVec 32) Int) ListLongMap!6857)

(assert (=> b!449320 (= lt!204342 (getCurrentListMapNoExtraKeys!1630 lt!204341 (array!27832 (store (arr!13361 _values!549) i!563 (ValueCellFull!5662 v!412)) (size!13713 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204340 () ListLongMap!6857)

(assert (=> b!449320 (= lt!204340 (getCurrentListMapNoExtraKeys!1630 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19650 () Bool)

(declare-fun tp!37838 () Bool)

(assert (=> mapNonEmpty!19650 (= mapRes!19650 (and tp!37838 e!263475))))

(declare-fun mapValue!19650 () ValueCell!5662)

(declare-fun mapRest!19650 () (Array (_ BitVec 32) ValueCell!5662))

(declare-fun mapKey!19650 () (_ BitVec 32))

(assert (=> mapNonEmpty!19650 (= (arr!13361 _values!549) (store mapRest!19650 mapKey!19650 mapValue!19650))))

(declare-fun b!449321 () Bool)

(declare-fun e!263477 () Bool)

(assert (=> b!449321 (= e!263477 tp_is_empty!12011)))

(declare-fun b!449322 () Bool)

(declare-fun res!267232 () Bool)

(assert (=> b!449322 (=> (not res!267232) (not e!263476))))

(assert (=> b!449322 (= res!267232 (arrayNoDuplicates!0 lt!204341 #b00000000000000000000000000000000 Nil!8006))))

(declare-fun b!449324 () Bool)

(declare-fun res!267242 () Bool)

(assert (=> b!449324 (=> (not res!267242) (not e!263480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449324 (= res!267242 (validKeyInArray!0 k!794))))

(declare-fun b!449325 () Bool)

(declare-fun res!267233 () Bool)

(assert (=> b!449325 (=> (not res!267233) (not e!263480))))

(assert (=> b!449325 (= res!267233 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13712 _keys!709))))))

(declare-fun b!449326 () Bool)

(declare-fun e!263478 () Bool)

(assert (=> b!449326 (= e!263478 (and e!263477 mapRes!19650))))

(declare-fun condMapEmpty!19650 () Bool)

(declare-fun mapDefault!19650 () ValueCell!5662)

