; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35906 () Bool)

(assert start!35906)

(declare-fun mapNonEmpty!14025 () Bool)

(declare-fun mapRes!14025 () Bool)

(declare-fun tp!28101 () Bool)

(declare-fun e!220996 () Bool)

(assert (=> mapNonEmpty!14025 (= mapRes!14025 (and tp!28101 e!220996))))

(declare-fun mapKey!14025 () (_ BitVec 32))

(declare-datatypes ((V!12101 0))(
  ( (V!12102 (val!4216 Int)) )
))
(declare-datatypes ((ValueCell!3828 0))(
  ( (ValueCellFull!3828 (v!6410 V!12101)) (EmptyCell!3828) )
))
(declare-datatypes ((array!20235 0))(
  ( (array!20236 (arr!9610 (Array (_ BitVec 32) ValueCell!3828)) (size!9962 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20235)

(declare-fun mapRest!14025 () (Array (_ BitVec 32) ValueCell!3828))

(declare-fun mapValue!14025 () ValueCell!3828)

(assert (=> mapNonEmpty!14025 (= (arr!9610 _values!1277) (store mapRest!14025 mapKey!14025 mapValue!14025))))

(declare-fun b!361026 () Bool)

(declare-fun tp_is_empty!8343 () Bool)

(assert (=> b!361026 (= e!220996 tp_is_empty!8343)))

(declare-fun mapIsEmpty!14025 () Bool)

(assert (=> mapIsEmpty!14025 mapRes!14025))

(declare-fun res!200865 () Bool)

(declare-fun e!220993 () Bool)

(assert (=> start!35906 (=> (not res!200865) (not e!220993))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35906 (= res!200865 (validMask!0 mask!1943))))

(assert (=> start!35906 e!220993))

(assert (=> start!35906 true))

(declare-fun e!220994 () Bool)

(declare-fun array_inv!7068 (array!20235) Bool)

(assert (=> start!35906 (and (array_inv!7068 _values!1277) e!220994)))

(declare-datatypes ((array!20237 0))(
  ( (array!20238 (arr!9611 (Array (_ BitVec 32) (_ BitVec 64))) (size!9963 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20237)

(declare-fun array_inv!7069 (array!20237) Bool)

(assert (=> start!35906 (array_inv!7069 _keys!1541)))

(declare-fun b!361025 () Bool)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361025 (= e!220993 (and (= (size!9962 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9963 _keys!1541) (size!9962 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011) (not (= (size!9963 _keys!1541) (bvadd #b00000000000000000000000000000001 mask!1943)))))))

(declare-fun b!361027 () Bool)

(declare-fun e!220992 () Bool)

(assert (=> b!361027 (= e!220994 (and e!220992 mapRes!14025))))

(declare-fun condMapEmpty!14025 () Bool)

(declare-fun mapDefault!14025 () ValueCell!3828)

(assert (=> b!361027 (= condMapEmpty!14025 (= (arr!9610 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3828)) mapDefault!14025)))))

(declare-fun b!361028 () Bool)

(assert (=> b!361028 (= e!220992 tp_is_empty!8343)))

(assert (= (and start!35906 res!200865) b!361025))

(assert (= (and b!361027 condMapEmpty!14025) mapIsEmpty!14025))

(assert (= (and b!361027 (not condMapEmpty!14025)) mapNonEmpty!14025))

(get-info :version)

(assert (= (and mapNonEmpty!14025 ((_ is ValueCellFull!3828) mapValue!14025)) b!361026))

(assert (= (and b!361027 ((_ is ValueCellFull!3828) mapDefault!14025)) b!361028))

(assert (= start!35906 b!361027))

(declare-fun m!358013 () Bool)

(assert (=> mapNonEmpty!14025 m!358013))

(declare-fun m!358015 () Bool)

(assert (=> start!35906 m!358015))

(declare-fun m!358017 () Bool)

(assert (=> start!35906 m!358017))

(declare-fun m!358019 () Bool)

(assert (=> start!35906 m!358019))

(check-sat (not start!35906) (not mapNonEmpty!14025) tp_is_empty!8343)
(check-sat)
