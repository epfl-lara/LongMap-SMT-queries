; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82888 () Bool)

(assert start!82888)

(declare-fun b_free!18853 () Bool)

(declare-fun b_next!18853 () Bool)

(assert (=> start!82888 (= b_free!18853 (not b_next!18853))))

(declare-fun tp!65680 () Bool)

(declare-fun b_and!30351 () Bool)

(assert (=> start!82888 (= tp!65680 b_and!30351)))

(declare-fun b!965615 () Bool)

(declare-fun res!646089 () Bool)

(declare-fun e!544429 () Bool)

(assert (=> b!965615 (=> (not res!646089) (not e!544429))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33857 0))(
  ( (V!33858 (val!10878 Int)) )
))
(declare-datatypes ((ValueCell!10346 0))(
  ( (ValueCellFull!10346 (v!13433 V!33857)) (EmptyCell!10346) )
))
(declare-datatypes ((array!59418 0))(
  ( (array!59419 (arr!28573 (Array (_ BitVec 32) ValueCell!10346)) (size!29053 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59418)

(declare-datatypes ((array!59420 0))(
  ( (array!59421 (arr!28574 (Array (_ BitVec 32) (_ BitVec 64))) (size!29054 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59420)

(declare-fun minValue!1342 () V!33857)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33857)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13972 0))(
  ( (tuple2!13973 (_1!6997 (_ BitVec 64)) (_2!6997 V!33857)) )
))
(declare-datatypes ((List!19817 0))(
  ( (Nil!19814) (Cons!19813 (h!20981 tuple2!13972) (t!28172 List!19817)) )
))
(declare-datatypes ((ListLongMap!12671 0))(
  ( (ListLongMap!12672 (toList!6351 List!19817)) )
))
(declare-fun contains!5466 (ListLongMap!12671 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3584 (array!59420 array!59418 (_ BitVec 32) (_ BitVec 32) V!33857 V!33857 (_ BitVec 32) Int) ListLongMap!12671)

(assert (=> b!965615 (= res!646089 (contains!5466 (getCurrentListMap!3584 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28574 _keys!1686) i!803)))))

(declare-fun b!965616 () Bool)

(declare-fun res!646086 () Bool)

(assert (=> b!965616 (=> (not res!646086) (not e!544429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965616 (= res!646086 (validKeyInArray!0 (select (arr!28574 _keys!1686) i!803)))))

(declare-fun b!965617 () Bool)

(declare-fun e!544433 () Bool)

(declare-fun tp_is_empty!21655 () Bool)

(assert (=> b!965617 (= e!544433 tp_is_empty!21655)))

(declare-fun res!646085 () Bool)

(assert (=> start!82888 (=> (not res!646085) (not e!544429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82888 (= res!646085 (validMask!0 mask!2110))))

(assert (=> start!82888 e!544429))

(assert (=> start!82888 true))

(declare-fun e!544428 () Bool)

(declare-fun array_inv!22197 (array!59418) Bool)

(assert (=> start!82888 (and (array_inv!22197 _values!1400) e!544428)))

(declare-fun array_inv!22198 (array!59420) Bool)

(assert (=> start!82888 (array_inv!22198 _keys!1686)))

(assert (=> start!82888 tp!65680))

(assert (=> start!82888 tp_is_empty!21655))

(declare-fun b!965618 () Bool)

(declare-fun mapRes!34477 () Bool)

(assert (=> b!965618 (= e!544428 (and e!544433 mapRes!34477))))

(declare-fun condMapEmpty!34477 () Bool)

(declare-fun mapDefault!34477 () ValueCell!10346)

(assert (=> b!965618 (= condMapEmpty!34477 (= (arr!28573 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10346)) mapDefault!34477)))))

(declare-fun b!965619 () Bool)

(declare-fun res!646081 () Bool)

(assert (=> b!965619 (=> (not res!646081) (not e!544429))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965619 (= res!646081 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29054 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29054 _keys!1686))))))

(declare-fun b!965620 () Bool)

(declare-fun res!646088 () Bool)

(assert (=> b!965620 (=> (not res!646088) (not e!544429))))

(declare-datatypes ((List!19818 0))(
  ( (Nil!19815) (Cons!19814 (h!20982 (_ BitVec 64)) (t!28173 List!19818)) )
))
(declare-fun arrayNoDuplicates!0 (array!59420 (_ BitVec 32) List!19818) Bool)

(assert (=> b!965620 (= res!646088 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19815))))

(declare-fun b!965621 () Bool)

(declare-fun e!544432 () Bool)

(assert (=> b!965621 (= e!544432 tp_is_empty!21655)))

(declare-fun mapIsEmpty!34477 () Bool)

(assert (=> mapIsEmpty!34477 mapRes!34477))

(declare-fun b!965622 () Bool)

(declare-fun res!646082 () Bool)

(assert (=> b!965622 (=> (not res!646082) (not e!544429))))

(assert (=> b!965622 (= res!646082 (bvsgt from!2084 newFrom!159))))

(declare-fun b!965623 () Bool)

(declare-fun res!646087 () Bool)

(assert (=> b!965623 (=> (not res!646087) (not e!544429))))

(assert (=> b!965623 (= res!646087 (and (= (size!29053 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29054 _keys!1686) (size!29053 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965624 () Bool)

(declare-fun e!544430 () Bool)

(assert (=> b!965624 (= e!544430 true)))

(assert (=> b!965624 (contains!5466 (getCurrentListMap!3584 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28574 _keys!1686) i!803))))

(declare-datatypes ((Unit!32256 0))(
  ( (Unit!32257) )
))
(declare-fun lt!431509 () Unit!32256)

(declare-fun lemmaInListMapFromThenInFromSmaller!34 (array!59420 array!59418 (_ BitVec 32) (_ BitVec 32) V!33857 V!33857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32256)

(assert (=> b!965624 (= lt!431509 (lemmaInListMapFromThenInFromSmaller!34 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!965625 () Bool)

(declare-fun res!646084 () Bool)

(assert (=> b!965625 (=> (not res!646084) (not e!544429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59420 (_ BitVec 32)) Bool)

(assert (=> b!965625 (= res!646084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965626 () Bool)

(assert (=> b!965626 (= e!544429 (not e!544430))))

(declare-fun res!646083 () Bool)

(assert (=> b!965626 (=> res!646083 e!544430)))

(assert (=> b!965626 (= res!646083 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29054 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!965626 (contains!5466 (getCurrentListMap!3584 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28574 _keys!1686) i!803))))

(declare-fun lt!431510 () Unit!32256)

(declare-fun lemmaInListMapFromThenInFromMinusOne!40 (array!59420 array!59418 (_ BitVec 32) (_ BitVec 32) V!33857 V!33857 (_ BitVec 32) (_ BitVec 32) Int) Unit!32256)

(assert (=> b!965626 (= lt!431510 (lemmaInListMapFromThenInFromMinusOne!40 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34477 () Bool)

(declare-fun tp!65679 () Bool)

(assert (=> mapNonEmpty!34477 (= mapRes!34477 (and tp!65679 e!544432))))

(declare-fun mapValue!34477 () ValueCell!10346)

(declare-fun mapKey!34477 () (_ BitVec 32))

(declare-fun mapRest!34477 () (Array (_ BitVec 32) ValueCell!10346))

(assert (=> mapNonEmpty!34477 (= (arr!28573 _values!1400) (store mapRest!34477 mapKey!34477 mapValue!34477))))

(assert (= (and start!82888 res!646085) b!965623))

(assert (= (and b!965623 res!646087) b!965625))

(assert (= (and b!965625 res!646084) b!965620))

(assert (= (and b!965620 res!646088) b!965619))

(assert (= (and b!965619 res!646081) b!965616))

(assert (= (and b!965616 res!646086) b!965615))

(assert (= (and b!965615 res!646089) b!965622))

(assert (= (and b!965622 res!646082) b!965626))

(assert (= (and b!965626 (not res!646083)) b!965624))

(assert (= (and b!965618 condMapEmpty!34477) mapIsEmpty!34477))

(assert (= (and b!965618 (not condMapEmpty!34477)) mapNonEmpty!34477))

(get-info :version)

(assert (= (and mapNonEmpty!34477 ((_ is ValueCellFull!10346) mapValue!34477)) b!965621))

(assert (= (and b!965618 ((_ is ValueCellFull!10346) mapDefault!34477)) b!965617))

(assert (= start!82888 b!965618))

(declare-fun m!895231 () Bool)

(assert (=> b!965616 m!895231))

(assert (=> b!965616 m!895231))

(declare-fun m!895233 () Bool)

(assert (=> b!965616 m!895233))

(declare-fun m!895235 () Bool)

(assert (=> mapNonEmpty!34477 m!895235))

(declare-fun m!895237 () Bool)

(assert (=> b!965615 m!895237))

(assert (=> b!965615 m!895231))

(assert (=> b!965615 m!895237))

(assert (=> b!965615 m!895231))

(declare-fun m!895239 () Bool)

(assert (=> b!965615 m!895239))

(declare-fun m!895241 () Bool)

(assert (=> b!965626 m!895241))

(assert (=> b!965626 m!895231))

(assert (=> b!965626 m!895241))

(assert (=> b!965626 m!895231))

(declare-fun m!895243 () Bool)

(assert (=> b!965626 m!895243))

(declare-fun m!895245 () Bool)

(assert (=> b!965626 m!895245))

(declare-fun m!895247 () Bool)

(assert (=> b!965620 m!895247))

(declare-fun m!895249 () Bool)

(assert (=> start!82888 m!895249))

(declare-fun m!895251 () Bool)

(assert (=> start!82888 m!895251))

(declare-fun m!895253 () Bool)

(assert (=> start!82888 m!895253))

(declare-fun m!895255 () Bool)

(assert (=> b!965625 m!895255))

(declare-fun m!895257 () Bool)

(assert (=> b!965624 m!895257))

(assert (=> b!965624 m!895231))

(assert (=> b!965624 m!895257))

(assert (=> b!965624 m!895231))

(declare-fun m!895259 () Bool)

(assert (=> b!965624 m!895259))

(declare-fun m!895261 () Bool)

(assert (=> b!965624 m!895261))

(check-sat tp_is_empty!21655 (not b_next!18853) (not mapNonEmpty!34477) (not b!965615) (not b!965616) (not b!965624) (not b!965626) (not start!82888) b_and!30351 (not b!965620) (not b!965625))
(check-sat b_and!30351 (not b_next!18853))
