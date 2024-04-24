; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82864 () Bool)

(assert start!82864)

(declare-fun b_free!18829 () Bool)

(declare-fun b_next!18829 () Bool)

(assert (=> start!82864 (= b_free!18829 (not b_next!18829))))

(declare-fun tp!65607 () Bool)

(declare-fun b_and!30327 () Bool)

(assert (=> start!82864 (= tp!65607 b_and!30327)))

(declare-fun b!965183 () Bool)

(declare-fun res!645757 () Bool)

(declare-fun e!544217 () Bool)

(assert (=> b!965183 (=> (not res!645757) (not e!544217))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965183 (= res!645757 (bvsgt from!2084 newFrom!159))))

(declare-fun b!965184 () Bool)

(declare-fun e!544215 () Bool)

(declare-fun e!544214 () Bool)

(declare-fun mapRes!34441 () Bool)

(assert (=> b!965184 (= e!544215 (and e!544214 mapRes!34441))))

(declare-fun condMapEmpty!34441 () Bool)

(declare-datatypes ((V!33825 0))(
  ( (V!33826 (val!10866 Int)) )
))
(declare-datatypes ((ValueCell!10334 0))(
  ( (ValueCellFull!10334 (v!13421 V!33825)) (EmptyCell!10334) )
))
(declare-datatypes ((array!59372 0))(
  ( (array!59373 (arr!28550 (Array (_ BitVec 32) ValueCell!10334)) (size!29030 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59372)

(declare-fun mapDefault!34441 () ValueCell!10334)

(assert (=> b!965184 (= condMapEmpty!34441 (= (arr!28550 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10334)) mapDefault!34441)))))

(declare-fun b!965185 () Bool)

(declare-fun e!544216 () Bool)

(declare-fun tp_is_empty!21631 () Bool)

(assert (=> b!965185 (= e!544216 tp_is_empty!21631)))

(declare-fun b!965186 () Bool)

(declare-fun e!544212 () Bool)

(assert (=> b!965186 (= e!544212 true)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59374 0))(
  ( (array!59375 (arr!28551 (Array (_ BitVec 32) (_ BitVec 64))) (size!29031 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59374)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33825)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33825)

(declare-datatypes ((tuple2!13950 0))(
  ( (tuple2!13951 (_1!6986 (_ BitVec 64)) (_2!6986 V!33825)) )
))
(declare-datatypes ((List!19799 0))(
  ( (Nil!19796) (Cons!19795 (h!20963 tuple2!13950) (t!28154 List!19799)) )
))
(declare-datatypes ((ListLongMap!12649 0))(
  ( (ListLongMap!12650 (toList!6340 List!19799)) )
))
(declare-fun contains!5455 (ListLongMap!12649 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3573 (array!59374 array!59372 (_ BitVec 32) (_ BitVec 32) V!33825 V!33825 (_ BitVec 32) Int) ListLongMap!12649)

(assert (=> b!965186 (contains!5455 (getCurrentListMap!3573 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28551 _keys!1686) i!803))))

(declare-datatypes ((Unit!32236 0))(
  ( (Unit!32237) )
))
(declare-fun lt!431437 () Unit!32236)

(declare-fun lemmaInListMapFromThenInFromSmaller!27 (array!59374 array!59372 (_ BitVec 32) (_ BitVec 32) V!33825 V!33825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32236)

(assert (=> b!965186 (= lt!431437 (lemmaInListMapFromThenInFromSmaller!27 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!965187 () Bool)

(assert (=> b!965187 (= e!544217 (not e!544212))))

(declare-fun res!645763 () Bool)

(assert (=> b!965187 (=> res!645763 e!544212)))

(assert (=> b!965187 (= res!645763 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29031 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!965187 (contains!5455 (getCurrentListMap!3573 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28551 _keys!1686) i!803))))

(declare-fun lt!431438 () Unit!32236)

(declare-fun lemmaInListMapFromThenInFromMinusOne!32 (array!59374 array!59372 (_ BitVec 32) (_ BitVec 32) V!33825 V!33825 (_ BitVec 32) (_ BitVec 32) Int) Unit!32236)

(assert (=> b!965187 (= lt!431438 (lemmaInListMapFromThenInFromMinusOne!32 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!965188 () Bool)

(declare-fun res!645759 () Bool)

(assert (=> b!965188 (=> (not res!645759) (not e!544217))))

(declare-datatypes ((List!19800 0))(
  ( (Nil!19797) (Cons!19796 (h!20964 (_ BitVec 64)) (t!28155 List!19800)) )
))
(declare-fun arrayNoDuplicates!0 (array!59374 (_ BitVec 32) List!19800) Bool)

(assert (=> b!965188 (= res!645759 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19797))))

(declare-fun b!965190 () Bool)

(declare-fun res!645765 () Bool)

(assert (=> b!965190 (=> (not res!645765) (not e!544217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965190 (= res!645765 (validKeyInArray!0 (select (arr!28551 _keys!1686) i!803)))))

(declare-fun b!965191 () Bool)

(declare-fun res!645761 () Bool)

(assert (=> b!965191 (=> (not res!645761) (not e!544217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59374 (_ BitVec 32)) Bool)

(assert (=> b!965191 (= res!645761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965192 () Bool)

(declare-fun res!645764 () Bool)

(assert (=> b!965192 (=> (not res!645764) (not e!544217))))

(assert (=> b!965192 (= res!645764 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29031 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29031 _keys!1686))))))

(declare-fun mapIsEmpty!34441 () Bool)

(assert (=> mapIsEmpty!34441 mapRes!34441))

(declare-fun mapNonEmpty!34441 () Bool)

(declare-fun tp!65608 () Bool)

(assert (=> mapNonEmpty!34441 (= mapRes!34441 (and tp!65608 e!544216))))

(declare-fun mapValue!34441 () ValueCell!10334)

(declare-fun mapKey!34441 () (_ BitVec 32))

(declare-fun mapRest!34441 () (Array (_ BitVec 32) ValueCell!10334))

(assert (=> mapNonEmpty!34441 (= (arr!28550 _values!1400) (store mapRest!34441 mapKey!34441 mapValue!34441))))

(declare-fun b!965193 () Bool)

(declare-fun res!645762 () Bool)

(assert (=> b!965193 (=> (not res!645762) (not e!544217))))

(assert (=> b!965193 (= res!645762 (and (= (size!29030 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29031 _keys!1686) (size!29030 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965194 () Bool)

(declare-fun res!645760 () Bool)

(assert (=> b!965194 (=> (not res!645760) (not e!544217))))

(assert (=> b!965194 (= res!645760 (contains!5455 (getCurrentListMap!3573 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28551 _keys!1686) i!803)))))

(declare-fun b!965189 () Bool)

(assert (=> b!965189 (= e!544214 tp_is_empty!21631)))

(declare-fun res!645758 () Bool)

(assert (=> start!82864 (=> (not res!645758) (not e!544217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82864 (= res!645758 (validMask!0 mask!2110))))

(assert (=> start!82864 e!544217))

(assert (=> start!82864 true))

(declare-fun array_inv!22181 (array!59372) Bool)

(assert (=> start!82864 (and (array_inv!22181 _values!1400) e!544215)))

(declare-fun array_inv!22182 (array!59374) Bool)

(assert (=> start!82864 (array_inv!22182 _keys!1686)))

(assert (=> start!82864 tp!65607))

(assert (=> start!82864 tp_is_empty!21631))

(assert (= (and start!82864 res!645758) b!965193))

(assert (= (and b!965193 res!645762) b!965191))

(assert (= (and b!965191 res!645761) b!965188))

(assert (= (and b!965188 res!645759) b!965192))

(assert (= (and b!965192 res!645764) b!965190))

(assert (= (and b!965190 res!645765) b!965194))

(assert (= (and b!965194 res!645760) b!965183))

(assert (= (and b!965183 res!645757) b!965187))

(assert (= (and b!965187 (not res!645763)) b!965186))

(assert (= (and b!965184 condMapEmpty!34441) mapIsEmpty!34441))

(assert (= (and b!965184 (not condMapEmpty!34441)) mapNonEmpty!34441))

(get-info :version)

(assert (= (and mapNonEmpty!34441 ((_ is ValueCellFull!10334) mapValue!34441)) b!965185))

(assert (= (and b!965184 ((_ is ValueCellFull!10334) mapDefault!34441)) b!965189))

(assert (= start!82864 b!965184))

(declare-fun m!894847 () Bool)

(assert (=> b!965186 m!894847))

(declare-fun m!894849 () Bool)

(assert (=> b!965186 m!894849))

(assert (=> b!965186 m!894847))

(assert (=> b!965186 m!894849))

(declare-fun m!894851 () Bool)

(assert (=> b!965186 m!894851))

(declare-fun m!894853 () Bool)

(assert (=> b!965186 m!894853))

(declare-fun m!894855 () Bool)

(assert (=> mapNonEmpty!34441 m!894855))

(declare-fun m!894857 () Bool)

(assert (=> start!82864 m!894857))

(declare-fun m!894859 () Bool)

(assert (=> start!82864 m!894859))

(declare-fun m!894861 () Bool)

(assert (=> start!82864 m!894861))

(declare-fun m!894863 () Bool)

(assert (=> b!965191 m!894863))

(declare-fun m!894865 () Bool)

(assert (=> b!965194 m!894865))

(assert (=> b!965194 m!894849))

(assert (=> b!965194 m!894865))

(assert (=> b!965194 m!894849))

(declare-fun m!894867 () Bool)

(assert (=> b!965194 m!894867))

(declare-fun m!894869 () Bool)

(assert (=> b!965187 m!894869))

(assert (=> b!965187 m!894849))

(assert (=> b!965187 m!894869))

(assert (=> b!965187 m!894849))

(declare-fun m!894871 () Bool)

(assert (=> b!965187 m!894871))

(declare-fun m!894873 () Bool)

(assert (=> b!965187 m!894873))

(declare-fun m!894875 () Bool)

(assert (=> b!965188 m!894875))

(assert (=> b!965190 m!894849))

(assert (=> b!965190 m!894849))

(declare-fun m!894877 () Bool)

(assert (=> b!965190 m!894877))

(check-sat (not b!965187) (not b!965188) (not start!82864) b_and!30327 (not b!965190) (not b!965186) (not b_next!18829) tp_is_empty!21631 (not b!965194) (not mapNonEmpty!34441) (not b!965191))
(check-sat b_and!30327 (not b_next!18829))
