; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72628 () Bool)

(assert start!72628)

(declare-fun res!572943 () Bool)

(declare-fun e!470318 () Bool)

(assert (=> start!72628 (=> (not res!572943) (not e!470318))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47639 0))(
  ( (array!47640 (arr!22851 (Array (_ BitVec 32) (_ BitVec 64))) (size!23293 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47639)

(assert (=> start!72628 (= res!572943 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23293 _keys!868))))))

(assert (=> start!72628 e!470318))

(assert (=> start!72628 true))

(declare-fun array_inv!18250 (array!47639) Bool)

(assert (=> start!72628 (array_inv!18250 _keys!868)))

(declare-datatypes ((V!25977 0))(
  ( (V!25978 (val!7896 Int)) )
))
(declare-datatypes ((ValueCell!7409 0))(
  ( (ValueCellFull!7409 (v!10315 V!25977)) (EmptyCell!7409) )
))
(declare-datatypes ((array!47641 0))(
  ( (array!47642 (arr!22852 (Array (_ BitVec 32) ValueCell!7409)) (size!23294 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47641)

(declare-fun e!470317 () Bool)

(declare-fun array_inv!18251 (array!47641) Bool)

(assert (=> start!72628 (and (array_inv!18251 _values!688) e!470317)))

(declare-fun b!843009 () Bool)

(declare-fun res!572941 () Bool)

(assert (=> b!843009 (=> (not res!572941) (not e!470318))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!843009 (= res!572941 (and (= (size!23294 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23293 _keys!868) (size!23294 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843010 () Bool)

(declare-fun e!470319 () Bool)

(declare-fun mapRes!25145 () Bool)

(assert (=> b!843010 (= e!470317 (and e!470319 mapRes!25145))))

(declare-fun condMapEmpty!25145 () Bool)

(declare-fun mapDefault!25145 () ValueCell!7409)

(assert (=> b!843010 (= condMapEmpty!25145 (= (arr!22852 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7409)) mapDefault!25145)))))

(declare-fun b!843011 () Bool)

(declare-fun tp_is_empty!15697 () Bool)

(assert (=> b!843011 (= e!470319 tp_is_empty!15697)))

(declare-fun b!843012 () Bool)

(declare-fun e!470315 () Bool)

(assert (=> b!843012 (= e!470315 tp_is_empty!15697)))

(declare-fun mapNonEmpty!25145 () Bool)

(declare-fun tp!48464 () Bool)

(assert (=> mapNonEmpty!25145 (= mapRes!25145 (and tp!48464 e!470315))))

(declare-fun mapRest!25145 () (Array (_ BitVec 32) ValueCell!7409))

(declare-fun mapValue!25145 () ValueCell!7409)

(declare-fun mapKey!25145 () (_ BitVec 32))

(assert (=> mapNonEmpty!25145 (= (arr!22852 _values!688) (store mapRest!25145 mapKey!25145 mapValue!25145))))

(declare-fun b!843013 () Bool)

(declare-fun res!572942 () Bool)

(assert (=> b!843013 (=> (not res!572942) (not e!470318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47639 (_ BitVec 32)) Bool)

(assert (=> b!843013 (= res!572942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843014 () Bool)

(declare-fun res!572940 () Bool)

(assert (=> b!843014 (=> (not res!572940) (not e!470318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843014 (= res!572940 (validMask!0 mask!1196))))

(declare-fun b!843015 () Bool)

(assert (=> b!843015 (= e!470318 false)))

(declare-fun lt!380876 () Bool)

(declare-datatypes ((List!16250 0))(
  ( (Nil!16247) (Cons!16246 (h!17377 (_ BitVec 64)) (t!22612 List!16250)) )
))
(declare-fun arrayNoDuplicates!0 (array!47639 (_ BitVec 32) List!16250) Bool)

(assert (=> b!843015 (= lt!380876 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16247))))

(declare-fun mapIsEmpty!25145 () Bool)

(assert (=> mapIsEmpty!25145 mapRes!25145))

(assert (= (and start!72628 res!572943) b!843014))

(assert (= (and b!843014 res!572940) b!843009))

(assert (= (and b!843009 res!572941) b!843013))

(assert (= (and b!843013 res!572942) b!843015))

(assert (= (and b!843010 condMapEmpty!25145) mapIsEmpty!25145))

(assert (= (and b!843010 (not condMapEmpty!25145)) mapNonEmpty!25145))

(get-info :version)

(assert (= (and mapNonEmpty!25145 ((_ is ValueCellFull!7409) mapValue!25145)) b!843012))

(assert (= (and b!843010 ((_ is ValueCellFull!7409) mapDefault!25145)) b!843011))

(assert (= start!72628 b!843010))

(declare-fun m!785255 () Bool)

(assert (=> b!843014 m!785255))

(declare-fun m!785257 () Bool)

(assert (=> b!843015 m!785257))

(declare-fun m!785259 () Bool)

(assert (=> b!843013 m!785259))

(declare-fun m!785261 () Bool)

(assert (=> mapNonEmpty!25145 m!785261))

(declare-fun m!785263 () Bool)

(assert (=> start!72628 m!785263))

(declare-fun m!785265 () Bool)

(assert (=> start!72628 m!785265))

(check-sat (not start!72628) (not mapNonEmpty!25145) (not b!843013) (not b!843014) tp_is_empty!15697 (not b!843015))
(check-sat)
