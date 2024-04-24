; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37782 () Bool)

(assert start!37782)

(declare-fun b_free!8899 () Bool)

(declare-fun b_next!8899 () Bool)

(assert (=> start!37782 (= b_free!8899 (not b_next!8899))))

(declare-fun tp!31448 () Bool)

(declare-fun b_and!16155 () Bool)

(assert (=> start!37782 (= tp!31448 b_and!16155)))

(declare-fun b!388186 () Bool)

(declare-fun res!221985 () Bool)

(declare-fun e!235228 () Bool)

(assert (=> b!388186 (=> (not res!221985) (not e!235228))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388186 (= res!221985 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15921 () Bool)

(declare-fun mapRes!15921 () Bool)

(declare-fun tp!31449 () Bool)

(declare-fun e!235225 () Bool)

(assert (=> mapNonEmpty!15921 (= mapRes!15921 (and tp!31449 e!235225))))

(declare-datatypes ((V!13867 0))(
  ( (V!13868 (val!4830 Int)) )
))
(declare-datatypes ((ValueCell!4442 0))(
  ( (ValueCellFull!4442 (v!7028 V!13867)) (EmptyCell!4442) )
))
(declare-fun mapRest!15921 () (Array (_ BitVec 32) ValueCell!4442))

(declare-fun mapValue!15921 () ValueCell!4442)

(declare-datatypes ((array!23018 0))(
  ( (array!23019 (arr!10977 (Array (_ BitVec 32) ValueCell!4442)) (size!11329 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23018)

(declare-fun mapKey!15921 () (_ BitVec 32))

(assert (=> mapNonEmpty!15921 (= (arr!10977 _values!506) (store mapRest!15921 mapKey!15921 mapValue!15921))))

(declare-fun b!388187 () Bool)

(declare-fun e!235229 () Bool)

(declare-fun tp_is_empty!9571 () Bool)

(assert (=> b!388187 (= e!235229 tp_is_empty!9571)))

(declare-fun b!388189 () Bool)

(declare-fun e!235226 () Bool)

(assert (=> b!388189 (= e!235226 (and e!235229 mapRes!15921))))

(declare-fun condMapEmpty!15921 () Bool)

(declare-fun mapDefault!15921 () ValueCell!4442)

(assert (=> b!388189 (= condMapEmpty!15921 (= (arr!10977 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4442)) mapDefault!15921)))))

(declare-fun mapIsEmpty!15921 () Bool)

(assert (=> mapIsEmpty!15921 mapRes!15921))

(declare-fun b!388190 () Bool)

(declare-fun res!221991 () Bool)

(declare-fun e!235230 () Bool)

(assert (=> b!388190 (=> (not res!221991) (not e!235230))))

(declare-datatypes ((array!23020 0))(
  ( (array!23021 (arr!10978 (Array (_ BitVec 32) (_ BitVec 64))) (size!11330 (_ BitVec 32))) )
))
(declare-fun lt!182283 () array!23020)

(declare-datatypes ((List!6205 0))(
  ( (Nil!6202) (Cons!6201 (h!7057 (_ BitVec 64)) (t!11347 List!6205)) )
))
(declare-fun arrayNoDuplicates!0 (array!23020 (_ BitVec 32) List!6205) Bool)

(assert (=> b!388190 (= res!221991 (arrayNoDuplicates!0 lt!182283 #b00000000000000000000000000000000 Nil!6202))))

(declare-fun b!388191 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388191 (= e!235230 (not (bvslt i!548 (size!11329 _values!506))))))

(declare-datatypes ((tuple2!6354 0))(
  ( (tuple2!6355 (_1!3188 (_ BitVec 64)) (_2!3188 V!13867)) )
))
(declare-datatypes ((List!6206 0))(
  ( (Nil!6203) (Cons!6202 (h!7058 tuple2!6354) (t!11348 List!6206)) )
))
(declare-datatypes ((ListLongMap!5269 0))(
  ( (ListLongMap!5270 (toList!2650 List!6206)) )
))
(declare-fun lt!182280 () ListLongMap!5269)

(declare-fun lt!182284 () ListLongMap!5269)

(assert (=> b!388191 (and (= lt!182280 lt!182284) (= lt!182284 lt!182280))))

(declare-fun v!373 () V!13867)

(declare-fun lt!182282 () ListLongMap!5269)

(declare-fun +!1004 (ListLongMap!5269 tuple2!6354) ListLongMap!5269)

(assert (=> b!388191 (= lt!182284 (+!1004 lt!182282 (tuple2!6355 k0!778 v!373)))))

(declare-datatypes ((Unit!11875 0))(
  ( (Unit!11876) )
))
(declare-fun lt!182281 () Unit!11875)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13867)

(declare-fun _keys!658 () array!23020)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13867)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!227 (array!23020 array!23018 (_ BitVec 32) (_ BitVec 32) V!13867 V!13867 (_ BitVec 32) (_ BitVec 64) V!13867 (_ BitVec 32) Int) Unit!11875)

(assert (=> b!388191 (= lt!182281 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!227 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!925 (array!23020 array!23018 (_ BitVec 32) (_ BitVec 32) V!13867 V!13867 (_ BitVec 32) Int) ListLongMap!5269)

(assert (=> b!388191 (= lt!182280 (getCurrentListMapNoExtraKeys!925 lt!182283 (array!23019 (store (arr!10977 _values!506) i!548 (ValueCellFull!4442 v!373)) (size!11329 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388191 (= lt!182282 (getCurrentListMapNoExtraKeys!925 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388192 () Bool)

(declare-fun res!221990 () Bool)

(assert (=> b!388192 (=> (not res!221990) (not e!235228))))

(assert (=> b!388192 (= res!221990 (or (= (select (arr!10978 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10978 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388193 () Bool)

(declare-fun res!221984 () Bool)

(assert (=> b!388193 (=> (not res!221984) (not e!235228))))

(assert (=> b!388193 (= res!221984 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11330 _keys!658))))))

(declare-fun b!388194 () Bool)

(declare-fun res!221988 () Bool)

(assert (=> b!388194 (=> (not res!221988) (not e!235228))))

(declare-fun arrayContainsKey!0 (array!23020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388194 (= res!221988 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388188 () Bool)

(assert (=> b!388188 (= e!235228 e!235230)))

(declare-fun res!221986 () Bool)

(assert (=> b!388188 (=> (not res!221986) (not e!235230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23020 (_ BitVec 32)) Bool)

(assert (=> b!388188 (= res!221986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182283 mask!970))))

(assert (=> b!388188 (= lt!182283 (array!23021 (store (arr!10978 _keys!658) i!548 k0!778) (size!11330 _keys!658)))))

(declare-fun res!221992 () Bool)

(assert (=> start!37782 (=> (not res!221992) (not e!235228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37782 (= res!221992 (validMask!0 mask!970))))

(assert (=> start!37782 e!235228))

(declare-fun array_inv!8110 (array!23018) Bool)

(assert (=> start!37782 (and (array_inv!8110 _values!506) e!235226)))

(assert (=> start!37782 tp!31448))

(assert (=> start!37782 true))

(assert (=> start!37782 tp_is_empty!9571))

(declare-fun array_inv!8111 (array!23020) Bool)

(assert (=> start!37782 (array_inv!8111 _keys!658)))

(declare-fun b!388195 () Bool)

(declare-fun res!221989 () Bool)

(assert (=> b!388195 (=> (not res!221989) (not e!235228))))

(assert (=> b!388195 (= res!221989 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6202))))

(declare-fun b!388196 () Bool)

(declare-fun res!221987 () Bool)

(assert (=> b!388196 (=> (not res!221987) (not e!235228))))

(assert (=> b!388196 (= res!221987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388197 () Bool)

(declare-fun res!221993 () Bool)

(assert (=> b!388197 (=> (not res!221993) (not e!235228))))

(assert (=> b!388197 (= res!221993 (and (= (size!11329 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11330 _keys!658) (size!11329 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388198 () Bool)

(assert (=> b!388198 (= e!235225 tp_is_empty!9571)))

(assert (= (and start!37782 res!221992) b!388197))

(assert (= (and b!388197 res!221993) b!388196))

(assert (= (and b!388196 res!221987) b!388195))

(assert (= (and b!388195 res!221989) b!388193))

(assert (= (and b!388193 res!221984) b!388186))

(assert (= (and b!388186 res!221985) b!388192))

(assert (= (and b!388192 res!221990) b!388194))

(assert (= (and b!388194 res!221988) b!388188))

(assert (= (and b!388188 res!221986) b!388190))

(assert (= (and b!388190 res!221991) b!388191))

(assert (= (and b!388189 condMapEmpty!15921) mapIsEmpty!15921))

(assert (= (and b!388189 (not condMapEmpty!15921)) mapNonEmpty!15921))

(get-info :version)

(assert (= (and mapNonEmpty!15921 ((_ is ValueCellFull!4442) mapValue!15921)) b!388198))

(assert (= (and b!388189 ((_ is ValueCellFull!4442) mapDefault!15921)) b!388187))

(assert (= start!37782 b!388189))

(declare-fun m!384419 () Bool)

(assert (=> b!388188 m!384419))

(declare-fun m!384421 () Bool)

(assert (=> b!388188 m!384421))

(declare-fun m!384423 () Bool)

(assert (=> start!37782 m!384423))

(declare-fun m!384425 () Bool)

(assert (=> start!37782 m!384425))

(declare-fun m!384427 () Bool)

(assert (=> start!37782 m!384427))

(declare-fun m!384429 () Bool)

(assert (=> b!388195 m!384429))

(declare-fun m!384431 () Bool)

(assert (=> mapNonEmpty!15921 m!384431))

(declare-fun m!384433 () Bool)

(assert (=> b!388191 m!384433))

(declare-fun m!384435 () Bool)

(assert (=> b!388191 m!384435))

(declare-fun m!384437 () Bool)

(assert (=> b!388191 m!384437))

(declare-fun m!384439 () Bool)

(assert (=> b!388191 m!384439))

(declare-fun m!384441 () Bool)

(assert (=> b!388191 m!384441))

(declare-fun m!384443 () Bool)

(assert (=> b!388196 m!384443))

(declare-fun m!384445 () Bool)

(assert (=> b!388190 m!384445))

(declare-fun m!384447 () Bool)

(assert (=> b!388192 m!384447))

(declare-fun m!384449 () Bool)

(assert (=> b!388194 m!384449))

(declare-fun m!384451 () Bool)

(assert (=> b!388186 m!384451))

(check-sat b_and!16155 (not b!388186) (not b!388194) (not b_next!8899) (not b!388188) (not b!388196) (not b!388191) (not start!37782) (not b!388195) (not b!388190) tp_is_empty!9571 (not mapNonEmpty!15921))
(check-sat b_and!16155 (not b_next!8899))
