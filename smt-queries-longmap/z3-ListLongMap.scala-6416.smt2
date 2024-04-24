; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82460 () Bool)

(assert start!82460)

(declare-fun b_free!18565 () Bool)

(declare-fun b_next!18565 () Bool)

(assert (=> start!82460 (= b_free!18565 (not b_next!18565))))

(declare-fun tp!64656 () Bool)

(declare-fun b_and!30063 () Bool)

(assert (=> start!82460 (= tp!64656 b_and!30063)))

(declare-fun b!960265 () Bool)

(declare-fun res!642526 () Bool)

(declare-fun e!541389 () Bool)

(assert (=> b!960265 (=> (not res!642526) (not e!541389))))

(declare-datatypes ((array!58670 0))(
  ( (array!58671 (arr!28204 (Array (_ BitVec 32) (_ BitVec 64))) (size!28684 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58670)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960265 (= res!642526 (validKeyInArray!0 (select (arr!28204 _keys!1668) i!793)))))

(declare-fun b!960266 () Bool)

(declare-fun res!642525 () Bool)

(assert (=> b!960266 (=> (not res!642525) (not e!541389))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960266 (= res!642525 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28684 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28684 _keys!1668))))))

(declare-fun b!960267 () Bool)

(declare-fun e!541388 () Bool)

(declare-fun tp_is_empty!21271 () Bool)

(assert (=> b!960267 (= e!541388 tp_is_empty!21271)))

(declare-fun b!960268 () Bool)

(declare-fun e!541392 () Bool)

(declare-fun mapRes!33886 () Bool)

(assert (=> b!960268 (= e!541392 (and e!541388 mapRes!33886))))

(declare-fun condMapEmpty!33886 () Bool)

(declare-datatypes ((V!33345 0))(
  ( (V!33346 (val!10686 Int)) )
))
(declare-datatypes ((ValueCell!10154 0))(
  ( (ValueCellFull!10154 (v!13240 V!33345)) (EmptyCell!10154) )
))
(declare-datatypes ((array!58672 0))(
  ( (array!58673 (arr!28205 (Array (_ BitVec 32) ValueCell!10154)) (size!28685 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58672)

(declare-fun mapDefault!33886 () ValueCell!10154)

(assert (=> b!960268 (= condMapEmpty!33886 (= (arr!28205 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10154)) mapDefault!33886)))))

(declare-fun b!960269 () Bool)

(declare-fun res!642528 () Bool)

(assert (=> b!960269 (=> (not res!642528) (not e!541389))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33345)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33345)

(declare-datatypes ((tuple2!13766 0))(
  ( (tuple2!13767 (_1!6894 (_ BitVec 64)) (_2!6894 V!33345)) )
))
(declare-datatypes ((List!19597 0))(
  ( (Nil!19594) (Cons!19593 (h!20761 tuple2!13766) (t!27952 List!19597)) )
))
(declare-datatypes ((ListLongMap!12465 0))(
  ( (ListLongMap!12466 (toList!6248 List!19597)) )
))
(declare-fun contains!5362 (ListLongMap!12465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3481 (array!58670 array!58672 (_ BitVec 32) (_ BitVec 32) V!33345 V!33345 (_ BitVec 32) Int) ListLongMap!12465)

(assert (=> b!960269 (= res!642528 (contains!5362 (getCurrentListMap!3481 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28204 _keys!1668) i!793)))))

(declare-fun res!642527 () Bool)

(assert (=> start!82460 (=> (not res!642527) (not e!541389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82460 (= res!642527 (validMask!0 mask!2088))))

(assert (=> start!82460 e!541389))

(assert (=> start!82460 true))

(assert (=> start!82460 tp_is_empty!21271))

(declare-fun array_inv!21943 (array!58670) Bool)

(assert (=> start!82460 (array_inv!21943 _keys!1668)))

(declare-fun array_inv!21944 (array!58672) Bool)

(assert (=> start!82460 (and (array_inv!21944 _values!1386) e!541392)))

(assert (=> start!82460 tp!64656))

(declare-fun mapNonEmpty!33886 () Bool)

(declare-fun tp!64657 () Bool)

(declare-fun e!541391 () Bool)

(assert (=> mapNonEmpty!33886 (= mapRes!33886 (and tp!64657 e!541391))))

(declare-fun mapKey!33886 () (_ BitVec 32))

(declare-fun mapRest!33886 () (Array (_ BitVec 32) ValueCell!10154))

(declare-fun mapValue!33886 () ValueCell!10154)

(assert (=> mapNonEmpty!33886 (= (arr!28205 _values!1386) (store mapRest!33886 mapKey!33886 mapValue!33886))))

(declare-fun b!960270 () Bool)

(declare-fun res!642529 () Bool)

(assert (=> b!960270 (=> (not res!642529) (not e!541389))))

(declare-datatypes ((List!19598 0))(
  ( (Nil!19595) (Cons!19594 (h!20762 (_ BitVec 64)) (t!27953 List!19598)) )
))
(declare-fun arrayNoDuplicates!0 (array!58670 (_ BitVec 32) List!19598) Bool)

(assert (=> b!960270 (= res!642529 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19595))))

(declare-fun b!960271 () Bool)

(assert (=> b!960271 (= e!541389 (not true))))

(assert (=> b!960271 (contains!5362 (getCurrentListMap!3481 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28204 _keys!1668) i!793))))

(declare-datatypes ((Unit!32148 0))(
  ( (Unit!32149) )
))
(declare-fun lt!430900 () Unit!32148)

(declare-fun lemmaInListMapFromThenInFromSmaller!12 (array!58670 array!58672 (_ BitVec 32) (_ BitVec 32) V!33345 V!33345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32148)

(assert (=> b!960271 (= lt!430900 (lemmaInListMapFromThenInFromSmaller!12 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960272 () Bool)

(assert (=> b!960272 (= e!541391 tp_is_empty!21271)))

(declare-fun b!960273 () Bool)

(declare-fun res!642524 () Bool)

(assert (=> b!960273 (=> (not res!642524) (not e!541389))))

(assert (=> b!960273 (= res!642524 (and (= (size!28685 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28684 _keys!1668) (size!28685 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33886 () Bool)

(assert (=> mapIsEmpty!33886 mapRes!33886))

(declare-fun b!960274 () Bool)

(declare-fun res!642523 () Bool)

(assert (=> b!960274 (=> (not res!642523) (not e!541389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58670 (_ BitVec 32)) Bool)

(assert (=> b!960274 (= res!642523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82460 res!642527) b!960273))

(assert (= (and b!960273 res!642524) b!960274))

(assert (= (and b!960274 res!642523) b!960270))

(assert (= (and b!960270 res!642529) b!960266))

(assert (= (and b!960266 res!642525) b!960265))

(assert (= (and b!960265 res!642526) b!960269))

(assert (= (and b!960269 res!642528) b!960271))

(assert (= (and b!960268 condMapEmpty!33886) mapIsEmpty!33886))

(assert (= (and b!960268 (not condMapEmpty!33886)) mapNonEmpty!33886))

(get-info :version)

(assert (= (and mapNonEmpty!33886 ((_ is ValueCellFull!10154) mapValue!33886)) b!960272))

(assert (= (and b!960268 ((_ is ValueCellFull!10154) mapDefault!33886)) b!960267))

(assert (= start!82460 b!960268))

(declare-fun m!891159 () Bool)

(assert (=> b!960269 m!891159))

(declare-fun m!891161 () Bool)

(assert (=> b!960269 m!891161))

(assert (=> b!960269 m!891159))

(assert (=> b!960269 m!891161))

(declare-fun m!891163 () Bool)

(assert (=> b!960269 m!891163))

(declare-fun m!891165 () Bool)

(assert (=> b!960271 m!891165))

(assert (=> b!960271 m!891161))

(assert (=> b!960271 m!891165))

(assert (=> b!960271 m!891161))

(declare-fun m!891167 () Bool)

(assert (=> b!960271 m!891167))

(declare-fun m!891169 () Bool)

(assert (=> b!960271 m!891169))

(declare-fun m!891171 () Bool)

(assert (=> start!82460 m!891171))

(declare-fun m!891173 () Bool)

(assert (=> start!82460 m!891173))

(declare-fun m!891175 () Bool)

(assert (=> start!82460 m!891175))

(declare-fun m!891177 () Bool)

(assert (=> b!960270 m!891177))

(declare-fun m!891179 () Bool)

(assert (=> b!960274 m!891179))

(assert (=> b!960265 m!891161))

(assert (=> b!960265 m!891161))

(declare-fun m!891181 () Bool)

(assert (=> b!960265 m!891181))

(declare-fun m!891183 () Bool)

(assert (=> mapNonEmpty!33886 m!891183))

(check-sat (not b!960270) (not b_next!18565) (not b!960274) b_and!30063 (not b!960271) tp_is_empty!21271 (not mapNonEmpty!33886) (not start!82460) (not b!960265) (not b!960269))
(check-sat b_and!30063 (not b_next!18565))
