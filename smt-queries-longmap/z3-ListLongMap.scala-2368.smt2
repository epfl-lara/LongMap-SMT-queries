; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37656 () Bool)

(assert start!37656)

(declare-fun b_free!8773 () Bool)

(declare-fun b_next!8773 () Bool)

(assert (=> start!37656 (= b_free!8773 (not b_next!8773))))

(declare-fun tp!31071 () Bool)

(declare-fun b_and!15989 () Bool)

(assert (=> start!37656 (= tp!31071 b_and!15989)))

(declare-fun mapNonEmpty!15732 () Bool)

(declare-fun mapRes!15732 () Bool)

(declare-fun tp!31070 () Bool)

(declare-fun e!233949 () Bool)

(assert (=> mapNonEmpty!15732 (= mapRes!15732 (and tp!31070 e!233949))))

(declare-datatypes ((V!13699 0))(
  ( (V!13700 (val!4767 Int)) )
))
(declare-datatypes ((ValueCell!4379 0))(
  ( (ValueCellFull!4379 (v!6958 V!13699)) (EmptyCell!4379) )
))
(declare-fun mapValue!15732 () ValueCell!4379)

(declare-fun mapKey!15732 () (_ BitVec 32))

(declare-fun mapRest!15732 () (Array (_ BitVec 32) ValueCell!4379))

(declare-datatypes ((array!22775 0))(
  ( (array!22776 (arr!10856 (Array (_ BitVec 32) ValueCell!4379)) (size!11209 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22775)

(assert (=> mapNonEmpty!15732 (= (arr!10856 _values!506) (store mapRest!15732 mapKey!15732 mapValue!15732))))

(declare-fun b!385507 () Bool)

(declare-fun e!233953 () Bool)

(declare-fun tp_is_empty!9445 () Bool)

(assert (=> b!385507 (= e!233953 tp_is_empty!9445)))

(declare-fun b!385508 () Bool)

(declare-fun e!233952 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385508 (= e!233952 (bvsge i!548 (size!11209 _values!506)))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((tuple2!6392 0))(
  ( (tuple2!6393 (_1!3207 (_ BitVec 64)) (_2!3207 V!13699)) )
))
(declare-datatypes ((List!6223 0))(
  ( (Nil!6220) (Cons!6219 (h!7075 tuple2!6392) (t!11364 List!6223)) )
))
(declare-datatypes ((ListLongMap!5295 0))(
  ( (ListLongMap!5296 (toList!2663 List!6223)) )
))
(declare-fun lt!181428 () ListLongMap!5295)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13699)

(declare-datatypes ((array!22777 0))(
  ( (array!22778 (arr!10857 (Array (_ BitVec 32) (_ BitVec 64))) (size!11210 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22777)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13699)

(declare-fun getCurrentListMapNoExtraKeys!903 (array!22777 array!22775 (_ BitVec 32) (_ BitVec 32) V!13699 V!13699 (_ BitVec 32) Int) ListLongMap!5295)

(assert (=> b!385508 (= lt!181428 (getCurrentListMapNoExtraKeys!903 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385509 () Bool)

(declare-fun res!219971 () Bool)

(declare-fun e!233951 () Bool)

(assert (=> b!385509 (=> (not res!219971) (not e!233951))))

(assert (=> b!385509 (= res!219971 (or (= (select (arr!10857 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10857 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385510 () Bool)

(declare-fun res!219968 () Bool)

(assert (=> b!385510 (=> (not res!219968) (not e!233951))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385510 (= res!219968 (validKeyInArray!0 k0!778))))

(declare-fun b!385511 () Bool)

(declare-fun res!219973 () Bool)

(assert (=> b!385511 (=> (not res!219973) (not e!233951))))

(declare-datatypes ((List!6224 0))(
  ( (Nil!6221) (Cons!6220 (h!7076 (_ BitVec 64)) (t!11365 List!6224)) )
))
(declare-fun arrayNoDuplicates!0 (array!22777 (_ BitVec 32) List!6224) Bool)

(assert (=> b!385511 (= res!219973 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6221))))

(declare-fun b!385512 () Bool)

(assert (=> b!385512 (= e!233949 tp_is_empty!9445)))

(declare-fun b!385513 () Bool)

(declare-fun res!219975 () Bool)

(assert (=> b!385513 (=> (not res!219975) (not e!233951))))

(assert (=> b!385513 (= res!219975 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11210 _keys!658))))))

(declare-fun b!385514 () Bool)

(declare-fun res!219976 () Bool)

(assert (=> b!385514 (=> (not res!219976) (not e!233952))))

(declare-fun lt!181427 () array!22777)

(assert (=> b!385514 (= res!219976 (arrayNoDuplicates!0 lt!181427 #b00000000000000000000000000000000 Nil!6221))))

(declare-fun b!385515 () Bool)

(declare-fun res!219969 () Bool)

(assert (=> b!385515 (=> (not res!219969) (not e!233951))))

(declare-fun arrayContainsKey!0 (array!22777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385515 (= res!219969 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385516 () Bool)

(declare-fun res!219977 () Bool)

(assert (=> b!385516 (=> (not res!219977) (not e!233951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22777 (_ BitVec 32)) Bool)

(assert (=> b!385516 (= res!219977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385517 () Bool)

(declare-fun res!219970 () Bool)

(assert (=> b!385517 (=> (not res!219970) (not e!233951))))

(assert (=> b!385517 (= res!219970 (and (= (size!11209 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11210 _keys!658) (size!11209 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15732 () Bool)

(assert (=> mapIsEmpty!15732 mapRes!15732))

(declare-fun b!385518 () Bool)

(declare-fun e!233950 () Bool)

(assert (=> b!385518 (= e!233950 (and e!233953 mapRes!15732))))

(declare-fun condMapEmpty!15732 () Bool)

(declare-fun mapDefault!15732 () ValueCell!4379)

(assert (=> b!385518 (= condMapEmpty!15732 (= (arr!10856 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4379)) mapDefault!15732)))))

(declare-fun res!219974 () Bool)

(assert (=> start!37656 (=> (not res!219974) (not e!233951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37656 (= res!219974 (validMask!0 mask!970))))

(assert (=> start!37656 e!233951))

(assert (=> start!37656 true))

(declare-fun array_inv!7990 (array!22775) Bool)

(assert (=> start!37656 (and (array_inv!7990 _values!506) e!233950)))

(assert (=> start!37656 tp!31071))

(assert (=> start!37656 tp_is_empty!9445))

(declare-fun array_inv!7991 (array!22777) Bool)

(assert (=> start!37656 (array_inv!7991 _keys!658)))

(declare-fun b!385519 () Bool)

(assert (=> b!385519 (= e!233951 e!233952)))

(declare-fun res!219972 () Bool)

(assert (=> b!385519 (=> (not res!219972) (not e!233952))))

(assert (=> b!385519 (= res!219972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181427 mask!970))))

(assert (=> b!385519 (= lt!181427 (array!22778 (store (arr!10857 _keys!658) i!548 k0!778) (size!11210 _keys!658)))))

(assert (= (and start!37656 res!219974) b!385517))

(assert (= (and b!385517 res!219970) b!385516))

(assert (= (and b!385516 res!219977) b!385511))

(assert (= (and b!385511 res!219973) b!385513))

(assert (= (and b!385513 res!219975) b!385510))

(assert (= (and b!385510 res!219968) b!385509))

(assert (= (and b!385509 res!219971) b!385515))

(assert (= (and b!385515 res!219969) b!385519))

(assert (= (and b!385519 res!219972) b!385514))

(assert (= (and b!385514 res!219976) b!385508))

(assert (= (and b!385518 condMapEmpty!15732) mapIsEmpty!15732))

(assert (= (and b!385518 (not condMapEmpty!15732)) mapNonEmpty!15732))

(get-info :version)

(assert (= (and mapNonEmpty!15732 ((_ is ValueCellFull!4379) mapValue!15732)) b!385512))

(assert (= (and b!385518 ((_ is ValueCellFull!4379) mapDefault!15732)) b!385507))

(assert (= start!37656 b!385518))

(declare-fun m!381563 () Bool)

(assert (=> mapNonEmpty!15732 m!381563))

(declare-fun m!381565 () Bool)

(assert (=> b!385514 m!381565))

(declare-fun m!381567 () Bool)

(assert (=> b!385516 m!381567))

(declare-fun m!381569 () Bool)

(assert (=> b!385519 m!381569))

(declare-fun m!381571 () Bool)

(assert (=> b!385519 m!381571))

(declare-fun m!381573 () Bool)

(assert (=> b!385515 m!381573))

(declare-fun m!381575 () Bool)

(assert (=> b!385509 m!381575))

(declare-fun m!381577 () Bool)

(assert (=> b!385511 m!381577))

(declare-fun m!381579 () Bool)

(assert (=> b!385510 m!381579))

(declare-fun m!381581 () Bool)

(assert (=> start!37656 m!381581))

(declare-fun m!381583 () Bool)

(assert (=> start!37656 m!381583))

(declare-fun m!381585 () Bool)

(assert (=> start!37656 m!381585))

(declare-fun m!381587 () Bool)

(assert (=> b!385508 m!381587))

(check-sat b_and!15989 (not b!385514) tp_is_empty!9445 (not b!385515) (not b!385519) (not b!385508) (not b!385516) (not mapNonEmpty!15732) (not b!385510) (not b!385511) (not start!37656) (not b_next!8773))
(check-sat b_and!15989 (not b_next!8773))
