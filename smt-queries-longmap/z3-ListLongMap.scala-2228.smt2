; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36832 () Bool)

(assert start!36832)

(declare-fun b_free!7959 () Bool)

(declare-fun b_next!7959 () Bool)

(assert (=> start!36832 (= b_free!7959 (not b_next!7959))))

(declare-fun tp!28592 () Bool)

(declare-fun b_and!15201 () Bool)

(assert (=> start!36832 (= tp!28592 b_and!15201)))

(declare-fun b!368240 () Bool)

(declare-fun e!225244 () Bool)

(assert (=> b!368240 (= e!225244 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12581 0))(
  ( (V!12582 (val!4348 Int)) )
))
(declare-datatypes ((ValueCell!3960 0))(
  ( (ValueCellFull!3960 (v!6545 V!12581)) (EmptyCell!3960) )
))
(declare-datatypes ((array!21171 0))(
  ( (array!21172 (arr!10054 (Array (_ BitVec 32) ValueCell!3960)) (size!10406 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21171)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5760 0))(
  ( (tuple2!5761 (_1!2891 (_ BitVec 64)) (_2!2891 V!12581)) )
))
(declare-datatypes ((List!5592 0))(
  ( (Nil!5589) (Cons!5588 (h!6444 tuple2!5760) (t!10742 List!5592)) )
))
(declare-datatypes ((ListLongMap!4673 0))(
  ( (ListLongMap!4674 (toList!2352 List!5592)) )
))
(declare-fun lt!169500 () ListLongMap!4673)

(declare-fun zeroValue!472 () V!12581)

(declare-datatypes ((array!21173 0))(
  ( (array!21174 (arr!10055 (Array (_ BitVec 32) (_ BitVec 64))) (size!10407 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21173)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12581)

(declare-fun getCurrentListMapNoExtraKeys!629 (array!21173 array!21171 (_ BitVec 32) (_ BitVec 32) V!12581 V!12581 (_ BitVec 32) Int) ListLongMap!4673)

(assert (=> b!368240 (= lt!169500 (getCurrentListMapNoExtraKeys!629 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368241 () Bool)

(declare-fun res!206338 () Bool)

(declare-fun e!225245 () Bool)

(assert (=> b!368241 (=> (not res!206338) (not e!225245))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368241 (= res!206338 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368242 () Bool)

(declare-fun res!206333 () Bool)

(assert (=> b!368242 (=> (not res!206333) (not e!225244))))

(declare-fun lt!169499 () array!21173)

(declare-datatypes ((List!5593 0))(
  ( (Nil!5590) (Cons!5589 (h!6445 (_ BitVec 64)) (t!10743 List!5593)) )
))
(declare-fun arrayNoDuplicates!0 (array!21173 (_ BitVec 32) List!5593) Bool)

(assert (=> b!368242 (= res!206333 (arrayNoDuplicates!0 lt!169499 #b00000000000000000000000000000000 Nil!5590))))

(declare-fun b!368243 () Bool)

(declare-fun e!225242 () Bool)

(declare-fun e!225241 () Bool)

(declare-fun mapRes!14475 () Bool)

(assert (=> b!368243 (= e!225242 (and e!225241 mapRes!14475))))

(declare-fun condMapEmpty!14475 () Bool)

(declare-fun mapDefault!14475 () ValueCell!3960)

(assert (=> b!368243 (= condMapEmpty!14475 (= (arr!10054 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3960)) mapDefault!14475)))))

(declare-fun b!368244 () Bool)

(declare-fun e!225243 () Bool)

(declare-fun tp_is_empty!8607 () Bool)

(assert (=> b!368244 (= e!225243 tp_is_empty!8607)))

(declare-fun b!368245 () Bool)

(declare-fun res!206331 () Bool)

(assert (=> b!368245 (=> (not res!206331) (not e!225245))))

(assert (=> b!368245 (= res!206331 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5590))))

(declare-fun b!368246 () Bool)

(assert (=> b!368246 (= e!225241 tp_is_empty!8607)))

(declare-fun b!368247 () Bool)

(declare-fun res!206335 () Bool)

(assert (=> b!368247 (=> (not res!206335) (not e!225245))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368247 (= res!206335 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10407 _keys!658))))))

(declare-fun mapIsEmpty!14475 () Bool)

(assert (=> mapIsEmpty!14475 mapRes!14475))

(declare-fun b!368248 () Bool)

(declare-fun res!206334 () Bool)

(assert (=> b!368248 (=> (not res!206334) (not e!225245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368248 (= res!206334 (validKeyInArray!0 k0!778))))

(declare-fun b!368249 () Bool)

(declare-fun res!206337 () Bool)

(assert (=> b!368249 (=> (not res!206337) (not e!225245))))

(assert (=> b!368249 (= res!206337 (or (= (select (arr!10055 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10055 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368250 () Bool)

(declare-fun res!206339 () Bool)

(assert (=> b!368250 (=> (not res!206339) (not e!225245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21173 (_ BitVec 32)) Bool)

(assert (=> b!368250 (= res!206339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14475 () Bool)

(declare-fun tp!28593 () Bool)

(assert (=> mapNonEmpty!14475 (= mapRes!14475 (and tp!28593 e!225243))))

(declare-fun mapRest!14475 () (Array (_ BitVec 32) ValueCell!3960))

(declare-fun mapValue!14475 () ValueCell!3960)

(declare-fun mapKey!14475 () (_ BitVec 32))

(assert (=> mapNonEmpty!14475 (= (arr!10054 _values!506) (store mapRest!14475 mapKey!14475 mapValue!14475))))

(declare-fun res!206336 () Bool)

(assert (=> start!36832 (=> (not res!206336) (not e!225245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36832 (= res!206336 (validMask!0 mask!970))))

(assert (=> start!36832 e!225245))

(assert (=> start!36832 true))

(declare-fun array_inv!7434 (array!21171) Bool)

(assert (=> start!36832 (and (array_inv!7434 _values!506) e!225242)))

(assert (=> start!36832 tp!28592))

(assert (=> start!36832 tp_is_empty!8607))

(declare-fun array_inv!7435 (array!21173) Bool)

(assert (=> start!36832 (array_inv!7435 _keys!658)))

(declare-fun b!368251 () Bool)

(declare-fun res!206330 () Bool)

(assert (=> b!368251 (=> (not res!206330) (not e!225245))))

(assert (=> b!368251 (= res!206330 (and (= (size!10406 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10407 _keys!658) (size!10406 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368252 () Bool)

(assert (=> b!368252 (= e!225245 e!225244)))

(declare-fun res!206332 () Bool)

(assert (=> b!368252 (=> (not res!206332) (not e!225244))))

(assert (=> b!368252 (= res!206332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169499 mask!970))))

(assert (=> b!368252 (= lt!169499 (array!21174 (store (arr!10055 _keys!658) i!548 k0!778) (size!10407 _keys!658)))))

(assert (= (and start!36832 res!206336) b!368251))

(assert (= (and b!368251 res!206330) b!368250))

(assert (= (and b!368250 res!206339) b!368245))

(assert (= (and b!368245 res!206331) b!368247))

(assert (= (and b!368247 res!206335) b!368248))

(assert (= (and b!368248 res!206334) b!368249))

(assert (= (and b!368249 res!206337) b!368241))

(assert (= (and b!368241 res!206338) b!368252))

(assert (= (and b!368252 res!206332) b!368242))

(assert (= (and b!368242 res!206333) b!368240))

(assert (= (and b!368243 condMapEmpty!14475) mapIsEmpty!14475))

(assert (= (and b!368243 (not condMapEmpty!14475)) mapNonEmpty!14475))

(get-info :version)

(assert (= (and mapNonEmpty!14475 ((_ is ValueCellFull!3960) mapValue!14475)) b!368244))

(assert (= (and b!368243 ((_ is ValueCellFull!3960) mapDefault!14475)) b!368246))

(assert (= start!36832 b!368243))

(declare-fun m!364949 () Bool)

(assert (=> b!368241 m!364949))

(declare-fun m!364951 () Bool)

(assert (=> b!368248 m!364951))

(declare-fun m!364953 () Bool)

(assert (=> b!368240 m!364953))

(declare-fun m!364955 () Bool)

(assert (=> mapNonEmpty!14475 m!364955))

(declare-fun m!364957 () Bool)

(assert (=> b!368252 m!364957))

(declare-fun m!364959 () Bool)

(assert (=> b!368252 m!364959))

(declare-fun m!364961 () Bool)

(assert (=> start!36832 m!364961))

(declare-fun m!364963 () Bool)

(assert (=> start!36832 m!364963))

(declare-fun m!364965 () Bool)

(assert (=> start!36832 m!364965))

(declare-fun m!364967 () Bool)

(assert (=> b!368249 m!364967))

(declare-fun m!364969 () Bool)

(assert (=> b!368242 m!364969))

(declare-fun m!364971 () Bool)

(assert (=> b!368245 m!364971))

(declare-fun m!364973 () Bool)

(assert (=> b!368250 m!364973))

(check-sat (not b!368248) (not b_next!7959) (not b!368252) (not b!368242) (not b!368240) b_and!15201 (not b!368241) (not b!368245) (not start!36832) (not mapNonEmpty!14475) tp_is_empty!8607 (not b!368250))
(check-sat b_and!15201 (not b_next!7959))
