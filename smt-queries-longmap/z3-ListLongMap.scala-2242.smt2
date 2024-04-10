; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36916 () Bool)

(assert start!36916)

(declare-fun b_free!8043 () Bool)

(declare-fun b_next!8043 () Bool)

(assert (=> start!36916 (= b_free!8043 (not b_next!8043))))

(declare-fun tp!28845 () Bool)

(declare-fun b_and!15285 () Bool)

(assert (=> start!36916 (= tp!28845 b_and!15285)))

(declare-fun b!369878 () Bool)

(declare-fun e!226001 () Bool)

(declare-fun tp_is_empty!8691 () Bool)

(assert (=> b!369878 (= e!226001 tp_is_empty!8691)))

(declare-fun b!369879 () Bool)

(declare-fun res!207592 () Bool)

(declare-fun e!226000 () Bool)

(assert (=> b!369879 (=> (not res!207592) (not e!226000))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21325 0))(
  ( (array!21326 (arr!10131 (Array (_ BitVec 32) (_ BitVec 64))) (size!10483 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21325)

(assert (=> b!369879 (= res!207592 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10483 _keys!658))))))

(declare-fun b!369880 () Bool)

(declare-fun e!225998 () Bool)

(assert (=> b!369880 (= e!225998 false)))

(declare-datatypes ((V!12693 0))(
  ( (V!12694 (val!4390 Int)) )
))
(declare-datatypes ((tuple2!5822 0))(
  ( (tuple2!5823 (_1!2922 (_ BitVec 64)) (_2!2922 V!12693)) )
))
(declare-datatypes ((List!5657 0))(
  ( (Nil!5654) (Cons!5653 (h!6509 tuple2!5822) (t!10807 List!5657)) )
))
(declare-datatypes ((ListLongMap!4735 0))(
  ( (ListLongMap!4736 (toList!2383 List!5657)) )
))
(declare-fun lt!169839 () ListLongMap!4735)

(declare-datatypes ((ValueCell!4002 0))(
  ( (ValueCellFull!4002 (v!6587 V!12693)) (EmptyCell!4002) )
))
(declare-datatypes ((array!21327 0))(
  ( (array!21328 (arr!10132 (Array (_ BitVec 32) ValueCell!4002)) (size!10484 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21327)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169837 () array!21325)

(declare-fun zeroValue!472 () V!12693)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12693)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12693)

(declare-fun getCurrentListMapNoExtraKeys!660 (array!21325 array!21327 (_ BitVec 32) (_ BitVec 32) V!12693 V!12693 (_ BitVec 32) Int) ListLongMap!4735)

(assert (=> b!369880 (= lt!169839 (getCurrentListMapNoExtraKeys!660 lt!169837 (array!21328 (store (arr!10132 _values!506) i!548 (ValueCellFull!4002 v!373)) (size!10484 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169838 () ListLongMap!4735)

(assert (=> b!369880 (= lt!169838 (getCurrentListMapNoExtraKeys!660 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369881 () Bool)

(declare-fun res!207596 () Bool)

(assert (=> b!369881 (=> (not res!207596) (not e!226000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21325 (_ BitVec 32)) Bool)

(assert (=> b!369881 (= res!207596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369882 () Bool)

(declare-fun res!207593 () Bool)

(assert (=> b!369882 (=> (not res!207593) (not e!225998))))

(declare-datatypes ((List!5658 0))(
  ( (Nil!5655) (Cons!5654 (h!6510 (_ BitVec 64)) (t!10808 List!5658)) )
))
(declare-fun arrayNoDuplicates!0 (array!21325 (_ BitVec 32) List!5658) Bool)

(assert (=> b!369882 (= res!207593 (arrayNoDuplicates!0 lt!169837 #b00000000000000000000000000000000 Nil!5655))))

(declare-fun res!207595 () Bool)

(assert (=> start!36916 (=> (not res!207595) (not e!226000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36916 (= res!207595 (validMask!0 mask!970))))

(assert (=> start!36916 e!226000))

(declare-fun e!225997 () Bool)

(declare-fun array_inv!7486 (array!21327) Bool)

(assert (=> start!36916 (and (array_inv!7486 _values!506) e!225997)))

(assert (=> start!36916 tp!28845))

(assert (=> start!36916 true))

(assert (=> start!36916 tp_is_empty!8691))

(declare-fun array_inv!7487 (array!21325) Bool)

(assert (=> start!36916 (array_inv!7487 _keys!658)))

(declare-fun b!369883 () Bool)

(declare-fun res!207590 () Bool)

(assert (=> b!369883 (=> (not res!207590) (not e!226000))))

(assert (=> b!369883 (= res!207590 (or (= (select (arr!10131 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10131 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369884 () Bool)

(assert (=> b!369884 (= e!226000 e!225998)))

(declare-fun res!207599 () Bool)

(assert (=> b!369884 (=> (not res!207599) (not e!225998))))

(assert (=> b!369884 (= res!207599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169837 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!369884 (= lt!169837 (array!21326 (store (arr!10131 _keys!658) i!548 k0!778) (size!10483 _keys!658)))))

(declare-fun b!369885 () Bool)

(declare-fun res!207598 () Bool)

(assert (=> b!369885 (=> (not res!207598) (not e!226000))))

(assert (=> b!369885 (= res!207598 (and (= (size!10484 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10483 _keys!658) (size!10484 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369886 () Bool)

(declare-fun e!225996 () Bool)

(assert (=> b!369886 (= e!225996 tp_is_empty!8691)))

(declare-fun b!369887 () Bool)

(declare-fun res!207591 () Bool)

(assert (=> b!369887 (=> (not res!207591) (not e!226000))))

(assert (=> b!369887 (= res!207591 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5655))))

(declare-fun mapIsEmpty!14601 () Bool)

(declare-fun mapRes!14601 () Bool)

(assert (=> mapIsEmpty!14601 mapRes!14601))

(declare-fun b!369888 () Bool)

(assert (=> b!369888 (= e!225997 (and e!225996 mapRes!14601))))

(declare-fun condMapEmpty!14601 () Bool)

(declare-fun mapDefault!14601 () ValueCell!4002)

(assert (=> b!369888 (= condMapEmpty!14601 (= (arr!10132 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4002)) mapDefault!14601)))))

(declare-fun mapNonEmpty!14601 () Bool)

(declare-fun tp!28844 () Bool)

(assert (=> mapNonEmpty!14601 (= mapRes!14601 (and tp!28844 e!226001))))

(declare-fun mapKey!14601 () (_ BitVec 32))

(declare-fun mapValue!14601 () ValueCell!4002)

(declare-fun mapRest!14601 () (Array (_ BitVec 32) ValueCell!4002))

(assert (=> mapNonEmpty!14601 (= (arr!10132 _values!506) (store mapRest!14601 mapKey!14601 mapValue!14601))))

(declare-fun b!369889 () Bool)

(declare-fun res!207594 () Bool)

(assert (=> b!369889 (=> (not res!207594) (not e!226000))))

(declare-fun arrayContainsKey!0 (array!21325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369889 (= res!207594 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369890 () Bool)

(declare-fun res!207597 () Bool)

(assert (=> b!369890 (=> (not res!207597) (not e!226000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369890 (= res!207597 (validKeyInArray!0 k0!778))))

(assert (= (and start!36916 res!207595) b!369885))

(assert (= (and b!369885 res!207598) b!369881))

(assert (= (and b!369881 res!207596) b!369887))

(assert (= (and b!369887 res!207591) b!369879))

(assert (= (and b!369879 res!207592) b!369890))

(assert (= (and b!369890 res!207597) b!369883))

(assert (= (and b!369883 res!207590) b!369889))

(assert (= (and b!369889 res!207594) b!369884))

(assert (= (and b!369884 res!207599) b!369882))

(assert (= (and b!369882 res!207593) b!369880))

(assert (= (and b!369888 condMapEmpty!14601) mapIsEmpty!14601))

(assert (= (and b!369888 (not condMapEmpty!14601)) mapNonEmpty!14601))

(get-info :version)

(assert (= (and mapNonEmpty!14601 ((_ is ValueCellFull!4002) mapValue!14601)) b!369878))

(assert (= (and b!369888 ((_ is ValueCellFull!4002) mapDefault!14601)) b!369886))

(assert (= start!36916 b!369888))

(declare-fun m!366153 () Bool)

(assert (=> mapNonEmpty!14601 m!366153))

(declare-fun m!366155 () Bool)

(assert (=> b!369889 m!366155))

(declare-fun m!366157 () Bool)

(assert (=> b!369882 m!366157))

(declare-fun m!366159 () Bool)

(assert (=> start!36916 m!366159))

(declare-fun m!366161 () Bool)

(assert (=> start!36916 m!366161))

(declare-fun m!366163 () Bool)

(assert (=> start!36916 m!366163))

(declare-fun m!366165 () Bool)

(assert (=> b!369884 m!366165))

(declare-fun m!366167 () Bool)

(assert (=> b!369884 m!366167))

(declare-fun m!366169 () Bool)

(assert (=> b!369890 m!366169))

(declare-fun m!366171 () Bool)

(assert (=> b!369887 m!366171))

(declare-fun m!366173 () Bool)

(assert (=> b!369883 m!366173))

(declare-fun m!366175 () Bool)

(assert (=> b!369881 m!366175))

(declare-fun m!366177 () Bool)

(assert (=> b!369880 m!366177))

(declare-fun m!366179 () Bool)

(assert (=> b!369880 m!366179))

(declare-fun m!366181 () Bool)

(assert (=> b!369880 m!366181))

(check-sat (not b!369889) (not b_next!8043) (not b!369884) (not b!369882) (not b!369887) tp_is_empty!8691 (not start!36916) (not b!369890) (not b!369880) b_and!15285 (not b!369881) (not mapNonEmpty!14601))
(check-sat b_and!15285 (not b_next!8043))
