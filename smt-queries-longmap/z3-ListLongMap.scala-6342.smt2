; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81912 () Bool)

(assert start!81912)

(declare-fun res!639048 () Bool)

(declare-fun e!537799 () Bool)

(assert (=> start!81912 (=> (not res!639048) (not e!537799))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81912 (= res!639048 (validMask!0 mask!1823))))

(assert (=> start!81912 e!537799))

(assert (=> start!81912 true))

(declare-datatypes ((V!32753 0))(
  ( (V!32754 (val!10464 Int)) )
))
(declare-datatypes ((ValueCell!9932 0))(
  ( (ValueCellFull!9932 (v!13015 V!32753)) (EmptyCell!9932) )
))
(declare-datatypes ((array!57806 0))(
  ( (array!57807 (arr!27783 (Array (_ BitVec 32) ValueCell!9932)) (size!28263 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57806)

(declare-fun e!537798 () Bool)

(declare-fun array_inv!21639 (array!57806) Bool)

(assert (=> start!81912 (and (array_inv!21639 _values!1197) e!537798)))

(declare-datatypes ((array!57808 0))(
  ( (array!57809 (arr!27784 (Array (_ BitVec 32) (_ BitVec 64))) (size!28264 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57808)

(declare-fun array_inv!21640 (array!57808) Bool)

(assert (=> start!81912 (array_inv!21640 _keys!1441)))

(declare-fun mapNonEmpty!33187 () Bool)

(declare-fun mapRes!33187 () Bool)

(declare-fun tp!63577 () Bool)

(declare-fun e!537796 () Bool)

(assert (=> mapNonEmpty!33187 (= mapRes!33187 (and tp!63577 e!537796))))

(declare-fun mapKey!33187 () (_ BitVec 32))

(declare-fun mapRest!33187 () (Array (_ BitVec 32) ValueCell!9932))

(declare-fun mapValue!33187 () ValueCell!9932)

(assert (=> mapNonEmpty!33187 (= (arr!27783 _values!1197) (store mapRest!33187 mapKey!33187 mapValue!33187))))

(declare-fun b!954600 () Bool)

(declare-fun e!537797 () Bool)

(assert (=> b!954600 (= e!537798 (and e!537797 mapRes!33187))))

(declare-fun condMapEmpty!33187 () Bool)

(declare-fun mapDefault!33187 () ValueCell!9932)

(assert (=> b!954600 (= condMapEmpty!33187 (= (arr!27783 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9932)) mapDefault!33187)))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun b!954601 () Bool)

(assert (=> b!954601 (= e!537799 (and (= (size!28263 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28264 _keys!1441) (size!28263 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (= (size!28264 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)) (bvsgt #b00000000000000000000000000000000 (size!28264 _keys!1441))))))

(declare-fun b!954602 () Bool)

(declare-fun tp_is_empty!20827 () Bool)

(assert (=> b!954602 (= e!537796 tp_is_empty!20827)))

(declare-fun mapIsEmpty!33187 () Bool)

(assert (=> mapIsEmpty!33187 mapRes!33187))

(declare-fun b!954603 () Bool)

(assert (=> b!954603 (= e!537797 tp_is_empty!20827)))

(assert (= (and start!81912 res!639048) b!954601))

(assert (= (and b!954600 condMapEmpty!33187) mapIsEmpty!33187))

(assert (= (and b!954600 (not condMapEmpty!33187)) mapNonEmpty!33187))

(get-info :version)

(assert (= (and mapNonEmpty!33187 ((_ is ValueCellFull!9932) mapValue!33187)) b!954602))

(assert (= (and b!954600 ((_ is ValueCellFull!9932) mapDefault!33187)) b!954603))

(assert (= start!81912 b!954600))

(declare-fun m!886973 () Bool)

(assert (=> start!81912 m!886973))

(declare-fun m!886975 () Bool)

(assert (=> start!81912 m!886975))

(declare-fun m!886977 () Bool)

(assert (=> start!81912 m!886977))

(declare-fun m!886979 () Bool)

(assert (=> mapNonEmpty!33187 m!886979))

(check-sat (not start!81912) (not mapNonEmpty!33187) tp_is_empty!20827)
(check-sat)
(get-model)

(declare-fun d!116039 () Bool)

(assert (=> d!116039 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81912 d!116039))

(declare-fun d!116041 () Bool)

(assert (=> d!116041 (= (array_inv!21639 _values!1197) (bvsge (size!28263 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81912 d!116041))

(declare-fun d!116043 () Bool)

(assert (=> d!116043 (= (array_inv!21640 _keys!1441) (bvsge (size!28264 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81912 d!116043))

(declare-fun condMapEmpty!33196 () Bool)

(declare-fun mapDefault!33196 () ValueCell!9932)

(assert (=> mapNonEmpty!33187 (= condMapEmpty!33196 (= mapRest!33187 ((as const (Array (_ BitVec 32) ValueCell!9932)) mapDefault!33196)))))

(declare-fun e!537836 () Bool)

(declare-fun mapRes!33196 () Bool)

(assert (=> mapNonEmpty!33187 (= tp!63577 (and e!537836 mapRes!33196))))

(declare-fun mapNonEmpty!33196 () Bool)

(declare-fun tp!63586 () Bool)

(declare-fun e!537835 () Bool)

(assert (=> mapNonEmpty!33196 (= mapRes!33196 (and tp!63586 e!537835))))

(declare-fun mapValue!33196 () ValueCell!9932)

(declare-fun mapRest!33196 () (Array (_ BitVec 32) ValueCell!9932))

(declare-fun mapKey!33196 () (_ BitVec 32))

(assert (=> mapNonEmpty!33196 (= mapRest!33187 (store mapRest!33196 mapKey!33196 mapValue!33196))))

(declare-fun mapIsEmpty!33196 () Bool)

(assert (=> mapIsEmpty!33196 mapRes!33196))

(declare-fun b!954635 () Bool)

(assert (=> b!954635 (= e!537836 tp_is_empty!20827)))

(declare-fun b!954634 () Bool)

(assert (=> b!954634 (= e!537835 tp_is_empty!20827)))

(assert (= (and mapNonEmpty!33187 condMapEmpty!33196) mapIsEmpty!33196))

(assert (= (and mapNonEmpty!33187 (not condMapEmpty!33196)) mapNonEmpty!33196))

(assert (= (and mapNonEmpty!33196 ((_ is ValueCellFull!9932) mapValue!33196)) b!954634))

(assert (= (and mapNonEmpty!33187 ((_ is ValueCellFull!9932) mapDefault!33196)) b!954635))

(declare-fun m!886997 () Bool)

(assert (=> mapNonEmpty!33196 m!886997))

(check-sat (not mapNonEmpty!33196) tp_is_empty!20827)
(check-sat)
