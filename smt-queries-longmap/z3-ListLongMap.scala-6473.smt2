; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82680 () Bool)

(assert start!82680)

(declare-fun b_free!18813 () Bool)

(declare-fun b_next!18813 () Bool)

(assert (=> start!82680 (= b_free!18813 (not b_next!18813))))

(declare-fun tp!65559 () Bool)

(declare-fun b_and!30301 () Bool)

(assert (=> start!82680 (= tp!65559 b_and!30301)))

(declare-fun b!963992 () Bool)

(declare-fun res!645203 () Bool)

(declare-fun e!543486 () Bool)

(assert (=> b!963992 (=> (not res!645203) (not e!543486))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963992 (= res!645203 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34417 () Bool)

(declare-fun mapRes!34417 () Bool)

(declare-fun tp!65558 () Bool)

(declare-fun e!543487 () Bool)

(assert (=> mapNonEmpty!34417 (= mapRes!34417 (and tp!65558 e!543487))))

(declare-datatypes ((V!33803 0))(
  ( (V!33804 (val!10858 Int)) )
))
(declare-datatypes ((ValueCell!10326 0))(
  ( (ValueCellFull!10326 (v!13416 V!33803)) (EmptyCell!10326) )
))
(declare-datatypes ((array!59319 0))(
  ( (array!59320 (arr!28528 (Array (_ BitVec 32) ValueCell!10326)) (size!29007 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59319)

(declare-fun mapRest!34417 () (Array (_ BitVec 32) ValueCell!10326))

(declare-fun mapValue!34417 () ValueCell!10326)

(declare-fun mapKey!34417 () (_ BitVec 32))

(assert (=> mapNonEmpty!34417 (= (arr!28528 _values!1400) (store mapRest!34417 mapKey!34417 mapValue!34417))))

(declare-fun b!963993 () Bool)

(declare-fun e!543490 () Bool)

(assert (=> b!963993 (= e!543486 (not e!543490))))

(declare-fun res!645201 () Bool)

(assert (=> b!963993 (=> res!645201 e!543490)))

(declare-datatypes ((array!59321 0))(
  ( (array!59322 (arr!28529 (Array (_ BitVec 32) (_ BitVec 64))) (size!29008 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59321)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963993 (= res!645201 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29008 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33803)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33803)

(declare-datatypes ((tuple2!13950 0))(
  ( (tuple2!13951 (_1!6986 (_ BitVec 64)) (_2!6986 V!33803)) )
))
(declare-datatypes ((List!19799 0))(
  ( (Nil!19796) (Cons!19795 (h!20957 tuple2!13950) (t!28162 List!19799)) )
))
(declare-datatypes ((ListLongMap!12647 0))(
  ( (ListLongMap!12648 (toList!6339 List!19799)) )
))
(declare-fun contains!5442 (ListLongMap!12647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3572 (array!59321 array!59319 (_ BitVec 32) (_ BitVec 32) V!33803 V!33803 (_ BitVec 32) Int) ListLongMap!12647)

(assert (=> b!963993 (contains!5442 (getCurrentListMap!3572 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28529 _keys!1686) i!803))))

(declare-datatypes ((Unit!32261 0))(
  ( (Unit!32262) )
))
(declare-fun lt!431029 () Unit!32261)

(declare-fun lemmaInListMapFromThenInFromMinusOne!25 (array!59321 array!59319 (_ BitVec 32) (_ BitVec 32) V!33803 V!33803 (_ BitVec 32) (_ BitVec 32) Int) Unit!32261)

(assert (=> b!963993 (= lt!431029 (lemmaInListMapFromThenInFromMinusOne!25 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963994 () Bool)

(declare-fun tp_is_empty!21615 () Bool)

(assert (=> b!963994 (= e!543487 tp_is_empty!21615)))

(declare-fun b!963995 () Bool)

(declare-fun res!645199 () Bool)

(assert (=> b!963995 (=> (not res!645199) (not e!543486))))

(declare-datatypes ((List!19800 0))(
  ( (Nil!19797) (Cons!19796 (h!20958 (_ BitVec 64)) (t!28163 List!19800)) )
))
(declare-fun arrayNoDuplicates!0 (array!59321 (_ BitVec 32) List!19800) Bool)

(assert (=> b!963995 (= res!645199 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19797))))

(declare-fun b!963996 () Bool)

(assert (=> b!963996 (= e!543490 true)))

(assert (=> b!963996 (contains!5442 (getCurrentListMap!3572 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28529 _keys!1686) i!803))))

(declare-fun lt!431028 () Unit!32261)

(declare-fun lemmaInListMapFromThenInFromSmaller!24 (array!59321 array!59319 (_ BitVec 32) (_ BitVec 32) V!33803 V!33803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32261)

(assert (=> b!963996 (= lt!431028 (lemmaInListMapFromThenInFromSmaller!24 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!963998 () Bool)

(declare-fun e!543489 () Bool)

(declare-fun e!543488 () Bool)

(assert (=> b!963998 (= e!543489 (and e!543488 mapRes!34417))))

(declare-fun condMapEmpty!34417 () Bool)

(declare-fun mapDefault!34417 () ValueCell!10326)

(assert (=> b!963998 (= condMapEmpty!34417 (= (arr!28528 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10326)) mapDefault!34417)))))

(declare-fun b!963999 () Bool)

(declare-fun res!645205 () Bool)

(assert (=> b!963999 (=> (not res!645205) (not e!543486))))

(assert (=> b!963999 (= res!645205 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29008 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29008 _keys!1686))))))

(declare-fun b!964000 () Bool)

(declare-fun res!645202 () Bool)

(assert (=> b!964000 (=> (not res!645202) (not e!543486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59321 (_ BitVec 32)) Bool)

(assert (=> b!964000 (= res!645202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964001 () Bool)

(declare-fun res!645200 () Bool)

(assert (=> b!964001 (=> (not res!645200) (not e!543486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964001 (= res!645200 (validKeyInArray!0 (select (arr!28529 _keys!1686) i!803)))))

(declare-fun b!964002 () Bool)

(declare-fun res!645198 () Bool)

(assert (=> b!964002 (=> (not res!645198) (not e!543486))))

(assert (=> b!964002 (= res!645198 (contains!5442 (getCurrentListMap!3572 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28529 _keys!1686) i!803)))))

(declare-fun b!964003 () Bool)

(assert (=> b!964003 (= e!543488 tp_is_empty!21615)))

(declare-fun mapIsEmpty!34417 () Bool)

(assert (=> mapIsEmpty!34417 mapRes!34417))

(declare-fun b!963997 () Bool)

(declare-fun res!645204 () Bool)

(assert (=> b!963997 (=> (not res!645204) (not e!543486))))

(assert (=> b!963997 (= res!645204 (and (= (size!29007 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29008 _keys!1686) (size!29007 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!645197 () Bool)

(assert (=> start!82680 (=> (not res!645197) (not e!543486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82680 (= res!645197 (validMask!0 mask!2110))))

(assert (=> start!82680 e!543486))

(assert (=> start!82680 true))

(declare-fun array_inv!22095 (array!59319) Bool)

(assert (=> start!82680 (and (array_inv!22095 _values!1400) e!543489)))

(declare-fun array_inv!22096 (array!59321) Bool)

(assert (=> start!82680 (array_inv!22096 _keys!1686)))

(assert (=> start!82680 tp!65559))

(assert (=> start!82680 tp_is_empty!21615))

(assert (= (and start!82680 res!645197) b!963997))

(assert (= (and b!963997 res!645204) b!964000))

(assert (= (and b!964000 res!645202) b!963995))

(assert (= (and b!963995 res!645199) b!963999))

(assert (= (and b!963999 res!645205) b!964001))

(assert (= (and b!964001 res!645200) b!964002))

(assert (= (and b!964002 res!645198) b!963992))

(assert (= (and b!963992 res!645203) b!963993))

(assert (= (and b!963993 (not res!645201)) b!963996))

(assert (= (and b!963998 condMapEmpty!34417) mapIsEmpty!34417))

(assert (= (and b!963998 (not condMapEmpty!34417)) mapNonEmpty!34417))

(get-info :version)

(assert (= (and mapNonEmpty!34417 ((_ is ValueCellFull!10326) mapValue!34417)) b!963994))

(assert (= (and b!963998 ((_ is ValueCellFull!10326) mapDefault!34417)) b!964003))

(assert (= start!82680 b!963998))

(declare-fun m!893297 () Bool)

(assert (=> b!964002 m!893297))

(declare-fun m!893299 () Bool)

(assert (=> b!964002 m!893299))

(assert (=> b!964002 m!893297))

(assert (=> b!964002 m!893299))

(declare-fun m!893301 () Bool)

(assert (=> b!964002 m!893301))

(declare-fun m!893303 () Bool)

(assert (=> b!963995 m!893303))

(declare-fun m!893305 () Bool)

(assert (=> b!963993 m!893305))

(assert (=> b!963993 m!893299))

(assert (=> b!963993 m!893305))

(assert (=> b!963993 m!893299))

(declare-fun m!893307 () Bool)

(assert (=> b!963993 m!893307))

(declare-fun m!893309 () Bool)

(assert (=> b!963993 m!893309))

(declare-fun m!893311 () Bool)

(assert (=> b!963996 m!893311))

(assert (=> b!963996 m!893299))

(assert (=> b!963996 m!893311))

(assert (=> b!963996 m!893299))

(declare-fun m!893313 () Bool)

(assert (=> b!963996 m!893313))

(declare-fun m!893315 () Bool)

(assert (=> b!963996 m!893315))

(assert (=> b!964001 m!893299))

(assert (=> b!964001 m!893299))

(declare-fun m!893317 () Bool)

(assert (=> b!964001 m!893317))

(declare-fun m!893319 () Bool)

(assert (=> mapNonEmpty!34417 m!893319))

(declare-fun m!893321 () Bool)

(assert (=> b!964000 m!893321))

(declare-fun m!893323 () Bool)

(assert (=> start!82680 m!893323))

(declare-fun m!893325 () Bool)

(assert (=> start!82680 m!893325))

(declare-fun m!893327 () Bool)

(assert (=> start!82680 m!893327))

(check-sat (not b!964001) (not mapNonEmpty!34417) (not b!964000) (not start!82680) b_and!30301 (not b_next!18813) (not b!963993) (not b!964002) (not b!963996) (not b!963995) tp_is_empty!21615)
(check-sat b_and!30301 (not b_next!18813))
