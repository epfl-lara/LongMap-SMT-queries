; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41396 () Bool)

(assert start!41396)

(declare-fun b!462635 () Bool)

(declare-fun e!270008 () Bool)

(assert (=> b!462635 (= e!270008 false)))

(declare-fun lt!209243 () Bool)

(declare-datatypes ((array!28825 0))(
  ( (array!28826 (arr!13846 (Array (_ BitVec 32) (_ BitVec 64))) (size!14198 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28825)

(declare-datatypes ((List!8350 0))(
  ( (Nil!8347) (Cons!8346 (h!9202 (_ BitVec 64)) (t!14294 List!8350)) )
))
(declare-fun arrayNoDuplicates!0 (array!28825 (_ BitVec 32) List!8350) Bool)

(assert (=> b!462635 (= lt!209243 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8347))))

(declare-fun res!276665 () Bool)

(assert (=> start!41396 (=> (not res!276665) (not e!270008))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41396 (= res!276665 (validMask!0 mask!1365))))

(assert (=> start!41396 e!270008))

(assert (=> start!41396 true))

(declare-fun array_inv!10010 (array!28825) Bool)

(assert (=> start!41396 (array_inv!10010 _keys!1025)))

(declare-datatypes ((V!17789 0))(
  ( (V!17790 (val!6301 Int)) )
))
(declare-datatypes ((ValueCell!5913 0))(
  ( (ValueCellFull!5913 (v!8588 V!17789)) (EmptyCell!5913) )
))
(declare-datatypes ((array!28827 0))(
  ( (array!28828 (arr!13847 (Array (_ BitVec 32) ValueCell!5913)) (size!14199 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28827)

(declare-fun e!270010 () Bool)

(declare-fun array_inv!10011 (array!28827) Bool)

(assert (=> start!41396 (and (array_inv!10011 _values!833) e!270010)))

(declare-fun b!462636 () Bool)

(declare-fun res!276664 () Bool)

(assert (=> b!462636 (=> (not res!276664) (not e!270008))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462636 (= res!276664 (and (= (size!14199 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14198 _keys!1025) (size!14199 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462637 () Bool)

(declare-fun e!270012 () Bool)

(declare-fun tp_is_empty!12513 () Bool)

(assert (=> b!462637 (= e!270012 tp_is_empty!12513)))

(declare-fun b!462638 () Bool)

(declare-fun res!276663 () Bool)

(assert (=> b!462638 (=> (not res!276663) (not e!270008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28825 (_ BitVec 32)) Bool)

(assert (=> b!462638 (= res!276663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20440 () Bool)

(declare-fun mapRes!20440 () Bool)

(assert (=> mapIsEmpty!20440 mapRes!20440))

(declare-fun b!462639 () Bool)

(declare-fun e!270009 () Bool)

(assert (=> b!462639 (= e!270010 (and e!270009 mapRes!20440))))

(declare-fun condMapEmpty!20440 () Bool)

(declare-fun mapDefault!20440 () ValueCell!5913)

(assert (=> b!462639 (= condMapEmpty!20440 (= (arr!13847 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5913)) mapDefault!20440)))))

(declare-fun b!462640 () Bool)

(assert (=> b!462640 (= e!270009 tp_is_empty!12513)))

(declare-fun mapNonEmpty!20440 () Bool)

(declare-fun tp!39259 () Bool)

(assert (=> mapNonEmpty!20440 (= mapRes!20440 (and tp!39259 e!270012))))

(declare-fun mapRest!20440 () (Array (_ BitVec 32) ValueCell!5913))

(declare-fun mapValue!20440 () ValueCell!5913)

(declare-fun mapKey!20440 () (_ BitVec 32))

(assert (=> mapNonEmpty!20440 (= (arr!13847 _values!833) (store mapRest!20440 mapKey!20440 mapValue!20440))))

(assert (= (and start!41396 res!276665) b!462636))

(assert (= (and b!462636 res!276664) b!462638))

(assert (= (and b!462638 res!276663) b!462635))

(assert (= (and b!462639 condMapEmpty!20440) mapIsEmpty!20440))

(assert (= (and b!462639 (not condMapEmpty!20440)) mapNonEmpty!20440))

(get-info :version)

(assert (= (and mapNonEmpty!20440 ((_ is ValueCellFull!5913) mapValue!20440)) b!462637))

(assert (= (and b!462639 ((_ is ValueCellFull!5913) mapDefault!20440)) b!462640))

(assert (= start!41396 b!462639))

(declare-fun m!445509 () Bool)

(assert (=> b!462635 m!445509))

(declare-fun m!445511 () Bool)

(assert (=> start!41396 m!445511))

(declare-fun m!445513 () Bool)

(assert (=> start!41396 m!445513))

(declare-fun m!445515 () Bool)

(assert (=> start!41396 m!445515))

(declare-fun m!445517 () Bool)

(assert (=> b!462638 m!445517))

(declare-fun m!445519 () Bool)

(assert (=> mapNonEmpty!20440 m!445519))

(check-sat (not b!462635) (not start!41396) (not mapNonEmpty!20440) (not b!462638) tp_is_empty!12513)
(check-sat)
