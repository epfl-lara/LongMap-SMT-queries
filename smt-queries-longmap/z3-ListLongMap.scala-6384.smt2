; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82058 () Bool)

(assert start!82058)

(declare-fun b!956941 () Bool)

(declare-fun e!539287 () Bool)

(declare-fun e!539288 () Bool)

(declare-fun mapRes!33586 () Bool)

(assert (=> b!956941 (= e!539287 (and e!539288 mapRes!33586))))

(declare-fun condMapEmpty!33586 () Bool)

(declare-datatypes ((V!33091 0))(
  ( (V!33092 (val!10591 Int)) )
))
(declare-datatypes ((ValueCell!10059 0))(
  ( (ValueCellFull!10059 (v!13147 V!33091)) (EmptyCell!10059) )
))
(declare-datatypes ((array!58261 0))(
  ( (array!58262 (arr!28009 (Array (_ BitVec 32) ValueCell!10059)) (size!28488 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58261)

(declare-fun mapDefault!33586 () ValueCell!10059)

(assert (=> b!956941 (= condMapEmpty!33586 (= (arr!28009 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10059)) mapDefault!33586)))))

(declare-fun b!956942 () Bool)

(declare-fun tp_is_empty!21081 () Bool)

(assert (=> b!956942 (= e!539288 tp_is_empty!21081)))

(declare-fun b!956943 () Bool)

(declare-fun e!539290 () Bool)

(assert (=> b!956943 (= e!539290 tp_is_empty!21081)))

(declare-fun b!956944 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58263 0))(
  ( (array!58264 (arr!28010 (Array (_ BitVec 32) (_ BitVec 64))) (size!28489 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58263)

(declare-fun e!539286 () Bool)

(assert (=> b!956944 (= e!539286 (and (= (size!28488 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28489 _keys!1668) (size!28488 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (= (size!28489 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)) (bvsgt #b00000000000000000000000000000000 (size!28489 _keys!1668))))))

(declare-fun mapNonEmpty!33586 () Bool)

(declare-fun tp!64191 () Bool)

(assert (=> mapNonEmpty!33586 (= mapRes!33586 (and tp!64191 e!539290))))

(declare-fun mapKey!33586 () (_ BitVec 32))

(declare-fun mapValue!33586 () ValueCell!10059)

(declare-fun mapRest!33586 () (Array (_ BitVec 32) ValueCell!10059))

(assert (=> mapNonEmpty!33586 (= (arr!28009 _values!1386) (store mapRest!33586 mapKey!33586 mapValue!33586))))

(declare-fun res!640677 () Bool)

(assert (=> start!82058 (=> (not res!640677) (not e!539286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82058 (= res!640677 (validMask!0 mask!2088))))

(assert (=> start!82058 e!539286))

(assert (=> start!82058 true))

(declare-fun array_inv!21731 (array!58261) Bool)

(assert (=> start!82058 (and (array_inv!21731 _values!1386) e!539287)))

(declare-fun array_inv!21732 (array!58263) Bool)

(assert (=> start!82058 (array_inv!21732 _keys!1668)))

(declare-fun mapIsEmpty!33586 () Bool)

(assert (=> mapIsEmpty!33586 mapRes!33586))

(assert (= (and start!82058 res!640677) b!956944))

(assert (= (and b!956941 condMapEmpty!33586) mapIsEmpty!33586))

(assert (= (and b!956941 (not condMapEmpty!33586)) mapNonEmpty!33586))

(get-info :version)

(assert (= (and mapNonEmpty!33586 ((_ is ValueCellFull!10059) mapValue!33586)) b!956943))

(assert (= (and b!956941 ((_ is ValueCellFull!10059) mapDefault!33586)) b!956942))

(assert (= start!82058 b!956941))

(declare-fun m!888105 () Bool)

(assert (=> mapNonEmpty!33586 m!888105))

(declare-fun m!888107 () Bool)

(assert (=> start!82058 m!888107))

(declare-fun m!888109 () Bool)

(assert (=> start!82058 m!888109))

(declare-fun m!888111 () Bool)

(assert (=> start!82058 m!888111))

(check-sat (not start!82058) (not mapNonEmpty!33586) tp_is_empty!21081)
(check-sat)
(get-model)

(declare-fun d!115863 () Bool)

(assert (=> d!115863 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82058 d!115863))

(declare-fun d!115865 () Bool)

(assert (=> d!115865 (= (array_inv!21731 _values!1386) (bvsge (size!28488 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82058 d!115865))

(declare-fun d!115867 () Bool)

(assert (=> d!115867 (= (array_inv!21732 _keys!1668) (bvsge (size!28489 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82058 d!115867))

(declare-fun mapIsEmpty!33592 () Bool)

(declare-fun mapRes!33592 () Bool)

(assert (=> mapIsEmpty!33592 mapRes!33592))

(declare-fun b!956964 () Bool)

(declare-fun e!539310 () Bool)

(assert (=> b!956964 (= e!539310 tp_is_empty!21081)))

(declare-fun condMapEmpty!33592 () Bool)

(declare-fun mapDefault!33592 () ValueCell!10059)

(assert (=> mapNonEmpty!33586 (= condMapEmpty!33592 (= mapRest!33586 ((as const (Array (_ BitVec 32) ValueCell!10059)) mapDefault!33592)))))

(assert (=> mapNonEmpty!33586 (= tp!64191 (and e!539310 mapRes!33592))))

(declare-fun b!956963 () Bool)

(declare-fun e!539311 () Bool)

(assert (=> b!956963 (= e!539311 tp_is_empty!21081)))

(declare-fun mapNonEmpty!33592 () Bool)

(declare-fun tp!64197 () Bool)

(assert (=> mapNonEmpty!33592 (= mapRes!33592 (and tp!64197 e!539311))))

(declare-fun mapValue!33592 () ValueCell!10059)

(declare-fun mapRest!33592 () (Array (_ BitVec 32) ValueCell!10059))

(declare-fun mapKey!33592 () (_ BitVec 32))

(assert (=> mapNonEmpty!33592 (= mapRest!33586 (store mapRest!33592 mapKey!33592 mapValue!33592))))

(assert (= (and mapNonEmpty!33586 condMapEmpty!33592) mapIsEmpty!33592))

(assert (= (and mapNonEmpty!33586 (not condMapEmpty!33592)) mapNonEmpty!33592))

(assert (= (and mapNonEmpty!33592 ((_ is ValueCellFull!10059) mapValue!33592)) b!956963))

(assert (= (and mapNonEmpty!33586 ((_ is ValueCellFull!10059) mapDefault!33592)) b!956964))

(declare-fun m!888121 () Bool)

(assert (=> mapNonEmpty!33592 m!888121))

(check-sat (not mapNonEmpty!33592) tp_is_empty!21081)
(check-sat)
