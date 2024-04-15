; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36780 () Bool)

(assert start!36780)

(declare-fun b!367235 () Bool)

(declare-fun res!205640 () Bool)

(declare-fun e!224727 () Bool)

(assert (=> b!367235 (=> (not res!205640) (not e!224727))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12531 0))(
  ( (V!12532 (val!4329 Int)) )
))
(declare-datatypes ((ValueCell!3941 0))(
  ( (ValueCellFull!3941 (v!6520 V!12531)) (EmptyCell!3941) )
))
(declare-datatypes ((array!21079 0))(
  ( (array!21080 (arr!10008 (Array (_ BitVec 32) ValueCell!3941)) (size!10361 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21079)

(declare-datatypes ((array!21081 0))(
  ( (array!21082 (arr!10009 (Array (_ BitVec 32) (_ BitVec 64))) (size!10362 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21081)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367235 (= res!205640 (and (= (size!10361 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10362 _keys!658) (size!10361 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367236 () Bool)

(declare-fun res!205645 () Bool)

(assert (=> b!367236 (=> (not res!205645) (not e!224727))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367236 (= res!205645 (validKeyInArray!0 k0!778))))

(declare-fun b!367237 () Bool)

(declare-fun res!205644 () Bool)

(assert (=> b!367237 (=> (not res!205644) (not e!224727))))

(declare-fun arrayContainsKey!0 (array!21081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367237 (= res!205644 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!205643 () Bool)

(assert (=> start!36780 (=> (not res!205643) (not e!224727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36780 (= res!205643 (validMask!0 mask!970))))

(assert (=> start!36780 e!224727))

(assert (=> start!36780 true))

(declare-fun e!224724 () Bool)

(declare-fun array_inv!7418 (array!21079) Bool)

(assert (=> start!36780 (and (array_inv!7418 _values!506) e!224724)))

(declare-fun array_inv!7419 (array!21081) Bool)

(assert (=> start!36780 (array_inv!7419 _keys!658)))

(declare-fun b!367238 () Bool)

(declare-fun e!224729 () Bool)

(declare-fun tp_is_empty!8569 () Bool)

(assert (=> b!367238 (= e!224729 tp_is_empty!8569)))

(declare-fun mapIsEmpty!14418 () Bool)

(declare-fun mapRes!14418 () Bool)

(assert (=> mapIsEmpty!14418 mapRes!14418))

(declare-fun b!367239 () Bool)

(assert (=> b!367239 (= e!224724 (and e!224729 mapRes!14418))))

(declare-fun condMapEmpty!14418 () Bool)

(declare-fun mapDefault!14418 () ValueCell!3941)

(assert (=> b!367239 (= condMapEmpty!14418 (= (arr!10008 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3941)) mapDefault!14418)))))

(declare-fun b!367240 () Bool)

(declare-fun res!205639 () Bool)

(assert (=> b!367240 (=> (not res!205639) (not e!224727))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367240 (= res!205639 (or (= (select (arr!10009 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10009 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367241 () Bool)

(declare-fun res!205638 () Bool)

(assert (=> b!367241 (=> (not res!205638) (not e!224727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21081 (_ BitVec 32)) Bool)

(assert (=> b!367241 (= res!205638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367242 () Bool)

(declare-fun res!205641 () Bool)

(assert (=> b!367242 (=> (not res!205641) (not e!224727))))

(declare-datatypes ((List!5534 0))(
  ( (Nil!5531) (Cons!5530 (h!6386 (_ BitVec 64)) (t!10675 List!5534)) )
))
(declare-fun arrayNoDuplicates!0 (array!21081 (_ BitVec 32) List!5534) Bool)

(assert (=> b!367242 (= res!205641 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5531))))

(declare-fun b!367243 () Bool)

(declare-fun e!224726 () Bool)

(assert (=> b!367243 (= e!224726 false)))

(declare-fun lt!169160 () Bool)

(declare-fun lt!169161 () array!21081)

(assert (=> b!367243 (= lt!169160 (arrayNoDuplicates!0 lt!169161 #b00000000000000000000000000000000 Nil!5531))))

(declare-fun b!367244 () Bool)

(declare-fun e!224728 () Bool)

(assert (=> b!367244 (= e!224728 tp_is_empty!8569)))

(declare-fun b!367245 () Bool)

(assert (=> b!367245 (= e!224727 e!224726)))

(declare-fun res!205642 () Bool)

(assert (=> b!367245 (=> (not res!205642) (not e!224726))))

(assert (=> b!367245 (= res!205642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169161 mask!970))))

(assert (=> b!367245 (= lt!169161 (array!21082 (store (arr!10009 _keys!658) i!548 k0!778) (size!10362 _keys!658)))))

(declare-fun mapNonEmpty!14418 () Bool)

(declare-fun tp!28494 () Bool)

(assert (=> mapNonEmpty!14418 (= mapRes!14418 (and tp!28494 e!224728))))

(declare-fun mapRest!14418 () (Array (_ BitVec 32) ValueCell!3941))

(declare-fun mapValue!14418 () ValueCell!3941)

(declare-fun mapKey!14418 () (_ BitVec 32))

(assert (=> mapNonEmpty!14418 (= (arr!10008 _values!506) (store mapRest!14418 mapKey!14418 mapValue!14418))))

(declare-fun b!367246 () Bool)

(declare-fun res!205646 () Bool)

(assert (=> b!367246 (=> (not res!205646) (not e!224727))))

(assert (=> b!367246 (= res!205646 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10362 _keys!658))))))

(assert (= (and start!36780 res!205643) b!367235))

(assert (= (and b!367235 res!205640) b!367241))

(assert (= (and b!367241 res!205638) b!367242))

(assert (= (and b!367242 res!205641) b!367246))

(assert (= (and b!367246 res!205646) b!367236))

(assert (= (and b!367236 res!205645) b!367240))

(assert (= (and b!367240 res!205639) b!367237))

(assert (= (and b!367237 res!205644) b!367245))

(assert (= (and b!367245 res!205642) b!367243))

(assert (= (and b!367239 condMapEmpty!14418) mapIsEmpty!14418))

(assert (= (and b!367239 (not condMapEmpty!14418)) mapNonEmpty!14418))

(get-info :version)

(assert (= (and mapNonEmpty!14418 ((_ is ValueCellFull!3941) mapValue!14418)) b!367244))

(assert (= (and b!367239 ((_ is ValueCellFull!3941) mapDefault!14418)) b!367238))

(assert (= start!36780 b!367239))

(declare-fun m!363743 () Bool)

(assert (=> b!367240 m!363743))

(declare-fun m!363745 () Bool)

(assert (=> b!367243 m!363745))

(declare-fun m!363747 () Bool)

(assert (=> mapNonEmpty!14418 m!363747))

(declare-fun m!363749 () Bool)

(assert (=> b!367241 m!363749))

(declare-fun m!363751 () Bool)

(assert (=> b!367242 m!363751))

(declare-fun m!363753 () Bool)

(assert (=> start!36780 m!363753))

(declare-fun m!363755 () Bool)

(assert (=> start!36780 m!363755))

(declare-fun m!363757 () Bool)

(assert (=> start!36780 m!363757))

(declare-fun m!363759 () Bool)

(assert (=> b!367237 m!363759))

(declare-fun m!363761 () Bool)

(assert (=> b!367236 m!363761))

(declare-fun m!363763 () Bool)

(assert (=> b!367245 m!363763))

(declare-fun m!363765 () Bool)

(assert (=> b!367245 m!363765))

(check-sat (not b!367243) (not start!36780) (not b!367236) (not b!367241) (not b!367242) (not b!367237) (not b!367245) tp_is_empty!8569 (not mapNonEmpty!14418))
(check-sat)
