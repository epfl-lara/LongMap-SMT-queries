; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36670 () Bool)

(assert start!36670)

(declare-fun mapIsEmpty!14295 () Bool)

(declare-fun mapRes!14295 () Bool)

(assert (=> mapIsEmpty!14295 mapRes!14295))

(declare-fun b!365980 () Bool)

(declare-fun e!224130 () Bool)

(declare-fun tp_is_empty!8493 () Bool)

(assert (=> b!365980 (= e!224130 tp_is_empty!8493)))

(declare-fun b!365981 () Bool)

(declare-fun e!224129 () Bool)

(assert (=> b!365981 (= e!224129 tp_is_empty!8493)))

(declare-fun mapNonEmpty!14295 () Bool)

(declare-fun tp!28371 () Bool)

(assert (=> mapNonEmpty!14295 (= mapRes!14295 (and tp!28371 e!224129))))

(declare-datatypes ((V!12429 0))(
  ( (V!12430 (val!4291 Int)) )
))
(declare-datatypes ((ValueCell!3903 0))(
  ( (ValueCellFull!3903 (v!6487 V!12429)) (EmptyCell!3903) )
))
(declare-fun mapValue!14295 () ValueCell!3903)

(declare-datatypes ((array!20939 0))(
  ( (array!20940 (arr!9941 (Array (_ BitVec 32) ValueCell!3903)) (size!10293 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20939)

(declare-fun mapKey!14295 () (_ BitVec 32))

(declare-fun mapRest!14295 () (Array (_ BitVec 32) ValueCell!3903))

(assert (=> mapNonEmpty!14295 (= (arr!9941 _values!506) (store mapRest!14295 mapKey!14295 mapValue!14295))))

(declare-fun b!365982 () Bool)

(declare-fun res!204651 () Bool)

(declare-fun e!224128 () Bool)

(assert (=> b!365982 (=> (not res!204651) (not e!224128))))

(declare-datatypes ((array!20941 0))(
  ( (array!20942 (arr!9942 (Array (_ BitVec 32) (_ BitVec 64))) (size!10294 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20941)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20941 (_ BitVec 32)) Bool)

(assert (=> b!365982 (= res!204651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!204650 () Bool)

(assert (=> start!36670 (=> (not res!204650) (not e!224128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36670 (= res!204650 (validMask!0 mask!970))))

(assert (=> start!36670 e!224128))

(assert (=> start!36670 true))

(declare-fun e!224127 () Bool)

(declare-fun array_inv!7354 (array!20939) Bool)

(assert (=> start!36670 (and (array_inv!7354 _values!506) e!224127)))

(declare-fun array_inv!7355 (array!20941) Bool)

(assert (=> start!36670 (array_inv!7355 _keys!658)))

(declare-fun b!365983 () Bool)

(declare-fun res!204649 () Bool)

(assert (=> b!365983 (=> (not res!204649) (not e!224128))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365983 (= res!204649 (and (= (size!10293 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10294 _keys!658) (size!10293 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365984 () Bool)

(assert (=> b!365984 (= e!224127 (and e!224130 mapRes!14295))))

(declare-fun condMapEmpty!14295 () Bool)

(declare-fun mapDefault!14295 () ValueCell!3903)

(assert (=> b!365984 (= condMapEmpty!14295 (= (arr!9941 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3903)) mapDefault!14295)))))

(declare-fun b!365985 () Bool)

(assert (=> b!365985 (= e!224128 false)))

(declare-fun lt!169220 () Bool)

(declare-datatypes ((List!5540 0))(
  ( (Nil!5537) (Cons!5536 (h!6392 (_ BitVec 64)) (t!10690 List!5540)) )
))
(declare-fun arrayNoDuplicates!0 (array!20941 (_ BitVec 32) List!5540) Bool)

(assert (=> b!365985 (= lt!169220 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5537))))

(assert (= (and start!36670 res!204650) b!365983))

(assert (= (and b!365983 res!204649) b!365982))

(assert (= (and b!365982 res!204651) b!365985))

(assert (= (and b!365984 condMapEmpty!14295) mapIsEmpty!14295))

(assert (= (and b!365984 (not condMapEmpty!14295)) mapNonEmpty!14295))

(get-info :version)

(assert (= (and mapNonEmpty!14295 ((_ is ValueCellFull!3903) mapValue!14295)) b!365981))

(assert (= (and b!365984 ((_ is ValueCellFull!3903) mapDefault!14295)) b!365980))

(assert (= start!36670 b!365984))

(declare-fun m!363483 () Bool)

(assert (=> mapNonEmpty!14295 m!363483))

(declare-fun m!363485 () Bool)

(assert (=> b!365982 m!363485))

(declare-fun m!363487 () Bool)

(assert (=> start!36670 m!363487))

(declare-fun m!363489 () Bool)

(assert (=> start!36670 m!363489))

(declare-fun m!363491 () Bool)

(assert (=> start!36670 m!363491))

(declare-fun m!363493 () Bool)

(assert (=> b!365985 m!363493))

(check-sat (not b!365985) (not start!36670) (not b!365982) (not mapNonEmpty!14295) tp_is_empty!8493)
(check-sat)
