; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81746 () Bool)

(assert start!81746)

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun b!953709 () Bool)

(declare-datatypes ((array!57761 0))(
  ( (array!57762 (arr!27765 (Array (_ BitVec 32) (_ BitVec 64))) (size!28244 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57761)

(declare-datatypes ((V!32755 0))(
  ( (V!32756 (val!10465 Int)) )
))
(declare-datatypes ((ValueCell!9933 0))(
  ( (ValueCellFull!9933 (v!13019 V!32755)) (EmptyCell!9933) )
))
(declare-datatypes ((array!57763 0))(
  ( (array!57764 (arr!27766 (Array (_ BitVec 32) ValueCell!9933)) (size!28245 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57763)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun e!537230 () Bool)

(assert (=> b!953709 (= e!537230 (and (= (size!28245 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28244 _keys!1441) (size!28245 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (= (size!28244 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)) (bvsgt #b00000000000000000000000000000000 (size!28244 _keys!1441))))))

(declare-fun mapNonEmpty!33190 () Bool)

(declare-fun mapRes!33190 () Bool)

(declare-fun tp!63579 () Bool)

(declare-fun e!537229 () Bool)

(assert (=> mapNonEmpty!33190 (= mapRes!33190 (and tp!63579 e!537229))))

(declare-fun mapRest!33190 () (Array (_ BitVec 32) ValueCell!9933))

(declare-fun mapValue!33190 () ValueCell!9933)

(declare-fun mapKey!33190 () (_ BitVec 32))

(assert (=> mapNonEmpty!33190 (= (arr!27766 _values!1197) (store mapRest!33190 mapKey!33190 mapValue!33190))))

(declare-fun b!953710 () Bool)

(declare-fun e!537231 () Bool)

(declare-fun e!537233 () Bool)

(assert (=> b!953710 (= e!537231 (and e!537233 mapRes!33190))))

(declare-fun condMapEmpty!33190 () Bool)

(declare-fun mapDefault!33190 () ValueCell!9933)

(assert (=> b!953710 (= condMapEmpty!33190 (= (arr!27766 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9933)) mapDefault!33190)))))

(declare-fun res!638707 () Bool)

(assert (=> start!81746 (=> (not res!638707) (not e!537230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81746 (= res!638707 (validMask!0 mask!1823))))

(assert (=> start!81746 e!537230))

(assert (=> start!81746 true))

(declare-fun array_inv!21555 (array!57763) Bool)

(assert (=> start!81746 (and (array_inv!21555 _values!1197) e!537231)))

(declare-fun array_inv!21556 (array!57761) Bool)

(assert (=> start!81746 (array_inv!21556 _keys!1441)))

(declare-fun b!953711 () Bool)

(declare-fun tp_is_empty!20829 () Bool)

(assert (=> b!953711 (= e!537233 tp_is_empty!20829)))

(declare-fun b!953712 () Bool)

(assert (=> b!953712 (= e!537229 tp_is_empty!20829)))

(declare-fun mapIsEmpty!33190 () Bool)

(assert (=> mapIsEmpty!33190 mapRes!33190))

(assert (= (and start!81746 res!638707) b!953709))

(assert (= (and b!953710 condMapEmpty!33190) mapIsEmpty!33190))

(assert (= (and b!953710 (not condMapEmpty!33190)) mapNonEmpty!33190))

(get-info :version)

(assert (= (and mapNonEmpty!33190 ((_ is ValueCellFull!9933) mapValue!33190)) b!953712))

(assert (= (and b!953710 ((_ is ValueCellFull!9933) mapDefault!33190)) b!953711))

(assert (= start!81746 b!953710))

(declare-fun m!885687 () Bool)

(assert (=> mapNonEmpty!33190 m!885687))

(declare-fun m!885689 () Bool)

(assert (=> start!81746 m!885689))

(declare-fun m!885691 () Bool)

(assert (=> start!81746 m!885691))

(declare-fun m!885693 () Bool)

(assert (=> start!81746 m!885693))

(check-sat (not start!81746) (not mapNonEmpty!33190) tp_is_empty!20829)
(check-sat)
(get-model)

(declare-fun d!115717 () Bool)

(assert (=> d!115717 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81746 d!115717))

(declare-fun d!115719 () Bool)

(assert (=> d!115719 (= (array_inv!21555 _values!1197) (bvsge (size!28245 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81746 d!115719))

(declare-fun d!115721 () Bool)

(assert (=> d!115721 (= (array_inv!21556 _keys!1441) (bvsge (size!28244 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81746 d!115721))

(declare-fun mapIsEmpty!33196 () Bool)

(declare-fun mapRes!33196 () Bool)

(assert (=> mapIsEmpty!33196 mapRes!33196))

(declare-fun b!953732 () Bool)

(declare-fun e!537254 () Bool)

(assert (=> b!953732 (= e!537254 tp_is_empty!20829)))

(declare-fun mapNonEmpty!33196 () Bool)

(declare-fun tp!63585 () Bool)

(declare-fun e!537253 () Bool)

(assert (=> mapNonEmpty!33196 (= mapRes!33196 (and tp!63585 e!537253))))

(declare-fun mapKey!33196 () (_ BitVec 32))

(declare-fun mapValue!33196 () ValueCell!9933)

(declare-fun mapRest!33196 () (Array (_ BitVec 32) ValueCell!9933))

(assert (=> mapNonEmpty!33196 (= mapRest!33190 (store mapRest!33196 mapKey!33196 mapValue!33196))))

(declare-fun b!953731 () Bool)

(assert (=> b!953731 (= e!537253 tp_is_empty!20829)))

(declare-fun condMapEmpty!33196 () Bool)

(declare-fun mapDefault!33196 () ValueCell!9933)

(assert (=> mapNonEmpty!33190 (= condMapEmpty!33196 (= mapRest!33190 ((as const (Array (_ BitVec 32) ValueCell!9933)) mapDefault!33196)))))

(assert (=> mapNonEmpty!33190 (= tp!63579 (and e!537254 mapRes!33196))))

(assert (= (and mapNonEmpty!33190 condMapEmpty!33196) mapIsEmpty!33196))

(assert (= (and mapNonEmpty!33190 (not condMapEmpty!33196)) mapNonEmpty!33196))

(assert (= (and mapNonEmpty!33196 ((_ is ValueCellFull!9933) mapValue!33196)) b!953731))

(assert (= (and mapNonEmpty!33190 ((_ is ValueCellFull!9933) mapDefault!33196)) b!953732))

(declare-fun m!885703 () Bool)

(assert (=> mapNonEmpty!33196 m!885703))

(check-sat (not mapNonEmpty!33196) tp_is_empty!20829)
(check-sat)
