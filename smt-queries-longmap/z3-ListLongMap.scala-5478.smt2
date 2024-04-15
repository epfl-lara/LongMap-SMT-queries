; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72634 () Bool)

(assert start!72634)

(declare-fun b!843072 () Bool)

(declare-fun e!470361 () Bool)

(declare-fun tp_is_empty!15703 () Bool)

(assert (=> b!843072 (= e!470361 tp_is_empty!15703)))

(declare-fun mapIsEmpty!25154 () Bool)

(declare-fun mapRes!25154 () Bool)

(assert (=> mapIsEmpty!25154 mapRes!25154))

(declare-fun b!843073 () Bool)

(declare-fun res!572979 () Bool)

(declare-fun e!470364 () Bool)

(assert (=> b!843073 (=> (not res!572979) (not e!470364))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47649 0))(
  ( (array!47650 (arr!22856 (Array (_ BitVec 32) (_ BitVec 64))) (size!23298 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47649)

(declare-datatypes ((V!25985 0))(
  ( (V!25986 (val!7899 Int)) )
))
(declare-datatypes ((ValueCell!7412 0))(
  ( (ValueCellFull!7412 (v!10318 V!25985)) (EmptyCell!7412) )
))
(declare-datatypes ((array!47651 0))(
  ( (array!47652 (arr!22857 (Array (_ BitVec 32) ValueCell!7412)) (size!23299 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47651)

(assert (=> b!843073 (= res!572979 (and (= (size!23299 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23298 _keys!868) (size!23299 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843075 () Bool)

(declare-fun e!470362 () Bool)

(declare-fun e!470363 () Bool)

(assert (=> b!843075 (= e!470362 (and e!470363 mapRes!25154))))

(declare-fun condMapEmpty!25154 () Bool)

(declare-fun mapDefault!25154 () ValueCell!7412)

(assert (=> b!843075 (= condMapEmpty!25154 (= (arr!22857 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7412)) mapDefault!25154)))))

(declare-fun mapNonEmpty!25154 () Bool)

(declare-fun tp!48473 () Bool)

(assert (=> mapNonEmpty!25154 (= mapRes!25154 (and tp!48473 e!470361))))

(declare-fun mapValue!25154 () ValueCell!7412)

(declare-fun mapRest!25154 () (Array (_ BitVec 32) ValueCell!7412))

(declare-fun mapKey!25154 () (_ BitVec 32))

(assert (=> mapNonEmpty!25154 (= (arr!22857 _values!688) (store mapRest!25154 mapKey!25154 mapValue!25154))))

(declare-fun b!843076 () Bool)

(assert (=> b!843076 (= e!470364 false)))

(declare-fun lt!380885 () Bool)

(declare-datatypes ((List!16252 0))(
  ( (Nil!16249) (Cons!16248 (h!17379 (_ BitVec 64)) (t!22614 List!16252)) )
))
(declare-fun arrayNoDuplicates!0 (array!47649 (_ BitVec 32) List!16252) Bool)

(assert (=> b!843076 (= lt!380885 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16249))))

(declare-fun b!843077 () Bool)

(declare-fun res!572978 () Bool)

(assert (=> b!843077 (=> (not res!572978) (not e!470364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47649 (_ BitVec 32)) Bool)

(assert (=> b!843077 (= res!572978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843078 () Bool)

(assert (=> b!843078 (= e!470363 tp_is_empty!15703)))

(declare-fun b!843074 () Bool)

(declare-fun res!572977 () Bool)

(assert (=> b!843074 (=> (not res!572977) (not e!470364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843074 (= res!572977 (validMask!0 mask!1196))))

(declare-fun res!572976 () Bool)

(assert (=> start!72634 (=> (not res!572976) (not e!470364))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72634 (= res!572976 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23298 _keys!868))))))

(assert (=> start!72634 e!470364))

(assert (=> start!72634 true))

(declare-fun array_inv!18254 (array!47649) Bool)

(assert (=> start!72634 (array_inv!18254 _keys!868)))

(declare-fun array_inv!18255 (array!47651) Bool)

(assert (=> start!72634 (and (array_inv!18255 _values!688) e!470362)))

(assert (= (and start!72634 res!572976) b!843074))

(assert (= (and b!843074 res!572977) b!843073))

(assert (= (and b!843073 res!572979) b!843077))

(assert (= (and b!843077 res!572978) b!843076))

(assert (= (and b!843075 condMapEmpty!25154) mapIsEmpty!25154))

(assert (= (and b!843075 (not condMapEmpty!25154)) mapNonEmpty!25154))

(get-info :version)

(assert (= (and mapNonEmpty!25154 ((_ is ValueCellFull!7412) mapValue!25154)) b!843072))

(assert (= (and b!843075 ((_ is ValueCellFull!7412) mapDefault!25154)) b!843078))

(assert (= start!72634 b!843075))

(declare-fun m!785291 () Bool)

(assert (=> b!843074 m!785291))

(declare-fun m!785293 () Bool)

(assert (=> b!843076 m!785293))

(declare-fun m!785295 () Bool)

(assert (=> b!843077 m!785295))

(declare-fun m!785297 () Bool)

(assert (=> start!72634 m!785297))

(declare-fun m!785299 () Bool)

(assert (=> start!72634 m!785299))

(declare-fun m!785301 () Bool)

(assert (=> mapNonEmpty!25154 m!785301))

(check-sat (not mapNonEmpty!25154) (not b!843074) tp_is_empty!15703 (not b!843077) (not start!72634) (not b!843076))
(check-sat)
