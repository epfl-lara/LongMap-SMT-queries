; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37240 () Bool)

(assert start!37240)

(declare-fun b_free!8367 () Bool)

(declare-fun b_next!8367 () Bool)

(assert (=> start!37240 (= b_free!8367 (not b_next!8367))))

(declare-fun tp!29816 () Bool)

(declare-fun b_and!15609 () Bool)

(assert (=> start!37240 (= tp!29816 b_and!15609)))

(declare-fun mapIsEmpty!15087 () Bool)

(declare-fun mapRes!15087 () Bool)

(assert (=> mapIsEmpty!15087 mapRes!15087))

(declare-fun res!212963 () Bool)

(declare-fun e!229405 () Bool)

(assert (=> start!37240 (=> (not res!212963) (not e!229405))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37240 (= res!212963 (validMask!0 mask!970))))

(assert (=> start!37240 e!229405))

(declare-datatypes ((V!13125 0))(
  ( (V!13126 (val!4552 Int)) )
))
(declare-datatypes ((ValueCell!4164 0))(
  ( (ValueCellFull!4164 (v!6749 V!13125)) (EmptyCell!4164) )
))
(declare-datatypes ((array!21959 0))(
  ( (array!21960 (arr!10448 (Array (_ BitVec 32) ValueCell!4164)) (size!10800 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21959)

(declare-fun e!229406 () Bool)

(declare-fun array_inv!7702 (array!21959) Bool)

(assert (=> start!37240 (and (array_inv!7702 _values!506) e!229406)))

(assert (=> start!37240 tp!29816))

(assert (=> start!37240 true))

(declare-fun tp_is_empty!9015 () Bool)

(assert (=> start!37240 tp_is_empty!9015))

(declare-datatypes ((array!21961 0))(
  ( (array!21962 (arr!10449 (Array (_ BitVec 32) (_ BitVec 64))) (size!10801 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21961)

(declare-fun array_inv!7703 (array!21961) Bool)

(assert (=> start!37240 (array_inv!7703 _keys!658)))

(declare-fun b!376701 () Bool)

(declare-fun res!212959 () Bool)

(assert (=> b!376701 (=> (not res!212959) (not e!229405))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376701 (= res!212959 (validKeyInArray!0 k0!778))))

(declare-fun b!376702 () Bool)

(declare-fun res!212966 () Bool)

(assert (=> b!376702 (=> (not res!212966) (not e!229405))))

(declare-fun arrayContainsKey!0 (array!21961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376702 (= res!212966 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376703 () Bool)

(declare-fun res!212965 () Bool)

(assert (=> b!376703 (=> (not res!212965) (not e!229405))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376703 (= res!212965 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10801 _keys!658))))))

(declare-fun b!376704 () Bool)

(declare-fun res!212956 () Bool)

(assert (=> b!376704 (=> (not res!212956) (not e!229405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21961 (_ BitVec 32)) Bool)

(assert (=> b!376704 (= res!212956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15087 () Bool)

(declare-fun tp!29817 () Bool)

(declare-fun e!229403 () Bool)

(assert (=> mapNonEmpty!15087 (= mapRes!15087 (and tp!29817 e!229403))))

(declare-fun mapValue!15087 () ValueCell!4164)

(declare-fun mapKey!15087 () (_ BitVec 32))

(declare-fun mapRest!15087 () (Array (_ BitVec 32) ValueCell!4164))

(assert (=> mapNonEmpty!15087 (= (arr!10448 _values!506) (store mapRest!15087 mapKey!15087 mapValue!15087))))

(declare-fun b!376705 () Bool)

(declare-fun e!229404 () Bool)

(assert (=> b!376705 (= e!229406 (and e!229404 mapRes!15087))))

(declare-fun condMapEmpty!15087 () Bool)

(declare-fun mapDefault!15087 () ValueCell!4164)

(assert (=> b!376705 (= condMapEmpty!15087 (= (arr!10448 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4164)) mapDefault!15087)))))

(declare-fun b!376706 () Bool)

(assert (=> b!376706 (= e!229403 tp_is_empty!9015)))

(declare-fun b!376707 () Bool)

(assert (=> b!376707 (= e!229404 tp_is_empty!9015)))

(declare-fun b!376708 () Bool)

(declare-fun e!229402 () Bool)

(declare-fun e!229399 () Bool)

(assert (=> b!376708 (= e!229402 e!229399)))

(declare-fun res!212955 () Bool)

(assert (=> b!376708 (=> res!212955 e!229399)))

(assert (=> b!376708 (= res!212955 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6062 0))(
  ( (tuple2!6063 (_1!3042 (_ BitVec 64)) (_2!3042 V!13125)) )
))
(declare-datatypes ((List!5904 0))(
  ( (Nil!5901) (Cons!5900 (h!6756 tuple2!6062) (t!11054 List!5904)) )
))
(declare-datatypes ((ListLongMap!4975 0))(
  ( (ListLongMap!4976 (toList!2503 List!5904)) )
))
(declare-fun lt!174860 () ListLongMap!4975)

(declare-fun lt!174859 () ListLongMap!4975)

(assert (=> b!376708 (= lt!174860 lt!174859)))

(declare-fun lt!174864 () ListLongMap!4975)

(declare-fun lt!174867 () tuple2!6062)

(declare-fun +!849 (ListLongMap!4975 tuple2!6062) ListLongMap!4975)

(assert (=> b!376708 (= lt!174859 (+!849 lt!174864 lt!174867))))

(declare-fun lt!174863 () ListLongMap!4975)

(declare-fun lt!174855 () ListLongMap!4975)

(assert (=> b!376708 (= lt!174863 lt!174855)))

(declare-fun lt!174866 () ListLongMap!4975)

(assert (=> b!376708 (= lt!174855 (+!849 lt!174866 lt!174867))))

(declare-fun lt!174862 () ListLongMap!4975)

(assert (=> b!376708 (= lt!174860 (+!849 lt!174862 lt!174867))))

(declare-fun zeroValue!472 () V!13125)

(assert (=> b!376708 (= lt!174867 (tuple2!6063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376709 () Bool)

(declare-fun e!229401 () Bool)

(assert (=> b!376709 (= e!229401 (not e!229402))))

(declare-fun res!212961 () Bool)

(assert (=> b!376709 (=> res!212961 e!229402)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376709 (= res!212961 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13125)

(declare-fun getCurrentListMap!1937 (array!21961 array!21959 (_ BitVec 32) (_ BitVec 32) V!13125 V!13125 (_ BitVec 32) Int) ListLongMap!4975)

(assert (=> b!376709 (= lt!174863 (getCurrentListMap!1937 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174857 () array!21961)

(declare-fun lt!174865 () array!21959)

(assert (=> b!376709 (= lt!174860 (getCurrentListMap!1937 lt!174857 lt!174865 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376709 (and (= lt!174862 lt!174864) (= lt!174864 lt!174862))))

(declare-fun lt!174858 () tuple2!6062)

(assert (=> b!376709 (= lt!174864 (+!849 lt!174866 lt!174858))))

(declare-fun v!373 () V!13125)

(assert (=> b!376709 (= lt!174858 (tuple2!6063 k0!778 v!373))))

(declare-datatypes ((Unit!11604 0))(
  ( (Unit!11605) )
))
(declare-fun lt!174861 () Unit!11604)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!95 (array!21961 array!21959 (_ BitVec 32) (_ BitVec 32) V!13125 V!13125 (_ BitVec 32) (_ BitVec 64) V!13125 (_ BitVec 32) Int) Unit!11604)

(assert (=> b!376709 (= lt!174861 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!95 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!771 (array!21961 array!21959 (_ BitVec 32) (_ BitVec 32) V!13125 V!13125 (_ BitVec 32) Int) ListLongMap!4975)

(assert (=> b!376709 (= lt!174862 (getCurrentListMapNoExtraKeys!771 lt!174857 lt!174865 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376709 (= lt!174865 (array!21960 (store (arr!10448 _values!506) i!548 (ValueCellFull!4164 v!373)) (size!10800 _values!506)))))

(assert (=> b!376709 (= lt!174866 (getCurrentListMapNoExtraKeys!771 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376710 () Bool)

(declare-fun res!212962 () Bool)

(assert (=> b!376710 (=> (not res!212962) (not e!229401))))

(declare-datatypes ((List!5905 0))(
  ( (Nil!5902) (Cons!5901 (h!6757 (_ BitVec 64)) (t!11055 List!5905)) )
))
(declare-fun arrayNoDuplicates!0 (array!21961 (_ BitVec 32) List!5905) Bool)

(assert (=> b!376710 (= res!212962 (arrayNoDuplicates!0 lt!174857 #b00000000000000000000000000000000 Nil!5902))))

(declare-fun b!376711 () Bool)

(assert (=> b!376711 (= e!229405 e!229401)))

(declare-fun res!212957 () Bool)

(assert (=> b!376711 (=> (not res!212957) (not e!229401))))

(assert (=> b!376711 (= res!212957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174857 mask!970))))

(assert (=> b!376711 (= lt!174857 (array!21962 (store (arr!10449 _keys!658) i!548 k0!778) (size!10801 _keys!658)))))

(declare-fun b!376712 () Bool)

(assert (=> b!376712 (= e!229399 true)))

(assert (=> b!376712 (= lt!174859 (+!849 lt!174855 lt!174858))))

(declare-fun lt!174856 () Unit!11604)

(declare-fun addCommutativeForDiffKeys!262 (ListLongMap!4975 (_ BitVec 64) V!13125 (_ BitVec 64) V!13125) Unit!11604)

(assert (=> b!376712 (= lt!174856 (addCommutativeForDiffKeys!262 lt!174866 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376713 () Bool)

(declare-fun res!212958 () Bool)

(assert (=> b!376713 (=> (not res!212958) (not e!229405))))

(assert (=> b!376713 (= res!212958 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5902))))

(declare-fun b!376714 () Bool)

(declare-fun res!212960 () Bool)

(assert (=> b!376714 (=> (not res!212960) (not e!229405))))

(assert (=> b!376714 (= res!212960 (or (= (select (arr!10449 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10449 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376715 () Bool)

(declare-fun res!212964 () Bool)

(assert (=> b!376715 (=> (not res!212964) (not e!229405))))

(assert (=> b!376715 (= res!212964 (and (= (size!10800 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10801 _keys!658) (size!10800 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37240 res!212963) b!376715))

(assert (= (and b!376715 res!212964) b!376704))

(assert (= (and b!376704 res!212956) b!376713))

(assert (= (and b!376713 res!212958) b!376703))

(assert (= (and b!376703 res!212965) b!376701))

(assert (= (and b!376701 res!212959) b!376714))

(assert (= (and b!376714 res!212960) b!376702))

(assert (= (and b!376702 res!212966) b!376711))

(assert (= (and b!376711 res!212957) b!376710))

(assert (= (and b!376710 res!212962) b!376709))

(assert (= (and b!376709 (not res!212961)) b!376708))

(assert (= (and b!376708 (not res!212955)) b!376712))

(assert (= (and b!376705 condMapEmpty!15087) mapIsEmpty!15087))

(assert (= (and b!376705 (not condMapEmpty!15087)) mapNonEmpty!15087))

(get-info :version)

(assert (= (and mapNonEmpty!15087 ((_ is ValueCellFull!4164) mapValue!15087)) b!376706))

(assert (= (and b!376705 ((_ is ValueCellFull!4164) mapDefault!15087)) b!376707))

(assert (= start!37240 b!376705))

(declare-fun m!373419 () Bool)

(assert (=> b!376714 m!373419))

(declare-fun m!373421 () Bool)

(assert (=> b!376708 m!373421))

(declare-fun m!373423 () Bool)

(assert (=> b!376708 m!373423))

(declare-fun m!373425 () Bool)

(assert (=> b!376708 m!373425))

(declare-fun m!373427 () Bool)

(assert (=> b!376704 m!373427))

(declare-fun m!373429 () Bool)

(assert (=> mapNonEmpty!15087 m!373429))

(declare-fun m!373431 () Bool)

(assert (=> b!376713 m!373431))

(declare-fun m!373433 () Bool)

(assert (=> b!376702 m!373433))

(declare-fun m!373435 () Bool)

(assert (=> b!376711 m!373435))

(declare-fun m!373437 () Bool)

(assert (=> b!376711 m!373437))

(declare-fun m!373439 () Bool)

(assert (=> b!376709 m!373439))

(declare-fun m!373441 () Bool)

(assert (=> b!376709 m!373441))

(declare-fun m!373443 () Bool)

(assert (=> b!376709 m!373443))

(declare-fun m!373445 () Bool)

(assert (=> b!376709 m!373445))

(declare-fun m!373447 () Bool)

(assert (=> b!376709 m!373447))

(declare-fun m!373449 () Bool)

(assert (=> b!376709 m!373449))

(declare-fun m!373451 () Bool)

(assert (=> b!376709 m!373451))

(declare-fun m!373453 () Bool)

(assert (=> b!376710 m!373453))

(declare-fun m!373455 () Bool)

(assert (=> b!376701 m!373455))

(declare-fun m!373457 () Bool)

(assert (=> b!376712 m!373457))

(declare-fun m!373459 () Bool)

(assert (=> b!376712 m!373459))

(declare-fun m!373461 () Bool)

(assert (=> start!37240 m!373461))

(declare-fun m!373463 () Bool)

(assert (=> start!37240 m!373463))

(declare-fun m!373465 () Bool)

(assert (=> start!37240 m!373465))

(check-sat (not b!376708) (not b!376701) b_and!15609 (not b!376712) (not b!376713) (not b!376709) (not b!376711) (not mapNonEmpty!15087) (not start!37240) (not b!376702) tp_is_empty!9015 (not b!376710) (not b_next!8367) (not b!376704))
(check-sat b_and!15609 (not b_next!8367))
