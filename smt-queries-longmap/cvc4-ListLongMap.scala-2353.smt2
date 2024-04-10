; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37584 () Bool)

(assert start!37584)

(declare-fun b_free!8711 () Bool)

(declare-fun b_next!8711 () Bool)

(assert (=> start!37584 (= b_free!8711 (not b_next!8711))))

(declare-fun tp!30848 () Bool)

(declare-fun b_and!15953 () Bool)

(assert (=> start!37584 (= tp!30848 b_and!15953)))

(declare-fun b!384216 () Bool)

(declare-fun res!218930 () Bool)

(declare-fun e!233300 () Bool)

(assert (=> b!384216 (=> (not res!218930) (not e!233300))))

(declare-datatypes ((array!22623 0))(
  ( (array!22624 (arr!10780 (Array (_ BitVec 32) (_ BitVec 64))) (size!11132 (_ BitVec 32))) )
))
(declare-fun lt!180720 () array!22623)

(declare-datatypes ((List!6194 0))(
  ( (Nil!6191) (Cons!6190 (h!7046 (_ BitVec 64)) (t!11344 List!6194)) )
))
(declare-fun arrayNoDuplicates!0 (array!22623 (_ BitVec 32) List!6194) Bool)

(assert (=> b!384216 (= res!218930 (arrayNoDuplicates!0 lt!180720 #b00000000000000000000000000000000 Nil!6191))))

(declare-fun res!218933 () Bool)

(declare-fun e!233294 () Bool)

(assert (=> start!37584 (=> (not res!218933) (not e!233294))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37584 (= res!218933 (validMask!0 mask!970))))

(assert (=> start!37584 e!233294))

(declare-datatypes ((V!13583 0))(
  ( (V!13584 (val!4724 Int)) )
))
(declare-datatypes ((ValueCell!4336 0))(
  ( (ValueCellFull!4336 (v!6921 V!13583)) (EmptyCell!4336) )
))
(declare-datatypes ((array!22625 0))(
  ( (array!22626 (arr!10781 (Array (_ BitVec 32) ValueCell!4336)) (size!11133 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22625)

(declare-fun e!233299 () Bool)

(declare-fun array_inv!7936 (array!22625) Bool)

(assert (=> start!37584 (and (array_inv!7936 _values!506) e!233299)))

(assert (=> start!37584 tp!30848))

(assert (=> start!37584 true))

(declare-fun tp_is_empty!9359 () Bool)

(assert (=> start!37584 tp_is_empty!9359))

(declare-fun _keys!658 () array!22623)

(declare-fun array_inv!7937 (array!22623) Bool)

(assert (=> start!37584 (array_inv!7937 _keys!658)))

(declare-fun b!384217 () Bool)

(assert (=> b!384217 (= e!233294 e!233300)))

(declare-fun res!218929 () Bool)

(assert (=> b!384217 (=> (not res!218929) (not e!233300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22623 (_ BitVec 32)) Bool)

(assert (=> b!384217 (= res!218929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180720 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384217 (= lt!180720 (array!22624 (store (arr!10780 _keys!658) i!548 k!778) (size!11132 _keys!658)))))

(declare-fun b!384218 () Bool)

(declare-fun e!233293 () Bool)

(assert (=> b!384218 (= e!233293 tp_is_empty!9359)))

(declare-fun b!384219 () Bool)

(declare-fun e!233298 () Bool)

(assert (=> b!384219 (= e!233298 (bvsle #b00000000000000000000000000000000 (size!11132 _keys!658)))))

(declare-fun b!384220 () Bool)

(declare-fun e!233297 () Bool)

(assert (=> b!384220 (= e!233297 tp_is_empty!9359)))

(declare-fun mapIsEmpty!15603 () Bool)

(declare-fun mapRes!15603 () Bool)

(assert (=> mapIsEmpty!15603 mapRes!15603))

(declare-fun b!384221 () Bool)

(declare-fun e!233296 () Bool)

(assert (=> b!384221 (= e!233300 (not e!233296))))

(declare-fun res!218932 () Bool)

(assert (=> b!384221 (=> res!218932 e!233296)))

(declare-fun lt!180717 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384221 (= res!218932 (or (and (not lt!180717) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180717) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180717)))))

(assert (=> b!384221 (= lt!180717 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6358 0))(
  ( (tuple2!6359 (_1!3190 (_ BitVec 64)) (_2!3190 V!13583)) )
))
(declare-datatypes ((List!6195 0))(
  ( (Nil!6192) (Cons!6191 (h!7047 tuple2!6358) (t!11345 List!6195)) )
))
(declare-datatypes ((ListLongMap!5271 0))(
  ( (ListLongMap!5272 (toList!2651 List!6195)) )
))
(declare-fun lt!180716 () ListLongMap!5271)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13583)

(declare-fun minValue!472 () V!13583)

(declare-fun getCurrentListMap!2052 (array!22623 array!22625 (_ BitVec 32) (_ BitVec 32) V!13583 V!13583 (_ BitVec 32) Int) ListLongMap!5271)

(assert (=> b!384221 (= lt!180716 (getCurrentListMap!2052 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180713 () array!22625)

(declare-fun lt!180714 () ListLongMap!5271)

(assert (=> b!384221 (= lt!180714 (getCurrentListMap!2052 lt!180720 lt!180713 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180711 () ListLongMap!5271)

(declare-fun lt!180719 () ListLongMap!5271)

(assert (=> b!384221 (and (= lt!180711 lt!180719) (= lt!180719 lt!180711))))

(declare-fun lt!180718 () ListLongMap!5271)

(declare-fun lt!180712 () tuple2!6358)

(declare-fun +!986 (ListLongMap!5271 tuple2!6358) ListLongMap!5271)

(assert (=> b!384221 (= lt!180719 (+!986 lt!180718 lt!180712))))

(declare-fun v!373 () V!13583)

(assert (=> b!384221 (= lt!180712 (tuple2!6359 k!778 v!373))))

(declare-datatypes ((Unit!11858 0))(
  ( (Unit!11859) )
))
(declare-fun lt!180715 () Unit!11858)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!210 (array!22623 array!22625 (_ BitVec 32) (_ BitVec 32) V!13583 V!13583 (_ BitVec 32) (_ BitVec 64) V!13583 (_ BitVec 32) Int) Unit!11858)

(assert (=> b!384221 (= lt!180715 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!210 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!886 (array!22623 array!22625 (_ BitVec 32) (_ BitVec 32) V!13583 V!13583 (_ BitVec 32) Int) ListLongMap!5271)

(assert (=> b!384221 (= lt!180711 (getCurrentListMapNoExtraKeys!886 lt!180720 lt!180713 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384221 (= lt!180713 (array!22626 (store (arr!10781 _values!506) i!548 (ValueCellFull!4336 v!373)) (size!11133 _values!506)))))

(assert (=> b!384221 (= lt!180718 (getCurrentListMapNoExtraKeys!886 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384222 () Bool)

(declare-fun res!218931 () Bool)

(assert (=> b!384222 (=> (not res!218931) (not e!233294))))

(assert (=> b!384222 (= res!218931 (and (= (size!11133 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11132 _keys!658) (size!11133 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384223 () Bool)

(declare-fun res!218927 () Bool)

(assert (=> b!384223 (=> (not res!218927) (not e!233294))))

(assert (=> b!384223 (= res!218927 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11132 _keys!658))))))

(declare-fun b!384224 () Bool)

(declare-fun res!218926 () Bool)

(assert (=> b!384224 (=> (not res!218926) (not e!233294))))

(assert (=> b!384224 (= res!218926 (or (= (select (arr!10780 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10780 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384225 () Bool)

(assert (=> b!384225 (= e!233296 e!233298)))

(declare-fun res!218924 () Bool)

(assert (=> b!384225 (=> res!218924 e!233298)))

(assert (=> b!384225 (= res!218924 (not (= (+!986 lt!180716 lt!180712) lt!180714)))))

(assert (=> b!384225 (= lt!180714 lt!180711)))

(declare-fun b!384226 () Bool)

(declare-fun res!218925 () Bool)

(assert (=> b!384226 (=> (not res!218925) (not e!233294))))

(declare-fun arrayContainsKey!0 (array!22623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384226 (= res!218925 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!384227 () Bool)

(declare-fun res!218928 () Bool)

(assert (=> b!384227 (=> (not res!218928) (not e!233294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384227 (= res!218928 (validKeyInArray!0 k!778))))

(declare-fun b!384228 () Bool)

(assert (=> b!384228 (= e!233299 (and e!233297 mapRes!15603))))

(declare-fun condMapEmpty!15603 () Bool)

(declare-fun mapDefault!15603 () ValueCell!4336)

