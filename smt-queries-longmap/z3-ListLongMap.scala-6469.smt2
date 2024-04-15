; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82636 () Bool)

(assert start!82636)

(declare-fun b_free!18787 () Bool)

(declare-fun b_next!18787 () Bool)

(assert (=> start!82636 (= b_free!18787 (not b_next!18787))))

(declare-fun tp!65481 () Bool)

(declare-fun b_and!30249 () Bool)

(assert (=> start!82636 (= tp!65481 b_and!30249)))

(declare-fun b!963319 () Bool)

(declare-fun res!644770 () Bool)

(declare-fun e!543142 () Bool)

(assert (=> b!963319 (=> (not res!644770) (not e!543142))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963319 (= res!644770 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34378 () Bool)

(declare-fun mapRes!34378 () Bool)

(declare-fun tp!65482 () Bool)

(declare-fun e!543138 () Bool)

(assert (=> mapNonEmpty!34378 (= mapRes!34378 (and tp!65482 e!543138))))

(declare-datatypes ((V!33769 0))(
  ( (V!33770 (val!10845 Int)) )
))
(declare-datatypes ((ValueCell!10313 0))(
  ( (ValueCellFull!10313 (v!13402 V!33769)) (EmptyCell!10313) )
))
(declare-datatypes ((array!59204 0))(
  ( (array!59205 (arr!28471 (Array (_ BitVec 32) ValueCell!10313)) (size!28952 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59204)

(declare-fun mapRest!34378 () (Array (_ BitVec 32) ValueCell!10313))

(declare-fun mapValue!34378 () ValueCell!10313)

(declare-fun mapKey!34378 () (_ BitVec 32))

(assert (=> mapNonEmpty!34378 (= (arr!28471 _values!1400) (store mapRest!34378 mapKey!34378 mapValue!34378))))

(declare-fun b!963320 () Bool)

(declare-fun res!644773 () Bool)

(assert (=> b!963320 (=> (not res!644773) (not e!543142))))

(declare-datatypes ((array!59206 0))(
  ( (array!59207 (arr!28472 (Array (_ BitVec 32) (_ BitVec 64))) (size!28953 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59206)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59206 (_ BitVec 32)) Bool)

(assert (=> b!963320 (= res!644773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34378 () Bool)

(assert (=> mapIsEmpty!34378 mapRes!34378))

(declare-fun b!963321 () Bool)

(declare-fun e!543141 () Bool)

(declare-fun e!543139 () Bool)

(assert (=> b!963321 (= e!543141 (and e!543139 mapRes!34378))))

(declare-fun condMapEmpty!34378 () Bool)

(declare-fun mapDefault!34378 () ValueCell!10313)

(assert (=> b!963321 (= condMapEmpty!34378 (= (arr!28471 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10313)) mapDefault!34378)))))

(declare-fun b!963322 () Bool)

(declare-fun tp_is_empty!21589 () Bool)

(assert (=> b!963322 (= e!543139 tp_is_empty!21589)))

(declare-fun b!963323 () Bool)

(declare-fun res!644774 () Bool)

(assert (=> b!963323 (=> (not res!644774) (not e!543142))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33769)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33769)

(declare-datatypes ((tuple2!13998 0))(
  ( (tuple2!13999 (_1!7010 (_ BitVec 64)) (_2!7010 V!33769)) )
))
(declare-datatypes ((List!19807 0))(
  ( (Nil!19804) (Cons!19803 (h!20965 tuple2!13998) (t!28161 List!19807)) )
))
(declare-datatypes ((ListLongMap!12685 0))(
  ( (ListLongMap!12686 (toList!6358 List!19807)) )
))
(declare-fun contains!5405 (ListLongMap!12685 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3520 (array!59206 array!59204 (_ BitVec 32) (_ BitVec 32) V!33769 V!33769 (_ BitVec 32) Int) ListLongMap!12685)

(assert (=> b!963323 (= res!644774 (contains!5405 (getCurrentListMap!3520 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28472 _keys!1686) i!803)))))

(declare-fun b!963324 () Bool)

(assert (=> b!963324 (= e!543138 tp_is_empty!21589)))

(declare-fun b!963325 () Bool)

(declare-fun res!644775 () Bool)

(assert (=> b!963325 (=> (not res!644775) (not e!543142))))

(declare-datatypes ((List!19808 0))(
  ( (Nil!19805) (Cons!19804 (h!20966 (_ BitVec 64)) (t!28162 List!19808)) )
))
(declare-fun arrayNoDuplicates!0 (array!59206 (_ BitVec 32) List!19808) Bool)

(assert (=> b!963325 (= res!644775 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19805))))

(declare-fun b!963326 () Bool)

(declare-fun res!644776 () Bool)

(assert (=> b!963326 (=> (not res!644776) (not e!543142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963326 (= res!644776 (validKeyInArray!0 (select (arr!28472 _keys!1686) i!803)))))

(declare-fun res!644777 () Bool)

(assert (=> start!82636 (=> (not res!644777) (not e!543142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82636 (= res!644777 (validMask!0 mask!2110))))

(assert (=> start!82636 e!543142))

(assert (=> start!82636 true))

(declare-fun array_inv!22117 (array!59204) Bool)

(assert (=> start!82636 (and (array_inv!22117 _values!1400) e!543141)))

(declare-fun array_inv!22118 (array!59206) Bool)

(assert (=> start!82636 (array_inv!22118 _keys!1686)))

(assert (=> start!82636 tp!65481))

(assert (=> start!82636 tp_is_empty!21589))

(declare-fun b!963327 () Bool)

(assert (=> b!963327 (= e!543142 (not true))))

(assert (=> b!963327 (contains!5405 (getCurrentListMap!3520 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28472 _keys!1686) i!803))))

(declare-datatypes ((Unit!32104 0))(
  ( (Unit!32105) )
))
(declare-fun lt!430748 () Unit!32104)

(declare-fun lemmaInListMapFromThenInFromMinusOne!18 (array!59206 array!59204 (_ BitVec 32) (_ BitVec 32) V!33769 V!33769 (_ BitVec 32) (_ BitVec 32) Int) Unit!32104)

(assert (=> b!963327 (= lt!430748 (lemmaInListMapFromThenInFromMinusOne!18 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963328 () Bool)

(declare-fun res!644772 () Bool)

(assert (=> b!963328 (=> (not res!644772) (not e!543142))))

(assert (=> b!963328 (= res!644772 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28953 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28953 _keys!1686))))))

(declare-fun b!963329 () Bool)

(declare-fun res!644771 () Bool)

(assert (=> b!963329 (=> (not res!644771) (not e!543142))))

(assert (=> b!963329 (= res!644771 (and (= (size!28952 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28953 _keys!1686) (size!28952 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82636 res!644777) b!963329))

(assert (= (and b!963329 res!644771) b!963320))

(assert (= (and b!963320 res!644773) b!963325))

(assert (= (and b!963325 res!644775) b!963328))

(assert (= (and b!963328 res!644772) b!963326))

(assert (= (and b!963326 res!644776) b!963323))

(assert (= (and b!963323 res!644774) b!963319))

(assert (= (and b!963319 res!644770) b!963327))

(assert (= (and b!963321 condMapEmpty!34378) mapIsEmpty!34378))

(assert (= (and b!963321 (not condMapEmpty!34378)) mapNonEmpty!34378))

(get-info :version)

(assert (= (and mapNonEmpty!34378 ((_ is ValueCellFull!10313) mapValue!34378)) b!963324))

(assert (= (and b!963321 ((_ is ValueCellFull!10313) mapDefault!34378)) b!963322))

(assert (= start!82636 b!963321))

(declare-fun m!892195 () Bool)

(assert (=> b!963327 m!892195))

(declare-fun m!892197 () Bool)

(assert (=> b!963327 m!892197))

(assert (=> b!963327 m!892195))

(assert (=> b!963327 m!892197))

(declare-fun m!892199 () Bool)

(assert (=> b!963327 m!892199))

(declare-fun m!892201 () Bool)

(assert (=> b!963327 m!892201))

(declare-fun m!892203 () Bool)

(assert (=> mapNonEmpty!34378 m!892203))

(assert (=> b!963326 m!892197))

(assert (=> b!963326 m!892197))

(declare-fun m!892205 () Bool)

(assert (=> b!963326 m!892205))

(declare-fun m!892207 () Bool)

(assert (=> b!963325 m!892207))

(declare-fun m!892209 () Bool)

(assert (=> b!963323 m!892209))

(assert (=> b!963323 m!892197))

(assert (=> b!963323 m!892209))

(assert (=> b!963323 m!892197))

(declare-fun m!892211 () Bool)

(assert (=> b!963323 m!892211))

(declare-fun m!892213 () Bool)

(assert (=> start!82636 m!892213))

(declare-fun m!892215 () Bool)

(assert (=> start!82636 m!892215))

(declare-fun m!892217 () Bool)

(assert (=> start!82636 m!892217))

(declare-fun m!892219 () Bool)

(assert (=> b!963320 m!892219))

(check-sat (not b!963327) (not b!963326) (not b_next!18787) (not b!963323) (not b!963325) (not mapNonEmpty!34378) (not start!82636) tp_is_empty!21589 b_and!30249 (not b!963320))
(check-sat b_and!30249 (not b_next!18787))
