; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72718 () Bool)

(assert start!72718)

(declare-fun b!843954 () Bool)

(declare-fun e!470994 () Bool)

(declare-fun tp_is_empty!15787 () Bool)

(assert (=> b!843954 (= e!470994 tp_is_empty!15787)))

(declare-fun mapNonEmpty!25280 () Bool)

(declare-fun mapRes!25280 () Bool)

(declare-fun tp!48599 () Bool)

(assert (=> mapNonEmpty!25280 (= mapRes!25280 (and tp!48599 e!470994))))

(declare-fun mapKey!25280 () (_ BitVec 32))

(declare-datatypes ((V!26097 0))(
  ( (V!26098 (val!7941 Int)) )
))
(declare-datatypes ((ValueCell!7454 0))(
  ( (ValueCellFull!7454 (v!10360 V!26097)) (EmptyCell!7454) )
))
(declare-fun mapValue!25280 () ValueCell!7454)

(declare-fun mapRest!25280 () (Array (_ BitVec 32) ValueCell!7454))

(declare-datatypes ((array!47807 0))(
  ( (array!47808 (arr!22935 (Array (_ BitVec 32) ValueCell!7454)) (size!23377 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47807)

(assert (=> mapNonEmpty!25280 (= (arr!22935 _values!688) (store mapRest!25280 mapKey!25280 mapValue!25280))))

(declare-fun b!843955 () Bool)

(declare-fun res!573481 () Bool)

(declare-fun e!470990 () Bool)

(assert (=> b!843955 (=> (not res!573481) (not e!470990))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843955 (= res!573481 (validMask!0 mask!1196))))

(declare-fun b!843956 () Bool)

(assert (=> b!843956 (= e!470990 false)))

(declare-fun lt!381011 () Bool)

(declare-datatypes ((array!47809 0))(
  ( (array!47810 (arr!22936 (Array (_ BitVec 32) (_ BitVec 64))) (size!23378 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47809)

(declare-datatypes ((List!16281 0))(
  ( (Nil!16278) (Cons!16277 (h!17408 (_ BitVec 64)) (t!22643 List!16281)) )
))
(declare-fun arrayNoDuplicates!0 (array!47809 (_ BitVec 32) List!16281) Bool)

(assert (=> b!843956 (= lt!381011 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16278))))

(declare-fun b!843957 () Bool)

(declare-fun res!573482 () Bool)

(assert (=> b!843957 (=> (not res!573482) (not e!470990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47809 (_ BitVec 32)) Bool)

(assert (=> b!843957 (= res!573482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843958 () Bool)

(declare-fun e!470993 () Bool)

(declare-fun e!470992 () Bool)

(assert (=> b!843958 (= e!470993 (and e!470992 mapRes!25280))))

(declare-fun condMapEmpty!25280 () Bool)

(declare-fun mapDefault!25280 () ValueCell!7454)

(assert (=> b!843958 (= condMapEmpty!25280 (= (arr!22935 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7454)) mapDefault!25280)))))

(declare-fun res!573483 () Bool)

(assert (=> start!72718 (=> (not res!573483) (not e!470990))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72718 (= res!573483 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23378 _keys!868))))))

(assert (=> start!72718 e!470990))

(assert (=> start!72718 true))

(declare-fun array_inv!18312 (array!47809) Bool)

(assert (=> start!72718 (array_inv!18312 _keys!868)))

(declare-fun array_inv!18313 (array!47807) Bool)

(assert (=> start!72718 (and (array_inv!18313 _values!688) e!470993)))

(declare-fun b!843959 () Bool)

(declare-fun res!573480 () Bool)

(assert (=> b!843959 (=> (not res!573480) (not e!470990))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843959 (= res!573480 (and (= (size!23377 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23378 _keys!868) (size!23377 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25280 () Bool)

(assert (=> mapIsEmpty!25280 mapRes!25280))

(declare-fun b!843960 () Bool)

(assert (=> b!843960 (= e!470992 tp_is_empty!15787)))

(assert (= (and start!72718 res!573483) b!843955))

(assert (= (and b!843955 res!573481) b!843959))

(assert (= (and b!843959 res!573480) b!843957))

(assert (= (and b!843957 res!573482) b!843956))

(assert (= (and b!843958 condMapEmpty!25280) mapIsEmpty!25280))

(assert (= (and b!843958 (not condMapEmpty!25280)) mapNonEmpty!25280))

(get-info :version)

(assert (= (and mapNonEmpty!25280 ((_ is ValueCellFull!7454) mapValue!25280)) b!843954))

(assert (= (and b!843958 ((_ is ValueCellFull!7454) mapDefault!25280)) b!843960))

(assert (= start!72718 b!843958))

(declare-fun m!785795 () Bool)

(assert (=> start!72718 m!785795))

(declare-fun m!785797 () Bool)

(assert (=> start!72718 m!785797))

(declare-fun m!785799 () Bool)

(assert (=> b!843956 m!785799))

(declare-fun m!785801 () Bool)

(assert (=> b!843955 m!785801))

(declare-fun m!785803 () Bool)

(assert (=> mapNonEmpty!25280 m!785803))

(declare-fun m!785805 () Bool)

(assert (=> b!843957 m!785805))

(check-sat tp_is_empty!15787 (not mapNonEmpty!25280) (not start!72718) (not b!843956) (not b!843955) (not b!843957))
(check-sat)
