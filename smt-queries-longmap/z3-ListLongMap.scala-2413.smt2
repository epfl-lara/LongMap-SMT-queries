; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38186 () Bool)

(assert start!38186)

(declare-fun b_free!9045 () Bool)

(declare-fun b_next!9045 () Bool)

(assert (=> start!38186 (= b_free!9045 (not b_next!9045))))

(declare-fun tp!31919 () Bool)

(declare-fun b_and!16419 () Bool)

(assert (=> start!38186 (= tp!31919 b_and!16419)))

(declare-fun b!393700 () Bool)

(declare-fun res!225565 () Bool)

(declare-fun e!238365 () Bool)

(assert (=> b!393700 (=> (not res!225565) (not e!238365))))

(declare-datatypes ((array!23341 0))(
  ( (array!23342 (arr!11128 (Array (_ BitVec 32) (_ BitVec 64))) (size!11480 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23341)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393700 (= res!225565 (or (= (select (arr!11128 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11128 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393701 () Bool)

(declare-fun e!238364 () Bool)

(assert (=> b!393701 (= e!238364 true)))

(declare-datatypes ((V!14061 0))(
  ( (V!14062 (val!4903 Int)) )
))
(declare-datatypes ((tuple2!6618 0))(
  ( (tuple2!6619 (_1!3320 (_ BitVec 64)) (_2!3320 V!14061)) )
))
(declare-datatypes ((List!6471 0))(
  ( (Nil!6468) (Cons!6467 (h!7323 tuple2!6618) (t!11643 List!6471)) )
))
(declare-datatypes ((ListLongMap!5531 0))(
  ( (ListLongMap!5532 (toList!2781 List!6471)) )
))
(declare-fun lt!186389 () ListLongMap!5531)

(declare-fun lt!186388 () ListLongMap!5531)

(assert (=> b!393701 (= lt!186389 lt!186388)))

(declare-fun res!225568 () Bool)

(assert (=> start!38186 (=> (not res!225568) (not e!238365))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38186 (= res!225568 (validMask!0 mask!970))))

(assert (=> start!38186 e!238365))

(declare-datatypes ((ValueCell!4515 0))(
  ( (ValueCellFull!4515 (v!7144 V!14061)) (EmptyCell!4515) )
))
(declare-datatypes ((array!23343 0))(
  ( (array!23344 (arr!11129 (Array (_ BitVec 32) ValueCell!4515)) (size!11481 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23343)

(declare-fun e!238361 () Bool)

(declare-fun array_inv!8172 (array!23343) Bool)

(assert (=> start!38186 (and (array_inv!8172 _values!506) e!238361)))

(assert (=> start!38186 tp!31919))

(assert (=> start!38186 true))

(declare-fun tp_is_empty!9717 () Bool)

(assert (=> start!38186 tp_is_empty!9717))

(declare-fun array_inv!8173 (array!23341) Bool)

(assert (=> start!38186 (array_inv!8173 _keys!658)))

(declare-fun b!393702 () Bool)

(declare-fun res!225566 () Bool)

(assert (=> b!393702 (=> (not res!225566) (not e!238365))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393702 (= res!225566 (and (= (size!11481 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11480 _keys!658) (size!11481 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16173 () Bool)

(declare-fun mapRes!16173 () Bool)

(assert (=> mapIsEmpty!16173 mapRes!16173))

(declare-fun b!393703 () Bool)

(declare-fun e!238363 () Bool)

(assert (=> b!393703 (= e!238361 (and e!238363 mapRes!16173))))

(declare-fun condMapEmpty!16173 () Bool)

(declare-fun mapDefault!16173 () ValueCell!4515)

(assert (=> b!393703 (= condMapEmpty!16173 (= (arr!11129 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4515)) mapDefault!16173)))))

(declare-fun b!393704 () Bool)

(declare-fun res!225567 () Bool)

(assert (=> b!393704 (=> (not res!225567) (not e!238365))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393704 (= res!225567 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16173 () Bool)

(declare-fun tp!31920 () Bool)

(declare-fun e!238360 () Bool)

(assert (=> mapNonEmpty!16173 (= mapRes!16173 (and tp!31920 e!238360))))

(declare-fun mapRest!16173 () (Array (_ BitVec 32) ValueCell!4515))

(declare-fun mapKey!16173 () (_ BitVec 32))

(declare-fun mapValue!16173 () ValueCell!4515)

(assert (=> mapNonEmpty!16173 (= (arr!11129 _values!506) (store mapRest!16173 mapKey!16173 mapValue!16173))))

(declare-fun b!393705 () Bool)

(declare-fun res!225571 () Bool)

(assert (=> b!393705 (=> (not res!225571) (not e!238365))))

(assert (=> b!393705 (= res!225571 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11480 _keys!658))))))

(declare-fun b!393706 () Bool)

(assert (=> b!393706 (= e!238363 tp_is_empty!9717)))

(declare-fun b!393707 () Bool)

(declare-fun e!238362 () Bool)

(assert (=> b!393707 (= e!238362 (not e!238364))))

(declare-fun res!225569 () Bool)

(assert (=> b!393707 (=> res!225569 e!238364)))

(declare-fun lt!186392 () Bool)

(assert (=> b!393707 (= res!225569 (or (and (not lt!186392) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186392) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186392)))))

(assert (=> b!393707 (= lt!186392 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!186385 () ListLongMap!5531)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14061)

(declare-fun minValue!472 () V!14061)

(declare-fun getCurrentListMap!2122 (array!23341 array!23343 (_ BitVec 32) (_ BitVec 32) V!14061 V!14061 (_ BitVec 32) Int) ListLongMap!5531)

(assert (=> b!393707 (= lt!186385 (getCurrentListMap!2122 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186387 () array!23343)

(declare-fun lt!186386 () array!23341)

(assert (=> b!393707 (= lt!186389 (getCurrentListMap!2122 lt!186386 lt!186387 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186391 () ListLongMap!5531)

(assert (=> b!393707 (and (= lt!186388 lt!186391) (= lt!186391 lt!186388))))

(declare-fun v!373 () V!14061)

(declare-fun lt!186393 () ListLongMap!5531)

(declare-fun +!1076 (ListLongMap!5531 tuple2!6618) ListLongMap!5531)

(assert (=> b!393707 (= lt!186391 (+!1076 lt!186393 (tuple2!6619 k0!778 v!373)))))

(declare-datatypes ((Unit!12040 0))(
  ( (Unit!12041) )
))
(declare-fun lt!186390 () Unit!12040)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!286 (array!23341 array!23343 (_ BitVec 32) (_ BitVec 32) V!14061 V!14061 (_ BitVec 32) (_ BitVec 64) V!14061 (_ BitVec 32) Int) Unit!12040)

(assert (=> b!393707 (= lt!186390 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!286 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1002 (array!23341 array!23343 (_ BitVec 32) (_ BitVec 32) V!14061 V!14061 (_ BitVec 32) Int) ListLongMap!5531)

(assert (=> b!393707 (= lt!186388 (getCurrentListMapNoExtraKeys!1002 lt!186386 lt!186387 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393707 (= lt!186387 (array!23344 (store (arr!11129 _values!506) i!548 (ValueCellFull!4515 v!373)) (size!11481 _values!506)))))

(assert (=> b!393707 (= lt!186393 (getCurrentListMapNoExtraKeys!1002 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393708 () Bool)

(declare-fun res!225572 () Bool)

(assert (=> b!393708 (=> (not res!225572) (not e!238365))))

(declare-datatypes ((List!6472 0))(
  ( (Nil!6469) (Cons!6468 (h!7324 (_ BitVec 64)) (t!11644 List!6472)) )
))
(declare-fun arrayNoDuplicates!0 (array!23341 (_ BitVec 32) List!6472) Bool)

(assert (=> b!393708 (= res!225572 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6469))))

(declare-fun b!393709 () Bool)

(assert (=> b!393709 (= e!238365 e!238362)))

(declare-fun res!225570 () Bool)

(assert (=> b!393709 (=> (not res!225570) (not e!238362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23341 (_ BitVec 32)) Bool)

(assert (=> b!393709 (= res!225570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186386 mask!970))))

(assert (=> b!393709 (= lt!186386 (array!23342 (store (arr!11128 _keys!658) i!548 k0!778) (size!11480 _keys!658)))))

(declare-fun b!393710 () Bool)

(assert (=> b!393710 (= e!238360 tp_is_empty!9717)))

(declare-fun b!393711 () Bool)

(declare-fun res!225573 () Bool)

(assert (=> b!393711 (=> (not res!225573) (not e!238365))))

(declare-fun arrayContainsKey!0 (array!23341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393711 (= res!225573 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393712 () Bool)

(declare-fun res!225564 () Bool)

(assert (=> b!393712 (=> (not res!225564) (not e!238365))))

(assert (=> b!393712 (= res!225564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393713 () Bool)

(declare-fun res!225563 () Bool)

(assert (=> b!393713 (=> (not res!225563) (not e!238362))))

(assert (=> b!393713 (= res!225563 (arrayNoDuplicates!0 lt!186386 #b00000000000000000000000000000000 Nil!6469))))

(assert (= (and start!38186 res!225568) b!393702))

(assert (= (and b!393702 res!225566) b!393712))

(assert (= (and b!393712 res!225564) b!393708))

(assert (= (and b!393708 res!225572) b!393705))

(assert (= (and b!393705 res!225571) b!393704))

(assert (= (and b!393704 res!225567) b!393700))

(assert (= (and b!393700 res!225565) b!393711))

(assert (= (and b!393711 res!225573) b!393709))

(assert (= (and b!393709 res!225570) b!393713))

(assert (= (and b!393713 res!225563) b!393707))

(assert (= (and b!393707 (not res!225569)) b!393701))

(assert (= (and b!393703 condMapEmpty!16173) mapIsEmpty!16173))

(assert (= (and b!393703 (not condMapEmpty!16173)) mapNonEmpty!16173))

(get-info :version)

(assert (= (and mapNonEmpty!16173 ((_ is ValueCellFull!4515) mapValue!16173)) b!393710))

(assert (= (and b!393703 ((_ is ValueCellFull!4515) mapDefault!16173)) b!393706))

(assert (= start!38186 b!393703))

(declare-fun m!390161 () Bool)

(assert (=> b!393713 m!390161))

(declare-fun m!390163 () Bool)

(assert (=> b!393700 m!390163))

(declare-fun m!390165 () Bool)

(assert (=> b!393709 m!390165))

(declare-fun m!390167 () Bool)

(assert (=> b!393709 m!390167))

(declare-fun m!390169 () Bool)

(assert (=> start!38186 m!390169))

(declare-fun m!390171 () Bool)

(assert (=> start!38186 m!390171))

(declare-fun m!390173 () Bool)

(assert (=> start!38186 m!390173))

(declare-fun m!390175 () Bool)

(assert (=> b!393704 m!390175))

(declare-fun m!390177 () Bool)

(assert (=> mapNonEmpty!16173 m!390177))

(declare-fun m!390179 () Bool)

(assert (=> b!393708 m!390179))

(declare-fun m!390181 () Bool)

(assert (=> b!393707 m!390181))

(declare-fun m!390183 () Bool)

(assert (=> b!393707 m!390183))

(declare-fun m!390185 () Bool)

(assert (=> b!393707 m!390185))

(declare-fun m!390187 () Bool)

(assert (=> b!393707 m!390187))

(declare-fun m!390189 () Bool)

(assert (=> b!393707 m!390189))

(declare-fun m!390191 () Bool)

(assert (=> b!393707 m!390191))

(declare-fun m!390193 () Bool)

(assert (=> b!393707 m!390193))

(declare-fun m!390195 () Bool)

(assert (=> b!393712 m!390195))

(declare-fun m!390197 () Bool)

(assert (=> b!393711 m!390197))

(check-sat b_and!16419 (not b!393713) (not mapNonEmpty!16173) (not b!393704) (not b!393712) (not b!393708) (not start!38186) (not b!393711) (not b!393707) (not b!393709) tp_is_empty!9717 (not b_next!9045))
(check-sat b_and!16419 (not b_next!9045))
