; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72216 () Bool)

(assert start!72216)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun b!836996 () Bool)

(declare-fun e!467066 () Bool)

(declare-datatypes ((array!46894 0))(
  ( (array!46895 (arr!22481 (Array (_ BitVec 32) (_ BitVec 64))) (size!22921 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46894)

(declare-datatypes ((V!25443 0))(
  ( (V!25444 (val!7696 Int)) )
))
(declare-datatypes ((ValueCell!7209 0))(
  ( (ValueCellFull!7209 (v!10120 V!25443)) (EmptyCell!7209) )
))
(declare-datatypes ((array!46896 0))(
  ( (array!46897 (arr!22482 (Array (_ BitVec 32) ValueCell!7209)) (size!22922 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46896)

(assert (=> b!836996 (= e!467066 (and (= (size!22922 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22921 _keys!868) (size!22922 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011) (= (size!22921 _keys!868) (bvadd #b00000000000000000000000000000001 mask!1196)) (bvsgt #b00000000000000000000000000000000 (size!22921 _keys!868))))))

(declare-fun b!836997 () Bool)

(declare-fun res!569288 () Bool)

(assert (=> b!836997 (=> (not res!569288) (not e!467066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836997 (= res!569288 (validMask!0 mask!1196))))

(declare-fun b!836998 () Bool)

(declare-fun e!467069 () Bool)

(declare-fun tp_is_empty!15297 () Bool)

(assert (=> b!836998 (= e!467069 tp_is_empty!15297)))

(declare-fun b!836999 () Bool)

(declare-fun e!467068 () Bool)

(assert (=> b!836999 (= e!467068 tp_is_empty!15297)))

(declare-fun mapIsEmpty!24536 () Bool)

(declare-fun mapRes!24536 () Bool)

(assert (=> mapIsEmpty!24536 mapRes!24536))

(declare-fun mapNonEmpty!24536 () Bool)

(declare-fun tp!47530 () Bool)

(assert (=> mapNonEmpty!24536 (= mapRes!24536 (and tp!47530 e!467069))))

(declare-fun mapKey!24536 () (_ BitVec 32))

(declare-fun mapRest!24536 () (Array (_ BitVec 32) ValueCell!7209))

(declare-fun mapValue!24536 () ValueCell!7209)

(assert (=> mapNonEmpty!24536 (= (arr!22482 _values!688) (store mapRest!24536 mapKey!24536 mapValue!24536))))

(declare-fun res!569289 () Bool)

(assert (=> start!72216 (=> (not res!569289) (not e!467066))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72216 (= res!569289 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22921 _keys!868))))))

(assert (=> start!72216 e!467066))

(assert (=> start!72216 true))

(declare-fun array_inv!17928 (array!46894) Bool)

(assert (=> start!72216 (array_inv!17928 _keys!868)))

(declare-fun e!467065 () Bool)

(declare-fun array_inv!17929 (array!46896) Bool)

(assert (=> start!72216 (and (array_inv!17929 _values!688) e!467065)))

(declare-fun b!837000 () Bool)

(assert (=> b!837000 (= e!467065 (and e!467068 mapRes!24536))))

(declare-fun condMapEmpty!24536 () Bool)

(declare-fun mapDefault!24536 () ValueCell!7209)

(assert (=> b!837000 (= condMapEmpty!24536 (= (arr!22482 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7209)) mapDefault!24536)))))

(assert (= (and start!72216 res!569289) b!836997))

(assert (= (and b!836997 res!569288) b!836996))

(assert (= (and b!837000 condMapEmpty!24536) mapIsEmpty!24536))

(assert (= (and b!837000 (not condMapEmpty!24536)) mapNonEmpty!24536))

(get-info :version)

(assert (= (and mapNonEmpty!24536 ((_ is ValueCellFull!7209) mapValue!24536)) b!836998))

(assert (= (and b!837000 ((_ is ValueCellFull!7209) mapDefault!24536)) b!836999))

(assert (= start!72216 b!837000))

(declare-fun m!782045 () Bool)

(assert (=> b!836997 m!782045))

(declare-fun m!782047 () Bool)

(assert (=> mapNonEmpty!24536 m!782047))

(declare-fun m!782049 () Bool)

(assert (=> start!72216 m!782049))

(declare-fun m!782051 () Bool)

(assert (=> start!72216 m!782051))

(check-sat (not start!72216) (not b!836997) (not mapNonEmpty!24536) tp_is_empty!15297)
(check-sat)
