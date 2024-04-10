; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77690 () Bool)

(assert start!77690)

(declare-fun b_free!16275 () Bool)

(declare-fun b_next!16275 () Bool)

(assert (=> start!77690 (= b_free!16275 (not b_next!16275))))

(declare-fun tp!57086 () Bool)

(declare-fun b_and!26703 () Bool)

(assert (=> start!77690 (= tp!57086 b_and!26703)))

(declare-fun b!906149 () Bool)

(declare-fun res!611518 () Bool)

(declare-fun e!507799 () Bool)

(assert (=> b!906149 (=> (not res!611518) (not e!507799))))

(declare-datatypes ((array!53428 0))(
  ( (array!53429 (arr!25673 (Array (_ BitVec 32) (_ BitVec 64))) (size!26132 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53428)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53428 (_ BitVec 32)) Bool)

(assert (=> b!906149 (= res!611518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906150 () Bool)

(declare-fun e!507797 () Bool)

(declare-fun e!507801 () Bool)

(declare-fun mapRes!29752 () Bool)

(assert (=> b!906150 (= e!507797 (and e!507801 mapRes!29752))))

(declare-fun condMapEmpty!29752 () Bool)

(declare-datatypes ((V!29889 0))(
  ( (V!29890 (val!9397 Int)) )
))
(declare-datatypes ((ValueCell!8865 0))(
  ( (ValueCellFull!8865 (v!11902 V!29889)) (EmptyCell!8865) )
))
(declare-datatypes ((array!53430 0))(
  ( (array!53431 (arr!25674 (Array (_ BitVec 32) ValueCell!8865)) (size!26133 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53430)

(declare-fun mapDefault!29752 () ValueCell!8865)

(assert (=> b!906150 (= condMapEmpty!29752 (= (arr!25674 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8865)) mapDefault!29752)))))

(declare-fun b!906151 () Bool)

(declare-fun res!611512 () Bool)

(declare-fun e!507800 () Bool)

(assert (=> b!906151 (=> (not res!611512) (not e!507800))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906151 (= res!611512 (inRange!0 i!717 mask!1756))))

(declare-fun b!906152 () Bool)

(declare-fun e!507796 () Bool)

(assert (=> b!906152 (= e!507796 true)))

(declare-datatypes ((tuple2!12228 0))(
  ( (tuple2!12229 (_1!6125 (_ BitVec 64)) (_2!6125 V!29889)) )
))
(declare-datatypes ((List!18035 0))(
  ( (Nil!18032) (Cons!18031 (h!19177 tuple2!12228) (t!25482 List!18035)) )
))
(declare-datatypes ((ListLongMap!10925 0))(
  ( (ListLongMap!10926 (toList!5478 List!18035)) )
))
(declare-fun lt!408815 () ListLongMap!10925)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408816 () V!29889)

(declare-fun apply!465 (ListLongMap!10925 (_ BitVec 64)) V!29889)

(assert (=> b!906152 (= (apply!465 lt!408815 k0!1033) lt!408816)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29889)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((Unit!30750 0))(
  ( (Unit!30751) )
))
(declare-fun lt!408813 () Unit!30750)

(declare-fun minValue!1094 () V!29889)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!20 (array!53428 array!53430 (_ BitVec 32) (_ BitVec 32) V!29889 V!29889 (_ BitVec 64) V!29889 (_ BitVec 32) Int) Unit!30750)

(assert (=> b!906152 (= lt!408813 (lemmaListMapApplyFromThenApplyFromZero!20 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408816 i!717 defaultEntry!1160))))

(declare-fun b!906153 () Bool)

(declare-fun res!611511 () Bool)

(assert (=> b!906153 (=> (not res!611511) (not e!507800))))

(assert (=> b!906153 (= res!611511 (and (= (select (arr!25673 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906154 () Bool)

(declare-fun e!507794 () Bool)

(assert (=> b!906154 (= e!507794 e!507796)))

(declare-fun res!611519 () Bool)

(assert (=> b!906154 (=> res!611519 e!507796)))

(declare-fun lt!408812 () ListLongMap!10925)

(declare-fun contains!4523 (ListLongMap!10925 (_ BitVec 64)) Bool)

(assert (=> b!906154 (= res!611519 (not (contains!4523 lt!408812 k0!1033)))))

(declare-fun getCurrentListMap!2744 (array!53428 array!53430 (_ BitVec 32) (_ BitVec 32) V!29889 V!29889 (_ BitVec 32) Int) ListLongMap!10925)

(assert (=> b!906154 (= lt!408812 (getCurrentListMap!2744 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906155 () Bool)

(assert (=> b!906155 (= e!507799 e!507800)))

(declare-fun res!611517 () Bool)

(assert (=> b!906155 (=> (not res!611517) (not e!507800))))

(assert (=> b!906155 (= res!611517 (contains!4523 lt!408815 k0!1033))))

(assert (=> b!906155 (= lt!408815 (getCurrentListMap!2744 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906156 () Bool)

(declare-fun e!507795 () Bool)

(declare-fun tp_is_empty!18693 () Bool)

(assert (=> b!906156 (= e!507795 tp_is_empty!18693)))

(declare-fun res!611513 () Bool)

(assert (=> start!77690 (=> (not res!611513) (not e!507799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77690 (= res!611513 (validMask!0 mask!1756))))

(assert (=> start!77690 e!507799))

(declare-fun array_inv!20112 (array!53430) Bool)

(assert (=> start!77690 (and (array_inv!20112 _values!1152) e!507797)))

(assert (=> start!77690 tp!57086))

(assert (=> start!77690 true))

(assert (=> start!77690 tp_is_empty!18693))

(declare-fun array_inv!20113 (array!53428) Bool)

(assert (=> start!77690 (array_inv!20113 _keys!1386)))

(declare-fun b!906148 () Bool)

(assert (=> b!906148 (= e!507800 (not e!507794))))

(declare-fun res!611514 () Bool)

(assert (=> b!906148 (=> res!611514 e!507794)))

(assert (=> b!906148 (= res!611514 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26132 _keys!1386))))))

(declare-fun get!13494 (ValueCell!8865 V!29889) V!29889)

(declare-fun dynLambda!1342 (Int (_ BitVec 64)) V!29889)

(assert (=> b!906148 (= lt!408816 (get!13494 (select (arr!25674 _values!1152) i!717) (dynLambda!1342 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906148 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408814 () Unit!30750)

(declare-fun lemmaKeyInListMapIsInArray!214 (array!53428 array!53430 (_ BitVec 32) (_ BitVec 32) V!29889 V!29889 (_ BitVec 64) Int) Unit!30750)

(assert (=> b!906148 (= lt!408814 (lemmaKeyInListMapIsInArray!214 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906157 () Bool)

(assert (=> b!906157 (= e!507801 tp_is_empty!18693)))

(declare-fun mapNonEmpty!29752 () Bool)

(declare-fun tp!57087 () Bool)

(assert (=> mapNonEmpty!29752 (= mapRes!29752 (and tp!57087 e!507795))))

(declare-fun mapKey!29752 () (_ BitVec 32))

(declare-fun mapValue!29752 () ValueCell!8865)

(declare-fun mapRest!29752 () (Array (_ BitVec 32) ValueCell!8865))

(assert (=> mapNonEmpty!29752 (= (arr!25674 _values!1152) (store mapRest!29752 mapKey!29752 mapValue!29752))))

(declare-fun b!906158 () Bool)

(declare-fun res!611510 () Bool)

(assert (=> b!906158 (=> (not res!611510) (not e!507799))))

(assert (=> b!906158 (= res!611510 (and (= (size!26133 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26132 _keys!1386) (size!26133 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906159 () Bool)

(declare-fun res!611515 () Bool)

(assert (=> b!906159 (=> (not res!611515) (not e!507799))))

(declare-datatypes ((List!18036 0))(
  ( (Nil!18033) (Cons!18032 (h!19178 (_ BitVec 64)) (t!25483 List!18036)) )
))
(declare-fun arrayNoDuplicates!0 (array!53428 (_ BitVec 32) List!18036) Bool)

(assert (=> b!906159 (= res!611515 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18033))))

(declare-fun b!906160 () Bool)

(declare-fun res!611516 () Bool)

(assert (=> b!906160 (=> res!611516 e!507796)))

(assert (=> b!906160 (= res!611516 (not (= (apply!465 lt!408812 k0!1033) lt!408816)))))

(declare-fun mapIsEmpty!29752 () Bool)

(assert (=> mapIsEmpty!29752 mapRes!29752))

(assert (= (and start!77690 res!611513) b!906158))

(assert (= (and b!906158 res!611510) b!906149))

(assert (= (and b!906149 res!611518) b!906159))

(assert (= (and b!906159 res!611515) b!906155))

(assert (= (and b!906155 res!611517) b!906151))

(assert (= (and b!906151 res!611512) b!906153))

(assert (= (and b!906153 res!611511) b!906148))

(assert (= (and b!906148 (not res!611514)) b!906154))

(assert (= (and b!906154 (not res!611519)) b!906160))

(assert (= (and b!906160 (not res!611516)) b!906152))

(assert (= (and b!906150 condMapEmpty!29752) mapIsEmpty!29752))

(assert (= (and b!906150 (not condMapEmpty!29752)) mapNonEmpty!29752))

(get-info :version)

(assert (= (and mapNonEmpty!29752 ((_ is ValueCellFull!8865) mapValue!29752)) b!906156))

(assert (= (and b!906150 ((_ is ValueCellFull!8865) mapDefault!29752)) b!906157))

(assert (= start!77690 b!906150))

(declare-fun b_lambda!13149 () Bool)

(assert (=> (not b_lambda!13149) (not b!906148)))

(declare-fun t!25481 () Bool)

(declare-fun tb!5297 () Bool)

(assert (=> (and start!77690 (= defaultEntry!1160 defaultEntry!1160) t!25481) tb!5297))

(declare-fun result!10389 () Bool)

(assert (=> tb!5297 (= result!10389 tp_is_empty!18693)))

(assert (=> b!906148 t!25481))

(declare-fun b_and!26705 () Bool)

(assert (= b_and!26703 (and (=> t!25481 result!10389) b_and!26705)))

(declare-fun m!841535 () Bool)

(assert (=> b!906160 m!841535))

(declare-fun m!841537 () Bool)

(assert (=> b!906148 m!841537))

(declare-fun m!841539 () Bool)

(assert (=> b!906148 m!841539))

(declare-fun m!841541 () Bool)

(assert (=> b!906148 m!841541))

(declare-fun m!841543 () Bool)

(assert (=> b!906148 m!841543))

(assert (=> b!906148 m!841537))

(assert (=> b!906148 m!841541))

(declare-fun m!841545 () Bool)

(assert (=> b!906148 m!841545))

(declare-fun m!841547 () Bool)

(assert (=> b!906152 m!841547))

(declare-fun m!841549 () Bool)

(assert (=> b!906152 m!841549))

(declare-fun m!841551 () Bool)

(assert (=> b!906154 m!841551))

(declare-fun m!841553 () Bool)

(assert (=> b!906154 m!841553))

(declare-fun m!841555 () Bool)

(assert (=> b!906159 m!841555))

(declare-fun m!841557 () Bool)

(assert (=> b!906153 m!841557))

(declare-fun m!841559 () Bool)

(assert (=> mapNonEmpty!29752 m!841559))

(declare-fun m!841561 () Bool)

(assert (=> b!906151 m!841561))

(declare-fun m!841563 () Bool)

(assert (=> b!906155 m!841563))

(declare-fun m!841565 () Bool)

(assert (=> b!906155 m!841565))

(declare-fun m!841567 () Bool)

(assert (=> start!77690 m!841567))

(declare-fun m!841569 () Bool)

(assert (=> start!77690 m!841569))

(declare-fun m!841571 () Bool)

(assert (=> start!77690 m!841571))

(declare-fun m!841573 () Bool)

(assert (=> b!906149 m!841573))

(check-sat (not b!906149) (not b!906152) (not b_next!16275) (not b!906154) b_and!26705 (not b!906155) (not b!906148) (not b!906151) (not b!906160) tp_is_empty!18693 (not mapNonEmpty!29752) (not b!906159) (not start!77690) (not b_lambda!13149))
(check-sat b_and!26705 (not b_next!16275))
