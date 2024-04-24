; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7324 () Bool)

(assert start!7324)

(declare-datatypes ((array!3048 0))(
  ( (array!3049 (arr!1463 (Array (_ BitVec 32) (_ BitVec 64))) (size!1685 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3048)

(declare-fun b!46977 () Bool)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun e!29999 () Bool)

(declare-datatypes ((V!2399 0))(
  ( (V!2400 (val!1038 Int)) )
))
(declare-datatypes ((ValueCell!710 0))(
  ( (ValueCellFull!710 (v!2099 V!2399)) (EmptyCell!710) )
))
(declare-datatypes ((array!3050 0))(
  ( (array!3051 (arr!1464 (Array (_ BitVec 32) ValueCell!710)) (size!1686 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3050)

(assert (=> b!46977 (= e!29999 (and (= (size!1686 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1685 _keys!1940) (size!1686 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011) (not (= (size!1685 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458)))))))

(declare-fun b!46978 () Bool)

(declare-fun e!30001 () Bool)

(declare-fun tp_is_empty!1999 () Bool)

(assert (=> b!46978 (= e!30001 tp_is_empty!1999)))

(declare-fun res!27383 () Bool)

(assert (=> start!7324 (=> (not res!27383) (not e!29999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7324 (= res!27383 (validMask!0 mask!2458))))

(assert (=> start!7324 e!29999))

(assert (=> start!7324 true))

(declare-fun e!29997 () Bool)

(declare-fun array_inv!866 (array!3050) Bool)

(assert (=> start!7324 (and (array_inv!866 _values!1550) e!29997)))

(declare-fun array_inv!867 (array!3048) Bool)

(assert (=> start!7324 (array_inv!867 _keys!1940)))

(declare-fun b!46979 () Bool)

(declare-fun e!29998 () Bool)

(declare-fun mapRes!2027 () Bool)

(assert (=> b!46979 (= e!29997 (and e!29998 mapRes!2027))))

(declare-fun condMapEmpty!2027 () Bool)

(declare-fun mapDefault!2027 () ValueCell!710)

(assert (=> b!46979 (= condMapEmpty!2027 (= (arr!1464 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!710)) mapDefault!2027)))))

(declare-fun mapNonEmpty!2027 () Bool)

(declare-fun tp!6176 () Bool)

(assert (=> mapNonEmpty!2027 (= mapRes!2027 (and tp!6176 e!30001))))

(declare-fun mapValue!2027 () ValueCell!710)

(declare-fun mapRest!2027 () (Array (_ BitVec 32) ValueCell!710))

(declare-fun mapKey!2027 () (_ BitVec 32))

(assert (=> mapNonEmpty!2027 (= (arr!1464 _values!1550) (store mapRest!2027 mapKey!2027 mapValue!2027))))

(declare-fun b!46980 () Bool)

(assert (=> b!46980 (= e!29998 tp_is_empty!1999)))

(declare-fun mapIsEmpty!2027 () Bool)

(assert (=> mapIsEmpty!2027 mapRes!2027))

(assert (= (and start!7324 res!27383) b!46977))

(assert (= (and b!46979 condMapEmpty!2027) mapIsEmpty!2027))

(assert (= (and b!46979 (not condMapEmpty!2027)) mapNonEmpty!2027))

(get-info :version)

(assert (= (and mapNonEmpty!2027 ((_ is ValueCellFull!710) mapValue!2027)) b!46978))

(assert (= (and b!46979 ((_ is ValueCellFull!710) mapDefault!2027)) b!46980))

(assert (= start!7324 b!46979))

(declare-fun m!41285 () Bool)

(assert (=> start!7324 m!41285))

(declare-fun m!41287 () Bool)

(assert (=> start!7324 m!41287))

(declare-fun m!41289 () Bool)

(assert (=> start!7324 m!41289))

(declare-fun m!41291 () Bool)

(assert (=> mapNonEmpty!2027 m!41291))

(check-sat (not start!7324) (not mapNonEmpty!2027) tp_is_empty!1999)
(check-sat)
