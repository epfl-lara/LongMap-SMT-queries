; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82580 () Bool)

(assert start!82580)

(declare-fun b!961855 () Bool)

(declare-fun e!542288 () Bool)

(declare-fun tp_is_empty!21391 () Bool)

(assert (=> b!961855 (= e!542288 tp_is_empty!21391)))

(declare-fun mapNonEmpty!34066 () Bool)

(declare-fun mapRes!34066 () Bool)

(declare-fun tp!64996 () Bool)

(assert (=> mapNonEmpty!34066 (= mapRes!34066 (and tp!64996 e!542288))))

(declare-datatypes ((V!33505 0))(
  ( (V!33506 (val!10746 Int)) )
))
(declare-datatypes ((ValueCell!10214 0))(
  ( (ValueCellFull!10214 (v!13300 V!33505)) (EmptyCell!10214) )
))
(declare-datatypes ((array!58902 0))(
  ( (array!58903 (arr!28320 (Array (_ BitVec 32) ValueCell!10214)) (size!28800 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58902)

(declare-fun mapValue!34066 () ValueCell!10214)

(declare-fun mapKey!34066 () (_ BitVec 32))

(declare-fun mapRest!34066 () (Array (_ BitVec 32) ValueCell!10214))

(assert (=> mapNonEmpty!34066 (= (arr!28320 _values!1400) (store mapRest!34066 mapKey!34066 mapValue!34066))))

(declare-fun b!961856 () Bool)

(declare-fun e!542289 () Bool)

(declare-fun e!542291 () Bool)

(assert (=> b!961856 (= e!542289 (and e!542291 mapRes!34066))))

(declare-fun condMapEmpty!34066 () Bool)

(declare-fun mapDefault!34066 () ValueCell!10214)

(assert (=> b!961856 (= condMapEmpty!34066 (= (arr!28320 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10214)) mapDefault!34066)))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!58904 0))(
  ( (array!58905 (arr!28321 (Array (_ BitVec 32) (_ BitVec 64))) (size!28801 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58904)

(declare-fun b!961857 () Bool)

(declare-fun e!542290 () Bool)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961857 (= e!542290 (and (= (size!28800 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28801 _keys!1686) (size!28800 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (= (size!28801 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)) (bvsgt #b00000000000000000000000000000000 (size!28801 _keys!1686))))))

(declare-fun b!961858 () Bool)

(assert (=> b!961858 (= e!542291 tp_is_empty!21391)))

(declare-fun res!643573 () Bool)

(assert (=> start!82580 (=> (not res!643573) (not e!542290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82580 (= res!643573 (validMask!0 mask!2110))))

(assert (=> start!82580 e!542290))

(assert (=> start!82580 true))

(declare-fun array_inv!22025 (array!58902) Bool)

(assert (=> start!82580 (and (array_inv!22025 _values!1400) e!542289)))

(declare-fun array_inv!22026 (array!58904) Bool)

(assert (=> start!82580 (array_inv!22026 _keys!1686)))

(declare-fun mapIsEmpty!34066 () Bool)

(assert (=> mapIsEmpty!34066 mapRes!34066))

(assert (= (and start!82580 res!643573) b!961857))

(assert (= (and b!961856 condMapEmpty!34066) mapIsEmpty!34066))

(assert (= (and b!961856 (not condMapEmpty!34066)) mapNonEmpty!34066))

(get-info :version)

(assert (= (and mapNonEmpty!34066 ((_ is ValueCellFull!10214) mapValue!34066)) b!961855))

(assert (= (and b!961856 ((_ is ValueCellFull!10214) mapDefault!34066)) b!961858))

(assert (= start!82580 b!961856))

(declare-fun m!892383 () Bool)

(assert (=> mapNonEmpty!34066 m!892383))

(declare-fun m!892385 () Bool)

(assert (=> start!82580 m!892385))

(declare-fun m!892387 () Bool)

(assert (=> start!82580 m!892387))

(declare-fun m!892389 () Bool)

(assert (=> start!82580 m!892389))

(check-sat (not start!82580) (not mapNonEmpty!34066) tp_is_empty!21391)
(check-sat)
(get-model)

(declare-fun d!116335 () Bool)

(assert (=> d!116335 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82580 d!116335))

(declare-fun d!116337 () Bool)

(assert (=> d!116337 (= (array_inv!22025 _values!1400) (bvsge (size!28800 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82580 d!116337))

(declare-fun d!116339 () Bool)

(assert (=> d!116339 (= (array_inv!22026 _keys!1686) (bvsge (size!28801 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82580 d!116339))

(declare-fun b!961889 () Bool)

(declare-fun e!542328 () Bool)

(assert (=> b!961889 (= e!542328 tp_is_empty!21391)))

(declare-fun condMapEmpty!34075 () Bool)

(declare-fun mapDefault!34075 () ValueCell!10214)

(assert (=> mapNonEmpty!34066 (= condMapEmpty!34075 (= mapRest!34066 ((as const (Array (_ BitVec 32) ValueCell!10214)) mapDefault!34075)))))

(declare-fun e!542327 () Bool)

(declare-fun mapRes!34075 () Bool)

(assert (=> mapNonEmpty!34066 (= tp!64996 (and e!542327 mapRes!34075))))

(declare-fun mapNonEmpty!34075 () Bool)

(declare-fun tp!65005 () Bool)

(assert (=> mapNonEmpty!34075 (= mapRes!34075 (and tp!65005 e!542328))))

(declare-fun mapValue!34075 () ValueCell!10214)

(declare-fun mapKey!34075 () (_ BitVec 32))

(declare-fun mapRest!34075 () (Array (_ BitVec 32) ValueCell!10214))

(assert (=> mapNonEmpty!34075 (= mapRest!34066 (store mapRest!34075 mapKey!34075 mapValue!34075))))

(declare-fun b!961890 () Bool)

(assert (=> b!961890 (= e!542327 tp_is_empty!21391)))

(declare-fun mapIsEmpty!34075 () Bool)

(assert (=> mapIsEmpty!34075 mapRes!34075))

(assert (= (and mapNonEmpty!34066 condMapEmpty!34075) mapIsEmpty!34075))

(assert (= (and mapNonEmpty!34066 (not condMapEmpty!34075)) mapNonEmpty!34075))

(assert (= (and mapNonEmpty!34075 ((_ is ValueCellFull!10214) mapValue!34075)) b!961889))

(assert (= (and mapNonEmpty!34066 ((_ is ValueCellFull!10214) mapDefault!34075)) b!961890))

(declare-fun m!892407 () Bool)

(assert (=> mapNonEmpty!34075 m!892407))

(check-sat (not mapNonEmpty!34075) tp_is_empty!21391)
(check-sat)
