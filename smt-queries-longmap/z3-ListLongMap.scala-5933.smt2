; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77352 () Bool)

(assert start!77352)

(declare-datatypes ((V!29535 0))(
  ( (V!29536 (val!9264 Int)) )
))
(declare-datatypes ((ValueCell!8732 0))(
  ( (ValueCellFull!8732 (v!11767 V!29535)) (EmptyCell!8732) )
))
(declare-datatypes ((array!52897 0))(
  ( (array!52898 (arr!25414 (Array (_ BitVec 32) ValueCell!8732)) (size!25875 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52897)

(declare-datatypes ((array!52899 0))(
  ( (array!52900 (arr!25415 (Array (_ BitVec 32) (_ BitVec 64))) (size!25876 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52899)

(declare-fun e!505046 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun b!901939 () Bool)

(assert (=> b!901939 (= e!505046 (and (= (size!25875 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25876 _keys!1386) (size!25875 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (= (size!25876 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)) (bvsgt #b00000000000000000000000000000000 (size!25876 _keys!1386))))))

(declare-fun res!608773 () Bool)

(assert (=> start!77352 (=> (not res!608773) (not e!505046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77352 (= res!608773 (validMask!0 mask!1756))))

(assert (=> start!77352 e!505046))

(assert (=> start!77352 true))

(declare-fun e!505047 () Bool)

(declare-fun array_inv!19986 (array!52897) Bool)

(assert (=> start!77352 (and (array_inv!19986 _values!1152) e!505047)))

(declare-fun array_inv!19987 (array!52899) Bool)

(assert (=> start!77352 (array_inv!19987 _keys!1386)))

(declare-fun b!901940 () Bool)

(declare-fun e!505049 () Bool)

(declare-fun tp_is_empty!18427 () Bool)

(assert (=> b!901940 (= e!505049 tp_is_empty!18427)))

(declare-fun mapNonEmpty!29335 () Bool)

(declare-fun mapRes!29335 () Bool)

(declare-fun tp!56395 () Bool)

(assert (=> mapNonEmpty!29335 (= mapRes!29335 (and tp!56395 e!505049))))

(declare-fun mapKey!29335 () (_ BitVec 32))

(declare-fun mapRest!29335 () (Array (_ BitVec 32) ValueCell!8732))

(declare-fun mapValue!29335 () ValueCell!8732)

(assert (=> mapNonEmpty!29335 (= (arr!25414 _values!1152) (store mapRest!29335 mapKey!29335 mapValue!29335))))

(declare-fun b!901941 () Bool)

(declare-fun e!505048 () Bool)

(assert (=> b!901941 (= e!505048 tp_is_empty!18427)))

(declare-fun mapIsEmpty!29335 () Bool)

(assert (=> mapIsEmpty!29335 mapRes!29335))

(declare-fun b!901942 () Bool)

(assert (=> b!901942 (= e!505047 (and e!505048 mapRes!29335))))

(declare-fun condMapEmpty!29335 () Bool)

(declare-fun mapDefault!29335 () ValueCell!8732)

(assert (=> b!901942 (= condMapEmpty!29335 (= (arr!25414 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8732)) mapDefault!29335)))))

(assert (= (and start!77352 res!608773) b!901939))

(assert (= (and b!901942 condMapEmpty!29335) mapIsEmpty!29335))

(assert (= (and b!901942 (not condMapEmpty!29335)) mapNonEmpty!29335))

(get-info :version)

(assert (= (and mapNonEmpty!29335 ((_ is ValueCellFull!8732) mapValue!29335)) b!901940))

(assert (= (and b!901942 ((_ is ValueCellFull!8732) mapDefault!29335)) b!901941))

(assert (= start!77352 b!901942))

(declare-fun m!837529 () Bool)

(assert (=> start!77352 m!837529))

(declare-fun m!837531 () Bool)

(assert (=> start!77352 m!837531))

(declare-fun m!837533 () Bool)

(assert (=> start!77352 m!837533))

(declare-fun m!837535 () Bool)

(assert (=> mapNonEmpty!29335 m!837535))

(check-sat (not start!77352) (not mapNonEmpty!29335) tp_is_empty!18427)
(check-sat)
(get-model)

(declare-fun d!111723 () Bool)

(assert (=> d!111723 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77352 d!111723))

(declare-fun d!111725 () Bool)

(assert (=> d!111725 (= (array_inv!19986 _values!1152) (bvsge (size!25875 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77352 d!111725))

(declare-fun d!111727 () Bool)

(assert (=> d!111727 (= (array_inv!19987 _keys!1386) (bvsge (size!25876 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77352 d!111727))

(declare-fun condMapEmpty!29344 () Bool)

(declare-fun mapDefault!29344 () ValueCell!8732)

(assert (=> mapNonEmpty!29335 (= condMapEmpty!29344 (= mapRest!29335 ((as const (Array (_ BitVec 32) ValueCell!8732)) mapDefault!29344)))))

(declare-fun e!505086 () Bool)

(declare-fun mapRes!29344 () Bool)

(assert (=> mapNonEmpty!29335 (= tp!56395 (and e!505086 mapRes!29344))))

(declare-fun b!901973 () Bool)

(declare-fun e!505085 () Bool)

(assert (=> b!901973 (= e!505085 tp_is_empty!18427)))

(declare-fun mapIsEmpty!29344 () Bool)

(assert (=> mapIsEmpty!29344 mapRes!29344))

(declare-fun b!901974 () Bool)

(assert (=> b!901974 (= e!505086 tp_is_empty!18427)))

(declare-fun mapNonEmpty!29344 () Bool)

(declare-fun tp!56404 () Bool)

(assert (=> mapNonEmpty!29344 (= mapRes!29344 (and tp!56404 e!505085))))

(declare-fun mapRest!29344 () (Array (_ BitVec 32) ValueCell!8732))

(declare-fun mapKey!29344 () (_ BitVec 32))

(declare-fun mapValue!29344 () ValueCell!8732)

(assert (=> mapNonEmpty!29344 (= mapRest!29335 (store mapRest!29344 mapKey!29344 mapValue!29344))))

(assert (= (and mapNonEmpty!29335 condMapEmpty!29344) mapIsEmpty!29344))

(assert (= (and mapNonEmpty!29335 (not condMapEmpty!29344)) mapNonEmpty!29344))

(assert (= (and mapNonEmpty!29344 ((_ is ValueCellFull!8732) mapValue!29344)) b!901973))

(assert (= (and mapNonEmpty!29335 ((_ is ValueCellFull!8732) mapDefault!29344)) b!901974))

(declare-fun m!837553 () Bool)

(assert (=> mapNonEmpty!29344 m!837553))

(check-sat (not mapNonEmpty!29344) tp_is_empty!18427)
(check-sat)
