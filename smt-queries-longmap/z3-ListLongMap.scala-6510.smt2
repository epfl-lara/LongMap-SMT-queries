; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83068 () Bool)

(assert start!83068)

(declare-fun b_free!19027 () Bool)

(declare-fun b_next!19027 () Bool)

(assert (=> start!83068 (= b_free!19027 (not b_next!19027))))

(declare-fun tp!66210 () Bool)

(declare-fun b_and!30525 () Bool)

(assert (=> start!83068 (= tp!66210 b_and!30525)))

(declare-fun b!968187 () Bool)

(declare-fun res!647845 () Bool)

(declare-fun e!545794 () Bool)

(assert (=> b!968187 (=> (not res!647845) (not e!545794))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34097 0))(
  ( (V!34098 (val!10968 Int)) )
))
(declare-datatypes ((ValueCell!10436 0))(
  ( (ValueCellFull!10436 (v!13523 V!34097)) (EmptyCell!10436) )
))
(declare-datatypes ((array!59768 0))(
  ( (array!59769 (arr!28748 (Array (_ BitVec 32) ValueCell!10436)) (size!29228 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59768)

(declare-datatypes ((array!59770 0))(
  ( (array!59771 (arr!28749 (Array (_ BitVec 32) (_ BitVec 64))) (size!29229 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59770)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!968187 (= res!647845 (and (= (size!29228 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29229 _keys!1686) (size!29228 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!647846 () Bool)

(assert (=> start!83068 (=> (not res!647846) (not e!545794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83068 (= res!647846 (validMask!0 mask!2110))))

(assert (=> start!83068 e!545794))

(assert (=> start!83068 true))

(declare-fun e!545797 () Bool)

(declare-fun array_inv!22317 (array!59768) Bool)

(assert (=> start!83068 (and (array_inv!22317 _values!1400) e!545797)))

(declare-fun array_inv!22318 (array!59770) Bool)

(assert (=> start!83068 (array_inv!22318 _keys!1686)))

(assert (=> start!83068 tp!66210))

(declare-fun tp_is_empty!21835 () Bool)

(assert (=> start!83068 tp_is_empty!21835))

(declare-fun b!968188 () Bool)

(declare-fun res!647849 () Bool)

(assert (=> b!968188 (=> (not res!647849) (not e!545794))))

(declare-datatypes ((List!19942 0))(
  ( (Nil!19939) (Cons!19938 (h!21106 (_ BitVec 64)) (t!28297 List!19942)) )
))
(declare-fun arrayNoDuplicates!0 (array!59770 (_ BitVec 32) List!19942) Bool)

(assert (=> b!968188 (= res!647849 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19939))))

(declare-fun b!968189 () Bool)

(assert (=> b!968189 (= e!545794 (not true))))

(declare-fun minValue!1342 () V!34097)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34097)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14096 0))(
  ( (tuple2!14097 (_1!7059 (_ BitVec 64)) (_2!7059 V!34097)) )
))
(declare-datatypes ((List!19943 0))(
  ( (Nil!19940) (Cons!19939 (h!21107 tuple2!14096) (t!28298 List!19943)) )
))
(declare-datatypes ((ListLongMap!12795 0))(
  ( (ListLongMap!12796 (toList!6413 List!19943)) )
))
(declare-fun contains!5525 (ListLongMap!12795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3646 (array!59770 array!59768 (_ BitVec 32) (_ BitVec 32) V!34097 V!34097 (_ BitVec 32) Int) ListLongMap!12795)

(assert (=> b!968189 (contains!5525 (getCurrentListMap!3646 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28749 _keys!1686) i!803))))

(declare-datatypes ((Unit!32280 0))(
  ( (Unit!32281) )
))
(declare-fun lt!431768 () Unit!32280)

(declare-fun lemmaInListMapFromThenInFromMinusOne!51 (array!59770 array!59768 (_ BitVec 32) (_ BitVec 32) V!34097 V!34097 (_ BitVec 32) (_ BitVec 32) Int) Unit!32280)

(assert (=> b!968189 (= lt!431768 (lemmaInListMapFromThenInFromMinusOne!51 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968190 () Bool)

(declare-fun res!647850 () Bool)

(assert (=> b!968190 (=> (not res!647850) (not e!545794))))

(assert (=> b!968190 (= res!647850 (contains!5525 (getCurrentListMap!3646 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28749 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34747 () Bool)

(declare-fun mapRes!34747 () Bool)

(declare-fun tp!66211 () Bool)

(declare-fun e!545796 () Bool)

(assert (=> mapNonEmpty!34747 (= mapRes!34747 (and tp!66211 e!545796))))

(declare-fun mapKey!34747 () (_ BitVec 32))

(declare-fun mapRest!34747 () (Array (_ BitVec 32) ValueCell!10436))

(declare-fun mapValue!34747 () ValueCell!10436)

(assert (=> mapNonEmpty!34747 (= (arr!28748 _values!1400) (store mapRest!34747 mapKey!34747 mapValue!34747))))

(declare-fun b!968191 () Bool)

(declare-fun res!647848 () Bool)

(assert (=> b!968191 (=> (not res!647848) (not e!545794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968191 (= res!647848 (validKeyInArray!0 (select (arr!28749 _keys!1686) i!803)))))

(declare-fun b!968192 () Bool)

(declare-fun e!545798 () Bool)

(assert (=> b!968192 (= e!545797 (and e!545798 mapRes!34747))))

(declare-fun condMapEmpty!34747 () Bool)

(declare-fun mapDefault!34747 () ValueCell!10436)

(assert (=> b!968192 (= condMapEmpty!34747 (= (arr!28748 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10436)) mapDefault!34747)))))

(declare-fun b!968193 () Bool)

(declare-fun res!647843 () Bool)

(assert (=> b!968193 (=> (not res!647843) (not e!545794))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968193 (= res!647843 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968194 () Bool)

(declare-fun res!647844 () Bool)

(assert (=> b!968194 (=> (not res!647844) (not e!545794))))

(assert (=> b!968194 (= res!647844 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29229 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29229 _keys!1686))))))

(declare-fun mapIsEmpty!34747 () Bool)

(assert (=> mapIsEmpty!34747 mapRes!34747))

(declare-fun b!968195 () Bool)

(assert (=> b!968195 (= e!545796 tp_is_empty!21835)))

(declare-fun b!968196 () Bool)

(assert (=> b!968196 (= e!545798 tp_is_empty!21835)))

(declare-fun b!968197 () Bool)

(declare-fun res!647847 () Bool)

(assert (=> b!968197 (=> (not res!647847) (not e!545794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59770 (_ BitVec 32)) Bool)

(assert (=> b!968197 (= res!647847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!83068 res!647846) b!968187))

(assert (= (and b!968187 res!647845) b!968197))

(assert (= (and b!968197 res!647847) b!968188))

(assert (= (and b!968188 res!647849) b!968194))

(assert (= (and b!968194 res!647844) b!968191))

(assert (= (and b!968191 res!647848) b!968190))

(assert (= (and b!968190 res!647850) b!968193))

(assert (= (and b!968193 res!647843) b!968189))

(assert (= (and b!968192 condMapEmpty!34747) mapIsEmpty!34747))

(assert (= (and b!968192 (not condMapEmpty!34747)) mapNonEmpty!34747))

(get-info :version)

(assert (= (and mapNonEmpty!34747 ((_ is ValueCellFull!10436) mapValue!34747)) b!968195))

(assert (= (and b!968192 ((_ is ValueCellFull!10436) mapDefault!34747)) b!968196))

(assert (= start!83068 b!968192))

(declare-fun m!897163 () Bool)

(assert (=> b!968188 m!897163))

(declare-fun m!897165 () Bool)

(assert (=> b!968197 m!897165))

(declare-fun m!897167 () Bool)

(assert (=> b!968189 m!897167))

(declare-fun m!897169 () Bool)

(assert (=> b!968189 m!897169))

(assert (=> b!968189 m!897167))

(assert (=> b!968189 m!897169))

(declare-fun m!897171 () Bool)

(assert (=> b!968189 m!897171))

(declare-fun m!897173 () Bool)

(assert (=> b!968189 m!897173))

(declare-fun m!897175 () Bool)

(assert (=> mapNonEmpty!34747 m!897175))

(assert (=> b!968191 m!897169))

(assert (=> b!968191 m!897169))

(declare-fun m!897177 () Bool)

(assert (=> b!968191 m!897177))

(declare-fun m!897179 () Bool)

(assert (=> start!83068 m!897179))

(declare-fun m!897181 () Bool)

(assert (=> start!83068 m!897181))

(declare-fun m!897183 () Bool)

(assert (=> start!83068 m!897183))

(declare-fun m!897185 () Bool)

(assert (=> b!968190 m!897185))

(assert (=> b!968190 m!897169))

(assert (=> b!968190 m!897185))

(assert (=> b!968190 m!897169))

(declare-fun m!897187 () Bool)

(assert (=> b!968190 m!897187))

(check-sat (not b_next!19027) b_and!30525 (not start!83068) (not b!968188) tp_is_empty!21835 (not b!968190) (not mapNonEmpty!34747) (not b!968189) (not b!968191) (not b!968197))
(check-sat b_and!30525 (not b_next!19027))
