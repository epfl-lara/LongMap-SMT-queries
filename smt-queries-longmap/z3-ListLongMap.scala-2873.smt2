; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41360 () Bool)

(assert start!41360)

(declare-fun mapNonEmpty!20386 () Bool)

(declare-fun mapRes!20386 () Bool)

(declare-fun tp!39205 () Bool)

(declare-fun e!269738 () Bool)

(assert (=> mapNonEmpty!20386 (= mapRes!20386 (and tp!39205 e!269738))))

(declare-fun mapKey!20386 () (_ BitVec 32))

(declare-datatypes ((V!17741 0))(
  ( (V!17742 (val!6283 Int)) )
))
(declare-datatypes ((ValueCell!5895 0))(
  ( (ValueCellFull!5895 (v!8570 V!17741)) (EmptyCell!5895) )
))
(declare-datatypes ((array!28755 0))(
  ( (array!28756 (arr!13811 (Array (_ BitVec 32) ValueCell!5895)) (size!14163 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28755)

(declare-fun mapRest!20386 () (Array (_ BitVec 32) ValueCell!5895))

(declare-fun mapValue!20386 () ValueCell!5895)

(assert (=> mapNonEmpty!20386 (= (arr!13811 _values!833) (store mapRest!20386 mapKey!20386 mapValue!20386))))

(declare-fun b!462311 () Bool)

(declare-fun e!269741 () Bool)

(declare-fun tp_is_empty!12477 () Bool)

(assert (=> b!462311 (= e!269741 tp_is_empty!12477)))

(declare-fun b!462312 () Bool)

(declare-fun e!269739 () Bool)

(assert (=> b!462312 (= e!269739 (and e!269741 mapRes!20386))))

(declare-fun condMapEmpty!20386 () Bool)

(declare-fun mapDefault!20386 () ValueCell!5895)

(assert (=> b!462312 (= condMapEmpty!20386 (= (arr!13811 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5895)) mapDefault!20386)))))

(declare-fun b!462313 () Bool)

(assert (=> b!462313 (= e!269738 tp_is_empty!12477)))

(declare-fun res!276501 () Bool)

(declare-fun e!269742 () Bool)

(assert (=> start!41360 (=> (not res!276501) (not e!269742))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41360 (= res!276501 (validMask!0 mask!1365))))

(assert (=> start!41360 e!269742))

(assert (=> start!41360 true))

(declare-datatypes ((array!28757 0))(
  ( (array!28758 (arr!13812 (Array (_ BitVec 32) (_ BitVec 64))) (size!14164 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28757)

(declare-fun array_inv!9986 (array!28757) Bool)

(assert (=> start!41360 (array_inv!9986 _keys!1025)))

(declare-fun array_inv!9987 (array!28755) Bool)

(assert (=> start!41360 (and (array_inv!9987 _values!833) e!269739)))

(declare-fun b!462314 () Bool)

(assert (=> b!462314 (= e!269742 false)))

(declare-fun lt!209189 () Bool)

(declare-datatypes ((List!8338 0))(
  ( (Nil!8335) (Cons!8334 (h!9190 (_ BitVec 64)) (t!14282 List!8338)) )
))
(declare-fun arrayNoDuplicates!0 (array!28757 (_ BitVec 32) List!8338) Bool)

(assert (=> b!462314 (= lt!209189 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8335))))

(declare-fun b!462315 () Bool)

(declare-fun res!276503 () Bool)

(assert (=> b!462315 (=> (not res!276503) (not e!269742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28757 (_ BitVec 32)) Bool)

(assert (=> b!462315 (= res!276503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20386 () Bool)

(assert (=> mapIsEmpty!20386 mapRes!20386))

(declare-fun b!462316 () Bool)

(declare-fun res!276502 () Bool)

(assert (=> b!462316 (=> (not res!276502) (not e!269742))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462316 (= res!276502 (and (= (size!14163 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14164 _keys!1025) (size!14163 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41360 res!276501) b!462316))

(assert (= (and b!462316 res!276502) b!462315))

(assert (= (and b!462315 res!276503) b!462314))

(assert (= (and b!462312 condMapEmpty!20386) mapIsEmpty!20386))

(assert (= (and b!462312 (not condMapEmpty!20386)) mapNonEmpty!20386))

(get-info :version)

(assert (= (and mapNonEmpty!20386 ((_ is ValueCellFull!5895) mapValue!20386)) b!462313))

(assert (= (and b!462312 ((_ is ValueCellFull!5895) mapDefault!20386)) b!462311))

(assert (= start!41360 b!462312))

(declare-fun m!445293 () Bool)

(assert (=> mapNonEmpty!20386 m!445293))

(declare-fun m!445295 () Bool)

(assert (=> start!41360 m!445295))

(declare-fun m!445297 () Bool)

(assert (=> start!41360 m!445297))

(declare-fun m!445299 () Bool)

(assert (=> start!41360 m!445299))

(declare-fun m!445301 () Bool)

(assert (=> b!462314 m!445301))

(declare-fun m!445303 () Bool)

(assert (=> b!462315 m!445303))

(check-sat (not b!462315) (not start!41360) (not b!462314) (not mapNonEmpty!20386) tp_is_empty!12477)
(check-sat)
