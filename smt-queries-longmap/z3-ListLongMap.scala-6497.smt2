; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82990 () Bool)

(assert start!82990)

(declare-fun b_free!18949 () Bool)

(declare-fun b_next!18949 () Bool)

(assert (=> start!82990 (= b_free!18949 (not b_next!18949))))

(declare-fun tp!65976 () Bool)

(declare-fun b_and!30447 () Bool)

(assert (=> start!82990 (= tp!65976 b_and!30447)))

(declare-fun b!967031 () Bool)

(declare-fun e!545211 () Bool)

(declare-fun e!545209 () Bool)

(declare-fun mapRes!34630 () Bool)

(assert (=> b!967031 (= e!545211 (and e!545209 mapRes!34630))))

(declare-fun condMapEmpty!34630 () Bool)

(declare-datatypes ((V!33993 0))(
  ( (V!33994 (val!10929 Int)) )
))
(declare-datatypes ((ValueCell!10397 0))(
  ( (ValueCellFull!10397 (v!13484 V!33993)) (EmptyCell!10397) )
))
(declare-datatypes ((array!59612 0))(
  ( (array!59613 (arr!28670 (Array (_ BitVec 32) ValueCell!10397)) (size!29150 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59612)

(declare-fun mapDefault!34630 () ValueCell!10397)

(assert (=> b!967031 (= condMapEmpty!34630 (= (arr!28670 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10397)) mapDefault!34630)))))

(declare-fun b!967032 () Bool)

(declare-fun res!647040 () Bool)

(declare-fun e!545212 () Bool)

(assert (=> b!967032 (=> (not res!647040) (not e!545212))))

(declare-datatypes ((array!59614 0))(
  ( (array!59615 (arr!28671 (Array (_ BitVec 32) (_ BitVec 64))) (size!29151 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59614)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967032 (= res!647040 (validKeyInArray!0 (select (arr!28671 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34630 () Bool)

(assert (=> mapIsEmpty!34630 mapRes!34630))

(declare-fun res!647043 () Bool)

(assert (=> start!82990 (=> (not res!647043) (not e!545212))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82990 (= res!647043 (validMask!0 mask!2110))))

(assert (=> start!82990 e!545212))

(assert (=> start!82990 true))

(declare-fun array_inv!22261 (array!59612) Bool)

(assert (=> start!82990 (and (array_inv!22261 _values!1400) e!545211)))

(declare-fun array_inv!22262 (array!59614) Bool)

(assert (=> start!82990 (array_inv!22262 _keys!1686)))

(assert (=> start!82990 tp!65976))

(declare-fun tp_is_empty!21757 () Bool)

(assert (=> start!82990 tp_is_empty!21757))

(declare-fun mapNonEmpty!34630 () Bool)

(declare-fun tp!65977 () Bool)

(declare-fun e!545210 () Bool)

(assert (=> mapNonEmpty!34630 (= mapRes!34630 (and tp!65977 e!545210))))

(declare-fun mapKey!34630 () (_ BitVec 32))

(declare-fun mapValue!34630 () ValueCell!10397)

(declare-fun mapRest!34630 () (Array (_ BitVec 32) ValueCell!10397))

(assert (=> mapNonEmpty!34630 (= (arr!28670 _values!1400) (store mapRest!34630 mapKey!34630 mapValue!34630))))

(declare-fun b!967033 () Bool)

(declare-fun res!647039 () Bool)

(assert (=> b!967033 (=> (not res!647039) (not e!545212))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!967033 (= res!647039 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29151 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29151 _keys!1686))))))

(declare-fun b!967034 () Bool)

(assert (=> b!967034 (= e!545210 tp_is_empty!21757)))

(declare-fun b!967035 () Bool)

(assert (=> b!967035 (= e!545212 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33993)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431660 () Bool)

(declare-fun zeroValue!1342 () V!33993)

(declare-datatypes ((tuple2!14038 0))(
  ( (tuple2!14039 (_1!7030 (_ BitVec 64)) (_2!7030 V!33993)) )
))
(declare-datatypes ((List!19888 0))(
  ( (Nil!19885) (Cons!19884 (h!21052 tuple2!14038) (t!28243 List!19888)) )
))
(declare-datatypes ((ListLongMap!12737 0))(
  ( (ListLongMap!12738 (toList!6384 List!19888)) )
))
(declare-fun contains!5496 (ListLongMap!12737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3617 (array!59614 array!59612 (_ BitVec 32) (_ BitVec 32) V!33993 V!33993 (_ BitVec 32) Int) ListLongMap!12737)

(assert (=> b!967035 (= lt!431660 (contains!5496 (getCurrentListMap!3617 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28671 _keys!1686) i!803)))))

(declare-fun b!967036 () Bool)

(declare-fun res!647038 () Bool)

(assert (=> b!967036 (=> (not res!647038) (not e!545212))))

(declare-datatypes ((List!19889 0))(
  ( (Nil!19886) (Cons!19885 (h!21053 (_ BitVec 64)) (t!28244 List!19889)) )
))
(declare-fun arrayNoDuplicates!0 (array!59614 (_ BitVec 32) List!19889) Bool)

(assert (=> b!967036 (= res!647038 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19886))))

(declare-fun b!967037 () Bool)

(assert (=> b!967037 (= e!545209 tp_is_empty!21757)))

(declare-fun b!967038 () Bool)

(declare-fun res!647041 () Bool)

(assert (=> b!967038 (=> (not res!647041) (not e!545212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59614 (_ BitVec 32)) Bool)

(assert (=> b!967038 (= res!647041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967039 () Bool)

(declare-fun res!647042 () Bool)

(assert (=> b!967039 (=> (not res!647042) (not e!545212))))

(assert (=> b!967039 (= res!647042 (and (= (size!29150 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29151 _keys!1686) (size!29150 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82990 res!647043) b!967039))

(assert (= (and b!967039 res!647042) b!967038))

(assert (= (and b!967038 res!647041) b!967036))

(assert (= (and b!967036 res!647038) b!967033))

(assert (= (and b!967033 res!647039) b!967032))

(assert (= (and b!967032 res!647040) b!967035))

(assert (= (and b!967031 condMapEmpty!34630) mapIsEmpty!34630))

(assert (= (and b!967031 (not condMapEmpty!34630)) mapNonEmpty!34630))

(get-info :version)

(assert (= (and mapNonEmpty!34630 ((_ is ValueCellFull!10397) mapValue!34630)) b!967034))

(assert (= (and b!967031 ((_ is ValueCellFull!10397) mapDefault!34630)) b!967037))

(assert (= start!82990 b!967031))

(declare-fun m!896293 () Bool)

(assert (=> b!967038 m!896293))

(declare-fun m!896295 () Bool)

(assert (=> b!967032 m!896295))

(assert (=> b!967032 m!896295))

(declare-fun m!896297 () Bool)

(assert (=> b!967032 m!896297))

(declare-fun m!896299 () Bool)

(assert (=> start!82990 m!896299))

(declare-fun m!896301 () Bool)

(assert (=> start!82990 m!896301))

(declare-fun m!896303 () Bool)

(assert (=> start!82990 m!896303))

(declare-fun m!896305 () Bool)

(assert (=> b!967036 m!896305))

(declare-fun m!896307 () Bool)

(assert (=> mapNonEmpty!34630 m!896307))

(declare-fun m!896309 () Bool)

(assert (=> b!967035 m!896309))

(assert (=> b!967035 m!896295))

(assert (=> b!967035 m!896309))

(assert (=> b!967035 m!896295))

(declare-fun m!896311 () Bool)

(assert (=> b!967035 m!896311))

(check-sat (not start!82990) (not b!967032) (not b_next!18949) b_and!30447 (not b!967038) (not b!967035) (not mapNonEmpty!34630) tp_is_empty!21757 (not b!967036))
(check-sat b_and!30447 (not b_next!18949))
