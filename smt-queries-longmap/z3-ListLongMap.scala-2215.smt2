; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36738 () Bool)

(assert start!36738)

(declare-fun b!366479 () Bool)

(declare-fun e!224350 () Bool)

(declare-fun e!224346 () Bool)

(assert (=> b!366479 (= e!224350 e!224346)))

(declare-fun res!205075 () Bool)

(assert (=> b!366479 (=> (not res!205075) (not e!224346))))

(declare-datatypes ((array!20999 0))(
  ( (array!21000 (arr!9968 (Array (_ BitVec 32) (_ BitVec 64))) (size!10321 (_ BitVec 32))) )
))
(declare-fun lt!169035 () array!20999)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20999 (_ BitVec 32)) Bool)

(assert (=> b!366479 (= res!205075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169035 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!20999)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366479 (= lt!169035 (array!21000 (store (arr!9968 _keys!658) i!548 k0!778) (size!10321 _keys!658)))))

(declare-fun b!366480 () Bool)

(declare-fun res!205079 () Bool)

(assert (=> b!366480 (=> (not res!205079) (not e!224350))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12475 0))(
  ( (V!12476 (val!4308 Int)) )
))
(declare-datatypes ((ValueCell!3920 0))(
  ( (ValueCellFull!3920 (v!6499 V!12475)) (EmptyCell!3920) )
))
(declare-datatypes ((array!21001 0))(
  ( (array!21002 (arr!9969 (Array (_ BitVec 32) ValueCell!3920)) (size!10322 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21001)

(assert (=> b!366480 (= res!205079 (and (= (size!10322 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10321 _keys!658) (size!10322 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366481 () Bool)

(declare-fun res!205074 () Bool)

(assert (=> b!366481 (=> (not res!205074) (not e!224350))))

(assert (=> b!366481 (= res!205074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366482 () Bool)

(declare-fun res!205078 () Bool)

(assert (=> b!366482 (=> (not res!205078) (not e!224350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366482 (= res!205078 (validKeyInArray!0 k0!778))))

(declare-fun b!366483 () Bool)

(declare-fun e!224348 () Bool)

(declare-fun tp_is_empty!8527 () Bool)

(assert (=> b!366483 (= e!224348 tp_is_empty!8527)))

(declare-fun res!205071 () Bool)

(assert (=> start!36738 (=> (not res!205071) (not e!224350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36738 (= res!205071 (validMask!0 mask!970))))

(assert (=> start!36738 e!224350))

(assert (=> start!36738 true))

(declare-fun e!224347 () Bool)

(declare-fun array_inv!7388 (array!21001) Bool)

(assert (=> start!36738 (and (array_inv!7388 _values!506) e!224347)))

(declare-fun array_inv!7389 (array!20999) Bool)

(assert (=> start!36738 (array_inv!7389 _keys!658)))

(declare-fun mapNonEmpty!14355 () Bool)

(declare-fun mapRes!14355 () Bool)

(declare-fun tp!28431 () Bool)

(declare-fun e!224351 () Bool)

(assert (=> mapNonEmpty!14355 (= mapRes!14355 (and tp!28431 e!224351))))

(declare-fun mapRest!14355 () (Array (_ BitVec 32) ValueCell!3920))

(declare-fun mapValue!14355 () ValueCell!3920)

(declare-fun mapKey!14355 () (_ BitVec 32))

(assert (=> mapNonEmpty!14355 (= (arr!9969 _values!506) (store mapRest!14355 mapKey!14355 mapValue!14355))))

(declare-fun b!366484 () Bool)

(assert (=> b!366484 (= e!224351 tp_is_empty!8527)))

(declare-fun b!366485 () Bool)

(assert (=> b!366485 (= e!224346 false)))

(declare-fun lt!169034 () Bool)

(declare-datatypes ((List!5517 0))(
  ( (Nil!5514) (Cons!5513 (h!6369 (_ BitVec 64)) (t!10658 List!5517)) )
))
(declare-fun arrayNoDuplicates!0 (array!20999 (_ BitVec 32) List!5517) Bool)

(assert (=> b!366485 (= lt!169034 (arrayNoDuplicates!0 lt!169035 #b00000000000000000000000000000000 Nil!5514))))

(declare-fun b!366486 () Bool)

(declare-fun res!205077 () Bool)

(assert (=> b!366486 (=> (not res!205077) (not e!224350))))

(assert (=> b!366486 (= res!205077 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5514))))

(declare-fun b!366487 () Bool)

(declare-fun res!205072 () Bool)

(assert (=> b!366487 (=> (not res!205072) (not e!224350))))

(assert (=> b!366487 (= res!205072 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10321 _keys!658))))))

(declare-fun b!366488 () Bool)

(declare-fun res!205073 () Bool)

(assert (=> b!366488 (=> (not res!205073) (not e!224350))))

(declare-fun arrayContainsKey!0 (array!20999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366488 (= res!205073 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14355 () Bool)

(assert (=> mapIsEmpty!14355 mapRes!14355))

(declare-fun b!366489 () Bool)

(assert (=> b!366489 (= e!224347 (and e!224348 mapRes!14355))))

(declare-fun condMapEmpty!14355 () Bool)

(declare-fun mapDefault!14355 () ValueCell!3920)

(assert (=> b!366489 (= condMapEmpty!14355 (= (arr!9969 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3920)) mapDefault!14355)))))

(declare-fun b!366490 () Bool)

(declare-fun res!205076 () Bool)

(assert (=> b!366490 (=> (not res!205076) (not e!224350))))

(assert (=> b!366490 (= res!205076 (or (= (select (arr!9968 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9968 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!36738 res!205071) b!366480))

(assert (= (and b!366480 res!205079) b!366481))

(assert (= (and b!366481 res!205074) b!366486))

(assert (= (and b!366486 res!205077) b!366487))

(assert (= (and b!366487 res!205072) b!366482))

(assert (= (and b!366482 res!205078) b!366490))

(assert (= (and b!366490 res!205076) b!366488))

(assert (= (and b!366488 res!205073) b!366479))

(assert (= (and b!366479 res!205075) b!366485))

(assert (= (and b!366489 condMapEmpty!14355) mapIsEmpty!14355))

(assert (= (and b!366489 (not condMapEmpty!14355)) mapNonEmpty!14355))

(get-info :version)

(assert (= (and mapNonEmpty!14355 ((_ is ValueCellFull!3920) mapValue!14355)) b!366484))

(assert (= (and b!366489 ((_ is ValueCellFull!3920) mapDefault!14355)) b!366483))

(assert (= start!36738 b!366489))

(declare-fun m!363239 () Bool)

(assert (=> b!366479 m!363239))

(declare-fun m!363241 () Bool)

(assert (=> b!366479 m!363241))

(declare-fun m!363243 () Bool)

(assert (=> b!366486 m!363243))

(declare-fun m!363245 () Bool)

(assert (=> mapNonEmpty!14355 m!363245))

(declare-fun m!363247 () Bool)

(assert (=> b!366481 m!363247))

(declare-fun m!363249 () Bool)

(assert (=> b!366482 m!363249))

(declare-fun m!363251 () Bool)

(assert (=> b!366488 m!363251))

(declare-fun m!363253 () Bool)

(assert (=> start!36738 m!363253))

(declare-fun m!363255 () Bool)

(assert (=> start!36738 m!363255))

(declare-fun m!363257 () Bool)

(assert (=> start!36738 m!363257))

(declare-fun m!363259 () Bool)

(assert (=> b!366490 m!363259))

(declare-fun m!363261 () Bool)

(assert (=> b!366485 m!363261))

(check-sat (not start!36738) (not b!366481) (not b!366482) (not b!366479) tp_is_empty!8527 (not b!366485) (not b!366488) (not b!366486) (not mapNonEmpty!14355))
(check-sat)
