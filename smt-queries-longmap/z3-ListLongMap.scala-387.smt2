; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7320 () Bool)

(assert start!7320)

(declare-fun res!27388 () Bool)

(declare-fun e!29992 () Bool)

(assert (=> start!7320 (=> (not res!27388) (not e!29992))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7320 (= res!27388 (validMask!0 mask!2458))))

(assert (=> start!7320 e!29992))

(assert (=> start!7320 true))

(declare-datatypes ((V!2399 0))(
  ( (V!2400 (val!1038 Int)) )
))
(declare-datatypes ((ValueCell!710 0))(
  ( (ValueCellFull!710 (v!2096 V!2399)) (EmptyCell!710) )
))
(declare-datatypes ((array!3036 0))(
  ( (array!3037 (arr!1457 (Array (_ BitVec 32) ValueCell!710)) (size!1680 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3036)

(declare-fun e!29995 () Bool)

(declare-fun array_inv!880 (array!3036) Bool)

(assert (=> start!7320 (and (array_inv!880 _values!1550) e!29995)))

(declare-datatypes ((array!3038 0))(
  ( (array!3039 (arr!1458 (Array (_ BitVec 32) (_ BitVec 64))) (size!1681 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3038)

(declare-fun array_inv!881 (array!3038) Bool)

(assert (=> start!7320 (array_inv!881 _keys!1940)))

(declare-fun mapNonEmpty!2027 () Bool)

(declare-fun mapRes!2027 () Bool)

(declare-fun tp!6176 () Bool)

(declare-fun e!29993 () Bool)

(assert (=> mapNonEmpty!2027 (= mapRes!2027 (and tp!6176 e!29993))))

(declare-fun mapValue!2027 () ValueCell!710)

(declare-fun mapKey!2027 () (_ BitVec 32))

(declare-fun mapRest!2027 () (Array (_ BitVec 32) ValueCell!710))

(assert (=> mapNonEmpty!2027 (= (arr!1457 _values!1550) (store mapRest!2027 mapKey!2027 mapValue!2027))))

(declare-fun mapIsEmpty!2027 () Bool)

(assert (=> mapIsEmpty!2027 mapRes!2027))

(declare-fun b!46968 () Bool)

(declare-fun e!29994 () Bool)

(assert (=> b!46968 (= e!29995 (and e!29994 mapRes!2027))))

(declare-fun condMapEmpty!2027 () Bool)

(declare-fun mapDefault!2027 () ValueCell!710)

(assert (=> b!46968 (= condMapEmpty!2027 (= (arr!1457 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!710)) mapDefault!2027)))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun b!46969 () Bool)

(assert (=> b!46969 (= e!29992 (and (= (size!1680 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1681 _keys!1940) (size!1680 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011) (not (= (size!1681 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458)))))))

(declare-fun b!46970 () Bool)

(declare-fun tp_is_empty!1999 () Bool)

(assert (=> b!46970 (= e!29994 tp_is_empty!1999)))

(declare-fun b!46971 () Bool)

(assert (=> b!46971 (= e!29993 tp_is_empty!1999)))

(assert (= (and start!7320 res!27388) b!46969))

(assert (= (and b!46968 condMapEmpty!2027) mapIsEmpty!2027))

(assert (= (and b!46968 (not condMapEmpty!2027)) mapNonEmpty!2027))

(get-info :version)

(assert (= (and mapNonEmpty!2027 ((_ is ValueCellFull!710) mapValue!2027)) b!46971))

(assert (= (and b!46968 ((_ is ValueCellFull!710) mapDefault!2027)) b!46970))

(assert (= start!7320 b!46968))

(declare-fun m!41327 () Bool)

(assert (=> start!7320 m!41327))

(declare-fun m!41329 () Bool)

(assert (=> start!7320 m!41329))

(declare-fun m!41331 () Bool)

(assert (=> start!7320 m!41331))

(declare-fun m!41333 () Bool)

(assert (=> mapNonEmpty!2027 m!41333))

(check-sat (not start!7320) (not mapNonEmpty!2027) tp_is_empty!1999)
(check-sat)
