; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72508 () Bool)

(assert start!72508)

(declare-fun b!838994 () Bool)

(declare-fun res!570263 () Bool)

(declare-fun e!468427 () Bool)

(assert (=> b!838994 (=> (not res!570263) (not e!468427))))

(declare-datatypes ((array!47079 0))(
  ( (array!47080 (arr!22566 (Array (_ BitVec 32) (_ BitVec 64))) (size!23007 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47079)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47079 (_ BitVec 32)) Bool)

(assert (=> b!838994 (= res!570263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24686 () Bool)

(declare-fun mapRes!24686 () Bool)

(assert (=> mapIsEmpty!24686 mapRes!24686))

(declare-fun b!838995 () Bool)

(declare-fun e!468426 () Bool)

(declare-fun tp_is_empty!15391 () Bool)

(assert (=> b!838995 (= e!468426 tp_is_empty!15391)))

(declare-fun b!838996 () Bool)

(declare-fun e!468428 () Bool)

(assert (=> b!838996 (= e!468428 tp_is_empty!15391)))

(declare-fun b!838997 () Bool)

(assert (=> b!838997 (= e!468427 false)))

(declare-fun lt!381014 () Bool)

(declare-datatypes ((List!15953 0))(
  ( (Nil!15950) (Cons!15949 (h!17086 (_ BitVec 64)) (t!22316 List!15953)) )
))
(declare-fun arrayNoDuplicates!0 (array!47079 (_ BitVec 32) List!15953) Bool)

(assert (=> b!838997 (= lt!381014 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15950))))

(declare-fun mapNonEmpty!24686 () Bool)

(declare-fun tp!47681 () Bool)

(assert (=> mapNonEmpty!24686 (= mapRes!24686 (and tp!47681 e!468426))))

(declare-datatypes ((V!25569 0))(
  ( (V!25570 (val!7743 Int)) )
))
(declare-datatypes ((ValueCell!7256 0))(
  ( (ValueCellFull!7256 (v!10168 V!25569)) (EmptyCell!7256) )
))
(declare-fun mapRest!24686 () (Array (_ BitVec 32) ValueCell!7256))

(declare-fun mapKey!24686 () (_ BitVec 32))

(declare-fun mapValue!24686 () ValueCell!7256)

(declare-datatypes ((array!47081 0))(
  ( (array!47082 (arr!22567 (Array (_ BitVec 32) ValueCell!7256)) (size!23008 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47081)

(assert (=> mapNonEmpty!24686 (= (arr!22567 _values!688) (store mapRest!24686 mapKey!24686 mapValue!24686))))

(declare-fun b!838998 () Bool)

(declare-fun e!468429 () Bool)

(assert (=> b!838998 (= e!468429 (and e!468428 mapRes!24686))))

(declare-fun condMapEmpty!24686 () Bool)

(declare-fun mapDefault!24686 () ValueCell!7256)

(assert (=> b!838998 (= condMapEmpty!24686 (= (arr!22567 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7256)) mapDefault!24686)))))

(declare-fun res!570265 () Bool)

(assert (=> start!72508 (=> (not res!570265) (not e!468427))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72508 (= res!570265 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23007 _keys!868))))))

(assert (=> start!72508 e!468427))

(assert (=> start!72508 true))

(declare-fun array_inv!18022 (array!47079) Bool)

(assert (=> start!72508 (array_inv!18022 _keys!868)))

(declare-fun array_inv!18023 (array!47081) Bool)

(assert (=> start!72508 (and (array_inv!18023 _values!688) e!468429)))

(declare-fun b!838999 () Bool)

(declare-fun res!570262 () Bool)

(assert (=> b!838999 (=> (not res!570262) (not e!468427))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838999 (= res!570262 (and (= (size!23008 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23007 _keys!868) (size!23008 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839000 () Bool)

(declare-fun res!570264 () Bool)

(assert (=> b!839000 (=> (not res!570264) (not e!468427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839000 (= res!570264 (validMask!0 mask!1196))))

(assert (= (and start!72508 res!570265) b!839000))

(assert (= (and b!839000 res!570264) b!838999))

(assert (= (and b!838999 res!570262) b!838994))

(assert (= (and b!838994 res!570263) b!838997))

(assert (= (and b!838998 condMapEmpty!24686) mapIsEmpty!24686))

(assert (= (and b!838998 (not condMapEmpty!24686)) mapNonEmpty!24686))

(get-info :version)

(assert (= (and mapNonEmpty!24686 ((_ is ValueCellFull!7256) mapValue!24686)) b!838995))

(assert (= (and b!838998 ((_ is ValueCellFull!7256) mapDefault!24686)) b!838996))

(assert (= start!72508 b!838998))

(declare-fun m!783953 () Bool)

(assert (=> b!839000 m!783953))

(declare-fun m!783955 () Bool)

(assert (=> start!72508 m!783955))

(declare-fun m!783957 () Bool)

(assert (=> start!72508 m!783957))

(declare-fun m!783959 () Bool)

(assert (=> b!838997 m!783959))

(declare-fun m!783961 () Bool)

(assert (=> mapNonEmpty!24686 m!783961))

(declare-fun m!783963 () Bool)

(assert (=> b!838994 m!783963))

(check-sat tp_is_empty!15391 (not start!72508) (not mapNonEmpty!24686) (not b!838994) (not b!839000) (not b!838997))
(check-sat)
