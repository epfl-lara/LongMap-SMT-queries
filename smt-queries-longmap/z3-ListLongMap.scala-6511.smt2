; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82888 () Bool)

(assert start!82888)

(declare-fun b_free!19033 () Bool)

(declare-fun b_next!19033 () Bool)

(assert (=> start!82888 (= b_free!19033 (not b_next!19033))))

(declare-fun tp!66228 () Bool)

(declare-fun b_and!30495 () Bool)

(assert (=> start!82888 (= tp!66228 b_and!30495)))

(declare-fun res!647467 () Bool)

(declare-fun e!545111 () Bool)

(assert (=> start!82888 (=> (not res!647467) (not e!545111))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82888 (= res!647467 (validMask!0 mask!2110))))

(assert (=> start!82888 e!545111))

(assert (=> start!82888 true))

(declare-datatypes ((V!34105 0))(
  ( (V!34106 (val!10971 Int)) )
))
(declare-datatypes ((ValueCell!10439 0))(
  ( (ValueCellFull!10439 (v!13528 V!34105)) (EmptyCell!10439) )
))
(declare-datatypes ((array!59686 0))(
  ( (array!59687 (arr!28712 (Array (_ BitVec 32) ValueCell!10439)) (size!29193 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59686)

(declare-fun e!545109 () Bool)

(declare-fun array_inv!22295 (array!59686) Bool)

(assert (=> start!82888 (and (array_inv!22295 _values!1400) e!545109)))

(declare-datatypes ((array!59688 0))(
  ( (array!59689 (arr!28713 (Array (_ BitVec 32) (_ BitVec 64))) (size!29194 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59688)

(declare-fun array_inv!22296 (array!59688) Bool)

(assert (=> start!82888 (array_inv!22296 _keys!1686)))

(assert (=> start!82888 tp!66228))

(declare-fun tp_is_empty!21841 () Bool)

(assert (=> start!82888 tp_is_empty!21841))

(declare-fun b!967144 () Bool)

(declare-fun e!545113 () Bool)

(declare-fun mapRes!34756 () Bool)

(assert (=> b!967144 (= e!545109 (and e!545113 mapRes!34756))))

(declare-fun condMapEmpty!34756 () Bool)

(declare-fun mapDefault!34756 () ValueCell!10439)

(assert (=> b!967144 (= condMapEmpty!34756 (= (arr!28712 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10439)) mapDefault!34756)))))

(declare-fun b!967145 () Bool)

(declare-fun res!647463 () Bool)

(assert (=> b!967145 (=> (not res!647463) (not e!545111))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!967145 (= res!647463 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29194 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29194 _keys!1686))))))

(declare-fun b!967146 () Bool)

(declare-fun res!647465 () Bool)

(assert (=> b!967146 (=> (not res!647465) (not e!545111))))

(declare-datatypes ((List!19987 0))(
  ( (Nil!19984) (Cons!19983 (h!21145 (_ BitVec 64)) (t!28341 List!19987)) )
))
(declare-fun arrayNoDuplicates!0 (array!59688 (_ BitVec 32) List!19987) Bool)

(assert (=> b!967146 (= res!647465 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19984))))

(declare-fun b!967147 () Bool)

(assert (=> b!967147 (= e!545111 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34105)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34105)

(declare-datatypes ((tuple2!14184 0))(
  ( (tuple2!14185 (_1!7103 (_ BitVec 64)) (_2!7103 V!34105)) )
))
(declare-datatypes ((List!19988 0))(
  ( (Nil!19985) (Cons!19984 (h!21146 tuple2!14184) (t!28342 List!19988)) )
))
(declare-datatypes ((ListLongMap!12871 0))(
  ( (ListLongMap!12872 (toList!6451 List!19988)) )
))
(declare-fun contains!5496 (ListLongMap!12871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3613 (array!59688 array!59686 (_ BitVec 32) (_ BitVec 32) V!34105 V!34105 (_ BitVec 32) Int) ListLongMap!12871)

(assert (=> b!967147 (contains!5496 (getCurrentListMap!3613 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28713 _keys!1686) i!803))))

(declare-datatypes ((Unit!32194 0))(
  ( (Unit!32195) )
))
(declare-fun lt!431180 () Unit!32194)

(declare-fun lemmaInListMapFromThenInFromMinusOne!61 (array!59688 array!59686 (_ BitVec 32) (_ BitVec 32) V!34105 V!34105 (_ BitVec 32) (_ BitVec 32) Int) Unit!32194)

(assert (=> b!967147 (= lt!431180 (lemmaInListMapFromThenInFromMinusOne!61 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967148 () Bool)

(declare-fun res!647462 () Bool)

(assert (=> b!967148 (=> (not res!647462) (not e!545111))))

(assert (=> b!967148 (= res!647462 (and (= (size!29193 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29194 _keys!1686) (size!29193 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967149 () Bool)

(declare-fun res!647461 () Bool)

(assert (=> b!967149 (=> (not res!647461) (not e!545111))))

(assert (=> b!967149 (= res!647461 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967150 () Bool)

(declare-fun res!647468 () Bool)

(assert (=> b!967150 (=> (not res!647468) (not e!545111))))

(assert (=> b!967150 (= res!647468 (contains!5496 (getCurrentListMap!3613 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28713 _keys!1686) i!803)))))

(declare-fun b!967151 () Bool)

(declare-fun res!647464 () Bool)

(assert (=> b!967151 (=> (not res!647464) (not e!545111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967151 (= res!647464 (validKeyInArray!0 (select (arr!28713 _keys!1686) i!803)))))

(declare-fun b!967152 () Bool)

(assert (=> b!967152 (= e!545113 tp_is_empty!21841)))

(declare-fun mapIsEmpty!34756 () Bool)

(assert (=> mapIsEmpty!34756 mapRes!34756))

(declare-fun b!967153 () Bool)

(declare-fun e!545110 () Bool)

(assert (=> b!967153 (= e!545110 tp_is_empty!21841)))

(declare-fun mapNonEmpty!34756 () Bool)

(declare-fun tp!66229 () Bool)

(assert (=> mapNonEmpty!34756 (= mapRes!34756 (and tp!66229 e!545110))))

(declare-fun mapRest!34756 () (Array (_ BitVec 32) ValueCell!10439))

(declare-fun mapKey!34756 () (_ BitVec 32))

(declare-fun mapValue!34756 () ValueCell!10439)

(assert (=> mapNonEmpty!34756 (= (arr!28712 _values!1400) (store mapRest!34756 mapKey!34756 mapValue!34756))))

(declare-fun b!967154 () Bool)

(declare-fun res!647466 () Bool)

(assert (=> b!967154 (=> (not res!647466) (not e!545111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59688 (_ BitVec 32)) Bool)

(assert (=> b!967154 (= res!647466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82888 res!647467) b!967148))

(assert (= (and b!967148 res!647462) b!967154))

(assert (= (and b!967154 res!647466) b!967146))

(assert (= (and b!967146 res!647465) b!967145))

(assert (= (and b!967145 res!647463) b!967151))

(assert (= (and b!967151 res!647464) b!967150))

(assert (= (and b!967150 res!647468) b!967149))

(assert (= (and b!967149 res!647461) b!967147))

(assert (= (and b!967144 condMapEmpty!34756) mapIsEmpty!34756))

(assert (= (and b!967144 (not condMapEmpty!34756)) mapNonEmpty!34756))

(get-info :version)

(assert (= (and mapNonEmpty!34756 ((_ is ValueCellFull!10439) mapValue!34756)) b!967153))

(assert (= (and b!967144 ((_ is ValueCellFull!10439) mapDefault!34756)) b!967152))

(assert (= start!82888 b!967144))

(declare-fun m!895189 () Bool)

(assert (=> mapNonEmpty!34756 m!895189))

(declare-fun m!895191 () Bool)

(assert (=> start!82888 m!895191))

(declare-fun m!895193 () Bool)

(assert (=> start!82888 m!895193))

(declare-fun m!895195 () Bool)

(assert (=> start!82888 m!895195))

(declare-fun m!895197 () Bool)

(assert (=> b!967151 m!895197))

(assert (=> b!967151 m!895197))

(declare-fun m!895199 () Bool)

(assert (=> b!967151 m!895199))

(declare-fun m!895201 () Bool)

(assert (=> b!967150 m!895201))

(assert (=> b!967150 m!895197))

(assert (=> b!967150 m!895201))

(assert (=> b!967150 m!895197))

(declare-fun m!895203 () Bool)

(assert (=> b!967150 m!895203))

(declare-fun m!895205 () Bool)

(assert (=> b!967147 m!895205))

(assert (=> b!967147 m!895197))

(assert (=> b!967147 m!895205))

(assert (=> b!967147 m!895197))

(declare-fun m!895207 () Bool)

(assert (=> b!967147 m!895207))

(declare-fun m!895209 () Bool)

(assert (=> b!967147 m!895209))

(declare-fun m!895211 () Bool)

(assert (=> b!967146 m!895211))

(declare-fun m!895213 () Bool)

(assert (=> b!967154 m!895213))

(check-sat (not mapNonEmpty!34756) (not b!967151) (not b!967150) tp_is_empty!21841 (not b!967154) b_and!30495 (not b!967147) (not b_next!19033) (not b!967146) (not start!82888))
(check-sat b_and!30495 (not b_next!19033))
