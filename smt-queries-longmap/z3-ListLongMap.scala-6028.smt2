; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78034 () Bool)

(assert start!78034)

(declare-fun b_free!16579 () Bool)

(declare-fun b_next!16579 () Bool)

(assert (=> start!78034 (= b_free!16579 (not b_next!16579))))

(declare-fun tp!58008 () Bool)

(declare-fun b_and!27125 () Bool)

(assert (=> start!78034 (= tp!58008 b_and!27125)))

(declare-fun b!910855 () Bool)

(declare-fun res!614628 () Bool)

(declare-fun e!510781 () Bool)

(assert (=> b!910855 (=> (not res!614628) (not e!510781))))

(declare-datatypes ((array!53999 0))(
  ( (array!54000 (arr!25956 (Array (_ BitVec 32) (_ BitVec 64))) (size!26417 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53999)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53999 (_ BitVec 32)) Bool)

(assert (=> b!910855 (= res!614628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910856 () Bool)

(declare-fun res!614626 () Bool)

(assert (=> b!910856 (=> (not res!614626) (not e!510781))))

(declare-datatypes ((V!30295 0))(
  ( (V!30296 (val!9549 Int)) )
))
(declare-datatypes ((ValueCell!9017 0))(
  ( (ValueCellFull!9017 (v!12057 V!30295)) (EmptyCell!9017) )
))
(declare-datatypes ((array!54001 0))(
  ( (array!54002 (arr!25957 (Array (_ BitVec 32) ValueCell!9017)) (size!26418 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54001)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910856 (= res!614626 (and (= (size!26418 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26417 _keys!1386) (size!26418 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30217 () Bool)

(declare-fun mapRes!30217 () Bool)

(declare-fun tp!58009 () Bool)

(declare-fun e!510779 () Bool)

(assert (=> mapNonEmpty!30217 (= mapRes!30217 (and tp!58009 e!510779))))

(declare-fun mapRest!30217 () (Array (_ BitVec 32) ValueCell!9017))

(declare-fun mapValue!30217 () ValueCell!9017)

(declare-fun mapKey!30217 () (_ BitVec 32))

(assert (=> mapNonEmpty!30217 (= (arr!25957 _values!1152) (store mapRest!30217 mapKey!30217 mapValue!30217))))

(declare-fun mapIsEmpty!30217 () Bool)

(assert (=> mapIsEmpty!30217 mapRes!30217))

(declare-fun b!910857 () Bool)

(declare-fun tp_is_empty!18997 () Bool)

(assert (=> b!910857 (= e!510779 tp_is_empty!18997)))

(declare-fun b!910858 () Bool)

(declare-fun res!614629 () Bool)

(assert (=> b!910858 (=> (not res!614629) (not e!510781))))

(declare-datatypes ((List!18264 0))(
  ( (Nil!18261) (Cons!18260 (h!19406 (_ BitVec 64)) (t!25840 List!18264)) )
))
(declare-fun arrayNoDuplicates!0 (array!53999 (_ BitVec 32) List!18264) Bool)

(assert (=> b!910858 (= res!614629 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18261))))

(declare-fun res!614627 () Bool)

(assert (=> start!78034 (=> (not res!614627) (not e!510781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78034 (= res!614627 (validMask!0 mask!1756))))

(assert (=> start!78034 e!510781))

(declare-fun e!510782 () Bool)

(declare-fun array_inv!20348 (array!54001) Bool)

(assert (=> start!78034 (and (array_inv!20348 _values!1152) e!510782)))

(assert (=> start!78034 tp!58008))

(assert (=> start!78034 true))

(assert (=> start!78034 tp_is_empty!18997))

(declare-fun array_inv!20349 (array!53999) Bool)

(assert (=> start!78034 (array_inv!20349 _keys!1386)))

(declare-fun b!910859 () Bool)

(declare-fun e!510778 () Bool)

(assert (=> b!910859 (= e!510778 tp_is_empty!18997)))

(declare-fun b!910860 () Bool)

(assert (=> b!910860 (= e!510782 (and e!510778 mapRes!30217))))

(declare-fun condMapEmpty!30217 () Bool)

(declare-fun mapDefault!30217 () ValueCell!9017)

(assert (=> b!910860 (= condMapEmpty!30217 (= (arr!25957 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9017)) mapDefault!30217)))))

(declare-fun b!910861 () Bool)

(assert (=> b!910861 (= e!510781 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410115 () Bool)

(declare-fun zeroValue!1094 () V!30295)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30295)

(declare-datatypes ((tuple2!12480 0))(
  ( (tuple2!12481 (_1!6251 (_ BitVec 64)) (_2!6251 V!30295)) )
))
(declare-datatypes ((List!18265 0))(
  ( (Nil!18262) (Cons!18261 (h!19407 tuple2!12480) (t!25841 List!18265)) )
))
(declare-datatypes ((ListLongMap!11167 0))(
  ( (ListLongMap!11168 (toList!5599 List!18265)) )
))
(declare-fun contains!4600 (ListLongMap!11167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2801 (array!53999 array!54001 (_ BitVec 32) (_ BitVec 32) V!30295 V!30295 (_ BitVec 32) Int) ListLongMap!11167)

(assert (=> b!910861 (= lt!410115 (contains!4600 (getCurrentListMap!2801 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!78034 res!614627) b!910856))

(assert (= (and b!910856 res!614626) b!910855))

(assert (= (and b!910855 res!614628) b!910858))

(assert (= (and b!910858 res!614629) b!910861))

(assert (= (and b!910860 condMapEmpty!30217) mapIsEmpty!30217))

(assert (= (and b!910860 (not condMapEmpty!30217)) mapNonEmpty!30217))

(get-info :version)

(assert (= (and mapNonEmpty!30217 ((_ is ValueCellFull!9017) mapValue!30217)) b!910857))

(assert (= (and b!910860 ((_ is ValueCellFull!9017) mapDefault!30217)) b!910859))

(assert (= start!78034 b!910860))

(declare-fun m!845179 () Bool)

(assert (=> b!910861 m!845179))

(assert (=> b!910861 m!845179))

(declare-fun m!845181 () Bool)

(assert (=> b!910861 m!845181))

(declare-fun m!845183 () Bool)

(assert (=> mapNonEmpty!30217 m!845183))

(declare-fun m!845185 () Bool)

(assert (=> b!910855 m!845185))

(declare-fun m!845187 () Bool)

(assert (=> start!78034 m!845187))

(declare-fun m!845189 () Bool)

(assert (=> start!78034 m!845189))

(declare-fun m!845191 () Bool)

(assert (=> start!78034 m!845191))

(declare-fun m!845193 () Bool)

(assert (=> b!910858 m!845193))

(check-sat (not mapNonEmpty!30217) (not b!910858) (not start!78034) (not b!910855) tp_is_empty!18997 (not b_next!16579) (not b!910861) b_and!27125)
(check-sat b_and!27125 (not b_next!16579))
