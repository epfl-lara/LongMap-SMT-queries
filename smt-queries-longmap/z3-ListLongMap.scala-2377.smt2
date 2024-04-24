; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37710 () Bool)

(assert start!37710)

(declare-fun b_free!8827 () Bool)

(declare-fun b_next!8827 () Bool)

(assert (=> start!37710 (= b_free!8827 (not b_next!8827))))

(declare-fun tp!31233 () Bool)

(declare-fun b_and!16083 () Bool)

(assert (=> start!37710 (= tp!31233 b_and!16083)))

(declare-fun b!386782 () Bool)

(declare-fun e!234579 () Bool)

(assert (=> b!386782 (= e!234579 false)))

(declare-datatypes ((V!13771 0))(
  ( (V!13772 (val!4794 Int)) )
))
(declare-datatypes ((ValueCell!4406 0))(
  ( (ValueCellFull!4406 (v!6992 V!13771)) (EmptyCell!4406) )
))
(declare-datatypes ((array!22884 0))(
  ( (array!22885 (arr!10910 (Array (_ BitVec 32) ValueCell!4406)) (size!11262 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22884)

(declare-datatypes ((tuple2!6310 0))(
  ( (tuple2!6311 (_1!3166 (_ BitVec 64)) (_2!3166 V!13771)) )
))
(declare-datatypes ((List!6158 0))(
  ( (Nil!6155) (Cons!6154 (h!7010 tuple2!6310) (t!11300 List!6158)) )
))
(declare-datatypes ((ListLongMap!5225 0))(
  ( (ListLongMap!5226 (toList!2628 List!6158)) )
))
(declare-fun lt!181916 () ListLongMap!5225)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!22886 0))(
  ( (array!22887 (arr!10911 (Array (_ BitVec 32) (_ BitVec 64))) (size!11263 (_ BitVec 32))) )
))
(declare-fun lt!181918 () array!22886)

(declare-fun zeroValue!472 () V!13771)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13771)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13771)

(declare-fun getCurrentListMapNoExtraKeys!903 (array!22886 array!22884 (_ BitVec 32) (_ BitVec 32) V!13771 V!13771 (_ BitVec 32) Int) ListLongMap!5225)

(assert (=> b!386782 (= lt!181916 (getCurrentListMapNoExtraKeys!903 lt!181918 (array!22885 (store (arr!10910 _values!506) i!548 (ValueCellFull!4406 v!373)) (size!11262 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181917 () ListLongMap!5225)

(declare-fun _keys!658 () array!22886)

(assert (=> b!386782 (= lt!181917 (getCurrentListMapNoExtraKeys!903 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386783 () Bool)

(declare-fun e!234581 () Bool)

(declare-fun tp_is_empty!9499 () Bool)

(assert (=> b!386783 (= e!234581 tp_is_empty!9499)))

(declare-fun b!386784 () Bool)

(declare-fun res!220910 () Bool)

(declare-fun e!234577 () Bool)

(assert (=> b!386784 (=> (not res!220910) (not e!234577))))

(assert (=> b!386784 (= res!220910 (and (= (size!11262 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11263 _keys!658) (size!11262 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386785 () Bool)

(declare-fun res!220911 () Bool)

(assert (=> b!386785 (=> (not res!220911) (not e!234577))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386785 (= res!220911 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15813 () Bool)

(declare-fun mapRes!15813 () Bool)

(declare-fun tp!31232 () Bool)

(declare-fun e!234580 () Bool)

(assert (=> mapNonEmpty!15813 (= mapRes!15813 (and tp!31232 e!234580))))

(declare-fun mapRest!15813 () (Array (_ BitVec 32) ValueCell!4406))

(declare-fun mapValue!15813 () ValueCell!4406)

(declare-fun mapKey!15813 () (_ BitVec 32))

(assert (=> mapNonEmpty!15813 (= (arr!10910 _values!506) (store mapRest!15813 mapKey!15813 mapValue!15813))))

(declare-fun b!386786 () Bool)

(declare-fun res!220906 () Bool)

(assert (=> b!386786 (=> (not res!220906) (not e!234577))))

(declare-datatypes ((List!6159 0))(
  ( (Nil!6156) (Cons!6155 (h!7011 (_ BitVec 64)) (t!11301 List!6159)) )
))
(declare-fun arrayNoDuplicates!0 (array!22886 (_ BitVec 32) List!6159) Bool)

(assert (=> b!386786 (= res!220906 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6156))))

(declare-fun b!386787 () Bool)

(assert (=> b!386787 (= e!234580 tp_is_empty!9499)))

(declare-fun b!386788 () Bool)

(assert (=> b!386788 (= e!234577 e!234579)))

(declare-fun res!220904 () Bool)

(assert (=> b!386788 (=> (not res!220904) (not e!234579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22886 (_ BitVec 32)) Bool)

(assert (=> b!386788 (= res!220904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181918 mask!970))))

(assert (=> b!386788 (= lt!181918 (array!22887 (store (arr!10911 _keys!658) i!548 k0!778) (size!11263 _keys!658)))))

(declare-fun b!386789 () Bool)

(declare-fun res!220913 () Bool)

(assert (=> b!386789 (=> (not res!220913) (not e!234577))))

(assert (=> b!386789 (= res!220913 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11263 _keys!658))))))

(declare-fun b!386790 () Bool)

(declare-fun res!220905 () Bool)

(assert (=> b!386790 (=> (not res!220905) (not e!234579))))

(assert (=> b!386790 (= res!220905 (arrayNoDuplicates!0 lt!181918 #b00000000000000000000000000000000 Nil!6156))))

(declare-fun b!386791 () Bool)

(declare-fun e!234578 () Bool)

(assert (=> b!386791 (= e!234578 (and e!234581 mapRes!15813))))

(declare-fun condMapEmpty!15813 () Bool)

(declare-fun mapDefault!15813 () ValueCell!4406)

(assert (=> b!386791 (= condMapEmpty!15813 (= (arr!10910 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4406)) mapDefault!15813)))))

(declare-fun b!386792 () Bool)

(declare-fun res!220909 () Bool)

(assert (=> b!386792 (=> (not res!220909) (not e!234577))))

(assert (=> b!386792 (= res!220909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386793 () Bool)

(declare-fun res!220907 () Bool)

(assert (=> b!386793 (=> (not res!220907) (not e!234577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386793 (= res!220907 (validKeyInArray!0 k0!778))))

(declare-fun b!386794 () Bool)

(declare-fun res!220908 () Bool)

(assert (=> b!386794 (=> (not res!220908) (not e!234577))))

(assert (=> b!386794 (= res!220908 (or (= (select (arr!10911 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10911 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!220912 () Bool)

(assert (=> start!37710 (=> (not res!220912) (not e!234577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37710 (= res!220912 (validMask!0 mask!970))))

(assert (=> start!37710 e!234577))

(declare-fun array_inv!8062 (array!22884) Bool)

(assert (=> start!37710 (and (array_inv!8062 _values!506) e!234578)))

(assert (=> start!37710 tp!31233))

(assert (=> start!37710 true))

(assert (=> start!37710 tp_is_empty!9499))

(declare-fun array_inv!8063 (array!22886) Bool)

(assert (=> start!37710 (array_inv!8063 _keys!658)))

(declare-fun mapIsEmpty!15813 () Bool)

(assert (=> mapIsEmpty!15813 mapRes!15813))

(assert (= (and start!37710 res!220912) b!386784))

(assert (= (and b!386784 res!220910) b!386792))

(assert (= (and b!386792 res!220909) b!386786))

(assert (= (and b!386786 res!220906) b!386789))

(assert (= (and b!386789 res!220913) b!386793))

(assert (= (and b!386793 res!220907) b!386794))

(assert (= (and b!386794 res!220908) b!386785))

(assert (= (and b!386785 res!220911) b!386788))

(assert (= (and b!386788 res!220904) b!386790))

(assert (= (and b!386790 res!220905) b!386782))

(assert (= (and b!386791 condMapEmpty!15813) mapIsEmpty!15813))

(assert (= (and b!386791 (not condMapEmpty!15813)) mapNonEmpty!15813))

(get-info :version)

(assert (= (and mapNonEmpty!15813 ((_ is ValueCellFull!4406) mapValue!15813)) b!386787))

(assert (= (and b!386791 ((_ is ValueCellFull!4406) mapDefault!15813)) b!386783))

(assert (= start!37710 b!386791))

(declare-fun m!383315 () Bool)

(assert (=> b!386782 m!383315))

(declare-fun m!383317 () Bool)

(assert (=> b!386782 m!383317))

(declare-fun m!383319 () Bool)

(assert (=> b!386782 m!383319))

(declare-fun m!383321 () Bool)

(assert (=> b!386788 m!383321))

(declare-fun m!383323 () Bool)

(assert (=> b!386788 m!383323))

(declare-fun m!383325 () Bool)

(assert (=> b!386790 m!383325))

(declare-fun m!383327 () Bool)

(assert (=> b!386785 m!383327))

(declare-fun m!383329 () Bool)

(assert (=> mapNonEmpty!15813 m!383329))

(declare-fun m!383331 () Bool)

(assert (=> start!37710 m!383331))

(declare-fun m!383333 () Bool)

(assert (=> start!37710 m!383333))

(declare-fun m!383335 () Bool)

(assert (=> start!37710 m!383335))

(declare-fun m!383337 () Bool)

(assert (=> b!386794 m!383337))

(declare-fun m!383339 () Bool)

(assert (=> b!386793 m!383339))

(declare-fun m!383341 () Bool)

(assert (=> b!386786 m!383341))

(declare-fun m!383343 () Bool)

(assert (=> b!386792 m!383343))

(check-sat (not b_next!8827) b_and!16083 (not b!386786) (not b!386793) (not b!386788) (not mapNonEmpty!15813) tp_is_empty!9499 (not b!386792) (not start!37710) (not b!386782) (not b!386785) (not b!386790))
(check-sat b_and!16083 (not b_next!8827))
