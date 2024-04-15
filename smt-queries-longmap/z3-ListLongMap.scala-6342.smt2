; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81726 () Bool)

(assert start!81726)

(declare-fun b!953458 () Bool)

(declare-fun e!537068 () Bool)

(declare-fun e!537067 () Bool)

(declare-fun mapRes!33187 () Bool)

(assert (=> b!953458 (= e!537068 (and e!537067 mapRes!33187))))

(declare-fun condMapEmpty!33187 () Bool)

(declare-datatypes ((V!32753 0))(
  ( (V!32754 (val!10464 Int)) )
))
(declare-datatypes ((ValueCell!9932 0))(
  ( (ValueCellFull!9932 (v!13017 V!32753)) (EmptyCell!9932) )
))
(declare-datatypes ((array!57720 0))(
  ( (array!57721 (arr!27745 (Array (_ BitVec 32) ValueCell!9932)) (size!28226 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57720)

(declare-fun mapDefault!33187 () ValueCell!9932)

(assert (=> b!953458 (= condMapEmpty!33187 (= (arr!27745 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9932)) mapDefault!33187)))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun b!953459 () Bool)

(declare-datatypes ((array!57722 0))(
  ( (array!57723 (arr!27746 (Array (_ BitVec 32) (_ BitVec 64))) (size!28227 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57722)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun e!537070 () Bool)

(assert (=> b!953459 (= e!537070 (and (= (size!28226 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28227 _keys!1441) (size!28226 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (= (size!28227 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)) (bvsgt #b00000000000000000000000000000000 (size!28227 _keys!1441))))))

(declare-fun b!953460 () Bool)

(declare-fun e!537069 () Bool)

(declare-fun tp_is_empty!20827 () Bool)

(assert (=> b!953460 (= e!537069 tp_is_empty!20827)))

(declare-fun mapNonEmpty!33187 () Bool)

(declare-fun tp!63577 () Bool)

(assert (=> mapNonEmpty!33187 (= mapRes!33187 (and tp!63577 e!537069))))

(declare-fun mapValue!33187 () ValueCell!9932)

(declare-fun mapKey!33187 () (_ BitVec 32))

(declare-fun mapRest!33187 () (Array (_ BitVec 32) ValueCell!9932))

(assert (=> mapNonEmpty!33187 (= (arr!27745 _values!1197) (store mapRest!33187 mapKey!33187 mapValue!33187))))

(declare-fun res!638594 () Bool)

(assert (=> start!81726 (=> (not res!638594) (not e!537070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81726 (= res!638594 (validMask!0 mask!1823))))

(assert (=> start!81726 e!537070))

(assert (=> start!81726 true))

(declare-fun array_inv!21601 (array!57720) Bool)

(assert (=> start!81726 (and (array_inv!21601 _values!1197) e!537068)))

(declare-fun array_inv!21602 (array!57722) Bool)

(assert (=> start!81726 (array_inv!21602 _keys!1441)))

(declare-fun b!953461 () Bool)

(assert (=> b!953461 (= e!537067 tp_is_empty!20827)))

(declare-fun mapIsEmpty!33187 () Bool)

(assert (=> mapIsEmpty!33187 mapRes!33187))

(assert (= (and start!81726 res!638594) b!953459))

(assert (= (and b!953458 condMapEmpty!33187) mapIsEmpty!33187))

(assert (= (and b!953458 (not condMapEmpty!33187)) mapNonEmpty!33187))

(get-info :version)

(assert (= (and mapNonEmpty!33187 ((_ is ValueCellFull!9932) mapValue!33187)) b!953460))

(assert (= (and b!953458 ((_ is ValueCellFull!9932) mapDefault!33187)) b!953461))

(assert (= start!81726 b!953458))

(declare-fun m!884921 () Bool)

(assert (=> mapNonEmpty!33187 m!884921))

(declare-fun m!884923 () Bool)

(assert (=> start!81726 m!884923))

(declare-fun m!884925 () Bool)

(assert (=> start!81726 m!884925))

(declare-fun m!884927 () Bool)

(assert (=> start!81726 m!884927))

(check-sat (not start!81726) (not mapNonEmpty!33187) tp_is_empty!20827)
(check-sat)
(get-model)

(declare-fun d!115519 () Bool)

(assert (=> d!115519 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81726 d!115519))

(declare-fun d!115521 () Bool)

(assert (=> d!115521 (= (array_inv!21601 _values!1197) (bvsge (size!28226 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81726 d!115521))

(declare-fun d!115523 () Bool)

(assert (=> d!115523 (= (array_inv!21602 _keys!1441) (bvsge (size!28227 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81726 d!115523))

(declare-fun b!953493 () Bool)

(declare-fun e!537106 () Bool)

(assert (=> b!953493 (= e!537106 tp_is_empty!20827)))

(declare-fun mapIsEmpty!33196 () Bool)

(declare-fun mapRes!33196 () Bool)

(assert (=> mapIsEmpty!33196 mapRes!33196))

(declare-fun b!953492 () Bool)

(declare-fun e!537105 () Bool)

(assert (=> b!953492 (= e!537105 tp_is_empty!20827)))

(declare-fun condMapEmpty!33196 () Bool)

(declare-fun mapDefault!33196 () ValueCell!9932)

(assert (=> mapNonEmpty!33187 (= condMapEmpty!33196 (= mapRest!33187 ((as const (Array (_ BitVec 32) ValueCell!9932)) mapDefault!33196)))))

(assert (=> mapNonEmpty!33187 (= tp!63577 (and e!537106 mapRes!33196))))

(declare-fun mapNonEmpty!33196 () Bool)

(declare-fun tp!63586 () Bool)

(assert (=> mapNonEmpty!33196 (= mapRes!33196 (and tp!63586 e!537105))))

(declare-fun mapRest!33196 () (Array (_ BitVec 32) ValueCell!9932))

(declare-fun mapValue!33196 () ValueCell!9932)

(declare-fun mapKey!33196 () (_ BitVec 32))

(assert (=> mapNonEmpty!33196 (= mapRest!33187 (store mapRest!33196 mapKey!33196 mapValue!33196))))

(assert (= (and mapNonEmpty!33187 condMapEmpty!33196) mapIsEmpty!33196))

(assert (= (and mapNonEmpty!33187 (not condMapEmpty!33196)) mapNonEmpty!33196))

(assert (= (and mapNonEmpty!33196 ((_ is ValueCellFull!9932) mapValue!33196)) b!953492))

(assert (= (and mapNonEmpty!33187 ((_ is ValueCellFull!9932) mapDefault!33196)) b!953493))

(declare-fun m!884945 () Bool)

(assert (=> mapNonEmpty!33196 m!884945))

(check-sat (not mapNonEmpty!33196) tp_is_empty!20827)
(check-sat)
