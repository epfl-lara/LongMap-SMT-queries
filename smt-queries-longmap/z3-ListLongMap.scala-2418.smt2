; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38222 () Bool)

(assert start!38222)

(declare-fun b_free!9073 () Bool)

(declare-fun b_next!9073 () Bool)

(assert (=> start!38222 (= b_free!9073 (not b_next!9073))))

(declare-fun tp!32007 () Bool)

(declare-fun b_and!16473 () Bool)

(assert (=> start!38222 (= tp!32007 b_and!16473)))

(declare-fun b!394449 () Bool)

(declare-fun e!238762 () Bool)

(declare-fun e!238761 () Bool)

(assert (=> b!394449 (= e!238762 e!238761)))

(declare-fun res!226125 () Bool)

(assert (=> b!394449 (=> (not res!226125) (not e!238761))))

(declare-datatypes ((array!23388 0))(
  ( (array!23389 (arr!11150 (Array (_ BitVec 32) (_ BitVec 64))) (size!11502 (_ BitVec 32))) )
))
(declare-fun lt!186976 () array!23388)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23388 (_ BitVec 32)) Bool)

(assert (=> b!394449 (= res!226125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186976 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23388)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!394449 (= lt!186976 (array!23389 (store (arr!11150 _keys!658) i!548 k0!778) (size!11502 _keys!658)))))

(declare-fun b!394450 () Bool)

(declare-fun res!226122 () Bool)

(assert (=> b!394450 (=> (not res!226122) (not e!238762))))

(assert (=> b!394450 (= res!226122 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11502 _keys!658))))))

(declare-fun res!226123 () Bool)

(assert (=> start!38222 (=> (not res!226123) (not e!238762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38222 (= res!226123 (validMask!0 mask!970))))

(assert (=> start!38222 e!238762))

(declare-datatypes ((V!14099 0))(
  ( (V!14100 (val!4917 Int)) )
))
(declare-datatypes ((ValueCell!4529 0))(
  ( (ValueCellFull!4529 (v!7163 V!14099)) (EmptyCell!4529) )
))
(declare-datatypes ((array!23390 0))(
  ( (array!23391 (arr!11151 (Array (_ BitVec 32) ValueCell!4529)) (size!11503 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23390)

(declare-fun e!238767 () Bool)

(declare-fun array_inv!8244 (array!23390) Bool)

(assert (=> start!38222 (and (array_inv!8244 _values!506) e!238767)))

(assert (=> start!38222 tp!32007))

(assert (=> start!38222 true))

(declare-fun tp_is_empty!9745 () Bool)

(assert (=> start!38222 tp_is_empty!9745))

(declare-fun array_inv!8245 (array!23388) Bool)

(assert (=> start!38222 (array_inv!8245 _keys!658)))

(declare-fun b!394451 () Bool)

(declare-fun res!226126 () Bool)

(assert (=> b!394451 (=> (not res!226126) (not e!238762))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394451 (= res!226126 (and (= (size!11503 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11502 _keys!658) (size!11503 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!394452 () Bool)

(declare-fun res!226124 () Bool)

(assert (=> b!394452 (=> (not res!226124) (not e!238762))))

(declare-fun arrayContainsKey!0 (array!23388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394452 (= res!226124 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!394453 () Bool)

(declare-fun e!238765 () Bool)

(declare-fun mapRes!16218 () Bool)

(assert (=> b!394453 (= e!238767 (and e!238765 mapRes!16218))))

(declare-fun condMapEmpty!16218 () Bool)

(declare-fun mapDefault!16218 () ValueCell!4529)

(assert (=> b!394453 (= condMapEmpty!16218 (= (arr!11151 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4529)) mapDefault!16218)))))

(declare-fun b!394454 () Bool)

(declare-fun e!238766 () Bool)

(assert (=> b!394454 (= e!238766 tp_is_empty!9745)))

(declare-fun b!394455 () Bool)

(assert (=> b!394455 (= e!238765 tp_is_empty!9745)))

(declare-fun b!394456 () Bool)

(declare-fun res!226120 () Bool)

(assert (=> b!394456 (=> (not res!226120) (not e!238762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394456 (= res!226120 (validKeyInArray!0 k0!778))))

(declare-fun b!394457 () Bool)

(declare-fun res!226127 () Bool)

(assert (=> b!394457 (=> (not res!226127) (not e!238762))))

(assert (=> b!394457 (= res!226127 (or (= (select (arr!11150 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11150 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394458 () Bool)

(declare-fun e!238764 () Bool)

(assert (=> b!394458 (= e!238764 true)))

(declare-datatypes ((tuple2!6506 0))(
  ( (tuple2!6507 (_1!3264 (_ BitVec 64)) (_2!3264 V!14099)) )
))
(declare-datatypes ((List!6355 0))(
  ( (Nil!6352) (Cons!6351 (h!7207 tuple2!6506) (t!11521 List!6355)) )
))
(declare-datatypes ((ListLongMap!5421 0))(
  ( (ListLongMap!5422 (toList!2726 List!6355)) )
))
(declare-fun lt!186970 () ListLongMap!5421)

(declare-fun lt!186971 () ListLongMap!5421)

(declare-fun lt!186972 () tuple2!6506)

(declare-fun +!1080 (ListLongMap!5421 tuple2!6506) ListLongMap!5421)

(assert (=> b!394458 (= lt!186970 (+!1080 lt!186971 lt!186972))))

(declare-fun lt!186975 () ListLongMap!5421)

(declare-fun lt!186973 () ListLongMap!5421)

(assert (=> b!394458 (= lt!186975 lt!186973)))

(declare-fun b!394459 () Bool)

(declare-fun res!226130 () Bool)

(assert (=> b!394459 (=> (not res!226130) (not e!238761))))

(declare-datatypes ((List!6356 0))(
  ( (Nil!6353) (Cons!6352 (h!7208 (_ BitVec 64)) (t!11522 List!6356)) )
))
(declare-fun arrayNoDuplicates!0 (array!23388 (_ BitVec 32) List!6356) Bool)

(assert (=> b!394459 (= res!226130 (arrayNoDuplicates!0 lt!186976 #b00000000000000000000000000000000 Nil!6353))))

(declare-fun mapNonEmpty!16218 () Bool)

(declare-fun tp!32006 () Bool)

(assert (=> mapNonEmpty!16218 (= mapRes!16218 (and tp!32006 e!238766))))

(declare-fun mapRest!16218 () (Array (_ BitVec 32) ValueCell!4529))

(declare-fun mapKey!16218 () (_ BitVec 32))

(declare-fun mapValue!16218 () ValueCell!4529)

(assert (=> mapNonEmpty!16218 (= (arr!11151 _values!506) (store mapRest!16218 mapKey!16218 mapValue!16218))))

(declare-fun b!394460 () Bool)

(declare-fun res!226121 () Bool)

(assert (=> b!394460 (=> (not res!226121) (not e!238762))))

(assert (=> b!394460 (= res!226121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!16218 () Bool)

(assert (=> mapIsEmpty!16218 mapRes!16218))

(declare-fun b!394461 () Bool)

(declare-fun res!226128 () Bool)

(assert (=> b!394461 (=> (not res!226128) (not e!238762))))

(assert (=> b!394461 (= res!226128 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6353))))

(declare-fun b!394462 () Bool)

(assert (=> b!394462 (= e!238761 (not e!238764))))

(declare-fun res!226129 () Bool)

(assert (=> b!394462 (=> res!226129 e!238764)))

(declare-fun lt!186974 () Bool)

(assert (=> b!394462 (= res!226129 (or (and (not lt!186974) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186974) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186974)))))

(assert (=> b!394462 (= lt!186974 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14099)

(declare-fun minValue!472 () V!14099)

(declare-fun getCurrentListMap!2098 (array!23388 array!23390 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) Int) ListLongMap!5421)

(assert (=> b!394462 (= lt!186971 (getCurrentListMap!2098 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186979 () array!23390)

(assert (=> b!394462 (= lt!186975 (getCurrentListMap!2098 lt!186976 lt!186979 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186969 () ListLongMap!5421)

(assert (=> b!394462 (and (= lt!186973 lt!186969) (= lt!186969 lt!186973))))

(declare-fun lt!186977 () ListLongMap!5421)

(assert (=> b!394462 (= lt!186969 (+!1080 lt!186977 lt!186972))))

(declare-fun v!373 () V!14099)

(assert (=> b!394462 (= lt!186972 (tuple2!6507 k0!778 v!373))))

(declare-datatypes ((Unit!12029 0))(
  ( (Unit!12030) )
))
(declare-fun lt!186978 () Unit!12029)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!289 (array!23388 array!23390 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) (_ BitVec 64) V!14099 (_ BitVec 32) Int) Unit!12029)

(assert (=> b!394462 (= lt!186978 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!289 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!987 (array!23388 array!23390 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) Int) ListLongMap!5421)

(assert (=> b!394462 (= lt!186973 (getCurrentListMapNoExtraKeys!987 lt!186976 lt!186979 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394462 (= lt!186979 (array!23391 (store (arr!11151 _values!506) i!548 (ValueCellFull!4529 v!373)) (size!11503 _values!506)))))

(assert (=> b!394462 (= lt!186977 (getCurrentListMapNoExtraKeys!987 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!38222 res!226123) b!394451))

(assert (= (and b!394451 res!226126) b!394460))

(assert (= (and b!394460 res!226121) b!394461))

(assert (= (and b!394461 res!226128) b!394450))

(assert (= (and b!394450 res!226122) b!394456))

(assert (= (and b!394456 res!226120) b!394457))

(assert (= (and b!394457 res!226127) b!394452))

(assert (= (and b!394452 res!226124) b!394449))

(assert (= (and b!394449 res!226125) b!394459))

(assert (= (and b!394459 res!226130) b!394462))

(assert (= (and b!394462 (not res!226129)) b!394458))

(assert (= (and b!394453 condMapEmpty!16218) mapIsEmpty!16218))

(assert (= (and b!394453 (not condMapEmpty!16218)) mapNonEmpty!16218))

(get-info :version)

(assert (= (and mapNonEmpty!16218 ((_ is ValueCellFull!4529) mapValue!16218)) b!394454))

(assert (= (and b!394453 ((_ is ValueCellFull!4529) mapDefault!16218)) b!394455))

(assert (= start!38222 b!394453))

(declare-fun m!391149 () Bool)

(assert (=> b!394459 m!391149))

(declare-fun m!391151 () Bool)

(assert (=> b!394452 m!391151))

(declare-fun m!391153 () Bool)

(assert (=> b!394460 m!391153))

(declare-fun m!391155 () Bool)

(assert (=> b!394461 m!391155))

(declare-fun m!391157 () Bool)

(assert (=> b!394449 m!391157))

(declare-fun m!391159 () Bool)

(assert (=> b!394449 m!391159))

(declare-fun m!391161 () Bool)

(assert (=> b!394458 m!391161))

(declare-fun m!391163 () Bool)

(assert (=> mapNonEmpty!16218 m!391163))

(declare-fun m!391165 () Bool)

(assert (=> b!394457 m!391165))

(declare-fun m!391167 () Bool)

(assert (=> b!394456 m!391167))

(declare-fun m!391169 () Bool)

(assert (=> b!394462 m!391169))

(declare-fun m!391171 () Bool)

(assert (=> b!394462 m!391171))

(declare-fun m!391173 () Bool)

(assert (=> b!394462 m!391173))

(declare-fun m!391175 () Bool)

(assert (=> b!394462 m!391175))

(declare-fun m!391177 () Bool)

(assert (=> b!394462 m!391177))

(declare-fun m!391179 () Bool)

(assert (=> b!394462 m!391179))

(declare-fun m!391181 () Bool)

(assert (=> b!394462 m!391181))

(declare-fun m!391183 () Bool)

(assert (=> start!38222 m!391183))

(declare-fun m!391185 () Bool)

(assert (=> start!38222 m!391185))

(declare-fun m!391187 () Bool)

(assert (=> start!38222 m!391187))

(check-sat (not b!394459) (not b!394458) (not b_next!9073) (not b!394461) (not b!394449) (not start!38222) tp_is_empty!9745 (not b!394456) (not b!394460) (not b!394452) (not mapNonEmpty!16218) (not b!394462) b_and!16473)
(check-sat b_and!16473 (not b_next!9073))
