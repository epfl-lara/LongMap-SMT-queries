; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36612 () Bool)

(assert start!36612)

(declare-fun b!365509 () Bool)

(declare-fun e!223830 () Bool)

(declare-fun tp_is_empty!8461 () Bool)

(assert (=> b!365509 (= e!223830 tp_is_empty!8461)))

(declare-fun mapIsEmpty!14244 () Bool)

(declare-fun mapRes!14244 () Bool)

(assert (=> mapIsEmpty!14244 mapRes!14244))

(declare-fun b!365510 () Bool)

(declare-fun e!223827 () Bool)

(assert (=> b!365510 (= e!223827 (and e!223830 mapRes!14244))))

(declare-fun condMapEmpty!14244 () Bool)

(declare-datatypes ((V!12387 0))(
  ( (V!12388 (val!4275 Int)) )
))
(declare-datatypes ((ValueCell!3887 0))(
  ( (ValueCellFull!3887 (v!6472 V!12387)) (EmptyCell!3887) )
))
(declare-datatypes ((array!20866 0))(
  ( (array!20867 (arr!9905 (Array (_ BitVec 32) ValueCell!3887)) (size!10257 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20866)

(declare-fun mapDefault!14244 () ValueCell!3887)

(assert (=> b!365510 (= condMapEmpty!14244 (= (arr!9905 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3887)) mapDefault!14244)))))

(declare-fun mapNonEmpty!14244 () Bool)

(declare-fun tp!28320 () Bool)

(declare-fun e!223829 () Bool)

(assert (=> mapNonEmpty!14244 (= mapRes!14244 (and tp!28320 e!223829))))

(declare-fun mapRest!14244 () (Array (_ BitVec 32) ValueCell!3887))

(declare-fun mapValue!14244 () ValueCell!3887)

(declare-fun mapKey!14244 () (_ BitVec 32))

(assert (=> mapNonEmpty!14244 (= (arr!9905 _values!506) (store mapRest!14244 mapKey!14244 mapValue!14244))))

(declare-fun b!365511 () Bool)

(declare-fun res!204389 () Bool)

(declare-fun e!223828 () Bool)

(assert (=> b!365511 (=> (not res!204389) (not e!223828))))

(declare-datatypes ((array!20868 0))(
  ( (array!20869 (arr!9906 (Array (_ BitVec 32) (_ BitVec 64))) (size!10258 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20868)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20868 (_ BitVec 32)) Bool)

(assert (=> b!365511 (= res!204389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365512 () Bool)

(assert (=> b!365512 (= e!223828 false)))

(declare-fun lt!169209 () Bool)

(declare-datatypes ((List!5438 0))(
  ( (Nil!5435) (Cons!5434 (h!6290 (_ BitVec 64)) (t!10580 List!5438)) )
))
(declare-fun arrayNoDuplicates!0 (array!20868 (_ BitVec 32) List!5438) Bool)

(assert (=> b!365512 (= lt!169209 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5435))))

(declare-fun res!204388 () Bool)

(assert (=> start!36612 (=> (not res!204388) (not e!223828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36612 (= res!204388 (validMask!0 mask!970))))

(assert (=> start!36612 e!223828))

(assert (=> start!36612 true))

(declare-fun array_inv!7370 (array!20866) Bool)

(assert (=> start!36612 (and (array_inv!7370 _values!506) e!223827)))

(declare-fun array_inv!7371 (array!20868) Bool)

(assert (=> start!36612 (array_inv!7371 _keys!658)))

(declare-fun b!365513 () Bool)

(assert (=> b!365513 (= e!223829 tp_is_empty!8461)))

(declare-fun b!365514 () Bool)

(declare-fun res!204390 () Bool)

(assert (=> b!365514 (=> (not res!204390) (not e!223828))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365514 (= res!204390 (and (= (size!10257 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10258 _keys!658) (size!10257 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!36612 res!204388) b!365514))

(assert (= (and b!365514 res!204390) b!365511))

(assert (= (and b!365511 res!204389) b!365512))

(assert (= (and b!365510 condMapEmpty!14244) mapIsEmpty!14244))

(assert (= (and b!365510 (not condMapEmpty!14244)) mapNonEmpty!14244))

(get-info :version)

(assert (= (and mapNonEmpty!14244 ((_ is ValueCellFull!3887) mapValue!14244)) b!365513))

(assert (= (and b!365510 ((_ is ValueCellFull!3887) mapDefault!14244)) b!365509))

(assert (= start!36612 b!365510))

(declare-fun m!363461 () Bool)

(assert (=> mapNonEmpty!14244 m!363461))

(declare-fun m!363463 () Bool)

(assert (=> b!365511 m!363463))

(declare-fun m!363465 () Bool)

(assert (=> b!365512 m!363465))

(declare-fun m!363467 () Bool)

(assert (=> start!36612 m!363467))

(declare-fun m!363469 () Bool)

(assert (=> start!36612 m!363469))

(declare-fun m!363471 () Bool)

(assert (=> start!36612 m!363471))

(check-sat (not b!365511) (not mapNonEmpty!14244) (not start!36612) tp_is_empty!8461 (not b!365512))
(check-sat)
