; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36660 () Bool)

(assert start!36660)

(declare-fun b!365977 () Bool)

(declare-fun res!204675 () Bool)

(declare-fun e!224127 () Bool)

(assert (=> b!365977 (=> (not res!204675) (not e!224127))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12435 0))(
  ( (V!12436 (val!4293 Int)) )
))
(declare-datatypes ((ValueCell!3905 0))(
  ( (ValueCellFull!3905 (v!6490 V!12435)) (EmptyCell!3905) )
))
(declare-datatypes ((array!20940 0))(
  ( (array!20941 (arr!9941 (Array (_ BitVec 32) ValueCell!3905)) (size!10293 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20940)

(declare-datatypes ((array!20942 0))(
  ( (array!20943 (arr!9942 (Array (_ BitVec 32) (_ BitVec 64))) (size!10294 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20942)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365977 (= res!204675 (and (= (size!10293 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10294 _keys!658) (size!10293 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365978 () Bool)

(declare-fun e!224128 () Bool)

(declare-fun e!224125 () Bool)

(declare-fun mapRes!14301 () Bool)

(assert (=> b!365978 (= e!224128 (and e!224125 mapRes!14301))))

(declare-fun condMapEmpty!14301 () Bool)

(declare-fun mapDefault!14301 () ValueCell!3905)

(assert (=> b!365978 (= condMapEmpty!14301 (= (arr!9941 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3905)) mapDefault!14301)))))

(declare-fun mapIsEmpty!14301 () Bool)

(assert (=> mapIsEmpty!14301 mapRes!14301))

(declare-fun b!365979 () Bool)

(declare-fun e!224124 () Bool)

(declare-fun tp_is_empty!8497 () Bool)

(assert (=> b!365979 (= e!224124 tp_is_empty!8497)))

(declare-fun b!365980 () Bool)

(declare-fun res!204676 () Bool)

(assert (=> b!365980 (=> (not res!204676) (not e!224127))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365980 (= res!204676 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10294 _keys!658))))))

(declare-fun b!365981 () Bool)

(declare-fun res!204681 () Bool)

(assert (=> b!365981 (=> (not res!204681) (not e!224127))))

(declare-datatypes ((List!5451 0))(
  ( (Nil!5448) (Cons!5447 (h!6303 (_ BitVec 64)) (t!10593 List!5451)) )
))
(declare-fun arrayNoDuplicates!0 (array!20942 (_ BitVec 32) List!5451) Bool)

(assert (=> b!365981 (= res!204681 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5448))))

(declare-fun res!204677 () Bool)

(assert (=> start!36660 (=> (not res!204677) (not e!224127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36660 (= res!204677 (validMask!0 mask!970))))

(assert (=> start!36660 e!224127))

(assert (=> start!36660 true))

(declare-fun array_inv!7394 (array!20940) Bool)

(assert (=> start!36660 (and (array_inv!7394 _values!506) e!224128)))

(declare-fun array_inv!7395 (array!20942) Bool)

(assert (=> start!36660 (array_inv!7395 _keys!658)))

(declare-fun b!365982 () Bool)

(declare-fun res!204674 () Bool)

(assert (=> b!365982 (=> (not res!204674) (not e!224127))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365982 (= res!204674 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!365983 () Bool)

(assert (=> b!365983 (= e!224127 (and (= (size!10294 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)) (bvsgt #b00000000000000000000000000000000 (size!10294 _keys!658))))))

(declare-fun b!365984 () Bool)

(declare-fun res!204678 () Bool)

(assert (=> b!365984 (=> (not res!204678) (not e!224127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365984 (= res!204678 (validKeyInArray!0 k0!778))))

(declare-fun b!365985 () Bool)

(assert (=> b!365985 (= e!224125 tp_is_empty!8497)))

(declare-fun mapNonEmpty!14301 () Bool)

(declare-fun tp!28377 () Bool)

(assert (=> mapNonEmpty!14301 (= mapRes!14301 (and tp!28377 e!224124))))

(declare-fun mapKey!14301 () (_ BitVec 32))

(declare-fun mapRest!14301 () (Array (_ BitVec 32) ValueCell!3905))

(declare-fun mapValue!14301 () ValueCell!3905)

(assert (=> mapNonEmpty!14301 (= (arr!9941 _values!506) (store mapRest!14301 mapKey!14301 mapValue!14301))))

(declare-fun b!365986 () Bool)

(declare-fun res!204679 () Bool)

(assert (=> b!365986 (=> (not res!204679) (not e!224127))))

(assert (=> b!365986 (= res!204679 (or (= (select (arr!9942 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9942 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!365987 () Bool)

(declare-fun res!204680 () Bool)

(assert (=> b!365987 (=> (not res!204680) (not e!224127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20942 (_ BitVec 32)) Bool)

(assert (=> b!365987 (= res!204680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36660 res!204677) b!365977))

(assert (= (and b!365977 res!204675) b!365987))

(assert (= (and b!365987 res!204680) b!365981))

(assert (= (and b!365981 res!204681) b!365980))

(assert (= (and b!365980 res!204676) b!365984))

(assert (= (and b!365984 res!204678) b!365986))

(assert (= (and b!365986 res!204679) b!365982))

(assert (= (and b!365982 res!204674) b!365983))

(assert (= (and b!365978 condMapEmpty!14301) mapIsEmpty!14301))

(assert (= (and b!365978 (not condMapEmpty!14301)) mapNonEmpty!14301))

(get-info :version)

(assert (= (and mapNonEmpty!14301 ((_ is ValueCellFull!3905) mapValue!14301)) b!365979))

(assert (= (and b!365978 ((_ is ValueCellFull!3905) mapDefault!14301)) b!365985))

(assert (= start!36660 b!365978))

(declare-fun m!363737 () Bool)

(assert (=> mapNonEmpty!14301 m!363737))

(declare-fun m!363739 () Bool)

(assert (=> b!365982 m!363739))

(declare-fun m!363741 () Bool)

(assert (=> b!365981 m!363741))

(declare-fun m!363743 () Bool)

(assert (=> b!365986 m!363743))

(declare-fun m!363745 () Bool)

(assert (=> b!365984 m!363745))

(declare-fun m!363747 () Bool)

(assert (=> b!365987 m!363747))

(declare-fun m!363749 () Bool)

(assert (=> start!36660 m!363749))

(declare-fun m!363751 () Bool)

(assert (=> start!36660 m!363751))

(declare-fun m!363753 () Bool)

(assert (=> start!36660 m!363753))

(check-sat (not start!36660) tp_is_empty!8497 (not b!365982) (not mapNonEmpty!14301) (not b!365981) (not b!365984) (not b!365987))
(check-sat)
