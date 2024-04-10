; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77624 () Bool)

(assert start!77624)

(declare-fun b_free!16209 () Bool)

(declare-fun b_next!16209 () Bool)

(assert (=> start!77624 (= b_free!16209 (not b_next!16209))))

(declare-fun tp!56889 () Bool)

(declare-fun b_and!26575 () Bool)

(assert (=> start!77624 (= tp!56889 b_and!26575)))

(declare-fun b!904803 () Bool)

(declare-fun e!507010 () Bool)

(declare-fun tp_is_empty!18627 () Bool)

(assert (=> b!904803 (= e!507010 tp_is_empty!18627)))

(declare-fun b!904804 () Bool)

(declare-fun e!507011 () Bool)

(assert (=> b!904804 (= e!507011 true)))

(declare-datatypes ((V!29801 0))(
  ( (V!29802 (val!9364 Int)) )
))
(declare-fun lt!408326 () V!29801)

(declare-datatypes ((tuple2!12170 0))(
  ( (tuple2!12171 (_1!6096 (_ BitVec 64)) (_2!6096 V!29801)) )
))
(declare-datatypes ((List!17983 0))(
  ( (Nil!17980) (Cons!17979 (h!19125 tuple2!12170) (t!25366 List!17983)) )
))
(declare-datatypes ((ListLongMap!10867 0))(
  ( (ListLongMap!10868 (toList!5449 List!17983)) )
))
(declare-fun lt!408325 () ListLongMap!10867)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!441 (ListLongMap!10867 (_ BitVec 64)) V!29801)

(assert (=> b!904804 (= lt!408326 (apply!441 lt!408325 k0!1033))))

(declare-fun b!904805 () Bool)

(declare-fun e!507008 () Bool)

(declare-fun e!507006 () Bool)

(assert (=> b!904805 (= e!507008 (not e!507006))))

(declare-fun res!610529 () Bool)

(assert (=> b!904805 (=> res!610529 e!507006)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53298 0))(
  ( (array!53299 (arr!25608 (Array (_ BitVec 32) (_ BitVec 64))) (size!26067 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53298)

(assert (=> b!904805 (= res!610529 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26067 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904805 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((ValueCell!8832 0))(
  ( (ValueCellFull!8832 (v!11869 V!29801)) (EmptyCell!8832) )
))
(declare-datatypes ((array!53300 0))(
  ( (array!53301 (arr!25609 (Array (_ BitVec 32) ValueCell!8832)) (size!26068 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53300)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29801)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29801)

(declare-datatypes ((Unit!30692 0))(
  ( (Unit!30693) )
))
(declare-fun lt!408327 () Unit!30692)

(declare-fun lemmaKeyInListMapIsInArray!189 (array!53298 array!53300 (_ BitVec 32) (_ BitVec 32) V!29801 V!29801 (_ BitVec 64) Int) Unit!30692)

(assert (=> b!904805 (= lt!408327 (lemmaKeyInListMapIsInArray!189 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904806 () Bool)

(declare-fun res!610532 () Bool)

(assert (=> b!904806 (=> (not res!610532) (not e!507008))))

(assert (=> b!904806 (= res!610532 (and (= (select (arr!25608 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904807 () Bool)

(declare-fun res!610525 () Bool)

(assert (=> b!904807 (=> (not res!610525) (not e!507008))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904807 (= res!610525 (inRange!0 i!717 mask!1756))))

(declare-fun b!904808 () Bool)

(declare-fun res!610526 () Bool)

(assert (=> b!904808 (=> (not res!610526) (not e!507008))))

(declare-fun contains!4496 (ListLongMap!10867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2717 (array!53298 array!53300 (_ BitVec 32) (_ BitVec 32) V!29801 V!29801 (_ BitVec 32) Int) ListLongMap!10867)

(assert (=> b!904808 (= res!610526 (contains!4496 (getCurrentListMap!2717 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904809 () Bool)

(declare-fun res!610524 () Bool)

(assert (=> b!904809 (=> (not res!610524) (not e!507008))))

(declare-datatypes ((List!17984 0))(
  ( (Nil!17981) (Cons!17980 (h!19126 (_ BitVec 64)) (t!25367 List!17984)) )
))
(declare-fun arrayNoDuplicates!0 (array!53298 (_ BitVec 32) List!17984) Bool)

(assert (=> b!904809 (= res!610524 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17981))))

(declare-fun b!904810 () Bool)

(declare-fun e!507012 () Bool)

(declare-fun e!507007 () Bool)

(declare-fun mapRes!29653 () Bool)

(assert (=> b!904810 (= e!507012 (and e!507007 mapRes!29653))))

(declare-fun condMapEmpty!29653 () Bool)

(declare-fun mapDefault!29653 () ValueCell!8832)

(assert (=> b!904810 (= condMapEmpty!29653 (= (arr!25609 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8832)) mapDefault!29653)))))

(declare-fun b!904811 () Bool)

(declare-fun res!610531 () Bool)

(assert (=> b!904811 (=> (not res!610531) (not e!507008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53298 (_ BitVec 32)) Bool)

(assert (=> b!904811 (= res!610531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904812 () Bool)

(assert (=> b!904812 (= e!507006 e!507011)))

(declare-fun res!610530 () Bool)

(assert (=> b!904812 (=> res!610530 e!507011)))

(assert (=> b!904812 (= res!610530 (not (contains!4496 lt!408325 k0!1033)))))

(assert (=> b!904812 (= lt!408325 (getCurrentListMap!2717 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!610527 () Bool)

(assert (=> start!77624 (=> (not res!610527) (not e!507008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77624 (= res!610527 (validMask!0 mask!1756))))

(assert (=> start!77624 e!507008))

(declare-fun array_inv!20062 (array!53300) Bool)

(assert (=> start!77624 (and (array_inv!20062 _values!1152) e!507012)))

(assert (=> start!77624 tp!56889))

(assert (=> start!77624 true))

(assert (=> start!77624 tp_is_empty!18627))

(declare-fun array_inv!20063 (array!53298) Bool)

(assert (=> start!77624 (array_inv!20063 _keys!1386)))

(declare-fun mapNonEmpty!29653 () Bool)

(declare-fun tp!56888 () Bool)

(assert (=> mapNonEmpty!29653 (= mapRes!29653 (and tp!56888 e!507010))))

(declare-fun mapRest!29653 () (Array (_ BitVec 32) ValueCell!8832))

(declare-fun mapKey!29653 () (_ BitVec 32))

(declare-fun mapValue!29653 () ValueCell!8832)

(assert (=> mapNonEmpty!29653 (= (arr!25609 _values!1152) (store mapRest!29653 mapKey!29653 mapValue!29653))))

(declare-fun b!904813 () Bool)

(declare-fun res!610528 () Bool)

(assert (=> b!904813 (=> (not res!610528) (not e!507008))))

(assert (=> b!904813 (= res!610528 (and (= (size!26068 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26067 _keys!1386) (size!26068 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29653 () Bool)

(assert (=> mapIsEmpty!29653 mapRes!29653))

(declare-fun b!904814 () Bool)

(assert (=> b!904814 (= e!507007 tp_is_empty!18627)))

(assert (= (and start!77624 res!610527) b!904813))

(assert (= (and b!904813 res!610528) b!904811))

(assert (= (and b!904811 res!610531) b!904809))

(assert (= (and b!904809 res!610524) b!904808))

(assert (= (and b!904808 res!610526) b!904807))

(assert (= (and b!904807 res!610525) b!904806))

(assert (= (and b!904806 res!610532) b!904805))

(assert (= (and b!904805 (not res!610529)) b!904812))

(assert (= (and b!904812 (not res!610530)) b!904804))

(assert (= (and b!904810 condMapEmpty!29653) mapIsEmpty!29653))

(assert (= (and b!904810 (not condMapEmpty!29653)) mapNonEmpty!29653))

(get-info :version)

(assert (= (and mapNonEmpty!29653 ((_ is ValueCellFull!8832) mapValue!29653)) b!904803))

(assert (= (and b!904810 ((_ is ValueCellFull!8832) mapDefault!29653)) b!904814))

(assert (= start!77624 b!904810))

(declare-fun m!840235 () Bool)

(assert (=> b!904804 m!840235))

(declare-fun m!840237 () Bool)

(assert (=> b!904809 m!840237))

(declare-fun m!840239 () Bool)

(assert (=> mapNonEmpty!29653 m!840239))

(declare-fun m!840241 () Bool)

(assert (=> b!904808 m!840241))

(assert (=> b!904808 m!840241))

(declare-fun m!840243 () Bool)

(assert (=> b!904808 m!840243))

(declare-fun m!840245 () Bool)

(assert (=> b!904807 m!840245))

(declare-fun m!840247 () Bool)

(assert (=> b!904811 m!840247))

(declare-fun m!840249 () Bool)

(assert (=> b!904805 m!840249))

(declare-fun m!840251 () Bool)

(assert (=> b!904805 m!840251))

(declare-fun m!840253 () Bool)

(assert (=> b!904812 m!840253))

(declare-fun m!840255 () Bool)

(assert (=> b!904812 m!840255))

(declare-fun m!840257 () Bool)

(assert (=> b!904806 m!840257))

(declare-fun m!840259 () Bool)

(assert (=> start!77624 m!840259))

(declare-fun m!840261 () Bool)

(assert (=> start!77624 m!840261))

(declare-fun m!840263 () Bool)

(assert (=> start!77624 m!840263))

(check-sat (not b_next!16209) (not b!904811) (not mapNonEmpty!29653) (not b!904809) (not b!904804) b_and!26575 (not b!904808) (not b!904807) (not b!904812) (not b!904805) (not start!77624) tp_is_empty!18627)
(check-sat b_and!26575 (not b_next!16209))
