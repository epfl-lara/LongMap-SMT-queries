; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37206 () Bool)

(assert start!37206)

(declare-fun b_free!8347 () Bool)

(declare-fun b_next!8347 () Bool)

(assert (=> start!37206 (= b_free!8347 (not b_next!8347))))

(declare-fun tp!29757 () Bool)

(declare-fun b_and!15603 () Bool)

(assert (=> start!37206 (= tp!29757 b_and!15603)))

(declare-fun b!376202 () Bool)

(declare-fun e!229133 () Bool)

(declare-fun tp_is_empty!8995 () Bool)

(assert (=> b!376202 (= e!229133 tp_is_empty!8995)))

(declare-fun mapNonEmpty!15057 () Bool)

(declare-fun mapRes!15057 () Bool)

(declare-fun tp!29756 () Bool)

(assert (=> mapNonEmpty!15057 (= mapRes!15057 (and tp!29756 e!229133))))

(declare-datatypes ((V!13099 0))(
  ( (V!13100 (val!4542 Int)) )
))
(declare-datatypes ((ValueCell!4154 0))(
  ( (ValueCellFull!4154 (v!6740 V!13099)) (EmptyCell!4154) )
))
(declare-datatypes ((array!21908 0))(
  ( (array!21909 (arr!10422 (Array (_ BitVec 32) ValueCell!4154)) (size!10774 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21908)

(declare-fun mapValue!15057 () ValueCell!4154)

(declare-fun mapKey!15057 () (_ BitVec 32))

(declare-fun mapRest!15057 () (Array (_ BitVec 32) ValueCell!4154))

(assert (=> mapNonEmpty!15057 (= (arr!10422 _values!506) (store mapRest!15057 mapKey!15057 mapValue!15057))))

(declare-fun b!376203 () Bool)

(declare-fun e!229131 () Bool)

(declare-fun e!229132 () Bool)

(assert (=> b!376203 (= e!229131 (and e!229132 mapRes!15057))))

(declare-fun condMapEmpty!15057 () Bool)

(declare-fun mapDefault!15057 () ValueCell!4154)

(assert (=> b!376203 (= condMapEmpty!15057 (= (arr!10422 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4154)) mapDefault!15057)))))

(declare-fun mapIsEmpty!15057 () Bool)

(assert (=> mapIsEmpty!15057 mapRes!15057))

(declare-fun b!376204 () Bool)

(declare-fun res!212597 () Bool)

(declare-fun e!229129 () Bool)

(assert (=> b!376204 (=> (not res!212597) (not e!229129))))

(declare-datatypes ((array!21910 0))(
  ( (array!21911 (arr!10423 (Array (_ BitVec 32) (_ BitVec 64))) (size!10775 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21910)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376204 (= res!212597 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376205 () Bool)

(declare-fun res!212593 () Bool)

(assert (=> b!376205 (=> (not res!212593) (not e!229129))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376205 (= res!212593 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10775 _keys!658))))))

(declare-fun res!212599 () Bool)

(assert (=> start!37206 (=> (not res!212599) (not e!229129))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37206 (= res!212599 (validMask!0 mask!970))))

(assert (=> start!37206 e!229129))

(declare-fun array_inv!7736 (array!21908) Bool)

(assert (=> start!37206 (and (array_inv!7736 _values!506) e!229131)))

(assert (=> start!37206 tp!29757))

(assert (=> start!37206 true))

(assert (=> start!37206 tp_is_empty!8995))

(declare-fun array_inv!7737 (array!21910) Bool)

(assert (=> start!37206 (array_inv!7737 _keys!658)))

(declare-fun b!376206 () Bool)

(declare-fun res!212602 () Bool)

(assert (=> b!376206 (=> (not res!212602) (not e!229129))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376206 (= res!212602 (and (= (size!10774 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10775 _keys!658) (size!10774 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376207 () Bool)

(assert (=> b!376207 (= e!229132 tp_is_empty!8995)))

(declare-fun b!376208 () Bool)

(declare-fun res!212592 () Bool)

(assert (=> b!376208 (=> (not res!212592) (not e!229129))))

(assert (=> b!376208 (= res!212592 (or (= (select (arr!10423 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10423 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376209 () Bool)

(declare-fun e!229127 () Bool)

(declare-fun e!229128 () Bool)

(assert (=> b!376209 (= e!229127 (not e!229128))))

(declare-fun res!212595 () Bool)

(assert (=> b!376209 (=> res!212595 e!229128)))

(assert (=> b!376209 (= res!212595 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13099)

(declare-datatypes ((tuple2!5956 0))(
  ( (tuple2!5957 (_1!2989 (_ BitVec 64)) (_2!2989 V!13099)) )
))
(declare-datatypes ((List!5798 0))(
  ( (Nil!5795) (Cons!5794 (h!6650 tuple2!5956) (t!10940 List!5798)) )
))
(declare-datatypes ((ListLongMap!4871 0))(
  ( (ListLongMap!4872 (toList!2451 List!5798)) )
))
(declare-fun lt!174491 () ListLongMap!4871)

(declare-fun minValue!472 () V!13099)

(declare-fun getCurrentListMap!1903 (array!21910 array!21908 (_ BitVec 32) (_ BitVec 32) V!13099 V!13099 (_ BitVec 32) Int) ListLongMap!4871)

(assert (=> b!376209 (= lt!174491 (getCurrentListMap!1903 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174490 () array!21908)

(declare-fun lt!174492 () ListLongMap!4871)

(declare-fun lt!174485 () array!21910)

(assert (=> b!376209 (= lt!174492 (getCurrentListMap!1903 lt!174485 lt!174490 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174486 () ListLongMap!4871)

(declare-fun lt!174484 () ListLongMap!4871)

(assert (=> b!376209 (and (= lt!174486 lt!174484) (= lt!174484 lt!174486))))

(declare-fun lt!174496 () ListLongMap!4871)

(declare-fun lt!174488 () tuple2!5956)

(declare-fun +!847 (ListLongMap!4871 tuple2!5956) ListLongMap!4871)

(assert (=> b!376209 (= lt!174484 (+!847 lt!174496 lt!174488))))

(declare-fun v!373 () V!13099)

(assert (=> b!376209 (= lt!174488 (tuple2!5957 k0!778 v!373))))

(declare-datatypes ((Unit!11581 0))(
  ( (Unit!11582) )
))
(declare-fun lt!174495 () Unit!11581)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!90 (array!21910 array!21908 (_ BitVec 32) (_ BitVec 32) V!13099 V!13099 (_ BitVec 32) (_ BitVec 64) V!13099 (_ BitVec 32) Int) Unit!11581)

(assert (=> b!376209 (= lt!174495 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!90 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!750 (array!21910 array!21908 (_ BitVec 32) (_ BitVec 32) V!13099 V!13099 (_ BitVec 32) Int) ListLongMap!4871)

(assert (=> b!376209 (= lt!174486 (getCurrentListMapNoExtraKeys!750 lt!174485 lt!174490 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376209 (= lt!174490 (array!21909 (store (arr!10422 _values!506) i!548 (ValueCellFull!4154 v!373)) (size!10774 _values!506)))))

(assert (=> b!376209 (= lt!174496 (getCurrentListMapNoExtraKeys!750 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376210 () Bool)

(declare-fun res!212596 () Bool)

(assert (=> b!376210 (=> (not res!212596) (not e!229129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376210 (= res!212596 (validKeyInArray!0 k0!778))))

(declare-fun b!376211 () Bool)

(declare-fun res!212600 () Bool)

(assert (=> b!376211 (=> (not res!212600) (not e!229127))))

(declare-datatypes ((List!5799 0))(
  ( (Nil!5796) (Cons!5795 (h!6651 (_ BitVec 64)) (t!10941 List!5799)) )
))
(declare-fun arrayNoDuplicates!0 (array!21910 (_ BitVec 32) List!5799) Bool)

(assert (=> b!376211 (= res!212600 (arrayNoDuplicates!0 lt!174485 #b00000000000000000000000000000000 Nil!5796))))

(declare-fun b!376212 () Bool)

(declare-fun res!212598 () Bool)

(assert (=> b!376212 (=> (not res!212598) (not e!229129))))

(assert (=> b!376212 (= res!212598 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5796))))

(declare-fun b!376213 () Bool)

(declare-fun e!229134 () Bool)

(assert (=> b!376213 (= e!229134 true)))

(declare-fun lt!174489 () ListLongMap!4871)

(declare-fun lt!174493 () ListLongMap!4871)

(assert (=> b!376213 (= lt!174489 (+!847 lt!174493 lt!174488))))

(declare-fun lt!174494 () Unit!11581)

(declare-fun addCommutativeForDiffKeys!268 (ListLongMap!4871 (_ BitVec 64) V!13099 (_ BitVec 64) V!13099) Unit!11581)

(assert (=> b!376213 (= lt!174494 (addCommutativeForDiffKeys!268 lt!174496 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376214 () Bool)

(assert (=> b!376214 (= e!229128 e!229134)))

(declare-fun res!212603 () Bool)

(assert (=> b!376214 (=> res!212603 e!229134)))

(assert (=> b!376214 (= res!212603 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376214 (= lt!174492 lt!174489)))

(declare-fun lt!174487 () tuple2!5956)

(assert (=> b!376214 (= lt!174489 (+!847 lt!174484 lt!174487))))

(assert (=> b!376214 (= lt!174491 lt!174493)))

(assert (=> b!376214 (= lt!174493 (+!847 lt!174496 lt!174487))))

(assert (=> b!376214 (= lt!174492 (+!847 lt!174486 lt!174487))))

(assert (=> b!376214 (= lt!174487 (tuple2!5957 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376215 () Bool)

(assert (=> b!376215 (= e!229129 e!229127)))

(declare-fun res!212601 () Bool)

(assert (=> b!376215 (=> (not res!212601) (not e!229127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21910 (_ BitVec 32)) Bool)

(assert (=> b!376215 (= res!212601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174485 mask!970))))

(assert (=> b!376215 (= lt!174485 (array!21911 (store (arr!10423 _keys!658) i!548 k0!778) (size!10775 _keys!658)))))

(declare-fun b!376216 () Bool)

(declare-fun res!212594 () Bool)

(assert (=> b!376216 (=> (not res!212594) (not e!229129))))

(assert (=> b!376216 (= res!212594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37206 res!212599) b!376206))

(assert (= (and b!376206 res!212602) b!376216))

(assert (= (and b!376216 res!212594) b!376212))

(assert (= (and b!376212 res!212598) b!376205))

(assert (= (and b!376205 res!212593) b!376210))

(assert (= (and b!376210 res!212596) b!376208))

(assert (= (and b!376208 res!212592) b!376204))

(assert (= (and b!376204 res!212597) b!376215))

(assert (= (and b!376215 res!212601) b!376211))

(assert (= (and b!376211 res!212600) b!376209))

(assert (= (and b!376209 (not res!212595)) b!376214))

(assert (= (and b!376214 (not res!212603)) b!376213))

(assert (= (and b!376203 condMapEmpty!15057) mapIsEmpty!15057))

(assert (= (and b!376203 (not condMapEmpty!15057)) mapNonEmpty!15057))

(get-info :version)

(assert (= (and mapNonEmpty!15057 ((_ is ValueCellFull!4154) mapValue!15057)) b!376202))

(assert (= (and b!376203 ((_ is ValueCellFull!4154) mapDefault!15057)) b!376207))

(assert (= start!37206 b!376203))

(declare-fun m!373169 () Bool)

(assert (=> b!376213 m!373169))

(declare-fun m!373171 () Bool)

(assert (=> b!376213 m!373171))

(declare-fun m!373173 () Bool)

(assert (=> b!376208 m!373173))

(declare-fun m!373175 () Bool)

(assert (=> b!376204 m!373175))

(declare-fun m!373177 () Bool)

(assert (=> mapNonEmpty!15057 m!373177))

(declare-fun m!373179 () Bool)

(assert (=> b!376210 m!373179))

(declare-fun m!373181 () Bool)

(assert (=> b!376212 m!373181))

(declare-fun m!373183 () Bool)

(assert (=> start!37206 m!373183))

(declare-fun m!373185 () Bool)

(assert (=> start!37206 m!373185))

(declare-fun m!373187 () Bool)

(assert (=> start!37206 m!373187))

(declare-fun m!373189 () Bool)

(assert (=> b!376209 m!373189))

(declare-fun m!373191 () Bool)

(assert (=> b!376209 m!373191))

(declare-fun m!373193 () Bool)

(assert (=> b!376209 m!373193))

(declare-fun m!373195 () Bool)

(assert (=> b!376209 m!373195))

(declare-fun m!373197 () Bool)

(assert (=> b!376209 m!373197))

(declare-fun m!373199 () Bool)

(assert (=> b!376209 m!373199))

(declare-fun m!373201 () Bool)

(assert (=> b!376209 m!373201))

(declare-fun m!373203 () Bool)

(assert (=> b!376215 m!373203))

(declare-fun m!373205 () Bool)

(assert (=> b!376215 m!373205))

(declare-fun m!373207 () Bool)

(assert (=> b!376214 m!373207))

(declare-fun m!373209 () Bool)

(assert (=> b!376214 m!373209))

(declare-fun m!373211 () Bool)

(assert (=> b!376214 m!373211))

(declare-fun m!373213 () Bool)

(assert (=> b!376216 m!373213))

(declare-fun m!373215 () Bool)

(assert (=> b!376211 m!373215))

(check-sat tp_is_empty!8995 (not b_next!8347) (not b!376209) (not b!376212) (not b!376214) (not b!376215) (not b!376216) b_and!15603 (not mapNonEmpty!15057) (not b!376213) (not b!376211) (not b!376204) (not b!376210) (not start!37206))
(check-sat b_and!15603 (not b_next!8347))
