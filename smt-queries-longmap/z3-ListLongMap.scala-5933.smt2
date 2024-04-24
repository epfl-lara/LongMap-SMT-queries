; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77538 () Bool)

(assert start!77538)

(declare-fun b!903081 () Bool)

(declare-fun e!505778 () Bool)

(declare-fun e!505776 () Bool)

(declare-fun mapRes!29335 () Bool)

(assert (=> b!903081 (= e!505778 (and e!505776 mapRes!29335))))

(declare-fun condMapEmpty!29335 () Bool)

(declare-datatypes ((V!29535 0))(
  ( (V!29536 (val!9264 Int)) )
))
(declare-datatypes ((ValueCell!8732 0))(
  ( (ValueCellFull!8732 (v!11765 V!29535)) (EmptyCell!8732) )
))
(declare-datatypes ((array!52951 0))(
  ( (array!52952 (arr!25436 (Array (_ BitVec 32) ValueCell!8732)) (size!25896 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52951)

(declare-fun mapDefault!29335 () ValueCell!8732)

(assert (=> b!903081 (= condMapEmpty!29335 (= (arr!25436 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8732)) mapDefault!29335)))))

(declare-fun mapIsEmpty!29335 () Bool)

(assert (=> mapIsEmpty!29335 mapRes!29335))

(declare-fun b!903082 () Bool)

(declare-fun e!505780 () Bool)

(declare-fun tp_is_empty!18427 () Bool)

(assert (=> b!903082 (= e!505780 tp_is_empty!18427)))

(declare-fun b!903083 () Bool)

(assert (=> b!903083 (= e!505776 tp_is_empty!18427)))

(declare-fun res!609227 () Bool)

(declare-fun e!505777 () Bool)

(assert (=> start!77538 (=> (not res!609227) (not e!505777))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77538 (= res!609227 (validMask!0 mask!1756))))

(assert (=> start!77538 e!505777))

(assert (=> start!77538 true))

(declare-fun array_inv!20006 (array!52951) Bool)

(assert (=> start!77538 (and (array_inv!20006 _values!1152) e!505778)))

(declare-datatypes ((array!52953 0))(
  ( (array!52954 (arr!25437 (Array (_ BitVec 32) (_ BitVec 64))) (size!25897 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52953)

(declare-fun array_inv!20007 (array!52953) Bool)

(assert (=> start!77538 (array_inv!20007 _keys!1386)))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun b!903084 () Bool)

(assert (=> b!903084 (= e!505777 (and (= (size!25896 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25897 _keys!1386) (size!25896 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (= (size!25897 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)) (bvsgt #b00000000000000000000000000000000 (size!25897 _keys!1386))))))

(declare-fun mapNonEmpty!29335 () Bool)

(declare-fun tp!56395 () Bool)

(assert (=> mapNonEmpty!29335 (= mapRes!29335 (and tp!56395 e!505780))))

(declare-fun mapRest!29335 () (Array (_ BitVec 32) ValueCell!8732))

(declare-fun mapValue!29335 () ValueCell!8732)

(declare-fun mapKey!29335 () (_ BitVec 32))

(assert (=> mapNonEmpty!29335 (= (arr!25436 _values!1152) (store mapRest!29335 mapKey!29335 mapValue!29335))))

(assert (= (and start!77538 res!609227) b!903084))

(assert (= (and b!903081 condMapEmpty!29335) mapIsEmpty!29335))

(assert (= (and b!903081 (not condMapEmpty!29335)) mapNonEmpty!29335))

(get-info :version)

(assert (= (and mapNonEmpty!29335 ((_ is ValueCellFull!8732) mapValue!29335)) b!903082))

(assert (= (and b!903081 ((_ is ValueCellFull!8732) mapDefault!29335)) b!903083))

(assert (= start!77538 b!903081))

(declare-fun m!839581 () Bool)

(assert (=> start!77538 m!839581))

(declare-fun m!839583 () Bool)

(assert (=> start!77538 m!839583))

(declare-fun m!839585 () Bool)

(assert (=> start!77538 m!839585))

(declare-fun m!839587 () Bool)

(assert (=> mapNonEmpty!29335 m!839587))

(check-sat (not start!77538) (not mapNonEmpty!29335) tp_is_empty!18427)
(check-sat)
(get-model)

(declare-fun d!112243 () Bool)

(assert (=> d!112243 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77538 d!112243))

(declare-fun d!112245 () Bool)

(assert (=> d!112245 (= (array_inv!20006 _values!1152) (bvsge (size!25896 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77538 d!112245))

(declare-fun d!112247 () Bool)

(assert (=> d!112247 (= (array_inv!20007 _keys!1386) (bvsge (size!25897 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77538 d!112247))

(declare-fun b!903116 () Bool)

(declare-fun e!505816 () Bool)

(assert (=> b!903116 (= e!505816 tp_is_empty!18427)))

(declare-fun mapNonEmpty!29344 () Bool)

(declare-fun mapRes!29344 () Bool)

(declare-fun tp!56404 () Bool)

(declare-fun e!505815 () Bool)

(assert (=> mapNonEmpty!29344 (= mapRes!29344 (and tp!56404 e!505815))))

(declare-fun mapKey!29344 () (_ BitVec 32))

(declare-fun mapValue!29344 () ValueCell!8732)

(declare-fun mapRest!29344 () (Array (_ BitVec 32) ValueCell!8732))

(assert (=> mapNonEmpty!29344 (= mapRest!29335 (store mapRest!29344 mapKey!29344 mapValue!29344))))

(declare-fun b!903115 () Bool)

(assert (=> b!903115 (= e!505815 tp_is_empty!18427)))

(declare-fun mapIsEmpty!29344 () Bool)

(assert (=> mapIsEmpty!29344 mapRes!29344))

(declare-fun condMapEmpty!29344 () Bool)

(declare-fun mapDefault!29344 () ValueCell!8732)

(assert (=> mapNonEmpty!29335 (= condMapEmpty!29344 (= mapRest!29335 ((as const (Array (_ BitVec 32) ValueCell!8732)) mapDefault!29344)))))

(assert (=> mapNonEmpty!29335 (= tp!56395 (and e!505816 mapRes!29344))))

(assert (= (and mapNonEmpty!29335 condMapEmpty!29344) mapIsEmpty!29344))

(assert (= (and mapNonEmpty!29335 (not condMapEmpty!29344)) mapNonEmpty!29344))

(assert (= (and mapNonEmpty!29344 ((_ is ValueCellFull!8732) mapValue!29344)) b!903115))

(assert (= (and mapNonEmpty!29335 ((_ is ValueCellFull!8732) mapDefault!29344)) b!903116))

(declare-fun m!839605 () Bool)

(assert (=> mapNonEmpty!29344 m!839605))

(check-sat (not mapNonEmpty!29344) tp_is_empty!18427)
(check-sat)
