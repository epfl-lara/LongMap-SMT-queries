; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82842 () Bool)

(assert start!82842)

(declare-fun b_free!18969 () Bool)

(declare-fun b_next!18969 () Bool)

(assert (=> start!82842 (= b_free!18969 (not b_next!18969))))

(declare-fun tp!66036 () Bool)

(declare-fun b_and!30457 () Bool)

(assert (=> start!82842 (= tp!66036 b_and!30457)))

(declare-fun b!966398 () Bool)

(declare-fun res!646878 () Bool)

(declare-fun e!544780 () Bool)

(assert (=> b!966398 (=> (not res!646878) (not e!544780))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34019 0))(
  ( (V!34020 (val!10939 Int)) )
))
(declare-datatypes ((ValueCell!10407 0))(
  ( (ValueCellFull!10407 (v!13497 V!34019)) (EmptyCell!10407) )
))
(declare-datatypes ((array!59639 0))(
  ( (array!59640 (arr!28688 (Array (_ BitVec 32) ValueCell!10407)) (size!29167 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59639)

(declare-datatypes ((array!59641 0))(
  ( (array!59642 (arr!28689 (Array (_ BitVec 32) (_ BitVec 64))) (size!29168 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59641)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966398 (= res!646878 (and (= (size!29167 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29168 _keys!1686) (size!29167 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966399 () Bool)

(declare-fun e!544781 () Bool)

(declare-fun tp_is_empty!21777 () Bool)

(assert (=> b!966399 (= e!544781 tp_is_empty!21777)))

(declare-fun b!966400 () Bool)

(declare-fun res!646879 () Bool)

(assert (=> b!966400 (=> (not res!646879) (not e!544780))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966400 (= res!646879 (validKeyInArray!0 (select (arr!28689 _keys!1686) i!803)))))

(declare-fun res!646875 () Bool)

(assert (=> start!82842 (=> (not res!646875) (not e!544780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82842 (= res!646875 (validMask!0 mask!2110))))

(assert (=> start!82842 e!544780))

(assert (=> start!82842 true))

(declare-fun e!544779 () Bool)

(declare-fun array_inv!22221 (array!59639) Bool)

(assert (=> start!82842 (and (array_inv!22221 _values!1400) e!544779)))

(declare-fun array_inv!22222 (array!59641) Bool)

(assert (=> start!82842 (array_inv!22222 _keys!1686)))

(assert (=> start!82842 tp!66036))

(assert (=> start!82842 tp_is_empty!21777))

(declare-fun mapIsEmpty!34660 () Bool)

(declare-fun mapRes!34660 () Bool)

(assert (=> mapIsEmpty!34660 mapRes!34660))

(declare-fun b!966401 () Bool)

(declare-fun res!646877 () Bool)

(assert (=> b!966401 (=> (not res!646877) (not e!544780))))

(declare-datatypes ((List!19914 0))(
  ( (Nil!19911) (Cons!19910 (h!21072 (_ BitVec 64)) (t!28277 List!19914)) )
))
(declare-fun arrayNoDuplicates!0 (array!59641 (_ BitVec 32) List!19914) Bool)

(assert (=> b!966401 (= res!646877 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19911))))

(declare-fun b!966402 () Bool)

(assert (=> b!966402 (= e!544780 false)))

(declare-fun minValue!1342 () V!34019)

(declare-fun zeroValue!1342 () V!34019)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431329 () Bool)

(declare-datatypes ((tuple2!14070 0))(
  ( (tuple2!14071 (_1!7046 (_ BitVec 64)) (_2!7046 V!34019)) )
))
(declare-datatypes ((List!19915 0))(
  ( (Nil!19912) (Cons!19911 (h!21073 tuple2!14070) (t!28278 List!19915)) )
))
(declare-datatypes ((ListLongMap!12767 0))(
  ( (ListLongMap!12768 (toList!6399 List!19915)) )
))
(declare-fun contains!5500 (ListLongMap!12767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3632 (array!59641 array!59639 (_ BitVec 32) (_ BitVec 32) V!34019 V!34019 (_ BitVec 32) Int) ListLongMap!12767)

(assert (=> b!966402 (= lt!431329 (contains!5500 (getCurrentListMap!3632 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28689 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34660 () Bool)

(declare-fun tp!66035 () Bool)

(assert (=> mapNonEmpty!34660 (= mapRes!34660 (and tp!66035 e!544781))))

(declare-fun mapRest!34660 () (Array (_ BitVec 32) ValueCell!10407))

(declare-fun mapValue!34660 () ValueCell!10407)

(declare-fun mapKey!34660 () (_ BitVec 32))

(assert (=> mapNonEmpty!34660 (= (arr!28688 _values!1400) (store mapRest!34660 mapKey!34660 mapValue!34660))))

(declare-fun b!966403 () Bool)

(declare-fun res!646876 () Bool)

(assert (=> b!966403 (=> (not res!646876) (not e!544780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59641 (_ BitVec 32)) Bool)

(assert (=> b!966403 (= res!646876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966404 () Bool)

(declare-fun res!646874 () Bool)

(assert (=> b!966404 (=> (not res!646874) (not e!544780))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966404 (= res!646874 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29168 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29168 _keys!1686))))))

(declare-fun b!966405 () Bool)

(declare-fun e!544778 () Bool)

(assert (=> b!966405 (= e!544779 (and e!544778 mapRes!34660))))

(declare-fun condMapEmpty!34660 () Bool)

(declare-fun mapDefault!34660 () ValueCell!10407)

(assert (=> b!966405 (= condMapEmpty!34660 (= (arr!28688 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10407)) mapDefault!34660)))))

(declare-fun b!966406 () Bool)

(assert (=> b!966406 (= e!544778 tp_is_empty!21777)))

(assert (= (and start!82842 res!646875) b!966398))

(assert (= (and b!966398 res!646878) b!966403))

(assert (= (and b!966403 res!646876) b!966401))

(assert (= (and b!966401 res!646877) b!966404))

(assert (= (and b!966404 res!646874) b!966400))

(assert (= (and b!966400 res!646879) b!966402))

(assert (= (and b!966405 condMapEmpty!34660) mapIsEmpty!34660))

(assert (= (and b!966405 (not condMapEmpty!34660)) mapNonEmpty!34660))

(get-info :version)

(assert (= (and mapNonEmpty!34660 ((_ is ValueCellFull!10407) mapValue!34660)) b!966399))

(assert (= (and b!966405 ((_ is ValueCellFull!10407) mapDefault!34660)) b!966406))

(assert (= start!82842 b!966405))

(declare-fun m!895199 () Bool)

(assert (=> b!966402 m!895199))

(declare-fun m!895201 () Bool)

(assert (=> b!966402 m!895201))

(assert (=> b!966402 m!895199))

(assert (=> b!966402 m!895201))

(declare-fun m!895203 () Bool)

(assert (=> b!966402 m!895203))

(declare-fun m!895205 () Bool)

(assert (=> start!82842 m!895205))

(declare-fun m!895207 () Bool)

(assert (=> start!82842 m!895207))

(declare-fun m!895209 () Bool)

(assert (=> start!82842 m!895209))

(declare-fun m!895211 () Bool)

(assert (=> mapNonEmpty!34660 m!895211))

(declare-fun m!895213 () Bool)

(assert (=> b!966403 m!895213))

(assert (=> b!966400 m!895201))

(assert (=> b!966400 m!895201))

(declare-fun m!895215 () Bool)

(assert (=> b!966400 m!895215))

(declare-fun m!895217 () Bool)

(assert (=> b!966401 m!895217))

(check-sat b_and!30457 tp_is_empty!21777 (not b!966402) (not b!966403) (not mapNonEmpty!34660) (not b!966400) (not b_next!18969) (not b!966401) (not start!82842))
(check-sat b_and!30457 (not b_next!18969))
