; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82810 () Bool)

(assert start!82810)

(declare-fun b_free!18775 () Bool)

(declare-fun b_next!18775 () Bool)

(assert (=> start!82810 (= b_free!18775 (not b_next!18775))))

(declare-fun tp!65445 () Bool)

(declare-fun b_and!30273 () Bool)

(assert (=> start!82810 (= tp!65445 b_and!30273)))

(declare-fun b!964263 () Bool)

(declare-fun res!645083 () Bool)

(declare-fun e!543778 () Bool)

(assert (=> b!964263 (=> (not res!645083) (not e!543778))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33753 0))(
  ( (V!33754 (val!10839 Int)) )
))
(declare-datatypes ((ValueCell!10307 0))(
  ( (ValueCellFull!10307 (v!13394 V!33753)) (EmptyCell!10307) )
))
(declare-datatypes ((array!59266 0))(
  ( (array!59267 (arr!28497 (Array (_ BitVec 32) ValueCell!10307)) (size!28977 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59266)

(declare-datatypes ((array!59268 0))(
  ( (array!59269 (arr!28498 (Array (_ BitVec 32) (_ BitVec 64))) (size!28978 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59268)

(declare-fun minValue!1342 () V!33753)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33753)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13908 0))(
  ( (tuple2!13909 (_1!6965 (_ BitVec 64)) (_2!6965 V!33753)) )
))
(declare-datatypes ((List!19758 0))(
  ( (Nil!19755) (Cons!19754 (h!20922 tuple2!13908) (t!28113 List!19758)) )
))
(declare-datatypes ((ListLongMap!12607 0))(
  ( (ListLongMap!12608 (toList!6319 List!19758)) )
))
(declare-fun contains!5434 (ListLongMap!12607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3552 (array!59268 array!59266 (_ BitVec 32) (_ BitVec 32) V!33753 V!33753 (_ BitVec 32) Int) ListLongMap!12607)

(assert (=> b!964263 (= res!645083 (contains!5434 (getCurrentListMap!3552 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28498 _keys!1686) i!803)))))

(declare-fun b!964264 () Bool)

(declare-fun res!645085 () Bool)

(assert (=> b!964264 (=> (not res!645085) (not e!543778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964264 (= res!645085 (validKeyInArray!0 (select (arr!28498 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34360 () Bool)

(declare-fun mapRes!34360 () Bool)

(declare-fun tp!65446 () Bool)

(declare-fun e!543780 () Bool)

(assert (=> mapNonEmpty!34360 (= mapRes!34360 (and tp!65446 e!543780))))

(declare-fun mapKey!34360 () (_ BitVec 32))

(declare-fun mapValue!34360 () ValueCell!10307)

(declare-fun mapRest!34360 () (Array (_ BitVec 32) ValueCell!10307))

(assert (=> mapNonEmpty!34360 (= (arr!28497 _values!1400) (store mapRest!34360 mapKey!34360 mapValue!34360))))

(declare-fun b!964265 () Bool)

(assert (=> b!964265 (= e!543778 (not true))))

(assert (=> b!964265 (contains!5434 (getCurrentListMap!3552 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28498 _keys!1686) i!803))))

(declare-datatypes ((Unit!32198 0))(
  ( (Unit!32199) )
))
(declare-fun lt!431327 () Unit!32198)

(declare-fun lemmaInListMapFromThenInFromMinusOne!13 (array!59268 array!59266 (_ BitVec 32) (_ BitVec 32) V!33753 V!33753 (_ BitVec 32) (_ BitVec 32) Int) Unit!32198)

(assert (=> b!964265 (= lt!431327 (lemmaInListMapFromThenInFromMinusOne!13 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!645086 () Bool)

(assert (=> start!82810 (=> (not res!645086) (not e!543778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82810 (= res!645086 (validMask!0 mask!2110))))

(assert (=> start!82810 e!543778))

(assert (=> start!82810 true))

(declare-fun e!543782 () Bool)

(declare-fun array_inv!22139 (array!59266) Bool)

(assert (=> start!82810 (and (array_inv!22139 _values!1400) e!543782)))

(declare-fun array_inv!22140 (array!59268) Bool)

(assert (=> start!82810 (array_inv!22140 _keys!1686)))

(assert (=> start!82810 tp!65445))

(declare-fun tp_is_empty!21577 () Bool)

(assert (=> start!82810 tp_is_empty!21577))

(declare-fun mapIsEmpty!34360 () Bool)

(assert (=> mapIsEmpty!34360 mapRes!34360))

(declare-fun b!964266 () Bool)

(declare-fun e!543779 () Bool)

(assert (=> b!964266 (= e!543782 (and e!543779 mapRes!34360))))

(declare-fun condMapEmpty!34360 () Bool)

(declare-fun mapDefault!34360 () ValueCell!10307)

(assert (=> b!964266 (= condMapEmpty!34360 (= (arr!28497 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10307)) mapDefault!34360)))))

(declare-fun b!964267 () Bool)

(declare-fun res!645082 () Bool)

(assert (=> b!964267 (=> (not res!645082) (not e!543778))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964267 (= res!645082 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28978 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28978 _keys!1686))))))

(declare-fun b!964268 () Bool)

(declare-fun res!645080 () Bool)

(assert (=> b!964268 (=> (not res!645080) (not e!543778))))

(declare-datatypes ((List!19759 0))(
  ( (Nil!19756) (Cons!19755 (h!20923 (_ BitVec 64)) (t!28114 List!19759)) )
))
(declare-fun arrayNoDuplicates!0 (array!59268 (_ BitVec 32) List!19759) Bool)

(assert (=> b!964268 (= res!645080 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19756))))

(declare-fun b!964269 () Bool)

(declare-fun res!645087 () Bool)

(assert (=> b!964269 (=> (not res!645087) (not e!543778))))

(assert (=> b!964269 (= res!645087 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964270 () Bool)

(assert (=> b!964270 (= e!543779 tp_is_empty!21577)))

(declare-fun b!964271 () Bool)

(declare-fun res!645081 () Bool)

(assert (=> b!964271 (=> (not res!645081) (not e!543778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59268 (_ BitVec 32)) Bool)

(assert (=> b!964271 (= res!645081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964272 () Bool)

(assert (=> b!964272 (= e!543780 tp_is_empty!21577)))

(declare-fun b!964273 () Bool)

(declare-fun res!645084 () Bool)

(assert (=> b!964273 (=> (not res!645084) (not e!543778))))

(assert (=> b!964273 (= res!645084 (and (= (size!28977 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28978 _keys!1686) (size!28977 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82810 res!645086) b!964273))

(assert (= (and b!964273 res!645084) b!964271))

(assert (= (and b!964271 res!645081) b!964268))

(assert (= (and b!964268 res!645080) b!964267))

(assert (= (and b!964267 res!645082) b!964264))

(assert (= (and b!964264 res!645085) b!964263))

(assert (= (and b!964263 res!645083) b!964269))

(assert (= (and b!964269 res!645087) b!964265))

(assert (= (and b!964266 condMapEmpty!34360) mapIsEmpty!34360))

(assert (= (and b!964266 (not condMapEmpty!34360)) mapNonEmpty!34360))

(get-info :version)

(assert (= (and mapNonEmpty!34360 ((_ is ValueCellFull!10307) mapValue!34360)) b!964272))

(assert (= (and b!964266 ((_ is ValueCellFull!10307) mapDefault!34360)) b!964270))

(assert (= start!82810 b!964266))

(declare-fun m!894091 () Bool)

(assert (=> b!964263 m!894091))

(declare-fun m!894093 () Bool)

(assert (=> b!964263 m!894093))

(assert (=> b!964263 m!894091))

(assert (=> b!964263 m!894093))

(declare-fun m!894095 () Bool)

(assert (=> b!964263 m!894095))

(declare-fun m!894097 () Bool)

(assert (=> b!964271 m!894097))

(declare-fun m!894099 () Bool)

(assert (=> start!82810 m!894099))

(declare-fun m!894101 () Bool)

(assert (=> start!82810 m!894101))

(declare-fun m!894103 () Bool)

(assert (=> start!82810 m!894103))

(declare-fun m!894105 () Bool)

(assert (=> b!964268 m!894105))

(declare-fun m!894107 () Bool)

(assert (=> mapNonEmpty!34360 m!894107))

(assert (=> b!964264 m!894093))

(assert (=> b!964264 m!894093))

(declare-fun m!894109 () Bool)

(assert (=> b!964264 m!894109))

(declare-fun m!894111 () Bool)

(assert (=> b!964265 m!894111))

(assert (=> b!964265 m!894093))

(assert (=> b!964265 m!894111))

(assert (=> b!964265 m!894093))

(declare-fun m!894113 () Bool)

(assert (=> b!964265 m!894113))

(declare-fun m!894115 () Bool)

(assert (=> b!964265 m!894115))

(check-sat (not b!964263) (not start!82810) b_and!30273 (not mapNonEmpty!34360) (not b!964265) (not b!964264) (not b!964271) tp_is_empty!21577 (not b_next!18775) (not b!964268))
(check-sat b_and!30273 (not b_next!18775))
