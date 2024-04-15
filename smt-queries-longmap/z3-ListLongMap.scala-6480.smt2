; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82702 () Bool)

(assert start!82702)

(declare-fun b_free!18853 () Bool)

(declare-fun b_next!18853 () Bool)

(assert (=> start!82702 (= b_free!18853 (not b_next!18853))))

(declare-fun tp!65680 () Bool)

(declare-fun b_and!30315 () Bool)

(assert (=> start!82702 (= tp!65680 b_and!30315)))

(declare-fun b!964474 () Bool)

(declare-fun res!645633 () Bool)

(declare-fun e!543702 () Bool)

(assert (=> b!964474 (=> (not res!645633) (not e!543702))))

(declare-datatypes ((array!59332 0))(
  ( (array!59333 (arr!28535 (Array (_ BitVec 32) (_ BitVec 64))) (size!29016 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59332)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964474 (= res!645633 (validKeyInArray!0 (select (arr!28535 _keys!1686) i!803)))))

(declare-fun b!964475 () Bool)

(declare-fun e!543699 () Bool)

(declare-fun tp_is_empty!21655 () Bool)

(assert (=> b!964475 (= e!543699 tp_is_empty!21655)))

(declare-fun mapNonEmpty!34477 () Bool)

(declare-fun mapRes!34477 () Bool)

(declare-fun tp!65679 () Bool)

(declare-fun e!543698 () Bool)

(assert (=> mapNonEmpty!34477 (= mapRes!34477 (and tp!65679 e!543698))))

(declare-datatypes ((V!33857 0))(
  ( (V!33858 (val!10878 Int)) )
))
(declare-datatypes ((ValueCell!10346 0))(
  ( (ValueCellFull!10346 (v!13435 V!33857)) (EmptyCell!10346) )
))
(declare-fun mapRest!34477 () (Array (_ BitVec 32) ValueCell!10346))

(declare-fun mapValue!34477 () ValueCell!10346)

(declare-datatypes ((array!59334 0))(
  ( (array!59335 (arr!28536 (Array (_ BitVec 32) ValueCell!10346)) (size!29017 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59334)

(declare-fun mapKey!34477 () (_ BitVec 32))

(assert (=> mapNonEmpty!34477 (= (arr!28536 _values!1400) (store mapRest!34477 mapKey!34477 mapValue!34477))))

(declare-fun mapIsEmpty!34477 () Bool)

(assert (=> mapIsEmpty!34477 mapRes!34477))

(declare-fun b!964476 () Bool)

(assert (=> b!964476 (= e!543698 tp_is_empty!21655)))

(declare-fun b!964477 () Bool)

(declare-fun res!645627 () Bool)

(assert (=> b!964477 (=> (not res!645627) (not e!543702))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33857)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33857)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14052 0))(
  ( (tuple2!14053 (_1!7037 (_ BitVec 64)) (_2!7037 V!33857)) )
))
(declare-datatypes ((List!19859 0))(
  ( (Nil!19856) (Cons!19855 (h!21017 tuple2!14052) (t!28213 List!19859)) )
))
(declare-datatypes ((ListLongMap!12739 0))(
  ( (ListLongMap!12740 (toList!6385 List!19859)) )
))
(declare-fun contains!5432 (ListLongMap!12739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3547 (array!59332 array!59334 (_ BitVec 32) (_ BitVec 32) V!33857 V!33857 (_ BitVec 32) Int) ListLongMap!12739)

(assert (=> b!964477 (= res!645627 (contains!5432 (getCurrentListMap!3547 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28535 _keys!1686) i!803)))))

(declare-fun b!964478 () Bool)

(declare-fun res!645631 () Bool)

(assert (=> b!964478 (=> (not res!645631) (not e!543702))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964478 (= res!645631 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29016 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29016 _keys!1686))))))

(declare-fun b!964479 () Bool)

(declare-fun res!645634 () Bool)

(assert (=> b!964479 (=> (not res!645634) (not e!543702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59332 (_ BitVec 32)) Bool)

(assert (=> b!964479 (= res!645634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964480 () Bool)

(declare-fun e!543700 () Bool)

(assert (=> b!964480 (= e!543700 true)))

(assert (=> b!964480 (contains!5432 (getCurrentListMap!3547 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28535 _keys!1686) i!803))))

(declare-datatypes ((Unit!32156 0))(
  ( (Unit!32157) )
))
(declare-fun lt!430912 () Unit!32156)

(declare-fun lemmaInListMapFromThenInFromSmaller!37 (array!59332 array!59334 (_ BitVec 32) (_ BitVec 32) V!33857 V!33857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32156)

(assert (=> b!964480 (= lt!430912 (lemmaInListMapFromThenInFromSmaller!37 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964481 () Bool)

(declare-fun res!645632 () Bool)

(assert (=> b!964481 (=> (not res!645632) (not e!543702))))

(assert (=> b!964481 (= res!645632 (and (= (size!29017 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29016 _keys!1686) (size!29017 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964482 () Bool)

(declare-fun res!645629 () Bool)

(assert (=> b!964482 (=> (not res!645629) (not e!543702))))

(assert (=> b!964482 (= res!645629 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964473 () Bool)

(declare-fun res!645635 () Bool)

(assert (=> b!964473 (=> (not res!645635) (not e!543702))))

(declare-datatypes ((List!19860 0))(
  ( (Nil!19857) (Cons!19856 (h!21018 (_ BitVec 64)) (t!28214 List!19860)) )
))
(declare-fun arrayNoDuplicates!0 (array!59332 (_ BitVec 32) List!19860) Bool)

(assert (=> b!964473 (= res!645635 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19857))))

(declare-fun res!645630 () Bool)

(assert (=> start!82702 (=> (not res!645630) (not e!543702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82702 (= res!645630 (validMask!0 mask!2110))))

(assert (=> start!82702 e!543702))

(assert (=> start!82702 true))

(declare-fun e!543703 () Bool)

(declare-fun array_inv!22161 (array!59334) Bool)

(assert (=> start!82702 (and (array_inv!22161 _values!1400) e!543703)))

(declare-fun array_inv!22162 (array!59332) Bool)

(assert (=> start!82702 (array_inv!22162 _keys!1686)))

(assert (=> start!82702 tp!65680))

(assert (=> start!82702 tp_is_empty!21655))

(declare-fun b!964483 () Bool)

(assert (=> b!964483 (= e!543703 (and e!543699 mapRes!34477))))

(declare-fun condMapEmpty!34477 () Bool)

(declare-fun mapDefault!34477 () ValueCell!10346)

(assert (=> b!964483 (= condMapEmpty!34477 (= (arr!28536 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10346)) mapDefault!34477)))))

(declare-fun b!964484 () Bool)

(assert (=> b!964484 (= e!543702 (not e!543700))))

(declare-fun res!645628 () Bool)

(assert (=> b!964484 (=> res!645628 e!543700)))

(assert (=> b!964484 (= res!645628 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29016 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964484 (contains!5432 (getCurrentListMap!3547 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28535 _keys!1686) i!803))))

(declare-fun lt!430913 () Unit!32156)

(declare-fun lemmaInListMapFromThenInFromMinusOne!43 (array!59332 array!59334 (_ BitVec 32) (_ BitVec 32) V!33857 V!33857 (_ BitVec 32) (_ BitVec 32) Int) Unit!32156)

(assert (=> b!964484 (= lt!430913 (lemmaInListMapFromThenInFromMinusOne!43 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(assert (= (and start!82702 res!645630) b!964481))

(assert (= (and b!964481 res!645632) b!964479))

(assert (= (and b!964479 res!645634) b!964473))

(assert (= (and b!964473 res!645635) b!964478))

(assert (= (and b!964478 res!645631) b!964474))

(assert (= (and b!964474 res!645633) b!964477))

(assert (= (and b!964477 res!645627) b!964482))

(assert (= (and b!964482 res!645629) b!964484))

(assert (= (and b!964484 (not res!645628)) b!964480))

(assert (= (and b!964483 condMapEmpty!34477) mapIsEmpty!34477))

(assert (= (and b!964483 (not condMapEmpty!34477)) mapNonEmpty!34477))

(get-info :version)

(assert (= (and mapNonEmpty!34477 ((_ is ValueCellFull!10346) mapValue!34477)) b!964476))

(assert (= (and b!964483 ((_ is ValueCellFull!10346) mapDefault!34477)) b!964475))

(assert (= start!82702 b!964483))

(declare-fun m!893179 () Bool)

(assert (=> b!964474 m!893179))

(assert (=> b!964474 m!893179))

(declare-fun m!893181 () Bool)

(assert (=> b!964474 m!893181))

(declare-fun m!893183 () Bool)

(assert (=> b!964479 m!893183))

(declare-fun m!893185 () Bool)

(assert (=> b!964480 m!893185))

(assert (=> b!964480 m!893179))

(assert (=> b!964480 m!893185))

(assert (=> b!964480 m!893179))

(declare-fun m!893187 () Bool)

(assert (=> b!964480 m!893187))

(declare-fun m!893189 () Bool)

(assert (=> b!964480 m!893189))

(declare-fun m!893191 () Bool)

(assert (=> b!964477 m!893191))

(assert (=> b!964477 m!893179))

(assert (=> b!964477 m!893191))

(assert (=> b!964477 m!893179))

(declare-fun m!893193 () Bool)

(assert (=> b!964477 m!893193))

(declare-fun m!893195 () Bool)

(assert (=> start!82702 m!893195))

(declare-fun m!893197 () Bool)

(assert (=> start!82702 m!893197))

(declare-fun m!893199 () Bool)

(assert (=> start!82702 m!893199))

(declare-fun m!893201 () Bool)

(assert (=> mapNonEmpty!34477 m!893201))

(declare-fun m!893203 () Bool)

(assert (=> b!964473 m!893203))

(declare-fun m!893205 () Bool)

(assert (=> b!964484 m!893205))

(assert (=> b!964484 m!893179))

(assert (=> b!964484 m!893205))

(assert (=> b!964484 m!893179))

(declare-fun m!893207 () Bool)

(assert (=> b!964484 m!893207))

(declare-fun m!893209 () Bool)

(assert (=> b!964484 m!893209))

(check-sat (not b!964484) (not b_next!18853) (not b!964473) b_and!30315 (not b!964480) (not b!964474) (not start!82702) (not b!964477) tp_is_empty!21655 (not mapNonEmpty!34477) (not b!964479))
(check-sat b_and!30315 (not b_next!18853))
