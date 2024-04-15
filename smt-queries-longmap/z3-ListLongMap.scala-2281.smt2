; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37134 () Bool)

(assert start!37134)

(declare-fun b_free!8275 () Bool)

(declare-fun b_next!8275 () Bool)

(assert (=> start!37134 (= b_free!8275 (not b_next!8275))))

(declare-fun tp!29540 () Bool)

(declare-fun b_and!15491 () Bool)

(assert (=> start!37134 (= tp!29540 b_and!15491)))

(declare-fun b!374351 () Bool)

(declare-fun res!211167 () Bool)

(declare-fun e!228123 () Bool)

(assert (=> b!374351 (=> (not res!211167) (not e!228123))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21763 0))(
  ( (array!21764 (arr!10350 (Array (_ BitVec 32) (_ BitVec 64))) (size!10703 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21763)

(assert (=> b!374351 (= res!211167 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10703 _keys!658))))))

(declare-fun res!211161 () Bool)

(assert (=> start!37134 (=> (not res!211161) (not e!228123))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37134 (= res!211161 (validMask!0 mask!970))))

(assert (=> start!37134 e!228123))

(declare-datatypes ((V!13003 0))(
  ( (V!13004 (val!4506 Int)) )
))
(declare-datatypes ((ValueCell!4118 0))(
  ( (ValueCellFull!4118 (v!6697 V!13003)) (EmptyCell!4118) )
))
(declare-datatypes ((array!21765 0))(
  ( (array!21766 (arr!10351 (Array (_ BitVec 32) ValueCell!4118)) (size!10704 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21765)

(declare-fun e!228121 () Bool)

(declare-fun array_inv!7636 (array!21765) Bool)

(assert (=> start!37134 (and (array_inv!7636 _values!506) e!228121)))

(assert (=> start!37134 tp!29540))

(assert (=> start!37134 true))

(declare-fun tp_is_empty!8923 () Bool)

(assert (=> start!37134 tp_is_empty!8923))

(declare-fun array_inv!7637 (array!21763) Bool)

(assert (=> start!37134 (array_inv!7637 _keys!658)))

(declare-fun b!374352 () Bool)

(declare-fun e!228128 () Bool)

(declare-fun mapRes!14949 () Bool)

(assert (=> b!374352 (= e!228121 (and e!228128 mapRes!14949))))

(declare-fun condMapEmpty!14949 () Bool)

(declare-fun mapDefault!14949 () ValueCell!4118)

(assert (=> b!374352 (= condMapEmpty!14949 (= (arr!10351 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4118)) mapDefault!14949)))))

(declare-fun b!374353 () Bool)

(declare-fun res!211166 () Bool)

(assert (=> b!374353 (=> (not res!211166) (not e!228123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21763 (_ BitVec 32)) Bool)

(assert (=> b!374353 (= res!211166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374354 () Bool)

(declare-fun res!211162 () Bool)

(assert (=> b!374354 (=> (not res!211162) (not e!228123))))

(declare-datatypes ((List!5795 0))(
  ( (Nil!5792) (Cons!5791 (h!6647 (_ BitVec 64)) (t!10936 List!5795)) )
))
(declare-fun arrayNoDuplicates!0 (array!21763 (_ BitVec 32) List!5795) Bool)

(assert (=> b!374354 (= res!211162 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5792))))

(declare-fun b!374355 () Bool)

(declare-fun e!228125 () Bool)

(declare-fun e!228124 () Bool)

(assert (=> b!374355 (= e!228125 (not e!228124))))

(declare-fun res!211164 () Bool)

(assert (=> b!374355 (=> res!211164 e!228124)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374355 (= res!211164 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5962 0))(
  ( (tuple2!5963 (_1!2992 (_ BitVec 64)) (_2!2992 V!13003)) )
))
(declare-datatypes ((List!5796 0))(
  ( (Nil!5793) (Cons!5792 (h!6648 tuple2!5962) (t!10937 List!5796)) )
))
(declare-datatypes ((ListLongMap!4865 0))(
  ( (ListLongMap!4866 (toList!2448 List!5796)) )
))
(declare-fun lt!172584 () ListLongMap!4865)

(declare-fun zeroValue!472 () V!13003)

(declare-fun minValue!472 () V!13003)

(declare-fun getCurrentListMap!1867 (array!21763 array!21765 (_ BitVec 32) (_ BitVec 32) V!13003 V!13003 (_ BitVec 32) Int) ListLongMap!4865)

(assert (=> b!374355 (= lt!172584 (getCurrentListMap!1867 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172587 () array!21763)

(declare-fun lt!172589 () ListLongMap!4865)

(declare-fun lt!172598 () array!21765)

(assert (=> b!374355 (= lt!172589 (getCurrentListMap!1867 lt!172587 lt!172598 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172594 () ListLongMap!4865)

(declare-fun lt!172591 () ListLongMap!4865)

(assert (=> b!374355 (and (= lt!172594 lt!172591) (= lt!172591 lt!172594))))

(declare-fun lt!172596 () ListLongMap!4865)

(declare-fun lt!172597 () tuple2!5962)

(declare-fun +!816 (ListLongMap!4865 tuple2!5962) ListLongMap!4865)

(assert (=> b!374355 (= lt!172591 (+!816 lt!172596 lt!172597))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13003)

(assert (=> b!374355 (= lt!172597 (tuple2!5963 k0!778 v!373))))

(declare-datatypes ((Unit!11504 0))(
  ( (Unit!11505) )
))
(declare-fun lt!172588 () Unit!11504)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!60 (array!21763 array!21765 (_ BitVec 32) (_ BitVec 32) V!13003 V!13003 (_ BitVec 32) (_ BitVec 64) V!13003 (_ BitVec 32) Int) Unit!11504)

(assert (=> b!374355 (= lt!172588 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!60 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!732 (array!21763 array!21765 (_ BitVec 32) (_ BitVec 32) V!13003 V!13003 (_ BitVec 32) Int) ListLongMap!4865)

(assert (=> b!374355 (= lt!172594 (getCurrentListMapNoExtraKeys!732 lt!172587 lt!172598 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374355 (= lt!172598 (array!21766 (store (arr!10351 _values!506) i!548 (ValueCellFull!4118 v!373)) (size!10704 _values!506)))))

(assert (=> b!374355 (= lt!172596 (getCurrentListMapNoExtraKeys!732 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374356 () Bool)

(declare-fun res!211163 () Bool)

(assert (=> b!374356 (=> (not res!211163) (not e!228125))))

(assert (=> b!374356 (= res!211163 (arrayNoDuplicates!0 lt!172587 #b00000000000000000000000000000000 Nil!5792))))

(declare-fun mapNonEmpty!14949 () Bool)

(declare-fun tp!29541 () Bool)

(declare-fun e!228122 () Bool)

(assert (=> mapNonEmpty!14949 (= mapRes!14949 (and tp!29541 e!228122))))

(declare-fun mapValue!14949 () ValueCell!4118)

(declare-fun mapKey!14949 () (_ BitVec 32))

(declare-fun mapRest!14949 () (Array (_ BitVec 32) ValueCell!4118))

(assert (=> mapNonEmpty!14949 (= (arr!10351 _values!506) (store mapRest!14949 mapKey!14949 mapValue!14949))))

(declare-fun b!374357 () Bool)

(declare-fun res!211165 () Bool)

(assert (=> b!374357 (=> (not res!211165) (not e!228123))))

(declare-fun arrayContainsKey!0 (array!21763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374357 (= res!211165 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374358 () Bool)

(assert (=> b!374358 (= e!228123 e!228125)))

(declare-fun res!211168 () Bool)

(assert (=> b!374358 (=> (not res!211168) (not e!228125))))

(assert (=> b!374358 (= res!211168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172587 mask!970))))

(assert (=> b!374358 (= lt!172587 (array!21764 (store (arr!10350 _keys!658) i!548 k0!778) (size!10703 _keys!658)))))

(declare-fun b!374359 () Bool)

(declare-fun res!211171 () Bool)

(assert (=> b!374359 (=> (not res!211171) (not e!228123))))

(assert (=> b!374359 (= res!211171 (or (= (select (arr!10350 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10350 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374360 () Bool)

(declare-fun e!228126 () Bool)

(assert (=> b!374360 (= e!228124 e!228126)))

(declare-fun res!211169 () Bool)

(assert (=> b!374360 (=> res!211169 e!228126)))

(assert (=> b!374360 (= res!211169 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172599 () ListLongMap!4865)

(declare-fun lt!172583 () ListLongMap!4865)

(assert (=> b!374360 (= lt!172599 lt!172583)))

(declare-fun lt!172595 () ListLongMap!4865)

(assert (=> b!374360 (= lt!172583 (+!816 lt!172595 lt!172597))))

(declare-fun lt!172586 () Unit!11504)

(declare-fun addCommutativeForDiffKeys!232 (ListLongMap!4865 (_ BitVec 64) V!13003 (_ BitVec 64) V!13003) Unit!11504)

(assert (=> b!374360 (= lt!172586 (addCommutativeForDiffKeys!232 lt!172596 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172590 () tuple2!5962)

(assert (=> b!374360 (= lt!172589 (+!816 lt!172599 lt!172590))))

(declare-fun lt!172593 () tuple2!5962)

(assert (=> b!374360 (= lt!172599 (+!816 lt!172591 lt!172593))))

(declare-fun lt!172585 () ListLongMap!4865)

(assert (=> b!374360 (= lt!172584 lt!172585)))

(assert (=> b!374360 (= lt!172585 (+!816 lt!172595 lt!172590))))

(assert (=> b!374360 (= lt!172595 (+!816 lt!172596 lt!172593))))

(assert (=> b!374360 (= lt!172589 (+!816 (+!816 lt!172594 lt!172593) lt!172590))))

(assert (=> b!374360 (= lt!172590 (tuple2!5963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374360 (= lt!172593 (tuple2!5963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374361 () Bool)

(assert (=> b!374361 (= e!228122 tp_is_empty!8923)))

(declare-fun b!374362 () Bool)

(declare-fun res!211170 () Bool)

(assert (=> b!374362 (=> (not res!211170) (not e!228123))))

(assert (=> b!374362 (= res!211170 (and (= (size!10704 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10703 _keys!658) (size!10704 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14949 () Bool)

(assert (=> mapIsEmpty!14949 mapRes!14949))

(declare-fun b!374363 () Bool)

(assert (=> b!374363 (= e!228126 true)))

(assert (=> b!374363 (= (+!816 lt!172583 lt!172590) (+!816 lt!172585 lt!172597))))

(declare-fun lt!172592 () Unit!11504)

(assert (=> b!374363 (= lt!172592 (addCommutativeForDiffKeys!232 lt!172595 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374364 () Bool)

(assert (=> b!374364 (= e!228128 tp_is_empty!8923)))

(declare-fun b!374365 () Bool)

(declare-fun res!211172 () Bool)

(assert (=> b!374365 (=> (not res!211172) (not e!228123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374365 (= res!211172 (validKeyInArray!0 k0!778))))

(assert (= (and start!37134 res!211161) b!374362))

(assert (= (and b!374362 res!211170) b!374353))

(assert (= (and b!374353 res!211166) b!374354))

(assert (= (and b!374354 res!211162) b!374351))

(assert (= (and b!374351 res!211167) b!374365))

(assert (= (and b!374365 res!211172) b!374359))

(assert (= (and b!374359 res!211171) b!374357))

(assert (= (and b!374357 res!211165) b!374358))

(assert (= (and b!374358 res!211168) b!374356))

(assert (= (and b!374356 res!211163) b!374355))

(assert (= (and b!374355 (not res!211164)) b!374360))

(assert (= (and b!374360 (not res!211169)) b!374363))

(assert (= (and b!374352 condMapEmpty!14949) mapIsEmpty!14949))

(assert (= (and b!374352 (not condMapEmpty!14949)) mapNonEmpty!14949))

(get-info :version)

(assert (= (and mapNonEmpty!14949 ((_ is ValueCellFull!4118) mapValue!14949)) b!374361))

(assert (= (and b!374352 ((_ is ValueCellFull!4118) mapDefault!14949)) b!374364))

(assert (= start!37134 b!374352))

(declare-fun m!370211 () Bool)

(assert (=> b!374354 m!370211))

(declare-fun m!370213 () Bool)

(assert (=> b!374358 m!370213))

(declare-fun m!370215 () Bool)

(assert (=> b!374358 m!370215))

(declare-fun m!370217 () Bool)

(assert (=> b!374363 m!370217))

(declare-fun m!370219 () Bool)

(assert (=> b!374363 m!370219))

(declare-fun m!370221 () Bool)

(assert (=> b!374363 m!370221))

(declare-fun m!370223 () Bool)

(assert (=> start!37134 m!370223))

(declare-fun m!370225 () Bool)

(assert (=> start!37134 m!370225))

(declare-fun m!370227 () Bool)

(assert (=> start!37134 m!370227))

(declare-fun m!370229 () Bool)

(assert (=> b!374359 m!370229))

(declare-fun m!370231 () Bool)

(assert (=> b!374353 m!370231))

(declare-fun m!370233 () Bool)

(assert (=> b!374355 m!370233))

(declare-fun m!370235 () Bool)

(assert (=> b!374355 m!370235))

(declare-fun m!370237 () Bool)

(assert (=> b!374355 m!370237))

(declare-fun m!370239 () Bool)

(assert (=> b!374355 m!370239))

(declare-fun m!370241 () Bool)

(assert (=> b!374355 m!370241))

(declare-fun m!370243 () Bool)

(assert (=> b!374355 m!370243))

(declare-fun m!370245 () Bool)

(assert (=> b!374355 m!370245))

(declare-fun m!370247 () Bool)

(assert (=> b!374365 m!370247))

(declare-fun m!370249 () Bool)

(assert (=> b!374356 m!370249))

(declare-fun m!370251 () Bool)

(assert (=> mapNonEmpty!14949 m!370251))

(declare-fun m!370253 () Bool)

(assert (=> b!374357 m!370253))

(declare-fun m!370255 () Bool)

(assert (=> b!374360 m!370255))

(declare-fun m!370257 () Bool)

(assert (=> b!374360 m!370257))

(declare-fun m!370259 () Bool)

(assert (=> b!374360 m!370259))

(declare-fun m!370261 () Bool)

(assert (=> b!374360 m!370261))

(declare-fun m!370263 () Bool)

(assert (=> b!374360 m!370263))

(declare-fun m!370265 () Bool)

(assert (=> b!374360 m!370265))

(declare-fun m!370267 () Bool)

(assert (=> b!374360 m!370267))

(assert (=> b!374360 m!370257))

(declare-fun m!370269 () Bool)

(assert (=> b!374360 m!370269))

(check-sat (not b!374363) tp_is_empty!8923 (not b!374353) (not b!374365) (not b!374354) (not b!374358) b_and!15491 (not mapNonEmpty!14949) (not start!37134) (not b_next!8275) (not b!374357) (not b!374360) (not b!374356) (not b!374355))
(check-sat b_and!15491 (not b_next!8275))
