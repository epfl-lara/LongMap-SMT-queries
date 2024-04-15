; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36612 () Bool)

(assert start!36612)

(declare-fun b!365287 () Bool)

(declare-fun e!223685 () Bool)

(declare-fun tp_is_empty!8461 () Bool)

(assert (=> b!365287 (= e!223685 tp_is_empty!8461)))

(declare-fun b!365288 () Bool)

(declare-fun e!223688 () Bool)

(declare-fun mapRes!14244 () Bool)

(assert (=> b!365288 (= e!223688 (and e!223685 mapRes!14244))))

(declare-fun condMapEmpty!14244 () Bool)

(declare-datatypes ((V!12387 0))(
  ( (V!12388 (val!4275 Int)) )
))
(declare-datatypes ((ValueCell!3887 0))(
  ( (ValueCellFull!3887 (v!6465 V!12387)) (EmptyCell!3887) )
))
(declare-datatypes ((array!20861 0))(
  ( (array!20862 (arr!9903 (Array (_ BitVec 32) ValueCell!3887)) (size!10256 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20861)

(declare-fun mapDefault!14244 () ValueCell!3887)

(assert (=> b!365288 (= condMapEmpty!14244 (= (arr!9903 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3887)) mapDefault!14244)))))

(declare-fun b!365289 () Bool)

(declare-fun res!204264 () Bool)

(declare-fun e!223687 () Bool)

(assert (=> b!365289 (=> (not res!204264) (not e!223687))))

(declare-datatypes ((array!20863 0))(
  ( (array!20864 (arr!9904 (Array (_ BitVec 32) (_ BitVec 64))) (size!10257 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20863)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20863 (_ BitVec 32)) Bool)

(assert (=> b!365289 (= res!204264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14244 () Bool)

(assert (=> mapIsEmpty!14244 mapRes!14244))

(declare-fun b!365290 () Bool)

(declare-fun res!204263 () Bool)

(assert (=> b!365290 (=> (not res!204263) (not e!223687))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365290 (= res!204263 (and (= (size!10256 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10257 _keys!658) (size!10256 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365291 () Bool)

(declare-fun e!223686 () Bool)

(assert (=> b!365291 (= e!223686 tp_is_empty!8461)))

(declare-fun mapNonEmpty!14244 () Bool)

(declare-fun tp!28320 () Bool)

(assert (=> mapNonEmpty!14244 (= mapRes!14244 (and tp!28320 e!223686))))

(declare-fun mapRest!14244 () (Array (_ BitVec 32) ValueCell!3887))

(declare-fun mapValue!14244 () ValueCell!3887)

(declare-fun mapKey!14244 () (_ BitVec 32))

(assert (=> mapNonEmpty!14244 (= (arr!9903 _values!506) (store mapRest!14244 mapKey!14244 mapValue!14244))))

(declare-fun b!365292 () Bool)

(assert (=> b!365292 (= e!223687 false)))

(declare-fun lt!168956 () Bool)

(declare-datatypes ((List!5494 0))(
  ( (Nil!5491) (Cons!5490 (h!6346 (_ BitVec 64)) (t!10635 List!5494)) )
))
(declare-fun arrayNoDuplicates!0 (array!20863 (_ BitVec 32) List!5494) Bool)

(assert (=> b!365292 (= lt!168956 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5491))))

(declare-fun res!204262 () Bool)

(assert (=> start!36612 (=> (not res!204262) (not e!223687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36612 (= res!204262 (validMask!0 mask!970))))

(assert (=> start!36612 e!223687))

(assert (=> start!36612 true))

(declare-fun array_inv!7342 (array!20861) Bool)

(assert (=> start!36612 (and (array_inv!7342 _values!506) e!223688)))

(declare-fun array_inv!7343 (array!20863) Bool)

(assert (=> start!36612 (array_inv!7343 _keys!658)))

(assert (= (and start!36612 res!204262) b!365290))

(assert (= (and b!365290 res!204263) b!365289))

(assert (= (and b!365289 res!204264) b!365292))

(assert (= (and b!365288 condMapEmpty!14244) mapIsEmpty!14244))

(assert (= (and b!365288 (not condMapEmpty!14244)) mapNonEmpty!14244))

(get-info :version)

(assert (= (and mapNonEmpty!14244 ((_ is ValueCellFull!3887) mapValue!14244)) b!365291))

(assert (= (and b!365288 ((_ is ValueCellFull!3887) mapDefault!14244)) b!365287))

(assert (= start!36612 b!365288))

(declare-fun m!362507 () Bool)

(assert (=> b!365289 m!362507))

(declare-fun m!362509 () Bool)

(assert (=> mapNonEmpty!14244 m!362509))

(declare-fun m!362511 () Bool)

(assert (=> b!365292 m!362511))

(declare-fun m!362513 () Bool)

(assert (=> start!36612 m!362513))

(declare-fun m!362515 () Bool)

(assert (=> start!36612 m!362515))

(declare-fun m!362517 () Bool)

(assert (=> start!36612 m!362517))

(check-sat (not b!365289) (not mapNonEmpty!14244) (not start!36612) (not b!365292) tp_is_empty!8461)
(check-sat)
