; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77464 () Bool)

(assert start!77464)

(declare-fun mapNonEmpty!29425 () Bool)

(declare-fun mapRes!29425 () Bool)

(declare-fun tp!56484 () Bool)

(declare-fun e!505667 () Bool)

(assert (=> mapNonEmpty!29425 (= mapRes!29425 (and tp!56484 e!505667))))

(declare-datatypes ((V!29601 0))(
  ( (V!29602 (val!9289 Int)) )
))
(declare-datatypes ((ValueCell!8757 0))(
  ( (ValueCellFull!8757 (v!11794 V!29601)) (EmptyCell!8757) )
))
(declare-datatypes ((array!53014 0))(
  ( (array!53015 (arr!25467 (Array (_ BitVec 32) ValueCell!8757)) (size!25926 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53014)

(declare-fun mapKey!29425 () (_ BitVec 32))

(declare-fun mapRest!29425 () (Array (_ BitVec 32) ValueCell!8757))

(declare-fun mapValue!29425 () ValueCell!8757)

(assert (=> mapNonEmpty!29425 (= (arr!25467 _values!1152) (store mapRest!29425 mapKey!29425 mapValue!29425))))

(declare-fun b!902758 () Bool)

(declare-fun tp_is_empty!18477 () Bool)

(assert (=> b!902758 (= e!505667 tp_is_empty!18477)))

(declare-fun b!902759 () Bool)

(declare-fun e!505666 () Bool)

(declare-fun e!505668 () Bool)

(assert (=> b!902759 (= e!505666 (and e!505668 mapRes!29425))))

(declare-fun condMapEmpty!29425 () Bool)

(declare-fun mapDefault!29425 () ValueCell!8757)

(assert (=> b!902759 (= condMapEmpty!29425 (= (arr!25467 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8757)) mapDefault!29425)))))

(declare-fun res!609176 () Bool)

(declare-fun e!505665 () Bool)

(assert (=> start!77464 (=> (not res!609176) (not e!505665))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77464 (= res!609176 (validMask!0 mask!1756))))

(assert (=> start!77464 e!505665))

(assert (=> start!77464 true))

(declare-fun array_inv!19962 (array!53014) Bool)

(assert (=> start!77464 (and (array_inv!19962 _values!1152) e!505666)))

(declare-datatypes ((array!53016 0))(
  ( (array!53017 (arr!25468 (Array (_ BitVec 32) (_ BitVec 64))) (size!25927 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53016)

(declare-fun array_inv!19963 (array!53016) Bool)

(assert (=> start!77464 (array_inv!19963 _keys!1386)))

(declare-fun b!902760 () Bool)

(declare-fun res!609175 () Bool)

(assert (=> b!902760 (=> (not res!609175) (not e!505665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53016 (_ BitVec 32)) Bool)

(assert (=> b!902760 (= res!609175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902761 () Bool)

(declare-fun res!609174 () Bool)

(assert (=> b!902761 (=> (not res!609174) (not e!505665))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902761 (= res!609174 (and (= (size!25926 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25927 _keys!1386) (size!25926 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902762 () Bool)

(assert (=> b!902762 (= e!505665 false)))

(declare-fun lt!407910 () Bool)

(declare-datatypes ((List!17891 0))(
  ( (Nil!17888) (Cons!17887 (h!19033 (_ BitVec 64)) (t!25274 List!17891)) )
))
(declare-fun arrayNoDuplicates!0 (array!53016 (_ BitVec 32) List!17891) Bool)

(assert (=> b!902762 (= lt!407910 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17888))))

(declare-fun mapIsEmpty!29425 () Bool)

(assert (=> mapIsEmpty!29425 mapRes!29425))

(declare-fun b!902763 () Bool)

(assert (=> b!902763 (= e!505668 tp_is_empty!18477)))

(assert (= (and start!77464 res!609176) b!902761))

(assert (= (and b!902761 res!609174) b!902760))

(assert (= (and b!902760 res!609175) b!902762))

(assert (= (and b!902759 condMapEmpty!29425) mapIsEmpty!29425))

(assert (= (and b!902759 (not condMapEmpty!29425)) mapNonEmpty!29425))

(get-info :version)

(assert (= (and mapNonEmpty!29425 ((_ is ValueCellFull!8757) mapValue!29425)) b!902758))

(assert (= (and b!902759 ((_ is ValueCellFull!8757) mapDefault!29425)) b!902763))

(assert (= start!77464 b!902759))

(declare-fun m!838651 () Bool)

(assert (=> mapNonEmpty!29425 m!838651))

(declare-fun m!838653 () Bool)

(assert (=> start!77464 m!838653))

(declare-fun m!838655 () Bool)

(assert (=> start!77464 m!838655))

(declare-fun m!838657 () Bool)

(assert (=> start!77464 m!838657))

(declare-fun m!838659 () Bool)

(assert (=> b!902760 m!838659))

(declare-fun m!838661 () Bool)

(assert (=> b!902762 m!838661))

(check-sat (not b!902762) (not b!902760) tp_is_empty!18477 (not start!77464) (not mapNonEmpty!29425))
(check-sat)
