; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82836 () Bool)

(assert start!82836)

(declare-fun b_free!18963 () Bool)

(declare-fun b_next!18963 () Bool)

(assert (=> start!82836 (= b_free!18963 (not b_next!18963))))

(declare-fun tp!66017 () Bool)

(declare-fun b_and!30451 () Bool)

(assert (=> start!82836 (= tp!66017 b_and!30451)))

(declare-fun res!646821 () Bool)

(declare-fun e!544733 () Bool)

(assert (=> start!82836 (=> (not res!646821) (not e!544733))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82836 (= res!646821 (validMask!0 mask!2110))))

(assert (=> start!82836 e!544733))

(assert (=> start!82836 true))

(declare-datatypes ((V!34011 0))(
  ( (V!34012 (val!10936 Int)) )
))
(declare-datatypes ((ValueCell!10404 0))(
  ( (ValueCellFull!10404 (v!13494 V!34011)) (EmptyCell!10404) )
))
(declare-datatypes ((array!59627 0))(
  ( (array!59628 (arr!28682 (Array (_ BitVec 32) ValueCell!10404)) (size!29161 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59627)

(declare-fun e!544732 () Bool)

(declare-fun array_inv!22215 (array!59627) Bool)

(assert (=> start!82836 (and (array_inv!22215 _values!1400) e!544732)))

(declare-datatypes ((array!59629 0))(
  ( (array!59630 (arr!28683 (Array (_ BitVec 32) (_ BitVec 64))) (size!29162 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59629)

(declare-fun array_inv!22216 (array!59629) Bool)

(assert (=> start!82836 (array_inv!22216 _keys!1686)))

(assert (=> start!82836 tp!66017))

(declare-fun tp_is_empty!21771 () Bool)

(assert (=> start!82836 tp_is_empty!21771))

(declare-fun b!966317 () Bool)

(declare-fun res!646825 () Bool)

(assert (=> b!966317 (=> (not res!646825) (not e!544733))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966317 (= res!646825 (validKeyInArray!0 (select (arr!28683 _keys!1686) i!803)))))

(declare-fun b!966318 () Bool)

(declare-fun res!646822 () Bool)

(assert (=> b!966318 (=> (not res!646822) (not e!544733))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966318 (= res!646822 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29162 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29162 _keys!1686))))))

(declare-fun b!966319 () Bool)

(declare-fun e!544736 () Bool)

(assert (=> b!966319 (= e!544736 tp_is_empty!21771)))

(declare-fun b!966320 () Bool)

(assert (=> b!966320 (= e!544733 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431320 () Bool)

(declare-fun minValue!1342 () V!34011)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34011)

(declare-datatypes ((tuple2!14066 0))(
  ( (tuple2!14067 (_1!7044 (_ BitVec 64)) (_2!7044 V!34011)) )
))
(declare-datatypes ((List!19909 0))(
  ( (Nil!19906) (Cons!19905 (h!21067 tuple2!14066) (t!28272 List!19909)) )
))
(declare-datatypes ((ListLongMap!12763 0))(
  ( (ListLongMap!12764 (toList!6397 List!19909)) )
))
(declare-fun contains!5498 (ListLongMap!12763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3630 (array!59629 array!59627 (_ BitVec 32) (_ BitVec 32) V!34011 V!34011 (_ BitVec 32) Int) ListLongMap!12763)

(assert (=> b!966320 (= lt!431320 (contains!5498 (getCurrentListMap!3630 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28683 _keys!1686) i!803)))))

(declare-fun b!966321 () Bool)

(declare-fun e!544734 () Bool)

(assert (=> b!966321 (= e!544734 tp_is_empty!21771)))

(declare-fun b!966322 () Bool)

(declare-fun mapRes!34651 () Bool)

(assert (=> b!966322 (= e!544732 (and e!544734 mapRes!34651))))

(declare-fun condMapEmpty!34651 () Bool)

(declare-fun mapDefault!34651 () ValueCell!10404)

(assert (=> b!966322 (= condMapEmpty!34651 (= (arr!28682 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10404)) mapDefault!34651)))))

(declare-fun mapNonEmpty!34651 () Bool)

(declare-fun tp!66018 () Bool)

(assert (=> mapNonEmpty!34651 (= mapRes!34651 (and tp!66018 e!544736))))

(declare-fun mapKey!34651 () (_ BitVec 32))

(declare-fun mapRest!34651 () (Array (_ BitVec 32) ValueCell!10404))

(declare-fun mapValue!34651 () ValueCell!10404)

(assert (=> mapNonEmpty!34651 (= (arr!28682 _values!1400) (store mapRest!34651 mapKey!34651 mapValue!34651))))

(declare-fun mapIsEmpty!34651 () Bool)

(assert (=> mapIsEmpty!34651 mapRes!34651))

(declare-fun b!966323 () Bool)

(declare-fun res!646824 () Bool)

(assert (=> b!966323 (=> (not res!646824) (not e!544733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59629 (_ BitVec 32)) Bool)

(assert (=> b!966323 (= res!646824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966324 () Bool)

(declare-fun res!646820 () Bool)

(assert (=> b!966324 (=> (not res!646820) (not e!544733))))

(declare-datatypes ((List!19910 0))(
  ( (Nil!19907) (Cons!19906 (h!21068 (_ BitVec 64)) (t!28273 List!19910)) )
))
(declare-fun arrayNoDuplicates!0 (array!59629 (_ BitVec 32) List!19910) Bool)

(assert (=> b!966324 (= res!646820 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19907))))

(declare-fun b!966325 () Bool)

(declare-fun res!646823 () Bool)

(assert (=> b!966325 (=> (not res!646823) (not e!544733))))

(assert (=> b!966325 (= res!646823 (and (= (size!29161 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29162 _keys!1686) (size!29161 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82836 res!646821) b!966325))

(assert (= (and b!966325 res!646823) b!966323))

(assert (= (and b!966323 res!646824) b!966324))

(assert (= (and b!966324 res!646820) b!966318))

(assert (= (and b!966318 res!646822) b!966317))

(assert (= (and b!966317 res!646825) b!966320))

(assert (= (and b!966322 condMapEmpty!34651) mapIsEmpty!34651))

(assert (= (and b!966322 (not condMapEmpty!34651)) mapNonEmpty!34651))

(get-info :version)

(assert (= (and mapNonEmpty!34651 ((_ is ValueCellFull!10404) mapValue!34651)) b!966319))

(assert (= (and b!966322 ((_ is ValueCellFull!10404) mapDefault!34651)) b!966321))

(assert (= start!82836 b!966322))

(declare-fun m!895139 () Bool)

(assert (=> start!82836 m!895139))

(declare-fun m!895141 () Bool)

(assert (=> start!82836 m!895141))

(declare-fun m!895143 () Bool)

(assert (=> start!82836 m!895143))

(declare-fun m!895145 () Bool)

(assert (=> b!966323 m!895145))

(declare-fun m!895147 () Bool)

(assert (=> b!966320 m!895147))

(declare-fun m!895149 () Bool)

(assert (=> b!966320 m!895149))

(assert (=> b!966320 m!895147))

(assert (=> b!966320 m!895149))

(declare-fun m!895151 () Bool)

(assert (=> b!966320 m!895151))

(declare-fun m!895153 () Bool)

(assert (=> mapNonEmpty!34651 m!895153))

(declare-fun m!895155 () Bool)

(assert (=> b!966324 m!895155))

(assert (=> b!966317 m!895149))

(assert (=> b!966317 m!895149))

(declare-fun m!895157 () Bool)

(assert (=> b!966317 m!895157))

(check-sat (not start!82836) tp_is_empty!21771 (not b!966324) (not b!966317) (not b!966323) b_and!30451 (not b!966320) (not b_next!18963) (not mapNonEmpty!34651))
(check-sat b_and!30451 (not b_next!18963))
