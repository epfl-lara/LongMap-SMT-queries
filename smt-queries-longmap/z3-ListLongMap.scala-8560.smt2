; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104748 () Bool)

(assert start!104748)

(declare-fun mapIsEmpty!48685 () Bool)

(declare-fun mapRes!48685 () Bool)

(assert (=> mapIsEmpty!48685 mapRes!48685))

(declare-fun b!1248246 () Bool)

(declare-fun e!708096 () Bool)

(declare-fun e!708097 () Bool)

(assert (=> b!1248246 (= e!708096 (and e!708097 mapRes!48685))))

(declare-fun condMapEmpty!48685 () Bool)

(declare-datatypes ((V!47095 0))(
  ( (V!47096 (val!15711 Int)) )
))
(declare-datatypes ((ValueCell!14885 0))(
  ( (ValueCellFull!14885 (v!18402 V!47095)) (EmptyCell!14885) )
))
(declare-datatypes ((array!80319 0))(
  ( (array!80320 (arr!38729 (Array (_ BitVec 32) ValueCell!14885)) (size!39266 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80319)

(declare-fun mapDefault!48685 () ValueCell!14885)

(assert (=> b!1248246 (= condMapEmpty!48685 (= (arr!38729 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14885)) mapDefault!48685)))))

(declare-fun b!1248247 () Bool)

(declare-fun tp_is_empty!31297 () Bool)

(assert (=> b!1248247 (= e!708097 tp_is_empty!31297)))

(declare-fun res!832646 () Bool)

(declare-fun e!708098 () Bool)

(assert (=> start!104748 (=> (not res!832646) (not e!708098))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104748 (= res!832646 (validMask!0 mask!1466))))

(assert (=> start!104748 e!708098))

(assert (=> start!104748 true))

(declare-datatypes ((array!80321 0))(
  ( (array!80322 (arr!38730 (Array (_ BitVec 32) (_ BitVec 64))) (size!39267 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80321)

(declare-fun array_inv!29667 (array!80321) Bool)

(assert (=> start!104748 (array_inv!29667 _keys!1118)))

(declare-fun array_inv!29668 (array!80319) Bool)

(assert (=> start!104748 (and (array_inv!29668 _values!914) e!708096)))

(declare-fun b!1248248 () Bool)

(declare-fun e!708099 () Bool)

(assert (=> b!1248248 (= e!708099 tp_is_empty!31297)))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun b!1248249 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1248249 (= e!708098 (and (= (size!39266 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39267 _keys!1118) (size!39266 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (size!39267 _keys!1118) (bvadd #b00000000000000000000000000000001 mask!1466)))))))

(declare-fun mapNonEmpty!48685 () Bool)

(declare-fun tp!92786 () Bool)

(assert (=> mapNonEmpty!48685 (= mapRes!48685 (and tp!92786 e!708099))))

(declare-fun mapKey!48685 () (_ BitVec 32))

(declare-fun mapValue!48685 () ValueCell!14885)

(declare-fun mapRest!48685 () (Array (_ BitVec 32) ValueCell!14885))

(assert (=> mapNonEmpty!48685 (= (arr!38729 _values!914) (store mapRest!48685 mapKey!48685 mapValue!48685))))

(assert (= (and start!104748 res!832646) b!1248249))

(assert (= (and b!1248246 condMapEmpty!48685) mapIsEmpty!48685))

(assert (= (and b!1248246 (not condMapEmpty!48685)) mapNonEmpty!48685))

(get-info :version)

(assert (= (and mapNonEmpty!48685 ((_ is ValueCellFull!14885) mapValue!48685)) b!1248248))

(assert (= (and b!1248246 ((_ is ValueCellFull!14885) mapDefault!48685)) b!1248247))

(assert (= start!104748 b!1248246))

(declare-fun m!1150251 () Bool)

(assert (=> start!104748 m!1150251))

(declare-fun m!1150253 () Bool)

(assert (=> start!104748 m!1150253))

(declare-fun m!1150255 () Bool)

(assert (=> start!104748 m!1150255))

(declare-fun m!1150257 () Bool)

(assert (=> mapNonEmpty!48685 m!1150257))

(check-sat (not start!104748) (not mapNonEmpty!48685) tp_is_empty!31297)
(check-sat)
