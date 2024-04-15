; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37578 () Bool)

(assert start!37578)

(declare-fun b_free!8719 () Bool)

(declare-fun b_next!8719 () Bool)

(assert (=> start!37578 (= b_free!8719 (not b_next!8719))))

(declare-fun tp!30873 () Bool)

(declare-fun b_and!15935 () Bool)

(assert (=> start!37578 (= tp!30873 b_and!15935)))

(declare-fun b!384114 () Bool)

(declare-fun res!218933 () Bool)

(declare-fun e!233210 () Bool)

(assert (=> b!384114 (=> (not res!218933) (not e!233210))))

(declare-datatypes ((array!22623 0))(
  ( (array!22624 (arr!10780 (Array (_ BitVec 32) (_ BitVec 64))) (size!11133 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22623)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384114 (= res!218933 (or (= (select (arr!10780 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10780 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384115 () Bool)

(declare-fun e!233209 () Bool)

(declare-fun tp_is_empty!9367 () Bool)

(assert (=> b!384115 (= e!233209 tp_is_empty!9367)))

(declare-fun b!384116 () Bool)

(declare-fun e!233204 () Bool)

(assert (=> b!384116 (= e!233210 e!233204)))

(declare-fun res!218932 () Bool)

(assert (=> b!384116 (=> (not res!218932) (not e!233204))))

(declare-fun lt!180618 () array!22623)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22623 (_ BitVec 32)) Bool)

(assert (=> b!384116 (= res!218932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180618 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!384116 (= lt!180618 (array!22624 (store (arr!10780 _keys!658) i!548 k0!778) (size!11133 _keys!658)))))

(declare-fun b!384117 () Bool)

(declare-fun e!233207 () Bool)

(declare-fun mapRes!15615 () Bool)

(assert (=> b!384117 (= e!233207 (and e!233209 mapRes!15615))))

(declare-fun condMapEmpty!15615 () Bool)

(declare-datatypes ((V!13595 0))(
  ( (V!13596 (val!4728 Int)) )
))
(declare-datatypes ((ValueCell!4340 0))(
  ( (ValueCellFull!4340 (v!6919 V!13595)) (EmptyCell!4340) )
))
(declare-datatypes ((array!22625 0))(
  ( (array!22626 (arr!10781 (Array (_ BitVec 32) ValueCell!4340)) (size!11134 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22625)

(declare-fun mapDefault!15615 () ValueCell!4340)

(assert (=> b!384117 (= condMapEmpty!15615 (= (arr!10781 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4340)) mapDefault!15615)))))

(declare-fun mapIsEmpty!15615 () Bool)

(assert (=> mapIsEmpty!15615 mapRes!15615))

(declare-fun b!384119 () Bool)

(declare-fun e!233206 () Bool)

(assert (=> b!384119 (= e!233204 (not e!233206))))

(declare-fun res!218934 () Bool)

(assert (=> b!384119 (=> res!218934 e!233206)))

(declare-fun lt!180613 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384119 (= res!218934 (or (and (not lt!180613) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180613) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180613)))))

(assert (=> b!384119 (= lt!180613 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6344 0))(
  ( (tuple2!6345 (_1!3183 (_ BitVec 64)) (_2!3183 V!13595)) )
))
(declare-datatypes ((List!6168 0))(
  ( (Nil!6165) (Cons!6164 (h!7020 tuple2!6344) (t!11309 List!6168)) )
))
(declare-datatypes ((ListLongMap!5247 0))(
  ( (ListLongMap!5248 (toList!2639 List!6168)) )
))
(declare-fun lt!180615 () ListLongMap!5247)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13595)

(declare-fun minValue!472 () V!13595)

(declare-fun getCurrentListMap!2016 (array!22623 array!22625 (_ BitVec 32) (_ BitVec 32) V!13595 V!13595 (_ BitVec 32) Int) ListLongMap!5247)

(assert (=> b!384119 (= lt!180615 (getCurrentListMap!2016 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180610 () ListLongMap!5247)

(declare-fun lt!180611 () array!22625)

(assert (=> b!384119 (= lt!180610 (getCurrentListMap!2016 lt!180618 lt!180611 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180609 () ListLongMap!5247)

(declare-fun lt!180608 () ListLongMap!5247)

(assert (=> b!384119 (and (= lt!180609 lt!180608) (= lt!180608 lt!180609))))

(declare-fun lt!180612 () ListLongMap!5247)

(declare-fun lt!180614 () tuple2!6344)

(declare-fun +!996 (ListLongMap!5247 tuple2!6344) ListLongMap!5247)

(assert (=> b!384119 (= lt!180608 (+!996 lt!180612 lt!180614))))

(declare-fun v!373 () V!13595)

(assert (=> b!384119 (= lt!180614 (tuple2!6345 k0!778 v!373))))

(declare-datatypes ((Unit!11838 0))(
  ( (Unit!11839) )
))
(declare-fun lt!180616 () Unit!11838)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!209 (array!22623 array!22625 (_ BitVec 32) (_ BitVec 32) V!13595 V!13595 (_ BitVec 32) (_ BitVec 64) V!13595 (_ BitVec 32) Int) Unit!11838)

(assert (=> b!384119 (= lt!180616 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!209 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!881 (array!22623 array!22625 (_ BitVec 32) (_ BitVec 32) V!13595 V!13595 (_ BitVec 32) Int) ListLongMap!5247)

(assert (=> b!384119 (= lt!180609 (getCurrentListMapNoExtraKeys!881 lt!180618 lt!180611 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384119 (= lt!180611 (array!22626 (store (arr!10781 _values!506) i!548 (ValueCellFull!4340 v!373)) (size!11134 _values!506)))))

(assert (=> b!384119 (= lt!180612 (getCurrentListMapNoExtraKeys!881 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384120 () Bool)

(declare-fun res!218929 () Bool)

(assert (=> b!384120 (=> (not res!218929) (not e!233210))))

(assert (=> b!384120 (= res!218929 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11133 _keys!658))))))

(declare-fun mapNonEmpty!15615 () Bool)

(declare-fun tp!30872 () Bool)

(declare-fun e!233208 () Bool)

(assert (=> mapNonEmpty!15615 (= mapRes!15615 (and tp!30872 e!233208))))

(declare-fun mapValue!15615 () ValueCell!4340)

(declare-fun mapRest!15615 () (Array (_ BitVec 32) ValueCell!4340))

(declare-fun mapKey!15615 () (_ BitVec 32))

(assert (=> mapNonEmpty!15615 (= (arr!10781 _values!506) (store mapRest!15615 mapKey!15615 mapValue!15615))))

(declare-fun b!384121 () Bool)

(declare-fun res!218927 () Bool)

(assert (=> b!384121 (=> (not res!218927) (not e!233210))))

(declare-fun arrayContainsKey!0 (array!22623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384121 (= res!218927 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384122 () Bool)

(assert (=> b!384122 (= e!233208 tp_is_empty!9367)))

(declare-fun b!384123 () Bool)

(declare-fun res!218926 () Bool)

(assert (=> b!384123 (=> (not res!218926) (not e!233204))))

(declare-datatypes ((List!6169 0))(
  ( (Nil!6166) (Cons!6165 (h!7021 (_ BitVec 64)) (t!11310 List!6169)) )
))
(declare-fun arrayNoDuplicates!0 (array!22623 (_ BitVec 32) List!6169) Bool)

(assert (=> b!384123 (= res!218926 (arrayNoDuplicates!0 lt!180618 #b00000000000000000000000000000000 Nil!6166))))

(declare-fun b!384124 () Bool)

(assert (=> b!384124 (= e!233206 true)))

(declare-fun lt!180617 () ListLongMap!5247)

(assert (=> b!384124 (= lt!180617 (+!996 lt!180615 lt!180614))))

(assert (=> b!384124 (= lt!180610 lt!180609)))

(declare-fun b!384125 () Bool)

(declare-fun res!218936 () Bool)

(assert (=> b!384125 (=> (not res!218936) (not e!233210))))

(assert (=> b!384125 (= res!218936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384118 () Bool)

(declare-fun res!218928 () Bool)

(assert (=> b!384118 (=> (not res!218928) (not e!233210))))

(assert (=> b!384118 (= res!218928 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6166))))

(declare-fun res!218931 () Bool)

(assert (=> start!37578 (=> (not res!218931) (not e!233210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37578 (= res!218931 (validMask!0 mask!970))))

(assert (=> start!37578 e!233210))

(declare-fun array_inv!7934 (array!22625) Bool)

(assert (=> start!37578 (and (array_inv!7934 _values!506) e!233207)))

(assert (=> start!37578 tp!30873))

(assert (=> start!37578 true))

(assert (=> start!37578 tp_is_empty!9367))

(declare-fun array_inv!7935 (array!22623) Bool)

(assert (=> start!37578 (array_inv!7935 _keys!658)))

(declare-fun b!384126 () Bool)

(declare-fun res!218930 () Bool)

(assert (=> b!384126 (=> (not res!218930) (not e!233210))))

(assert (=> b!384126 (= res!218930 (and (= (size!11134 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11133 _keys!658) (size!11134 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384127 () Bool)

(declare-fun res!218935 () Bool)

(assert (=> b!384127 (=> (not res!218935) (not e!233210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384127 (= res!218935 (validKeyInArray!0 k0!778))))

(assert (= (and start!37578 res!218931) b!384126))

(assert (= (and b!384126 res!218930) b!384125))

(assert (= (and b!384125 res!218936) b!384118))

(assert (= (and b!384118 res!218928) b!384120))

(assert (= (and b!384120 res!218929) b!384127))

(assert (= (and b!384127 res!218935) b!384114))

(assert (= (and b!384114 res!218933) b!384121))

(assert (= (and b!384121 res!218927) b!384116))

(assert (= (and b!384116 res!218932) b!384123))

(assert (= (and b!384123 res!218926) b!384119))

(assert (= (and b!384119 (not res!218934)) b!384124))

(assert (= (and b!384117 condMapEmpty!15615) mapIsEmpty!15615))

(assert (= (and b!384117 (not condMapEmpty!15615)) mapNonEmpty!15615))

(get-info :version)

(assert (= (and mapNonEmpty!15615 ((_ is ValueCellFull!4340) mapValue!15615)) b!384122))

(assert (= (and b!384117 ((_ is ValueCellFull!4340) mapDefault!15615)) b!384115))

(assert (= start!37578 b!384117))

(declare-fun m!380351 () Bool)

(assert (=> b!384124 m!380351))

(declare-fun m!380353 () Bool)

(assert (=> start!37578 m!380353))

(declare-fun m!380355 () Bool)

(assert (=> start!37578 m!380355))

(declare-fun m!380357 () Bool)

(assert (=> start!37578 m!380357))

(declare-fun m!380359 () Bool)

(assert (=> b!384123 m!380359))

(declare-fun m!380361 () Bool)

(assert (=> b!384119 m!380361))

(declare-fun m!380363 () Bool)

(assert (=> b!384119 m!380363))

(declare-fun m!380365 () Bool)

(assert (=> b!384119 m!380365))

(declare-fun m!380367 () Bool)

(assert (=> b!384119 m!380367))

(declare-fun m!380369 () Bool)

(assert (=> b!384119 m!380369))

(declare-fun m!380371 () Bool)

(assert (=> b!384119 m!380371))

(declare-fun m!380373 () Bool)

(assert (=> b!384119 m!380373))

(declare-fun m!380375 () Bool)

(assert (=> b!384118 m!380375))

(declare-fun m!380377 () Bool)

(assert (=> b!384114 m!380377))

(declare-fun m!380379 () Bool)

(assert (=> b!384121 m!380379))

(declare-fun m!380381 () Bool)

(assert (=> b!384125 m!380381))

(declare-fun m!380383 () Bool)

(assert (=> b!384116 m!380383))

(declare-fun m!380385 () Bool)

(assert (=> b!384116 m!380385))

(declare-fun m!380387 () Bool)

(assert (=> mapNonEmpty!15615 m!380387))

(declare-fun m!380389 () Bool)

(assert (=> b!384127 m!380389))

(check-sat (not b!384119) (not start!37578) (not mapNonEmpty!15615) (not b!384124) (not b!384116) (not b!384121) tp_is_empty!9367 (not b!384123) (not b!384125) (not b!384127) (not b!384118) (not b_next!8719) b_and!15935)
(check-sat b_and!15935 (not b_next!8719))
