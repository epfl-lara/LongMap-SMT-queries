; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37392 () Bool)

(assert start!37392)

(declare-fun b_free!8533 () Bool)

(declare-fun b_next!8533 () Bool)

(assert (=> start!37392 (= b_free!8533 (not b_next!8533))))

(declare-fun tp!30314 () Bool)

(declare-fun b_and!15749 () Bool)

(assert (=> start!37392 (= tp!30314 b_and!15749)))

(declare-fun mapIsEmpty!15336 () Bool)

(declare-fun mapRes!15336 () Bool)

(assert (=> mapIsEmpty!15336 mapRes!15336))

(declare-fun b!380174 () Bool)

(declare-fun e!231224 () Bool)

(declare-fun e!231222 () Bool)

(assert (=> b!380174 (= e!231224 (not e!231222))))

(declare-fun res!215833 () Bool)

(assert (=> b!380174 (=> res!215833 e!231222)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380174 (= res!215833 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13347 0))(
  ( (V!13348 (val!4635 Int)) )
))
(declare-datatypes ((ValueCell!4247 0))(
  ( (ValueCellFull!4247 (v!6826 V!13347)) (EmptyCell!4247) )
))
(declare-datatypes ((array!22263 0))(
  ( (array!22264 (arr!10600 (Array (_ BitVec 32) ValueCell!4247)) (size!10953 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22263)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6188 0))(
  ( (tuple2!6189 (_1!3105 (_ BitVec 64)) (_2!3105 V!13347)) )
))
(declare-datatypes ((List!6016 0))(
  ( (Nil!6013) (Cons!6012 (h!6868 tuple2!6188) (t!11157 List!6016)) )
))
(declare-datatypes ((ListLongMap!5091 0))(
  ( (ListLongMap!5092 (toList!2561 List!6016)) )
))
(declare-fun lt!177830 () ListLongMap!5091)

(declare-fun zeroValue!472 () V!13347)

(declare-datatypes ((array!22265 0))(
  ( (array!22266 (arr!10601 (Array (_ BitVec 32) (_ BitVec 64))) (size!10954 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22265)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13347)

(declare-fun getCurrentListMap!1955 (array!22265 array!22263 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) Int) ListLongMap!5091)

(assert (=> b!380174 (= lt!177830 (getCurrentListMap!1955 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177829 () ListLongMap!5091)

(declare-fun lt!177826 () array!22263)

(declare-fun lt!177833 () array!22265)

(assert (=> b!380174 (= lt!177829 (getCurrentListMap!1955 lt!177833 lt!177826 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177832 () ListLongMap!5091)

(declare-fun lt!177834 () ListLongMap!5091)

(assert (=> b!380174 (and (= lt!177832 lt!177834) (= lt!177834 lt!177832))))

(declare-fun lt!177824 () ListLongMap!5091)

(declare-fun lt!177827 () tuple2!6188)

(declare-fun +!929 (ListLongMap!5091 tuple2!6188) ListLongMap!5091)

(assert (=> b!380174 (= lt!177834 (+!929 lt!177824 lt!177827))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13347)

(assert (=> b!380174 (= lt!177827 (tuple2!6189 k0!778 v!373))))

(declare-datatypes ((Unit!11716 0))(
  ( (Unit!11717) )
))
(declare-fun lt!177825 () Unit!11716)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!148 (array!22265 array!22263 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) (_ BitVec 64) V!13347 (_ BitVec 32) Int) Unit!11716)

(assert (=> b!380174 (= lt!177825 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!148 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!820 (array!22265 array!22263 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) Int) ListLongMap!5091)

(assert (=> b!380174 (= lt!177832 (getCurrentListMapNoExtraKeys!820 lt!177833 lt!177826 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380174 (= lt!177826 (array!22264 (store (arr!10600 _values!506) i!548 (ValueCellFull!4247 v!373)) (size!10953 _values!506)))))

(assert (=> b!380174 (= lt!177824 (getCurrentListMapNoExtraKeys!820 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380175 () Bool)

(declare-fun res!215823 () Bool)

(declare-fun e!231219 () Bool)

(assert (=> b!380175 (=> (not res!215823) (not e!231219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380175 (= res!215823 (validKeyInArray!0 k0!778))))

(declare-fun b!380176 () Bool)

(declare-fun res!215834 () Bool)

(assert (=> b!380176 (=> (not res!215834) (not e!231219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22265 (_ BitVec 32)) Bool)

(assert (=> b!380176 (= res!215834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380177 () Bool)

(declare-fun res!215830 () Bool)

(assert (=> b!380177 (=> (not res!215830) (not e!231224))))

(declare-datatypes ((List!6017 0))(
  ( (Nil!6014) (Cons!6013 (h!6869 (_ BitVec 64)) (t!11158 List!6017)) )
))
(declare-fun arrayNoDuplicates!0 (array!22265 (_ BitVec 32) List!6017) Bool)

(assert (=> b!380177 (= res!215830 (arrayNoDuplicates!0 lt!177833 #b00000000000000000000000000000000 Nil!6014))))

(declare-fun b!380178 () Bool)

(declare-fun res!215824 () Bool)

(assert (=> b!380178 (=> (not res!215824) (not e!231219))))

(declare-fun arrayContainsKey!0 (array!22265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380178 (= res!215824 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380180 () Bool)

(declare-fun e!231220 () Bool)

(declare-fun tp_is_empty!9181 () Bool)

(assert (=> b!380180 (= e!231220 tp_is_empty!9181)))

(declare-fun b!380181 () Bool)

(declare-fun e!231218 () Bool)

(assert (=> b!380181 (= e!231222 e!231218)))

(declare-fun res!215832 () Bool)

(assert (=> b!380181 (=> res!215832 e!231218)))

(assert (=> b!380181 (= res!215832 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177831 () ListLongMap!5091)

(assert (=> b!380181 (= lt!177830 lt!177831)))

(declare-fun lt!177822 () tuple2!6188)

(assert (=> b!380181 (= lt!177831 (+!929 lt!177824 lt!177822))))

(declare-fun lt!177828 () ListLongMap!5091)

(assert (=> b!380181 (= lt!177829 lt!177828)))

(assert (=> b!380181 (= lt!177828 (+!929 lt!177834 lt!177822))))

(assert (=> b!380181 (= lt!177829 (+!929 lt!177832 lt!177822))))

(assert (=> b!380181 (= lt!177822 (tuple2!6189 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15336 () Bool)

(declare-fun tp!30315 () Bool)

(declare-fun e!231223 () Bool)

(assert (=> mapNonEmpty!15336 (= mapRes!15336 (and tp!30315 e!231223))))

(declare-fun mapValue!15336 () ValueCell!4247)

(declare-fun mapKey!15336 () (_ BitVec 32))

(declare-fun mapRest!15336 () (Array (_ BitVec 32) ValueCell!4247))

(assert (=> mapNonEmpty!15336 (= (arr!10600 _values!506) (store mapRest!15336 mapKey!15336 mapValue!15336))))

(declare-fun b!380182 () Bool)

(declare-fun res!215827 () Bool)

(assert (=> b!380182 (=> (not res!215827) (not e!231219))))

(assert (=> b!380182 (= res!215827 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6014))))

(declare-fun b!380183 () Bool)

(assert (=> b!380183 (= e!231223 tp_is_empty!9181)))

(declare-fun b!380184 () Bool)

(assert (=> b!380184 (= e!231218 true)))

(assert (=> b!380184 (= lt!177828 (+!929 lt!177831 lt!177827))))

(declare-fun lt!177823 () Unit!11716)

(declare-fun addCommutativeForDiffKeys!319 (ListLongMap!5091 (_ BitVec 64) V!13347 (_ BitVec 64) V!13347) Unit!11716)

(assert (=> b!380184 (= lt!177823 (addCommutativeForDiffKeys!319 lt!177824 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380179 () Bool)

(declare-fun res!215829 () Bool)

(assert (=> b!380179 (=> (not res!215829) (not e!231219))))

(assert (=> b!380179 (= res!215829 (or (= (select (arr!10601 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10601 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!215826 () Bool)

(assert (=> start!37392 (=> (not res!215826) (not e!231219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37392 (= res!215826 (validMask!0 mask!970))))

(assert (=> start!37392 e!231219))

(declare-fun e!231221 () Bool)

(declare-fun array_inv!7808 (array!22263) Bool)

(assert (=> start!37392 (and (array_inv!7808 _values!506) e!231221)))

(assert (=> start!37392 tp!30314))

(assert (=> start!37392 true))

(assert (=> start!37392 tp_is_empty!9181))

(declare-fun array_inv!7809 (array!22265) Bool)

(assert (=> start!37392 (array_inv!7809 _keys!658)))

(declare-fun b!380185 () Bool)

(declare-fun res!215831 () Bool)

(assert (=> b!380185 (=> (not res!215831) (not e!231219))))

(assert (=> b!380185 (= res!215831 (and (= (size!10953 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10954 _keys!658) (size!10953 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380186 () Bool)

(declare-fun res!215825 () Bool)

(assert (=> b!380186 (=> (not res!215825) (not e!231219))))

(assert (=> b!380186 (= res!215825 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10954 _keys!658))))))

(declare-fun b!380187 () Bool)

(assert (=> b!380187 (= e!231221 (and e!231220 mapRes!15336))))

(declare-fun condMapEmpty!15336 () Bool)

(declare-fun mapDefault!15336 () ValueCell!4247)

(assert (=> b!380187 (= condMapEmpty!15336 (= (arr!10600 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4247)) mapDefault!15336)))))

(declare-fun b!380188 () Bool)

(assert (=> b!380188 (= e!231219 e!231224)))

(declare-fun res!215828 () Bool)

(assert (=> b!380188 (=> (not res!215828) (not e!231224))))

(assert (=> b!380188 (= res!215828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177833 mask!970))))

(assert (=> b!380188 (= lt!177833 (array!22266 (store (arr!10601 _keys!658) i!548 k0!778) (size!10954 _keys!658)))))

(assert (= (and start!37392 res!215826) b!380185))

(assert (= (and b!380185 res!215831) b!380176))

(assert (= (and b!380176 res!215834) b!380182))

(assert (= (and b!380182 res!215827) b!380186))

(assert (= (and b!380186 res!215825) b!380175))

(assert (= (and b!380175 res!215823) b!380179))

(assert (= (and b!380179 res!215829) b!380178))

(assert (= (and b!380178 res!215824) b!380188))

(assert (= (and b!380188 res!215828) b!380177))

(assert (= (and b!380177 res!215830) b!380174))

(assert (= (and b!380174 (not res!215833)) b!380181))

(assert (= (and b!380181 (not res!215832)) b!380184))

(assert (= (and b!380187 condMapEmpty!15336) mapIsEmpty!15336))

(assert (= (and b!380187 (not condMapEmpty!15336)) mapNonEmpty!15336))

(get-info :version)

(assert (= (and mapNonEmpty!15336 ((_ is ValueCellFull!4247) mapValue!15336)) b!380183))

(assert (= (and b!380187 ((_ is ValueCellFull!4247) mapDefault!15336)) b!380180))

(assert (= start!37392 b!380187))

(declare-fun m!376667 () Bool)

(assert (=> b!380182 m!376667))

(declare-fun m!376669 () Bool)

(assert (=> b!380184 m!376669))

(declare-fun m!376671 () Bool)

(assert (=> b!380184 m!376671))

(declare-fun m!376673 () Bool)

(assert (=> b!380188 m!376673))

(declare-fun m!376675 () Bool)

(assert (=> b!380188 m!376675))

(declare-fun m!376677 () Bool)

(assert (=> mapNonEmpty!15336 m!376677))

(declare-fun m!376679 () Bool)

(assert (=> b!380179 m!376679))

(declare-fun m!376681 () Bool)

(assert (=> b!380176 m!376681))

(declare-fun m!376683 () Bool)

(assert (=> b!380177 m!376683))

(declare-fun m!376685 () Bool)

(assert (=> b!380178 m!376685))

(declare-fun m!376687 () Bool)

(assert (=> b!380175 m!376687))

(declare-fun m!376689 () Bool)

(assert (=> b!380174 m!376689))

(declare-fun m!376691 () Bool)

(assert (=> b!380174 m!376691))

(declare-fun m!376693 () Bool)

(assert (=> b!380174 m!376693))

(declare-fun m!376695 () Bool)

(assert (=> b!380174 m!376695))

(declare-fun m!376697 () Bool)

(assert (=> b!380174 m!376697))

(declare-fun m!376699 () Bool)

(assert (=> b!380174 m!376699))

(declare-fun m!376701 () Bool)

(assert (=> b!380174 m!376701))

(declare-fun m!376703 () Bool)

(assert (=> start!37392 m!376703))

(declare-fun m!376705 () Bool)

(assert (=> start!37392 m!376705))

(declare-fun m!376707 () Bool)

(assert (=> start!37392 m!376707))

(declare-fun m!376709 () Bool)

(assert (=> b!380181 m!376709))

(declare-fun m!376711 () Bool)

(assert (=> b!380181 m!376711))

(declare-fun m!376713 () Bool)

(assert (=> b!380181 m!376713))

(check-sat (not b!380188) (not b_next!8533) (not mapNonEmpty!15336) (not start!37392) (not b!380178) (not b!380182) (not b!380181) b_and!15749 (not b!380176) (not b!380177) (not b!380184) (not b!380174) tp_is_empty!9181 (not b!380175))
(check-sat b_and!15749 (not b_next!8533))
