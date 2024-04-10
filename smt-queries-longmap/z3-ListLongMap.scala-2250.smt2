; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36964 () Bool)

(assert start!36964)

(declare-fun b_free!8091 () Bool)

(declare-fun b_next!8091 () Bool)

(assert (=> start!36964 (= b_free!8091 (not b_next!8091))))

(declare-fun tp!28989 () Bool)

(declare-fun b_and!15333 () Bool)

(assert (=> start!36964 (= tp!28989 b_and!15333)))

(declare-fun b!370814 () Bool)

(declare-fun res!208319 () Bool)

(declare-fun e!226429 () Bool)

(assert (=> b!370814 (=> (not res!208319) (not e!226429))))

(declare-datatypes ((array!21421 0))(
  ( (array!21422 (arr!10179 (Array (_ BitVec 32) (_ BitVec 64))) (size!10531 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21421)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370814 (= res!208319 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370815 () Bool)

(declare-fun res!208313 () Bool)

(assert (=> b!370815 (=> (not res!208313) (not e!226429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370815 (= res!208313 (validKeyInArray!0 k0!778))))

(declare-fun b!370816 () Bool)

(declare-fun res!208314 () Bool)

(assert (=> b!370816 (=> (not res!208314) (not e!226429))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21421 (_ BitVec 32)) Bool)

(assert (=> b!370816 (= res!208314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370817 () Bool)

(declare-fun res!208310 () Bool)

(declare-fun e!226431 () Bool)

(assert (=> b!370817 (=> (not res!208310) (not e!226431))))

(declare-fun lt!170055 () array!21421)

(declare-datatypes ((List!5693 0))(
  ( (Nil!5690) (Cons!5689 (h!6545 (_ BitVec 64)) (t!10843 List!5693)) )
))
(declare-fun arrayNoDuplicates!0 (array!21421 (_ BitVec 32) List!5693) Bool)

(assert (=> b!370817 (= res!208310 (arrayNoDuplicates!0 lt!170055 #b00000000000000000000000000000000 Nil!5690))))

(declare-fun b!370818 () Bool)

(assert (=> b!370818 (= e!226431 false)))

(declare-datatypes ((V!12757 0))(
  ( (V!12758 (val!4414 Int)) )
))
(declare-datatypes ((ValueCell!4026 0))(
  ( (ValueCellFull!4026 (v!6611 V!12757)) (EmptyCell!4026) )
))
(declare-datatypes ((array!21423 0))(
  ( (array!21424 (arr!10180 (Array (_ BitVec 32) ValueCell!4026)) (size!10532 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21423)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5854 0))(
  ( (tuple2!5855 (_1!2938 (_ BitVec 64)) (_2!2938 V!12757)) )
))
(declare-datatypes ((List!5694 0))(
  ( (Nil!5691) (Cons!5690 (h!6546 tuple2!5854) (t!10844 List!5694)) )
))
(declare-datatypes ((ListLongMap!4767 0))(
  ( (ListLongMap!4768 (toList!2399 List!5694)) )
))
(declare-fun lt!170054 () ListLongMap!4767)

(declare-fun zeroValue!472 () V!12757)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12757)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12757)

(declare-fun getCurrentListMapNoExtraKeys!676 (array!21421 array!21423 (_ BitVec 32) (_ BitVec 32) V!12757 V!12757 (_ BitVec 32) Int) ListLongMap!4767)

(assert (=> b!370818 (= lt!170054 (getCurrentListMapNoExtraKeys!676 lt!170055 (array!21424 (store (arr!10180 _values!506) i!548 (ValueCellFull!4026 v!373)) (size!10532 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170053 () ListLongMap!4767)

(assert (=> b!370818 (= lt!170053 (getCurrentListMapNoExtraKeys!676 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370819 () Bool)

(declare-fun e!226428 () Bool)

(declare-fun tp_is_empty!8739 () Bool)

(assert (=> b!370819 (= e!226428 tp_is_empty!8739)))

(declare-fun b!370820 () Bool)

(declare-fun res!208316 () Bool)

(assert (=> b!370820 (=> (not res!208316) (not e!226429))))

(assert (=> b!370820 (= res!208316 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5690))))

(declare-fun mapNonEmpty!14673 () Bool)

(declare-fun mapRes!14673 () Bool)

(declare-fun tp!28988 () Bool)

(assert (=> mapNonEmpty!14673 (= mapRes!14673 (and tp!28988 e!226428))))

(declare-fun mapKey!14673 () (_ BitVec 32))

(declare-fun mapRest!14673 () (Array (_ BitVec 32) ValueCell!4026))

(declare-fun mapValue!14673 () ValueCell!4026)

(assert (=> mapNonEmpty!14673 (= (arr!10180 _values!506) (store mapRest!14673 mapKey!14673 mapValue!14673))))

(declare-fun mapIsEmpty!14673 () Bool)

(assert (=> mapIsEmpty!14673 mapRes!14673))

(declare-fun b!370821 () Bool)

(declare-fun res!208315 () Bool)

(assert (=> b!370821 (=> (not res!208315) (not e!226429))))

(assert (=> b!370821 (= res!208315 (and (= (size!10532 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10531 _keys!658) (size!10532 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370823 () Bool)

(declare-fun res!208312 () Bool)

(assert (=> b!370823 (=> (not res!208312) (not e!226429))))

(assert (=> b!370823 (= res!208312 (or (= (select (arr!10179 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10179 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370824 () Bool)

(assert (=> b!370824 (= e!226429 e!226431)))

(declare-fun res!208311 () Bool)

(assert (=> b!370824 (=> (not res!208311) (not e!226431))))

(assert (=> b!370824 (= res!208311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170055 mask!970))))

(assert (=> b!370824 (= lt!170055 (array!21422 (store (arr!10179 _keys!658) i!548 k0!778) (size!10531 _keys!658)))))

(declare-fun b!370825 () Bool)

(declare-fun e!226433 () Bool)

(assert (=> b!370825 (= e!226433 tp_is_empty!8739)))

(declare-fun b!370826 () Bool)

(declare-fun res!208317 () Bool)

(assert (=> b!370826 (=> (not res!208317) (not e!226429))))

(assert (=> b!370826 (= res!208317 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10531 _keys!658))))))

(declare-fun res!208318 () Bool)

(assert (=> start!36964 (=> (not res!208318) (not e!226429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36964 (= res!208318 (validMask!0 mask!970))))

(assert (=> start!36964 e!226429))

(declare-fun e!226432 () Bool)

(declare-fun array_inv!7518 (array!21423) Bool)

(assert (=> start!36964 (and (array_inv!7518 _values!506) e!226432)))

(assert (=> start!36964 tp!28989))

(assert (=> start!36964 true))

(assert (=> start!36964 tp_is_empty!8739))

(declare-fun array_inv!7519 (array!21421) Bool)

(assert (=> start!36964 (array_inv!7519 _keys!658)))

(declare-fun b!370822 () Bool)

(assert (=> b!370822 (= e!226432 (and e!226433 mapRes!14673))))

(declare-fun condMapEmpty!14673 () Bool)

(declare-fun mapDefault!14673 () ValueCell!4026)

(assert (=> b!370822 (= condMapEmpty!14673 (= (arr!10180 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4026)) mapDefault!14673)))))

(assert (= (and start!36964 res!208318) b!370821))

(assert (= (and b!370821 res!208315) b!370816))

(assert (= (and b!370816 res!208314) b!370820))

(assert (= (and b!370820 res!208316) b!370826))

(assert (= (and b!370826 res!208317) b!370815))

(assert (= (and b!370815 res!208313) b!370823))

(assert (= (and b!370823 res!208312) b!370814))

(assert (= (and b!370814 res!208319) b!370824))

(assert (= (and b!370824 res!208311) b!370817))

(assert (= (and b!370817 res!208310) b!370818))

(assert (= (and b!370822 condMapEmpty!14673) mapIsEmpty!14673))

(assert (= (and b!370822 (not condMapEmpty!14673)) mapNonEmpty!14673))

(get-info :version)

(assert (= (and mapNonEmpty!14673 ((_ is ValueCellFull!4026) mapValue!14673)) b!370819))

(assert (= (and b!370822 ((_ is ValueCellFull!4026) mapDefault!14673)) b!370825))

(assert (= start!36964 b!370822))

(declare-fun m!366873 () Bool)

(assert (=> b!370824 m!366873))

(declare-fun m!366875 () Bool)

(assert (=> b!370824 m!366875))

(declare-fun m!366877 () Bool)

(assert (=> b!370816 m!366877))

(declare-fun m!366879 () Bool)

(assert (=> mapNonEmpty!14673 m!366879))

(declare-fun m!366881 () Bool)

(assert (=> b!370818 m!366881))

(declare-fun m!366883 () Bool)

(assert (=> b!370818 m!366883))

(declare-fun m!366885 () Bool)

(assert (=> b!370818 m!366885))

(declare-fun m!366887 () Bool)

(assert (=> b!370817 m!366887))

(declare-fun m!366889 () Bool)

(assert (=> b!370814 m!366889))

(declare-fun m!366891 () Bool)

(assert (=> b!370815 m!366891))

(declare-fun m!366893 () Bool)

(assert (=> start!36964 m!366893))

(declare-fun m!366895 () Bool)

(assert (=> start!36964 m!366895))

(declare-fun m!366897 () Bool)

(assert (=> start!36964 m!366897))

(declare-fun m!366899 () Bool)

(assert (=> b!370820 m!366899))

(declare-fun m!366901 () Bool)

(assert (=> b!370823 m!366901))

(check-sat (not b!370816) (not b!370817) (not b!370818) (not b_next!8091) (not b!370820) (not start!36964) (not b!370814) (not b!370824) b_and!15333 tp_is_empty!8739 (not mapNonEmpty!14673) (not b!370815))
(check-sat b_and!15333 (not b_next!8091))
