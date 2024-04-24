; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35890 () Bool)

(assert start!35890)

(declare-fun res!200859 () Bool)

(declare-fun e!220947 () Bool)

(assert (=> start!35890 (=> (not res!200859) (not e!220947))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35890 (= res!200859 (validMask!0 mask!1943))))

(assert (=> start!35890 e!220947))

(assert (=> start!35890 true))

(declare-datatypes ((V!12099 0))(
  ( (V!12100 (val!4215 Int)) )
))
(declare-datatypes ((ValueCell!3827 0))(
  ( (ValueCellFull!3827 (v!6410 V!12099)) (EmptyCell!3827) )
))
(declare-datatypes ((array!20214 0))(
  ( (array!20215 (arr!9599 (Array (_ BitVec 32) ValueCell!3827)) (size!9951 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20214)

(declare-fun e!220944 () Bool)

(declare-fun array_inv!7094 (array!20214) Bool)

(assert (=> start!35890 (and (array_inv!7094 _values!1277) e!220944)))

(declare-datatypes ((array!20216 0))(
  ( (array!20217 (arr!9600 (Array (_ BitVec 32) (_ BitVec 64))) (size!9952 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20216)

(declare-fun array_inv!7095 (array!20216) Bool)

(assert (=> start!35890 (array_inv!7095 _keys!1541)))

(declare-fun mapNonEmpty!14022 () Bool)

(declare-fun mapRes!14022 () Bool)

(declare-fun tp!28098 () Bool)

(declare-fun e!220943 () Bool)

(assert (=> mapNonEmpty!14022 (= mapRes!14022 (and tp!28098 e!220943))))

(declare-fun mapKey!14022 () (_ BitVec 32))

(declare-fun mapValue!14022 () ValueCell!3827)

(declare-fun mapRest!14022 () (Array (_ BitVec 32) ValueCell!3827))

(assert (=> mapNonEmpty!14022 (= (arr!9599 _values!1277) (store mapRest!14022 mapKey!14022 mapValue!14022))))

(declare-fun b!360960 () Bool)

(declare-fun e!220945 () Bool)

(assert (=> b!360960 (= e!220944 (and e!220945 mapRes!14022))))

(declare-fun condMapEmpty!14022 () Bool)

(declare-fun mapDefault!14022 () ValueCell!3827)

(assert (=> b!360960 (= condMapEmpty!14022 (= (arr!9599 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3827)) mapDefault!14022)))))

(declare-fun b!360961 () Bool)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!360961 (= e!220947 (and (= (size!9951 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9952 _keys!1541) (size!9951 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011) (not (= (size!9952 _keys!1541) (bvadd #b00000000000000000000000000000001 mask!1943)))))))

(declare-fun b!360962 () Bool)

(declare-fun tp_is_empty!8341 () Bool)

(assert (=> b!360962 (= e!220943 tp_is_empty!8341)))

(declare-fun b!360963 () Bool)

(assert (=> b!360963 (= e!220945 tp_is_empty!8341)))

(declare-fun mapIsEmpty!14022 () Bool)

(assert (=> mapIsEmpty!14022 mapRes!14022))

(assert (= (and start!35890 res!200859) b!360961))

(assert (= (and b!360960 condMapEmpty!14022) mapIsEmpty!14022))

(assert (= (and b!360960 (not condMapEmpty!14022)) mapNonEmpty!14022))

(get-info :version)

(assert (= (and mapNonEmpty!14022 ((_ is ValueCellFull!3827) mapValue!14022)) b!360962))

(assert (= (and b!360960 ((_ is ValueCellFull!3827) mapDefault!14022)) b!360963))

(assert (= start!35890 b!360960))

(declare-fun m!358229 () Bool)

(assert (=> start!35890 m!358229))

(declare-fun m!358231 () Bool)

(assert (=> start!35890 m!358231))

(declare-fun m!358233 () Bool)

(assert (=> start!35890 m!358233))

(declare-fun m!358235 () Bool)

(assert (=> mapNonEmpty!14022 m!358235))

(check-sat (not start!35890) (not mapNonEmpty!14022) tp_is_empty!8341)
(check-sat)
