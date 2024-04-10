; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36826 () Bool)

(assert start!36826)

(declare-fun b_free!7953 () Bool)

(declare-fun b_next!7953 () Bool)

(assert (=> start!36826 (= b_free!7953 (not b_next!7953))))

(declare-fun tp!28575 () Bool)

(declare-fun b_and!15195 () Bool)

(assert (=> start!36826 (= tp!28575 b_and!15195)))

(declare-fun b!368123 () Bool)

(declare-fun res!206243 () Bool)

(declare-fun e!225188 () Bool)

(assert (=> b!368123 (=> (not res!206243) (not e!225188))))

(declare-datatypes ((V!12573 0))(
  ( (V!12574 (val!4345 Int)) )
))
(declare-datatypes ((ValueCell!3957 0))(
  ( (ValueCellFull!3957 (v!6542 V!12573)) (EmptyCell!3957) )
))
(declare-datatypes ((array!21159 0))(
  ( (array!21160 (arr!10048 (Array (_ BitVec 32) ValueCell!3957)) (size!10400 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21159)

(declare-datatypes ((array!21161 0))(
  ( (array!21162 (arr!10049 (Array (_ BitVec 32) (_ BitVec 64))) (size!10401 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21161)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368123 (= res!206243 (and (= (size!10400 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10401 _keys!658) (size!10400 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368124 () Bool)

(declare-fun res!206242 () Bool)

(assert (=> b!368124 (=> (not res!206242) (not e!225188))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368124 (= res!206242 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10401 _keys!658))))))

(declare-fun b!368125 () Bool)

(declare-fun e!225187 () Bool)

(declare-fun tp_is_empty!8601 () Bool)

(assert (=> b!368125 (= e!225187 tp_is_empty!8601)))

(declare-fun b!368126 () Bool)

(declare-fun res!206240 () Bool)

(assert (=> b!368126 (=> (not res!206240) (not e!225188))))

(declare-datatypes ((List!5586 0))(
  ( (Nil!5583) (Cons!5582 (h!6438 (_ BitVec 64)) (t!10736 List!5586)) )
))
(declare-fun arrayNoDuplicates!0 (array!21161 (_ BitVec 32) List!5586) Bool)

(assert (=> b!368126 (= res!206240 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5583))))

(declare-fun b!368127 () Bool)

(declare-fun e!225191 () Bool)

(assert (=> b!368127 (= e!225191 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5754 0))(
  ( (tuple2!5755 (_1!2888 (_ BitVec 64)) (_2!2888 V!12573)) )
))
(declare-datatypes ((List!5587 0))(
  ( (Nil!5584) (Cons!5583 (h!6439 tuple2!5754) (t!10737 List!5587)) )
))
(declare-datatypes ((ListLongMap!4667 0))(
  ( (ListLongMap!4668 (toList!2349 List!5587)) )
))
(declare-fun lt!169482 () ListLongMap!4667)

(declare-fun zeroValue!472 () V!12573)

(declare-fun minValue!472 () V!12573)

(declare-fun getCurrentListMapNoExtraKeys!626 (array!21161 array!21159 (_ BitVec 32) (_ BitVec 32) V!12573 V!12573 (_ BitVec 32) Int) ListLongMap!4667)

(assert (=> b!368127 (= lt!169482 (getCurrentListMapNoExtraKeys!626 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368128 () Bool)

(declare-fun e!225189 () Bool)

(declare-fun e!225190 () Bool)

(declare-fun mapRes!14466 () Bool)

(assert (=> b!368128 (= e!225189 (and e!225190 mapRes!14466))))

(declare-fun condMapEmpty!14466 () Bool)

(declare-fun mapDefault!14466 () ValueCell!3957)

(assert (=> b!368128 (= condMapEmpty!14466 (= (arr!10048 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3957)) mapDefault!14466)))))

(declare-fun b!368129 () Bool)

(declare-fun res!206248 () Bool)

(assert (=> b!368129 (=> (not res!206248) (not e!225188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21161 (_ BitVec 32)) Bool)

(assert (=> b!368129 (= res!206248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368130 () Bool)

(assert (=> b!368130 (= e!225188 e!225191)))

(declare-fun res!206245 () Bool)

(assert (=> b!368130 (=> (not res!206245) (not e!225191))))

(declare-fun lt!169481 () array!21161)

(assert (=> b!368130 (= res!206245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169481 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!368130 (= lt!169481 (array!21162 (store (arr!10049 _keys!658) i!548 k0!778) (size!10401 _keys!658)))))

(declare-fun b!368131 () Bool)

(assert (=> b!368131 (= e!225190 tp_is_empty!8601)))

(declare-fun b!368132 () Bool)

(declare-fun res!206247 () Bool)

(assert (=> b!368132 (=> (not res!206247) (not e!225188))))

(assert (=> b!368132 (= res!206247 (or (= (select (arr!10049 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10049 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!206249 () Bool)

(assert (=> start!36826 (=> (not res!206249) (not e!225188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36826 (= res!206249 (validMask!0 mask!970))))

(assert (=> start!36826 e!225188))

(assert (=> start!36826 true))

(declare-fun array_inv!7428 (array!21159) Bool)

(assert (=> start!36826 (and (array_inv!7428 _values!506) e!225189)))

(assert (=> start!36826 tp!28575))

(assert (=> start!36826 tp_is_empty!8601))

(declare-fun array_inv!7429 (array!21161) Bool)

(assert (=> start!36826 (array_inv!7429 _keys!658)))

(declare-fun mapIsEmpty!14466 () Bool)

(assert (=> mapIsEmpty!14466 mapRes!14466))

(declare-fun b!368133 () Bool)

(declare-fun res!206241 () Bool)

(assert (=> b!368133 (=> (not res!206241) (not e!225188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368133 (= res!206241 (validKeyInArray!0 k0!778))))

(declare-fun b!368134 () Bool)

(declare-fun res!206244 () Bool)

(assert (=> b!368134 (=> (not res!206244) (not e!225188))))

(declare-fun arrayContainsKey!0 (array!21161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368134 (= res!206244 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368135 () Bool)

(declare-fun res!206246 () Bool)

(assert (=> b!368135 (=> (not res!206246) (not e!225191))))

(assert (=> b!368135 (= res!206246 (arrayNoDuplicates!0 lt!169481 #b00000000000000000000000000000000 Nil!5583))))

(declare-fun mapNonEmpty!14466 () Bool)

(declare-fun tp!28574 () Bool)

(assert (=> mapNonEmpty!14466 (= mapRes!14466 (and tp!28574 e!225187))))

(declare-fun mapRest!14466 () (Array (_ BitVec 32) ValueCell!3957))

(declare-fun mapKey!14466 () (_ BitVec 32))

(declare-fun mapValue!14466 () ValueCell!3957)

(assert (=> mapNonEmpty!14466 (= (arr!10048 _values!506) (store mapRest!14466 mapKey!14466 mapValue!14466))))

(assert (= (and start!36826 res!206249) b!368123))

(assert (= (and b!368123 res!206243) b!368129))

(assert (= (and b!368129 res!206248) b!368126))

(assert (= (and b!368126 res!206240) b!368124))

(assert (= (and b!368124 res!206242) b!368133))

(assert (= (and b!368133 res!206241) b!368132))

(assert (= (and b!368132 res!206247) b!368134))

(assert (= (and b!368134 res!206244) b!368130))

(assert (= (and b!368130 res!206245) b!368135))

(assert (= (and b!368135 res!206246) b!368127))

(assert (= (and b!368128 condMapEmpty!14466) mapIsEmpty!14466))

(assert (= (and b!368128 (not condMapEmpty!14466)) mapNonEmpty!14466))

(get-info :version)

(assert (= (and mapNonEmpty!14466 ((_ is ValueCellFull!3957) mapValue!14466)) b!368125))

(assert (= (and b!368128 ((_ is ValueCellFull!3957) mapDefault!14466)) b!368131))

(assert (= start!36826 b!368128))

(declare-fun m!364871 () Bool)

(assert (=> b!368126 m!364871))

(declare-fun m!364873 () Bool)

(assert (=> mapNonEmpty!14466 m!364873))

(declare-fun m!364875 () Bool)

(assert (=> b!368134 m!364875))

(declare-fun m!364877 () Bool)

(assert (=> b!368133 m!364877))

(declare-fun m!364879 () Bool)

(assert (=> start!36826 m!364879))

(declare-fun m!364881 () Bool)

(assert (=> start!36826 m!364881))

(declare-fun m!364883 () Bool)

(assert (=> start!36826 m!364883))

(declare-fun m!364885 () Bool)

(assert (=> b!368129 m!364885))

(declare-fun m!364887 () Bool)

(assert (=> b!368127 m!364887))

(declare-fun m!364889 () Bool)

(assert (=> b!368130 m!364889))

(declare-fun m!364891 () Bool)

(assert (=> b!368130 m!364891))

(declare-fun m!364893 () Bool)

(assert (=> b!368135 m!364893))

(declare-fun m!364895 () Bool)

(assert (=> b!368132 m!364895))

(check-sat (not b!368133) (not b!368126) (not b!368127) tp_is_empty!8601 (not b!368134) (not b!368135) (not start!36826) (not b!368130) b_and!15195 (not b_next!7953) (not b!368129) (not mapNonEmpty!14466))
(check-sat b_and!15195 (not b_next!7953))
